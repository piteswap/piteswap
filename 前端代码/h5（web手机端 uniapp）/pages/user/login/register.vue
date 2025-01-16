<template>
	<view class="v-content-wrap dark">
		<lw-navbar :box-shadow="false"></lw-navbar>
		<view class="content">
			<view class="login">
				<view class="switch-types" >
					<type-switch :right-label="$t('reg.shoujizhuche')" :left-label="$t('reg.youxiangzhuche')" @change="switchChange"></type-switch>
				</view>
				
				<view class="login-form">
					<u-form :model="form" ref="uForm" :border-bottom="false">
						<u-form-item label-position="top" :border-bottom="false" prop="user_string" v-if="form.type=='mobile'">
							<uni-view class="prefix" @click="gotoChoose">
								+{{form.areacode}}<u-icon name="arrow-down" class="down"></u-icon>
							</uni-view>
							<u-input v-model="form.user_string" :placeholder="$t('reg.shoujihao')" :custom-style="customStyle" />
						</u-form-item>
						<u-form-item label-position="top" :border-bottom="false" prop="user_string" v-else>
							<u-input v-model="form.user_string" :placeholder="$t('reg.youxiang')" :custom-style="customStyle" />
						</u-form-item>
						
						<!-- 发送验证码-->
						<u-form-item label-position="top" :border-bottom="false" prop="code">
							<u-input type="number" v-model="form.code" :placeholder="$t('reg.yanzhengma')" :custom-style="customStyle" />
							<view class="send" @click="getCode">
								<u-verification-code :seconds="seconds" ref="uCode" change-text="Xs" :start-text="$t('reg.fasong')" :end-text="$t('reg.fasong')" :keep-running="true"></u-verification-code>
								<text>{{sendTxt || $t('reg.fasong')}}</text>
							</view>
						</u-form-item>
						<u-form-item label-position="top" :border-bottom="false" prop="password">
							<u-input type="password" password-icon v-model="form.password" :placeholder="$t('reg.mima')" :custom-style="customStyle" />
						</u-form-item>
						<u-form-item label-position="top" :border-bottom="false" prop="re_password">
							<u-input type="password" password-icon v-model="form.re_password" :placeholder="$t('reg.querenmima')" :custom-style="customStyle" />
						</u-form-item>
						<u-form-item label-position="top" :border-bottom="false" prop="extension_code">
							<u-input v-model="form.extension_code" :placeholder="$t('reg.yaoqingma')" :custom-style="customStyle" />
						</u-form-item>
					</u-form>
					<view class="agreement">
						<view class="checkbox" :class="{'checked':agreement}" @click="agreement = !agreement"></view>
						<view class="agreement-text">
							{{$t('reg.nyty')}}<text data-type="user" class="light-tip">{{$t('reg.yhxy')}}</text>{{$t('reg.bljwm')}}<text data-type="privacy" class="light-tip">{{$t('reg.ysxy')}}</text>
						</view>
					</view>
					<view class="button-wrap">
						<ex-button-wrap class-name="circle large darkStyle" @click="$u.throttle(tapBtn, 1000)" :text="$t('reg.zhuche')"></ex-button-wrap>
					</view>
				</view>
				
				<view class="bottom">
					<view class="bottom-content">
						{{$t('reg.yyzh')}}, <text class="light-tip" @click="$u.route('/pages/user/login/login')">{{$t('reg.ljdl')}}</text>
					</view>
				</view>
				
				
			</view>
		</view>
		
	</view>
</template>

