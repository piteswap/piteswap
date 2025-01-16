<template>
	<view class="v-help-container v-help-container-dark dark">
		<lw-navbar :border-bottom="false" :title='$t("helpCenter.title")'></lw-navbar>

		<view class="v-help-header v-help-header-dark">
			<view class="statusbar-height" style="height:calc(44px + var(--status-bar-height))"></view>
			<view class="title">
				<view class="title-text title-color-dark">{{$t("helpCenter.title")}}</view>
				<image class="title-image" mode="widthFix" src="@/static/images/common/logo_icon.png"></image>
			</view>
			<view class="method-btn">
				<view class="btns">
					<view class="btn" @click="goChat">
						<image class="btn-image" mode="widthFix" src="@/static/images/common/icon_chat_dark.png">
						</image>
						<view class="btn-text">{{$t("helpCenter.labels[1]")}}</view>
					</view>
				</view>
			</view>
		</view>

		<view class="help-container">
			<view class="help-container-head">
				<text class="span help-title-text">{{$t("helpCenter.labels[2]")}}</text>
			</view>
			<view class="help-container-main">
				<view class="help-box help-box-dark">
					<view class="help-box-left">
						<image class="help-box-icon" mode="widthFix" src="@/static/images/common/help_ico.png"></image>
						<text class="span help-box-text">{{$t("helpCenter.labels[4]")}}</text>
					</view>
					<view class="help-box-right">
						<view class="help-box-item" v-for="(item,index) in list" :key="index"
							@click.stop="gotoDetail(item)">
							<text class="span box-text">{{item.title}}</text>
						</view>
					</view>
				</view>
			</view>
		</view>

	</view>
</template>

<script>
	export default {
		data: function() {
			return {
				list: [],
				loading: !1,
				background: {
					background: "rgba(255, 255, 255, 0)"
				},
				path: {
					detail: "/pages/help/center/detail",
					chat: "/pages/help/center/chat"
				},
				customer_url: ''
			}
		},
		onPullDownRefresh: function() {
			var e = this;
			this.loading = !0,
				Promise.all([this.fetchHelpList()]).then((function(t) {
					e.loading = !1,
						uni.stopPullDownRefresh()
				}))
		},
		onLoad: function() {
			var e = this;
			this.loading = !0,
				Promise.all([this.fetchHelpList()]).then((function(t) {
					e.loading = !1
				}))

			this.$u.api.getCon({}).then(res => {
				console.log(res)
				this.customer_url = res.customer_url
			})
		},
		methods: {
			fetchHelpList: function() {
				this.$u.api.getNews({
					c_id: 19,
					limit: 50,
					lang: uni.getStorageSync('lang') || 'en'
				}).then(res => {
					this.list = res.list
				}).catch(err => {})
			},

			openUrl: function(e) {
				e = encodeURI(e)
				// #ifdef APP-PLUS
				plus.runtime.openURL(e)
				// #endif
				// #ifndef APP-PLUS
				window.open(e)
				// #endif
			},

			goChat: function() {
				// if(this.webConf.serviceChatOpenType=='blank'){
				// this.openUrl(this.webConf.serviceChat)
				// this.openUrl(this.customer_url) 
				// }else{
				// 	this.$u.route(this.path.chat)
				// }
				this.$u.route(this.path.chat)
			},

			gotoDetail: function(e) {
				var t = {
					id: e.id,
					title: e.title
				};
				this.$u.route(this.path.detail, t)
			}
		}
	}
</script>

