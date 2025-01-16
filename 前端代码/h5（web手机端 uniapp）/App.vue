<script>
	export default {
		globalData: {
			version: '1.0.0'
		},
		onLaunch() {
			//#ifdef APP-PLUS
			plus.screen.lockOrientation('portrait-primary'); // 强制竖屏
			//#endif
			uni.hideTabBar()
			// this.$u.api.setLang()
			/*
			uni.showModal({
				content:'如测试有问题收集起来集中反馈',
				showCancel:false
			})*/
		}
	}
</script>

<style lang="scss">
	@import "uview-ui/index.scss";
	@import "common/common.scss";
	uni-app,uni-page,uni-page-body{
		background: #18171a;
	}
</style>