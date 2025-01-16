<template>
	<view class="dark basic">
		<lw-navbar :title="$t('verification.smrz')" :boxShadow="false"></lw-navbar>
		<view class="change-content change-content-dark">
			<u-form ref="uForm" :model="form" label-position="top"  :border-bottom="false" :label-style="labelStyle">
				<u-form-item :label="$t('verification.zjhm')" prop="card_id" :border-bottom="false">
					<u-input type="number" class="input-item" :custom-style="labelStyle" :placeholder="$t('verification.zjhmts')" v-model="form.card_id" />
				</u-form-item>
				<u-form-item class="upload-wrap darkStyle" prop="front_pic" :label="$t('verification.zjzm')" label-position="top" :label-style="labelStyle" :border-bottom="false">
					<u-upload ref="uUpload" :action="action" :file-list="fileList.front" max-count="1" :upload-text="$t('verification.xztp')" @on-success="onImageUploaded('front_pic',$event)"></u-upload>
				</u-form-item>
				<u-form-item class="upload-wrap darkStyle" prop="reverse_pic" :label="$t('verification.zjfm')" label-position="top" :label-style="labelStyle" :border-bottom="false">
					<u-upload ref="uUpload" :action="action" :file-list="fileList.reverse" max-count="1" :upload-text="$t('verification.xztp')" @on-success="onImageUploaded('reverse_pic',$event)"></u-upload>
				</u-form-item>
				<u-form-item class="upload-wrap darkStyle" prop="hand_pic" :label="$t('verification.sczj')" label-position="top" :label-style="labelStyle" :border-bottom="false">
					<u-upload ref="uUpload" :action="action" :file-list="fileList.hand" max-count="1" :upload-text="$t('verification.xztp')" @on-success="onImageUploaded('hand_pic',$event)"></u-upload>
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
			action: this.webConf.staticUrl + "/api/upload",
			fileList: {front:[],reverse:[],hand:[]},
			labelStyle:{
				color:'#e2e8e4',fontSize: '24rpx',justifyContent: 'flex-start'
			},
			form:{
				card_id: '',
				address: '',
				front_pic: '',
				reverse_pic: '',
				hand_pic: ''
			},
			rules: {
				card_id: [
					{
						required: true,
						message: this.$t('verification.zjhmts'),
						trigger: ['change','blur']
					}
				],
				front_pic: [
					{
						required: true,
						message: this.$t('verification.zjzm'),
						trigger: ['change','blur']
					}
				],
				reverse_pic: [
					{
						required: true,
						message: this.$t('verification.zjfm'),
						trigger: ['change','blur']
					}
				],
				hand_pic: [
					{
						required: true,
						message: this.$t('verification.sczj'),
						trigger: ['change','blur']
					}
				]
			}
		};
	},
	methods:{
		onImageUploaded: function(keyname,t) {
			if(t.type=='ok'){
				this.form[keyname] = t.message
				this.$refs.uForm.validate()
			}else{
				this.$u.toast(t.message || this.$t('verification.scsb'))
			}
		},
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
					this.$u.api.userRealname2(this.form).then(message=>{
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
			
		},
		userCenter:function(){
			this.$u.api.userCenter().then(res=>{
				if(res.review_status!=2){
					this.$u.toast(this.$t('verification.qwcjcrz'))
					setTimeout(()=>{
						this.goBack()
					},1000)
					return
				}
			}).catch(err=>{})
		}
	},
	onLoad:function(){
		if(!this.checkLogin()){
			//this.goBack()
			return
		}
		this.userCenter()
	},
	onReady() {
		this.$refs.uForm.setRules(this.rules)
	}
}
</script>

<style lang="scss" scoped>
	
.change-content {
	padding: 0 15px;
	//height: calc(100vh - 44px);
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

.dark {
	/deep/.u-input{
		align-items: center;
	}
	/deep/.u-form-item--right {
		min-height: 88rpx;
		line-height: 88rpx;
		border-radius: 10rpx;
		background: #2a405c;
		.u-form-item--right__content {
			padding: 0 30rpx;
			min-height: 88rpx;
		}
	}
} 

.upload-wrap {
		/deep/.u-form-item--right{
			background: none !important;
			&.u-form-item-dark {
				background-color: initial
			}
			&.u-form-item-light {
				background-color: initial
			}
			.u-form-item--right__content {
				padding: 0
			}
		}
		/deep/.u-upload{
			.u-list-item {
				background-color: var(--page-part-color)
			}
			.u-add-wrap {
				color: #c0c4cc
			}
		}
	}
</style>
