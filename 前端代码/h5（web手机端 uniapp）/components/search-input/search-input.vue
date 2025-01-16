<template>
	<view>
		<view class="search-wrap search-wrap-dark" :class='[borderBottom ? "border-bottom" : "",isPadding ? "padding" : ""]' :style='{
		                "border-radius": borderRadius + "rpx",
		                "backgroundColor": background
		            }'>
			<view class="input-wrap">
				<view class="search-icon"></view>
				<input class="input" type="text" :placeholder="placeholder || $t('common.search')" :placeholder-style="placeholderStyle" confirm-type="search" :style="color" @input="onSearchChange" @confirm="onSearch"
				 v-model="searchContent">
			</view>
			<view class="right-wrap">
				<slot name="right"></slot>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"search-input",
	props: {
		value: {
			type: String,
			default: ""
		},
		placeholder: {
			type: String
		},
		borderBottom: {
			type: Boolean,
			default: !0
		},
		borderRadius: {
			type: Number | String,
			default: 0
		},
		background: {
			type: String,
			default: ""
		},
		isPadding: {
			type: Boolean,
			default: !1
		},
		color: {
			type: String
		}
	},
	data: function() {
		return {
			searchContent: "",
			placeholderStyle: "font-size: 24rpx; color: #909399;"
		}
	},
	watch: {
		value: function() {
			this.searchContent = this.value
		}
	},
	methods: {
		goBack: function() {
			uni.navigateBack({
				delta: 1
			})
		},
		onSearch: function() {
			this.$emit("on-search", this.searchContent)
		},
		onSearchChange: function() {
			//console.log("执行searchChange")
			this.$emit("on-search-change", this.searchContent)
		}
	}
}
</script>

<style lang="scss" scoped>
.search-wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 66rpx;
	padding: 10rpx 0
}

.search-wrap.search-wrap-dark.border-bottom {
	border-bottom: 1rpx solid #2f4159
}

.search-wrap.search-wrap-dark .input-wrap .input {
	color: #c0c4cc
}

.search-wrap.padding {
	padding-left: 30rpx;
	padding-right: 30rpx
}

.search-wrap.border-bottom {
	border-bottom: 1rpx solid var(--border-color)
}

.search-wrap .input-wrap {
	flex: 1;
	display: flex;
	align-items: center;
	box-sizing: border-box;
	padding-right: 20rpx
}

.search-wrap .input-wrap .search-icon {
	flex: 0 0 auto;
	width: 46rpx;
	height: 46rpx;
	background: url('@/static/images/common/search.png');background-size: 100% 100%;
	margin-right: 20rpx
}

.search-wrap .input-wrap .input {
	flex: 1;
	font-size: 28rpx;
	text-align: left;
	color: var(--text-color);
	caret-color: #FFC107
}

.search-wrap .right-wrap {
	font-size: 24rpx
}
</style>
