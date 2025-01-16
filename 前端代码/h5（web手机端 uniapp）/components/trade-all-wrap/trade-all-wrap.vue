<template>
	<view class="trade-all-wrap">
		<ex-table>
			<ex-tr class="ex-tr darkStyle" :border-bottom="false">
				<ex-th>{{$t('trade.index.jydcjl')}}</ex-th>
				<ex-th>{{$t('trade.index.shishijiage')}}</ex-th>
				<ex-th>{{$t('trade.index.zhangdiefu')}}</ex-th>
			</ex-tr>
			
			<ex-tr class="darkStyle" v-for="(item,index) in rankArr" :key="item.id" @click="goKLine(item)">
				<ex-td class="ex-td td-first">
					<view class="logo-image-wrap">
						<image mode="widthFix" class="logo-image" :src="webConf.staticUrl + item.logo"></image>
					</view>
					<view>
						<view class="td-line-1">
							{{item.currency_name}}<text class="span">/{{item.legal_name}}</text>
						</view>
						<view class="td-line-2">
							24H Vol {{item.volume}}
						</view>
					</view>
				</ex-td>
				<ex-td class="ex-td">{{item.now_price}}</ex-td>
				<ex-td class="ex-td">
					<ex-label-wrap :class-name="toClass(item.change)">{{item.change || '0.00'}}%</ex-label-wrap>
				</ex-td>
			</ex-tr>
			
		</ex-table>
	</view>
</template>

<script>
export default {
	name:"trade-all-wrap",
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
			rankArr:[]
		};
	},
	methods:{
		goKLine:function(item,e){
			//console.log(item)
			let params = {
				symbol:item.currency_name+'/'+item.legal_name,
				currency_id:item.currency_id,
				legal_id:item.legal_id
			}
			this.$u.route('/pages/trade/kline',params )
		},
		toClass:function(val){
			let num = val*1
			let str = 'pass'
			if(num==0){
				str = 'default'
			}else if(num < 0){
				str = 'danger'
			}
			return str
		}
	},
	watch:{
		list:function(newVal){
			this.rankArr = this.list
		}
	},
	created:function(){
		this.rankArr = this.list
	}
}
</script>

<style lang="scss">
.trade-all-wrap {
    font-family: DIN-Regular-2;
	.ex-td {
	    font-weight: 700;
	}
	.td-first {
	    display: flex;
	    align-items: center;
	}
	.logo-image-wrap {
	    margin-right: 10rpx;
	    height: 100%;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    border-radius: 50%;
	    width: 56rpx;
	    height: 56rpx;
	    border: 4rpx solid #bbb;
		.logo-image {
		    border-radius: 50%;
		    width: 36rpx;
		    height: 36rpx;
		}
	}
	.td-line-1 {
	    display: flex;
	    align-items: center;
	    font-size: 30rpx;
	    margin-bottom: 10rpx;
	    color: #FFC107;
		.span {
		    font-size: 24rpx;
		    color: #6e728d;
		    margin-left: 10rpx;
		}
	}
	.td-line-2 {
	    font-size: 22rpx;
	    color: #6e728d;
	}
}
</style>
