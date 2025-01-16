<template>
	<view class="v-content-wrap dark" style="padding: 0px;">
		<lw-navbar :box-shadow="false"></lw-navbar>

		<movable-area style="width: 100%;height: calc(100vh - 44px);min-height: 667px;">
			<view class="content">
				<view class="logo-wrap">
					<view class="switch-language" @click="$u.route('/pages/settings/language/language')">
						{{$t('login.qiehuanyuyan')}}</view>
					<image mode="widthFix" class="logo" src="@/static/images/common/logodex.png"></image>
				</view>
				<view class="login">
					<type-switch :left-label="$t('login.youxiangdenglu')" :right-label="$t('login.shoujidenglu')" @change="switchChange"></type-switch>
					<view class="login-form">
						<u-form :model="form" ref="uForm" :border-bottom="false" :error-type="['toast']">
							<u-form-item label-position="top" :border-bottom="false" prop="user_string"
								v-if="form.user_type=='mobile'">
								<uni-view class="prefix" @click="gotoChoose"> +{{form.areacode}}
									<u-icon name="arrow-down" class="down"></u-icon>
								</uni-view>
								<u-input v-model="form.user_string" :placeholder="$t('login.shoujihao')"
									:custom-style="customStyle" />
							</u-form-item>
							<u-form-item label-position="top" :border-bottom="false" prop="user_string" v-else>
								<u-input v-model="form.user_string" :placeholder="$t('login.youxiang')"
									:custom-style="customStyle" />
							</u-form-item>
							<u-form-item label-position="top" :border-bottom="false" prop="password">
								<u-input type="password" password-icon v-model="form.password"
									:placeholder="$t('login.mima')" :custom-style="customStyle" />
							</u-form-item>
						</u-form>
						<view class="button-wrap">
							<ex-button-wrap class-name="circle large darkStyle" @click="$u.throttle(tapBtn, 1000)"
								:text="$t('login.denglu')"></ex-button-wrap>
						</view>
						<view class="tips" @click="$u.route('/pages/user/login/forgetPassword')">
							{{$t('login.wangjimima')}}</view>
						<view class="bottom-content">
							{{$t('login.myzh')}}, <text class="light-tip"
								@click="$u.route('/pages/user/login/register')">{{$t('login.lijizhuche')}}</text>
						</view>
					</view>
					<u-toast ref="uToast" />
				</view>
			</view>

			<image src="../../../static/images/common/icon_chat_dark.png" mode="widthFix"
				style="width: 80rpx;position: absolute;right: 80rpx;bottom: 200rpx;" @tap="goChat"></image>

		</movable-area>

	</view>
</template>

