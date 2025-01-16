<template>
	<view class="container dark">
		<!--导航-->
		<u-navbar :border-bottom="false" :is-back="false" :background="{'background':'var(--tabbar-color)'}">
			<view class="slot-wrap bg-theme darkStyle">
				<view class="left" @click="leftMenu"></view>
				<view class="center">
					<span class="home-title">{{webConf.name}}</span>
				</view>
				<view class="right"></view>
			</view>
		</u-navbar>

		<view class="index-content-wrap">
			<view class="top-wrap-container">
				<!--轮播-->
				<view class="swiper-wrap">
					<home-swiper :list="bannerArr"></home-swiper>
				</view>

				<!--消息公告-->
				<view class="announce-wrap bg-theme" v-if="noticeList.length>0">
					<view class="v-exnoticebar-contianer darkStyle">
						<view class="notice-icon">
							<image class="notice-icon-image" src="@/static/images/common/speak.png" mode="widthFix">
							</image>
						</view>
						<view class="notice-content">
							<swiper class="swiper" autoplay vertical>
								<swiper-item v-for="(item,index) in noticeList" :key="index">
									<view class="swiper-item">
										<view>{{item.title}}</view>
									</view>
								</swiper-item>
							</swiper>
						</view>
						<view class="more" @click="$u.route('/pages/notice/index')">{{$t('index.more')}}</view>
					</view>
				</view>
				<view style="padding: 0px 30rpx;">
	
				</view>
				<!--行情-->
				<view class="rank-wrap">
					<currency-rank :list="top3"></currency-rank>
				</view>
				<!--快捷入口-->
				<!-- <view style="padding: 0px 30rpx;">
					<home-content></home-content>
				</view> -->

				<view class="options-wrap">
					<view class="navbar-wrap">
						<view class="nav-content-list">
							<view class="nav-item" @click.stop="$u.route(path.deposit)">
								<!-- <view class="nav-item" @click="goLicai">-->
								<image src="@/static/images/common/icon_alpha_dark.png" class="nav-item-image"
									mode="widthFix"></image>
								<view class="nav-item-text">{{$t('index.zhinenglicai')}}</view>
							</view>
							<!-- <view class="nav-item" @click="$u.route('/pages/index/notice/notice')"> -->
							<view class="nav-item" @click="$u.route('/pages/publication/index')">
								<image src="@/static/images/common/icon_partner_dark.png" class="nav-item-image"
									mode="widthFix"></image>
								<!-- <view class="nav-item-text">{{$t('index.fenxiang')}}</view> 新币发行 -->
								<view class="nav-item-text">{{$t('index.faxing')}}</view>
							</view>
							<view class="nav-item" @click="$u.route('/pages/help/center/center')">
								<image src="@/static/images/common/icon_chat_dark.png" class="nav-item-image"
									mode="widthFix"></image>
								<view class="nav-item-text">{{$t('index.bangzhu')}}</view>
							</view>
						</view>
					</view>
				</view>
				<!--涨幅榜-->
				<view class="list-wrap darkStyle">
					<view class="list-tabs-wrap">
						<ex-title :title="$t('index.zhangfubang')"></ex-title>
					</view>
					<view class="list-content-wrap">
						<v-extables :list="rankArr"></v-extables>
					</view>
				</view>
			</view>


		</view>

		<!--左边弹出层-->
		<left-collapse ref="leftMenuPanel"></left-collapse>

		<!--底部导航-->
		<lw-tabbar :current="0"></lw-tabbar>

		<uni-popup ref="popup" type="center" background-color="rgba(27, 44, 66, 1)">
			<div class="popup">
				<span>{{ noticeTitle }}</span>
				<div class="info">{{ noticeContent }}</div>
			</div>
		</uni-popup>
	</view>
</template>

<script>
	export default {
		onPullDownRefresh: function() {
			this.refresh()
		},
		data() {
			return {
				pageStatus: 'show',
				timer: null,
				top3: [],
				rankArr: [],
				bannerArr: [],
				noticeList: [],
				path: {
					deposit: '/pages/assets/deposit/index',
					withdraw: '/pages/assets/withdraw/index',
					service: this.webConf.serviceChat
				},
				noticeTitle: '',
				noticeContent: '',
			}
		},
		methods: {
			goLicai: function() {
				uni.switchTab({
					url: '/pages/template/index'
				})
			},
			getRank: async function() { //获取行情
				if (this.pageStatus != 'show') {
					clearTimeout(this.timer)
					return //页面隐藏时不请求
				}
				let res = await this.$u.api.getRank().catch(err => {})

				let tmp = []
				res[0].quotation.forEach(item => {
					if (item.is_display == 1 && item.open_coin_trade == 1) { //只需要币币交易
						tmp.push(item)
					}
				})
				this.rankArr = tmp
				this.top3 = tmp.slice(0, 3) //前三数据

				this.timer = setTimeout(() => {
					this.getRank()
				}, 2000)
			},
			leftMenu: function() {
				this.$refs['leftMenuPanel'].panel('show')
			},
			refresh: async function() { //刷新数据
				this.$refs['leftMenuPanel'] && this.$refs['leftMenuPanel'].getUserInfo() //刷新用户信息
				await this.getRank()
				setTimeout(() => {
					uni.stopPullDownRefresh()
				}, 1000)
			},
			getBanner: function() {
				
				// this.$u.popup.open()
				console.log([this.$u])

				//获取notice广告
				this.$u.api.getNews({
					c_id: 4,
					lang: uni.getStorageSync('lang') || 'en'
				}).then(res => {
					this.noticeList = res.list
				}).catch(err => {})

				//获取banner广告
				this.$u.api.getNews({
					c_id: 5,
					lang: uni.getStorageSync('lang') || 'en'
				}).then(res => {
					//console.log(res)
					let arr = []
					res.list.forEach(item => {
						arr.push(item.cover)
					})
					this.bannerArr = arr
				}).catch(err => {})
			}
		},
		
		mounted: function () {
			this.$u.api.getNotice().then(res => {
				console.log('res', res);
				this.noticeTitle = res.recommend_title
				this.noticeContent = res.recommend_content
				if (this.noticeTitle && this.noticeContent) {
					this.$refs.popup.open()
				}
			}).catch(err => {})
		},
		
		onLoad: function(){
			this.getBanner()

			uni.$once('langChange', (lang) => {
				//console.log('语言切换',lang)
				this.getBanner()
			})

		},
		onHide: function() {
			this.pageStatus = 'hide'
			this.$refs['leftMenuPanel'] && this.$refs['leftMenuPanel'].panel('hide')
			clearTimeout(this.timer)
		},
		onShow: function() {
			this.pageStatus = 'show'
			this.refresh()
		},
		beforeDestroy: function() {
			clearTimeout(this.timer)
	
	}
}
</script>

