<template>
	<view class="dark">
		<lw-navbar :title="$t('verification.sfrz')"></lw-navbar>
		<u-cell-group class="setting-item" :border="false">
			<u-cell-item :title="$t('verification.smrz')" @click="uinfo.review_status==0 && $u.route('/pages/verification/basic')" :arrow="false" :hover-class="uinfo.review_status>0 ? 'none' : ''">
				<view slot="right-icon">
					<view class="smrz green" v-if="uinfo.review_status==2 || uinfoGj.review_status>0"><u-icon name="checkmark-circle-fill" size="30"></u-icon>{{$t('verification.yrz')}}</view><!--有高级认证信息说明初级一定通过了-->
					<view class="smrz orange" v-else-if="uinfo.review_status==1">{{$t('verification.shz')}}</view>
					<view class="smrz fail" v-else><u-icon name="error-circle-fill" size="30"></u-icon>{{$t('verification.wrz')}}</view>
				</view>
			</u-cell-item>
			<u-cell-item :title="$t('verification.smrzgj')" @click="uinfoGj.review_status==0 && $u.route('/pages/verification/advanced')" :arrow="false" :hover-class="uinfoGj.review_status>0 ? 'none' : ''">
				<view slot="right-icon">
					<view class="smrz green" v-if="uinfoGj.review_status==2"><u-icon name="checkmark-circle-fill" size="30"></u-icon>{{$t('verification.yrz')}}</view>
					<view class="smrz orange" v-else-if="uinfoGj.review_status==1">{{$t('verification.shz')}}</view>
					<view class="smrz fail" v-else><u-icon name="error-circle-fill" size="30"></u-icon>{{$t('verification.wrz')}}</view>
				</view>
			</u-cell-item>
		</u-cell-group>
	</view>
</template>
<script>
export default {
	data() {
		return {
			uinfo:{},
			uinfoGj:{}
		};
	},
	methods:{
		userCenter:function(){
			this.$u.api.userCenter().then(res=>{
				this.uinfo = res
			}).catch(err=>{})
		},
		userCenter2:function(){
			this.$u.api.userCenter2().then(res=>{
				this.uinfoGj = res
			}).catch(err=>{})
		}
	},
	onLoad:function(){
		this.checkLogin()
		this.userCenter()
		this.userCenter2()
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
