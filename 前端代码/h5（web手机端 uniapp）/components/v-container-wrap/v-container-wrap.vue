<template>
	<view class="v-container-wrap">
		<!--交易面板-->
		<view class="transfer-form">
			<u-form>
				<u-row>
					
					<!--买入-->
					<u-col span="6" style="padding:0">
						<view class="layout" style="margin-right: 10rpx;">
							<view class="buy-wrapper buy-wrapper-dark">
								<view class="form-item-wrap">
									<u-input type="digit" v-model="buyNum" :placeholder="$t('trade.kline.buynum')" min="0" :custom-style="{'color':'#E2E8E4','fontSize':'24rpx'}" @input="inputNumber('buy')"></u-input>
									<view class="label">{{baseCoin}}</view>
								</view>
								<view class="percent-wrap">
									<view class="percent-item" v-for="(item,index) in currencyRate" :key="index" @click="currencyRateTab(item.num,'buy')">{{item.title}}</view>
								</view>
							</view>
							<view class="available">
								<view class="label">{{$t('trade.kline.keyong')}}</view>
								<view class="value">
									<text class="num">{{leverDatas.useLegalNum || '0.00'}}</text><text style="margin-left: 5px;">USDT</text>
								</view>
							</view>
							<view class="transfer-price">
								<view class="label">{{$t('trade.kline.jiaoyie')}}</view>
								<view class="value">
									<text class="num">{{leverDatas.resultPriceBuy || '0.00'}}</text><text style="margin-left: 5px;">USDT</text>
								</view>
							</view>
							<view class="button">
								<ex-button-wrap class-name="buy large darkStyle" :text="$t('trade.kline.buy1')+' '+baseCoin" @click="$u.throttle(submitBtnBuy, 800)"></ex-button-wrap>
							</view>
						</view>
					</u-col>
					
					<!--卖出-->
					<u-col span="6" style="padding:0">
						<view class="layout" style="margin-left: 10rpx;">
							<view class="buy-wrapper buy-wrapper-dark">
								<view class="form-item-wrap">
									<u-input type="digit" v-model="sellNum" :placeholder="$t('trade.kline.sellnum')" min="0" :custom-style="{'color':'#E2E8E4','fontSize':'24rpx'}" @input="inputNumber('sell')"></u-input>
									<view class="label">{{baseCoin}}</view>
								</view>
								<view class="percent-wrap">
									<view class="percent-item" v-for="(item,index) in currencyRate" :key="index" @click="currencyRateTab(item.num,'sell')">{{item.title}}</view>
								</view>
							</view>
							<view class="available">
								<view class="label">{{$t('trade.kline.keyong')}}</view>
								<view class="value">
									<text class="num">{{leverDatas.usebibiNum || '0.00'}}</text><text style="margin-left: 5px;">{{baseCoin}}</text>
								</view>
							</view>
							<view class="transfer-price">
								<view class="label">{{$t('trade.kline.jiaoyie')}}</view>
								<view class="value">
									<text class="num">{{leverDatas.resultPriceSell || '0.00'}}</text><text style="margin-left: 5px;">USDT</text>
								</view>
							</view>
							<view class="button">
								<ex-button-wrap class-name="sell large darkStyle" :text="$t('trade.kline.sell1')+' '+baseCoin" @click="$u.throttle(submitBtnSell, 800)"></ex-button-wrap>
							</view>
						</view>
					</u-col>
					
				</u-row>
			</u-form>
		</view>
		
		<!--历史-->
		<view class="history">
			<view class="entrust-tabs-wrap" style="border-bottom: 1rpx solid var(--border-color); padding-bottom: 10rpx;">
				<view class="bg-theme tabs-flex">
					<ex-tabs-wrap :weight="false" brand :def="false" :list="[$t('trade.kline.orderHistory')]"></ex-tabs-wrap>
					<view class="refresh-data">
						<u-button ripple :loading="loading" shape="circle" size="mini" type="success" throttle-time="1000" :custom-style="{backgroundColor:'#2A405C',color:'#ffc107'}" @click="getOrderList">{{$t('trade.kline.refresh')}}</u-button>
					</view>
				</view>
			</view>
			<order-history-container v-if="leverDatas.legalId && leverDatas.currencyId" :legal-id="leverDatas.legalId" :currency-id="leverDatas.currencyId" ref="orderHistory"></order-history-container>
		</view>
		<u-toast ref="uToast" />
		<u-modal class="exModal" v-model="modalShow" show-cancel-button :title="leverDatas.currencyName+'/'+leverDatas.legalName" :cancel-text="$t('common.md_cancel')" :confirm-text="$t('common.md_confirm')" @confirm="submitBtn">
			<view class="md-box">
				<view class="item">
					<text>{{$t('trade.kline.type')}}</text>
					<text class="ival">{{type==1? $t('trade.kline.buy1') : $t('trade.kline.sell1') }}</text>
				</view>
				<view class="item">
					<text>{{type==1 ? $t('trade.kline.buynum') : $t('trade.kline.sellnum')}}</text>
					<text class="ival">{{type==1?buyNum:sellNum}} {{leverDatas.currencyName}}</text>
				</view>
				<view class="item">
					<text>{{$t('trade.kline.wtjg')}}</text>
					<text class="ival">{{targetPrice}} {{leverDatas.legalName}}</text>
				</view>
				<view class="item">
					<text>{{$t('trade.kline.jiaoyie')}}</text>
					<text class="ival">{{type==1?leverDatas.resultPriceBuy:leverDatas.resultPriceSell}} {{leverDatas.legalName}}</text>
				</view>
			</view>
		</u-modal>
		
	</view>
