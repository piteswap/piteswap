<template>
	<view class="transfer-card-container">
		<view class="transfer-card darkStyle">
			<view class="top">
				<view class="transfer-from transfer-item">
					<view class="transfer-account">
						<view class="name">{{$t('assets.transfer.form')}}</view>
						<view class="account-name" @click="selectFrom">
							<image class="transfer-icon" src="@/static/images/common/transfer-to.png" mode="aspectFill"></image>
							<text>{{fromText || '--'}}</text>
						</view>
					</view>
				</view>
				<view class="transfer-switch-icon" @click.stop="switchTransferAccount">
					<image class="switch-icon" src="@/static/images/common/conversion.png" mode="aspectFill"></image>
				</view>
				<view class="transfer-to transfer-item">
					<view class="transfer-account">
						<view class="name">{{$t('assets.transfer.to')}}</view>
						<view class="account-name" @click.stop="selectTo">
							<image class="transfer-icon" src="@/static/images/common/transfer-form.png" mode="aspectFill"></image>
							<text>{{toText || '--'}}</text>
						</view>
					</view>
				</view>
			</view>
			<view class="bottom">
				<u-form ref="uForm" :model="form" label-position="top">
					<u-form-item label="" prop="form.code" :border-bottom="false">
						<u-input :value="form.code" :disabled="true" :placeholder="$t('assets.transfer.hzbz')" @click="onCurrencySelect"></u-input>
						<view class="right-content" slot="right" @click="onCurrencySelect">
							<text>{{currencyCode}}</text>
							<u-icon name="arrow-right" label-color="var(--text-color)"></u-icon>
						</view>
					</u-form-item>
					
					<view class="label-line">
						<view class="label">{{$t('assets.transfer.hzsl')}}</view>
						<view class="value">
							<text>{{$t('assets.transfer.khz')}}</text>
							<text class="balance">{{balance}}</text>
							{{currencyCode}}
						</view>
					</view>
					
					<u-form-item label="" prop="form.number" :border-bottom="false">
						<u-input type="digit" :clearable="false" placeholder="0.0000" v-model="form.number" @input="replaceInput"></u-input>
						<view class="right-content" slot="right">
							<view>
								<text>{{currencyCode}}</text>
							</view>
							<view class="bar">|</view>
							<button class="allBtn" :border="false" @click="onSelectAll">
								<text class="all">{{$t('assets.transfer.all')}}</text>
							</button>
						</view>
					</u-form-item>
					
				</u-form>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"transfer-card",
	props: {
		fromText: {
			type: String,
			default: ""
		},
		toText: {
			type: String,
			default: ""
		},
		currencyCode: {
			type: String,
			default: "--"
		},
		balance: {
			type: String | Number,
			default: "--"
		}
	},
	data: function() {
		return {
			form: {
				code: null,
				number: null
			}
		}
	},
	mounted: function() {},
	methods: {
		switchTransferAccount: function() {
			this.$emit("on-transfer-change")
		},
		selectFrom: function() {
			this.$emit("on-select-from")
		},
		selectTo: function() {
			this.$emit("on-select-to")
		},
		onCurrencySelect: function() {
			this.$emit("on-currency-select")
			//console.log("on currency select")
		},
		onSelectAll: function() {
			this.$emit("on-all-click")
		},
		replaceInput: function(l) {
			var e = this
			  , a = /^(([1-9]{1}\d*)|(0{1}))(\.\d{0,8})?$/;
			a.test(l) || setTimeout((function() {
				e.form.number = e.form.number.replace(/^(\-)*(\d+)\.(\d\d\d\d\d\d\d\d).*$/, "$1$2.$3")
			}
			), 100),
			this.$emit("on-input-change", this.form.number)
		}
	}
}
</script>

<style lang="scss" scoped>
.transfer-card-container{
	.transfer-card {
		margin: 30rpx;
		padding: 30rpx;
		border-radius: 20rpx;
		color: #768da9;
		position: relative;
		background: linear-gradient(0deg,#d5f6ee,#d4e1e3);
		&.darkStyle {
			background-color: var(--page-part-color);
			background-image: none
		}
		&::before {
			content: " ";
			position: absolute;
			left: 0;
			top: calc(286rpx + 60rpx / 2);
			width: 60rpx;
			height: 60rpx;
			border-radius: 50%;
			background-color: var(--page-background-color);
			transform: translateY(-50%) translateX(-50%)
		}
		&::after {
			content: " ";
			position: absolute;
			right: 0;
			top: calc(286rpx + 60rpx / 2);
			width: 60rpx;
			height: 60rpx;
			border-radius: 50%;
			background-color: var(--page-background-color);
			transform: translateY(-50%) translateX(50%)
		}
		.top {
			height: 286rpx;
			display: flex;
			justify-content: space-between;
			border-bottom: 1rpx dotted #18171a;
			position: relative;
			.transfer-item {
				flex: 1 0 50%;
				display: flex;
				flex-flow: column nowrap;
				&:first-child {
					align-items: flex-start
				}
				&:last-child {
					align-items: flex-end
				}
				.transfer-account {
					display: flex;
					flex-flow: column nowrap;
					align-items: center;
					.name {
						margin-bottom: 22rpx
					}
					.transfer-icon {
						width: 40rpx;
						height: 40rpx;
						margin-right: 20rpx
					}
					uni-text {
						font-size: 34rpx;
						font-weight: 700
					}
					.account-name {
						display: flex;
						align-items: center;
						min-width: 140rpx
					}
				}
			}
			.transfer-switch-icon {
				position: absolute;
				left: 50%;
				transform: translateX(-50%);
				bottom: 34rpx;
				.switch-icon {
					width: 88rpx;
					height: 88rpx
				}
			}
		}
		
		.bottom {
			/deep/.u-form-item--right {
				background-color: var(--page-background-color);
				min-height: 88rpx;
				line-height: 88rpx;
				border-radius: 10rpx;
				.u-form-item--right__content{
					padding: 0 30rpx;
					min-height: 88rpx;
				}
			}
			/deep/.u-form-item--left__content__label {
				color: var(--text-color);
				padding-left: 32rpx
			}
			.right-content {
				color: var(--text-color);
				padding-left: 10rpx;
				display: flex;
				align-items: center;
				.all {
					color: #FFC107;
					padding-left: 10rpx
				}
				.bar {
					margin-left: 10rpx
				}
				uni-button::after {
					border: none
				}
				uni-text {
					margin-right: 10rpx
				}
				uni-button {
					font-size: 28rpx;
					background: transparent;
					padding: 0 10rpx
				}
			}
			/deep/.uni-input-input {
				color: var(--text-color)
			}
			.label-line {
				display: flex;
				justify-content: space-between;
				padding: 0 30rpx;
				font-size: 26rpx;
				.value .balance {
					margin-left: 20rpx;
					margin-right: 10rpx
				}
			}
		}
	}
}
</style>
