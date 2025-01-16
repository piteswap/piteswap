<template>
	<view class="ex-td">
		<slot></slot>
	</view>
</template>

<script>
export default {
	name:"ex-td",
	data() {
		return {
			
		};
	}
}
</script>

<style lang="scss">
.ex-td {
    display: table-cell;
    text-align: center;
    padding: 30rpx 0;
    color: var(--text-color);
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