</template>

<script>
export default {
	name:"v-container-wrap",
	props:{
		baseCoin:{
			type:String,
			default:'BTC'
		},
		leverData:{
			type:Object,
			default:function(){
				return {}
			}
		}
	},
	watch:{
		leverData:function(newVal){
			this.leverDatas = newVal
		}
	},
	data() {
		return {
			loading:false,
			modalShow:false,	//显示模态框
			currencyBuyIndex:'',	//当前买入选择的%
			currencySellIndex:'',	//当前卖出选择的%
			currencyRate:[
				{
					title:"25%",
					num:0.25,
				},
				{
					title:"50%",
					num:0.50,
				},
				{
					title:"75%",
					num:0.75,
				},
				{
					title:"100%",
					num:1,
				},
			],
			type:null,//交易类型1=buy 2=sell
			buyNum:null,
			sellNum:null,
			targetPrice:0,	//目标委托价格
			leverDatas:{},//基础数据
		};
	},
	methods:{
		inputNumber:function(type){	//手动输入
			let ld = this.leverDatas
			if(type == 'buy'){
				let num = this.buyNum
				this.leverDatas.resultPriceBuy = this.iTofixed(ld.controlPrice*num,8)*1	//买入交易额=市价*数量
			}else{
				let num = this.sellNum
				this.leverDatas.resultPriceSell = this.iTofixed(ld.controlPrice*num,8)*1	//买出交易额=市价*数量
			}
			this.targetPrice = ld.controlPrice	//更新委托价格
		},
		currencyRateTab:function(rateNum,type){//点击百分比
			let that=this;
			let ld = this.leverDatas
			this.targetPrice = ld.controlPrice	//目标委托价格
			this.type = type == 'buy' ? 1 : 2;
			
			if(type=="buy"){	//如果是买入
				if(ld.useLegalNum<=0.001){
					this.$u.toast(this.$t('trade.kline.yuebz')+'0.001')
					return
				}
				
				let user_legal_num = ld.useLegalNum*rateNum;	//支出法币 = USDT余额*买入比例
				
				this.buyNum = this.iTofixed(user_legal_num/this.targetPrice,8)*1	//买入数量=使用的货币量/市价
				ld.resultPriceBuy = this.iTofixed(this.buyNum*this.targetPrice,8)*1	//买入交易额
				
			}else{	//如果是卖出
				if(ld.usebibiNum<0.001){
					this.$u.toast(this.$t('trade.kline.yuebz')+'0.001')
					return
				}
				
				let usebibiNum = ld.usebibiNum*rateNum	//要出售的币币数量=用户总数量*卖出比例
				
				this.sellNum = this.iTofixed(usebibiNum,8)*1	//卖出数量
				ld.resultPriceSell = this.iTofixed(usebibiNum*this.targetPrice,8)*1	//卖出交易额
			}
			
		},
		submitBtnBuy:function(){
			this.type = 1
			this.submitBtnSure('buy')
		},
		submitBtnSell:function(){
			this.type = 2
			this.submitBtnSure('sell')
		},
		submitBtnSure:function(type){
			let currencyNum = ( type == 'buy' ? this.buyNum : this.sellNum )
			if(type == 'buy'){
				if(!currencyNum){
					this.$u.toast(this.$t('trade.kline.qsrmrsl'))
					return
				}
				if(this.leverDatas.useLegalNum - this.leverDatas.resultPriceBuy<0){
				   this.$u.toast(this.$t('trade.kline.yuebuzhu'))
				   return
				}
			}else{
				if(!currencyNum){
					this.$u.toast(this.$t('trade.kline.qsrmcsl'))
					return
				}
				
				if(this.leverDatas.usebibiNum - currencyNum<0){
					this.$u.toast(this.$t('trade.kline.kmyebz'))
					return
				}
			}
			
			this.modalShow = true
		},
		submitBtn:function() {
			let that = this
			let currencyNum = ( this.type == 1 ? this.buyNum : this.sellNum )
			
			let params = {
					legal_id: that.leverDatas.legalId,
					currency_id: that.leverDatas.currencyId,
					type: that.type,
					amount:currencyNum,
					target_price: that.targetPrice
				}
			
			this.$u.api.coinTrade(params).then(res=>{
				that.buyNum = null
				that.sellNum = null
				this.leverDatas.resultPriceBuy = null
				this.leverDatas.resultPriceSell = null
				that.getOrderList()	//重新获取交易列表和刷新余额
				that.$refs.uToast.show({
					title: this.$t('common.ac_success'),	//操作成功
					type: 'success'
				})
			}).catch(err=>{})
		},
		refreshOrder:function(obj){
			this.type = null,//重置相关数据
			this.buyNum = null
			this.sellNum = null
			this.targetPrice = 0
			
			this.$refs.orderHistory.reload(obj)
		},
		getOrderList:function(){	//获取交易列表
			this.loading = true
			this.$emit('emitEvent',{name:'getWalletFun',params:null})	//通知父页刷新钱包数据
			this.$refs.orderHistory.reload()
			setTimeout(()=>{
				this.loading = false
			},800)
		}
	},
	created:function(){
		this.leverDatas = this.leverData
	}
}
</script>

