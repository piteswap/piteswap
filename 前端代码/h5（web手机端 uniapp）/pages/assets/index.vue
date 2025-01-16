<template>
	<view class="v-container-wrap dark" v-if="isLogin">
		<lw-navbar :isBack="false" :borderBottom="false" :title="$t('assets.index.title')"></lw-navbar>
		<top-tabs :current="current" :top="scrollTop" :isCheck="isCheck" :searchContent="searchContent" :list="list"
			@switchCheck="switchCheck" @onSearchChange="onSearchChange" @onTabClick="onTabClick"></top-tabs>

		<view class="asset-top-wrap">
			<view class="assets-top-content">
				<view class="assets-top-head darkStyle">
					<view class="account-total">
						<view class="top">{{$t("assets.index.zzczh")}}(USDT)</view>
						<view class="bottom">
							<view>{{getContext(totalAmount)}}</view>
							<view class="tips">≈{{getContext(totalConvert)}} {{pricingCurrency.toUpperCase()}}</view>
						</view>
						<view class="uid">UID: {{user.id || '----'}}</view>
					</view>
					<view class="hide-icon">
						<u-icon :name='encrypt ? "eye-off" : "eye"' size="40" @click="encryptText"></u-icon>
					</view>
				</view>
				<view class="assets-top-body">
					<view class="tabs-content">
						<swiper class="swiper" :style="{'height': swiperHeight}" :current="current"
							@change="handleSwiperChange">
							<swiper-item v-for="(item,index) in list" :key="index">
								<view class="swiper-item">
									<currency :info="item" :index="index" :isCheck="isCheck"
										:accountName="currentTabName" :searchContent="searchContent" :encrypt="encrypt"
										:pricing="pricingCurrency" @onSearchChange="onSearchChange"
										@switchCheck="switchCheck" @getHeight="getHeight"></currency>
								</view>
							</swiper-item>
						</swiper>
					</view>
				</view>
			</view>
		</view>


		<!--底部导航-->
		<lw-tabbar :current="4"></lw-tabbar>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isLogin: false,
				user: {},
				encrypt: !1,
				current: 0,
				scrollTop: 0,
				loading: !1,
				searchContent: "",
				pricingCurrency: "usd",
				swiperHeightList: [0, 0, 0],
				swiperHeight: 0,
				isCheck: false,
				timer: null,
				touchStartY: 0,
				list: [{
					name: 'assets.index.bbac',
					typename: 'change',
					type: 2,
					active: 0,
					balance: [],
					usdt_totle: 0
				}, {
					name: 'assets.index.hyac',
					typename: 'lever',
					type: 3,
					active: 1,
					balance: [],
					usdt_totle: 0
				}, {
					name: 'assets.index.qqac',
					typename: 'micro',
					type: 4,
					active: 2,
					balance: [],
					usdt_totle: 0
				}]
			};
		},
		onPageScroll: function(t) {
			var e = t.scrollTop;
			this.scrollTop = e
		},
		onPullDownRefresh: function() {
			this.init()
		},
		computed: {
			currentTabName: function() {
				var t;
				return (null === (t = this.list[this.current]) || void 0 === t ? void 0 : t.name) || "--"
			},
			totalAmount: function() {
				let total = 0

				this.list.forEach(item => {
					total += item.usdt_totle
				})

				return (total).toFixed(4)
			},
			totalConvert: function() {
				//转换usdt到usd(本地化货币)
				return this.totalAmount
			},
			systemInfo: function() {
				return this.$sysInfo
			},
			windowHeight: function() {
				return this.systemInfo.windowHeight
			},
			currentInfo: function() {
				return this.list[this.current] || {}
			}
		},
		onShow: function() {
			var t = this;
			this.show && this.init(),
				this.show = !0,
				uni.$on("onChange", (function() {
					t.init()
				}))
		},
		onHide: function() {
			uni.$off("onChange")
		},
		onLoad: function() {
			if (!this.checkLogin()) {
				return false
			}
			this.isLogin = true

			this.user = this.vuex_user

			var t = this,
				e = uni.getStorageSync("pricingMethod");
			e && (e = JSON.parse(e),
					this.pricingCurrency = e.code.toLowerCase()),
				this.show || (this.loading = !0,
					Promise.all([this.fetchData()]).then((function(e) {
						t.loading = !1
					})).catch((function(e) {
						t.loading = !1
					})))
		},
		methods: {
			onTouchStart: function(t) {
				this.touchStartY = t.changedTouches[0].clientY
			},
			onTouchEnd: function(t) {
				var e = 220;
				if (!(this.scrollTop > e)) {
					var a = t.changedTouches[0].clientY,
						n = a - this.touchStartY;
					n < 0 ? -n < e && uni.pageScrollTo({
						scrollTop: e,
						duration: 100
					}) : n > 0 && n < e && uni.pageScrollTo({
						scrollTop: 0,
						duration: 100
					})
				}
			},
			onSearchChange: function(t) {
				this.searchContent = t
			},
			switchCheck: function() {
				this.scrollToTop(),
					this.isCheck = !this.isCheck
			},
			setSwiperHeight: function(t) {
				var e = "calc(100vh - 44px - var(--status-bar-height))";
				this.swiperHeight = t < this.windowHeight - 200 ? e : t + "px"
			},
			getHeight: function(t) {
				var e = t.index,
					a = t.height;
				this.swiperHeightList[e] = a,
					e == this.current && this.setSwiperHeight(a)
			},
			init: function() {
				this.fetchData(),
					this.$refs.tabbar && this.$refs.tabbar.initTabbar()
			},
			handleTabChange: function(t) {
				this.current = t
			},
			fetchData: async function() {
				var t = this;
				let params = {
					currency_name: ''
				}

				const rankData = await this.$u.api.getRank().catch(err => {})
				const {
					quotation
				} = rankData[0]
				console.log('quotation', quotation);

				this.$u.api.walletList(params).then(res => {
					uni.stopPullDownRefresh()

					console.log('res', res);

					const {
						change_wallet,
						lever_wallet,
						micro_wallet
					} = res

					//币币
					let bibi = []
					let usdt_totle1 = 0
					if (change_wallet && change_wallet.balance) {
						change_wallet.balance.forEach(item => {
							if (item.is_match == 1) {
								const finded = quotation.find(element => element
									.currency_id === item.currency)
								console.log('finded', finded);
								item.usdt_price = finded ? finded.now_price : item
									.usdt_price
								bibi.push(item)

								usdt_totle1 += (item[this.list[0].typename + '_balance'] ? item[this
									.list[0].typename + '_balance'] * 1 : 0) * (item.usdt_price ?
									item.usdt_price * 1 : 0)
							}
						})
					}
					this.list[0].balance = bibi
					this.list[0].usdt_totle = usdt_totle1

					//合约
					let heyue = []
					let usdt_totle2 = 0
					if (lever_wallet && lever_wallet.balance) {
						lever_wallet.balance.forEach(item => {
							if (item.is_lever == 1) {
								const finded = quotation.find(element => element
									.currency_id === item.currency)
								console.log('finded', finded);
								item.usdt_price = finded ? finded.now_price : item
									.usdt_price
								heyue.push(item)

								usdt_totle2 += (item[this.list[1].typename + '_balance'] ? item[this
									.list[1].typename + '_balance'] * 1 : 0) * (item.usdt_price ?
									item.usdt_price * 1 : 0)
							}
						})
					}
					this.list[1].balance = heyue
					this.list[1].usdt_totle = usdt_totle2

					//期权
					let qiquan = []
					let usdt_totle3 = 0
					if (micro_wallet && micro_wallet.balance) {
						micro_wallet.balance.forEach(item => {
							if (item.is_micro == 1) {
								const finded = quotation.find(element => element
									.currency_id === item.currency)
								console.log('finded', finded);
								item.usdt_price = finded ? finded.now_price : item
									.usdt_price
								qiquan.push(item)

								usdt_totle3 += (item[this.list[2].typename + '_balance'] ? item[this
									.list[2].typename + '_balance'] * 1 : 0) * (item.usdt_price ?
									item.usdt_price * 1 : 0)
							}
						})
						console.log('usdt_totle3', usdt_totle3);
					}
					this.list[2].balance = qiquan
					this.list[2].usdt_totle = usdt_totle3

				}).catch(err => {})
			},
			encryptText: function() {
				this.encrypt = !this.encrypt,
					this.$forceUpdate()
			},
			getContext: function(t) { //隐藏数字
				if (!this.encrypt)
					return t;
				"string" != typeof t && (t = "" + t);
				var e = t.split("").length;
				return "*".repeat(e)
			},
			onChange: function(t) {
				this.current = Number(t),
					this.setSwiperHeight(this.swiperHeightList[t])
			},
			handleSwiperChange: function(t) {
				var e = t.detail.current;
				this.onChange(e)
			},
			scrollToTop: function() {
				uni.pageScrollTo({
					duration: 0,
					scrollTop: 0
				})
			},
			onTabClick: function(t) {
				this.onChange(t),
					this.scrollToTop()
			}
		}

	}
