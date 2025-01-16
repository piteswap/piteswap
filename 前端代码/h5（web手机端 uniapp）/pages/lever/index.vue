<template>
	<view class="v-kline-container v-option-detail-container dark">
		<lw-navbar :border-bottom="false" title="" :boxShadow="false" class="bg-theme">
			<view class="top-box" slot="default">
				<view class="label" @click="$u.route({url:'/pages/option/detail',type:'switchTab'})">{{$t('option.detail.qiquan')}}</view>
				<!-- <view class="label" @click="$u.route('/pages/option/detail')">{{$t('option.detail.qiquan')}}</view> -->
				<view class="label active">{{$t('lever.index.heyue')}}</view>
			</view>
			<view slot="right">
				<view class="menu-icon" @click="leftMenuPanel('show')">
					<image class="menu-icon-image" src="@/static/images/common/icon_menu.png"></image>
				</view>
			</view>
		</lw-navbar>
		
		<view style="position: sticky; z-index: 1000; top: calc(44px + var(--status-bar-height));">
			<view class="v-option-detail-ttile-wrap bg-theme">
				<view class="label">{{symbol}}</view>
				<view class="value" :class=" dealInfo.now_price > dealInfo.open ? 'green' :'brand' ">
					<view class="vtxt">{{dealInfo.now_price || '0.00'}}<text class="span">{{dealInfo.change || '0.00'}}%</text></view>
					<view class="right-ico menu-icon" @click="$u.throttle(showOrHideCharts,1000)">
						<image class="menu-icon-image" src="@/static/images/common/kline_on.png" v-if="klineShow"></image>
						<image class="menu-icon-image" src="@/static/images/common/kline_off.png" v-else></image>
					</view>
				</view>
			</view>
		</view>
		
		
		<!--K线-->
		<view class="v-kline-chart-wraps bg-theme" :class="{hideKline:!klineShow}">
			<option-kline-container-heyue v-if="!loading" :legal_id="legal_id" :currency_id="currency_id" :index_market="symbol" @upDayMarket="newData" @marketDepth="marketDepth"></option-kline-container-heyue>
		</view>
		
		<!--购买-->
		<view class="v-buy-box">
			<view class="left">
				<view class="uu-tabs">
					<view class="label" :class="{active:buysellTabIndex==0}" @click="tabChange(0)">{{$t('lever.index.zuoduo')}}</view>
					<view class="label" :class="{active:buysellTabIndex==1}" @click="tabChange(1)">{{$t('lever.index.zuokong')}}</view>
				</view>
				<view class="beishu mt15">
					<view class="vinput-box">
						<view class="v-left">{{$t('lever.index.xzbs')}}</view>
						<view class="v-right" @click="multList.length>0 ? showBs = true : ''">
							<view class="v-value">{{'x'+leverDatas.muitNum}}</view>
							<view class="vr-label"><u-icon name="arrow-down"></u-icon></view>
						</view>
					</view>
					<u-select class="zdy" v-model="showBs" :list="multList" :default-value="[multipleIndex]" :confirm-text="$t('common.md_confirm')" :cancel-text="$t('common.md_cancel')" @confirm="beishuSelect"></u-select>
				</view>
				
				<view class="shoushu mt15">
					<view class="vinput-box">
						<view class="v-left">{{$t('lever.index.shoushu')}}</view>
						<view class="v-right">
							<view class="v-value">
								<input v-model="leverDatas.share" type="number" maxlength="10" :placeholder="$t('lever.index.qxzhsr')" class="ssipt" placeholder-class="ssipt-placeholder" @input="changeInput" />
							</view>
						</view>
					</view>
					<view class="tips">{{$t('lever.index.one')}} = {{ iTofixed(leverDatas.shareNum || '0.00',2) }} {{currencyDeal.currency_name || symbolArr[0]}}</view>
					<!--<view class="ss-slider">
						<text>0</text>
						<u-slider class="uslider" v-model="shoushuBi" blockWidth="24" :active-color="compColor" inactive-color="#2A405C" use-slot @end="sliderEnd">
							<view class="block" :style="{background:compColor}"></view>
						</u-slider>
						<text>100</text>
					</view>-->
					<view class="comp-info">
						<view class="row">
							<text class="cr-left">{{$t('lever.index.shizhi')}} ({{leverDatas.legalName}})</text>
							<text class="cr-right">≈{{calcData.marketPrice || '0.0000'}}</text>
						</view>
						<view class="row">
							<text class="cr-left">{{$t('lever.index.baozhengjin')}} ({{leverDatas.legalName}})</text>
							<text class="cr-right">≈{{calcData.bonds || '0.0000'}}</text>
						</view>
						<view class="row">
							<text class="cr-left">{{$t('lever.index.shouxufei')}} ({{leverDatas.legalName}})</text>
							<text class="cr-right">≈{{calcData.tradeFree || '0.0000'}}</text>
						</view>
						<view class="row">
							<text class="cr-left">{{$t('lever.index.yue')}} ({{leverDatas.legalName}})</text>
							<text class="cr-right">{{iTofixed(leverDatas.useLegalNum,4)}}</text>
						</view>
					</view>
					
					<u-button type="success" :custom-style="{backgroundColor:compColor}" ripple @click="submitConfirm">{{buysellTabIndex == 0 ? $t('lever.index.zuoduo') : $t('lever.index.zuokong')}}</u-button>
					
				</view>
				
			</view>
			<view class="right">
				<view class="market-depth">
					<view class="row title">
						<text>{{$t('lever.index.jiage')}}</text>
						<text>{{$t('lever.index.shuliang')}}</text>
					</view>
					<view class="sell-out">
						<view class="row" v-for="(item,index) in sellOut" :key="index">
							<view class="bg-sell" :style="item.bg?'width:'+item.bg+'%':''"></view>
							<text class="r-left">{{ iTofixed((item[0] || '0.0000'),4) }}</text>
							<text class="r-right">{{ iTofixed((item[1]*255 || '0.00'),2) }}</text>
						</view>
					</view>
					<view class="now-price" :class=" dealInfo.now_price > dealInfo.open ? 'green' :'brand' ">{{ iTofixed((dealInfo.now_price || '0.00'),4) }}</view>
					<view class="buy-in">
						<view class="row" v-for="(item,index) in buyOut" :key="index">
							<view class="bg-buy" :style="item.bg?'width:'+item.bg+'%':''"></view>
							<text class="r-left">{{ iTofixed((item[0] || '0.0000'),4) }}</text>
							<text class="r-right">{{ iTofixed((item[1]*255 || '0.00'),2) }}</text>
						</view>
					</view>
				</view>
			</view>
		</view>
		
		
		
		<!--交易记录-->
		<view class="v-option-draw-wraps darkStyle" >
			<view class="draw-tabs-wrap" style="top: calc(44px + 50px + var(--status-bar-height));">
				<ex-tab-container :list="[$t('lever.index.dqwt'),$t('lever.index.history')]" :current="orderTabIndex" @clickTab="clickTab"></ex-tab-container>
			</view>
			<view class="draw-swiper-wrap">
				<view class="swiper-item draw-put-wrap">
					<view class="option-position-list-wraps" v-if="orderTabIndex==0">
						<lever-list-container :currency_id="currency_id" tradeStatus="1" ref="plistc"></lever-list-container>
					</view>
					<view class="swiper-item" v-else-if="orderTabIndex==1">
						<lever-list-history :currency_id="currency_id" tradeStatus="3" ref="plistHistory"></lever-list-history>
					</view>
				</view>
			</view>
		</view> 
		
		<!--左边菜单-->
		<collapse-container-trade ref="leftMenu" @menuStatus="$refs.leftMenuTab.panel($event)">
			<scroll-view style="height: calc(100vh - var(--status-bar-height));" scroll-y>
			<view class="title-text bg-theme">{{$t('lever.index.heyue')}}</view>
			<option-table-container ref="leftMenuTab" dataType="heyue" class="v-option-table-container-dark" @changeSymbol="changeSymbol"></option-table-container>
			</scroll-view>
		</collapse-container-trade>
		<u-toast ref="uToast" />
		<u-modal class="exModal" ref="exModal" v-model="modalShow" async-close show-cancel-button :title="leverDatas.currencyName+'/'+leverDatas.legalName" :cancel-text="$t('common.md_cancel')" :confirm-text="$t('common.md_confirm')" @confirm="formSubmit">
			<view class="md-box">
				<view class="item">
					<text>{{$t('lever.index.type')}}</text>
					<text class="ival">{{buysellTabIndex==0? $t('lever.index.zuoduo') : $t('lever.index.zuokong') }}</text>
				</view>
				<view class="item">
					<text>{{$t('lever.index.shoushu')}}</text>
					<text class="ival">{{leverDatas.share}}</text>
				</view>
				<view class="item">
					<text>{{$t('lever.index.xzbs')}}</text>
					<text class="ival">x{{leverDatas.muitNum}}</text>
				</view>
				<view class="item">
					<text>{{$t('lever.index.jiage')}}</text>
					<text class="ival">{{$t('lever.index.zuiyoujiage')}}</text>
				</view>
				<view class="item">
					<text>{{$t('lever.index.weituojiazhi')}}</text>
					<text class="ival">≈{{calcData.marketPrice || '0.0000'}}</text>
				</view>
				<view class="item">
					<text>{{$t('lever.index.baozhengjin')}}</text>
					<text class="ival">{{calcData.bonds}}</text>
				</view>
				<view class="item">
					<text>{{$t('lever.index.shouxufei')}}</text>
					<text class="ival">{{calcData.tradeFree}}</text>
				</view>
				
				<view class="item">
					<text>{{$t('lever.index.zhiyinjia')}}</text>
					<!-- <view class="v-right">
						<view class="v-value">
							<input v-model="target_profit_prices" type="number" maxlength="10" :placeholder="$t('lever.index.qrzhiyingjia')" class="ssipt" placeholder-class="ssipt-placeholder" style="border: 1rpx solid #2A405C;"/>
						</view>
					</view> -->
					<u-number-box v-model="target_profit_prices"  :step='100' :positive-integer='false'  :input-width='200'></u-number-box>
				</view>
				<view class="item">
					<text>{{$t('lever.index.zhisunjia')}}</text>
					<!-- <view class="v-right">
						<view class="v-value">
							<input v-model="stop_loss_prices" type="number" maxlength="10" :placeholder="$t('lever.index.qrzhisunjia')" class="ssipt" placeholder-class="ssipt-placeholder"  style="border: 1rpx solid #2A405C;"/>
						</view>
					</view> -->
					<u-number-box v-model="stop_loss_prices" :step='100' :positive-integer='false'  :input-width='200'></u-number-box>
				</view>
				
			</view>
		</u-modal>
	</view>
