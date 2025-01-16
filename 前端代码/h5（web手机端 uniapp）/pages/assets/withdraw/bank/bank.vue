<template>
	<view class="v-withdraw-container dark">
		<lw-navbar :border-bottom="false"></lw-navbar>
		<mask-modal v-model="showModal" :text='$t("assets.withdraw.modal[0]")' :confirmTxt='$t("assets.withdraw.default[2]")' @action="modalAction"></mask-modal>
		<mask-modal v-model="hasPwdModal" :text='$t("assets.withdrawCreate.modal[0]")' :confirmTxt='$t("assets.withdraw.default[2]")' @action="setPayPwdAction"></mask-modal>
		<u-toast ref="uToast" />
		
		<view class="v-withraw-content">
			
			<!-- 银行卡信息 -->
			<view class="card withdraw bg-theme">
				<view class="hotbg" @click="$u.route('/pages/bankbind/addbank')">
					<p class="ng-binding1">{{this.bkname}}</p>
					<span class="editc" >{{$t('bankbind.examine')}}</span>
					<p class="ng-binding2">{{this.bknumber}}</p>
				</view>
			</view>
			
			<!-- 提币数量 -->
			<view class="card amount bg-theme">
				<view class="amount-head">
					<view class="label">{{$t("assets.withdraw.labels[2]")}}</view>
					<view class="right">{{$t("assets.withdraw.labels[3]")}} {{parseFloat(info.change_balance)}} USDT</view>
				</view>
				<view class="amount-wrap">
					<input class="amount-input" type="digit" placeholder-class="amount-input-placeholder" :placeholder="amountPlaceholder" @input="replaceInput" v-model="form.amount" />
					<view class="input-right">
						<view class="item">USDT</view>
						<view class="item brand" @click="inputAll">{{$t("assets.withdraw.labels[4]")}}</view>
					</view>
				</view>
			</view>

			<!-- 资金密码 -->
			<view class="card password bg-theme" @click="showHasPwdModal">
				<view class="label">{{$t("assets.withdraw.labels[6]")}}</view>
				<view class="input-wrap">
					<input class="note-input" type="text" password placeholder-class="note-input-placeholder placeholder" :placeholder='$t("assets.withdraw.placeholder[2]")' v-model="form.password" />
				</view>
			</view>
			
			<view class="card button-wrap bg-theme">
				<view class="tongji">
					<view class="tj-item">
						<view class="left">{{$t("assets.withdraw.labels[7]")}}</view>
						<view class="right">{{expectedFee+' USDT'}}</view>
					</view>
					<view class="tj-item">
						<view class="left">{{$t("assets.withdraw.labels[8]")}}(USDT)</view>
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
			info: {},
			currentChain: 0,
			currency_name:'',
			currency_id:null,
			netlist:{},
			showModal: false,
			bknumber:'',
			bkname:'',
			form: {
				amount: "",
				password: "",
				address:"--",
				code:""
			},
			path: {
				address: "/pages/bankbind/addbank"
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
			let rep = (this.info.min_number*1).toString()+" USDT"
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
		
		replaceInput: function(t) {
			var e = this
			  , a = t.detail.value
			  , i = /^(([1-9]{1}\d*)|(0{1}))(\.\d{0,4})?$/;
			i.test(a) || setTimeout((function() {
				e.form.amount = e.form.amount.replace(/^(\-)*(\d+)\.(\d\d\d\d).*$/, "$1$2.$3")
			}
			), 100)
		},
		//检查表单
		validate: function() {
			return this.$u.test.isEmpty(this.form.amount) ? (this.$u.toast(this.$t("assets.withdraw.toasts[1]")),false) : true
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
		//获取银行卡信息
		fetchChainDetail: async function() {
			this.loading = true
			
			this.$u.api.cashInfo({'lang':this.$i18n.locale}).then(res => {
				this.loading = false
				
				if(res.bank_account){
					uni.hideToast()
					this.bknumber = res.bank_account.substr(0,4) + '******' + res.bank_account.substr(res.bank_account.length - 4)
					this.bkname = res.bank_name; //银行名称
				}else{
					this.showModal = true
				}
			})
			
		},
		//获取币信息，最少提币数量信息等
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
		
		//银行卡是否绑定提示
		modalAction:function(ac){
			if(ac=='confirm'){
				this.$u.route({url:this.path.address})
			}else{
				this.showModal = false
			}
		}
	}
}
</script>

<style lang="scss" scoped>
.hotbg{
	background: linear-gradient(to right, #1db292 , #009eb7);
	height: 9rem;
	width: 94%;
	border-radius: 1rem;
	margin: 1rem 2% 1rem 2%;
	position: relative;
}
.hotbg .ng-binding1{
	// height: 10rem;
    font-size: 1.5rem;
    // line-height: 10rem;
    text-align: left;
    position: absolute;
    top: 1rem;
    // left: 7rem;
	left: 0.5rem;
    color: #FFFFFF;
    z-index: 1000;
    margin: 0;
	width: 380px;
}
.hotbg .ng-binding2{
	// height: 11rem;
	font-size: 2rem;
	// line-height: 10rem;
	text-align: left;
	position: absolute;
	bottom: 1rem;
	right: 1rem;
	color: #FFFFFF;
	z-index: 1000;
	font-weight: 700;
	margin: 0;
}
    
.hotbg .editc{
	float: right;
	color: #FFBC0C;
	font-weight: 600;
	margin-right: 2rem;
	margin-top: 1rem;
}
.hotbg .iconfont{
	position: absolute;
	display: block;
	width: 4.5rem;
	height: 4.5rem;
	background: rgba(255,255,255,0.7);
	font-size: 3rem;
	top: 2rem;
	left: 1rem;
	line-height: 4.5rem;
	text-align: center;
	border-radius: 50%;
	z-index: 1000;
	font-style: normal;
}
.hotbg .iconfont .red{color: red;}
	
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
