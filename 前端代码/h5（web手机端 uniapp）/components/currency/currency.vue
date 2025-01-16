<template>
	<view class="v-container-currency-wrap v-container-wrap-dark">
		<view class="v-card-wrap">
			<view class="account-name-label">
				{{$t(accountName)}}
			</view>
			<view class="v-card-content">
				<view class="title">{{$t("assets.index.zczh")}} (USDT)</view>
				<view class="total">
					<view class="left">{{getContext(info.usdt_totle.toFixed(4))}}</view>
					<view class="right"></view>
				</view>
				<view class="almost">
					≈{{getContext(info.usdt_totle.toFixed(4))}} {{pricing.toUpperCase()}}
				</view>
			</view>
			<view class="v-card-footer">
				<view class="left item" @click="gotoAccount(path.deposit, info)">
					<image class="icon" src="@/static/images/common/index_chongbi.png"></image>
					<text class="card-text">{{ $t('assets.index.chongbi') }}</text>
				</view>
				<view class="center item" @click="gotoAccount(path.withdraw, info)">
					<image class="icon" src="@/static/images/common/index_tibi.png"></image>
					<text class="card-text">{{ $t('assets.index.tibi') }}</text>
				</view>
				<view class="right item" @click="gotoAccount(path.transfer, info)">
					<image class="icon" src="@/static/images/common/ic_user_center_child_transfer.png"></image>
					<text class="card-text">{{ $t('assets.index.huazhuang') }}</text>
				</view>
			</view>
		</view>
		
		<view class="search">
			<search-input :border-bottom="false" @on-search-change="onSearchChange" v-model="searchContent">
				<template v-slot:right>
					<view class="search-right-wrap">
						<view class="search-right-text">{{ $t('assets.index.ycxebz') }}</view>
						<ex-check class="check" @click="switchCheck" v-model="isCheck"></ex-check>
					</view>
				</template>
			</search-input>
		</view>
		
		<view class="account-wrap">
			<view class="card-wrap" v-if="list.length > 0">
				<view class="v-card-item" v-for="(item,index) in list" :key="index" @click="gotoNext(item)">
					<view class="v-card-content">
						<view class="left">
							<view class="v-card-logo">
								<image class="icon-logo" :src="(item.currency_logo.substr(0,4) != 'http' ? webConf.staticUrl : '') + item.currency_logo"></image>
							</view>
							{{item.currency_name}}
						</view>
						<view class="right">
							<view class="value">
								{{getContext( TotalNumber(item) )}}
							</view>
							<view class="tousd">≈ {{getContext(balanceToUSD(item))}} USD</view>
						</view>
					</view>
					<view class="v-card-footer">
						<view class="left item">
							<view class="name">{{ $t('assets.index.keyong') }}</view>
							<view class="value">{{getContext(toBalance(item))}}</view>
						</view>
						<view class="right item">
							<view class="name">{{ $t('assets.index.dongjie') }}</view>
							<view class="value">{{getContext(toLockBalance(item))}}</view>
						</view>
					</view>
				</view>
			</view>
			<view class="empty-wrap" style="height:800rpx;position: relative;font-size: 24rpx;" v-else>
				<empty-container></empty-container>
			</view>
		</view>
		
	</view>
</template>

<script>
export default {
	name:"currency",
	props: {
		info: {
			type: Object
		},
		encrypt: {
			type: Boolean,
			default: !1
		},
		index: {
			type: Number | String,
			default: 0
		},
		isCheck: {
			type: Boolean,
			default: false
		},
		searchContent: {
			type: String,
			default: ""
		},
		pricing: {
			type: String,
			default: ""
		},
		accountName: {
			type: String,
			default: ""
		}
	},
	data: function() {
		return {
			swiperHeight: 0,
			currentTypeName:'change',	//change币币 legal
			path: {
				trade: "/pages/assets/tradeAccount",	//账户详情
				deposit: "/pages/assets/deposit/index",	//充值
				transfer: "/pages/assets/transfer/index",	//划转
				withdraw: "/pages/assets/withdraw/index"	//提现
			}
		}
	},
	mounted: function() {
		this.currentTypeName = this.info.typename
		this.getElementHeight(".v-container-currency-wrap")
	},
	computed: {
		list: function() {
			var t = this
			  , e = this.info.balance.filter((function(e) {
				return t.$u.test.contains(e.currency_name.toLocaleLowerCase(), t.searchContent.toLocaleLowerCase())
			}
			));
			return this.isCheck && (e = this.info.balance.filter((function(a) {
				return 0 != a[t.currentTypeName+'_balance']
			}
			))),
			this.getElementHeight(".v-container-currency-wrap"),
			e
		}
	},
	methods: {
		TotalNumber:function(item){	//总余额
			let name = this.currentTypeName
			return this.biToFixed(item[name+'_balance']*1+item['lock_'+name+'_balance']*1,item.currency_name)
		},
		balanceToUSD:function(item){	//折合美元
			let name = this.currentTypeName
			return (item[name+'_balance']*1*item.usdt_price).toFixed(4)
		},
		toBalance:function(item){	//可用余额
			let name = this.currentTypeName
			return this.biToFixed(item[name+'_balance']*1,item.currency_name)
		},
		toLockBalance:function(item){	//锁定余额
			let name = this.currentTypeName
			return this.biToFixed(item['lock_'+name+'_balance']*1,item.currency_name)
		},
		biToFixed:function(number,currency_name){	//BTC  ETH保留8位小数
			return (number*1).toFixed( ['BTC','btc','ETH','eth'].indexOf(currency_name)>-1 ? 8 : 4)
		},
		getElementHeight: function(t) {
			var e = this;
			setTimeout((function() {
				var a = uni.createSelectorQuery().in(e);
				a.select(t).boundingClientRect(),
				a.exec((function(t) {
					t ? (e.swiperHeight = t[0].height,
					e.$emit("getHeight", {
						index: e.index,
						height: t[0].height
					})) : e.getElementHeight()
				}
				))
			}
			), 200)
		},
		switchCheck: function() {
			this.$emit("switchCheck")
		},
		onSearchChange: function(t) {
			this.$emit("onSearchChange", t)
		},
		gotoAccount: function(url, info) {
			//console.log(url,info)
			var params = {
				form_type:info.typename,
				type:info.type
			};
			this.$u.route(url,params)
		},
		gotoNext: function(obj) {
			this.$u.route(this.path.trade,{type:this.info.type,id:obj.currency})
		},
		getContext: function(t) {
			if (!this.encrypt)
				return t;
			"string" != typeof t && (t = "" + t);
			var e = t.split("").length;
			return "*".repeat(e)
		}
	}
}
</script>

