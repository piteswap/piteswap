<template>
	<view class="flow-list-wrap">
		<view class="flow-header">
			<view class="header-item">{{$t('assets.trade.shuliang')}}</view>
			<view class="header-item">{{$t('assets.trade.jilu')}}</view>
			<view class="header-item">{{$t('assets.trade.shijian')}}</view>
		</view>
		<view class="flow-table">
			<scroll-view class="flow-scroll" scroll-y="true" @scrolltolower="onScrollToLower" v-if="list.length>0">
				<view class="flow-line" v-for="(item,index) in list" :key="index">
					<view class="data-item">{{item.value}}</view>
					<view class="data-item">check customer service for details</view>
					<view class="data-item">{{item.created_time}}</view>
				</view>
			</scroll-view>
			<view class="flow-scroll" style="color:#19BE6B" v-else>
				<empty-container></empty-container>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"flow-list",
	props: {
		list: {
			type: Array,
			default: function() {
				return []
			}
		}
	},
	data: function() {
		return {}
	},
	mounted: function() {},
	methods: {
		onScrollToLower: function() {
			this.$emit("loadmore")
		}
	}
}
</script>

<style lang="scss" scoped>
	
.flow-list-wrap {
	margin: 0 30rpx;
	color: var(--text-color);
	height: 100%;
	.flow-header {
		display: flex;
		flex-flow: row nowrap;
		justify-content: space-between;
		padding-bottom: 40rpx;
		box-sizing: border-box;
		.header-item {
			flex: 0 0 calc(33.3% - 16rpx);
			display: flex;
			justify-content: center;
			text-align: center;
			align-items: center;
			height: 44rpx;
			line-height: 44rpx;
			background-color: var(--page-part-color);
			border-radius: 10rpx
		}
	}
	.flow-table {
		height: calc(100% - 84rpx);
		.flow-line {
			display: flex;
			flex-flow: row nowrap;
			justify-content: space-between;
			text-align: center;
			margin-bottom: 30rpx;
			.data-item {
				flex: 0 0 calc(33.3% - 16rpx);
				display: flex;
				align-items: center;
				justify-content: center;
				&:nth-child(2) {
					flex-grow: 1
				}
			}
		}
		.flow-scroll {
			height: 100%;
			padding-bottom: 30rpx;
			.flow-scroll-wrap {
				overflow: hidden
			}
		}
	}
}

</style>
