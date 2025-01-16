<template>
	<view class="v-option-table-container">
		<view style="min-height: 500rpx; position: relative;" v-if="rankArr.length<1">
			<empty-container :emptyText="$t('common.nodata')"></empty-container>
		</view>
		<ex-table class="v-option-table bg-theme" v-else>
			<ex-tr class="darkStyle tr-flex" :border-bottom="false">
				<ex-th>{{dataType=='bibi' ? $t('trade.kline.bibi') : dataType=='qiquan' ? $t('trade.kline.option') : dataType=='heyue' ? $t('lever.index.heyue') : '' }}</ex-th>
				<ex-th>{{$t('trade.kline.currentPrice')}}</ex-th>
				<ex-th>{{$t('trade.kline.change')}}</ex-th>
			</ex-tr>
			<ex-tr class="darkStyle tr-flex" :border-bottom="false" v-for="(item,index) in rankArr" :key="item.id" @click="goKLine(item)">
				<ex-td>
					<view class="td-item">
						<view class="logo-wrap">
							<image mode="widthFix" class="logo-image" :src="webConf.staticUrl + item.logo"></image>
						</view>
						<view class="symbol-match">
							{{item.currency_name}}<text class="span">/{{item.legal_name}}</text>
						</view>
					</view>
				</ex-td>
				<ex-td>
					<view class="price">{{item.now_price}}</view>
					<view class="real-price"></view>
				</ex-td>
				<ex-td>
					<ex-label-wrap :class-name="toClass(item.change)">{{item.change || '0.00'}}%</ex-label-wrap>
				</ex-td>
			</ex-tr>
		</ex-table>
	</view>
</template>

<script>
export default {
	name:"option-table-container",
	props:{
		dataType:{
			type:String,
			default:'bibi'	//币币 bibi或期货 qiquan 或合约 heyue
		}
	},
	data() {
		return {
			rankArr:[],
			show:false,
			timer:null,
			loading:false
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
			//this.$u.route({url:'/pages/trade/kline',params:params,type:'redirectTo'} )	//关闭当前页打开新的页
			this.$emit('changeSymbol',params)	//改变交易对指令
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
		},
		getRank:function(){	//获取行情
			if(this.loading){
				//console.log('重复')
				return
			}
			if(this.show!='show'){
				this.timer && clearTimeout(this.timer)
				return	//页面隐藏时不请求
			}
			this.loading = true
			this.$u.api.getRank().then(res=>{
				this.loading = false
				let tmp = []
				if(this.dataType=='bibi'){	//币币
					res[0].quotation.forEach(item=>{
						if(item.is_display == 1 && item.open_coin_trade == 1){	//支持币币的交易对
							tmp.push(item)
						}
					})
				}else if(this.dataType=='qiquan'){	//期权秒合约
					res[0].quotation.forEach(item=>{
						if(item.is_display == 1 && item.open_microtrade == 1){	//支持秒合约的交易对
							tmp.push(item)
						}
					})
				}else if(this.dataType=='heyue'){	//合约(杠杆)
					res[0].quotation.forEach(item=>{
						if(item.is_display == 1 && item.open_lever == 1){	//支持合约的交易对
							tmp.push(item)
						}
					})
				}
				
				this.rankArr = tmp
				
				this.timer = setTimeout(()=>{
					this.getRank()
				},4000)
			}).catch(err=>{
				this.loading = false
			})
		},
		panel:function(status){	//控制面板显示与隐藏show or hide
			this.show = status
			if(status=='show'){
				this.getRank()
			}else{
				this.timer && clearTimeout(this.timer)
			}
		}
	},
	created:function(){
		this.timer && clearTimeout(this.timer)
	},
	beforeDestroy:function(){
		this.timer && clearTimeout(this.timer)
	}
}
</script>

<style lang="scss" scoped>
.v-option-table-container {
	font-size: 24rpx;
	font-weight: 700;
	.v-option-table {
		display: flex;
		flex-direction: column;
		width: 100%;
		border-collapse: collapse;
		box-sizing: border-box;
		/deep/.tr-flex{
			display: flex;
			align-items: center;
			justify-content: space-between;
		}
		.td-item {
			display: flex;
			align-items: center
		}
		.logo-wrap {
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
				height: 36rpx
			}
		}
	}
	
	.v-option-table-head {
		box-sizing: border-box;
		font-size: 24rpx;
		color: #6e728d;
		display: table-row;
		border-bottom: 1rpx solid var(--border-color);
		&::after {
			content: " ";
			position: absolute;
			bottom: 0;
			left: 0;
			right: 0;
			height: 1rpx;
			border-bottom: 1rpx solid var(--border-color)
		}
		.table-head-item {
			height: 58rpx;
			line-height: 58rpx;
			text-align: center;
			display: table-cell;
			&:first-child {
				text-align: left;
				padding-left: 30rpx
			}
			&:last-child {
				text-align: right;
				padding-right: 30rpx
			}
		}
	}
	.table-content-title {
		margin: 30rpx;
		font-size: 30rpx;
		font-weight: 700;
		position: relative;
		padding-left: 20rpx;
		&::before {
			content: " ";
			position: absolute;
			left: 0;
			top: 0;
			width: 12rpx;
			height: 100%;
			background-color: #FFC107
		}
	}
	.v-option-table-content {
		display: table-row;
		.td-item {
			display: table-cell;
			text-align: center;
			height: 58rpx;
			&:first-child {
				text-align: left;
				padding-left: 30rpx
			}
			&:last-child {
				text-align: right;
				padding-right: 30rpx
			}
			&.green {
				color: #13b26f
			}
			&.brand {
				color: #FFC107
			}
			.label {
				color: #c3c3cd
			}
		}
	}
}
</style>