<style lang="scss" scoped>
.v-center {
	display: flex;
	align-items: center
}

.r-center {
	display: flex;
	justify-content: center
}

.center {
	display: flex;
	justify-content: center;
	align-items: center
}

.column {
	display: flex;
	flex-flow: column nowrap
}

.no-shrink {
	flex-shrink: 0
}

.grow {
	flex-grow: 1
}


.page-back {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%
}

.bg {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed
}

.top-bar-height {
	height: calc(44px + 0px)
}

.v-container-currency-wrap{
	&.v-container-wrap-dark{
		.v-card-wrap {
			box-shadow: 0 4rpx 8rpx 0 rgba(39,79,103,.3);
			background: linear-gradient(-34deg,#2a405c,#274c65);
			.v-card-content{
				.title {
					color: #fff
				}
			}
		}
		.account-wrap{
			.v-card-item {
				background: linear-gradient(0deg,#2a405c,#1d556c);
				.v-card-footer {
					border-top: 1rpx dashed #2f4159
				}
			}
		}
	}
	
	.v-card-wrap {
		background: #fff;
		width: 100%;
		padding: 30rpx;
		border-radius: 18rpx;
		z-index: 30;
		box-shadow: 0 0 10rpx #ebecee;
		position: relative;
		box-shadow: 0 14rpx 8rpx 0 rgba(41,198,157,.05);
		.account-name-label {
			height: 54rpx;
			padding-left: 34rpx;
			padding-right: 16rpx;
			position: absolute;
			right: 0;
			top: 0;
			background-color: #FFC107;
			color: #fff;
			font-size: 26rpx;
			border-bottom-left-radius: 40rpx;
			border-top-right-radius: 18rpx;
			display: flex;
			justify-content: center;
			align-items: center
		}
		.v-card-content {
			padding-bottom: 40rpx;
			.title {
				font-size: 24rpx;
				line-height: 60rpx;
				color: #090909
			}
			.total {
				margin: 10rpx 0;
				display: flex;
				justify-content: space-between;
				.left {
					font-size: 40rpx;
					font-weight: 700;
					color: #FFC107
				}
				.right{
					.coin-icon {
						width: 46rpx;
						height: 46rpx
					}
				}
			}
			.almost {
				font-size: 24rpx;
				color: var(--gray)
			}
		}
		
		.v-card-footer {
			display: flex;
			justify-content: space-between;
			border-top: 1rpx solid var(--border-color);
			align-items: center;
			padding-top: 20rpx;
			.icon {
				width: 40rpx;
				height: 40rpx;
				margin-right: 10rpx
			}
			.item {
				display: flex;
				justify-content: center;
				align-items: center
			}
			.card-text {
				margin-left: 10rpx;
				height: 40rpx;
				line-height: 40rpx;
				font-size: 28rpx;
				font-weight: 500
			}
		}
	}
	
	.search {
		margin: 10rpx 0;
		padding-left: 30rpx;
		padding-right: 10rpx;
		.search-right-wrap {
			display: flex;
			color: #909399;
			align-items: center;
			.check {
				margin-left: 10rpx
			}
		}
	}
	
	.account-wrap {
		.v-card-item {
			padding: 0 30rpx;
			margin-bottom: 20rpx;
			background: #fff;
			border-radius: 16rpx;
			.v-card-content {
				height: 98rpx;
				display: flex;
				justify-content: space-between;
				align-items: center;
				.left {
					display: flex;
					align-items: center;
					font-size: 30rpx;
					font-weight: 700;
					.v-card-logo {
						width: 60rpx;
						height: 60rpx;
						margin-right: 20rpx;
						display: flex;
						justify-content: center;
						align-items: center;
						.icon-logo {
							width: 46rpx;
							height: 46rpx;
							border-radius: 50%
						}
					}
				}
				
				.right {
					text-align: right;
					display: flex;
					align-items: flex-end;
					flex-direction: column;
					.value {
						font-size: 30rpx;
						line-height: 40rpx;
						font-weight: 700
					}
					.arrow {
						margin-left: 14rpx;
						background: url('@/static/images/common/arrow-down.png') no-repeat;background-size: 100% 100%;
						width: 20rpx;
						height: 12rpx;
						transform: rotate(-90deg)
					}
					.tousd{
						color: #909399;
						font-size: 24rpx;
					}
				}
			}
			
			.v-card-footer {
				display: flex;
				align-items: center;
				justify-content: space-between;
				border-top: 1rpx dashed var(--border-color);
				height: 80rpx;
				font-size: 24rpx;
				color: #909399;
				.item {
					display: flex;
					align-items: center;
					.name {
						margin-right: 10rpx
					}
					.value {
						color: #909399
					}
				}
			}
		}
	}
}

</style>