<style lang="scss" scoped>
	.popup {
		padding: 30px 20px;
		width: 358px;
		background: #1B2C42;
		border-radius: 7px;
		box-sizing: border-box;
		overflow: hidden;
		display: flex;
		flex-direction: column;
		align-items: center;

		span {
			width: 100%;
			font-size: 18px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #FFFFFF;
			display: flex;
			justify-content: center;
		}

		.info {
			width: 100%;
			font-size: 15px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #2BA693;
			line-height: 19px;
			display: flex;
			justify-content: center;
			margin-top: 22px;
		}

		.btn {
			width: 177px;
			height: 48px;
			background: #2BA693;
			border-radius: 6px;
			display: flex;
			align-items: center;
			justify-content: center;
			font-size: 18px;
			font-family: PingFang SC;
			font-weight: 400;
			color: #FFFFFF;
			margin-top: 22px;
		}
	}
</style>

<style scoped>
	>>>.u-slot-content {
		height: 100% !important;
	}

	.slot-wrap {
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 100%;
		height: 100%;
		padding: 0 30rpx;
	}

	.slot-wrap .left {
		width: 50rpx;
		height: 50rpx;
		background: url('@/static/images/common/user-default.png');
		background-size: 100% 100%;
	}

	.slot-wrap .center {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.slot-wrap.darkStyle .home-title {
		color: #ffffff !important;
	}

	.slot-wrap .center .home-title {
		color: var(--text-color);
		font-family: DIN-Regular-2;
		font-size: 38rpx;
		font-weight: 700;
		letter-spacing: 8rpx;
	}

	.slot-wrap .right {
		width: 50rpx;
		height: 50rpx;
	}

	.slot-wrap.darkStyle .right {
		width: 50rpx;
		height: 50rpx;
	}

	/*轮播*/
	.container .index-content-wrap {
		z-index: 100;
	}

	.container .index-content-wrap .top-wrap-container {
		padding-top: 40rpx;
	}

	.container .index-content-wrap .announce-wrap {
		margin: 20rpx 30rpx 0 30rpx;
		border-radius: 20rpx;
	}

	/*消息公告*/
	.v-exnoticebar-contianer {
		display: flex;
		justify-content: space-between;
		padding: 0 30rpx;
		background: var(--page-part-color);
	}

	.v-exnoticebar-contianer .notice-icon {
		margin-right: 14rpx;
		display: flex;
		align-items: center;
	}

	.v-exnoticebar-contianer .notice-icon .notice-icon-image {
		width: 40rpx;
	}

	.v-exnoticebar-contianer .notice-content {
		font-size: 24rpx;
		width: 100%;
		height: 88rpx;
		overflow: hidden;
		font-size: 22rpx;
		line-height: 88rpx;
	}

	.v-exnoticebar-contianer .notice-content .swiper-item {
		color: var(--text-color);
		font-size: 24rpx !important;
	}

	.v-exnoticebar-contianer .more {
		flex: 0 0 auto;
		font-size: 24rpx;
		display: flex;
		align-items: center;
		color: #FFC107;
		padding: 0 10rpx;
	}

	/*快捷按钮*/
	.container .index-content-wrap .options-wrap {
		margin: 30rpx 30rpx;
	}

	.container .index-content-wrap .options-wrap .navbar-wrap {
		margin-top: 30rpx;
	}

	.container .index-content-wrap .options-wrap .navbar-wrap .nav-content-list {
		display: flex;
		justify-content: space-between;
		flex-flow: row nowrap;
	}

	.container .index-content-wrap .options-wrap .navbar-wrap .nav-content-list .nav-item {
		flex: 1 0 33.3%;
		text-align: center;
	}

	.container .index-content-wrap .options-wrap .navbar-wrap .nav-content-list .nav-item .nav-item-image {
		width: 56rpx;
		height: 56rpx;
	}

	.container .index-content-wrap .options-wrap .navbar-wrap .nav-content-list .nav-item .nav-item-text {
		text-align: center;
		margin-top: 24rpx;
	}

	/*涨幅榜*/
	.container .index-content-wrap .list-wrap {
		z-index: 10;
	}

	.container .index-content-wrap .list-wrap.darkStyle {
		background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
		background-size: 100% 100%;
		background-size: cover;
		background-attachment: fixed;
	}
</style>
