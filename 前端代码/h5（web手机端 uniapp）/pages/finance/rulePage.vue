<template>
	<view class="dark">
		<lw-navbar :title='$t("template.financialRule.default[1]")' :border-bottom="false"></lw-navbar>
		
		<view class="rule-content-container darkStyle" style="position:absolute;top:0;width:100%">
			<view class="padd" :style='{"height":"calc(44px + var(--status-bar-height) + 1px)"}'></view>
			<view class="topText">
				<view class="title">{{$t("template.financialRule.content[0]")}}</view>
				<view class="text">{{$t("template.financialRule.content[1]")}}</view>
			</view>
			<view class="card bg-theme darkStyle">
				<text class="title">{{$t("template.financialRule.highlight[0]")}}</text>
				<view class="imginfoRow">
					<view class="left">
						<u-image width="116rpx" height="116rpx" src="@/static/images/common/finance1.png"></u-image>
						<view class="info-wrap">
							<view class="inf-item">{{$t("template.financialRule.highlight[1]")}}</view>
							<view class="inf-item">{{$t("template.financialRule.highlight[2]")}}</view>
						</view>
					</view>
					<view class="rig">
						<u-image width="116rpx" height="116rpx" src="@/static/images/common/finance2.png"></u-image>
						<view class="info-wrap">
							<view class="inf-item">{{$t("template.financialRule.highlight[3]")}}</view>
							<view class="inf-item">{{$t("template.financialRule.highlight[4]")}}</view>
						</view>
					</view>
				</view>
				
				<view class="bottomInfo">
					<text class="textblock">{{$t("template.financialRule.highlight[5]")}}</text>
					<text class="textblock">{{$t("template.financialRule.highlight[6]")}}</text>
					<text class="textblock">{{$t("template.financialRule.highlight[7]")}}</text>
				</view>
			</view>
			<view class="rule-content-item" style="color:white">
				<view class="title">
					<ex-title :title='$t("template.financialRule.count[0]")'></ex-title>
				</view>
				<view class="rule-content">{{$t("template.financialRule.count[1]")}}</view>
			</view>
			<view class="button-wrap">
				<ex-button-wrap theme="primary" className="circle large darkStyle" :text='$t("template.financialRule.default[0]")' @click="toBuy"></ex-button-wrap>
			</view>
		</view>
		
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			loading: !1,
			show: !1,
			src: "@/static/images/usercenter/icon_default_user_img.png",
			path: {
				finance: "/pages/finance/index"
			}
		}
	},
	onLoad: function() {
		if(!this.checkLogin()){
			return
		}
	},
	methods: {
		toBuy:function(){
			uni.redirectTo({
				url:this.path.finance
			})
		}
	}
}
</script>

<style lang="scss" scoped>
.rule-content-container {
	width: 100%;
	min-height: 100vh
}

.rule-content-container.darkStyle {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%
}

.imginfoRow {
	margin-top: 30rpx;
	margin-bottom: 30rpx;
	padding: 0 30rpx;
	display: flex;
	flex-direction: row;
	align-items: center;
	font-size: 28rpx!important
}

.imginfoRow .info-wrap {
	margin-left: 28rpx;
	color: #fff
}

.imginfoRow .info-wrap .inf-item:first-child {
	font-weight: 700
}

.imginfoRow .left {
	flex: 1;
	display: flex;
	flex-direction: row;
	align-items: center
}

.imginfoRow .rig {
	flex: 1;
	display: flex;
	flex-direction: row;
	align-items: center
}

body.pages-finance-index body.pages-finance-rulePage uni-page-body {
	color: #051260!important
}

.topText {
	padding: 30rpx 30rpx 60rpx 30rpx
}

.topText .title {
	font-size: 32rpx;
	text-align: center;
	margin-bottom: 30rpx;
	font-weight: 700;
	line-height: 40rpx;
	background: linear-gradient(0deg,#2a6972,#ffc107 99.38964844%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent
}

.topText .text {
	font-size: 24rpx;
	padding-bottom: 34rpx
}

.card {
	margin-top: 50rpx;
	border-radius: 10rpx;
	position: relative;
	padding-top: 20rpx;
	margin: -60rpx 30rpx 30rpx 30rpx;
	background: url('@/static/images/common/icon_bg.png') no-repeat;
	background-size: 100% 100%
}

.card.darkStyle {
	background: url('@/static/images/common/icon_bg_dark.png') no-repeat;
	background-size: 100% 100%
}

.card.darkStyle .title {
	color: #FFC107
}

.card.darkStyle .bottomInfo .textblock {
	border: 4rpx solid #768da9;
	color: var(--text-color)
}

.card.darkStyle .imginfoRow .info-wrap .inf-item:last-child {
	color: var(--text-color)
}

.card .title {
	padding: 0 34rpx;
	margin-top: 34rpx;
	font-size: 24rpx;
	font-weight: 700
}

.bottomInfo {
	display: flex;
	justify-content: space-around;
	flex-direction: row;
	background-color: var(--page-part-dark);
	border-bottom-left-radius: 20rpx;
	border-bottom-right-radius: 20rpx;
	color: #fff;
	padding: 20rpx 10rpx
}

.bottomInfo .textblock {
	border: 4rpx solid #fff;
	margin-right: 8rpx;
	padding: 4rpx;
	border-radius: 24rpx;
	font-size: 24rpx;
	text-align: center;
	color: #fff
}

.bottomInfo .textblock /deep/ span {
	display: inline-block;
	transform: scale(.9)
}

.rule-content-item {
	padding: 30rpx;
	background-color: var(--page-part-color);
	margin-bottom: 20rpx
}

.rule-content-item .title {
	font-size: 28rpx;
	color: var(--text-color);
	font-weight: 700;
	margin-bottom: 30rpx
}

.rule-content-item .rule-content {
	color: #83869d;
	font-size: 24rpx;
	line-height: 38rpx
}

.button-wrap {
	margin-top: 60rpx;
	margin-left: 30rpx;
	margin-right: 30rpx;
	padding-bottom: 60rpx
}
</style>
