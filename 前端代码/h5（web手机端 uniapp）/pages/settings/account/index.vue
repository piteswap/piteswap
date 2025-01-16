<template>
	<view class="dark">
		<lw-navbar :title="$t('settings.account.title')"></lw-navbar>
		<u-cell-group class="setting-item" :border="false" :title="$t('settings.account.grxxsz')">
			<!--<u-cell-item :title="$t('settings.account.nicheng')" :value="user.name || user.account_number"></u-cell-item>-->
			<u-cell-item title="UID" :arrow="false" hover-class="none" :value="user.id"></u-cell-item>
			<u-cell-item :title="$t('settings.account.zhanghao')" :arrow="false" hover-class="none" :value="user.account_number"></u-cell-item>
			<u-cell-item :title="$t('settings.account.shoujihao')" :arrow="false" hover-class="none" :value="user.phone || '-'"></u-cell-item>
			<u-cell-item :title="$t('settings.account.youxiang')" :arrow="false" hover-class="none" :value="user.email || '-'"></u-cell-item>
		</u-cell-group>
		<view class="btn-wrap">
			<ex-button-wrap theme="blank" class-name="circle large darkStyle" @click="$u.throttle(exitBtn, 500)" :text="$t('settings.account.tuichu')" :plain="true"></ex-button-wrap>
		</view>
		<view class="bg-theme">
			<mask-modal ref="sureModal" :text="$t('settings.account.tuichuqueren')" @action="tapModal"></mask-modal>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			user:{}
		};
	},
	onLoad:function(){
		this.user = this.vuex_user
		this.checkLogin()
	},
	methods:{
		exitBtn:function(){
			this.$refs['sureModal'].panel('show')
		},
		tapModal:function(type){
			if(type=='confirm'){
				this.$u.vuex('vuex_token','')
				this.$u.vuex('vuex_user','{}')
				uni.reLaunch({
					url:'/pages/index/index'
				})
			}
		}
	}
}
</script>

<style lang="scss">
.dark {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
}
.btn-wrap {
	margin-top: 90rpx;
	padding: 0 24rpx;
}
</style>
