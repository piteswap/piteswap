<template>
	<view class="publication_root">
		<section class="header">
			<image src="../../static/images/common/fanhui.png" @click="navigateBack"></image>
			{{ $t("currency.subscription") }}
			<image src="../../static/images/common/goumai.png" @click="toPurchase"></image>
		</section>
		<section class="contents">
			<div class="item" v-for="(item,index) in list" :key="index">
				<div class="title">
					<span>{{ item.new_currency_name }}</span>
					<!-- <span style="color: rgba(43, 166, 147, 1);">Under subscription</span> -->
				</div>
				<div class="schedule">{{ Number(item.num).toFixed(2) }}
					{{ item.new_currency_name }}<span>{{ $t('currency.currency') }}
						/</span>{{ (Number(item.num) * Number(item.change_rate)).toFixed(2) }}
					{{ item.new_currency_name }}<span>{{ $t('currency.currency') }}</span>
				</div>
				<div class="lock_time">
					<span>{{ $t('currency.lockup_period') }}</span>
					<span>{{ item.day }} {{ $t('currency.day') }}</span>
				</div>
				<progress class="progress"
					:percent="(((Number(item.num) - Number(item.last_num || 0)) / Number(item.num)) * 100).toFixed(2)"
					show-info activeColor="rgba(43, 166, 147, 1)" backgroundColor="rgba(0, 0, 0, 0.1)"
					:border-radius="4" />
				<div class="btns">
					<span>{{ item.created_at }}</span>
					<div @click="toDetails(item)">{{ $t('currency.immediate_subscription') }}</div>
				</div>
			</div>
		</section>
	</view>
</template>

<script>
	export default {
		name: 'Publication',
		data() {
			return {
				list: []
			};
		},

		onShow() {
			this.init()
		},

		methods: {
			init() {
				this.$u.api.getPurchaseList().then(res => {
					this.list = res || []
				}).catch(err => {})
			},

			// onPickChange(e) {
			// 	const index = e.target.value
			// 	console.log(index);
			// 	this.currency = this.currencyList[index]
			// },

			toDetails(data) {
				this.$router.push({
					path: '/pages/publication/details',
					query: {
						id: data.id
					}
				})
			},

			navigateBack() {
				window.history.go(-1)
			},

			toPurchase() {
				this.$router.push('/pages/publication/purchase')
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


				&:first-child {
					left: 16px;
				}

				&:last-child {
					right: 16px;
					width: 19px;
					height: 18px;
				}
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
						padding: 8px 24px;
						border: 1px solid #2BA693;
						border-radius: 14px;
						display: flex;
						align-items: center;
						justify-content: center;
						font-size: 14px;
						font-family: PingFang SC;
						font-weight: 600;
						color: #2BA693;
						white-space: nowrap;
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

						span {
							font-size: 15px;
							font-family: PingFang SC;
							font-weight: 400;
							color: rgba(255, 255, 255, 0.5);
						}

						.special {
							font-size: 20px;
							font-family: JDZhengHT;
							font-weight: 400;
							color: #2BA693;
						}
					}
				}
			}
		}

		/deep/ .uni-progress-info {
			color: #fff;
		}
	}
</style>
