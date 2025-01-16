<template>
	<view class="purchase_root">
		<section class="header">
			<image src="../../static/images/common/fanhui.png" @click="navigateBack"></image>
			{{ $t('currency.mysubscription') }}
		</section>

		<section class="info">
			<span class="title">{{ $t('currency.are_purchasing') }} {{ total }}</span>
			<span class="title">{{ $t('currency.accumulated_return') }} {{ totalInterest }} USDT</span>
			<!-- <div class="info_content">
				<div class="item">
					<span>0</span>
					<span>USDT</span>
				</div>
				<div class="item">
					<span>0</span>
					<span>BTC</span>
				</div>
				<div class="item">
					<span>0</span>
					<span>ETH</span>
				</div>
			</div> -->
		</section>

		<section class="content">
			<div class="title">
				<span :class="{active: active === 1}" @click="active = 1; init()">{{ $t('currency.duringsubscription') }}</span>
				<span :class="{active: active === 2}" @click="active = 2; init()">{{ $t('currency.launched') }}</span>
				<span :class="{active: active === 3}" @click="active = 3; init()">{{ $t('trade.kline.completed') }}</span>
			</div>
			<template v-if="active === 1">
				<div class="item subscription_item" v-for="(item,index) in list" :key="index">
					<span class="item_title">
						<span>{{ $t('currency.new_currencies') }}</span>
						<span v-if="item.exam_status === 1" style="color: rgba(255, 228, 0, 1)">{{ $t('currency.passed') }}</span>
						<span v-if="item.exam_status === 3" style="color: rgba(255, 24, 0, 1)">{{ $t('currency.under_review') }}</span>
					</span>
					<div class="item_labels">
						<span>{{ $t('currency.subscription_amount') }}</span>
						<span>{{ item.amount }}{{ item.currency_name }}</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.subscription_time') }}</span>
						<span>{{ item.created_at }}</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.lockup_period') }}</span>
						<span>{{ item.day }} day</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.estimated_launchtime') }}</span>
						<span>{{ item.online_time }}</span>
					</div>
					<div class="item_labels" style="width: 100%;">
						<span>{{ $t('currency.expected_gross_return') }}</span>
						<span>{{ item.interest_rate }}%</span>
					</div>

					<!-- <div class="btn">
						Details
					</div> -->
				</div>
			</template>

			<template v-if="active === 2">
				<div class="item subscription_item" v-for="(item,index) in list" :key="index">
					<span class="item_title">{{ $t('currency.new_currencies') }}</span>
					<div class="item_labels">
						<span>{{ $t('currency.subscription_amount') }}</span>
						<span>{{ item.amount }}{{ item.currency_name }}</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.subscription_time') }}</span>
						<span>{{ item.created_at }}</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.lockup_period') }}</span>
						<span>{{ item.day }} day</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.estimated_launchtime') }}</span>
						<span>{{ item.online_time }}</span>
					</div>
					<div class="item_labels" style="width: 100%;">
						<span>{{ $t('currency.expected_gross_return') }}</span>
						<span>{{ item.interest_rate }}%</span>
					</div>
				
					<!-- <div class="btn">
						Details
					</div> -->
				</div>
			</template>

			<template v-if="active === 3">
				<div class="item subscription_item" v-for="(item,index) in list" :key="index">
					<span class="item_title">{{ $t('currency.new_currencies') }}</span>
					<div class="item_labels">
						<span>{{ $t('currency.subscription_amount') }}</span>
						<span>{{ item.amount }}{{ item.currency_name }}</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.subscription_time') }}</span>
						<span>{{ item.created_at }}</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.the_total_return_rate') }}</span>
						<span>{{ item.interest_rate }}%</span>
					</div>
					<div class="item_labels">
						<span>{{ $t('currency.total_return') }}</span>
						<span>{{ item.original_interest || 0 }}(USDT)</span>
					</div>

					<!-- <div class="btn">
						Details
					</div> -->
				</div>
			</template>
		</section>
	</view>
</template>

