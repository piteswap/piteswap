<template>
	<view class="v-kline-container v-option-detail-container dark" v-if="isLogin">
		<lw-navbar :border-bottom="false" title="" :boxShadow="false" class="bg-theme">
			<view class="top-box" slot="default">
				<view class="label active">{{$t('option.detail.qiquan')}}</view>
				<view class="label" @click="$u.route('/pages/lever/index')">{{$t('lever.index.heyue')}}</view>
				<!-- <view class="label" @click="$u.route({url:'/pages/lever/index',type:'switchTab'})">{{$t('lever.index.heyue')}}</view> -->
			</view>
			<view slot="right">
				<view class="menu-icon" @click="leftMenuPanel('show')">
					<image class="menu-icon-image" src="@/static/images/common/icon_menu.png"></image>
				</view>
			</view>
		</lw-navbar>
		
		<view style="position: sticky; z-index: 1000; top: calc(44px + var(--status-bar-height));">
			<view class="v-option-detail-ttile-wrap bg-theme">
				<view class="label">{{symbolArr[0]}}</view>
				<view class="value" :class=" now_price > open ? 'green' :'brand' ">
					{{now_price || '0.00'}}<text class="span">{{dealInfo.change || '0.00'}}%</text>
				</view>
			</view>
		</view>
		
		
		<!--K线-->
		<view class="v-kline-chart-wraps bg-theme">
			<option-kline-container-qiquan ref="kline" v-if="!loading" :legal_id="legal_id" :currency_id="currency_id" :index_market="symbol" :showCharts="klineShow" @upDayMarket="newData"></option-kline-container-qiquan>
		</view>
		
		<view class="v-option-draw-wraps darkStyle">
			<view class="draw-tabs-wrap" style="top: calc(44px + 50px + var(--status-bar-height));">
				<ex-tab-container :list="[$t('option.detail.ddjg'),$t('option.detail.jgls')]" :current="orderTabIndex" @clickTab="clickTab"></ex-tab-container>
			</view>
			<view class="draw-swiper-wrap">
				<view class="swiper-item draw-put-wrap">
					<view class="option-position-list-wraps" v-if="orderTabIndex==0">
						<positon-list-container :match_id="currencyDeal.id" :currentPrice="dealInfo.now_price" ref="plistc"></positon-list-container>
					</view>
					<view class="swiper-item" v-else-if="orderTabIndex==1">
						<positon-list-history :match_id="currencyDeal.id"></positon-list-history>
					</view>
					
					<view class="btn-wrap">
						<view class="btnb">
							<view class="button call" @click="showPanel('up')">{{$t('option.detail.kanzhang')}}</view>
							<view class="button put" @click="showPanel('down')">{{$t('option.detail.kandie')}}</view>
						</view>
						<view class="safe-area-inset-bottom" style="flex-grow: 1;"></view>
					</view>
				</view>
			</view>
		</view> 
		
		<!--购买面板-->
		<option-buy-popup-wraps ref="tradePanel" :class="tradeType" :currency_name="currencyDeal.currency_name" :trade-type="tradeType"  :match_id="currencyDeal.id" @submitSuccess="submitSuccess"></option-buy-popup-wraps>
		
		<!--左边菜单-->
		<collapse-container-trade ref="leftMenu" @menuStatus="$refs.leftMenuTab.panel($event)">
			<scroll-view style="height: calc(100vh - var(--status-bar-height));" scroll-y>
			<view class="title-text bg-theme">{{$t('trade.kline.option')}}</view>
			<option-table-container ref="leftMenuTab" dataType="qiquan" class="v-option-table-container-dark" @changeSymbol="changeSymbol"></option-table-container>
			</scroll-view>
		</collapse-container-trade>
	</view>
</template>

