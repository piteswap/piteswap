<template>
	<view class="v-toptbas-container bg-theme" @click.stop="">
		<view class="status-bar-height" :style="{'height':statusbarHeight}"></view>
		<view class="tabs-wrap">
			<view class="tabs-item" :class="{active: item.active == current}" v-for="(item,index) in list" :key="index" :data-current="index" @click="onTabClick">{{$t(item.name)}}</view>
		</view>
		<!-- <view class="search-wrap bg-theme">
			<view class="search">
				<search-input :border-bottom="false" @on-search-change="onSearchChange" v-model="searchContent">
					<template v-slot:right>
						<view class="search-right-wrap" @click.stop="switchCheck">
							<view class="search-right-text">{{ $t('assets.index.ycxebz') }}</view>
							<ex-check class="check" @click="switchCheck" v-model="isCheck"></ex-check>
						</view>
					</template>
				</search-input>
			</view>
		</view> -->
	</view>
</template>

<script>
export default {
	name:"top-tabs",
	props: {
		list: {
			type: Array,
			default: function() {
				return []
			}
		},
		current: {
			type: Number | String,
			default: 0
		},
		top: {
			type: Number | String,
			default: 0
		},
		limit: {
			type: Number | String,
			default: 220
		},
		isCheck: {
			type: Boolean,
			default: false
		},
		searchContent: {
			type: String,
			default: ""
		}
	},
	computed: {
		opacity: function() {
			if (this.top >= this.limit)
				return 1;
			var t = (this.top / this.limit).toFixed(2);
			return Number(t)
		}
	},
	data() {
		return {
			statusbarHeight:'var(--status-bar-height)',
		};
	},
	methods: {
		onSearchChange: function(t) {
			this.$emit("onSearchChange", t)
		},
		switchCheck: function() {
			this.$emit("switchCheck")
		},
		onTabClick: function(t) {
			var e = t.currentTarget.dataset.current;
			this.$emit("onTabClick", e)
		}
	}
}
</script>

<style lang="scss" scoped>
.v-toptbas-container {
	// position: fixed;
	// top: 0;
	width: 100%;
	background: url('@/static/images/common/icon_bg_zc.png') no-repeat;
	background-size: cover;
	z-index: 1001;
	border-bottom: 1rpx solid var(--border-color);
	.tabs-wrap {
		display: flex;
		justify-content: space-between;
		font-size: 30rpx;
		padding: 0 30rpx;
		.tabs-item {
			flex: 1;
			z-index: 20;
			text-align: center;
			color: #282828;
			position: relative;
			padding: 26rpx 0;
			font-size: 24rpx;
			overflow: hidden;
			&.darkStyle.active {
				color: #000
			}
			&.active {
				color: #000;
				font-weight: 700;
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
	}
	
	.search-wrap {
		background-color: #fff;
		padding: 20rpx 30rpx;
		.search-right-wrap {
			.search-right-text {
				font-size: 24rpx
			}
		}
		.search .search-right-wrap {
			display: flex;
			color: #909399;
			align-items: center;
			.check {
				margin-left: 10rpx
			}
		}
	}
}
</style>
