<template>
	<view class="v-record-container dark">
		<lw-navbar :border-bottom="false" :title='$t("assets.record.hzjl")' class="bg-theme"></lw-navbar>
		<view class="v-record-content bg-theme darkStyle">
			<view class="empty-wraps">
				<view v-if="list.length>0">
					<view class="v-record-item" v-for="(item,index) in list" :key="index">
						<view class="head">
							<text class="span title">{{item.currency_name || ""}}</text>
						</view>
						<view class="content">
							<view class="content-item">
								<text class="span label">{{$t("assets.record.shuliang")}}</text>
								<text class="span value">{{item.value}}</text>
							</view>
							<view class="content-item">
								<text class="span label">{{$t("assets.record.leixing")}}</text>
								<text class="span value">{{item.info}}</text>
							</view>
							<view class="content-item">
								<text class="span label">{{$t("assets.record.shijian")}}</text>
								<text class="span value">{{$u.timeFormat(item.created_time, "hh:MM mm/dd")}}</text>
							</view>
						</view>
					</view>
				</view>
				<view class="empty-wraps" v-else>
					<empty-container></empty-container>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			loading: !1,
			list: [],
			pagination: {
				page: 1,
				limit: 20,
				total: 0
			}
		}
	},
	computed: {
		hasMore: function() {
			return this.pagination.page * this.pagination.limit < this.pagination.total
		}
	},
	onReachBottom: function() {
		var t = this;
		this.hasMore && (this.loading = !0,
		this.pagination.page++,
		Promise.all([this.fetchList()]).then((function(e) {
			t.loading = !1
		}
		)))
	},
	onLoad: function() {
		if(!this.checkLogin()){
			return
		}
		var t = this;
		this.loading = !0,
		Promise.all([this.fetchList()]).then((function(e) {
			t.loading = !1
		}
		))
	},
	methods:{
		fetchList:function(){
			let params = {
				page:this.pagination.page,
				limit:this.pagination.limit
			}
			this.$u.api.walletHzHistory(params).then(res=>{
				if(this.pagination.page==1){
					this.pagination.total = res.total
					this.list = res.data
				}else{
					res.data.forEach(item=>{
						this.list.push(item)
					})
				}
				
			}).catch(err=>{})
		},
		getType: function(t) {
			var e = t.from_name && t.from_name.split("_")[0]
			  , n = t.to_name && t.to_name.split("_")[0];
			return e = e.substring(0, 1).toUpperCase() + e.substring(1, e.length),
			n = n.substring(0, 1).toUpperCase() + n.substring(1, n.length),
			"".concat(e, " ").concat(this.$t("transferRecord.labels[0]"), " ").concat(n)
		}
	}
}
</script>

<style lang="scss" scoped>
.v-record-container .v-record-content {
	background: #fff;
	&.darkStyle{
		background: none !important;
		.v-record-item {
			border-bottom: 1rpx solid #2f4159;
			.content {
				.label {
					color: #7a9aa5!important
				}
				.value {
					color: #e2e8e4!important
				}
			}
		}
	}
	
	.v-record-item {
		padding: 30rpx;
		border-bottom: 1rpx solid var(--border-color);
		.head {
			height: 80rpx;
			line-height: 80rpx;
			.title {
				font-size: 30rpx;
				font-weight: 700
			}
		}
		.content {
			display: flex;
			justify-content: space-between;
			.content-item {
				flex: 1;
				display: flex;
				flex-direction: column;
				font-weight: 700;
				&:last-child {
					text-align: right
				}
				.label {
					font-size: 24rpx;
					color: #909399;
					font-weight: 700;
					margin-top: 20rpx
				}
				.value {
					font-size: 24rpx;
					color: var(--text-color);
					margin-top: 12rpx
				}
			}
		}
	}
}

.empty-wraps {
	height: 100%
}
</style>