<script>
export default {
	data() {
		return {
			seconds:60,	//倒计时60秒
			agreement:false,//是否勾选同意协议
			customStyle:{"color":"#e2e8e4","fontSize":"24rpx"},	//输入框自定义样式
			disabledCode: false,
			form: {
				type:'email',
				areacode:'1',
				user_string: '',
				code:'',
				password: '',
				re_password: '',
				extension_code:''
			},
			sendTxt:'',
			rules: {
				user_string: [
					{
						validator: (rule, value, callback) => {
							// 返回true表示校验通过，返回false表示不通过
							if(this.form.type=='mobile'){
								if(!value){
									callback(new Error(this.$t('reg.qsrsjh')));
									return false
								}
								let reg = /^[0-9]{7,16}$/;
								if (!reg.test(value)) {
									callback(new Error(this.$t('reg.qsrzqsjh')));
									return false
								}
							}else if(this.form.type=='email'){
								if(!value){
									callback(new Error(this.$t('reg.qsryx')));
									return false
								}
								// if(!this.$u.test.email(value)){
								// 	callback(new Error(this.$t('reg.qsrzqyx')))
								// 	return false
								// }
							}
							return true
						},
						trigger: ['change','blur'],
					}
				],
				code: [
					{
						required: true,
						message: this.$t('reg.qsryzm'),
						trigger: ['change','blur']
					}
				],
				password: [
					{
						required: true,
						message: this.$t('reg.qsrmm'),
						trigger: ['change','blur']
					},
					{
						min: 6,
						message: this.$t('reg.zxcd6w'),
						trigger: ['change','blur']
					}
				],
				re_password: [
					{
						required: true,
						message: this.$t('reg.qsrqrmm'),
						trigger: ['change','blur']
					},
					{
						validator: (rule, value, callback) => {
							// 返回true表示校验通过，返回false表示不通过
							if(value !== this.form.password){
								return false
							}
							return true
						},
						message: this.$t('reg.lcmmbyz'),
						trigger: ['change','blur']
					}
				]
			}
				
		};
	},
	methods:{
		gotoChoose:function(){
			uni.$once('chooseArea',(item)=>{
				this.form.areacode = item.area_code
			})
			this.$u.route('/pages/user/login/choose')
		},
		codeChange:function(){
			if (this.disabledCode) return;
			this.disabledCode = true;
			let n = this.seconds;
			this.sendTxt = n + "s后获取";
			const run = setInterval(() => {
				n -= 1;
				if (n < 0) {
					clearInterval(run);
				}
				this.sendTxt = n + "s后获取";
				if (this.sendTxt < 0 + "s") {
					this.disabledCode = false;
					this.sendTxt = "重新获取";
				}
			}, 1000);
		},
		getCode:async function() {	//发验证码
			console.log('canGetCode', this.$refs.uCode.canGetCode)
			if(this.$refs.uCode.canGetCode) {
				
				let res = null
				
				if(this.form.type=='mobile'){
					if(!this.form.user_string){
						this.$u.toast(this.$t('reg.qsrsjh'))
						return
					}
					let reg = /^[0-9]{7,16}$/;
					if (!reg.test(this.form.user_string)) {
						this.$u.toast(this.$t('reg.qsrzqsjh'))
						return
					}
					
					let params = {
							user_string: this.form.user_string,
							type: 'register',
							//area_code_id: that.codeId,
							area_code: this.form.areacode
						}
					uni.showLoading()
					res = await this.$u.api.sendSms(params).catch(err=>{
						uni.hideLoading()
						this.$u.toast(err.message)
					})
					if(res && res.type == 'ok'){
						this.$u.toast(res.message)
						this.codeChange()
					}
				}else{
					if(!this.form.user_string){
						this.$u.toast(this.$t('reg.qsryx'))
						return
					}
					if(!this.$u.test.email(this.form.user_string)){
						this.$u.toast(this.$t('reg.qsrzqyx'))
						return
					}
					
					let params = {
							user_string: this.form.user_string,
							type: 'register'
						}
						
					uni.showLoading()
					res = await this.$u.api.sendMail(params).catch(err=>{
						uni.hideLoading()
						this.$u.toast(err.message)
					})
					if(res && res.type == 'ok'){
						this.$u.toast(res.message)
					}
				}
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
		switchChange:function(type){
			this.form.type = type == 'left' ? 'email' : 'mobile'
			this.form.user_string = ''
			this.form.code = ''
			const ecode = this.form.extension_code
			setTimeout(()=>{
				this.$refs.uForm.resetFields()
				this.form.extension_code = ecode
			},50)
		},
		tapBtn:function(e){
			this.$refs.uForm.validate(valid => {
				if (valid) {
					if(this.agreement!==true){
						this.$u.toast(this.$t('reg.qgxxy'))
						return
					}
					//console.log('验证通过');
					this.$u.api.userRegister(this.form).then(message=>{
						//console.log(message)
						if(message){
							this.$u.toast(message || 'Success')
							setTimeout(()=>{
								uni.redirectTo({
									url:'/pages/user/login/login'
								})
							},1000)
						}
						
					}).catch(err=>{})
				}
			});
			
		}
	},
	onLoad:function(options){
		if(options.code){
			this.form.extension_code = options.code
		}
	},
	onReady() {
		this.$refs.uForm.setRules(this.rules)
	}
}
</script>

<style lang="scss" scoped>
.v-content-wrap {
	//height: calc(100vh - 88rpx - 0rpx);
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed;
}
.content {
    padding: 0 40rpx;
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
	
	.bottom {
	    margin: 50rpx auto 30rpx;
	    display: flex;
	    justify-content: center;
	    align-items: center;
		
		.bottom-content {
		    height: 100rpx;
		    line-height: 100rpx;
		    text-align: center;
		    width: 60%;
		    border-top: 2rpx solid #ebeef5;
		    color: var(--text-color);
		    font-size: 28rpx;
		    font-weight: 700;
			.light-tip {
			    color: #FFC107;
			}
		}
	}
}

.v-content-wrap.dark .bottom .bottom-content {
    border-top: 2rpx solid #2c425a;
    color: #e2e8e4;
}

.login {
    overflow: hidden;
	.switch-types {
	    display: flex;
	    align-items: baseline;
	    margin-top: 40rpx;
	    margin-bottom: 60rpx;
	}
}
.login-form {
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
.agreement {
    display: flex;
    align-items: center;
    margin-top: 30rpx;
	
	.checkbox {
	    flex: 0 0 auto;
	    width: 40rpx;
	    height: 40rpx;
	    background: url('@/static/images/common/checkbox_1.png');
	    background-size: 100% 100%;
	    margin-right: 10rpx;
		&.checked {
			background: url('@/static/images/common/checkbox_2.png');
			background-size: 100% 100%;
		}
	}
	.agreement-text {
	    font-size: 24rpx;
	    color: #909399;
		.light-tip {
		    color: #FFC107;
		}
	}
}
.button-wrap {
    margin-top: 50rpx;
}

</style>
