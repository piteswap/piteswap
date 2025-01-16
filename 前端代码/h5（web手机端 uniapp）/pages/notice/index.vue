<template>
	<view class="v-notice-container dark">
		<lw-navbar></lw-navbar>
		<view class="v-notice-wrap">
			<view class="bg-theme tabs-box">
				<ex-tabs-wrap :border-bottom="false" :list="[$t('notice.gonggao'),$t('notice.xiaoxi')]"
					@change="tabsChange"></ex-tabs-wrap>
			</view>
			<u-cell-group class="setting-item" :border="false" v-if="list.length>0">
				<u-cell-item :title="item.title" v-for="(item,index) in list" :key="index" :index="index"
					@click="openLink(item)"></u-cell-item>
			</u-cell-group>
			<view class="empty-wrap bg-theme" :style="'height:calc(100vh - '+emptyMarginTop+'px)'" v-else>
				<empty-container></empty-container>
			</view>
		</view>
		<mask-modal ref="modal" :text="modalText" :footer="false" html></mask-modal>
	</view>
</template>

<script>
	export default {
		onPullDownRefresh: function() {
			this.getList()
		},
		data() {
			return {
				typeIndex: 0,
				emptyMarginTop: 0,
				modalText: '',
				list: []
			};
		},
		methods: {
			showModal: function(item) {
				this.modalText = item.title
				this.$refs.modal.panel('show')
			},
			openLink: function(item) {
				var t = {
					id: item.id,
					title: item.title
				};
				this.$u.route('/pages/help/center/detail', t)
			},
			tabsChange: function(obj) {
				//console.log(obj)
				this.typeIndex = obj.index
				this.list = []
				this.getList()
			},
			getList: function() {
				if (this.typeIndex == 0) { //获取新闻
					this.$u.api.getNews({
						c_id: 4,
						lang: uni.getStorageSync('lang') || 'en'
					}).then(res => {
						uni.stopPullDownRefresh()
						this.list = res.list
					}).catch(err => {
						uni.stopPullDownRefresh()
					})
				} else { //获取消息
					uni.stopPullDownRefresh()
				}

			}
		},
		onLoad: function() {
			this.getList()
		},
		onReady: function() {
			this.$u.getRect('.tabs-box').then(res => {
				//console.log(res);
				this.emptyMarginTop = res.bottom
			})
	
	}
}
</script>

<style lang="scss">
	.empty-wrap {
		background-color: #fff;
		position: relative;
		margin-top: 20rpx;
	}
</style>
