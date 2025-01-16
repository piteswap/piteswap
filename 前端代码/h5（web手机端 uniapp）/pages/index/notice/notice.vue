<template>
	<view class="dark" v-if="isLogin">
		<lw-navbar :border-bottom="false" title='Publication'></lw-navbar>
		<view>
			<view class="content darkStyle">
				<view class="content-main">
					<view class="SbuTitle">
						<text>{{$t("template.fundFinancial.detail[7]")}}</text>
					</view>
					<view class="list-view-wraps" v-if="currencyTypesList.length > 0">
						<view class="listview" v-for="(item,index) in currencyTypesList" :key="index" v-if="item.faxing == 1">
							<view class="rowTop">
								<view class="rowOneleft">
									<!-- <u-image width="60rpx" height="60rpx" :src="webConf.staticUrl + item.currency_logo"></u-image> -->
									<text>{{item.faxing_name}}</text>
								</view>
								<view class="buyBtn" @click="$u.route('/pages/help/center/center')">Get</view>
							</view>

							<view class="rowcenter row-line">
								<view class="left">quantity</view>
								<view class="center">Begin</view>
								<view class="rig">End</view>
							</view>
							<view class="rowBottom row-line">
								<view class="left">{{item.faxing_num}}</view>
								<view class="center">{{item.faxing_begin}}</view>
								<view class="rig">{{item.faxing_end}}
								</view>
							</view>
						</view>
					</view>
					<view class="empty-wrap" v-else>
						<empty-container></empty-container>
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
				isLogin: false,
				currencyTypesList: [],
				loading: !1,
				financeDetail: {
					allprofit: 0,
					count: 0,
					profit: 0,
					sum: 0
				},
				offheaderTop: !1,
				show: !1,
				src: '@/static/images/usercenter/icon_default_user_img.png',
				path: {
					nickname: "/pages/settings/account/changeNickname",
					contact: "/pages/settings/account/contact",
					change: "/pages/settings/account/switch",
					email: "/pages/settings/account/email",
					buyPage: "/pages/finance/buyPage",
					cover: "/pages/template/index"
				}
			}
		},
		created: function() {
			this.init()
		},
		computed: {
			systemHeight: function() {
				return this.$store.state.systemInfo.windowHeight
			},
			userInfo: function() {
				return this.$store.state.userInfo
			},
			accountType: function() {
				return this.$store.state.accountType
			},
			accountTypeReverse: function() {
				return "mobile" === this.accountType ? "Email" : "Phone"
			},
			isCanUnbind: function() {
				return !this.$u.test.isEmpty(this.userInfo.email) && !this.$u.test.isEmpty(this.userInfo.mobile)
			}
		},
		onLoad: function() {
			if (!this.checkLogin()) {
				return
			}
			this.isLogin = true
		},
		onPullDownRefresh: function() {
			this.init()
			setTimeout(() => {
				uni.stopPullDownRefresh()
			}, 2000)
		},
		methods: {
			init: function() {
				this.currency_types()
				this.fetchFinanceDetail()
			},
			fetchFinanceDetail: async function() {
				let res = await this.$u.api.lHDepositReport().catch(err => {})
				this.financeDetail = res
			},
			gotoBuy: function(t) {
				var e = {
					id: t.id,
					currency_id: t.currency_id
				};
				this.$u.route({
					url: this.path.buyPage,
					params: e
				})
			},
			currency_types: async function() {
				let res = await this.$u.api.lHDepositProduct().catch(err => {})
				this.currencyTypesList = res
				console.log(res)
			},
			hideModal: function() {
				this.show = !1
			},
			gotoNext: function(t) {
				uni.navigateTo({
					url: t
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
	.content {
		z-index: 102;
		overflow: hidden
	}

	.content .content-main .list-view-wraps {
		min-height: 600rpx
	}

	.content.darkStyle .content-main .list-view-wraps {
		background: url('@/static/images/common/dark-bg-setting.png') no-repeat center bottom;
		background-size: contain
	}

	.content.darkStyle .header {
		color: var(--text-color);
		background: url('@/static/images/common/dark_bg.png') no-repeat;
		background-size: 100% 100%
	}

	.content.darkStyle .header .headerTop .rig {
		color: hsla(0, 0%, 100%, .6)
	}

	.content.darkStyle .header .headerTop .rig .rig-btn {
		background-color: rgba(27, 44, 66, .4) !important
	}

	.content.darkStyle .line {
		background-color: var(--border-color)
	}

	.content.darkStyle .headerTop {
		border-bottom: 1rpx solid var(--border-color)
	}

	.content.darkStyle .headerBottom {
		color: var(--text-color)
	}

	.content.darkStyle .listview {
		background-color: rgba(37, 68, 96, .5)
	}

	.content.darkStyle .listview .rowBottom {
		color: #e2e8e4
	}

	.content.darkStyle .listview .rowCenter {
		color: var(--text-color)
	}

	.listview {
		margin-bottom: 34rpx;
		height: 230rpx;
		width: 100%;
		padding: 20rpx 30rpx;
		background-color: rgba(45, 226, 180, .1)
	}

	.listview .rowTop {
		align-items: center;
		height: 100rpx;
		width: 100%;
		display: flex;
		flex-direction: row;
		justify-content: space-between
	}

	.listview .rowTop .rowOneleft {
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		height: 54rpx;
		line-height: 54rpx
	}

	.listview .rowTop .rowOneleft uni-text {
		height: 54rpx;
		line-height: 54rpx;
		margin-left: 22rpx
	}

	.listview .rowTop .buyBtn {
		height: 30rpx;
		line-height: 30rpx;
		width: 126rpx;
		height: 54rpx;
		line-height: 54rpx;
		text-align: center;
		background: linear-gradient(0deg,#FFC107,#FF9800);
		border-radius: 10rpx;
		color: #fff
	}

	.listview .row-line {
		display: flex;
		flex-direction: row
	}

	.listview .row-line .left {
		width: 334rpx;
		flex: 1 0 auto
	}

	.listview .row-line .center {
		flex: 1 0 auto;
		width: 184rpx
	}

	.listview .row-line .rig {
		flex: 1 0 auto;
		text-align: right;
		width: 178rpx
	}

	.listview .row-line.rowcenter {
		font-size: 24rpx;
		color: #a1a1a1
	}

	.listview .row-line.rowBottom {
		font-size: 30rpx;
		margin-top: 10rpx
	}

	.header {
		margin: 30rpx;
		background: url('@/static/images/common/bg_light.png') no-repeat;
		background-size: 100% 100%;
		border-radius: 24rpx;
		position: relative;
		color: #fff
	}

	.header .headerTop {
		height: 170rpx;
		display: flex;
		justify-content: space-between;
		flex-direction: row;
		padding: 30rpx
	}

	.header .headerTop .left {
		flex: 1 0 auto;
		display: flex;
		flex-flow: column nowrap
	}

	.header .headerTop .left uni-text:first-child {
		font-size: 30rpx;
		margin-bottom: 30rpx
	}

	.header .headerTop .rig {
		display: flex;
		flex-direction: row;
		align-items: flex-start;
		color: #fff
	}

	.header .headerTop .rig .ordersBtn {
		color: #fff;
		background-color: rgba(48, 143, 119, .4);
		width: 130rpx;
		height: 50rpx;
		line-height: 50rpx;
		text-align: center;
		border-radius: 50rpx
	}

	.header .headerTop .rig .ruleBtn {
		color: #fff;
		background-color: rgba(48, 143, 119, .4);
		width: 130rpx;
		height: 50rpx;
		line-height: 50rpx;
		text-align: center;
		margin-left: 20rpx;
		border-radius: 50rpx
	}

	.header .headerBottom {
		color: #fff;
		height: 130rpx;
		width: 100%;
		display: flex;
		flex-direction: row;
		justify-content: space-between
	}

	.header .headerBottom uni-text:first-child {
		margin-bottom: 8rpx
	}

	.header .headerBottom .left {
		display: flex;
		flex-direction: column;
		flex: 1;
		justify-content: center;
		text-align: center
	}

	.header .headerBottom .line {
		width: 1rpx
	}

	.header .headerBottom .midd {
		display: flex;
		flex-direction: column;
		flex: 1;
		justify-content: center;
		text-align: center
	}

	.header .headerBottom .rig {
		display: flex;
		flex-direction: column;
		flex: 1;
		justify-content: center;
		text-align: center
	}

	.slot-wrap {
		display: flex;
		align-items: center
	}

	.SbuTitle {
		height: 72rpx;
		line-height: 72rpx;
		width: 100%
	}

	.SbuTitle uni-text {
		margin-left: 30rpx
	}

	.empty-wrap {
		min-height: 600rpx;
		position: relative
	}
</style>
