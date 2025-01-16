<template>
	<view class="orders-page dark">
		<lw-navbar :title='$t("template.financialHosting.default[0]")' :border-bottom="false"></lw-navbar>
		
		<mask-modal @action="maskAction" v-model="showtips">
			<view style="padding:24rpx 0">
				<text>{{$t("template.financialHosting.tips[0]",{amount:penaltyAmount,currencyName:clickedItem.currency_name})}}</text>
			</view>
		</mask-modal>
		
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
								<view class="listview bg-theme" v-for="(sub,idx) in financeList[swiperCurrent]" :key="idx">
									
									<view class="rowTop">
										<view class="rowOneleft">
											<u-image width="60rpx" height="60rpx" :src="getLogo(sub.logo)"></u-image>
											<text>{{sub.currency_name}}</text>
										</view>
										<view class="date" v-if=" sub.status==2 && sub.is_cancel==0 ">{{sub.end_at}}</view><!--完成时间-->
										<view class="date" v-else-if=" sub.status==2 && sub.is_cancel==1 ">{{sub.updated_at}}</view><!--取消时间-->
										<view class="buyBtn" v-if="sub.status==1" @click="showModal(sub)">{{$t("template.financialHosting.default[6]")}}</view>
									</view>
									<view class="rowcenter">
										<view class="left">{{$t("template.financialHosting.default[1]")}}</view>
										<view class="tcenter">{{$t("template.financialHosting.default[2]")}}</view>
										<view class="rig" v-if=" 0 != current">{{getLabelTxt(sub)}}</view>
									</view>
									<view class="rowBottom">
										<view class="left">{{sub.amount}}</view>
										<view class="tcenter">{{(100 * sub.day_rate).toFixed(3)}}%</view>
										<view class="rig" v-if=" 0 != current">{{getValue(sub)}}</view>
									</view>
									
									<block v-if=" sub.status==1 ">
										<view class="rowcenter">
											<view class="left">{{$t("template.financialHosting.default[7]")}}</view>
											<view class="tcenter">{{$t("template.financialHosting.default[9]")}}</view>
											<view class="rig">{{getLabelByIndex(index)}}</view>
										</view>
										<view class="rowBottom">
											<view class="left">{{sub.created_at | dateFrm}}</view>
											<view class="tcenter">{{parseFloat(sub.total_interest)}}</view>
											<view class="rig">{{sub.remain_day}}</view>
										</view>
									</block>
									<block v-else-if=" sub.status==2 && sub.is_cancel!=1 ">
										<view class="rowcenter">
											<view class="left">{{$t("template.financialHosting.default[8]")}}</view>
											<view class="rig">{{$t("template.financialHosting.default[9]")}}</view>
										</view>
										<view class="rowBottom">
											<view class="left">{{sub.updated_at}}</view>
											<view class="rig">{{sub.total_interest}}</view>
										</view>
									</block>
									
								</view>
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
			showtips: !1,
			loading: !1,
			current: 0,
			swiperCurrent: 0,
			financeList: [[], []],
			list: [{
				name: this.$t("template.financialHosting.tabbar[0]"),
				value: "1",
				index: 0
			}, {
				name: this.$t("template.financialHosting.tabbar[1]"),
				value: "2",
				index: 1
			}],
			clickedItem: {},
			tabs: ["1", "2"],
			show:!1,
			src:'@/static/images/usercenter/icon_default_user_img.png',
			path:{
				nickname: "/pages/settings/account/changeNickname",
				contact: "/pages/settings/account/contact",
				change: "/pages/settings/account/switch",
				email: "/pages/settings/account/email"
			},
			pagination:[{
				page: 1,
				limit: 20,
				total: 0
			}, {
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
		penaltyAmount: function() {
			if (this.$u.test.isEmpty(this.clickedItem.amount))
				return 0;
			return this.clickedItem.cancel_fee
		},
		windowHeight: function() {
			return this.$sysInfo.windowHeight
		},
		currentTab: function() {
			return this.list[this.swiperCurrent]
		}
	},
	onLoad: function() {
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
		maskAction:function(type){
			if(type=='confirm'){
				this.onDeemConfirm()
			}else{
				this.showtips = false
			}
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
				limit: o.limit,
				status: this.currentTab.value
			}
			
			uni.showLoading()
			
			let res = await this.$u.api.lHDepositOrder(params).catch(err=>{ uni.hideLoading() })
			uni.hideLoading()
			let list = res.order_list
			o.total = res.total
			
			if(o.page==1){
				//this.financeList[a] = list
				this.$set(this.financeList,a,list)
				//console.log(this.financeList[a])
			}else{
				list.forEach(item=>{
					this.financeList[a].push(item)
				})
			}
			
		},
		getLogo: function(t) {
			return this.webConf.staticUrl + t
		},
		getRight: function(t) {
			return 0 == this.current ? Number(t.remain_day) - Number(t.return_days) : 1 == this.current ? t.type.days : 2 == this.current ? t.penalty || 0 : void 0
		},
		getLabelByIndex: function(t) {
			return 0 == t ? this.$t("template.financialHosting.default[3]") : 1 == t ? this.$t("template.financialHosting.default[4]") : 2 == t ? this.$t("template.financialHosting.default[5]") : void 0
		},
		getValue:function(item){
			if(item.is_cancel == 1){
				return item.cancel_fee+' USDT'
			}else if(item.status==2 && item.is_cancel == 0){
				return item.day	//周期天
			}
		},
		getLabelTxt:function(item){
			if(item.is_cancel == 1){
				return this.$t("template.financialHosting.default[5]")	//违约金
			}else if(item.status==2 && item.is_cancel == 0){
				return this.$t("template.financialHosting.default[4]")	//周期
			}
			
		},
		showModal: function(t) {
			this.clickedItem = t,
			this.showtips = !0
		},
		onDeemConfirm: function() {
			let params = {
				id: this.clickedItem.id
			}
			this.$u.api.lHDepositOrderCancel(params).then(res=>{
				this.$u.toast(res)
				this.fetchFinanceList()
			}).catch(err=>{})
		},
		hideModal: function() {
			this.show = !1
		},
		navback: function() {
			this.navBack(1)
		},
		gotoNext: function(t) {
			uni.navigateTo({
				url: t
			})
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
	border-radius: 10rpx
}

.listview:last-child {
	margin-bottom: 34rpx
}

.listview .rowTop {
	align-items: center;
	height: 100rpx;
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-between
}

.listview .rowTop .rowOneleft {
	flex: 0 0 auto;
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	height: 54rpx;
	line-height: 54rpx
}

.listview .rowTop .rowOneleft uni-text {
	height: 54rpx;
	line-height: 54rpx;
	margin-left: 22rpx
}

.listview .rowTop .date {
	font-size: 24rpx;
	color: #909399
}

.listview .rowTop .buyBtn {
	text-align: center;
	padding: 6rpx 22rpx;
	background: linear-gradient(#fd9578,#fd5b2c);
	border-radius: 10rpx;
	color: #fff
}

.listview .rowcenter {
	font-size: 24rpx;
	color: var(--text-color);
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	uni-view:last-child{
		text-align: right;
	}
}

.listview .rowcenter .left {
	width: 334rpx
}

.listview .rowcenter .tcenter {
	width: 184rpx
}

.listview .rowcenter .rig {
	width: 178rpx;
	text-align: right;
}

.listview .rowBottom {
	font-size: 30rpx;
	margin-top: 10rpx;
	margin-bottom: 10rpx;
	display: flex;
	flex-direction: row;
	font-size: 26rpx;
	justify-content: space-between;
	color: var(--text-color);
	uni-view:last-child{
		text-align: right;
	}
}

.listview .rowBottom .left {
	width: 334rpx
}

.listview .rowBottom .tcenter {
	width: 184rpx
}

.listview .rowBottom .rig {
	width: 178rpx;
	text-align: right;
}


.empty-wrap {
	height: 100%
}
</style>
