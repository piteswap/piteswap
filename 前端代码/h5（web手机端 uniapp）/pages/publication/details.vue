<template>
	<view class="publication_root">
		<section class="header">
			<image src="../../static/images/common/fanhui.png" @click="navigateBack"></image>
			{{ $t("currency.subscription") }}
			<!-- <image src="../../static/images/common/购买.png" @click="toPurchase"></image> -->
		</section>
		<section class="contents">
			<div class="item">
				<div class="title">
					<span>{{ currentData.new_currency_name }}</span>
					<!-- <span style="color: rgba(43, 166, 147, 1);">Under subscription</span> -->
				</div>
				<div class="schedule">{{ Number(currentData.num).toFixed(2) }}
					{{ currentData.new_currency_name }}<span>{{ $t('currency.currency') }}
						/</span>{{ (Number(currentData.num) * Number(currentData.change_rate)).toFixed(2) }}
					{{ currentData.new_currency_name }}<span>{{ $t('currency.currency') }}</span>
				</div>	
				<progress class="progress"
					:percent="(((Number(currentData.num) - Number(currentData.last_num || 0)) / Number(currentData.num)) * 100).toFixed(2)"
					show-info activeColor="rgba(43, 166, 147, 1)" backgroundColor="rgba(0, 0, 0, 0.1)"
					:border-radius="4" />

				<div class="form">
					<div class="form_item">
						<span>{{ $t('currency.issue_price') }}</span>
						<span class="special">1 {{ currentData.new_currency_name }} = {{ currentData.change_rate }}
							USDT</span>
					</div>
					<div class="form_item">
						<span>{{ $t('currency.subscription_currencies') }}</span>
						<span>USDT</span>
					</div>
					<div class="form_item">
						<span>{{ $t('currency.subscription_starttime') }}</span>
						<span>{{ currentData.created_at }}</span>
					</div>
					<div class="form_item">
						<span>{{ $t('currency.lockup_period') }}</span>
						<span>{{ currentData.day }} {{ $t('currency.day') }}</span>
					</div>
					<div class="form_item">
						<span>{{ $t('currency.estimated_launchtime') }}</span>
						<span>{{ currentData.online_time }}</span>
					</div>
					<div class="form_item">
						<span>{{ $t('currency.expected_gross_return') }}</span>
						<span>{{ currentData.predict_rate }}</span>
					</div>
					<div class="form_item">
						<span>{{ $t('currency.introduction') }}</span>
						<span>{{ currentData.introduction }}</span>
					</div>
				</div>
			</div>
		</section>

		<section class="buttons">
			<div class="buttons_item input">
				<input v-model="price" type="number" :placeholder="$t('currency.please_enter_the_amount')" />
				<div class="line"></div>
				<picker class="picker" mode="selector" :range="currencyList" value="key" range-key="name"
					@change="onPickChange">
					<view>
						{{ currency.name }}
					</view>
				</picker>
			</div>
			<div class="buttons_item subscription" @click="onSubmit">{{ $t('currency.immediate_subscription') }}</div>
			<!-- <div class="buttons_item soldout" @click="soldout">Sold out</div> -->
		</section>

		<uni-popup ref="popup" type="center" background-color="rgba(27, 44, 66, 1)">
			<div class="popup">
				<span>{{ $t('withdrawCreate.default[3]') }}</span>
				<div class="info">{{ $t('currency.subscription_successful') }}</div>
				<div class="btn" @click="onConfirm">{{ $t('currency.confirm') }}</div>
			</div>
		</uni-popup>
	</view>
</template>

<script>
	export default {
		name: 'Publication',
		data() {
			return {
				list: [],
				currency: {
					key: 'USDT',
					name: 'USDT'
				},
				currencyList: [{
						key: 'USDT',
						name: 'USDT'
					},
					// {
					// 	key: 'BTC',
					// 	name: 'BTC'
					// },
					// {
					// 	key: 'ETH',
					// 	name: 'ETH'
					// }
				],
				currentData: {},
				price: "",
			};
		},

		computed: {
			id() {
				return this.$route.query.id
			}
		},
		
		watch: {
			id: {
				handler() {
					console.log('onShow');
					this.init()
				},
				immediate: true
			}
		},

		methods: {
			init() {
				if (!this.id) return
				this.$u.api.getPurchaseDetails({
					id: this.id
				}).then(res => {
					console.log(res);
					this.currentData = res
				}).catch(err => {})
			},

			onOpenClick(data) {
				for (let item of this.list) {
					item.isOpen = false
				}
				data.isOpen = true
			},

			onPickChange(e) {
				const index = e.target.value
				console.log(index);
				this.currency = this.currencyList[index]
			},

			onSubmit() {
				if (!this.price || isNaN(this.price))
					return this.$u.toast(this.$t('currency.please_enter_the_amount'));

				this.$u.api.sendOrder({
					amount: this.price,
					config_id: this.currentData.id,
				}).then(res => {
					this.$u.toast(this.$t('currency.subscription_successful'));
					this.price = ''
					setTimeout(() => {
						this.$router.go(-1)
					}, 1500)
				}).catch(err => {})
			},

			onConfirm() {
				this.$refs.popup.close()
			},

			navigateBack() {
				window.history.go(-1)
			},

			toPurchase() {
				this.$u.route("/page/publication/purchase")
				// this.$u.route('/page/publication/purchase')
			}
		}
	}