<style lang="scss" scoped>
	.navback {
		padding: 30rpx
	}

	.v-help-container.v-help-container-dark .method-btn {
		color: #768da9;
		background-color: #18171a
	}

	.v-help-container.v-help-container-dark .help-container {
		color: #e2e8e4;
		background-color: #18171a
	}

	.v-help-container.v-help-container-dark .help-container .help-container-main {
		color: #f3f3f3;
		background-color: #18171a
	}

	.v-help-container.v-help-container-dark .help-container .help-container-main .help-box-dark {
		border-color: #2e4968
	}

	.v-help-container.v-help-container-light .method-btn {
		color: #202020;
		background-color: #f0fdfa
	}

	.v-help-container .v-help-header {
		background-color: #fff;
		height: 330rpx;
		position: fixed;
		top: 0;
		width: 100%;
		z-index: 99
	}

	.v-help-container .v-help-header .title {
		padding: 0 30rpx;
		display: flex;
		justify-content: space-between;
		align-items: flex-end;
		position: relative
	}

	.v-help-container .v-help-header .title .title-text {
		height: 160rpx;
		line-height: 160rpx;
		font-size: 36rpx
	}

	.v-help-container .v-help-header .title.title-color-light {
		color: #202020
	}

	.v-help-container .v-help-header .title.title-color-dark {
		color: #eee
	}

	.v-help-container .v-help-header .title .title-image {
		width: 160rpx;
		height: 164rpx;
		position: absolute;
		right: 48rpx;
		bottom: 0;
		transform: translateY(10%)
	}

	.v-help-container .method-btn {
		background-color: #e0fbf4;
		margin: 0 30rpx;
		border-radius: 16rpx
	}

	.v-help-container .method-btn .btns {
		display: flex;
		justify-content: space-around;
		align-items: center;
		height: 170rpx
	}

	.v-help-container .method-btn .btns .btn {
		text-align: center
	}

	.v-help-container .method-btn .btns .btn .btn-image {
		width: 64rpx;
		height: 64rpx
	}

	.v-help-container .method-btn .btns .btn .btn-text {
		text-align: center;
		font-size: 24rpx
	}

	.v-help-container .help-container {
		padding: 0 30rpx;
		padding-top: 330rpx
	}

	.v-help-container .help-container .help-container-head {
		display: flex;
		justify-content: space-between
	}

	.v-help-container .help-container .help-container-head .help-title-text {
		font-size: 34rpx;
		height: 100rpx;
		line-height: 100rpx
	}

	.v-help-container .help-container .help-container-head .help-head-more {
		color: #FFC107;
		font-size: 24rpx;
		display: flex;
		align-items: center
	}

	.v-help-container .help-container .help-container-main {
		background-color: #f0fdfa;
		border-radius: 16rpx;
		box-shadow: 0 .05333rem .26667rem rgba(0, 0, 0, .09);
		padding: 0 10rpx
	}

	.v-help-container .help-container .help-container-main .help-box {
		display: flex;
		border-bottom: 2rpx solid #dfeded;
		align-items: flex-start;
	}

	.v-help-container .help-container .help-container-main .help-box .help-box-left {
		flex-direction: 0 0 auto;
		display: flex;
		flex-flow: column wrap;
		align-items: center;
		justify-content: center;
		width: 160rpx;
		min-height: 200rpx
	}

	.v-help-container .help-container .help-container-main .help-box .help-box-left .help-box-icon {
		width: 90rpx;
		height: 90rpx
	}

	.v-help-container .help-container .help-container-main .help-box .help-box-left .help-box-text {
		margin-top: 10rpx;
		width: 100%;
		font-size: 24rpx;
		text-align: center;
		width: 148rpx;
		line-height: 34rpx
	}

	.v-help-container .help-container .help-container-main .help-box .help-box-right {
		display: flex;
		flex-flow: column wrap;
		justify-content: center;
		min-height: 200rpx;
		width: calc(100% - 180rpx);
	}

	.v-help-container .help-container .help-container-main .help-box .help-box-right .help-box-item {
		height: 104rpx;
		margin-left: 20rpx;
		display: flex;
		align-items: center;
		border-bottom: 1rpx dashed rgba(118, 141, 169, .5);
		width: 100%;
	}

	.v-help-container .help-container .help-container-main .help-box .help-box-right .help-box-item:last-child {
		border-bottom: none;
	}

	.v-help-container .help-container .help-container-main .help-box .help-box-right .help-box-item .box-text {
		font-size: 28rpx;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}

	.v-help-container .v-help-header-dark {
		background-color: #18171a
	}

	.help-box-light .box-text {
		font-size: 24rpx;
		color: #a1a1a1
	}
</style>
