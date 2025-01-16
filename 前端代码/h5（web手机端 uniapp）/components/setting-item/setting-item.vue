<template>
	<view class="item-wrap">
		<view class="setting-item" :class=' ["setting-item-dark", weight ? "weight" : ""]' @click="click">
			<view class="left">{{title}}</view>
			<view class="right">
				<view class="right-content">{{value}}</view>
				<view class="arrow" :style="{'opacity':arrow ? '1' : '0'}">
					<u-icon name="arrow-right" color="#2f4159" size="36"></u-icon>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		name:"setting-item",
		props: {
			arrow: {
				type: Boolean,
				default: !0
			},
			title: {
				type: String,
				default: ""
			},
			value: {
				type: String | Number,
				default: ""
			},
			weight: {
				type: Boolean,
				default: !0
			}
		},
		data: function() {
			return {}
		},
		methods: {
			click: function(t) {
				this.$emit("click", t)
			}
		}
	}
</script>

<style lang="scss" scoped>
.item-wrap .setting-item {
	border-bottom: 2rpx solid var(--border-color);
	background-color: #fff;
	padding: 30rpx 30rpx;
	font-size: 24rpx;
	color: var(--text-color);
	display: flex;
	align-items: center
}

.item-wrap .setting-item.weight {
	font-weight: 700
}

.item-wrap .setting-item .left {
	flex: 1
}

.item-wrap .setting-item .right {
	flex: 1;
	display: flex;
	justify-content: flex-end
}

.item-wrap .setting-item .right .right-content {
	font-weight: 400;
	margin-right: 20rpx;
	display: flex;
	justify-content: center;
	align-items: center
}

.item-wrap .setting-item .right .arrow {
	width: 30rpx;
	display: flex;
	align-items: center
}

.item-wrap .setting-item.setting-item-dark {
	background-color: #2a405c;
	color: #768ca9
}

.item-wrap .setting-item.setting-item-light {
	background-color: #edfefb;
	color: #5e5e5e;
	border-bottom: 2rpx solid #fff
}
</style>