<script>
export default {
	data() {
		return {
			isLogin:false,
			tradeType:'up',
			orderTabIndex:0,
			klineShow:true,
			pageShow:false,
			loading: false,
			symbol:'BTC/USDT',
			symbolArr:['BTC','USDT'],
			legal_id:3,
			currency_id:1,
			xsw:4,//小数位
			currencyDeal:{},	//币种详细信息
			dealInfo:{},
			now_price: '',
			open: ''
		};
	},
	methods:{
		submitSuccess:function(){
			//购买成功
			if(this.orderTabIndex!=0){
				this.orderTabIndex = 0	//切换回进行中的订单页
			}
			this.$nextTick(()=>{
				this.$refs.plistc.reload()
			})
		},
		showPanel:function(classType){
			this.tradeType = classType
			this.$refs.tradePanel.panel(true)
		},
		clickTab:function(obj){
			this.orderTabIndex = obj.index
		},
		newData:function(obj){//更新数据
			let newObj =  Object.assign({},this.dealInfo,obj)
			//console.log("newData",newObj)
			this.dealInfo = newObj
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
			
			this.leftMenuPanel('hide')	//隐藏当前面板
			setTimeout(()=>{
				uni.hideLoading()
			},1000) 
		},
		fetchDeal: function() {	//获取交易对详情
			let params = {
				currency_id:this.currency_id,
				legal_id:this.legal_id
			}
			this.$u.api.getDealInfo(params).then(res=>{
				let d = {
							now_price:(res.now_price*1).toFixed(this.xsw),
							high:res.high,
							low:res.low,
							volume:res.volume,
							change:res.change
						}
				this.now_price = (res.now_price*1).toFixed(this.xsw)
				this.currencyDeal = res
				this.$set(this,'dealInfo',d)
			}).catch(err=>{
				
			})
		},
		initLoad:function(options){	//初始化 options={symbol:'BTC/USDT',currency_id:'xxxx',legal_id:'yyyy'}
			if(!this.checkLogin()){
				console.log('没有登录')
				return false
			}
			this.isLogin = true
			
			if(options && options.symbol){
				this.symbol = options.symbol
				this.legal_id = options.legal_id
				this.currency_id = options.currency_id
				let symbolArr = this.symbol.split('/')
				this.symbolArr = symbolArr
			}
			
			this.xsw = ['BTC','ETH'].indexOf(this.symbolArr[0]) > -1 ? 2 : 4
			
			var e = this;
			
			this.loading = true
			
			Promise.all([this.fetchDeal()]).then((function(t) {
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
			this.onListen()
		},
		onListen:function(reload){	//监听相关事件
			if(!this.isLogin){
				//console.log('没有登录')
				return false
			}
			
			if(reload && this.$refs.kline){
				this.$refs.kline.connect()	//重新连接防止断线
			}
			let e = this
			//卸载之前的监听
			uni.$off("closeDetail")
			//监听现价
			uni.$on("closeDetail", (function(t) {
					if(!t.close || !t.open){
						return
					}
					//console.log('更新现价：',e.xsw,t)
					e.now_price = (t.close*1).toFixed(e.xsw)
					e.open = t.open
				}
			))
		},
		offListen:function(){	//关闭相关监听
			this.$refs.kline && this.$refs.kline.close()
			uni.$off("closeDetail")
		}
	},
	onShow:function(){
		//this.klineShow = true
		this.onListen(true)
		this.$refs.tradePanel && this.$refs.tradePanel.reload()
	},
	onHide:function(){
		this.offListen()
		//this.klineShow = false
	},
	beforeDestroy:function(){
		this.offListen()
	},
	onLoad:function(options){
		uni.hideTabBar() 
		this.initLoad(options)
	},
	onBackPress:function(){
		uni.switchTab({
			url: '/pages/index/index'
		});
		// return true 禁止默认返回
		return true
	}
}
</script>

<style lang="scss" scoped>
.v-kline-container{
	.v-option-navbar{
	    background-color: #fff;
	    z-index: 1000;
	}
	
	.top-box{
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
		font-size: 32rpx;
		.label{
			width:6em;
			background: #2a405c;
			text-align: center;
			line-height: 2em;
			&.active{
				background: linear-gradient(0deg,#FFC107,#FF9800);
				color: #fff;
			}
			&:first-child{
				border-radius: 10rpx 0 0 10rpx;
			}
			&:last-child{
				border-radius: 0 10rpx 10rpx 0;
			}
			
		}
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


.v-option-detail-container{
	.menu-icon {
		height: 100%;
		.menu-icon-image {
			width: 40rpx;
			height: 40rpx
		}
	}
	.v-option-navbar {
		display: flex;
		background-color: #fff;
		align-items: center;
		border-bottom: 2rpx solid #ececee;
		z-index: 1000;
		.navbar-top {
			background-color: #fff;
			display: flex;
			justify-content: space-between;
			width: 100%;
			height: 100%
		}
		.arrow-left {
			padding: 20rpx
		}
		.v-option-menu {
			display: flex;
			align-items: center;
			position: relative;
			padding: 0 20rpx;
			&::before {
				content: " ";
				position: absolute;
				top: 50%;
				left: 0;
				width: 2rpx;
				height: 50%;
				transform: translateY(-50%);
				background-color: #ececee
			}
			.menu-icon {
				display: flex;
				align-items: center;
				margin-right: 14rpx
			}
			.menu-text {
				font-weight: 700;
				font-size: 30rpx;
				line-height: 40rpx;
				height: 40rpx
			}
		}
	}
	
	&.dark{
		.v-option-navbar {
			border-bottom: 1px solid var(--border-color);
			.navbar-top {
				background-color: var(--page-part-color)
			}
		}
		
	}
	
}

.title-text {
	background: #fff;
	font-size: 30rpx;
	font-weight: 700;
	padding: 30rpx
}

.v-option-detail-body {
	height: 60vh;
	.v-option-charts {
		width: 100%;
		height: 100%;
		background-color: #fff
	}
}

.v-option-draw-wraps {
	border-top: 30rpx solid var(--border-color);
	padding-bottom: 20rpx;
	&.darkStyle {
		background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
		background-size: cover;
		background-attachment: fixed
	}
	.draw-tabs-wrap {
		position: -webkit-sticky;
		position: sticky;
		z-index: 100;
		font-weight: 700
	}
	.draw-swiper-wrap {
		position: relative;
		.swiper-item {
			height: 100%
		}
		.draw-put-wrap {
			height: 100%;
			font-weight: 700;
			font-size: 24rpx;
			.line-process-wraps {
				padding: 0 30rpx
			}
			.btn-wrap {
				position: fixed;
				left: 0;
				right: 0;
				bottom: 0;
				margin-top: 30rpx;
				padding: 20rpx 30rpx;
				font-size: 30rpx;
				z-index: 210;
				.btnb{
					display: flex;
					justify-content: space-between;
				}
				.button {
					flex: 1;
					color: #fff;
					height: 88rpx;
					border-radius: 20rpx;
					display: -webkit-box;
					display: -webkit-flex;
					display: flex;
					justify-content: center;
					align-items: center;
					margin-right: 20rpx;
					&:last-child {
						margin-right: 0
					}
					&.call {
						background: linear-gradient(0deg,#FFC107,#FF9800)
					}
					&.put {
						background: linear-gradient(0deg,#bd6b54,#f5a889)
					}
				}
				.draw {
					margin: 0 20rpx;
					flex: 0 0 auto;
					width: 120rpx;
					height: 120rpx;
					border-radius: 50%;
					color: #488eed;
					background-color: #ebf4fd;
					display: flex;
					justify-content: center;
					align-items: center;
					border-bottom: 14rpx solid #b6d2f9
				}
			}
			
			.draw-line {
				padding: 20rpx 30rpx;
				display: flex;
				justify-content: space-between;
				align-items: center;
				&:nth-child(odd) {
					background-color: #f7f8fa
				}
				.left {
					.span {
						margin-left: 40rpx
					}
				}
				.right {
					display: flex;
					align-items: center;
					.time-icon {
						width: 30rpx;
						height: 30rpx;
						margin-right: 10rpx
					}
				}
			}
		}
	}
}

.v-option-detail-ttile-wrap {
	z-index: 1000;
	top: 88rpx;
	background: #fff;
	display: flex;
	justify-content: space-between;
	font-weight: 700;
	padding: 30rpx;
	font-size: 38rpx;
	
	.value{
		&.brand {
			color: #e93f4f
		}
		&.green {
			color: #13ac59
		}
		.span {
			font-size: 24rpx;
			font-weight: lighter;
			margin-left: 10rpx
		}
	}
}
</style>

