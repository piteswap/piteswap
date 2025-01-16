<template>
	<view class="dark">
		<lw-navbar :border-bottom="false" :title='$t("template.financialDetail.default[0]")'>
			<view slot="right">
				<view class="label" @click="$u.route(path.rules)">{{$t("template.financialDetail.default[1]")}}</view>
			</view>
		</lw-navbar>
		
		<view class="buy-page-main-content darkStyle">
			<view class="buy-page-detail-card">
				<view class="card-cell">
					<view class="label">{{$t("template.financialDetail.default[2]").replace("{day}", detailInfo.day || "--")}}</view>
					<view class="value">{{$t("template.financialDetail.default[3]").replace("{day}", detailInfo.day || "--")}}</view>
				</view>
				<view class="card-cell">
					<view class="label">{{$t("template.financialDetail.default[4]")}}</view>
					<view class="value">≈{{toRate(detailInfo.interest_rate)}}%</view>
				</view>
				<view class="card-cell">
					<view class="label">{{$t("template.financialDetail.default[5]")}}</view>
					<view class="value">{{$t("template.financialDetail.default[6]")}}</view>
				</view>
				<view class="card-cell">
					<view class="label">{{$t("template.financialDetail.default[7]")}}</view>
					<view class="value">{{$t("template.financialDetail.default[8]")}}</view>
				</view>
			</view>
			
			<view>
				<view class="detail-row">
					<view class="rowCss">
						<view class="demo-layout bg-purple">{{$t("template.financialDetail.labels[1]")}}({{currency}})</view>
						<view class="demo-layout bg-purple-light">{{$t("template.financialDetail.labels[0]")}}({{currency}})</view>
					</view>
					<view class="rowCss1">
						<view class="demo-layout bg-purple">{{(accountDetail[coinType+'_balance']*1 || 0).toFixed(4)}}</view>
						<view class="demo-layout bg-purple-light">{{expectGain || "0.00"}}</view>
					</view>
				</view>
				
				<view class="acountInfo">
					<view class="title">
						<text>{{$t("template.financialDetail.labels[2]")}}</text>
					</view>
					<view class="inputRow bg-theme">
						<view class="demo-layout bg-purple input-wrap">
							<input type="number" :placeholder='$t("template.financialDetail.placeholder[0]")' @input="onAmountInput" v-model="amount" />
						</view>
						<view class="demo-layout bg-purple-light">
							<text>{{currency}}</text>
						</view>
						<view class="demo-layout bg-purple-dark">
							<view class="line"></view>
						</view>
						<view class="allbtn" @click="onAllClick">{{$t("template.financialDetail.labels[3]")}}</view>
					</view>
				</view>
				
				<view class="limit">
					{{$t("template.financialDetail.labels[5]")}}:{{Number(detailInfo.save_min)}} {{currency}}
				</view>
				<view class="xieyi">
					<u-checkbox-group active-color="#768CA9" :wrap="true">
						<u-checkbox :label-disabled="true" v-model="checkValue">
						<text>{{$t("template.financialDetail.tips[0]")}}</text>
						<text @click="showService = true">{{$t("template.financialDetail.default[9]")}}</text>
						</u-checkbox>
					</u-checkbox-group>
				</view>
				<view class="button-wrap">
					<ex-button-wrap className="circle large darkStyle" :text='$t("template.financialDetail.labels[4]")' theme="primary" :disabled="loading" @click="onSubClick"></ex-button-wrap>
				</view>
			</view>
		</view>
		
		<u-modal :confirm-text='$t("template.financialDetail.labels[6]")' :title="title()" :title-style="titleStyle" confirm-color="var(--brand-color)" v-model="showService">
			<view class="slot-content">
				<rich-text :nodes="content()"></rich-text>
			</view>
		</u-modal>
		
		<u-toast ref="uToast"></u-toast>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			lang: "en",
			showService: !1,
			content_zh: "\n            <h3>平台账户服务协议</h3>\n            <p>1. 平台推出生息账户服务，为平台用户提供闲置数字资产增值服务。</p>\n            <p>2. 生息账户的资产将用于平台的衍生产品以及其他后续风险投资项目业务。</p>\n            <p>3. 平台为生息账户的用户转入的资产提供风险管理服务，依托平台严格的风控体系，充分保障用户理财服务资产安全，安心享收益。</p>\n            <p>4. 用户在使用生息账户服务时，即无条件授权平台将生息收益按照平台的规则进行合理的分配和发放。</p>\n            <p>5. 用户使用生息账户服务时，应当遵守相关国家的法律，保证资产的来源合法合规。</p>\n            <p>6. 用户使用生息账户服务时，应当充分认识到数字资产投资的风险，谨慎操作，量力而行。</p>\n            <p>7. 用户同意在平台所进行的所有投资操作代表其真实投资意愿，并无条件接受投资决策所带来的潜在风险和收益。</p>\n            <p>8. 平台保留暂停、终止生息账户服务的权限，在必要的时候，平台可以随时暂停，终止生息账户服务。</p>\n            <p>9. 由于网络延迟，计算机系统故障及其他可能的不可抗拒因素，可能导致生息服务的执行迟缓，暂停，中止或偏差，将尽力保证但不承诺生息账户服务执行系统运行的稳定和有效，但由于上述因素导致的生息账户服务的最终执行结果与客户预期不同，平台不承担任何责任。</p>\n            <p>10. 用户在使用生息账户服务时，应当遵守《生息账户服务协议》的规定。</p>\n          ",
			content_en: "\n          <h3>Platform Account Service Agreement</h3>\n          <p>1. The platform launches interest-bearing account services to provide platform users with value-added services for idle digital assets.</p>\n          <p>2. The assets of the interest-bearing account will be used for derivative products of the platform and other follow-up venture capital projects.</p>\n          <p>3. The platform provides risk management services for the assets transferred by users of interest-bearing accounts. Relying on the platform's strict risk control system, the platform fully guarantees the security of users' wealth management service assets and enjoys income with peace of mind.</p>\n          <p>4. When the user uses the interest-earning account service, he unconditionally authorizes the platform to distribute and distribute the interest-earning income reasonably according to the platform's rules.</p>\n          <p>5. When using the interest-bearing account service, users should abide by the laws of relevant countries and ensure that the source of assets is legal and compliant.</p>\n          <p>6. When using interest-earning account services, users should fully recognize the risks of digital asset investment, operate cautiously, and do what they can.</p>\n          <p>7. The user agrees that all investment operations performed on the platform represent their true investment intentions and unconditionally accept the potential risks and benefits brought by investment decisions.</p>\n          <p>8. The platform reserves the right to suspend or terminate the interest-bearing account service. When necessary, the platform can suspend and terminate the interest-bearing account service at any time.</p>\n          <p>9. Due to network delays, computer system failures and other possible irresistible factors, the execution of interest-bearing services may be delayed, suspended, suspended or deviated. We will try our best to ensure but not promise the stable and effective operation of the interest-bearing account service execution system, but due to The final execution result of the interest-earning account service caused by the above factors is different from the customer's expectations, and the platform does not assume any responsibilites.</p>\n          <p>10. When using the interest-earning account service, the user shall abide by the provisions of the \"Interest-earning Account Service Agreement\".</p>\n          ",
			title_zh: "平台账户服务协议",
			title_en: "Platform Account Service Agreement",
			titleStyle: {},
			id: null,
			loading: !1,
			currency: "---",
			checkValue: !1,
			coinType:'change',	//固定币币
			currency_id: null,
			detailInfo: {},
			accountDetail: {},
			amount: null,
			Uststyle: {
				backgroundColor: "#ffffff"
			},
			currencyTypesList: [],
			show: !1,
			src: "@/static/images/usercenter/icon_default_user_img.png",
			path: {
				nickname: "/pages/settings/account/changeNickname",
				contact: "/pages/settings/account/contact",
				change: "/pages/settings/account/switch",
				email: "/pages/settings/account/email",
				rules: "/pages/finance/rulePage",
				host: "/pages/finance/ordersPage"
			}
		}
	},
	created: function() {},
	computed: {
		expectGain: function() {
			var t = Number(this.amount);
			return t > 0 ? (t * Number(this.detailInfo.interest_rate) / 100).toFixed(4) : 0
		},
		userInfo: function() {
			return this.$store.state.userInfo
		},
		accountType: function() {
			return this.$store.state.accountType
		},
		accountTypeReverse: function() {
			return "mobile" === this.accountType ? "Email" : "Phone"
		},
		isCanUnbind: function() {
			return !this.$u.test.isEmpty(this.userInfo.email) && !this.$u.test.isEmpty(this.userInfo.mobile)
		}
	},
	onLoad: function(t) {
		var e = uni.getStorageSync("systemLang");
		this.lang = uni.getStorageSync("lang") || e,
		this.id = t.id,
		this.currency_id = t.currency_id;
		Promise.all([this.fetchFinanceInfo(), this.fetchAccountDetail()]).then(function(t) {
			
		})
	},
	methods: {
		content:function(){
			return this['content_'+this.lang]
		},
		title:function(){
			return this['title_'+this.lang]
		},
		fetchFinanceInfo:async function() {
			
			let params = {
				id:this.id
			}
			let res = await this.$u.api.lHDepositProductInfo(params).catch(err=>{})
			this.detailInfo = res
			
		},
		fetchAccountDetail: async function() {
			let params = {
				currency: this.currency_id,
				type:this.coinType	//币币余额
			}
			let res = await this.$u.api.walletDetail(params).catch(err=>{})
			this.accountDetail = res
			this.currency = res.currency_name
		},
		onSubClick: function() {
			var t = this;
			if (this.checkValue)
				if (this.$u.test.isEmpty(this.amount))
					this.$u.toast(this.$t("template.financialDetail.tips[2]"));
				else if (Number(this.amount) < Number(this.detailInfo.save_min))
					this.$u.toast(this.$t("template.financialDetail.tips[3]",{coin:Number(this.detailInfo.save_min)}));
				else {
					
					let params = {
						config_id:this.id,
						amount:Number(this.amount)
					}
					
					this.$u.api.lHDepositSubmit(params).then(res=>{
						
						this.$refs.uToast.show({
							title: res,
							type: 'success'
						})
						
						setTimeout(()=>{
							this.goBack()
						},2000)
						
					}).catch(err=>{})
					
				}
			else
				this.$u.toast(this.$t("template.financialDetail.tips[1]") + this.$t("template.financialDetail.default[9]"))
		},
		onAmountInput: function(e) {
			var i = this
			  , a = e.detail.value
			  , n = /^(([1-9]{1}\d*)|(0{1}))(\.\d{0,4})?$/;
			n.test(a) || setTimeout((function() {
				i.amount = i.amount.replace(/^(\d+)\.(\d{0,4}).*$/, "$1.$2"),
				t.log(i.amount)
			}
			), 100)
		},
		onAllClick: function() {
			this.accountDetail && this.accountDetail[this.coinType+'_balance'] && (this.amount = Number(this.accountDetail[this.coinType+'_balance']))
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
		},
		toRate: function(number) {
			if (!number)
				return "--";
			return ((number *10000 / this.detailInfo.day )/10000).toFixed(2)
		}
	}
}
</script>

