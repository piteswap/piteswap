<template>
	<view class="v-container-wrap dark">
		<lw-navbar :border-bottom="false" :title='$t("assets.addWithdrawAddress.default[0]")'></lw-navbar>
		<view class="tip">{{title}}</view>
		<view class="v-content-wrap">
			<view class="tips">
				<text class="tips-text">{{$t("assets.addWithdrawAddress.tips[1]")}}</text>
				<text>{{$t("assets.addWithdrawAddress.tips[2]")}}</text>
			</view>
			<view class="content-address">
				<view class="address-wrap" v-if="isListEmpty">
					<view class="address-item" v-for="(item,index) in list" :key="index">
						<view class="label">{{$t("assets.addWithdrawAddress.default[0]")}}</view>
						<view class="value">[{{item.nettype}}] {{item.address}}</view>
						<view class="icon-wrap" @click="del(item)">
							<ex-icon name="del-light" size="small"></ex-icon>
						</view>
					</view>
				</view>
				<empty-container v-else :emptyText='$t("assets.addWithdrawAddress.default[1]")'></empty-container>
			</view>
			<view class="button-wrap">
				<ex-button-wrap className="circle large darkStyle" theme="primary" @click="gotoNext" :text='$t("assets.addWithdrawAddress.default[2]")'></ex-button-wrap>
			</view>
			
		</view>
		<u-modal v-model="showDel" @confirm="sureDel" :content="$t('assets.withdrawCreate.deltips')" :show-title="false" :content-style="{color:'var(--text-color)'}" show-cancel-button :confirm-text="$t('common.md_confirm1')" :cancel-text="$t('common.md_cancel')"></u-modal>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			showDel:false,
			delObj:{},
			title: "",
			coin: "",
			path: "/pages/user/address/create",
			list: [],
			currency_id: null,
			eventChannel: null,
			currency_code: null
		}
	},
	computed: {
		createParams: function() {
			return {
				coin: this.coin
			}
		},
		isListEmpty: function() {
			return this.list.length > 0
		},
		addressCoinItem: function() {
			return this.$store.state.addressCoinItem
		},
		currencyProto: function() {
			return this.addressCoinItem.currency_protocols || []
		}
	},
	onLoad: function(t) {
		if(!this.checkLogin()){
			return
		}
		if(!t.coin){
			t.coin = 'USDT'
		}
		this.coin = t.coin,
		this.title = t.coin + " " + this.$t("assets.addWithdrawAddress.default[0]"),
		this.currency_id = t.currency_id,
		this.currency_code = t.code;
	},
	onUnload: function() {
		
	},
	onShow: function() {
		this.fetchAddress()
	},
	methods: {
		del:function(item){
			this.delObj = item
			this.showDel = true
		},
		sureDel:function(){
			this.$u.api.walletDelete({address_id:this.delObj.id}).then(res=>{
				this.$u.toast(res)
				this.fetchAddress()
			}).catch(err=>{})
		},
		gotoNext: function() {
			var t = {
				coin: this.coin,
				currency_id: this.currency_id
			}
			
			this.$u.route({url:this.path,params:t})
		},
		fetchAddress: function() {
			let params = {
				currency:this.currency_id
			}
			this.$u.api.walletGetAddress(params).then(res=>{
				//console.log("aa",res)
				this.list = res
			}).catch(err=>{
				this.list = []
				uni.hideToast()
			})
		}
	}
}
</script>

<style lang="scss" scoped>
.v-content-wrap {
	background-color: #fff;
	height: 100%;
	.button-wrap {
		padding: 20rpx 30rpx;
		position: absolute;
		left: 0;
		right: 0;
		bottom: 0
	}
	.tips {
		padding: 30rpx;
		background-color: #eafcf7;
		color: #FFC107;
		display: flex;
		flex-direction: column;
		font-size: 28rpx;
		.tips-text {
			margin-bottom: 30rpx
		}
	}
	
	.content-address {
		.address-wrap {
			.address-item {
				padding: 20rpx 30rpx;
				position: relative;
				border-bottom: 2rpx solid #ebeef5;
				.icon-wrap {
					position: absolute;
					right: 30rpx;
					top: 50%;
					transform: translateY(-50%)
				}
				.label {
					margin-bottom: 10rpx
				}
				.value {
					font-size: 24rpx;
					font-weight: lighter
				}
			}
		}
	}
}

.delete-icon {
	width: 40rpx;
	height: 40rpx;
	background: url('@/static/images/common/del.png');background-size: 100% 100%;
	margin-right: 20rpx
}

.dark .delete-icon {
	background: url('@/static/images/common/del-light.png');background-size: 100% 100%
}

.v-container-wrap{
	.tip {
		line-height: 60rpx;
		color: #202020;
		padding: 30rpx
	}
	&.dark {
		background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
		background-size: 100% 100%;
		.tip {
			color: #768ca9
		}
		.v-content-wrap {
			background: var(--page-part-color);
			.tips {
				background-color: #2a405c;
				color: #FFC107
			}
			.content-address{
				.address-item {
					border-bottom: 2rpx solid #2f4159;
					.value {
						color: #879aa9
					}
				}
			}
		}
	}
}
</style>