<style lang="scss" scoped>
.v-container-wrap {
    color: var(--text-color);
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
}
.tabs-flex{
	background-color: transparent !important;
	display: flex;
	align-items: center;
	justify-content: space-between;
	.refresh-data{
		margin-right: 30rpx;
	}
}
.transfer-form {
    padding: 0 30rpx;
}
.buy-wrapper {
    border: 1rpx solid var(--border-color);
    border-radius: 8rpx;
	
	.form-item-wrap {
	    display: flex;
	    align-items: center;
	    padding: 0 10rpx;
		.label {
		    height: 100%;
		    font-family: DIN-Regular-2;
		    font-size: 30rpx;
		    padding: 0 20rpx;
		    color: var(--text-color);
		}
	}
	.percent-wrap {
	    display: flex;
		.percent-item {
		    flex: 1;
		    border-top: 1rpx solid var(--border-color);
		    border-right: 1rpx solid var(--border-color);
		    text-align: center;
		    color: var(--text-color);
		    padding: 20rpx 0;
		    font-size: 24rpx;
			&:last-child {
				border-right: none;
			}
		}
	}
	
	
	&.buy-wrapper-dark {
		border: 1rpx solid #2f4159;
		.percent-wrap {
			.percent-item {
			    border-top: 1rpx solid #2f4159;
			    border-right: 1rpx solid #2f4159;
			}
		}
	}
	
}
.available {
    display: flex;
    justify-content: space-between;
    color: var(--text-color);
    margin-top: 20rpx;
    font-size: 24rpx;
	.label{
		flex-shrink: 0;
	}
	.value{
		display: flex;
		overflow: hidden;
		.num{
			overflow: hidden;white-space: nowrap;text-overflow: ellipsis;
		}
	}
}
.transfer-price {
    margin-top: 30rpx;
    display: flex;
    color: var(--text-color);
    justify-content: space-between;
    font-size: 24rpx;
	.label{
		flex-shrink: 0;
	}
	.value{
		display: flex;
		overflow: hidden;
		.num{
			overflow: hidden;white-space: nowrap;text-overflow: ellipsis;
		}
	}
}
.button {
    margin-top: 10rpx;
	/deep/ uni-button {
	    font-size: 28rpx!important;
	}
}
</style>
