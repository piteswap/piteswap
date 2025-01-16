<template>
	<view class="option-buy-popup-wraps">
		<ex-popup class="ex-popup" ref="popup" :class="{'show':show}" @close="close">
			<view class="option-buy-title" slot="title">
				<view>{{$t('option.popup.title1')}}<text class="currency-name">{{currencyName}}</text>{{$t('option.popup.title2')}}<text class="span">{{tradeType=='up'?$t('option.popup.zhang'):$t('option.popup.die')}}</text></view>
			</view>
			<view class="option-buy-content darkStyle">
				<view class="option-form-line">
					<view class="deliver-time-wraps">
						<view class="deliver-time-item" :class="{'active':timeIndex===index}" hover-class="deliver-time-item-hover" hover-stay-time="10" v-for="(item,index) in deliverTime" :key="index" @click="selectTime(item,index)">
							<text class="time-label">{{item.time_desc}}</text>
							<text class="time-value">{{item.profit_ratio}}%</text>
						</view>
					</view>
				</view>
				<view class="option-form-line">
					<view class="option-label">
						<view class="title">{{$t('option.popup.gmsl')}}</view>
						<view class="value">{{$t('option.popup.sxf')}}{{tradeFee}}%</view>
					</view>
					<view class="select-wraps">
						<view class="option-select-container amount">
							<view class="label">{{biName}}</view>
							<u-icon name="arrow-down" size="24" class="option-arrow"></u-icon>
						</view>
						<view class="option-input-container">
							<input class="option-input" type="digit" v-model="inputValue" :placeholder="ivplaceholder" placeholder-class="option-input-placeholder" @input="yujishouyiFun" />
						</view>
					</view>
				</view>
				<view class="option-form-line">
					<view class="option-justify-wrap">
						<view class="left">{{$t('option.popup.yue')}}: {{microBalance*1}} {{biName}}</view>
						<view class="right">{{$t('option.popup.yjsy')}} {{yujishouyi}}{{biName}}</view>
					</view>
				</view>
				<view class="button-wrpas">
					<ex-button-wrap :text="$t('option.popup.ljgm')" className="btn pass-gradient circle large darkStyle" v-if="tradeType=='up'" @click="$u.throttle(submit,1000)"></ex-button-wrap>
					<ex-button-wrap :text="$t('option.popup.ljgm')" className="btn danger-gradient circle large darkStyle" v-else @click="$u.throttle(submit,1000)"></ex-button-wrap>
				</view>
			</view>
		</ex-popup>
		<u-modal v-model="modalShow" :content="$t('option.popup.rztx')" @confirm="$u.route('/pages/verification/basic')" 
		:content-style="{color:'var(--text-color)'}" :confirm-text="$t('common.md_confirm')" show-cancel-button :show-title="false" :cancel-text="$t('common.md_cancel')"></u-modal>
	</view>
</template>

<script>
export default {
	name:"option-buy-popup-wraps",
	props:{
		tradeType:{
			type:String,
			default:''
		},
		currency_name:{
			type:String,
			default:''
		},
		match_id:{
			type:Number | String,
			default:null
		}
	},
	watch:{
		'match_id':function(newVal){
			this.matchId = newVal
		},
		'currency_name':function(newVal){
			this.currencyName = newVal
		}
		
	},
	computed:{
		ivplaceholder:function(){
			return this.timeIndex === -1 ? this.$t('option.popup.qxzqqsj') : this.$t('option.popup.placeholder').replace('{range}',this.deliverTime[this.timeIndex].min_num) +' '+ this.biName
		}
	},
	data() {
		return {
			modalShow:false,
			show:false,
			matchId:null,
			currencyName:'BTC',
			timeIndex:-1,
			inputValue:null,	//购买数量
			deliverTime:[],
			Payable:{},//支付币种
			biName:'USDT',
			microBalance:'0.00',	//支付币种的余额
			tradeCurrencyId:null,	//支付币种的ID
			tradeFee:'0.00',	//手续费
			yujishouyi:'0.00',
			ivPlaceHolder:this.$t('option.popup.qxzqqsj')	//提示文字 
		};
	},
	methods:{
		selectTime:function(item,index){
			this.timeIndex = this.timeIndex === index ? -1 : index
			this.yujishouyiFun()
		},
		close:function(){
			this.panel(false)
			this.timeIndex = -1
			this.inputValue = null
			this.yujishouyi = '0.00'
		},
		panel:function(status){
			this.show = status
			this.$refs.popup.panel(status)
		},
		yujishouyiFun:function(e){	//预计收益计算
			let valstr = 0
			if(this.timeIndex>-1 && this.inputValue*1>0){
				valstr = this.deliverTime[this.timeIndex].profit_ratio * this.inputValue / 100
			}else if(this.timeIndex<0){
				//this.$u.toast('请选择期权时间')
				this.yujishouyi = valstr.toFixed(2)
				return
			}
			this.yujishouyi = valstr.toFixed(2)
		},
		submit: function() {
			if(this.timeIndex<0){
				this.$u.toast(this.$t('option.popup.qxzqqsj'))
				return
			}
			
			if(this.inputValue*1<this.deliverTime[this.timeIndex].min_num){
				this.$u.toast(this.$t('option.popup.sjbnxy')+this.deliverTime[this.timeIndex].min_num)
				return
			}
			
			if(this.microBalance*1 < this.yujishouyi*1){
				this.$u.toast(this.$t('option.popup.yuebuzhu'))
				return
			}
			
			let params = {
						match_id: this.matchId,
						currency_id: this.tradeCurrencyId,
						type: this.tradeType == 'up' ? 1 : 2,	//1买涨 2买跌
						seconds: this.deliverTime[this.timeIndex].seconds,
						number: this.inputValue,
						lang: this.$i18n.locale
					}
					
			this.$u.api.microTradeSubmit(params).then(res=>{
				this.close()
				this.$emit('submitSuccess',true)
				this.microTradePayable()	//更新余额
				uni.showToast({
					icon:'success'
				})
			}).catch(err=>{
				if(err.type=='998'){
					uni.hideToast()
					this.modalShow = true
				}
			})
		},
		microTradeSeconds:function(){
			this.$u.api.microTradeSeconds().then(res=>{
				res.forEach(item=>{
					item.time_desc = this.stToStr(item.seconds)
				})
				this.deliverTime = res
				
			}).catch(err=>{})
		},
		microTradePayable:function(){
			this.$u.api.microTradePayable().then(res=>{
				
				this.Payable = res[0]
				this.biName = res[0].name
				this.microBalance = res[0].user_wallet.micro_with_insurance
				this.tradeCurrencyId = res[0].id
				this.tradeFee = res[0].micro_trade_fee
				
			}).catch(err=>{})
		},
		stToStr:function(seconds){
			let desc = ''
			if(seconds>=3600){
				desc = parseInt(seconds/3600)+'H';
			}else if(seconds>=60){
				desc = parseInt(seconds/60)+'M';
			}else{
				desc = seconds+'S'
			}
			return desc
		},
		reload:function(){
			this.microTradeSeconds()
			this.microTradePayable()
		}
	},
	mounted:function(){
		this.matchId = this.match_id
		this.currencyName = this.currency_name
		this.microTradeSeconds()
		this.microTradePayable()
	}
}
</script>

