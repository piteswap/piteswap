<template>
	<view class="currency-rank-container">
		<view class="top-list darkStyle">
			<view class="top-rank-card" v-for="(item,index) in listArr" :key="index" @click="goKLine(item)">
				<view class="logo">
					<image class="logo-image" src="@/static/images/common/fire.png" mode="widthFix"></image>
					<!--<image class="logo-image" :src="'/static/images/common/icon-rank'+(index+1)+'.png'" mode="widthFix"></image>-->
				</view>
				<view class="back"></view>
				<view class="symbol">{{item.currency_name+'/'+item.legal_name}}</view>
				<view class="price">{{item.now_price*1 || '0.0000'}}</view>
				<view class="change">{{item.change || 0}}%</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"currency-rank",
	props:{
		list:{
			type:Array,
			default:function(){
				return []
			}
		}
	},
	data() {
		return {
			listArr:[]
		}
	},
	methods:{
		goKLine:function(item){
			//console.log(item)
			let params = {
				symbol:item.currency_name+'/'+item.legal_name,
				currency_id:item.currency_id,
				legal_id:item.legal_id
			}
			this.$u.route('/pages/trade/kline',params )
		}
	},
	created:function(){
		this.listArr = this.list
	},
	watch:{
		list:function(newVal){
			this.listArr = newVal	//只截取前3个
		}
	}
}
</script>

<style lang="scss" scoped>
.currency-rank-container{
	.top-list {
		display: flex;
		flex-flow: row wrap;
		justify-content: space-between;
		padding: 40rpx 30rpx 0 30rpx;
		
		.top-rank-card {
			padding: 10rpx 0;
			//flex: 0 0 calc(50% - 12rpx);
			flex: 0 0 calc(33.3% - 12rpx);
			background-color: #fff;
			display: flex;
			flex-flow: column;
			justify-content: center;
			align-items: center;
			margin-bottom: 20rpx;
			border-radius: 20rpx;
			color: var(--text-color);
			position: relative;
			box-shadow: 0 2rpx 70rpx 0 rgba(76,202,169,.3);
			 
			.logo {
			    z-index: 1;
				padding:10rpx 0;
				.logo-image {
				    width: 70rpx;
				    height: 70rpx;
				}
			}
			.symbol {
			    color: #090909;
			    z-index: 1;
			}
			.price {
			    z-index: 1;
			    margin-top: 20rpx;
			    margin-bottom: 6rpx;
			    color: var(--brand-color);
			    font-size: 30rpx;
			}
			.change {
			    color: #64667d;
			}
			
		}
		
		.top-rank-card:last-child {
		    /*flex-grow: 1;
		    margin-bottom: 0;*/
		}
	}
	.top-list.darkStyle{
		.top-rank-card {
			background: var(--page-part-color);
			box-shadow: 0 20rpx 20rpx 0 rgba(10,16,23,.4);
			.symbol {
			    color: var(--text-color);
			}
			.change {
			    color: var(--text-color);
			}
		}
	}
}

</style>
