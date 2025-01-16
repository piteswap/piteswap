<template>
	<view class="v-container-wrap">
		<view class="ex-icon" :class='[name,size,"dark" == theme ? "darkStyle" : "lightStyle",name+"-"+theme]' @click="click"></view>
	</view>
</template>

<script>
export default {
	name:"ex-icon",
	props: {
		name: {
			type: String,
			default: "copy"
		},
		size: {
			type: String,
			default: "normal"
		}
	},
	data: function() {
		return {
			theme:'dark'
		}
	},
	methods: {
		click: function(e) {
			this.$emit("on-click")
		}
	}
}
</script>

<style lang="scss" scoped>
.v-container-wrap {
	z-index: 100;
	display: inline-block
}

.v-container-wrap .ex-icon {
	display: inline-block;
	width: 40rpx;
	height: 40rpx
}

.v-container-wrap .ex-icon.small {
	width: 30rpx;
	height: 30rpx
}

.v-container-wrap .ex-icon.copy {
	background: url('@/static/images/common/copy.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.arrow-right {
	background: url('@/static/images/common/arrow-right.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.back {
	background: url('@/static/images/common/back.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.back.red {
	background: url('@/static/images/common/back-red.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.back-light {
	background: url('@/static/images/common/back-light.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.back-dark {
	background: url('@/static/images/common/back-dark.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.redBack {
	background: url('@/static/images/common/redBack.png') no-repeat;background-size: 100% 100%
}
.v-container-wrap .ex-icon.del-light {
	background: url('@/static/images/common/del-light.png') no-repeat;background-size: 100% 100%
}
.v-container-wrap .ex-icon.del {
	background: url('@/static/images/common/del.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.exchange {
	position: relative;
	background: #fff;
	border-radius: 50%;
	box-shadow: 0 0 20rpx #e6e6e6;
	width: 80rpx;
	height: 80rpx
}

.v-container-wrap .ex-icon.exchange::after {
	z-index: 10;
	content: " ";
	position: absolute;
	background: url('@/static/images/common/exchange.png') no-repeat;background-size: 100% 100%;
	width: 48rpx;
	height: 48rpx;
	top: 16rpx;
	left: 16rpx
}

.v-container-wrap .ex-icon.scan {
	background: url('@/static/images/common/scan.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.addr {
	background: url('@/static/images/common/addr.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.history {
	background: url('@/static/images/common/history.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.quotation {
	background: url('@/static/images/common/quotation.png') no-repeat;background-size: 100% 100%
}

.v-container-wrap .ex-icon.flash {
	background: url('@/static/images/common/flash.png') no-repeat;background-size: 100% 100%
}

.transfer-btn .darkStyle {
	background: linear-gradient(#ffd314,#ebb905)!important;
	box-shadow: none!important
}

.transfer-btn .darkStyle::after {
	background: url('@/static/images/common/transfer-btn.png') no-repeat!important;background-size: 100% 100%!important
}

.back-icon .ex-icon.lightStyle {
	background: url('@/static/images/common/back-icon.png') no-repeat;background-size: 100% 100%
}

.history-icon .ex-icon.lightStyle {
	background: url('@/static/images/common/history-light.png') no-repeat;background-size: 100% 100%
}
</style>
