<template>
	<view class="v-container-wrap dark">
		<lw-navbar :border-bottom="false" :title='$t("assets.withdrawCreate.default[0]", {coin:coin})'></lw-navbar>
		<view class="v-content-wrap">
			<view class="v-content-title">
				<view class="left">{{$t("assets.withdrawCreate.labels[0]")}}</view>
				<view class="right" @click="addressShow = true">
					<view class="icon-image"></view>{{selectAddressList[netIndex].label}}
				</view>
			</view>
			<view class="form-content-wrap">
				<u-form ref="uForm" :model="form" label-position="top" :label-style="formLabelStyle">
					<u-form-item :label='$t("assets.withdrawCreate.labels[1]")' prop="address" :border-bottom="false">
						<u-input class="input-item" :custom-style="formLabelStyle" :placeholder='$t("assets.withdrawCreate.placeholder[0]")' v-model="form.address"></u-input>
						<view class="func" @click="scanCode"></view>
					</u-form-item>
					
					<!-- <u-form-item :label='$t("reg.yanzhengma")' prop="code" :border-bottom="false">
						<u-input type="number"  v-model="form.code" :placeholder="$t('reg.qsryzm')" :custom-style="customStyle" />
						<u-verification-code :seconds="seconds" ref="uCode" change-text="Xs" :start-text="$t('reg.fasong')" :end-text="$t('reg.fasong')" :keep-running="true" @change="codeChange"></u-verification-code>
						<text @click="getCode" style="color:#FFFFFF;">{{sendTxt || $t('reg.fasong')}}</text>
					</u-form-item> -->
				</u-form>
				<view class="button-wrap">
					<ex-button-wrap className="circle large darkStyle" theme="primary" :disabled="loading" @click="submit" :text='$t("assets.withdrawCreate.default[1]")'></ex-button-wrap>
				</view>
			</view>
		</view>
		
		<u-select v-model="addressShow" :list="selectAddressList" @confirm="addressResult" @cancel="addressShow = false" :confirm-text="$t('common.md_confirm')" :cancel-text="$t('common.md_cancel')"></u-select>
		<u-toast ref="uToast" />
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			addressShow:false,
			netlist:{},
			formLabelStyle: {color: "#e2e8e4",fontSize: "24rpx"},
			checkSecurityModal: !1,
			show: !1,
			showScan: !1,
			showTransaction: !1,
			loading: !1,
			coin: "",
			netIndex:0,
			time: null,
			countTime: 60,
			path: {
				setFundPass: "/pages/settings/security/setPassword"
			},
			form: {
				address: "",
				code: ""
			},
			rules: {
				address: [{
					required: true,
					message: this.$t("assets.withdrawCreate.rules[0]"),
					trigger: ["change", "blur"]
				}]
			},
			trForm: {},
			customStyle:{"color":"#e2e8e4","fontSize":"24rpx"},	//输入框自定义样式
			seconds:60,	//倒计时60秒
			sendTxt:'',
			/*
			trRules: {
				password: [{
					required: !0,
					message: this.$t("assets.withdrawCreate.rules[1]")
				}, {
					len: 6,
					message: this.$t("assets.withdrawCreate.rules[2]")
				}, {
					type: "number",
					message: this.$t("assets.setFundPassword.tips[2]")
				}],
				verification: [{
					required: !0,
					message: this.$t("assets.withdrawCreate.rules[3]")
				}]
			}*/
		}
	},
	computed:{
		selectAddressList:function(){
			let nettype = this.netlist[this.coin.toUpperCase()]
			let tmp = []
			nettype.forEach((item,index)=>{
				tmp.push({label:item,value:index})
			})
			return tmp
		}
	},
	onLoad: function(t) {
		if(!this.checkLogin()){
			return
		}
		this.netlist = this.webConf.netType
		var e = this;
		this.coin = t.coin,
		this.currency_id = t.currency_id;
		var r = t.address;
		this.address = r,
		this.$u.test.isEmpty(r) || (this.form.address = r),
		this.init()
	},
	onUnload: function() {
		clearInterval(this.timer)
	},
	onReady: function() {
		this.$refs.uForm.setRules(this.rules)
		//this.$refs.trForm.setRules(this.trRules)
	},
	watch: {
		time: function() {
			this.time <= 0 && (this.time = null,
			clearInterval(this.timer))
		}
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
		hasPayPassword: function() {
			var t = this;
			return new Promise((function(e, r) {
				0 === t.userInfo.has_pay_psd ? e(!1) : e(!0)
			}
			))
		},
		init: function() {
			//0 === this.userInfo.has_pay_psd && this.showModal()
		},
		scanCode: function() {
			// #ifdef H5
			this.$u.toast(this.$t("assets.withdraw.tips[0]"))
			// #endif
			// #ifndef H5
			uni.scanCode({
				scanType:['qrCode'],	//只扫二维码
			    success: (res)=> {
					this.getScanResult(res.result)
			    }
			})
			// #endif
		},
		addressResult:function(obj){
			//console.log(obj)
			this.netIndex = obj[0].value
		},
		getScanResult: function(t) {
			this.form.address = t
		},
		showCheckSecurity: function() {
			this.checkSecurityModal = !0
		},
		onCheckCancel: function() {
			this.navBack(1)
		},
		checkSecurity: function() {
			var t = this;
			this.$refs.trForm.validate((function(e) {
				if (e) {
					t.loading = !0;
					var r = "/user/checksecruity"
					  , i = {
						pay_password: t.trForm.password,
						code: t.trForm.verification
					};
					t.$u.post(r, i).then((function(e) {
						t.loading = !1,
						0 != e.code ? 1 == e.code && (t.$u.toast(e.msg),
						t.checkSecurityModal = !1) : t.$u.toast(e.msg)
					}
					)).catch((function(e) {
						t.loading = !1
					}
					))
				}
			}
			))
		},
		bindAddress: function() {
			this.$refs.uForm.validate((e)=> {
				if (e) {
					let netType = this.selectAddressList[this.netIndex].label || ''
					let params = {
						currency_id:this.currency_id,
						notes: this.coin,
						address: this.form.address,
						netType: netType,
						code: this.form.code
					}
					this.loading = true
					this.$u.api.walletAdd(params).then(res=>{
						this.loading = false
						this.$refs.uToast.show({title: res,type: 'success'})
						setTimeout(()=>{
							this.goBack()
						},1500)
						
					}).catch(err=>{
						this.loading = false
					})
				}
			})
		},
		sendCode: function() {
			var t = this;
			this.loading = !0;
			var e = {
				user_id: this.userInfo.id
			}
			  , r = this.$config.url + "/api/user/SendVerificationcode"
			  , i = this;
			uni.request({
				url: r,
				data: e,
				complete: function(e) {
					if (i.loading = !1,
					200 === e.statusCode) {
						var r = e.data;
						0 === r.code ? (t.countDown(),
						t.$u.toast(t.$t("assets.withdrawCreate.toast[0]"))) : (t.countDown(),
						r.msg && t.$u.toast(r.msg))
					}
				},
				fail: function() {
					t.loading = !1
				}
			})
		},
		countDown: function() {
			var t = this;
			clearInterval(this.timer),
			this.timer = setInterval((function() {
				t.$u.test.isEmpty(t.time) && (t.time = t.countTime),
				t.time--
			}
			), 1e3)
		},
		cancel: function() {
			uni.navigateBack({
				delta: 1
			})
		},
		showModal: function() {
			this.show = !0
		},
		hideModal: function() {
			this.show = !1,
			this.address || (this.checkSecurityModal = !0)
		},
		hideTranModal: function() {
			this.showTransaction = !1
		},
		submit: function() {
			this.bindAddress()
		}
	}
}
</script>