<style lang="scss" scoped>
.ex-popup-close {
	color: #a6a9b7
}

.option-buy-popup-wraps.down .ex-popup .option-buy-title .span {
	color: #e93f4f!important
}

.option-buy-popup-wraps.down .ex-popup .option-buy-content .deliver-time-item {
	background: linear-gradient(0deg,#c93d4b,#eb4d5c)!important
}

.option-buy-popup-wraps.down .option-justify-wrap .right {
	color: #e93f4f!important
}

.option-buy-popup-wraps .ex-popup {
	.option-buy-title{
		.span {
			color: #15b581;
			margin-left: 16rpx
		}
	}
	.option-buy-content {
		.option-line {
			font-size: 24rpx;
			display: flex;
			align-items: center;
			justify-content: space-between;
			margin-top: 16rpx;
			padding: 30rpx 30rpx;
			font-weight: 700;
			color: #6e728f;
			font-size: 20rpx;
			border-top: 1rpx solid #ebebeb;
			border-bottom: 1rpx solid #ebebeb;
			transform: scaleY(.8);
			.label {
				display: flex;
				align-items: center;
				font-size: 24rpx;
				.label-ongoing {
					margin-left: 10rpx;
					background: url('@/static/images/common/tipsbox.png') no-repeat;background-size: 100% 100%;
					height: 50rpx;
					line-height: 44rpx;
					width: 120rpx;
					padding-left: 8rpx;
					text-align: center;
					color: #15b26f
				}
			}
		}
		.option-form-line {
			padding: 0 30rpx;
			.deliver-time-wraps {
				display: grid;
				grid-template-columns: 33.33% 33.33% 33.3%;
				border: 1rpx solid var(--popup-border-color);
				padding: 20rpx;
				border-radius: 16rpx;
				.deliver-time-item {
					background: linear-gradient(0deg,#11a97c,#12b887);
					border-radius: 8rpx;
					font-weight: 700;
					padding: 10rpx;
					font-size: 30rpx;
					margin-bottom: 20rpx;
					margin-left: 10rpx;
					color: #e5e5e5;
					&.deliver-time-item-hover {
						opacity: .6
					}
					&.active {
						opacity: .4
					}
					.time-label {
						width: 52rpx;
						display: inline-block;
						text-align: right;
						color: #fff
					}
					.time-value {
						opacity: .8;
						margin-left: 10rpx;
						font-weight: 400
					}
				}
			}
			
			.option-justify-wrap {
				display: flex;
				justify-content: space-between;
				align-items: center;
				font-size: 24rpx;
				height: 40rpx;
				.left {
					font-weight: 700;
					color: #717284
				}
				.right {
					color: #15b581
				}
			}
		}
		
		.option-label {
			padding: 20rpx 0;
			display: flex;
			justify-content: space-between;
			.title {
				font-size: 28rpx;
				color: var(--text-color)
			}
			.value {
				color: #a6a9b7
			}
		}
		.select-wraps {
			display: flex;
			.option-input-container {
				flex: 1;
				margin-left: 10rpx;
				border: 1rpx solid var(--popup-border-color);
				display: flex;
				align-items: center;
				padding: 0 20rpx;
				.option-input {
					width: 100%;
					font-size: 24rpx;
					.option-input-placeholder {
						color: #d7d7df
					}
				}
			}
			.option-select-container {
				flex: 1;
				padding: 20rpx;
				display: flex;
				align-items: center;
				border: 1rpx solid var(--popup-border-color);
				border-radius: 8rpx;
				position: relative;
				&.amount {
					flex: 0 0 auto;
					min-width: 180rpx
				}
				.option-arrow {
					position: absolute;
					right: 30rpx
				}
				.label {
					display: flex;
					font-weight: 700;
					.span {
						color: #13b26f;
						font-weight: 700
					}
					.option-select-image {
						width: 40rpx;
						height: 40rpx;
						margin-right: 10rpx
					}
				}
			}
		}
		
		.button-wrpas {
			padding: 0 30rpx;
			margin-top: 20rpx;
			margin-bottom: 20rpx
		}
	}
	
}
</style>
