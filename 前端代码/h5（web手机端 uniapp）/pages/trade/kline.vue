<template>
	<view class="v-kline-container dark" v-if="isLogin">
		<lw-navbar :border-bottom="false" :title="symbol" class="v-option-navbar bg-theme">
			<view slot="right">
				<view class="menu-icon" @click="leftMenuPanel('show')">
					<image class="menu-icon-image" src="@/static/images/common/icon_menu.png"></image>
				</view>
			</view>
		</lw-navbar>
		
		<view class="v-kline-head">
			<view class="price-wrap" :class=" dealInfo.now_price > dealInfo.open ? 'green' :'brand' ">
				<view class="price-label">{{deal.now_price || '0000.00'}}</view>
				<view class="price-value-wrap">
					<text class="hic-value">{{dealInfo.change || '0.0'}}%</text>
				</view>
			</view>
			<view class="head-item">
				<view class="head-item-cell">
					<text class="hic-label">{{$t('trade.kline.high24')}}</text>
					<text class="hic-value">{{deal.high || '0.00'}}</text>
				</view>
				<view class="head-item-cell">
					<text class="hic-label">{{$t('trade.kline.low24')}}</text>
					<text class="hic-value">{{deal.low || '0.00'}}</text>
				</view>
				<view class="head-item-cell">
					<text class="hic-label">{{$t('trade.kline.volume24')}}</text>
					<text class="hic-value">{{deal.volume || '0.0000'}}</text>
				</view>
			</view>
		</view>
		
		<view class="v-kline-chart-wraps bg-theme">
			<!--K线-->
			<option-kline-container v-if="!loading" :legal_id="legal_id" :currency_id="currency_id" :index_market="symbol" :showCharts="klineShow" @upDayMarket="newData"></option-kline-container>
		</view>
		
		<view class="k-line-content-wraps">
			<view class="v-kline-content-tabs">
				<u-tabs :list="tabsList" :is-scroll="false" :current="tabCurrent" @change="tabchange" bg-color="var(--page-background-color)" inactive-color="var(--text-color)" active-color="var(--brand-color)"></u-tabs>
			</view>
			<view class="v-kline-table" v-if="leverDatas.legalId>0">
				<!--交易面板-->
				<v-container-wrap ref="orderPanel" :lever-data="leverDatas" :base-coin="symbolArr[0]" v-show="tabCurrent===0" @emitEvent="emitEvent"></v-container-wrap>
				<!--成交记录-->
				<latest-trade-container :list="tradeList" v-show="tabCurrent!==0"></latest-trade-container>
			</view>
		</view>
		
		<!--左边菜单-->
		<collapse-container-trade ref="leftMenu" @menuStatus="$refs.leftMenuTab.panel($event)">
			<scroll-view style="height: calc(100vh - var(--status-bar-height));" scroll-y>
			<view class="title-text bg-theme">{{$t('trade.kline.bibi')}}</view>
			<option-table-container ref="leftMenuTab" dataType="bibi" class="v-option-table-container-dark" @changeSymbol="changeSymbol"></option-table-container>
			</scroll-view>
		</collapse-container-trade>
		
	</view>
</template>

