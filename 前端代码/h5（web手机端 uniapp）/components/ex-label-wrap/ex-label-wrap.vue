<template>
	<view class="ex-label-wrap">
		<view class="ex-label" :class="className">
			<slot></slot>
		</view>
	</view>
</template>

<script>
export default {
	name:"ex-label-wrap",
	props:{
		className:{
			type:String,
			default:'default'	//pass || default || danger
		}
	},
	data() {
		return {
			
		};
	}
}
</script>

<style lang="scss">
.ex-label-wrap {
	display: inline-block;
	.ex-label {
		width: 148rpx;
		height: 62rpx;
		line-height: 58rpx;
		border-radius: 8rpx;
		text-align: center;
		font-weight: 500;
		color: #fff;
		&.default {
			background: #ebebeb;
			color: #6e728d
		}
		&.danger {
			background: #ff5262
		}
		&.pass {
			background: #FFC107
		}
	}
}

</style>
