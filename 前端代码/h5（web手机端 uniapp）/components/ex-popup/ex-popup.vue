<template>
	<view class="ex-popup-container">
		<view class="u-mask"></view>
		<view class="ex-popup-mask darkStyle" :class="{'show':show}">
			<view class="ex-popup-head">
				<view class="ex-popup-title">
					<slot name="title"></slot>
				</view>
				<view class="ex-popup-close" @click="close">{{$t('common.md_cancel')}}</view>
			</view>
			<view class="ex-popup-body">
				<slot></slot>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"ex-popup",
	data() {
		return {
			show:false
		}
	},
	methods:{
		close:function(){
			this.show = false
			this.$emit('close',1)
		},
		panel:function(status){
			this.show = status
		}
	}
}
</script>

<style lang="scss" scoped>
.ex-popup-container {
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 1000;
	background-color: rgba(0,0,0,.45);
	transform: translateY(100%);
	transition: transform .1s;
	transition: transform .1s,-webkit-transform .1s;
	&.show {
		transform: translateY(0);
		transition: transform .01s;
		transition: transform .01s,-webkit-transform .01s
	}
	.ex-popup-mask {
		position: fixed;
		bottom: 0;
		left: 0;
		right: 0;
		min-height: 260rpx;
		border-top-left-radius: 30rpx;
		border-top-right-radius: 30rpx;
		background-color: var(--popup-background);
		transform: translateY(100%);
		transition: transform .4s;
		transition: transform .4s,-webkit-transform .4s;
		&.show {
			transform: translateY(0);
			transition: transform .4s;
			transition: transform .4s,-webkit-transform .4s
		}
		.ex-popup-head {
			display: flex;
			justify-content: space-between;
			padding: 40rpx 30rpx 20rpx 30rpx;
			.ex-popup-title {
				font-size: 40rpx;
				font-weight: 700;
				.ex-popup-close {
					color: #a6a9b7
				}
			}
		}
		.ex-popup-body {
			padding-bottom: 60rpx
		}
	}
}
</style>
