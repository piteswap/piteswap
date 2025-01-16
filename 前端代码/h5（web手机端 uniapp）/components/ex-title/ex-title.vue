<template>
	<view class="ex_title_container">
		<view class="left ex_title_bar"></view>
		<view class="title">{{title}}</view>
		<view class="right ex_title_bar"></view>
	</view>
</template>

<script>
export default {
	name:"ex-title",
	props:{
		title:{
			type:String,
			default:''
		}
	},
	data() {
		return {
			
		};
	}
}
</script>

<style lang="scss" scoped>
.ex_title_container {
    display: flex;
    align-items: center;
    justify-content: center;
	
	.ex_title_bar {
	    height: 8rpx;
	    width: 104rpx;
	}
	
	.left {
	    background: url('@/static/images/common/line_left.png') no-repeat;
	    background-size: 100% 100%;
	}
	.title {
	    color: #FFC107;
	    font-size: 36rpx;
	    margin: 0 22rpx;
	    font-weight: 700;
	}
	.right {
	    background: url('@/static/images/common/line_right.png') no-repeat;
	    background-size: 100% 100%;
	}
}
</style>
