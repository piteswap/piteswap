<template>
	<view class="dark">
		<lw-navbar :title="$t('settings.security.aqzx')"></lw-navbar>
		<u-cell-group class="setting-item" :border="false">
			<u-cell-item :title="$t('settings.security.xgdlmm')" @click="$u.route('/pages/settings/security/changePassword')" >
				<view slot="right-icon"></view>
			</u-cell-item>
			<u-cell-item :title="$t('settings.security.xgjymm')" @click="$u.route('/pages/settings/security/changePayPassword')" >
				<view slot="right-icon"></view>
			</u-cell-item>
		</u-cell-group>
	</view>
</template>
<script>
export default {
	data() {
		return {
			uinfo:{}
		};
	},
	methods:{
		
	},
	onLoad:function(){
		if(!this.checkLogin()){
			return
		}
	}
}
</script>

<style lang="scss" scoped>
.green{
	color:var(--brand-color);
}
.orange{
	color:orange
}
.fail{
	color:#fc6668
}
</style>
