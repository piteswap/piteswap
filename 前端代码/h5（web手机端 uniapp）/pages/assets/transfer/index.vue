<template>
	<view class="v-container-wrap dark">
		<lw-navbar :border-bottom="false" :title="$t('assets.transfer.zjhz')" class="bg-theme">
			<view slot="right">
				<ex-icon class="history-icon" name="history" @on-click="$u.route(path.record)"></ex-icon>
			</view>
		</lw-navbar>
		
		<view class="transfer-card-wrap">
			<transfer-card ref="transferCard" 
			:fromText="fromList[fromDefault] ? fromList[fromDefault].name : '--'"
			:toText="toList[toDefault] ? toList[toDefault].name : '--'"
			:currencyCode="accountDetail.currency_name"
			:balance="accountDetail.balance"
			@on-transfer-change="switchTop"
			@on-select-from="showSelector('from')"
			@on-select-to="showSelector('to')"
			@on-currency-select="currencyShow = true"
			@on-all-click="changeAll"
			@on-input-change="onInputChange"
			></transfer-card>
		</view>
		
		<view class="confirm-button-wrap">
			<ex-button-wrap className="circle large darkStyle" :text="$t('assets.transfer.qdhz')" theme="primary" :disabled="isEmpty || loading" @click="submit">{{$t('assets.transfer.qdhz')}}</ex-button-wrap>
		</view>
		
		<!--从-->
		<u-picker mode="selector" :confirm-text="$t('common.md_confirm')" :cancel-text="$t('common.md_cancel')" cancel-color="#babccb" :default-selector="[fromDefault]" range-key="name" :range="fromList" 
		@confirm="confirmFrom" v-model="fromShow"></u-picker>
		<!--到-->
		<u-picker mode="selector" :confirm-text="$t('common.md_confirm')" :cancel-text="$t('common.md_cancel')" cancel-color="#babccb" :default-selector="[toDefault]" range-key="name" :range="toList" 
		@confirm="confirmTo" v-model="toShow"></u-picker>
		<!--币种-->
		<u-picker mode="selector" :confirm-text="$t('common.md_confirm')" :cancel-text="$t('common.md_cancel')" cancel-color="#babccb" :defaultIndex="[defaultCurrencyIndex]" range-key="currency_name" :range="currencyList" 
		@confirm="confrimCurrencySelect" v-model="currencyShow"></u-picker>
		
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			show: false,
			fromShow: false,
			toShow: false,
			background: {
				background: "var(--page-part-color)"
			},
			value: "",
			loading: false,
			fromDefault: 0,
			toDefault: 0,
			accountTypeId: 0,
			accountType:'',
			deposit_id: 0,
			defaultCurrencyIndex: 0,
			currencyShow: false,
			selector: [
					{name:this.$t('assets.index.bbac'),account_code:'change',key_code:'is_match', type:2,accounts:[]}	//币币(闪兑)
					,{name:this.$t('assets.index.qqac'),account_code:'micro',key_code:'is_micro', type:4,accounts:[]}	//期权(秒合约)
					,{name:this.$t('assets.index.hyac'),account_code:'lever',key_code:'is_lever', type:3,accounts:[]}	//合约(杠杆)
				],
			accountDetail: {},
			path: {
				choose: "/pages/assets/transfer/choose",
				record: "/pages/assets/transfer/record"
			}
		}
	},
	computed: {
		targetValue: function() {
			return "string" === typeof this.value ? parseFloat(this.value) : this.value
		},
		isEmpty: function() {
			return this.$u.test.isEmpty(this.value)
		},
		fromList: function() {
			var l = this;
			let obj = this.selector.filter((function(e) {
				return e.account_code != l.toDefaultTarget.account_code	//排除掉两边相等的
			}
			)) || []
			//console.log("fromList",obj,this.fromDefault,l.toDefaultTarget)
			return obj
		},
		toList: function() {
			var l = this;
			let obj = this.selector.filter((function(e) {
				return e.account_code != l.fromDefaultTarget.account_code
			}
			)) || []
			//console.log("toList",obj,l.fromDefaultTarget)
			return obj
		},
		fromDefaultTarget: function() {
			var l = this;
			return this.selector.find((function(e) {
				return e.type == l.accountTypeId
			}
			)) || {}
		},
		toDefaultTarget: function() {
			var l = this.toList[this.toDefault];
			return l
		},
		currencyList: function() {
			let obj = this.fromDefaultTarget.accounts || []
			
			if(obj.length>1){	//新增 如果转出帐户类型数>1 说明有多个帐号 则要判断接收帐号是否有同样的类型
				let objTo = this.toDefaultTarget.accounts || []
				let newArr = objTo.map(item=>{
					if(item){
						return item.currency
					}
				})
				let tmpIdx = []
				obj = obj.filter((item,idx)=>{
					if(item && newArr.indexOf(item.currency) > -1){
						//console.log('item',item,idx)
						tmpIdx.push(idx)
						return true	//把两边差集部分过滤掉
					}
				})
				
				//重置from的余额
				if(tmpIdx.length>0 && tmpIdx.indexOf(this.defaultCurrencyIndex)<0){	//如果可选数组项>0 且 当前所选id不包含在待选列表则重置index
					//console.log('重置',tmpIdx,this.defaultCurrencyIndex)
					this.setCurrencyIndex(tmpIdx[0])
				}
					
			}
			// console.log(obj,'obj')
			return obj
		},
		defualtCurrency: function() {
			return this.currencyList[this.defaultCurrencyIndex] || {}
		}
	},
	onLoad: function(options) {
		if(!this.checkLogin()){
			return
		}
		var e = this;
		if(!options.type){
			this.goBack()
			return
		}
		this.accountTypeId = Number(options.type)
		this.accountType = options.form_type
		this.init()
	},
	watch:{
		accountDetail:function(newVal){
			this.$refs.transferCard.form.number = null	//归零
		}
	},
	methods: {
		setCurrencyIndex:function(index){	//新增 用于更新默认币种索引 
			this.defaultCurrencyIndex = index
			this.fetchDetail()
		},
		init:function(){
			
			this.fromDefault = this.fromList.findIndex(item=>{
				return item.type == this.accountTypeId
			})
			
			Promise.all([this.fetchAccountList()]).then(r=> {
				this.checkCurrencyIndex()
				this.fetchDetail()
			})
		},
		checkCurrencyIndex:function(){
			const currList = this.currencyList
			
			let index = -1
			for(let i=0;i< currList.length;i++){
				if(currList[i].currency_name==='USDT'){
					index = i
					break
				}
			}
			index && (this.defaultCurrencyIndex = index)
		},
		submit:async function() {
			if (this.targetValue > Number(this.accountDetail.balance))
				this.$u.toast(this.$t("assets.transfer.tips"));
			else {
				let params = {
						number: this.targetValue,
						//currency_id: this.defualtCurrency.currency,
						currency_id: this.accountDetail.currency,
						from_field: this.fromDefaultTarget.account_code,
						to_field: this.toDefaultTarget.account_code
					};
					
				this.loading = true
				this.$u.api.walletChange(params).then(msg=>{
					
					this.init()
					
					this.$u.toast(msg)
					this.$refs.transferCard.form.number = null
					uni.$emit("onChange")
					setTimeout(()=> {
						this.value = null
						this.loading = false
					}, 1000)
					
				}).catch(err=>{
					this.loading = false
				})
			}
		},
		changeAll: function() {
			var l = parseFloat(this.accountDetail.balance);
			this.value = l //l.toFixed(4)
			this.$refs.transferCard.form.number = this.value
		},
		
		fetchDetail: async function() {
			let obj = this.fromList[this.fromDefault]
			let account_code = obj.account_code
			// console.log(this.defaultCurrencyIndex,obj.accounts,'obj.accounts')
			obj.accounts = obj.accounts.filter(e => e) // 里面有空的
			if(obj.accounts[this.defaultCurrencyIndex]){
				this.accountDetail = {
					balance:obj.accounts[this.defaultCurrencyIndex][account_code+'_balance']*1,
					currency_name:obj.accounts[this.defaultCurrencyIndex].currency_name,
					currency:obj.accounts[this.defaultCurrencyIndex].currency
				}
			}
		},
		switchTop: function() {	//交换
			var l = this , e = this.toList[this.toDefault].type || 0;
			this.accountTypeId = e;
			var a = this.fromDefault;
			this.fromDefault = this.toDefault,
			this.toDefault = a,
			this.loading = true;
			var u = this.currencyList.findIndex((function(l) {
				return "USDT" === l.currency_name
			}
			));
			u >= 0 && (this.defaultCurrencyIndex = u)
			
			Promise.all([this.fetchDetail()]).then((function(e) {
				l.loading = !1
			}
			))
		},
		onInputChange: function(l) {
			this.value = l
		},
		chooseCoin: function() {
			this.redirectTo(this.path.choose, {
				account_name: this.account_name,
				account_type_id: this.accountTypeId
			})
		},
		fetchAccountList: async function() {
			let res = await this.$u.api.currencyList().catch(err=>{})
			//console.log('fff',this.selector)
			this.selector.forEach(item=>{
				let tmp = []
				res.forEach(sub=>{
					if(sub[item.key_code]==1){
						tmp.push(sub.wallet)
					}
				})
				item.accounts = tmp
			})
		},
		
		confirmFrom: function(obj) {
			let l = obj[0]
			var e = this;
			this.fromDefault = l
			this.accountTypeId = this.fromList[l].type,
			this.defaultCurrencyIndex = 0,
			this.loading = !0
			Promise.all([this.fetchDetail()]).then((function(l) {
				e.loading = !1
			}
			)).catch((function(l) {
				e.loading = !1
			}
			))
		},
		
		confirmTo: function(obj) {
			let l = obj[0]
			var e = this.fromList[this.toDefault];
			for (var a in this.toDefault = l,this.fromList) {
				var u = this.fromList[a];
				if (e.account_code == u.account_code) {
					this.fromDefault = Number(a);
					break
				}
			}
		},
		
		confrimCurrencySelect: function(l) {
			console.log(l)
			var e = this , index = l[0];
			this.defaultCurrencyIndex = index
			this.loading = true
			Promise.all([this.fetchDetail()]).then((function(l) {
				e.loading = false
			}
			)).catch((function(l) {
				e.loading = false
			}
			))
		},
		
		showSelector: function(type) {
			if(type=='from'){
				this.fromShow = true
				this.toShow = false
			}else{
				this.fromShow = false
				this.toShow = true
			}
		}
	}
}
</script>