<script>
export default {
	data() {
		return {
			isLogin:false,
			tabsList:[{name:this.$t('trade.kline.jiaoyi')},{name:this.$t('trade.kline.zuixincj')}],
			tabCurrent:0,
			klineShow:false,
			lastData:{},
			legal_id:0,
			currency_id:0,
			loading: false,
			dealInfo: {},	//获取到的基础信息
			xsd:4,	//小数点长度
			symbol: "Loading",
			symbolArr:[],
			tradeList:[],	//最新成交
			leverDatas: {
				legalName: '',	//法币名字
				legalId: '',	//法币ID
				useLegalNum: '',	//法币数量
				useLegalFee:'',	//交易手续费
				currencyName: '',	//币币名字
				currencyId: '',	//币币ID
				usebibiFee:'',	//币币手续费
				usebibiNum: '',	//币币数量
				controlPrice: ''	,//当前市价（交易以市价委托进行）
				resultPriceBuy:''	,//买入交易额
				resultPriceSell:'',	//卖出交易额
				
			},
			
		};
	},
	computed: {
		deal:function(){
			const dealInfo = this.dealInfo
			let obj = {
				now_price:this.formatPrice(dealInfo.now_price),
				high:this.formatPrice(dealInfo.high),
				low:this.formatPrice(dealInfo.low),
				volume:this.formatPrice(dealInfo.volume,4)
			}
			return obj
		}
	},
	methods: {
		/*
		动态调用指定方法
		obj = {name:'方法名',params:[参数1,参数2,...]}
		*/
		emitEvent:function(obj){	//监听子组件事件
			let methods = this.$options.methods
			const _this = this
			//console.log('methods:',obj,methods)
			methods[obj.name].apply(_this,obj.params)
		},
		tabchange:function(index){	//切换交易面板和最新成交记录
			this.tabCurrent = index
		},
		newData:function(obj){//更新数据
			//console.log(obj)
			let newObj =  Object.assign({},this.dealInfo,obj)
			this.dealInfo = newObj
		},
		fetchDeal: function() {	//获取交易对详情
			let params = {
				currency_id:this.currency_id,
				legal_id:this.legal_id
			}
			this.$u.api.getDealInfo(params).then(res=>{
				let d = {
							now_price:res.now_price,
							high:res.high,
							low:res.low,
							volume:res.volume,
							change:res.change
						}

				this.$set(this,'dealInfo',d)
			}).catch(err=>{
				
			})
		},
		formatPrice:function(price,xsd){
			if(!price){
				price = 0
			}
			//return this.iTofixed(price*1, xsd || this.xsd) 
			return (price*1).toFixed(xsd || this.xsd)
		},
		tradeListRev:function(msg){	//预处理最新交易记录
			if(typeof msg.data == 'undefined'){
				return
			}
			let d = msg.data
			for(let i in d){
				let obj = {
					time:this.$u.timeFormat(d[i].ts,'hh:MM:ss'),
					direction:d[i].direction,
					price:d[i].price,
					vol:this.iTofixed(d[i].amount,6)
				}
				this.tradeList.unshift(obj)	//向数组头部添加
				
				if(this.tradeList.length>20){	//只要最新20条
					this.tradeList.pop()	//从数组尾部删除
				}
				
			}
		},
		getWalletFun:function(){	//获取钱包详情
			let that = this
			const params = {
				currency:this.legal_id,
				type:"change"
			}
			//获取法币数据（USDT）
			this.$u.api.getWallet(params).then(res=>{
				that.leverDatas.useLegalFee=res.coin_trade_fee
				that.leverDatas.useLegalNum=res.change_balance*1
				
				that.leverDatas.legalName=res.currency_name
				that.leverDatas.legalId=res.currency
			}).catch(err=>{})
			
			const params1 = {
				currency:this.currency_id,
				type:"change"
			}
			//获取交易币数据
			this.$u.api.getWallet(params1).then(res=>{
				that.leverDatas.usebibiFee=res.coin_trade_fee
				that.leverDatas.usebibiNum=res.change_balance*1
				
				that.leverDatas.currencyName=res.currency_name
				that.leverDatas.currencyId=res.currency
			}).catch(err=>{})			
		},
		leftMenuPanel:function(status){
			this.$refs.leftMenu.panel(status || 'show')
		},
		changeSymbol:function(obj){	//不销毁页面 直接切换数据 避免重复加载
			if(obj.symbol == this.symbol){
				this.leftMenuPanel('hide')	//隐藏当前面板
				return
			}
			uni.showLoading()
			this.offListen()	//卸载旧的监听
			this.initLoad(obj)	//开始新的初始化
			this.$refs.orderPanel.refreshOrder(obj)	//刷新历史订单
			this.leftMenuPanel('hide')	//隐藏当前面板
			setTimeout(()=>{
				uni.hideLoading()
			},1000) 
		},
		initLoad:function(options){	//初始化 options={symbol:'BTC/USDT',currency_id:'xxxx',legal_id:'yyyy'}
			if(!options.symbol){
				this.goBack()
				return
			}
			this.checkLogin()
			
			var e = this;
			this.loading = true
			this.symbol = options.symbol
			this.legal_id = options.legal_id
			this.currency_id = options.currency_id
			let symbolArr = this.symbol.split('/')
			this.symbolArr = symbolArr
			this.lastData = {}
			this.klineShow = true	//图表初始化
			
			this.xsd = ['BTC','ETH'].indexOf(symbolArr[0]) > -1 ? 2 : 4
			this.tradeList = []	//初始化成交记录
			
			Promise.all([this.getWalletFun(),this.fetchDeal()]).then((function(t) {
				setTimeout(()=>{
					e.loading = false
				},50)	//延迟一下 不然K线切换时不刷新
			}
			)).catch((function(t) {
				setTimeout(()=>{
					e.loading = false
				},50)
			}
			))
			
			//监听现价
			uni.$on("close", (function(t) {
					//console.log('更新现价：',t)
					e.dealInfo.now_price = t.close
					e.dealInfo.open = t.open
					e.leverDatas.controlPrice = t.close //价格传入
				}
			))
			
			//监听图表发送的交易数据
			uni.$on('match_trade',(msg)=>{
				//console.log("接收数据",msg)
				this.tradeListRev(msg)
			})
		},
		offListen:function(){	//关闭相关监听
			this.klineShow = false
			uni.$off("close")
			uni.$off('match_trade')
		}
	},
	onLoad:function(options){
		if(!this.checkLogin()){
			return
		}
		this.isLogin = true
		this.initLoad(options)
	},
	onShow: function() {
		//this.websocket()
	},
	onHide: function() {
		this.leftMenuPanel('hide')
		//this.closeSocket()
	},
	onUnload: function() {
		this.offListen()
	}
}
</script>

