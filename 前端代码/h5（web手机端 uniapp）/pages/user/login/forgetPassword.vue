<template>
	<view class="v-content-wrap dark">
		<lw-navbar :box-shadow="false" :title="$t('forget.zhmm')"></lw-navbar>
		<view class="content">
			<view class="login">
				
				<!-- <view class="switch-types" v-if="step==1">
					<type-switch :right-label="$t('forget.sjzh')" :left-label="$t('forget.yxzh')" @change="switchChange"></type-switch>
				</view> -->
				
				<view class="login-form">
					<block v-if="step==1">
						<u-form :model="form" ref="uForm" :border-bottom="false">
							<u-form-item label-position="top" :border-bottom="false" prop="user_string" v-if="form.type=='mobile'">
								<uni-view class="prefix" @click="gotoChoose">
									+{{form.areacode}}<u-icon name="arrow-down" class="down"></u-icon>
								</uni-view>
								<u-input v-model="form.user_string" :placeholder="$t('forget.zcsjh')" :custom-style="customStyle" />
							</u-form-item>
							<u-form-item label-position="top" :border-bottom="false" prop="user_string" v-else>
								<u-input v-model="form.user_string" :placeholder="$t('forget.zcyxh')" :custom-style="customStyle" />
							</u-form-item>
							
							<u-form-item label-position="top" :border-bottom="false" prop="code">
								<u-input type="number" v-model="form.code" :placeholder="$t('reg.yanzhengma')" :custom-style="customStyle" />
								<view class="send" @click="getCode">
									<u-verification-code :seconds="seconds" ref="uCode" change-text="Xs" :start-text="$t('reg.fasong')" :end-text="$t('reg.fasong')" :keep-running="true" @change="codeChange"></u-verification-code>
									<text>{{sendTxt || $t('reg.fasong')}}</text>
								</view>
							</u-form-item>
						</u-form>
						<view class="button-wrap">
							<ex-button-wrap class-name="circle large darkStyle" @click="$u.throttle(nextStep, 1000)" :text="$t('forget.xiayibu')"></ex-button-wrap>
						</view>
					</block>
					
					<view v-show="step==2">
						<u-form :model="form" ref="uForm2" :border-bottom="false">
							<u-form-item label-position="top" :border-bottom="false" prop="password">
								<u-input type="password" password-icon v-model="form.password" :placeholder="$t('forget.newpwd')" :custom-style="customStyle" />
							</u-form-item>
							<u-form-item label-position="top" :border-bottom="false" prop="re_password">
								<u-input type="password" password-icon v-model="form.re_password" :placeholder="$t('reg.querenmima')" :custom-style="customStyle" />
							</u-form-item>
						</u-form>
						<view class="button-wrap">
							<ex-button-wrap theme="sell" class-name="circle large darkStyle" :disabled="!form.code" @click="$u.throttle(tapBtn, 1000)" :text="$t('forget.tijiao')"></ex-button-wrap>
						</view>
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
			step:1,
			seconds:60,	//倒计时60秒
			agreement:false,//是否勾选同意协议
			customStyle:{"color":"#e2e8e4","fontSize":"24rpx"},	//输入框自定义样式
			form: {
				type:'email',
				areacode:'1',
				user_string: '',
				code:'',
				password: '',
				re_password: ''
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
								if(!this.$u.test.email(value)){
									callback(new Error(this.$t('reg.qsrzqyx')))
									return false
								}
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
				]
			},
			rules2: {
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
		codeChange:function(text){
			this.sendTxt = text
			//console.log('codeChange' ,text)
		},
		getCode:async function() {	//发验证码
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
							type: 'forget',
							//area_code_id: this.codeId,
							area_code: this.form.areacode
						}
					uni.showLoading()
					res = await this.$u.api.sendSms(params).catch(err=>{
						uni.hideToast()
						this.$u.toast(err.message)
					})
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
							type: 'forget'
						}
						
					uni.showLoading()
					res = await this.$u.api.sendMail(params).catch(err=>{
						uni.hideToast()
						this.$u.toast(err.message)
					})
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
			setTimeout(()=>{
				this.$refs.uForm.resetFields()
			},50)
		},
		nextStep:function(e){
			this.$refs.uForm.validate(async valid => {
				if (valid) {
					let res;
					if(this.form.type=='mobile'){
						res = await this.$u.api.checkMoblie({mobile_code:this.form.code}).catch(err=>{})
					}else{
						res = await this.$u.api.checkEmail({email_code:this.form.code}).catch(err=>{})
					}
					if(!res){
						return false
					}
					this.step = 2
				}
			})
			
		},
		tapBtn:function(e){
			this.$refs.uForm2.validate(valid => {
				if (valid) {
					
					let params = {
						account: this.form.user_string,
						password: this.form.password,
						repassword: this.form.re_password,
						code: this.form.code
					}
					
					
					this.$u.api.forgetPwd(params).then(message=>{
						//console.log(message)
						if(message){
							this.$u.toast(message || 'Success')
							setTimeout(()=>{
								uni.redirectTo({
									url:'/pages/user/login/login'
								})
							},1500)
						}
						
					}).catch(err=>{})
				}
			});
			
		}
	},
	onLoad:function(options){
	},
	onReady() {
		this.$refs.uForm.setRules(this.rules)
		this.$refs.uForm2.setRules(this.rules2)
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