<style lang="scss" scoped>
.v-container-wrap {
	position: relative
}

.v-container-wrap.dark {
	background-color: unset;
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%
}

.v-container-wrap .nav-bar-wrap {
	width: 100%;
	padding: 20rpx 30rpx;
	position: relative;
	display: flex;
	justify-content: space-between
}

.v-container-wrap .nav-bar-wrap .v-container-wrap {
	background: none
}

.v-container-wrap .v-content-wrap {
	position: relative;
	padding: 0 30rpx
}

.v-container-wrap .v-content-wrap .v-transfer-title {
	padding: 20rpx 0;
	font-size: 40rpx
}

.v-container-wrap .v-content-wrap .account-transfer-wrap {
	margin-top: 30rpx;
	border-radius: 16rpx;
	color: #606266;
	padding: 30rpx;
	position: relative
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .account {
	display: flex;
	margin-top: 20rpx
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .label {
	font-size: 24rpx;
	font-weight: lighter;
	color: #6e728d
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .transfer-button {
	position: absolute;
	right: 10%;
	top: 50%;
	transform: translateY(-50%);
	z-index: 100
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .from {
	padding-bottom: 30rpx;
	padding-left: 40rpx;
	position: relative
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .from .dot-line {
	position: absolute;
	width: 1rpx;
	height: 50%;
	bottom: 0;
	left: 0
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .from .dot-line::before {
	content: " ";
	position: absolute;
	top: 0;
	left: 0;
	transform: translate(-50%);
	width: 16rpx;
	height: 16rpx;
	border-radius: 50%;
	background-color: #FFC107
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .to {
	padding-top: 20rpx;
	padding-left: 40rpx;
	position: relative
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .to::after {
	content: " ";
	width: 80%;
	position: absolute;
	left: 0;
	top: 0;
	height: 1rpx
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .to .dot-line {
	position: absolute;
	width: 1rpx;
	height: 50%;
	top: 0;
	left: 0
}

.v-container-wrap .v-content-wrap .account-transfer-wrap .to .dot-line::before {
	content: " ";
	position: absolute;
	bottom: 0;
	left: 0;
	transform: translate(-50%);
	width: 16rpx;
	height: 16rpx;
	border-radius: 50%;
	background-color: #2b76f3
}

.quantity-wrap {
	color: #6e728d;
	background: #fff;
	border-radius: 16rpx;
	box-shadow: 1rpx 1rpx 10rpx #e6e6e6;
	margin-top: 30rpx;
	padding: 20rpx 30rpx
}

.quantity-wrap .label {
	font-size: 24rpx;
	margin-bottom: 20rpx
}

.quantity-wrap .input-wrap {
	display: flex;
	justify-content: space-between
}

.quantity-wrap .input-wrap .input-item {
	font-size: 60rpx;
	font-weight: 700;
	color: #FFC107
}

.quantity-wrap .input-wrap .input-item .input-item-placeholder {
	color: #c3c3cd
}

.quantity-wrap .input-wrap .input-label {
	display: flex;
	align-items: center;
	font-size: 30rpx;
	padding-right: 20rpx;
	justify-content: space-between
}

.quantity-wrap .input-wrap .input-label .item {
	flex: 0 0 auto;
	padding: 0 14rpx;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center
}

.quantity-wrap .input-wrap .input-label .item.brand {
	color: #FFC107;
	position: relative
}

.quantity-wrap .input-wrap .input-label .item.brand::after {
	content: " ";
	height: 40%;
	width: 1rpx;
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	background-color: var(--border-color)
}

.confirm-button-wrap {
	position: fixed;
	padding: 0 30rpx;
	bottom: 40rpx;
	left: 0;
	right: 0
}

.available {
	color: #c3c3cd;
	margin-top: 20rpx;
	font-size: 24rpx;
	padding: 0 20rpx
}

.coin-choose-wrap {
	display: flex;
	color: #6e728d;
	background: #fff;
	border-radius: 16rpx;
	box-shadow: 1rpx 1rpx 10rpx #e6e6e6;
	margin-top: 30rpx;
	padding: 26rpx 30rpx;
	justify-content: space-between;
	position: relative;
	align-items: center
}

.coin-choose-wrap .value {
	display: flex;
	align-items: center
}

.coin-choose-wrap .value .icon-wrap {
	display: flex;
	justify-content: center;
	align-items: center
}

.dark .top-bg {
	background-color: #0b0b0b
}

.dark .account-transfer-wrap,
.dark .coin-choose-wrap,
.dark .quantity-wrap {
	background-color: #141519;
	box-shadow: none
}

.dark .v-content-wrap {
	color: #fff
}

.dark .account {
	color: #fff
}

.dark .from .dot-line,
.dark .to .dot-line {
	background: #282828
}

.dark .to::after {
	background: #282828
}

.dark .v-container-wrap .ex-icon.exchange {
	box-shadow: none
}

.light .top-bg {
	background: url('@/static/images/common/ic_asset_top_bg.png') no-repeat;
	background-size: 100% 100%
}

.light .account-transfer-wrap {
	background: #fff;
	box-shadow: 1rpx 1rpx 10rpx #e6e6e6
}

.light .account-transfer-wrap .account {
	color: var(--text-color)
}

.light .v-content-wrap {
	color: #000
}

.light .from .dot-line,
.light .to .dot-line {
	background: #ebebeb
}

.light .to::after {
	background: #ebebeb
}
</style>
