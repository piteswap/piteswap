<template>
	<view class="v-withdraw-container dark">
		<lw-navbar :border-bottom="false"></lw-navbar>
		<mask-modal v-model="showModal" :text='$t("assets.withdraw.modal[0]")' :confirmTxt='$t("assets.withdraw.default[2]")' @action="modalAction"></mask-modal>
		<mask-modal v-model="hasPwdModal" :text='$t("assets.withdrawCreate.modal[0]")' :confirmTxt='$t("assets.withdraw.default[2]")' @action="setPayPwdAction"></mask-modal>
		<!--<ex-scan ref="scanCode" @onScanResult="getScanResult"></ex-scan>-->
		<u-toast ref="uToast" />
		
		<view class="v-withraw-content">
			<view class="card chain bg-theme">
				<view class="label">{{$t("assets.withdraw.labels[0]")}}</view>
				<view class="wrap" v-if="chainList.length > 0">
					<view class="check-item" :class="{'active':currentChain == index}" v-for="(name,index) in chainList" :key="index" @click="onChainClick(name,index)">
						{{name}}
					</view>
				</view>
			</view>
			
			<view class="card withdraw bg-theme">
				<view class="label">{{$t("assets.withdraw.labels[1]")}}</view>
				<input class="withdraw-input" type="text" placeholder-class="withdraw-input-placeholder" :placeholder='$t("assets.withdraw.placeholder[0]")' @click="showAddressList" disabled v-model="form.address" />
				<view class="icon-wrap" @click.stop="scanCode">
					<ex-icon name="scan"></ex-icon>
				</view>
			</view>
			<u-select v-model="addressShow" :list="selectAddressList" @confirm="addressResult" @cancel="addressCancel" :confirm-text="$t('common.md_confirm')" :cancel-text="$t('common.md_cancel')"
			value-name="address" label-name="address"></u-select>
			
			<view class="card amount bg-theme">
				<view class="amount-head">
					<view class="label">{{$t("assets.withdraw.labels[2]")}}</view>
					<view class="right">{{$t("assets.withdraw.labels[3]")}} {{parseFloat(info.change_balance)}} {{currency_name}}</view>
				</view>
				<view class="amount-wrap">
					<input class="amount-input" type="digit" placeholder-class="amount-input-placeholder" :placeholder="amountPlaceholder" @input="replaceInput" v-model="form.amount" />
					<view class="input-right">
						<view class="item">{{currency_name}}</view>
						<view class="item brand" @click="inputAll">{{$t("assets.withdraw.labels[4]")}}</view>
					</view>
				</view>
			</view>
			
			
			<!-- 备注 -->
			<!-- <view class="card note bg-theme">
				<view class="label">{{$t("assets.withdraw.labels[5]")}}</view>
				<view class="input-wrap">
					<input class="note-input" type="text" placeholder-class="note-input-placeholder placeholder" :placeholder='$t("assets.withdraw.placeholder[1]")' v-model="form.note" />
				</view>
			</view> -->
			
			<view class="card password bg-theme" @click="showHasPwdModal">
				<view class="label">{{$t("assets.withdraw.labels[6]")}}</view>
				<view class="input-wrap">
					<input class="note-input" type="text" password placeholder-class="note-input-placeholder placeholder" :placeholder='$t("assets.withdraw.placeholder[2]")' v-model="form.password" />
				</view>
			</view>
			
			<!-- <view class="card amount bg-theme">
				<u-input type="number" v-model="form.code" :placeholder="$t('reg.yanzhengma')" :custom-style="customStyle" />
				<view class="send" @click="getCode">
					<u-verification-code :seconds="seconds" ref="uCode" change-text="Xs" :start-text="$t('reg.fasong')" :end-text="$t('reg.fasong')" :keep-running="true" @change="codeChange"></u-verification-code>
					<text>{{sendTxt || $t('reg.fasong')}}</text>
				</view>
			</view> -->
			
			
			<view class="card button-wrap bg-theme">
				<view class="tongji">
					<view class="tj-item">
						<view class="left">{{$t("assets.withdraw.labels[7]")}}</view>
						<view class="right">{{expectedFee+' '+currency_name}}</view>
					</view>
					<view class="tj-item">
						<view class="left">{{$t("assets.withdraw.labels[8]")}}({{currency_name}})</view>
						<view class="right">{{receiveAmount}}</view>
					</view>
				</view>
				<view class="button-wrapper">
					<ex-button-wrap :text='$t("assets.withdraw.default[0]")' theme="primary" :disabled="loading" @click="$u.throttle(submit,1500)"></ex-button-wrap>
				</view>
				<view class="tips-wrap bg-theme">
					<view class="title">{{$t("assets.withdraw.default[1]")}}</view>
					<u-parse :html="noticeContent"></u-parse>
				</view>
			</view>
			
		</view>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			hasPwd:false,
			hasPwdModal:false,
			addressShow:false,
			info: {},
			currentChain: 0,
			currency_name:'',
			currency_id:null,
			netlist:{},
			showModal: false,
			form: {
				address: "",
				amount: "",
				note: "",
				password: "",
				code: ""
			},
			path: {
				address: "/pages/user/address/address"
			},
			amountPlaceholder: "0.00",
			addressList:[],
			loading: false,
			customStyle:{"color":"#e2e8e4","fontSize":"24rpx"},	//输入框自定义样式
			seconds:60,	//倒计时60秒
			sendTxt:'',
		}
	},
	computed: {
		selectAddressList:function(){
			let nettype = this.chainList[this.currentChain]
			let obj = this.addressList.filter((item)=>{
				return item.nettype == nettype
			})
			return obj
		},
		chainList:function(){
			let name = this.currency_name.toUpperCase()
			return this.netlist[name] ? this.netlist[name] : []
		},
		noticeContent: function(){
			let rep = (this.info.min_number*1).toString()+this.info.name
			return this.$t('assets.withdraw.noticecontent').replace('{min_coin}',rep)
		},
		expectedFee: function() {
			var t = (this.info && this.info.rate) || 0;
			return (Number(t) * Number(this.form.amount) / 100).toFixed(6)
		},
		receiveAmount: function() {
			this.info && this.info.rate;
			return (Number(this.form.amount) - this.expectedFee).toFixed(6) || ""
		}
	},
	onShow: function(){
		this.fetchChainDetail()
	},
	onLoad: function(t) {
		if(!this.checkLogin()){
			//this.goBack()
			return
		}
		this.netlist = this.webConf.netType
		this.currency_name = t.currency_code
		this.currency_id = t.currency_id
		this.fetchDetail()
		this.checkHasPwd()
	},
	methods: {
		getCode:async function() {	//发验证码
			if(this.$refs.uCode.canGetCode) {
				
				let res = null
				uni.showLoading()
				res = await this.$u.api.getCode({}).catch(err=>{
					uni.hideToast()
					this.$u.toast(err.message)
				})
			
				uni.hideLoading()
				
				if(res){
					this.$u.toast(res)
					// 通知验证码组件内部开始倒计时
					this.$refs.uCode.start()
				}
				
			} else {
				//this.$u.toast('倒计时结束后再发送');
			}
		},
		codeChange:function(text){
			this.sendTxt = text
			//console.log('codeChange' ,text)
		},
		showHasPwdModal:function(){
			this.hasPwdModal = this.hasPwd===false && this.showModal===false ? true : false
		},
		setPayPwdAction:function(ac){
			if(ac=='confirm'){
				this.$u.route('/pages/settings/security/changePayPassword')
			}
		},
		checkHasPwd:async function(){	//检查是否有设置提现密码
			let res = await this.$u.api.hasPwd().catch(err=>{})
			this.hasPwd = res==2 ? false : true
			this.showHasPwdModal()
		},
		showAddressList:function(){
			//切换地址
			if(this.selectAddressList.length>0){
				//console.log(this.selectAddressList)
				this.addressShow = true
			}else{
				this.showModal = true
			}
		},
		addressCancel:function(){
			this.addressShow = false
		},
		addressResult:function(obj){
			this.getScanResult(obj[0].value)
		},
		getScanResult: function(t) {
			this.form.address = t
		},
		scanCode: function() {
			// #ifdef H5
			this.$u.toast(this.$t("assets.withdraw.tips[0]"))
			// #endif
			// #ifndef H5
			uni.scanCode({
				scanType:['qrCode'],	//只扫二维码
			    success: (res)=> {
			        //console.log('条码内容：' + res.result);
					this.getScanResult(res.result)
			    }
			})
			// #endif
			//this.$refs.scanCode.startScan()
		},
		replaceInput: function(t) {
			var e = this
			  , a = t.detail.value
			  , i = /^(([1-9]{1}\d*)|(0{1}))(\.\d{0,4})?$/;
			i.test(a) || setTimeout((function() {
				e.form.amount = e.form.amount.replace(/^(\-)*(\d+)\.(\d\d\d\d).*$/, "$1$2.$3")
			}
			), 100)
		},
		goSetAddress: function() {
			
			var c = {
				coin: this.currency_name,
				currency_id: this.currency_id,
				code: this.currency_name
			}
			this.$u.route({url:this.path.address,params:c})
		},
		validate: function() {
			return this.$u.test.isEmpty(this.form.address) ? (this.$u.toast(this.$t("assets.withdraw.toasts[0]")),
			false) : this.$u.test.isEmpty(this.form.amount) ? (this.$u.toast(this.$t("assets.withdraw.toasts[1]")),
			false) : true
		},
		submit: function() {
			var t = this;
			if (this.validate()) {
				let params = {
					currency: this.currency_id,
					number: this.form.amount,
					rate: this.info.rate,
					address: this.form.address,
					pay_password:this.form.password,
					code: this.form.code
				}
				this.loading = true
				this.$u.api.walletOut(params).then(res=>{
					this.loading = false
					this.$refs.uToast.show({title: res,type: 'success'})
					setTimeout(()=>{
						this.goBack(2)
					},1500)
				}).catch(err=>{
					this.loading = false
				})
			}
		},
		onChainClick: function(name,index) {
			this.currentChain = index
			this.fetchDetail()
		},
		inputAll: function() {
			this.form.amount = parseFloat(this.info.change_balance)
		},
		fetchChainDetail: async function() {
			
			let params = {
				currency:this.currency_id
			}
			this.loading = true
			let list = await this.$u.api.walletGetAddress(params).catch(err=>{
				this.loading = false
				uni.hideToast()
				//console.log(err)
			})
			this.loading = false
			if(list && list.length>0){
				this.addressList = list
				let address = ''
				for(let i in list){
					if(list[i].nettype == this.chainList[this.currentChain]){
						address = list[i].address
					}
				}
				this.form.address = address
			}else{
				this.showModal = true
			}
			
		},
		fetchDetail: async function() {
			
			let params = {
				currency:this.currency_id,
				currencytxt:this.currency_name
			}
			this.loading = true
			let info = await this.$u.api.walletGetInfo(params).catch(err=>{
				this.loading = false
			})
			this.info = info
			await this.fetchChainDetail()
			this.loading = false
		},
		getCurrencyMinimal: function() {
			var t = this.currency_name.toLowerCase();
			switch (t) {
			case "btc":
				return .005;
			case "eth":
				return .1;
			case "usdt":
				return 100;
			default:
				return 0
			}
		},
		modalAction:function(ac){
			if(ac=='confirm'){
				this.goSetAddress()
			}else{
				this.showModal = false
			}
		}
	}
}
</script>

