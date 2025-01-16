<template>
	<view class="positon-list-container darkStyle">
		<view class="postion-list-empty-wraps" v-if="isEmpty">
			<empty-container></empty-container>
		</view>
		<view class="postion-list-wraps" v-else>
			<view class="position-list-card-item" v-for="(item,index) in newList" :key="index">
				<view class="item-header">
					<view class="ih-left">
						<!-- <text class="type" :class="getColor(item.type)">{{item.type==1 ? $t('lever.index.zuoduo') : $t('lever.index.zuokong') }}</text>
						<text class="bs">x{{item.multiple || '0'}}</text> -->
						<text class="time">{{$u.timeFormat(item.create_time, "yyyy/mm/dd hh:MM:ss")}}</text>
					</view>
					<!-- <view class="ih-right">
						<text class="time">{{$u.timeFormat(item.create_time, "yyyy/mm/dd hh:MM:ss")}}</text>
					</view> -->
				</view>
				<view class="item-header">
					<view class="ih-left">
						<text class="type" :class="getColor(item.type)">{{item.type==1 ? $t('lever.index.zuoduo') : $t('lever.index.zuokong') }}</text>
						<text class="bs">x{{item.multiple || '0'}}</text>
						<!-- <text class="time">{{$u.timeFormat(item.create_time, "yyyy/mm/dd hh:MM:ss")}}</text> -->
					</view>
					<view class="ih-right">
						<!-- <text class="time">{{$u.timeFormat(item.create_time, "yyyy/mm/dd hh:MM:ss")}}</text> -->
						<u-tag :text="$t('lever.index.zhisunzhiyin')" mode="dark" type="primary" @click="yingsun(item.id,index,item.symbol)" style='text-align: center;'/>
						<u-tag :text="$t('lever.index.pingcang')" mode="dark" type="primary" @click="stopTrade(item.id,index)" style='margin-left: 5rpx;text-align: center;'/>
					</view>
				</view>
				<view class="item-header">
					<!-- <view class="ih-left"> -->
						<view  class="position-list-line">
							<view class="position-list-item" style="width: 130rpx;">
								<view class="list-item-label">{{$t('lever.index.zhiyinjia')}}</view>
								<view class="list-item-value">{{iTofixed(item.target_profit_price || '0.0000',4)*1}}</view>
							</view>
							<view class="position-list-item" style="width: 130rpx;">
								<view class="list-item-label">{{$t('lever.index.zhisunjia')}}</view>
								<view class="list-item-value">{{iTofixed(item.stop_loss_price || '0.0000',4)*1}}</view>
							</view>
						</view>
						
					<!-- </view> -->
					<view class="ih-right" style="margin-top: -50rpx;">
						<!-- <view @click="yingsun(item.id,index,item.symbol)" style="background-color: #2979ff;padding: 6px 11px;width: 180rpx;border-radius: 10rpx;font-size: 9px;text-align: center;color: #e2e8e4;">{{$t('lever.index.zhisunzhiyin')}}</view>
						<view @click="stopTrade(item.id,index)" style="background-color: #2979ff;padding: 6px 11px;width: 160rpx;border-radius: 10rpx;margin-left: 5rpx;font-size: 9px;text-align: center;color: #e2e8e4;">{{$t('lever.index.pingcang')}}</view> -->
						<!-- <u-tag :text="$t('lever.index.zhisunzhiyin')" mode="dark" type="primary" @click="yingsun(item.id,index,item.symbol)"/>
						<u-tag :text="$t('lever.index.pingcang')" mode="dark" type="primary" @click="stopTrade(item.id,index)" style='margin-left: 5rpx;'/> -->
					</view>
				</view>
				<!-- <view class="item-header">
					<view class="ih-left"></view>
					
					<view class="ih-right">
						<u-tag :text="$t('lever.index.zhisunzhiyin')" mode="dark" type="primary" @click="stopTrade(item.id,index)" />
						<u-tag :text="$t('lever.index.pingcang')" mode="dark" type="primary" @click="stopTrade(item.id,index)" style='margin-left: 5rpx;'/>
					</view>
				</view> -->
				<view class="position-list-line">
					<view class="position-list-item">
						<view class="list-item-label">{{$t('lever.index.baozhengjin')}}</view>
						<view class="list-item-value">{{iTofixed(item.origin_caution_money || '0.0000',4)*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('lever.index.kcprice')}}</view>
						<view class="list-item-value">{{iTofixed(item.price || '0.0000',4)*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('lever.index.xprice')}}</view>
						<view class="list-item-value">{{iTofixed(item.update_price || '0.0000',4)*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('lever.index.shouxufei')}}</view>
						<view class="list-item-value">{{iTofixed(item.trade_fee || '0.0000',4)*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('lever.index.yingkui')}}</view>
						<view class="list-item-value" :class="getColorByYk(item.profits)">{{iTofixed(item.profits || '0.0000',4)*1}}</view>
					</view>
				</view>
				
				
			</view>
			
			<view class="loadmore-box" v-if="status != 'nomore'">
				<u-loadmore :status="status" :load-text="loadText" color="var(--text-color)" font-size="24" margin-top="40" margin-bottom="40" @loadmore="fetchMore" />
			</view>
		</view>
		
		<u-modal class="exModal" v-model="stopTradeModal" show-cancel-button :title="$t('lever.index.stoptips')" content="" :cancel-text="$t('common.md_cancel')" :confirm-text="$t('common.md_confirm')" @confirm="stopTradeConfirm"></u-modal>
		
		<u-modal class="exModal" v-model="yingsunModal" show-cancel-button :title="yingsuntitle" content="" :cancel-text="$t('common.md_cancel')" :confirm-text="$t('common.md_confirm')" @confirm="yingsunConfirm">
			<view class="slot-content" style="margin-top: 50rpx;">
				<!-- <view>
					<view class="list-item-label">{{$t('lever.index.zhiyinjia')}}</view>
					<view>
						<u-number-box v-model="value" @change="valChange" style='color: #2DE2B4;' :step='0.01' :positive-integer='false'></u-number-box>
					</view>
					<view class="list-item-label">{{$t('lever.index.zhisunjia')}}</view>
				</view> -->
				<!-- <view class="item-header">
						<view class="ih-left">
							<view class="list-item-label" style="margin-left: 50rpx;">{{$t('lever.index.type')}}</view>
						</view>
						<view class="ih-right" style="margin-right:50rpx">
							<view class="list-item-label" style="margin-left: 50rpx;" v-if="detail.type_name == '买入'">{{$t('lever.index.zuoduo')}}</view>
							<view class="list-item-label" style="margin-left: 50rpx;" v-else>{{$t('lever.index.zuokong')}}</view>
						</view>
				</view>
				<view class="item-header">
						<view class="ih-left">
							<view class="list-item-label" style="margin-left: 50rpx;">{{$t('lever.index.shoushu')}}</view>
						</view>
						<view class="ih-right" style="margin-right:50rpx">
							<view class="list-item-label" style="margin-left: 50rpx;">{{detail.share}}</view>
						</view>
				</view>
				<view class="item-header">
						<view class="ih-left">
							<view class="list-item-label" style="margin-left: 50rpx;">{{$t('lever.index.xzbs')}}</view>
						</view>
						<view class="ih-right" style="margin-right:50rpx">
							<view class="list-item-label" style="margin-left: 50rpx;">X{{detail.multiple}}</view>
						</view>
				</view>
				<view class="item-header">
						<view class="ih-left">
							<view class="list-item-label" style="margin-left: 50rpx;">{{$t('lever.index.baozhengjin')}}</view>
						</view>
						<view class="ih-right" style="margin-right:50rpx">
							<view class="list-item-label" style="margin-left: 50rpx;">{{iTofixed(detail.origin_caution_money || '0.0000',4)*1}}</view>
						</view>
				</view>
				<view class="item-header">
						<view class="ih-left">
							<view class="list-item-label" style="margin-left: 50rpx;">{{$t('lever.index.shouxufei')}}</view>
						</view>
						<view class="ih-right" style="margin-right:50rpx">
							<view class="list-item-label" style="margin-left: 50rpx;">{{detail.trade_fee}}</view>
						</view>
				</view> -->
				
				<view class="item-header">
						<view class="ih-left">
							<view class="list-item-label" style="margin-left: 50rpx;">{{$t('lever.index.zhiyinjia')}}</view>
						</view>
						<view class="ih-right" style="margin-right:50rpx">
							<u-number-box v-model="target_profit_prices" @change="target_price" :step='100' :positive-integer='false'  :input-width='200'></u-number-box>
						</view>
				</view>
				<view class="item-header">
						<view class="ih-left">
							<view class="list-item-label" style="margin-left: 50rpx;">{{$t('lever.index.zhisunjia')}}</view>
						</view>
						<view class="ih-right" style="margin-right:50rpx">
							<u-number-box v-model="stop_loss_prices" @change="stop_price" :step='100' :positive-integer='false'  :input-width='200'></u-number-box>
						</view>
				</view>
			</view>
		</u-modal>
	</view>
