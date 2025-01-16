<template>
	<view class="template-content-container dark">
		<lw-navbar :isBack="false" :title='$t("template.fundFinancial.default[0]")' :border-bottom="false"></lw-navbar>
		
		<view class="fund-wraps" style="width:100%;z-index:102;position:relative">
			<view class="fund-head">
				<view class="header-logo"></view>
			</view>
			<view v-for="(item,index) in list" :key="index" style="margin-bottom:68rpx;">
				<finance-card :name="item.name" :status="item.status" :statusName="item.status_name" :percent="item.percent" :content="item.content" :tips="item.tips" :link="item.path"></finance-card>
			</view>
		</view>
		
		<!--底部导航-->
		<lw-tabbar :current="3"></lw-tabbar>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			tabbar: [],
			currentTabbar: 3,
			background: {
				backgroundColor: "rgba(255, 255, 255, 0)"
			},
			list: []
		}
	},
	onShow: function() {
		this.list = [{
			name: this.$t("template.fundFinancial.default[2]"),
			status_name: this.$t("template.fundFinancial.default[1]"),
			status: 1,
			tips: this.$t("template.fundFinancial.default[4]"),
			percent: "30%",
			content: this.$t("template.fundFinancial.default[3]"),
			path: "/pages/finance/index"
		}/*, {
			name: this.$t("template.fundFinancial.default[6]"),
			status: 0,
			status_name: this.$t("template.fundFinancial.default[5]"),
			tips: this.$t("template.fundFinancial.default[8]"),
			percent: "20%",
			content: this.$t("template.fundFinancial.default[7]"),
			path: "/pages/rent/index/index"
		},*/
		]
	},
	computed: {},
	methods: {
		onTabbarChange: function(t) {
			var e = Number(t)
			  , n = this.tabbar[e].pagePath;
			this.switchTabTo(n)
		},
		gotoFinance: function() {
			this.navTo("/pages/finance/index")
		}
	}
}
</script>

<style lang="scss" scoped>
.waiting {
	margin: 0 auto;
	display: flex;
	height: 100rpx;
	align-items: center;
	justify-content: center;
	font-size: 40rpx;
	font-weight: 700;
	color: #fff3f7;
	background-color: rgba(255,217,210,.6);
	border-radius: 20rpx
}

.template-content-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	min-height: 100vh;
	background-color: #fff
}

.template-content-container .header-background {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	z-index: 100
}

.template-content-container .header-bg-fore {
	height: 1400rpx;
	width: 100%;
	position: absolute;
	top: 0;
	z-index: 100;
	background: url('@/static/images/common/fore.png') no-repeat;
	background-size: 100% 100%
}

.dark {
	background-image: url('@/static/images/common/dark-bg-setting.png');
	background-size: 100% 100%
}

.fund_item {
	margin-top: 60rpx;
	border-radius: 30rpx;
	width: 96%;
	height: 480rpx;
	background-image: url('@/static/images/common/fundFinancing.jpg');
	background-size: cover;
	position: relative
}

.fund_item .title {
	position: absolute;
	top: 100rpx;
	left: 40rpx;
	font-size: 48rpx;
	font-weight: 500;
	color: #fff
}

.logo {
	height: 200rpx;
	width: 200rpx;
	margin-top: 200rpx;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50rpx
}

.text-area {
	display: flex;
	justify-content: center
}

.title {
	font-size: 36rpx;
	color: #8f8f94
}

.fund-wraps {
	padding: 30rpx;
	margin-top: 40rpx
}

.fund-wraps .fund-item {
	background: hsla(0,0%,100%,.3);
	border-radius: 16rpx;
	margin-top: 20rpx
}

.fund-wraps .fund-item:first-child {
	margin-top: 0
}

.fund-wraps .fund-item .fund-content {
	padding: 30rpx
}

.fund-wraps .fund-item .fund-content .row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 10rpx
}

.fund-wraps .fund-item .fund-content .row:first-child {
	margin-top: 0
}

.fund-wraps .fund-item .fund-content .row .label {
	color: #fff;
	font-size: 26rpx;
	padding: 6rpx 30rpx;
	border-radius: 32rpx;
	font-weight: 700;
	background-color: #fff;
	color: #f86b53
}

.fund-wraps .fund-item .fund-content .row .label.green {
	background-color: #fff3f7;
	color: #a7776e
}

.fund-wraps .fund-item .fund-content .row .title {
	color: #fff;
	font-weight: 700
}

.fund-wraps .fund-item .fund-content .row .value {
	color: #1aa773;
	font-size: 50rpx;
	font-weight: 700
}

.fund-wraps .fund-item .fund-content .row .tips {
	color: #a7776e;
	background-color: #fff3f7;
	border-radius: 16rpx;
	padding: 10rpx 20rpx
}

.fund-wraps .fund-item .footer {
	font-size: 24rpx;
	padding: 10rpx 30rpx;
	display: flex;
	align-items: center;
	color: #a7776e;
	background-color: #fff3f7;
	border-bottom-left-radius: 16rpx;
	border-bottom-right-radius: 16rpx
}

.fund-wraps .fund-item .footer .span {
	display: inline-block;
	width: 100%
}
</style>
