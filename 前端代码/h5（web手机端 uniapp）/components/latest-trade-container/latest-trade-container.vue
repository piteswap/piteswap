<template>
	<view class="latest-trade-container">
		<ex-table v-if="dataList.length>0">
			<ex-tr class="darkStyle" :border-bottom="false">
				<ex-th>{{$t('trade.kline.time')}}</ex-th>
				<ex-th>{{$t('trade.kline.fangxiang')}}</ex-th>
				<ex-th>{{$t('trade.kline.price')}}(USDT)</ex-th>
				<ex-th>{{$t('trade.kline.shuliang')}}</ex-th>
			</ex-tr>
			<ex-tr class="darkStyle" :border-bottom="false" v-for="(item,index) in dataList" :key="index">
				<ex-td>{{item.time}}</ex-td>
				<ex-td :class=" item.direction == 'buy' ? 'green' : 'red' ">{{$t('trade.kline.'+item.direction)}}</ex-td>
				<ex-td>{{item.price}}</ex-td>
				<ex-td>{{item.vol}}</ex-td>
			</ex-tr>
		</ex-table>
		<empty-container :emptyText="$t('common.nodata')" class="empty-box" v-else></empty-container>
	</view>
</template>

<script>
export default {
	name:"latest-trade-container",
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
			dataList:[]
		};
	},
	watch:{
		list:function(newVal){
			this.dataList = newVal
		}
	},
	mounted:function(){
		
	},
	beforeDestroy:function(){
		
	}
}
</script>

<style lang="scss" scoped>
.latest-trade-container {
	font-size:24rpx;
	font-weight:700;
	.empty-box{
		position: relative;
		min-height: 500rpx;
		background:none !important;
	}
	.green {
		color:#13ac59
	}
	.red {
		color:#fc6668
	}
}
.latest-trade-empty-wrap {
	height:400rpx;
	background-color:#fff
}

</style>
