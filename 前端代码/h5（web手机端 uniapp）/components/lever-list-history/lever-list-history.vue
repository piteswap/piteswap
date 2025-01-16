<template>
	<view class="positon-list-container darkStyle">
		<view class="postion-list-empty-wraps" v-if="isEmpty">
			<empty-container></empty-container>
		</view>
		<view class="postion-list-wraps" v-else>
			<view class="position-list-card-item" v-for="(item,index) in newList" :key="index">
				
				<view class="item-header">
					<view class="ih-left">
						<text class="type" :class="getColor(item.type)">{{item.type==1 ? $t('lever.index.zuoduo') : $t('lever.index.zuokong') }}</text>
						<text class="bs">x{{item.multiple || '0'}}</text>
						<text class="time">{{$u.timeFormat(item.create_time, "yyyy/mm/dd hh:MM:ss")}}</text>
					</view>
					<view class="ih-right">
						<u-tag class="utag" :text="$t('lever.index.jiaoyizhong')" v-if="item.status==1" mode="light" type="primary" size="mini" shape="circleLeft" />
						<u-tag class="utag" :text="$t('lever.index.yipingcang')" v-else-if="item.status==3" mode="light" type="success" size="mini" shape="circleLeft" />
						<u-tag class="utag" :text="$t('lever.index.yichedan')" v-else-if="item.status==4" mode="light" type="info" size="mini" shape="circleLeft" />
					</view>
				</view>
				
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
	</view>
</template>

<script>
export default {
	name:"lever-list-history",
	data() {
		return {
			stopTradeModal:false,
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
			removeIndex:null
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
		endReload:function(){
			this.timer && clearTimeout(this.timer)
			this.timer = setTimeout(()=>{
				this.reload()
			},1e3)
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
				console.log(this.newList)
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
				margin-right:2em;
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
			.utag{
				position: relative;
				margin-right: -20rpx;
			}
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
