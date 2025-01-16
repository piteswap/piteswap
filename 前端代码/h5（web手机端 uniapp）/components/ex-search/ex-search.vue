<template>
	<view class="v-content-wrap dark">
		<view class="status-bar" :style="{'height':$sysInfo.statusBarHeight + 'px'}"></view>
		<view class="search-wrap">
			<view class="input-wrap">
				<view class="search-icon"></view>
				<input class="input" type="text" :placeholder="placeholder || $t('common.search')" :placeholder-style="placeholderStyle" v-model="searchWord" />
			</view>
			<view class="right" @click="goBack()">{{$t("common.md_cancel")}}</view>
		</view>
		<view class="list-wrap">
			<view class="list-item" v-for="(item,index) in dataList" :key="index" :data-id="index" @click="clickItem(item,$event)">
				<view class="left">{{item.name}}</view>
				<view class="right" v-if="item.value">{{item.value}}</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"ex-search",
	props: {
		list: {
			type: Array,
			default: function() {
				return []
			}
		},
		placeholder: {
			type: String
		}
	},
	data: function() {
		return {
			searchWord: ""
		}
	},
	computed: {
		placeholderStyle: function() {
			return "font-size: 26rpx; color: #768CA9;"
		},
		dataList: function() {
			var t = this;
			return this.list.filter((function(e) {
				if (t.searchWord) {
					var a = e.name.toLocaleLowerCase();
					return a.includes(t.searchWord.toLocaleLowerCase())
				}
				return e
			}
			))
		}
	},
	methods: {
		clickItem: function(t, e) {
			this.$emit("click-item", t, e)
		}
	}
}
</script>

<style lang="scss" scoped>
.v-content-wrap {
	background-color: #fff;
	height: 100%;
	font-size: 26rpx;
	overflow: hidden;
	overflow-y: auto;
	&.dark {
		.search-wrap {
			border-bottom: 1rpx solid #2f4159;
			.input {
				color: #e2e8e4!important
			}
		}
	}
	.search-wrap {
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-bottom: 1rpx solid var(--border-color);
		padding: 20rpx 30rpx;
		.input-wrap {
			flex: 1;
			display: flex;
			align-items: center;
			box-sizing: border-box;
			padding-right: 20rpx;
			.search-icon {
				flex: 0 0 auto;
				width: 46rpx;
				height: 46rpx;
				background: url('@/static/images/common/search.png');background-size: 100% 100%;
				margin-right: 20rpx
			}
			.input {
				background-color: var(--page-part-color);
				flex: 1;
				font-size: 40rpx;
				padding-left: 20rpx;
				text-align: left;
				color: var(--text-color);
				caret-color: #FFC107
			}
		}
		.right {
			flex: 0 0 auto;
			font-size: 28rpx;
			color: #FFC107
		}
	}
	.list-wrap {
		font-size: 26rpx;
		.list-item {
			display: flex;
			justify-content: space-between;
			align-items: center;
			padding: 30rpx 30rpx;
			.right {
				color: #909399
			}
		}
	}
}

</style>
