<template>
	<view class="v-extables-container">
		<view class="v-extables-table-wrap">
			<view class="table v-extables-table">
				<view class="tr v-extables-head">
					<view class="th">
						<text class="head-label">{{$t('index.jiaoyidui')}}</text>
					</view>
					<view class="th">
						<text class="head-label">{{$t('index.zuixinjia')}}</text>
					</view>
					<view class="th">
						<text class="head-label">{{$t('index.zhangdiefu24')}}</text>
					</view>
				</view>
				
				<view class="tr v-extables-item" v-for="(item,index) in newArr" :key="item.id" @click="goKLine(item)">
					<view class="td symbol">
						<text class="currency">{{item.currency_name}}</text>/<text class="sub">{{item.legal_name}}</text>
					</view>
					<view class="td">
						{{item.now_price}}
					</view>
					<view class="td">
						<view class="labels">
							<view class="ex-label-wrap">
								<view class="ex-label" :class="className(item.change)">{{item.change||'0.00'}}%</view>
							</view>
						</view>
					</view>
				</view>

			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"v-extables",
	props:{
		list:{
			type:Array,
			default:function(){
				return []
			}
		}
	},
	computed:{
		newArr:function(){
			return this.sortArr(this.listArr)
		}
	},
	watch:{
		list:function(newVal){
			this.listArr = newVal
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
		},
		sortArr:function(arr){
			const tmpArr = arr
			tmpArr.sort(this.sortComp)
			return tmpArr
		},
		sortComp:function(a,b){
			return b.change*1 - a.change*1
		},
		className:function(valStr){
			const num = valStr*1
			let className = 'pass'
			if(num==0){
				className = 'default'
			}else if(num < 0){
				className = 'danger'
			}
			return className
		}
	},
	data() {
		return {
			listArr:[]
		};
	}
}
</script>

<style lang="scss" scoped>
.v-extables-container {
    z-index: 1;
    font-family: DIN-Regular-2;
	
	.v-extables-table-wrap {
	    padding: 0 30rpx;
	    padding-bottom: 40rpx;
		
		.v-extables-table {
		    width: 100%;
		    margin: 0;
		    color: var(--text-color);
			
			.tr {
			    display: flex;
			    justify-content: space-between;
			    align-items: center;
				
			}
			
			.th {
			    flex: 1;
			    color: var(--text-color);
			    font-size: 24rpx;
			    padding: 20rpx 0;
			    text-align: center;
			    display: flex;
			    justify-content: center;
			    font-weight: 400;
				
				.head-label {
				    width: 96%;
				    height: 44rpx;
				    margin: 0 auto;
				    display: inline-block;
				    background-color: var(--page-part-color);
				    border-radius: 20rpx;
				    display: flex;
				    justify-content: center;
				    align-items: center;
				}
			}
			th:first-child {
			    justify-content: flex-start;
			}
			
			.td {
			    flex: 1;
			    font-weight: 700;
			    padding: 20rpx 0;
			    display: flex;
			    align-items: center;
			    justify-content: center;
				
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
					}
					.ex-label.pass {
					    background: #FFC107;
					}
					.ex-label.default {
					    background: #ebebeb;
					    color: #6e728d;
					}
					.ex-label.danger {
					    background: #ff5262;
					}
				}
			}
			.td.symbol {
			    display: flex;
			    align-items: baseline;
				
				.currency {
				    display: inline-block;
				    color: #FFC107;
				}
				.sub {
				    display: inline-block;
				    font-size: 24rpx;
				    font-weight: lighter;
				}
			}
			.td:first-child {
			    justify-content: flex-start;
			}
			.td:last-child {
			    justify-content: flex-end;
			}
			
		}
	}
}
</style>
