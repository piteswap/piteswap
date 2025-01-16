<template>
	<view>
		<web-view :src="customer_url"></web-view>
		<!-- <web-view :src="webConf.serviceChat"></web-view> -->
	</view>
</template>

<script>
export default {
	data() {
		return {
			customer_url:''
		};
	},
	onLoad:function(){
		this.$u.api.getCon({}).then(res => {
			console.log(res)
			this.customer_url = res.customer_url
		})
	}
} 
</script>

<style lang="scss" scoped>

</style>