</template>

<script>
export default {
	data() {
		return {
			orderTabIndex:0,
			klineShow:false,
			pageShow:false,
			loading: false,
			symbol:'BTC/USDT',
			symbolArr:['BTC','USDT'],
			legal_id:3,
			currency_id:1,
			xsw:4,//小数位
			currencyDeal:{},	//币种详细信息
			dealInfo:{},
			buysellTabIndex:0	,//tab默认选中项
			sellOut:[{},{},{},{},{}],
			buyOut:[{},{},{},{},{}],
			showBs:false,
			multList:[],	//倍数列表
			multipleIndex:0,
			shoushuBi:0,
			modalShow:false,
			leverDatas:{
				resMsg: '',
				legalName: 'USDT',
				currencyName: '',
				legalId: '',
				currencyId: '',
				cny: '',
				ustdPrice: '',
				shareNum: '',
				transactionFee: '',
				spread: '',
				bond: '',
				tip: '',
				setValue: '',
				selectStatus: 1,	//1=市价交易  0=限价交易
				minShare: '',
				maxShare: '',
				marketValue: '',
				bondTotal: '',
				transactionTotal: '',
				lastPrice: '',
				useLegalNum: '',
				useCurrencyNum: '',
				share: '',
				controlPrice: '',
				muitNum: '',
				rmbRate: ''
			},
			calcData:{
				marketPrice:'',	//市值
				bonds:'',	//保证金
				tradeFree:''	//手续费
			},
			
			target_profit_prices:'',
			stop_loss_prices:''
			
		};
	},
	computed:{
		compColor:function(){
			return this.buysellTabIndex == 0 ? '#12B081' : '#FC6668'
		}
	},
	methods:{
		submitConfirm:function(){
			let val = this.leverDatas.share
			if(!val || Number(val) < 1){
				this.$u.toast(this.$t('lever.index.ssbnxy1'))
				this.leverDatas.share = null	
				this.calculation()
				return false
			}
			if(val%1!==0){
				this.$u.toast(this.$t('lever.index.bxszzs'))
				this.leverDatas.share = null
				this.calculation()
				return false
			}
			
			this.modalShow = true
		},
		formSubmit:async function(){
			let params = {
					share: this.leverDatas.share,
					multiple: this.leverDatas.muitNum,
					legal_id: this.leverDatas.legalId,
					currency_id: this.leverDatas.currencyId,
					type: this.buysellTabIndex == 0 ? 1 : 2,
					status: this.leverDatas.selectStatus,
					target_profit_price:this.target_profit_prices,
					stop_loss_price:this.stop_loss_prices
					//target_price: this.leverDatas.controlPrice,
					//target_profit_price: this.target_profit_price,
					//stop_loss_price: this.stop_loss_price,
				}
			console.log(params,this.leverDatas,"99")
			let res = await this.$u.api.leverSubmit(params).catch(err=>{
				uni.hideToast()
				this.$u.toast(err.message || 'ERROR')
				return false
			})
			
			this.$refs.exModal.clearLoading()	//关闭loading

			if(res){
				this.modalShow = false	//关闭模态
				this.$refs.uToast.show({
									title: res,
									type: 'success'
								})
				
				this.target_profit_prices = ''
				this.stop_loss_prices = ''
				//uni.showLoading()
				Promise.all([this.leverDeal()]).then((t)=> {
					//uni.hideLoading()
						this.submitSuccess()
					}
				).catch(err=>{
					setTimeout(()=>{
						uni.hideLoading()
					},1500)
				})
				
			}
		},
		changeInput:function(obj){
			let val = obj.detail.value
			if(val!='' && Number(val) < 1){
				this.$u.toast(this.$t('lever.index.ssbnxy1'))
				this.leverDatas.share = null		
				this.calculation()
				return false
			}
			if(val!='' && val%1!==0){
				this.$u.toast(this.$t('lever.index.bxszzs'))
				this.leverDatas.share = null
				this.calculation()
				return false
			}
			
			this.calculation()
		},
		clear:function(){
			this.leverDatas.share = null
			this.shoushuBi = 0
			this.calculation()
		},
		calculation:function() {	//计算
			
			let bond = this.iTofixed(this.leverDatas.lastPrice,4);	//最后价格
			let share = this.iTofixed(this.leverDatas.share,4);	//交易手数
			let muit = this.iTofixed(this.leverDatas.muitNum,4);	//倍数
			let spread = this.iTofixed(this.leverDatas.spread,4);
			
			let pricesTotal = 0;
			if (this.buysellTabIndex==1) {	//sell
				pricesTotal = this.iTofixed(Number(bond) - Number(spread),4);
			} else {	//buy
				pricesTotal = this.iTofixed(Number(bond) + Number(spread),4);
			}
			let shareNum = this.iTofixed(this.leverDatas.shareNum ,4);	//1手=XX价格
			let totalPrice = this.iTofixed(pricesTotal * share * shareNum,4);
			
			this.calcData.bonds = this.iTofixed((totalPrice - 0) / (muit - 0),4);	//保证金
			this.calcData.tradeFree = this.iTofixed(totalPrice * this.leverDatas.transactionFee / 100,4);	//手续费
			this.calcData.marketPrice = this.iTofixed(totalPrice,4);	//市值
			
			
		},
		sliderEnd:function(){	//滑块停止
			this.calculation()	//更新估算价格
		},
		beishuSelect:function(arr){
			//console.log(arr)
			this.multipleIndex = arr[0].extra
			this.leverDatas.muitNum = arr[0].value
			this.calculation()	//更新估算价格
		},
		tabChange:function(index){
			this.buysellTabIndex = index
			this.clear()
		},
		marketDepth:function(msg){
			//console.log('marketDepth',msg)
			let buyIn = msg.bids
			let out = msg.asks
			
			let buyOutTotal=0
			let sellOutTotal=0
			
			for(let i=0;i<buyIn.length;i++){
				buyOutTotal+=buyIn[i][1]
			}
			for(let i=0;i<out.length;i++){
				sellOutTotal+=out[i][1]
			}
			
			for(let i=0;i<buyIn.length;i++){
				buyIn[i]['bg']=buyIn[i][1]/buyOutTotal*100+8
			}
			for(let i=0;i<out.length;i++){
				out[i]['bg']=out[i][1]/sellOutTotal*100+8
			}
			//console.log(out)
			this.sellOut = out
			this.buyOut = buyIn
			
		},
		showOrHideCharts:function(){
			this.klineShow = !this.klineShow
		},
		submitSuccess:function(){
			//购买成功
			this.leverDatas.share = null
			if(this.orderTabIndex!=0){
				this.orderTabIndex = 0	//切换回进行中的订单页
			}
			this.$nextTick(()=>{
				this.$refs.plistc.reload()
			})
		},
		clickTab:function(obj){
			this.orderTabIndex = obj.index
		},
		newData:function(obj){//更新数据
			//console.log(obj)
			let newObj =  Object.assign({},this.dealInfo,obj)
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
			
			this.clear()
			
			this.leftMenuPanel('hide')	//隐藏当前面板
			setTimeout(()=>{
				uni.hideLoading()
			},1500) 
		},
		leverDeal:async function(){	//交易信息
			let params = {
				currency_id:this.currency_id,
				legal_id:this.legal_id
			}
			let res = await this.$u.api.leverDeal(params).catch(err=>{})
			
			let multList = []
			res.multiple.muit.forEach((item,index)=>{
				multList.push({label:'x'+item.value,value:item.value,extra:index})
				
			})
			this.multipleIndex = 0
			this.leverDatas.muitNum = multList[0].value;
			this.multList = multList
			
			//this.leverDatas.tip = res.message.lever_burst_hazard_rate;
			this.leverDatas.minShare = res.lever_share_limit.min;
			this.leverDatas.maxShare = res.lever_share_limit.max;
			this.leverDatas.cny = res.ExRAte - 0 || 1;
			this.leverDatas.ustdPrice = res.ustd_price;
			this.leverDatas.lastPrice = res.last_price;
			this.leverDatas.useLegalNum = res.user_lever;
			this.leverDatas.useCurrencyNum = res.all_levers;
			//this.leverDatas.muitNum = that.multList[0].value;
		},
		fetchDeal:async function() {	//获取交易对详情
			let params = {
				currency_id:this.currency_id,
				legal_id:this.legal_id
			}
			let res = await this.$u.api.getDealInfo(params).catch(err=>{})
			
			let d = {
						now_price:(res.now_price*1).toFixed(this.xsw),
						high:res.high,
						low:res.low,
						volume:res.volume,
						change:res.change
					}
					
			this.leverDatas.currencyId = res.currency_id
			this.leverDatas.currencyName = res.currency_name
			this.leverDatas.legalId = res.legal_id
			this.leverDatas.legalName = res.legal_name
			this.leverDatas.shareNum = this.iTofixed(res.lever_share_num,2)
			this.leverDatas.spread = res.spread
			this.leverDatas.transactionFee = res.lever_trade_fee
			
			this.currencyDeal = res
			this.$set(this,'dealInfo',d)
		},
		initLoad:function(options){	//初始化 options={symbol:'BTC/USDT',currency_id:'xxxx',legal_id:'yyyy'}
			this.checkLogin()
			
			if(options && options.symbol){
				this.symbol = options.symbol
				this.legal_id = options.legal_id
				this.currency_id = options.currency_id
				let symbolArr = this.symbol.split('/')
				this.symbolArr = symbolArr
			}
			
			this.xsw = ['BTC','ETH'].indexOf(this.symbolArr[0]) > -1 ? 2 : 4
			
			let e = this;
			
			this.loading = true
			uni.showLoading()
			Promise.all([this.fetchDeal(),this.leverDeal()]).then((function(t) {
				setTimeout(()=>{
					uni.hideLoading()
				},1000)
				setTimeout(()=>{
					e.loading = false
				},50)	//延迟一下 不然K线切换时不刷新
			}
			)).catch((function(t) {
				uni.hideLoading()
				setTimeout(()=>{
					e.loading = false
				},50)
			}
			))
			this.onListen()
		},
		onListen:function(){	//监听相关事件
			
			let e = this
			//监听现价
			uni.$on("closeDetailHeyue", (function(t) {
					if(!t.close || !t.open){
						return
					}
					//console.log('更新现价：',e.xsw,t)
					e.dealInfo.now_price = (t.close*1).toFixed(e.xsw)
					e.dealInfo.open = t.open
				}
			))
		},
		offListen:function(){	//关闭相关监听
			uni.$off("closeDetailHeyue")
		}
	},
	onShow:function(){
		this.onListen()
	},
	onHide:function(){
		this.offListen()
	},
	beforeDestroy:function(){
		uni.$emit('leverDestroy',{status:'close'})
		this.offListen()
	},
	onLoad:function(options){
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
	
	.md-box{
		display: flex;
		flex-direction: column;
		padding: 30rpx;
		font-size: 30rpx;
		.item{
			display: flex;
			align-items: center;
			justify-content: space-between;
			line-height: 2;
		}
	}
	
	.comp-info{
		margin-top: 20rpx;
		margin-bottom: 20rpx;
		padding-top:12rpx;
		border-top: 1rpx solid #2A405C;
		.row{
			display: flex;
			align-items: center;
			justify-content: space-between;
			color:var(--text-color);
			font-size: 24rpx;
			line-height: 54rpx;
		}
	}
	
	.mt15{
		margin-top: 20rpx;
	}
	
	.beishu{
		margin-top:20rpx;
	}
	.shoushu{
		.tips{
			font-size: 24rpx;
			color:var(--text-color);
			margin-top:20rpx;
		}
		.ss-slider{
			margin-top: 30rpx;
			display: flex;
			align-items: center;
			justify-content: space-between;
			color:var(--text-color);
			.uslider{
				flex:1;
				margin:0 18rpx;
			}
			.block{
				width:24rpx;
				height: 48rpx;
				display: block;
				border-radius: 6rpx;
				background: #12B081;
			}
		}
	}
	
	.vinput-box{
		display: flex;
		align-items: center;
		border: 1rpx solid #2A405C;
		border-radius: 8rpx;
		height: 80rpx;
		line-height: 80rpx;
		padding:0 20rpx;
		font-size: 28rpx;
		justify-content: space-between;
		color:var(--text-color);
		.v-right{
			flex:1;
			display: flex;
			align-items: center;
			justify-content: flex-end;
			.v-value{
				color:#fff;
				text-align: right;
				.ssipt{
					text-align: right;
					font-size: 28rpx;
				}
				.ssipt-placeholder{
					font-size: 28rpx;
					color: var(--text-color);
				}
			}
			.vr-label{
				margin-left: 10rpx;
			}
		}
		
	}
	
	.v-buy-box{
		margin: 20rpx 20rpx 0;
		display: flex;
		flex-direction: row;
		align-items: flex-start;
		justify-content: space-between;
		.left{
			width: 55%;
			.uu-tabs{
				display: flex;
				flex-direction: row;
				font-size: 28rpx;
				align-items: center;
				justify-content: space-between;
				.label{
					background: #2A405C;
					color: var(--text-color);
					flex: 1;
					text-align: center;
					line-height: 72rpx;
					border-radius: 6rpx;
					
					&:first-child{
						margin-right: 6rpx;
					}
					&:last-child{
						margin-left: 6rpx;
					}
					&.active{
						&:first-child{
							color: #fff;
							background: #12B081;
						}
						&:last-child{
							color: #fff;
							background: #fc6668;
						}
					}
				}
			}
		}
		.right{
			flex:1;
			.market-depth{
				display: flex;
				flex-direction: column;
				font-size: 24rpx;
				padding-left: 20rpx;
				
				.now-price{
					line-height: 60rpx;
					font-weight: bold;
					/*background-color: #2a405c;*/
					font-size: 30rpx;
					&.brand {
						color: #fc6668
					}
					&.green {
						color: #12B081
					}
				}
				.title{
					color: var(--text-color);
					line-height: 1.5 !important;
				}
				
				.row{
					display: flex;
					justify-content: space-between;
					align-items: center;
					position: relative;
					line-height: 60rpx;
					.r-left{
						z-index: 1;
						position: relative;
					}
					.r-right{
						z-index: 1;
						position: relative;
						color:var(--text-color);
						padding-right: 10rpx;
					}
					.bg-sell{
						position: absolute;
						background:rgba(252,102,104,.1);
						top: 0;
						right: 0;
						height: 100%;
					}
					.bg-buy{
						position: absolute;
						background: rgba(45,226,180,.1);
						top: 0;
						right: 0;
						height: 100%;
					}
				}
				
				.sell-out{
					height: 300rpx;	//5行
					overflow-x:hidden;
					overflow-y: auto;
					.r-left{
						color:#fc6668
					}
				}
				
				.buy-in{
					height: 300rpx;	//5行
					overflow-x:hidden;
					overflow-y: auto;
					.r-left{
						color:#ffc107
					}
				}
				
			}
		}
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
		height: 80vw;
	    max-height: 800rpx;
		&.hideKline{
			height: 0px;
			overflow: hidden;
		}
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
			//font-weight: 700;
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
		display: flex;
		.right-ico{
			margin-left: 20rpx;
		}
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

