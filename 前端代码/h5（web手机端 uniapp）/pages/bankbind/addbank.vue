<template>
	<view class="dark basic">
		<lw-navbar :title="$t('bankbind.editbank')" :boxShadow="false"></lw-navbar>
	
		<!-- <view class="change-content change-content-dark">
			<u-form ref="uForm" :model="form" label-position="top"  :border-bottom="false" :label-style="labelStyle">
				
				<u-form-item :label="$t('bankbind.bkname')" prop="bkname" :border-bottom="false">
					<u-input class="input-item" disabled :custom-style="labelStyle" :placeholder="$t('bankbind.bknamets')" v-model="form.bank_name" @click="addressShow = true" />
					<u-icon name="arrow-right" class="down"></u-icon>
					<input type="hidden" name="bank_id" style="display:none"/>
				</u-form-item>
				
				<u-form-item :label="$t('bankbind.name')" prop="name" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.namets')" v-model="form.real_name" />
				</u-form-item>
				<u-form-item :label="$t('bankbind.bknumber')" prop="card_id" :border-bottom="false">
					<u-input type="number" class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.bknumberts')" v-model="form.bank_account" />
				</u-form-item>
				<u-form-item :label="$t('bankbind.bkbranch')" prop="bkbranchts" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.bkbranchts')" v-model="form.bank_branch" />
				</u-form-item>
				
			</u-form>
			<view class="button-wrap">
				<ex-button-wrap class-name="circle large darkStyle" :plain="true" :text="$t('bankbind.submit')" @click="$u.throttle(submit, 1000)"></ex-button-wrap>
			</view>
		</view>
		
		<u-select v-model="addressShow" :list="selectAddressList" @confirm="addressResult" @cancel="addressShow = false" :confirm-text="$t('common.md_confirm')" :cancel-text="$t('common.md_cancel')"></u-select>
		<u-toast ref="uToast" /> -->
		
		
		<view class="change-content change-content-dark">
			<u-form ref="uForm" :model="form" label-position="top"  :border-bottom="false" :label-style="labelStyle">
				
				<u-form-item :label="$t('bankbind.bkmingchen')" prop="bkmingchen" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.bkmingchents')" v-model="form.bank_name" />
				</u-form-item>
				<u-form-item :label="$t('bankbind.bkaccount')" prop="bkaccount" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.bkaccountts')" v-model="form.bank_account" />
				</u-form-item>
				<u-form-item :label="$t('bankbind.bkaddress')" prop="bkaddress" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.bkaddressts')" v-model="form.bank_address" />
				</u-form-item>
				<u-form-item :label="$t('bankbind.swiftcode')" prop="swiftcode" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle"  :placeholder="$t('bankbind.swiftcodets')" v-model="form.swift_code" />
				</u-form-item>
				<u-form-item :label="$t('bankbind.chikaxingming')" prop="chikaxingming" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.chikaxingmingts')" v-model="form.real_name" />
				</u-form-item>
				
				<u-form-item :label="$t('bankbind.residenceaddress')" prop="residenceaddress" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.residenceaddressts')" v-model="form.residence_address" />
				</u-form-item>
				<u-form-item :label="$t('bankbind.postalcode')" prop="postalcode" :border-bottom="false">
					<u-input class="input-item" :custom-style="labelStyle" :placeholder="$t('bankbind.postalcodets')" v-model="form.postal_code" />
				</u-form-item>
				
			</u-form>
			<view class="button-wrap">
				<ex-button-wrap class-name="circle large darkStyle" :plain="true" :text="$t('bankbind.submit')" @click="$u.throttle(submit, 1000)"></ex-button-wrap>
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
			addressShow:false,
			netIndex:0,
			form:{
				bank_account:''
			},
			rules: {
				bank_account: [
					{
						required: true,
						message: this.$t('bankbind.bknumberts'),
						trigger: ['change','blur']
					}
				]
				
			},
			bankList:[]
		};
	},
	methods:{
		getBankList:function(){
			this.$u.api.cashInfo({'lang':this.$i18n.locale}).then(res => {
				this.bankList = res.banks;
				if(res.bank_account){
					this.form.bank_account = res.bank_account; //银行账户
					this.form.real_name = res.real_name;	//姓名
					this.form.bank_name = res.bank_name; //银行名称
					this.form.bank_address = res.bank_address; //银行名称
					this.form.swift_code = res.swift_code; //银行名称
					this.form.residence_address = res.residence_address; //银行名称
					this.form.postal_code = res.postal_code; //银行名称
					
				}
			})
		},
		//银行下拉框确定事件
		// addressResult:function(obj){
		// 	//console.log(obj)
		// 	this.form.bank_id = obj[0].value
		// 	this.form.bank_name = obj[0].label;
		// },
		submit:function(){
			
			this.$refs.uForm.validate(valid => {
				if (valid) {
					this.$u.api.cashSave(this.form).then(message=>{
						//console.log(message)
						if(message){
							this.$u.toast(message || 'Success')
							
							setTimeout(()=>{
								// this.$u.route('/pages/bankbind/index');
								this.goBack(1)
							},1000)
						}
						
					}).catch(err=>{})
				}
			});
			
		}
	},
	computed:{
		//渲染银行列表
		// selectAddressList:function(){
		// 	let tmp = []
		// 	this.bankList.forEach((item,index)=>{
		// 		tmp.push({label:item.name,value:item.id})
		// 	})
		// 	return tmp
		// }
	},
	onLoad:function(){
		this.checkLogin();
		this.getBankList(); //获取银行列表
	},
	onReady() {
		// this.$refs.uForm.setRules(this.rules)
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