<style lang="scss" scoped>
.v-kline-container{
	.v-option-navbar{
	    background-color: #fff;
	    z-index: 1000;
	}
	
	.menu-icon{
	    height: 100%;
		.menu-icon-image{
		    width: 40rpx;
		    height: 40rpx;
		}
	}
	
	.v-kline-head {
	    display: flex;
	    justify-content: space-between;
	    background: var(--page-background-color);
	    padding: 20rpx 30rpx;
		.price-wrap{
			.price-label {
			    font-size: 50rpx;
			    font-weight: 700;
			    color: #13ac59;
			}
			.price-value-wrap {
			    margin-top: 20rpx;
			}
			
			.hic-value {
			    margin-left: 20rpx;
			    color: #13ac59;
			}
			&.brand{
				.price-label {
				    color: #fc6668;
				}
				.hic-value {
				    color: #fc6668;
				}
			}
		}
		.head-item {
		    font-size: 24rpx;
			.head-item-cell {
			    display: flex;
			    width: 300rpx;
			    flex-flow: row nowrap;
			    justify-content: space-between;
			    margin-top: 10rpx;
				.hic-label {
				    text-align: left;
				    color: #909399;
				}
				.hic-value {
				    font-weight: 700;
				    text-align: right;
				}
			}
			
		}
	}
	&.dark .v-option-navbar{
	    border-bottom: 1rpx solid #2f4159;
	}
	.v-kline-chart-wraps {
		height: 100vw;
	    max-height: 800rpx;
	}
	.k-line-content-wraps{
		margin-top:40rpx;
	}
	
	.title-text {
	    background: #fff;
	    font-size: 40rpx;
	    font-weight: 700;
	    padding: 30rpx;
	}
}
</style>