<style lang="scss" scoped>
	
.buy-page-main-content {
	background-color: var(--page-background-color);
	height: calc(100vh - 44px - 0px);
	width: 100%;
	padding-top: 30rpx
}

.buy-page-main-content.darkStyle {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed
}

.buy-page-main-content.darkStyle .buy-page-detail-card {
	background: url('@/static/images/common/icon_banner_dark.png') no-repeat;
	background-size: 100% 100%
}

.buy-page-main-content .buy-page-detail-card {
	background: url('@/static/images/common/icon_banner.png') no-repeat;
	background-size: 100% 100%;
	height: 300rpx;
	margin: 0 30rpx 30rpx 30rpx;
	display: flex;
	flex-flow: row wrap;
	justify-content: space-between
}

.buy-page-main-content .buy-page-detail-card .card-cell {
	flex: 1 0 50%;
	display: flex;
	flex-flow: column nowrap;
	align-items: center;
	justify-content: center
}

.buy-page-main-content .buy-page-detail-card .card-cell .label {
	color: #e2e2e2;
	margin-bottom: 18rpx
}

.buy-page-main-content .buy-page-detail-card .card-cell .value {
	color: #fff
}

.limit {
	margin-left: calc(30rpx + 20rpx);
	font-size: 24rpx;
	color: #768da9
}

