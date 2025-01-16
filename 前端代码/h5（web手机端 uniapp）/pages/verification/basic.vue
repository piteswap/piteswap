<template>
	<view class="dark basic">
		<lw-navbar :title="$t('verification.smrz')" :boxShadow="false"></lw-navbar>
		<view class="change-content change-content-dark">
			<u-form ref="uForm" :model="form" label-position="top"  :border-bottom="false" :label-style="labelStyle">
				<u-form-item :label="$t('verification.guojia')" prop="country" :border-bottom="false">
					<u-input class="input-item" disabled :custom-style="labelStyle" :placeholder="$t('verification.guojiats')" v-model="form.country" @click="gotoChoose" />
					<u-icon name="arrow-right" class="down"></u-icon>
				</u-form-item>
				<u-form-item :label="$t('verification.xingming')" prop="name" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('verification.xingmingts')" v-model="form.name" />
				</u-form-item>
				<u-form-item :label="$t('verification.zjhm')" prop="card_id" :border-bottom="false">
					<u-input type="number" class="input-item" :custom-style="labelStyle" :placeholder="$t('verification.zjhmts')" v-model="form.card_id" />
				</u-form-item>
				<u-form-item :label="$t('verification.lxdz')" prop="address" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('verification.lxdzts')" v-model="form.address" />
				</u-form-item>
			</u-form>
			<view class="button-wrap">
				<ex-button-wrap class-name="circle large darkStyle" :plain="true" :text="$t('verification.submit')" @click="$u.throttle(submit, 1000)"></ex-button-wrap>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			labelStyle:{
				color:'#e2e8e4',fontSize: '24rpx',justifyContent: 'flex-start'
			},
			form:{
				name: '',
				country: '',
				card_id: '',
				address: ''
			},
			rules: {
				country: [
					{
						required: true,
						message: this.$t('verification.guojiats'),
						trigger: ['change','blur']
					}
				],
				name: [
					{
						required: true,
						message: this.$t('verification.xingmingts'),
						trigger: ['change','blur']
					}
				],
				card_id: [
					{
						required: true,
						message: this.$t('verification.zjhmts'),
						trigger: ['change','blur']
					}
				],
				address: [
					{
						required: true,
						message: this.$t('verification.lxdzts'),
						trigger: ['change','blur']
					}
				],
			}
		};
	},
	methods:{
		gotoChoose:function(){
			uni.$once('chooseArea',(item)=>{
				this.form.country = item.name
				this.$refs.uForm.validate()
			})
			this.$u.route('/pages/user/login/choose')
		},
		submit:function(){
			
			this.$refs.uForm.validate(valid => {
				if (valid) {
					this.$u.api.userRealname(this.form).then(message=>{
						//console.log(message)
						if(message){
							this.$u.toast(message || 'Success')
							
							setTimeout(()=>{
								this.goBack()
							},1000)
						}
						
					}).catch(err=>{})
				}
			});
			
		}
	},
	onLoad:function(){
		this.checkLogin()
	},
	onReady() {
		this.$refs.uForm.setRules(this.rules)
	}
}
</script>

<style lang="scss" scoped>
.dark{
	/deep/.u-form-item--right {
		background: #2a405c;
		min-height: 88rpx;
		line-height: 88rpx;
		border-radius: 10rpx;
		.u-form-item--right__content {
		    padding: 0 30rpx;
		    min-height: 88rpx;
		}
		.u-input{
			align-items: center;
		}
	}
}
.v-center {
	display: flex;
	align-items: center
}

.r-center {
	display: flex;
	justify-content: center
}

.center {
	display: flex;
	justify-content: center;
	align-items: center
}

.column {
	display: flex;
	flex-flow: column nowrap
}

.no-shrink {
	flex-shrink: 0
}

.grow {
	flex-grow: 1
}

.page-height {
	height: calc(100vh - 44px - 0px)
}

.page-back {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%
}

.bg {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed
}

.top-bar-height {
	height: calc(44px + 0px)
}

.u-navbar {
	box-shadow: 0 10px 10px 0 rgba(10,16,23,.4)
}

.change-content {
	padding: 0 15px;
	height: calc(100vh - 44px);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: cover;
	padding-top: 10px;
	background-color: var(--page-background-color)
}

.change-content .u-icon {
	color: var(--text-color)
}

.button-wrap {
	padding: 0 15px;
	margin-bottom: 15px
}
</style>
