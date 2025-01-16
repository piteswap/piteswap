<template>
	<view class="orders-page dark" v-if="isLogin">
		<lw-navbar :title='$t("assets.allRecord.title")' :border-bottom="false"></lw-navbar>
		
		<view class="orders-page-content darkStyle">
			<view>
				<view class="scroll-content-wrap">
					<u-tabs-swiper ref="uTabs" swiperWidth="750" bg-color="#E5F0F0" active-color="#29C69D" inactive-color="var(--text-color)" 
						:list="list" :current="current" :is-scroll="false" :bold="false" :font-size="30" :show-bar="true" @change="tabsChange"></u-tabs-swiper>
				</view>
				<swiper :style='{height: windowHeight - 84 + "px"}' :current="swiperCurrent" @transition="transition" @change="animationfinish">
					<swiper-item v-for="(item,index) in tabs" :key="index" class="swiper-item">
						<scroll-view style="height: 100%; width: 100%;" :scroll-y="true" @scrolltolower="onreachBottom">
							<view v-if="financeList[swiperCurrent].length > 0" style="overflow: hidden;">
								<block v-if="swiperCurrent==0"><!--充币记录-->
									<view class="listview bg-theme" v-for="(sub,idx) in financeList[swiperCurrent]" :key="idx">
										
										<view class="rowTop">
											<view class="left">{{$t('assets.allRecord.default[0]')}}({{sub.name}})</view>
											<view class="right">
												<u-tag :text="$t('assets.allRecord.status[0]')" v-if="sub.status==2" mode="dark" type="success" shape="circle" />
												<u-tag :text="$t('assets.allRecord.status[1]')" v-else-if="sub.status==3" mode="dark" type="error" shape="circle" />
												<u-tag :text="$t('assets.allRecord.status[2]')" v-else-if="sub.status==1" mode="dark" type="warning" shape="circle" />
											</view>
										</view>
										<view class="rowBottom">
											<view class="row">
												<view class="left">{{$t('assets.allRecord.default[2]')}}</view>
												<view class="right">{{sub.amount}}</view>
											</view>
											<view class="row">
												<view class="left">{{$t('assets.allRecord.default[5]')}}</view>
												<view class="right">{{sub.created_at |dateFrm}}</view>
											</view>
										</view>
										
									</view>
								</block>
								<block v-else><!--提币记录-->
									<view class="listview bg-theme" v-for="(sub,idx) in financeList[swiperCurrent]" :key="idx">
										
										<view class="rowTop">
											<view class="left">{{$t('assets.allRecord.default[1]')}}({{sub.name}})</view>
											<view class="right">
												<u-tag :text="$t('assets.allRecord.status[0]')" v-if="sub.status==2" mode="dark" type="success" shape="circle" />
												<u-tag :text="$t('assets.allRecord.status[1]')" v-else-if="sub.status==3" mode="dark" type="error" shape="circle" />
												<u-tag :text="$t('assets.allRecord.status[2]')" v-else-if="sub.status==1" mode="dark" type="warning" shape="circle" />
											</view>
										</view>
										<view class="rowBottom">
											<view class="row">
												<view class="left">{{$t('assets.allRecord.default[2]')}}:{{sub.number}}</view>
												<view class="right">{{$t('assets.allRecord.default[3]')}}:{{sub.rate}}</view>
											</view>
											<view class="row">
												<view class="left">{{$t('assets.allRecord.default[4]')}}</view>
												<view class="right">{{sub.real_number}}</view>
											</view>
											<view class="row">
												<view class="left">{{$t('assets.allRecord.default[5]')}}</view>
												<view class="right">{{sub.create_time}}</view>
											</view>
										</view>
										
									</view>
								</block>
								
							</view>
							<view class="empty-wrap" v-else>
								<empty-container></empty-container>
							</view>
						</scroll-view>
					</swiper-item>
				</swiper>
			</view>
		</view>
		
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			isLogin:false,
			showtips: !1,
			loading: !1,
			current: 0,
			swiperCurrent: 0,
			financeList: [[], []],
			list: [{
				name: this.$t("assets.allRecord.label[0]"),
				value: "1",
				index: 0
			}, {
				name: this.$t("assets.allRecord.label[1]"),
				value: "2",
				index: 1
			}],
			clickedItem: {},
			tabs: ["1", "2"],
			show:!1,
			src:'@/static/images/usercenter/icon_default_user_img.png',
			pagination:[{
				page: 1,
				limit: 20,
				total: 0
			}, {
				page: 1,
				limit: 20,
				total: 0
			}]
		}
	},
	created: function() {},
	computed: {
		windowHeight: function() {
			return this.$sysInfo.windowHeight
		},
		currentTab: function() {
			return this.list[this.swiperCurrent]
		}
	},
	onLoad: function() {
		if(!this.checkLogin()){
			return
		}
		this.isLogin = true
		this.init()
	},
	onPullDownRefresh: function() {
		this.init(),
		setTimeout((function() {
			uni.stopPullDownRefresh()
		}
		), 2e3)
	},
	methods: {
		init: function() {
			if(!this.checkLogin()){
				return
			}
			var t = this
			this.loading = !0
			
			this.pagination[this.swiperCurrent].page = 1
			
			Promise.all([this.fetchFinanceList()]).then((function(e) {
				uni.stopPullDownRefresh(),
				t.loading = !1
			}
			)).catch((function(e) {
				t.loading = !1
			}
			))
		},
		tabsChange: function(t) {
			this.swiperCurrent = Number(t)
		},
		transition: function(t) {
			var e = t.detail.dx;
			this.$refs.uTabs.setDx(e)
		},
		animationfinish: function(t) {
			var e = t.detail.current;
			this.$refs.uTabs.setFinishCurrent(e),
			this.swiperCurrent = e,
			this.current = e,
			this.fetchFinanceList()
		},
		onreachBottom: function() {
			var t = this.currentTab.index
			  , e = this.pagination[t];
			e.page * e.limit < e.total && (e.page++,
			this.fetchFinanceList())
		},
		fetchFinanceList: async function() {
			let a = this.currentTab.index,
				o = this.pagination[a]
				
			let params = {
				page: o.page,
				limit: o.limit
			}

			uni.showLoading()
			let res
			if(a===0){
				res = await this.$u.api.chongbiLog(params).catch(err=>{ uni.hideLoading() })
			}else{
				res = await this.$u.api.tibiLog(params).catch(err=>{ uni.hideLoading() })
			}
			uni.hideLoading()
			
			let list = res.data
			o.total = res.total
			
			if(o.page==1){
				this.$set(this.financeList,a,list)
				//console.log(this.financeList[a])
			}else{
				list.forEach(item=>{
					this.financeList[a].push(item)
				})
			}
			
		}
	}
}
</script>