.subcribe {
	margin: auto;
	text-align: center;
	width: 690rpx;
	height: 90rpx;
	line-height: 90rpx;
	background-color: #FFC107;
	border-radius: 10rpx;
	color: #fff;
	font-size: 30rpx;
	margin-top: 20rpx
}

.xieyi {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	margin-left: 34rpx;
	margin-top: 10rpx
}

.xieyi .u-checkbox__icon-wrap--checked {
	background-color: #768ca9!important;
	border-color: #768ca9!important
}

.xieyi uni-text:first-child {
	color: #768da9;
	font-size: 24rpx
}

.xieyi uni-text:last-child {
	color: #35abc5;
	font-size: 24rpx
}

.line {
	margin: 0 10rpx;
	height: 40rpx;
	width: 1rpx;
	background-color: #e4e4e4
}

.allbtn {
	width: 80rpx;
	text-align: center;
	color: #FFC107
}

body.pages-finance-index body.pages-finance-buyPage uni-page-body {
	color: #3478f5!important
}

.uni-input-input {
	background-color: #fff!important
}

.rowCss {
	padding: 20rpx 40rpx;
	display: flex;
	flex-direction: row;
	justify-content: flex-start
}

.rowCss uni-view:first-child {
	text-align: start;
	flex: 1;
	margin-right: 10rpx
}

