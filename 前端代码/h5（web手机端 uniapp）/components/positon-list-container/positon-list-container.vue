<template>
	<view class="positon-list-container darkStyle">
		<view class="postion-list-empty-wraps" v-if="isEmpty">
			<empty-container></empty-container>
		</view>
		<view class="postion-list-wraps" v-else>
			<view class="position-list-card-item" v-for="(item,index) in newList" :key="index">
				<view class="position-list-line">
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.list.shuliang')}}</view>
						<view class="list-item-value">{{item.number*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.list.gmjg')}}</view>
						<view class="list-item-value">{{item.open_price*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.list.dqjg')}}</view>
						<view class="list-item-value">{{price || item.open_price*1}}</view>
					</view>
				</view>

				<view class="position-list-line">
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.list.leixing')}}</view>
						<view class="list-item-value" :class="getColor(item.type)">{{getItemTypeName(item.type)}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.list.jgsj')}}</view>
						<u-count-down class="list-item-value" :class="getColor(item.type)"
							:timestamp="parseInt(item.remain_milli_seconds/1000)"
							:show-hours="parseInt(item.remain_milli_seconds/1000) > 3600" color="inherit"
							separator-color="inherit" font-size="inherit" :show-border="false" bg-color="transparent"
							@end="endReload"></u-count-down>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.list.gmsj')}}</view>
						<view class="list-item-value">{{item.created_at|dateFrm}}</view>
					</view>
				</view>

			</view>

			<view class="loadmore-box" v-if="status != 'nomore'">
				<u-loadmore :status="status" :load-text="loadText" color="var(--text-color)" font-size="24"
					margin-top="40" margin-bottom="40" @loadmore="fetchMore" />
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		name: "positon-list-container",
		data() {
			return {
				newList: [],
				typeStatus: 1, //1交易中 2平仓中 3已平仓
				price: null,
				matchId: null, //交易对ID
				pagination: {
					page: 1,
					limit: 10
				},
				status: 'loadmore', //通过status设置组件的状态，加载前值为loadmore，加载中为loading，没有数据为nomore
				loadText: {
					loadmore: this.$t('common.loadmore'),
					loading: this.$t('common.loading'),
					nomore: this.$t('common.nomore')
				},
				timer: null
			};
		},
		props: {
			position: {
				type: Object,
				default: function() {}
			},
			match_id: {
				type: Number | String,
				default: null
			},
			currentPrice: {
				type: Number | String,
				default: null
			}
		},
		watch: {
			'match_id': function(newVal) {
				this.matchId = newVal
				this.reload()
			},
			currentPrice: function(newVal) {
				this.price = newVal
			}
		},
		methods: {
			endReload: function() {
				this.timer && clearTimeout(this.timer)
				this.timer = setTimeout(() => {
					this.reload()
				}, 1e3)
			},
			microTradeList: function() { //获取交易对详情
				if (this.status != 'loadmore' || !this.match_id) { //非待加载状态
					return false
				}
				/*
				if(!this.match_id){	//如果没有交易对ID 等待150毫秒后再试
					setTimeout(()=>{
						this.microTradeList()
					},150)
					return false
				}*/
				let params = {
					match_id: this.match_id, //交易对ID
					page: this.pagination.page,
					limit: this.pagination.limit,
					status: this.typeStatus
				}
				this.$u.api.microTradeList(params).then(res => {

					if (this.pagination.page == 1) {
						this.newList = res.data
					} else {
						res.data.forEach(item => {
							this.newList.push(item)
						})
					}

					if (!res.next_page_url) { //如果没有下一页
						this.status = 'nomore' //标记没有新数据了
					}

				}).catch(err => {

				})
			},
			reload: function(match_id) {
				if (match_id) { //父页面传递参数 防止更新不及时
					this.matchId = match_id
				}

				this.pagination.page = 1
				this.status = 'loadmore'
				this.newList = []
				this.microTradeList()
			},
			fetchMore: function() {
				if (this.status !== 'loadmore') {
					console.log('no more or loading')
					return
				}
				this.pagination.page++
				this.microTradeList()
			},
			getItemTypeName: function(t) {
				switch (t) {
					case 1:
					case "1":
						return this.$t("option.list.kanzhang");
					case 2:
					case "2":
						return this.$t("option.list.kandie")
				}
			},
			getColor: function(t) {
				return 1 == t ? "greenStyle" : 2 == t ? "redStyle" : void 0
			}
		},
		created: function() {
			this.matchId = this.match_id
			this.price = this.currentPrice
			this.reload()
		},
		computed: {
			isEmpty: function() {
				return this.$u.test.isEmpty(this.newList)
			}
		}
	}
</script>

<style lang="scss" scoped>
	.positon-list-container {
		padding-bottom: 120rpx;
		min-height: 600rpx;

		.position-list-card-item {
			border-bottom: 1rpx solid var(--border-color);
			padding: 20rpx 0
		}

		.position-list-line {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
			margin-bottom: 20rpx;

			&:last-child {
				margin-bottom: 0
			}

			.position-list-item {
				flex: 1;
				text-align: center;

				.list-item-label {
					height: 40rpx;
					line-height: 40rpx;
					color: #909399
				}

				.list-item-value {
					font-size: 24rpx;

					&.redStyle {
						color: #fc6668
					}

					&.greenStyle {
						color: #13ac59
					}
				}
			}
		}

	}

	.postion-list-empty-wraps {
		position: relative;
		min-height: 600rpx
	}
</style>
