<template>
	<view class="order-card-container bg-theme darkStyle">
		<view class="card-head">
			<view class="title">
				<text class="type" :class="infoNew.type==2 ? 'redStyle' : 'greenStyle'">{{infoNew.type==2 ? $t('trade.kline.sell') : $t('trade.kline.buy')}}</text>
				<text class="title-text">{{infoNew.symbol}}</text>
				<text class="datetime">{{infoNew.created_at | dateFrm}}</text>
			</view>
			<view class="status">
				<slot name="head-right"></slot>
			</view>
		</view>
		
		<view class="card-main">
			<view class="left">
				<view class="label">
					{{$t('trade.kline.shuliang')}}({{infoNew.symbolArr[0]}})
				</view>
				<view class="value">{{infoNew.trade_amount*1}}</view>
			</view>
			<view class="center">
				<view class="label">
					{{$t('trade.kline.wtjg')}}({{infoNew.symbolArr[1]}})
				</view>
				<view class="value">{{infoNew.target_price*1}}</view>
			</view>
			<view class="right">
				<view class="label">
					{{$t('trade.kline.shouxufei')}}({{infoNew.symbolArr[1]}})
				</view>
				<view class="value">{{infoNew.fee}}</view>
			</view>
			
		</view>
	</view>
</template>

<script>
	import moment from "moment" 
export default {
	name:"order-card",
	computed:{
		infoNew:function(){
			let info = this.info
			info.symbolArr = info.symbol.split('/')
			info.fee = this.iTofixed(info.trade_amount*info.target_price*info.charge_fee,4)*1
			info.created_at = moment().format('Do MMMM, h:mm');
			return info
		}
	},
	props:{
		info:{
			type:Object,
			default:function(){
				return {}
			}
		}
	},
	data() {
		return {
			
		};
	}
}
</script>

<style lang="scss" scoped>
.order-card-container {
	background-color: #fff;
	padding: 30rpx;
	border-bottom: 1rpx solid var(--border-color);
	&.darkStyle {
		border-bottom: 1rpx solid #2f4159;
		background-color: #1B2C42 !important;
	}
	
	.card-head {
		display: flex;
		align-items: center;
		height: 58rpx;
		line-height: 58rpx;
		position: relative;
		.title {
			.type {
				font-weight: 700;
				color: #fc6668;
				font-size: 30rpx;
				margin-right: 10rpx;
				&.redStyle {
					color: #fc6668
				}
				&.greenStyle {
					color: #13ac59
				}
			}
			.title-text {
				font-weight: 700
			}
			
			.datetime {
				margin-left: 50rpx;
				font-size: 24rpx;
				color: #909399
			}
		}
		.status {
			font-size: 26rpx;
			font-weight: 700;
			position: absolute;
			right: 0;
			color: #909399;
			&.button {
				background-color: #f7f9f8;
				padding: 0 20rpx;
				color: #488eed;
			}
		}
	}
	
	.card-main {
		display: flex;
		justify-content: space-between;
		margin-top: 20rpx;
		.label {
			font-size: 24rpx;
			color: #c0c4cc
		}
		.value {
			margin-top: 10rpx;
			font-size: 24rpx;
			font-weight: 700;
			color: var(--text-color)
		}
		.left {
			text-align: left
		}
		.center {
			text-align: center
		}
		.right {
			text-align: right
		}
	}
	
}
</style>