</script>

<style lang="scss" scoped>
	.publication_root {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
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

		.contents {
			width: 100%;
			display: flex;
			flex-direction: column;
			align-items: center;

			.item {
				margin-top: 16px;
				width: 385px;
				flex-shrink: 0;
				background: rgba(25, 57, 73, 1);
				border-radius: 6px;
				display: flex;
				flex-direction: column;
				padding: 20px;
				box-sizing: border-box;
				transition: all 0.3s;

				&:last-child {
					margin-bottom: 20px;
				}

				.title {
					width: 100%;
					display: flex;
					justify-content: space-between;
					font-size: 14px;
					font-family: PingFang SC;
					font-weight: 500;
					color: #FFFFFF;
				}

				.schedule {
					width: 100%;
					display: inline;
					font-size: 15px;
					font-family: Heiti SC;
					font-weight: bold;
					color: #FFFFFF;
					margin-top: 20px;

					span {
						font-size: 15px;
						font-family: PingFang SC;
						font-weight: 400;
						color: #FFFFFF;
						margin: 0 6px;
					}
				}

				.lock_time {
					width: 100%;
					margin-top: 20px;
					display: flex;
					flex-direction: column;
					font-size: 13px;
					font-family: PingFang SC;
					font-weight: 400;
					color: #FFFFFF;

					span {
						&:last-child {
							font-size: 15px;
							font-family: PingFang SC;
							font-weight: 600;
							color: #FFFFFF;
							margin-top: 15px;
						}
					}
				}

				.progress {
					height: 7px;
					margin-top: 17px;

					/deep/ .uni-progress-bar {
						height: 100% !important;
					}
				}

				.btns {
					width: 100%;
					display: flex;
					align-items: flex-start;
					justify-content: space-between;
					margin-top: 20px;

					span {
						font-size: 13px;
						font-family: PingFang SC;
						font-weight: 400;
						color: #FFFFFF;
					}

					div {
						width: 96px;
						height: 28px;
						border: 1px solid #2BA693;
						border-radius: 14px;
						display: flex;
						align-items: center;
						justify-content: center;
						font-size: 14px;
						font-family: PingFang SC;
						font-weight: 600;
						color: #2BA693;
					}
				}

				.form {
					margin-top: 4px;
					width: 100%;
					display: flex;
					flex-direction: column;

					.form_item {
						width: 100%;
						margin-top: 20px;
						display: flex;
						align-items: center;
						justify-content: space-between;
						word-break: unset;

						span {
							flex: 1 0;
							font-size: 13px;
							font-family: PingFang SC;
							font-weight: 400;
							color: rgba(255, 255, 255, 0.5);
							
							&:first-child {
								white-space: nowrap;
							}
							
							&:last-child {
								text-align: right;
							}
						}

						.special {
							font-size: 14px;
							font-family: JDZhengHT;
							font-weight: 400;
							color: #2BA693;
						}
					}
				}
			}
		}

		.buttons {
			width: 100%;
			display: flex;
			flex-direction: column;
			margin-bottom: 20px;

			.buttons_item {
				width: calc(100% - 30px);
				margin: 16px 15px 0 15px;
				height: 48px;
				border-radius: 4px;
			}

			.input {
				margin: 0 15px 0 15px;
				background: #F2F5FB;
				padding: 0 18px;
				box-sizing: border-box;
				display: flex;
				align-items: center;

				input {
					flex: 1 0;
					display: flex;
					align-items: center;
				}

				.line {
					width: 1px;
					height: 22px;
					margin: 0 11px;
					background-color: rgba(0, 0, 0, 1);
				}

				.picker {
					width: 50px;
					height: 100%;
					font-size: 15px;
					font-weight: 600;
					color: #2BA693;
					display: flex;
					align-items: center;
					justify-content: center;
				}
			}

			.subscription {
				background: #2BA693;
				font-size: 18px;
				font-family: PingFang SC;
				font-weight: 600;
				color: #FFFFFF;
				display: flex;
				align-items: center;
				justify-content: center;
			}

			.soldout {
				background: #0D1621;
				font-size: 18px;
				font-family: PingFang SC;
				font-weight: 600;
				color: #FFFFFF;
				display: flex;
				align-items: center;
				justify-content: center;
			}
		}

		/deep/ .uni-progress-info {
			color: #fff;
		}

		.popup {
			padding: 30px 20px;
			width: 358px;
			background: #1B2C42;
			border-radius: 7px;
			box-sizing: border-box;
			overflow: hidden;
			display: flex;
			flex-direction: column;
			align-items: center;

			span {
				width: 100%;
				font-size: 18px;
				font-family: PingFang SC;
				font-weight: 500;
				color: #FFFFFF;
				display: flex;
				justify-content: center;
			}

			.info {
				width: 100%;
				font-size: 15px;
				font-family: PingFang SC;
				font-weight: 400;
				color: #2BA693;
				line-height: 19px;
				display: flex;
				justify-content: center;
				margin-top: 22px;
			}

			.btn {
				width: 177px;
				height: 48px;
				background: #2BA693;
				border-radius: 6px;
				display: flex;
				align-items: center;
				justify-content: center;
				font-size: 18px;
				font-family: PingFang SC;
				font-weight: 400;
				color: #FFFFFF;
				margin-top: 22px;
			}
		}
	}
</style>