<style lang="scss" scoped>
.v-content-wrap {
	height: 100%;
	background-color: #fff;
	.v-content-title {
		display: flex;
		justify-content: space-between;
		border-bottom: 1rpx solid #ebeef5;
		align-items: center;
		padding: 0 30rpx;
		height: 120rpx;
		.right {
			position: relative;
			font-size: 26rpx;
			color: #FFC107;
			border: 1rpx solid #FFC107;
			border-radius: 6rpx;
			padding: 4rpx 24rpx;
			.icon-image {
				width: 32rpx;
				height: 32rpx;
				background: url('@/static/images/common/checked.png');background-size: 100% 100%;
				position: absolute;
				right: -1rpx;
				top: -1rpx
			}
		}
	}
	.form-content-wrap {
		padding: 0 30rpx;
		.func {
			width: 40rpx;
			height: 40rpx;
			background: url('@/static/images/common/scan.png');background-size: 100% 100%;
			margin-right: 18rpx
		}
		.input-item {
			padding: 0 30rpx
		}
	}
}

.button-wrap {
	position: absolute;
	bottom: 30rpx;
	left: 0;
	right: 0;
	padding: 0 30rpx
}

.transaction-security .send {
	color: #FFC107
}

.v-container-wrap.dark .v-content-wrap {
	background-color: var(--page-part-color);
	.v-content-title {
		border-bottom: 1rpx solid #2f4159
	}
}
</style>
