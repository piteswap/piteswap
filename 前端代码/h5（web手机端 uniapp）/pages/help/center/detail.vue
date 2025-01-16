<template>
	<view class="v-help-detail-container dark">
		<lw-navbar :border-bottom="false" :title='title || webConf.name'></lw-navbar>
		<view class="help-detail-content">
			<view class="help-detail-main">
				<view class="help-detail-title bg-theme">
					{{title}}
				</view>
				<view class="userInfo bg-theme">
					<view class="left">
						<u-avatar class="user-avatar" src="@/static/images/common/icon_gesture_avera_dark.png" :show-level="true"></u-avatar>
					</view>
					<view class="right">
						<view class="name">{{info.author}}</view>
						<view class="time"> </view>
					</view>
				</view>
				<view class="content bg-theme">
					<u-parse :html="info.content" :selectable="true" @linkpress="onLinkPress"></u-parse>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			id: null,
			title: "",
			info: {},
			loading: !1,
			logo: null
		}
	},
	onLoad: function(t) {
		this.id = t.id,
		this.title = t.title,
		this.fetchDetail()
	},
	methods: {
		onLinkPress: function(t) {
			var e = t.href
			  , i = t.ignore;
			i(),
			e && this.openUrl(e)
		},
		openUrl:function(link){
			// #ifdef H5
			window.open(link)
			// #endif
			// #ifndef H5
			plus.runtime.openURL(link)
			// #endif
		},
		fetchDetail: function() {
			this.$u.api.zy().then(res=>{
				// console.log(res)
				// if(res == 'en'){
				// 	this.id = 199
				// }else{
				// 	this.id = 195
				// }
				this.$u.api.getNewsDetail({id:this.id}).then(res=>{
					this.info = res,
					this.title = res.title
				}).catch(err=>{})
			}).catch(err=>{})
			
			// this.$u.api.getNewsDetail({id:this.id}).then(res=>{
			// 	this.info = res,
			// 	this.title = res.title
			// }).catch(err=>{})
		}
	}
}
</script>

<style lang="scss" scoped>
.v-help-detail-container .help-detail-content {
	background-color: #fff
}

.v-help-detail-container .help-detail-content .help-detail-main .help-detail-title {
	font-size: 40rpx;
	font-weight: 700;
	padding: 20rpx 30rpx
}

.v-help-detail-container .help-detail-content .help-detail-main .userInfo {
	display: flex;
	align-items: center;
	padding: 0 30rpx
}

.v-help-detail-container .help-detail-content .help-detail-main .userInfo .left {
	flex: 0 0 auto
}

.v-help-detail-container .help-detail-content .help-detail-main .userInfo .right {
	margin-left: 20rpx
}

.v-help-detail-container .help-detail-content .help-detail-main .userInfo .right .name {
	color: #0171ee
}

.v-help-detail-container .help-detail-content .help-detail-main .userInfo .right .time {
	margin-top: 10rpx;
	color: #666
}

.v-help-detail-container .help-detail-content .help-detail-main .content {
	padding: 30rpx;
	line-height: 40rpx
}
</style>
