<template>
	<view class="bg-theme finance-card-container darkStyle" @click="onClick">
		<view class="head">
			<view class="left-bar"></view>
			<view class="text-wrap"><text>{{name}}</text></view>
			<view class="right-bar"></view>
		</view>
		<view class="content">
			<view class="label-wrap">
				<view class="label">
					<view class="label-text" :class='{"in-progress":status == 1}'>
						<text class="span">{{statusName}}</text>
					</view>
				</view>
			</view>
			<view class="tips">{{tips}}</view>
			<view class="content-main">
				<view class="line-item">
					<view class="left">{{percent}}</view>
					<view class="right">{{content}}</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"finance-card",
	props: {
		name: {
			type: String,
			default: ""
		},
		statusName: {
			type: String,
			default: ""
		},
		tips: {
			type: String,
			default: ""
		},
		percent: {
			type: String,
			default: ""
		},
		content: {
			type: String,
			default: ""
		},
		status: {
			type: Number,
			default: 0
		},
		link: {
			type: String,
			default: ""
		}
	},
	data: function() {
		return {}
	},
	methods: {
		onClick: function() {
			this.$u.route(this.link)
		}
	}
}
</script>

<style lang="scss" scoped>
.finance-card-container {
	position: relative;
	box-shadow: 0 6rpx 48rpx 0 rgba(17,5,10,.1);
	border-radius: 90rpx 90rpx 40rpx 40rpx
}

.finance-card-container.darkStyle .head {
	background: #1e2027;
	background: url('@/static/images/common/header_bg.png') no-repeat;background-size: 100% 100%
}

.finance-card-container.darkStyle .content {
	background: #1d2e3d;
	border: 2rpx solid #30495e
}

.finance-card-container.darkStyle .content .tips {
	color: #768da9
}

.finance-card-container.darkStyle .content .content-main {
	background: transparent;
	border: 2rpx solid #ffc107
}

.finance-card-container.darkStyle .content .content-main .line-item .right {
	color: #fff
}

.finance-card-container .head {
	position: absolute;
	top: 0;
	left: 5%;
	transform: translateY(-50%);
	width: 90%;
	padding: 0 28rpx;
	height: 70rpx;
	border-radius: 40rpx;
	text-align: center;
	line-height: 70rpx;
	background: url('@/static/images/common/header_bg_light.png') no-repeat;
	background-size: 100% 100%;
	color: #fff;
	display: flex;
	align-items: center;
	justify-content: center
}

.finance-card-container .content {
	background-color: #f6fdfb;
	border-radius: 20rpx;
	padding: 30rpx;
	padding-top: 52rpx;
	border: 2rpx solid #bfdcdb
}

.finance-card-container .content .label-wrap {
	position: relative;
	height: 38rpx
}

.finance-card-container .content .label-wrap .label {
	position: absolute;
	font-size: 24rpx;
	margin-top: 30rpx;
	padding-left: 20rpx;
	padding-right: 30rpx;
	height: 38rpx;
	line-height: 38rpx;
	color: #fff;
	left: -30rpx;
	text-align: center;
	background: url('@/static/images/common/tips-label.png') no-repeat;background-size: 100% 100%
}

.finance-card-container .content .tips {
	font-size: 26rpx;
	color: #202020;
	padding: 40rpx 0;
	text-align: center
}

.finance-card-container .content .content-main {
	border-radius: 16rpx;
	padding: 20rpx;
	border: 2rpx solid #83ead1
}

.finance-card-container .content .content-main .line-item {
	display: flex;
	align-items: center;
	justify-content: space-between
}

.finance-card-container .content .content-main .line-item .left {
	padding: 0 30rpx;
	text-align: center;
	flex: 0 0 auto;
	color: #FFC107;
	font-weight: 700;
	font-size: 60rpx
}

.finance-card-container .content .content-main .line-item .right {
	flex: 1;
	color: #202020;
	text-align: center
}
</style>