<style lang="scss" scoped>
.brand {
	color: #FFC107;
	margin-left: 30rpx
}

.v-withdraw-container{
	.v-withraw-content{
		.card {
			background-color: #fff;
			margin-bottom: 20rpx;
			padding: 20rpx 30rpx;
			
			&.chain {
				display: flex;
				align-items: center;
				justify-content: space-between;
				.wrap {
					display: flex;
					justify-content: flex-end;
					.check-item {
						border-radius: 8rpx;
						padding: 10rpx 30rpx;
						&.active {
							border: 1rpx solid #FFC107;
							color: #FFC107
						}
					}
				}
			}
			
			&.withdraw {
				display: flex;
				align-items: center;
				justify-content: space-between;
				.label {
					flex: 0 0 auto;
					padding-right: 20rpx
				}
				.withdraw-input {
					width: 100%;
					font-size: 24rpx;
					.withdraw-input-placeholder {
						color: #c3c3cb
					}
				}
				.icon-wrap {
					margin-left: 20rpx;
					display: flex;
					justify-content: space-between
				}
			}
			
			&.amount{
				.amount-head {
					display: flex;
					justify-content: space-between;
					.right {
						font-size: 24rpx;
						color: #c0c4cc
					}
				}
				.amount-wrap {
					display: flex;
					align-items: center;
					.amount-input {
						width: 100%;
						font-size: 60rpx;
						font-weight: 700;
						color: #FFC107;
						.amount-input-placeholder {
							color: #c3c3cb
						}
					}
					.input-right {
						display: flex;
						font-size: 30rpx;
						.item {
							flex: 0 0 auto;
							padding: 10rpx 20rpx;
							position: relative;
							&.brand {
								position: relative;
								margin-left: 0;
								&::after {
									content: " ";
									position: absolute;
									left: 0;
									height: 50%;
									width: 1rpx;
									background-color: var(--border-color);
									top: 50%;
									transform: translateY(-50%)
								}
							}
						}
					}
				}
				
			}
			&.note {
				display: flex;
				justify-content: space-between;
				font-size: 26rpx;
				.label {
					flex: 0 0 auto;
					margin-right: 30rpx
				}
				.input-wrap {
					width: 100%
				}
			}
			&.password {
				display: flex;
				justify-content: space-between;
				align-items: center;
				font-size: 26rpx;
				.label {
					flex: 0 0 auto;
					margin-right: 30rpx
				}
				.input-wrap {
					width: 100%
				}
			}
			&.button-wrap{
				.tongji{
					.tj-item {
						display: flex;
						justify-content: space-between;
						.left {
							color: #6f7283;
							font-size: 24rpx
						}
					}
				}
				.button-wrapper {
					margin-top: 50rpx
				}
				.tips-wrap {
					margin-top: 20rpx;
					padding: 10rpx;
					font-weight: lighter;
					background: #f7f8fa;
					color: #707384;
					font-size: 24rpx;
					line-height: 44rpx
				}
			}
		}
	}
}

.placeholder {
	font-size: 24rpx;
	color: #c3c3cb
}
</style>
