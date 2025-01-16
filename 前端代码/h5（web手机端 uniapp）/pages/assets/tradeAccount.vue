<template>
	<view class="v-trade-container dark">
		<lw-navbar :title="$t('assets.trade.zbjl')"></lw-navbar>
		<view class="v-trade-content">
			<detail-card class="detail-card-item" :currency="coin" :total="sum" :balance="infoN.balance" :lock_balance="infoN.lock_balance"></detail-card>
			<view class="flow-content">
				<view class="title">
					<ex-title :title="$t('assets.trade.zbjl')"></ex-title>
				</view>
				<flow-list class="flow-list-component" :list="recordList" @loadmore="loadmore"></flow-list>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			coin: "",
			type:null,
			currency_id:null,
			recordList: [],
			info: {},
			loading: false,
			path: {
				deposit: "/pages/assets/deposit/charge",
				withdraw: "/pages/assets/withdraw/detail",
				option: "/pages/option/detail",
				trade: "/pages/trade/otc"
			},
			pagination: {
				page: 1,
				limit: 10,
				total: 0
			}
		}
	},
	onLoad: function(t) {
		if(!this.checkLogin()){
			return
		}
		this.type = t.type,
		this.currency_id = t.id,
		this.init()
	},
	computed: {
		infoN:function(){
			const info = this.info
			let typeStr = this.typeIdToStr(this.type)
			let obj = {
				balance:info[typeStr+'_balance']*1,
				lock_balance:info['lock_'+typeStr+'_balance']*1
			}
			return obj
		},
		sum: function() {
			const info = this.infoN
			if (!info.balance)
				return "0.0000"
			return (info.balance+info.lock_balance).toFixed(4)
		},
		isReachBottom: function() {
			return !(this.pagination.page * this.pagination.limit < this.pagination.total)
		},
		isEmpty: function() {
			return 0 === this.recordList.length
		}
	},
	onPullDownRefresh: function() {
		this.init(),
		setTimeout((function() {
			uni.stopPullDownRefresh()
		}
		), 1e3)
	},
	onReachBottom: function() {
		this.loadmore()
	},
	methods: {
		typeIdToStr:function(type){
			const obj = {
				'1':'legal',	//法币
				'2':'change',	//币币
				'3':'lever',	//合约（杠杆）
				'4':'micro',	//期权秒合约
				}
			return obj[type]
		},
		loadmore: function() {
			this.isReachBottom || (this.pagination.page++,
			this.fetchList())
		},
		init: function() {
			this.pagination.page = 1,
			this.fetchDetail(),
			this.fetchList()
		},
		fetchDetail: function() {
			let params = {
					currency: this.currency_id,
					type: this.typeIdToStr(this.type)
				};
			this.loading = true,
			this.$u.api.walletDetail(params).then(res=> {
				this.loading = false
				this.info = res
				this.coin = res.currency_name
			}
			).catch(err=>{
				this.loading = false
			})
		},
		fetchList: function() {
			let params = {
				currency: this.currency_id,
				type: this.type,
				page: this.pagination.page,
				limit: this.pagination.limit
			};
			this.loading = true
			this.$u.api.walletLog(params).then(res=> {
				this.loading = false
				let list = res.list;
				this.pagination.total = res.count
				if (1 === this.pagination.page)
					this.recordList = list;
				else
					list.forEach(item=>{
						this.recordList.push(item)
					})
			}).catch(err=>{
				this.loading = false
			})
		}
	}
}
</script>

<style lang="scss" scoped>
.v-trade-container {
	height: calc(100vh - 44px - 0px);
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
	position: sticky;
	top: 0;
	.v-trade-content {
		height: calc(100vh - 44px - 0px);
		padding-top: 19px;
		.detail-card-item {
			flex: 0 0 auto
		}
		.flow-content {
			height: calc(100% - 320rpx - 70rpx - 38rpx - 44px - 0px);
			margin-top: 70rpx;
			position: relative;
			.title {
				flex-shrink: 0;
				margin-bottom: 38rpx
			}
		}
	}
}

</style>