.rowCss uni-view:last-child {
	text-align: start;
	flex: 1
}

.rowCss .demo-layout {
	font-size: 26rpx
}

.inputRow {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
	background-color: #fff;
	padding: 0 30rpx;
	margin: 0 30rpx;
	border: 2rpx solid rgba(41,192,148,.6);
	border-radius: 16rpx
}

.inputRow .input-wrap {
	padding: 20rpx 10rpx
}

.inputRow .input-wrap .input-placeholder {
	color: inherit
}

.inputRow .allbtn {
	font-size: 28rpx
}

.inputRow .demo-layout {
	flex: 0 0 auto;
	font-size: 28rpx
}

.inputRow .demo-layout:first-child {
	flex: 1
}

.acountInfo {
	font-size: 16rpx;
	margin-top: 44rpx
}

.acountInfo .title {
	font-size: 28rpx;
	padding: 10rpx 34rpx
}

.rowCss1 {
	padding: 10rpx 40rpx;
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	font-size: 26rpx;
	font-weight: 700;
	color: #FFC107
}

.rowCss1 uni-view:first-child {
	text-align: start;
	flex: 1
}

.rowCss1 uni-view:last-child {
	text-align: start;
	flex: 1
}

.listview {
	margin-bottom: 34rpx;
	height: 230rpx;
	width: 100%;
	padding: 20rpx 30rpx;
	background-color: #fff
}

.listview .rowTop {
	align-items: center;
	height: 100rpx;
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-between
}

.listview .rowTop .buyBtn {
	height: 30rpx;
	line-height: 30rpx;
	width: 126rpx;
	height: 54rpx;
	line-height: 54rpx;
	text-align: center;
	background-color: #2c64ef;
	border-radius: 10rpx;
	color: #fff
}

.listview .rowcenter {
	font-size: 24rpx;
	color: #d5d5d5;
	display: flex;
	flex-direction: row
}

.listview .rowcenter .left {
	width: 334rpx
}

.listview .rowcenter .center {
	width: 184rpx
}

.listview .rowcenter .rig {
	width: 178rpx
}

.listview .rowBottom {
	font-size: 30rpx;
	margin-top: 10rpx;
	color: #000;
	display: flex;
	flex-direction: row
}

.listview .rowBottom .left {
	width: 334rpx
}

.listview .rowBottom .center {
	width: 184rpx
}

.listview .rowBottom .rig {
	width: 178rpx
}

.header {
	width: 100%;
	padding: 0 30rpx
}

.header .headerTop {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	color: #fff;
	padding: 30rpx 30rpx 18rpx 30rpx;
	font-size: 12px
}

.header .headerTop .label {
	padding: 4rpx 20rpx;
	color: #000
}

.header .headerBottom {
	background-color: #fff;
	height: 190rpx;
	margin: auto;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	border-top-left-radius: 20rpx;
	border-top-right-radius: 20rpx;
	padding: 40rpx
}

.header .headerBottom .left {
	display: flex;
	flex-direction: column;
	flex: 1;
	justify-content: center;
	text-align: center
}

.header .headerBottom .left uni-text:first-child {
	color: #fff
}

.header .headerBottom .left uni-text:last-child {
	color: #92caff
}

.header .headerBottom .rowOneleft {
	display: flex;
	flex-flow: column nowrap;
	justify-content: flex-start;
	height: 54rpx;
	line-height: 54rpx
}

.header .headerBottom .rowOneleft .text-item:first-child uni-text {
	color: #c0c4cc!important
}

.header .headerBottom .rowOneleft .text-item:last-child uni-text {
	font-size: 30rpx
}

.header .headerBottom .rig {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 54rpx;
	line-height: 54rpx
}

.header .headerBottom .rig uni-text:first-child {
	color: #9c9c9c
}

.header .headerBottom .rig uni-text:last-child {
	color: #5fb180;
	width: 160rpx
}

.blueCard {
	height: 200rpx;
	padding: 0 30rpx;
	background-color: var(--page-part-color)
}

.blueCard .cardContent {
	border-bottom-left-radius: 20rpx;
	border-bottom-right-radius: 20rpx;
	background: url('@/static/images/common/background.png') no-repeat;
	background-size: 100%;
	background-clip: initial;
	background-position: bottom;
	height: 180rpx;
	width: 100%;
	padding: 40rpx;
	color: #fff
}

.button-wrap {
	padding: 0 30rpx;
	margin-top: 30rpx
}

.slot-content {
	padding: 30rpx;
	height: 500rpx;
	font-size: 26rpx;
	overflow: auto
}
</style>
