<template>
	<view class="bg-theme v-exboxcheck-container">
		<view class="box" @click="onClick(item,index)" v-for="(item,index) in lists" :key="index">
			<view class="check" :class="{'checked':checkIndex==index}"></view>{{item[keyName]}}
		</view>
	</view>
</template>

<script>
export default {
	name:"ex-box-check",
	props: {
		lists:{
			type:Array,
			default:function(){
				return []
			}
		},
		checkIndex: {
			type: Number | String,
			default: null
		},
		keyName:{
			type:String,
			default:'name'
		}
	},
	data: function() {
		return {}
	},
	methods: {
		onClick: function(item,index) {
			this.$emit("click", {index:index,value:item})
		}
	}
}
</script>

<style lang="scss" scoped>
.v-exboxcheck-container{
	display: flex;
	align-items: center;
	background: none !important;
}
.v-exboxcheck-container .box {
	margin-right: 20rpx;
	position: relative;
	border-radius: 4rpx;
	padding: 6rpx 30rpx;
	box-sizing: border-box;
	border: 1rpx solid;
	font-size: 24rpx;
	font-weight: 400;
	border: 1rpx solid var(--brand-color);
	&:last-child {
		margin-right: 0
	}
	.check {
		position: absolute;
		right: -1rpx;
		top: -1rpx;
		width: 30rpx;
		height: 30rpx;
		&.checked {
			background: url('@/static/images/common/checked.png') no-repeat;background-size: 100% 100%
		}
	}
}
</style>
