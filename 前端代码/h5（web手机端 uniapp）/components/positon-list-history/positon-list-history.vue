<template>
	<view class="positon-list-container positon-list-container-dark">
		<view class="postion-list-empty-wraps bg-theme" v-if="isEmpty">
			<empty-container></empty-container>
		</view>
		<view class="postion-list-wraps" v-else>
			<view class="position-list-card-item" v-for="(item,index) in newList" :key="index">
				<view class="position-list-line">
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.history.shuliang')}}</view>
						<view class="list-item-value">{{item.number*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.history.gmjg')}}</view>
						<view class="list-item-value">{{item.open_price*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.history.jgjg')}}</view>
						<view class="list-item-value">{{item.end_price*1}}</view>
					</view>
				</view>

				<view class="position-list-line">
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.history.leixing')}}</view>
						<view class="list-item-value weight" :class="getColorByType(item.type)">{{getType(item.type)}}
						</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.history.yingkui')}}</view>
						<view class="list-item-value" :class="getColorByFacts(item.fact_profits)">
							{{item.fact_profits*1}}</view>
					</view>
					<view class="position-list-item">
						<view class="list-item-label">{{$t('option.history.gmsj')}}</view>
						<view class="list-item-value">{{item.created_at | dateFrm}}</view>
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
	import moment from "moment" 
	export default {
		name: "positon-list-history",
		data() { 
			return {
				newList: [],
				typeStatus: 3, //1交易中 2平仓中 3已平仓
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
				}
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
			}
		},
		methods: {
			microTradeList: function() { //获取交易对详情
				if (this.status != 'loadmore' || !this.match_id) { //非待加载状态
					return false
				}
				/*
							if(!this.match_id){	//如果没有交易对ID 等待100毫秒后再试
								setTimeout(()=>{
									this.microTradeList()
								},100)
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
			getType: function(t) {
				switch (t) {
					case 0:
					case "0":
						return this.$t("option.history.type1");
					case 1:
					case "1":
						return this.$t("option.history.type2");
					case 2:
					case "2":
						return this.$t("option.history.type3")
				}
			},
			getColorByType: function(t) {
				return 1 == t ? "green" : 2 == t ? "red" : void 0
			},
			getColorByFacts: function(t) {
				return this.$u.test.isEmpty(t) ? "" : t[0] == '-' ? "red" : Number(t) > 0 ? "green" : void 0
			}
		},
		watch: {
			'match_id': function(newVal) {
				this.matchId = newVal
				this.reload()
			}
		},
		created: function() {
			this.matchId = this.match_id
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
		padding-bottom: 120rpx
	}

	.positon-list-container .position-list-card-item {
		border-bottom: 1rpx solid var(--border-color);
		padding: 20rpx
	}

	.positon-list-container .position-list-line {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin-bottom: 20rpx
	}

	.positon-list-container .position-list-line:last-child {
		margin-bottom: 0
	}

	.positon-list-container .position-list-line .position-list-item {
		flex: 1;

		//text-align: center;
		&:last-child {
			text-align: right;
		}

		&:first-child {
			text-align: left;
		}
	}

	.positon-list-container .position-list-line .position-list-item .list-item-label {
		height: 40rpx;
		line-height: 40rpx;
		color: #909399;
		font-size: 26rpx;
		font-weight: 700
	}

	.positon-list-container .position-list-line .position-list-item .list-item-value {
		font-size: 24rpx
	}

	.positon-list-container .position-list-line .position-list-item .list-item-value.weight {
		font-weight: 700
	}

	.red {
		color: #fc6e6c
	}

	.green {
		color: #13ac59
	}

	.postion-list-empty-wraps {
		background-color: #fff;
		height: 600rpx;
		position: relative
	}
</style>
