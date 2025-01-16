<template>
	<view class="container dark">
		<lw-navbar :title="$t('settings.security.xgjymm')"></lw-navbar>
		<u-toast ref="uToast"></u-toast>
		<view class="change-content change-content-dark">
			<u-alert-tips class="utips" type="warning" :show="!hasPwd" :title="$t('settings.security.nopaypwdtips')"></u-alert-tips>
			<u-form ref="uForm" :model="form" label-position="top" :label-style="formLabelStyle">
				<u-form-item :label='$t("settings.changeLoginPassword.default[1]")' prop="originPassword" :border-bottom="false" v-if="hasPwd">
					<u-input class="input-item" type="password" :custom-style="formLabelStyle" :placeholder='$t("settings.changeLoginPassword.placeholder[0]")' v-model="form.originPassword"></u-input>
				</u-form-item>
				<u-form-item :label='$t("settings.changeLoginPassword.default[2]")' prop="password" :border-bottom="false">
					<u-input class="input-item" type="password" :custom-style="formLabelStyle" :placeholder='$t("settings.changeLoginPassword.placeholder[1]")' v-model="form.password"></u-input>
				</u-form-item>
				<u-form-item :label='$t("settings.changeLoginPassword.default[3]")' prop="confirmPassword" :border-bottom="false">
					<u-input class="input-item" type="password" :custom-style="formLabelStyle" :placeholder='$t("settings.changeLoginPassword.placeholder[2]")' v-model="form.confirmPassword"></u-input>
				</u-form-item>
			</u-form>
			<view class="button-wrap">
				<ex-button-wrap theme="primary" @click="$u.throttle(submit,1000)" :text='$t("settings.changeLoginPassword.default[4]")'></ex-button-wrap>
			</view>
		</view>
	</view>
</template>
<script>
export default {
	data: function() {
		var t = this;
		return {
			hasPwd:true,
			formLabelStyle:{color: "#e2e8e4",fontSize: "24rpx"},
			loading: !1,
			time: null,
			type: 2,
			countTime: 60,
			api: {
				email: "/notify/send_email",
				mobile: "notify/send_sms"
			},
			form: {},
			rules: {
				originPassword: [{
					validator: (rule, value, callback) => {
						// 返回true表示校验通过，返回false表示不通过
						if(this.hasPwd==true){
							if(!value || typeof value == 'undefined'){
								console.log('aaaa',value,this.$t("settings.changePassword.rules[0]"))
								callback(new Error(this.$t("settings.changePassword.rules[0]")));
								return false
							}
						}
						return true
					},
					trigger: ['change','blur']
				}
				],
				password: [{
					required: !0,
					message: this.$t("settings.changePassword.rules[1]"),
					trigger: ["change", "blur"]
				}],
				confirmPassword: [{
					required: !0,
					message: this.$t("settings.changePassword.rules[2]"),
					trigger: ["change", "blur"]
				}, {
					validator: function(e, n, a) {
						return t.form.password === n
					},
					message: this.$t("settings.changePassword.rules[3]")
				}]
			}
		}
	},
	onLoad:function(){
		if(!this.checkLogin()){
			return 
		}
		this.checkHasPwd()
	},
	onReady: function() {
		this.$refs.uForm.setRules(this.rules)
	},
	methods: {
		submit: function() {
			this.$refs.uForm.validate(e=> {
				if (e) {
					var obj = {
						oldpassword: this.form.originPassword,
						password: this.form.password,
						re_password: this.form.confirmPassword
					}
					this.$u.api.editPayPwd(obj).then(res=>{
						this.$refs.uToast.show({
							title: this.$t("settings.changePassword.toast[0]"),
							type: 'success'
						})
						setTimeout(()=>{
							this.goBack(1)
						},1500)
					}).catch(err=>{})
					
				}
			})
		},
		checkHasPwd:async function(){
			let res = await this.$u.api.hasPwd().catch(err=>{})
			this.hasPwd = res==2 ? false : true
		}
	}
}
</script>

<style lang="scss" scoped>
.change-content {
	padding: 0 30rpx;
	background-color: #fff;
	height: 100%
}

.utips{
	margin-top: 20rpx;
}

.change-content.change-content-dark {
	background: none;
}

.button-wrap {
	position: absolute;
	bottom: 30rpx;
	left: 0;
	right: 0;
	padding: 0 30rpx
}
.input-item{
	background: var(--page-part-color);
	padding: 10rpx 20rpx !important;
	border-radius: 10rpx;
}

.func {
	color: #FFC107
}
</style>
