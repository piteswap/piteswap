<template>
	<view class="container dark">
		<lw-navbar :title="$t('settings.security.xgdlmm')"></lw-navbar>
		<u-toast ref="uToast"></u-toast>
		<view class="change-content change-content-dark">
			<u-form ref="uForm" :model="form" label-position="top" :label-style="formLabelStyle">
				<u-form-item :label='$t("settings.changeLoginPassword.default[1]")' prop="originPassword" :border-bottom="false">
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
					required: !0,
					message: this.$t("settings.changePassword.rules[0]"),
					trigger: ["change", "blur"]
				}],
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
	onReady: function() {
		this.$refs.uForm.setRules(this.rules)
	},
	methods: {
		submit: function() {
			this.$refs.uForm.validate(e=> {
				if (e) {
					var obj = {
						old_password: this.form.originPassword,
						password: this.form.password
					}
					this.$u.api.userEditPwd(obj).then(res=>{
						this.$refs.uToast.show({
							title: this.$t("settings.changePassword.toast[0]"),
							type: 'success'
						})
						setTimeout(()=>{
							this.goBack(2)
						},1500)
					}).catch(err=>{})
					
				}
			})
		},
		sendSms: function() {
			var t = uni.getStorageSync("account_type");
			if (t) {
				var e = uni.getStorageSync(t)
				  , n = this.api[t];
				this.$u.post(n, {
					to: e,
					area_id: 1,
					type: this.type
				})
			}
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

.change-content.change-content-dark {
	//background-color: var(--page-part-color)
	background:none
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
