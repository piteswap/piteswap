<template>
	<view class="ex-th ex-th" :class="className">
		<slot></slot>
	</view>
</template>

<script>
export default {
	name:"ex-th",
	props:{
		className:{
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

<style lang="scss">
.ex-th {
    display: table-cell;
    color: var(--text-color);
    font-size: 24rpx;
    font-weight: lighter;
    height: 54rpx;
    line-height: 54rpx;
    text-align: center;
	&:first-child {
		text-align: left;
		padding-left: 30rpx;
	}
	&:last-child {
		text-align: right;
		padding-right: 30rpx;
	}
}
</style>