<style lang="scss" scoped>
.orders-page-content {
	background-color: #f5f5f5
}

.orders-page-content .scroll-content-wrap {
	position: sticky;
	top: calc(44px + 0px);
	z-index: 99
}

.orders-page-content .scroll-content-wrap .u-scroll-bar {
	width: 76rpx;
	background-color: #29c69d!important;
	height: 4rpx!important
}

.orders-page-content.darkStyle {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed
}

.orders-page-content.darkStyle .u-tabs {
	background-color: #18283d!important
}

.orders-page-content.darkStyle .listview {
	background-color: rgba(37,68,96,.4)
}

.orders-page-content.darkStyle .listview .rowBottom {
	color: #e2e8e4
}



.listview {
	margin: 30rpx;
	padding: 20rpx 30rpx;
	background-color: #fff;
	border-radius: 10rpx;
	
	.rowTop{
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-between;
		line-height: 2;
		margin-bottom: 10rpx;
		padding-bottom: 20rpx;
		border-bottom: 1rpx dashed #768da9;
	}
	.rowBottom{
		.row{
			display: flex;
			flex-direction: row;
			align-items: center;
			justify-content: space-between;
			line-height: 2;
			color:var(--text-color);
		}
	}
}


.empty-wrap {
	height: 100%
}
</style>