<script>
	export default {
		data() {
			return {
				customer_url: '',
				xW: 0,
				yH: 0,
				x: 0,
				y: 0,
				old: {
					x: 0,
					y: 0
				},
				pageOption: null,
				customStyle: {
					"color": "#e2e8e4",
					"fontSize": "24rpx"
				}, //输入框自定义样式
				form: {
					user_type: 'email',
					areacode: '1',
					user_string: '',
					password: '',
				},
				rules: {
					user_string: [{
						validator: (rule, value, callback) => {
							// 返回true表示校验通过，返回false表示不通过
							if (this.form.user_type == 'mobile') {
								if (!value) {
									callback(new Error(this.errCb('reg.qsrsjh')));
									return false
								}
							} else if (this.form.user_type == 'email') {
								if (!value) {
									callback(new Error(this.errCb('reg.qsryx')));
									return false
								}
								if (!this.$u.test.email(value)) {
									callback(new Error(this.errCb('reg.qsrzqyx')))
									return false
								}
							}
							return true
						}
					}],
					password: [{
						validator: (rule, value, callback) => {

							if (!value) {
								callback(new Error(this.errCb('reg.qsrmm')));
								return false
							} else if (value.length < 6) {
								callback(new Error(this.errCb('reg.zxcd6w')));
								return false
							}

							return true
						}
					}]
				}

			};
		},
		methods: {
			goChat: function() {
				// if(this.webConf.serviceChatOpenType=='blank'){
				// this.openUrl(this.webConf.serviceChat)
				// this.openUrl(this.customer_url) 
				// }else{
				// 	this.$u.route(this.path.chat)
				// }
				this.$u.route('/pages/help/center/chat')
			},
			openUrl: function(e) {
				e = encodeURI(e)
				// #ifdef APP-PLUS
				plus.runtime.openURL(e)
				// #endif
				// #ifndef APP-PLUS
				window.open(e)
				// #endif
			},

			errCb: function(node) {
				return this.$t(node)
			},
			gotoChoose: function() {
				uni.$once('chooseArea', (item) => {
					this.form.areacode = item.area_code
				})
				this.$u.route('/pages/user/login/choose')
			},
			switchChange: function(type) {
				this.form.user_type = type == 'left' ? 'email' : 'mobile'
				this.form.user_string = ''
				setTimeout(() => {
					this.$refs.uForm.resetFields()
				}, 50)
			},
			getUserInfo: async function() {
				let user = await this.$u.api.getUserInfo().catch(err => {})
				if (user) {
					this.$u.vuex('vuex_user', user)
					this.user = user
				}
			},
			tapBtn: function(e) {
				this.$refs.uForm.validate(valid => {
					if (valid) {
						//console.log('验证通过');
						this.$u.api.userLogin(this.form).then(message => {
							if (message) {
								this.$u.vuex('vuex_token', message)

								//更新用户信息
								this.getUserInfo()

								this.$refs.uToast.show({
									title: this.$t('login.dengluchenggong'),
									type: 'success'
								})

								setTimeout(() => {

									// 然后跳回原页面
									if (!this.pageOption) { //如果没设置默认跳转设备页
										uni.switchTab({
											url: '/pages/index/index',
											success: (re) => {
												uni.$emit('userLogin',
													1) //发送一个登录成功的事件
											}
										})
										return
									}
									if (this.pageOption.backtype == 1) {
										uni.redirectTo({
											url: decodeURIComponent(this.pageOption
												.backpage),
											success: (re) => {
												uni.$emit('userLogin',
													1) //发送一个登录成功的事件
											}
										})
									} else {
										uni.switchTab({
											url: decodeURIComponent(this.pageOption
												.backpage),
											success: (re) => {
												uni.$emit('userLogin',
													1) //发送一个登录成功的事件
											}
										})
									}

								}, 1000)



							}

						}).catch(err => {})
					}
				});

			}
		},
		onLoad(options) {
			uni.hideToast()
			// 接收跳转的参数
			if (Object.keys(options).length > 0) {
				this.pageOption = options
			}

			uni.getSystemInfo({
				success: (res) => {
					console.log(res, 'res')
					this.xW = res.screenWidth - 80
					this.yH = res.screenHeight - 200
				}
			})

			// this.$u.api.getCon({}).then(res => {
			// 	console.log(res)
			// 	this.customer_url = res.customer_url
			// })
		},
		onReady() {
			this.$refs.uForm.setRules(this.rules)
		}
	}
</script>

<style lang="scss" scoped>
	.login-form {
		margin-top: 60rpx;
	}

	.v-content-wrap {
		//background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
		//background-size: 100% 100%;
		//background-attachment: fixed;

		height: calc(100vh - 88rpx - --status-bar-height);
		padding: 30rpx 40rpx 0 40rpx;
		background-color: #fff;

		.logo-wrap {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-bottom: 86rpx;
			position: relative;

			.switch-language {
				position: absolute;
				top: 10rpx;
				right: 30rpx;
				color: #FFC107;
			}

			.logo {
				width: 160rpx;
				height: 160rpx;
			}
		}

	}

	.content {
		padding: 0 30rpx;
		box-sizing: border-box;

		/deep/.u-form-item--right {
			min-height: 88rpx;
			line-height: 88rpx;
			border-radius: 10rpx;
			background: #2a405c;

			.u-form-item--right__content {
				padding: 0 30rpx;
				min-height: 88rpx;
			}

			.u-input {
				position: relative;
				flex: 1;
				display: flex;
				align-items: center;
			}
		}

		.bottom-content {
			height: 100rpx;
			line-height: 100rpx;
			text-align: center;
			width: 100%;
			color: var(--text-color);
			font-size: 24rpx;
			text-align: left;

			.light-tip {
				color: #FFC107;
			}
		}
	}

	.v-content-wrap.dark .bottom .bottom-content {
		border-top: 2rpx solid #2c425a;
	}

	.login {
		overflow: hidden;
	}

	.login-form {
		.tips {
			margin-top: 50rpx;
			color: #FFC107;
			font-size: 24rpx;
		}

		.send {
			color: #FFC107;
		}

		.prefix {
			color: var(--text-color);
			font-size: 24rpx;
			font-weight: 700;
			margin-right: 40rpx;
			color: #e2e8e4;

			.down {
				margin-left: 10rpx;
			}
		}
	}

	.button-wrap {
		margin-top: 50rpx;
	}
</style>