</template>

<script>
import io from '@hyoga/uni-socket.io';
	
export default {
	name:"lever-list-container",
	data() {
		return {
			stopTradeModal:false,
			yingsunModal:false,//损盈弹窗
			newList:[],
			typeStatus:1,		// 0限价委托 1市价委托 3已平仓 4已撤单
			currencyId:null,	//交易对ID
			pagination: {
				page: 1,
				limit: 10
			},
			status: 'loadmore',	//通过status设置组件的状态，加载前值为loadmore，加载中为loading，没有数据为nomore
			loadText: {
				loadmore: this.$t('common.loadmore'),
				loading: this.$t('common.loading'),
				nomore: this.$t('common.nomore')
			},
			timer:null,
			stopTradeId:null,
			removeIndex:null,
			yingsunId:null,
			yingsunIndex:null,
			yingsuntitle:'',
			// value: 0,
			target_profit_prices:0,
			stop_loss_prices:0,
			detail:[],//详情
			
		};
	},
	props:{
		tradeStatus:{
			type:Number | String,
			default:null
		},
		currency_id:{
			type:Number | String,
			default:null
		}
	},
	watch:{
		'currency_id':function(newVal){
			this.currencyId = newVal
			this.reload()
		}
	},
	methods:{
		
		connect:function(){//socket.io连接websocket
			if(this.socketTask && this.socketTask.connected){
				//console.log('在线状态无需重连')
				return
			}
			let that = this
			const url = this.webConf.staticUrl
			this.socketTask = io(url, {
			  query: {},
			  transports: [ 'websocket', 'polling' ],
			  timeout: 5000,
			});
			let socket = this.socketTask

			socket.on('connect', () => {
			  
				console.log('heyue-ws 已连接1');
				var user = JSON.parse(window.localStorage.getItem("lifeData"))
				var user_id = user.data.vuex_user.id
				console.log(user_id);
				socket.emit("login",user_id)
				
				// that.$socket.emit("login", localStorage.getItem("user_id"));   //这个电脑端的。不要
				//交易对
				socket.on('lever_trade',function(msg){
					
					if (msg.type == "lever_trade" ) {
						var datas = JSON.parse(msg.trades_all);
						that.newList = datas
						console.log(datas)
						// // that.trades_all = datas
						// for(let i in datas){
							
						// }
						// console.log(that.newList,"1")
						// that.newList.forEach((v,i)=>{
						// 	if(v.user_id = msg.to){
								
						// 	}
						// })
						// 	console.log(msg.profits,"2");
					        //   var datas = JSON.parse(msg.trades_all);
					        //   that.riskRate = msg.hazard_rate;
					        //   that.totalPro = msg.profits_all;
					        //   that.profitsPrice = msg.profits;
					        //   let arr = [];
					        //   for (let i in datas) {
					        //     if (that.legal_id == datas[i].legal && that.currency_id == datas[i].currency) {
					        //       arr.push(datas[i]);
					        //     }
					        //   }
					        //   that.list_content = arr;
					        // }
					        // if (msg.type == "lever_trade" && that.load_type == 0) {
					        //   var datas = JSON.parse(msg.trades_entrust);
					        //   that.riskRate = msg.hazard_rate;
					        //   that.totalPro = msg.profits_all;
					        //   that.profitsPrice = msg.profits;
					        //   let arr = [];
					        //   for (let i in datas) {
					        //     if (that.legal_id == datas[i].legal && that.currency_id == datas[i].currency) {
					        //       arr.push(datas[i]);
					        //     }
					        //   }
					        //   that.list_content = arr;
					        // }
					
					
					}
					
				} )
				
			
			  
			  
			});
			
			
			socket.on('error', (msg) => {
			  console.log('ws error', msg);
			})
		},
		close:function() {
			this.socketTask && this.socketTask.close()
		},
		
		endReload:function(){
			this.timer && clearTimeout(this.timer)
			this.timer = setTimeout(()=>{
				this.reload()
			},1e3)
		},
		// 止损止盈
		yingsun(id,index,symbol){
			this.yingsunId = id
			this.yingsunIndex = index
			this.yingsunModal = true
			this.yingsuntitle = symbol
			this.detail = this.newList[index]
			this.target_profit_prices = this.detail.target_profit_price
			this.stop_loss_prices = this.detail.stop_loss_price
			console.log(this.yingsunId,this.yingsunIndex,this.yingsuntitle,this.detail,"99")
		},
		target_price(e) {
			console.log('当前值为: ' + e.value)
		},
		stop_price(e){
			console.log('当前值为: ' + e.value)
		},
		yingsunConfirm(){
			// let params = {
			// 	id:this.yingsunId,
			// 	stop_loss_price:this.stop_loss_price-,
			// 	target_profit_price:this.target_profit_price,
			// }
			if(this.detail.stop_loss_price == 0){
				let params = {
					id:this.yingsunId,
					stop_loss_price:Number(this.detail.price) - Number(this.stop_loss_prices),
					target_profit_price:Number(this.detail.price) + Number(this.target_profit_prices),
				}
				console.log(params,"1")
				// var that = this
				this.$u.api.yingsunsubmit(params).then(res=>{
					this.microTradeList()
					if(res.data.type == 'ok'){
						this.yingsunModal = false
						// that.microTradeList()
						that.reload()
						uni.showToast({
							title:res.data.message
						})
						
					}else{
						uni.showToast({
							title:res.data.message
						})
					}
					// that.microTradeList()
				}).catch(err=>{
					
				})
			}else{
				let params = {
					id:this.yingsunId,
					stop_loss_price:this.stop_loss_prices,
					target_profit_price:this.target_profit_prices,
				}
				console.log(params,"2")
				// var that = this
				this.$u.api.yingsunsubmit(params).then(res=>{
					this.microTradeList()
					if(res.data.type == 'ok'){
						this.yingsunModal = false
						// that.microTradeList()
						that.reload()
						uni.showToast({
							title:res.data.message
						})
					}else{
						uni.showToast({
							title:res.data.message
						})
					}
					// that.microTradeList()
				}).catch(err=>{
					
				})
			}
		},
		
		stopTrade: function(id,index){
			this.stopTradeId = id
			this.removeIndex = index
			this.stopTradeModal = true
		},
		stopTradeConfirm:async function (){
			let params = {id:this.stopTradeId}
			let res = await this.$u.api.leverClose(params).catch(err=>{})
			this.$u.toast(res)
			this.newList.splice(this.removeIndex,1)
		},
		microTradeList: function() {	//获取交易对详情
			if(this.status != 'loadmore' || !this.currency_id){	//非待加载状态
				return false
			}
			/*
			if(!this.currency_id){	//如果没有交易对ID 等待150毫秒后再试
				setTimeout(()=>{
					this.microTradeList()
				},150)
				return false
			}*/
			let params = {
				page:this.pagination.page,
				limit:this.pagination.limit,
				currency_id:this.currency_id,
				status:this.typeStatus
			}
			
			this.$u.api.leverMyTrade(params).then(res=>{
				let data = res.message
				if(this.pagination.page==1){
					this.newList = data.data
				}else{
					data.data.forEach(item=>{
						this.newList.push(item)
					})
				}
				
				if(!data.next_page_url){	//如果没有下一页
					this.status = 'nomore'	//标记没有新数据了
				}
				
			}).catch(err=>{
				
			})
		},
		reload: function(currency_id) {
			if(currency_id){	//父页面传递参数 防止更新不及时
				this.currencyId = currency_id
			}
			this.connect()
			this.pagination.page = 1
			this.status = 'loadmore'
			this.newList = []
			this.microTradeList()
			
		},
		fetchMore: function() {
			if(this.status!=='loadmore'){
				//console.log('no more or loading')
				return
			}
			this.pagination.page++
			this.microTradeList()
		},
		getColor: function(t) {
			return 1 == t ? "greenStyle" : 2 == t ? "redStyle" : void 0
		},
		getColorByYk: function(val) {
			return Number(val) >0 ? "greenStyle" : Number(val)<0 ? "redStyle" : void 0
		}
	},
	created:function(){
		this.currencyId = this.currency_id
		if(this.tradeStatus){
			this.typeStatus = this.tradeStatus
		}
		this.reload()
	},
	computed:{
		isEmpty:function(){
			return this.$u.test.isEmpty(this.newList)
		}
	}
}
</script>