<script>
	export default {
		name: 'Purchase',

		data() {
			return {
				active: 1,
				total: 0,
				totalInterest: 0,
				list: []
			}
		},

		onShow() {
			this.init()
		},

		methods: {
			init() {
				this.$u.api.getOrderList({
					status: this.active
				}).then(res => {
					console.log(res);
					const {
						total,
						total_interest,
						order_list
					} = res
					this.total = total || 0
					this.totalInterest = total_interest || 0
					this.list = order_list
				}).catch(err => {})
			},

			navigateBack() {
				this.$router.go(-1)
			},
		}
	}
</script>

<style lang="scss" scoped>
	.purchase_root {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		overflow-y: scroll;

		.header {
			position: relative;
			width: 100%;
			height: 44px;
			display: flex;
			align-items: center;
			justify-content: center;
			font-size: 18px;
			font-family: PingFang SC;
			font-weight: 500;
			color: #FFFFFF;
			padding: 0 16px;
			box-sizing: border-box;
			flex-shrink: 0;

			image {
				position: absolute;
				width: 9px;
				height: 17px;
				left: 16px;
			}
		}

		.info {
			margin-top: 16px;
			width: calc(100% - 30px);
			padding: 25px 20px;
			box-sizing: border-box;
			background: #2BA693;
			border-radius: 7px;
			display: flex;
			flex-direction: column;

			.title {
				font-size: 14px;
				font-family: PingFang SC;
				font-weight: 500;
				color: #FFFFFF;
				
				&:last-child {
					margin-top: 34px;
				}
			}

			.name {
				width: 100%;
				display: flex;
				align-items: center;
				justify-content: center;
				font-size: 14px;
				font-family: PingFang SC;
				font-weight: 500;
				color: #FFFFFF;
				text-align: center;
				margin-top: 34px;
			}

			.info_content {
				width: 100%;
				display: flex;
				margin-top: 26px;

				.item {
					flex: 1 0;
					display: flex;
					flex-direction: column;
					align-items: center;
					justify-content: center;

					span {
						font-size: 18px;
						font-family: PingFang SC;
						font-weight: 600;
						color: #FFFFFF;

						&:last-child {
							font-size: 14px;
							font-family: PingFang SC;
							font-weight: 500;
							color: #FFFFFF;
							margin-top: 12px;
						}
					}
				}
			}
		}

		.content {
			width: 100%;
			display: flex;
			flex-direction: column;
			align-items: center;

			.title {
				width: 100%;
				display: flex;
				margin-top: 36px;
				padding: 0 16px;
				box-sizing: border-box;

				span {
					flex: 1 0;
					flex-shrink: 0;
					// overflow: hidden;
					// text-overflow: ellipsis;
					white-space: nowrap;
					font-size: 14px;
					font-family: PingFang SC;
					font-weight: 500;
					color: #FFFFFF;
					display: flex;
					justify-content: center;
				}

				.active {
					color: rgba(6, 171, 142, 1);
				}
			}

			.item {
				width: calc(100% - 30px);
				padding: 24px 20px;
				box-sizing: border-box;
				display: flex;
				flex-wrap: wrap;
				justify-content: flex-end;
				background: #193949;
				border-radius: 7px;
				margin-top: 16px;

				.item_title {
					width: 100%;
					display: flex;
					align-items: center;
					justify-content: space-between;
					font-size: 14px;
					font-family: PingFang SC;
					font-weight: 500;
					color: #06AB8E;
				}

				.item_labels {
					width: 50%;
					display: flex;
					flex-direction: column;
					justify-content: center;
					margin-top: 25px;

					span {
						font-size: 13px;
						font-family: PingFang SC;
						font-weight: 400;
						color: #FFFFFF;

						&:last-child {
							font-size: 15px;
							font-family: PingFang SC;
							font-weight: 600;
							color: #FFFFFF;
							margin-top: 10px;
						}
					}
				}

				.btn {
					width: 96px;
					height: 28px;
					border: 1px solid #2BA693;
					border-radius: 14px;
					font-size: 14px;
					font-family: PingFang SC;
					font-weight: 600;
					color: #2BA693;
					display: flex;
					align-items: center;
					justify-content: center;
					margin-top: 22px;
				}
			}
		}
	}
</style>