</script>

<style lang="scss" scoped>
	.v-container-wrap {
		background-color: #eaf1fe !important;
		width: 100%;

		.asset-top-wrap {
			position: relative;
			font-family: 'DIN-Regular-2';
			margin-top: 24rpx;

			.asset-top-bg {
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				height: 400rpx;
				background: url('@/static/images/common/ic_asset_top_bg.png') no-repeat;
				background-size: 100% 100%;
				background-color: #2bd3ab;
				border-radius: 0 0 16rpx 16rpx
			}

			.assets-top-content {
				z-index: 20;

				.assets-top-head {
					height: 260rpx;
					width: 100%;
					display: flex;
					justify-content: space-between;
					padding: 30rpx;
					color: #fff;
					margin-bottom: 30rpx;
					background: url('@/static/images/common/icon_bg_zc_light.png') no-repeat;
					background-size: 100% 100%;

					&.darkStyle {
						background: url('@/static/images/common/icon_bg_zc.png') no-repeat;
						background-size: 100% 100%
					}

					.uid {
						z-index: 1000;
						font-size: 26rpx;
						margin-top: 30rpx
					}

					.account-total {
						z-index: 20;
						color: #fff;

						.top {
							font-size: 28rpx;
							margin-bottom: 30rpx
						}

						.bottom {
							font-size: 34rpx;
							font-weight: 700;

							.tips {
								margin-top: 10rpx;
								font-size: 24rpx;
								color: hsla(0, 0%, 100%, .5);
								text-align: 2em
							}
						}
					}

					.hide-icon {
						.eye-icon {
							z-index: 20;
							width: 34rpx;
							height: 22rpx
						}
					}
				}

				.assets-top-body {
					.tabs-wrap {
						display: flex;
						justify-content: space-between;
						font-size: 30rpx;
						padding: 0 30rpx;

						.tabs-item {
							flex: 1;
							z-index: 20;
							text-align: center;
							color: rgba(255, 255, 255, 0.6);
							position: relative;
							padding: 26rpx 0;
							font-size: 28rpx;
							font-weight: 500;
							overflow: hidden;

							&.darkStyle {
								&.active {
									color: #000;
									font-size: 28rpx;
									font-weight: 800;

									&::after {
										content: " ";
										position: absolute;
										width: 16rpx;
										height: 16rpx;
										bottom: 0;
										left: 50%;
										border-radius: 50%;
										transform: translateX(-50%);
										transform: translateY(50%);
										background-color: var(--page-part-color)
									}
								}
							}

							&.active {
								color: #000;

								&::after {
									content: " ";
									position: absolute;
									width: 16rpx;
									height: 16rpx;
									bottom: 0;
									left: 50%;
									border-radius: 50%;
									transform: translateX(-50%);
									transform: translateY(50%);
									background-color: #fff
								}
							}
						}
					}

					.tabs-content .swiper {
						.uni-swiper-wrapper {
							overflow: auto
						}

						uni-swiper-item {
							overflow: visible
						}

						.swiper-item {
							padding: 0 30rpx
						}
					}
				}

			}
		}
	}

	.v-container-wrap.dark {
		background-color: var(--page-background-color) !important;

		.u-status-bar {
			background-color: var(--page-background-color) !important
		}
	}

	.swiper {
		height: auto;
		padding-bottom: 20rpx
	}

	.uni-swiper-wrapper {
		font-size: 40rpx
	}
</style>