<style lang="scss" scoped>
	
.positon-list-container {
	padding-bottom: 120rpx;
	min-height: 600rpx;
	.position-list-card-item {
		padding: 20rpx;
		text-align: left;
		background: rgba(42,64,92,0.7);
		margin: 0 20rpx 20rpx;
		border-radius:10rpx;
	}
	
	.item-header{
		display: flex;
		align-items: center;
		justify-content: space-between;
		color:#768da9;
		margin-bottom: 10rpx;
		.ih-left{
			font-size: 28rpx;
			font-weight: 100;
			line-height: 2;
			.type{
				margin-right: 10rpx;
				font-weight: bold;
				&.redStyle {
					color: #FC6668
				}
				&.greenStyle {
					color: #12B081
				}
			}
			.bs{
				// margin-right:2em;
				color:#fff;
			}
			.time{
				font-size: 24rpx;
			}
		}
		.ih-right{
			font-weight: 100;
			display: flex;
			align-items: center;
		}
		
	}
	
	.position-list-line {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin-bottom: 20rpx;
		&:last-child {
			margin-bottom: 0
		}
		.position-list-item {
			text-align: left;
			.list-item-label {
				height: 40rpx;
				line-height: 40rpx;
				color: #909399;
			}
			.list-item-value {
				font-size: 24rpx;
				font-weight: 100;
				&.redStyle {
					color: #FC6668
				}
				&.greenStyle {
					color: #12B081
				}
			}
			&:last-child{
				text-align: right;
			}
		}
	}
	
}

.postion-list-empty-wraps {
	position: relative;
	min-height: 600rpx
}
</style>
