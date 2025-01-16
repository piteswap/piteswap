<template>
	<view class="v-container-wrap dark" v-if="isLogin">
		<lw-navbar :border-bottom="false" :title='$t("leftMenu.tuiguang")'>
			<view slot="right" class="right" style="margin-right:20rpx">
				<view class="label" @click="gotoReferalRule">{{$t("promotion.default[0]")}}</view>
			</view>
		</lw-navbar>
		
		<view class="v-head-wrap">
			<view class="header-bg-dark">
				<view class="status-bar" :style="{'height':$sysInfo.statusBarHeight+'px'}"></view>
				<view class="title">
					<view class="line1">{{$t("promotion.default[11]",{appName:appName})}}</view>
					<view class="line2">{{$t("promotion.i18n[0]")}} <text class="span num">{{(" " + ( partnerInfo.total_return_rate || 0) + "% ")}}</text>{{(" " + $t("promotion.i18n[1]"))}}</view>
				</view>
			</view>
			<view class="text-content-wrap">
				<view class="back1"></view>
				<view class="back2"></view>
				<view class="back">
					<view class="text-content">
						<view class="left">
							<view class="title">{{appName}} {{$t("promotion.default[1]")}}</view>
							<view class="line">
								<image class="vip-icon" src="@/static/images/common/vip_icon.png"></image>{{$t("promotion.default[2]")}}
							</view>
						</view>
						<view class="right">
							<view class="line title">
								{{( partnerInfo.return_rate1 || 0) + "%"}} <image class="arrow-right" src="@/static/images/common/jiantou.png"></image>
								{{( partnerInfo.return_rate2 || 0) + "%"}} <image class="arrow-right" src="@/static/images/common/jiantou.png"></image>
								{{( partnerInfo.return_rate3 || 0) + "%"}}
							</view>
							<view class="line">{{$t("promotion.default[3]")}}</view>
						</view>
					</view>
				</view>
			</view>
			
			<view class="v-card-wrap bg-theme">
				<view class="header-top">
					<text class="top-line"></text>•<text>{{$t("promotion.default[13]")}}</text>•<text class="top-line"></text>
				</view>
				<view class="v-card-item">
					<view>
						<view class="title-tip">{{$t("promotion.default[4]")}}</view>
						<view class="code" @click='copyContent(partnerInfo.extension_code, $t("promotion.default[4]"))'>
							{{partnerInfo.extension_code}}<image class="icon-copy" src="@/static/images/common/copy.png"></image>
						</view>
					</view>
					
					<view>
						<view class="title-tip">{{$t("promotion.labels[0]")}}</view>
						<view class="code">{{partnerInfo.invite_num || 0}}</view>
					</view>
				</view>
				
				<view class="v-card-item" style="justify-content: space-between;">
					<view class="button-share button" @click="showSwiper">{{$t("promotion.default[5]")}}</view>
					<view class="button-referral button copy-code" @click="copyContent(inviteLink)">{{$t("promotion.default[6]")}}</view>
				</view>
			</view>
		</view>
		
		<view class="v-content-wrap">
			
			<view class="v-data-list-wrap v-data-list-wrap-dark">
				<view class="v-content-card">
					<view class="tabs-wrap" style="width: 60%;">
						<view class="tabs-item" :class="{active:0 == current}" data-current="0" @click="handleTabChange">{{$t("promotion.default[9]")}}</view>
						<view class="margin80">/</view>
						<view class="tabs-item" :class="{active:1 == current}" data-current="1" @click="handleTabChange">{{$t("promotion.default[10]")}}</view>
					</view>
					<view class="v-data-list-content">
						<swiper class="record-list-swiper" :style="{height:promotionSwiperHeight+'px'}" :current="current" @change="onDataSwiperChange">
							<swiper-item>
								<view class="swiper-item">
									<view class="record-list" style="width:100%" v-if="promotionList[0].length > 0">
										<view class="data-list-item" v-for="(e,index) in promotionList[0]" :key="index">
											<view class="head">
												<view class="label">{{e.account}}</view>
												<view class="value">{{e.time}}</view>
											</view>
										</view>
										<u-loadmore :status="statusText" :load-text="loadText"></u-loadmore>
									</view>
									<empty-container v-else></empty-container>
								</view>
							</swiper-item>
							
							<swiper-item>
								<view class="swiper-item">
									<view class="record-list" style="width:100%" v-if="promotionList[1].length > 0">
										<view class="data-list-item" v-for="(e,index) in promotionList[1]" :key="index">
											<view class="head">
												<view class="label">{{e.from_account_number}}</view>
												<view class="value">{{e.created_time}}</view>
											</view>
											<view class="footer">
												<view class="label">+{{Number(e.value)}} {{e.currency_name}}</view>
												<view class="value">{{$t("promotion.labels[5]")}}</view>
											</view>
										</view>
										<u-loadmore :status="statusText" :load-text="loadText"></u-loadmore>
									</view>
									<empty-container v-else></empty-container>
								</view>
							</swiper-item>
						</swiper>
					</view>
				</view>
			</view>
		</view>
		
		<view>
			<tki-qrcode ref="qrcode" class="qrcode" cid="qrcode" :val="inviteLink" :size="size" :onval="onval" :loadMake="loadMake" :usingComponents="true" :showLoading="false" :show="false" @result="createQR"></tki-qrcode>
		</view>
		
		<view class="v-swiper-wrap" :class="{show:show}" @touchmove.stop="">
			<view class="swiper-wrap">
				<view class="indicator">
					<view class="dots">
						<view class="dot" :class="{active:0 === currentSwiper}"></view>
					</view>
					<view class="dots">
						<view class="dot" :class="{active:1 === currentSwiper}"></view>
					</view>
				</view>
				<swiper class="swiper" style="padding: 0 10rpx;" :style="{height:canvasHeight + 'px'}" previous-margin="20px" next-margin="20px" @change="onSwiperChange">
					<swiper-item>
						<view class="swiper-item">
							<canvas style="width:100%" :style="{height:canvasHeight+'px'}" canvas-id="firstCanvas" id="firstCanvas"></canvas>
						</view>
					</swiper-item>
					<swiper-item>
						<view class="swiper-item">
							<canvas style="width:100%" :style="{height:canvasHeight+'px'}" canvas-id="secondCanvas" id="secondCanvas" :width="canvasWidth"></canvas>
						</view>
					</swiper-item>
				</swiper>
			</view>
			<view class="save-button-wrap">
				<view class="save-button" @click="downloadImage">
					<image class="save-icon" src="@/static/images/common/save_ico.png"></image>
					<text class="save-button-text">{{$t("promotion.labels[3]")}}</text>
				</view>
				<view class="cancel-button" @click="hideSwiper">{{$t("promotion.labels[4]")}}</view>
			</view>
		</view>
		
	</view>
</template>

<script>
import tkiQrcode from "tki-qrcode"
export default {
	components: {
		tkiQrcode
	},
	data: function() {
		return {
			isLogin:false,
			appName:this.webConf.name,
			canvasShow: !1,
			isClick: !0,
			picurl: "",
			showQrcode: !1,
			statusText: "nomore",
			loadText: {
				loadmore: this.$t("promotion.tips[1]"),
				loading: this.$t("promotion.tips[2]"),
				nomore: this.$t("promotion.tips[3]")
			},
			val: "",
			size: 400,
			unit: "px",
			background: "#b4e9e2",
			foreground: "#309286",
			pdground: "#32dbc6",
			icon: "/static/images/logo.png",
			iconsize: 40,
			lv: 3,
			onval: !1,
			loadMake: !1,
			src: "",
			navbarBackground: {
				color: ""
			},
			show: !1,
			qrcodeData: "",
			link: "",
			partnerInfo: {},
			list: [],
			loading: !1,
			currentSwiper: 0,
			path: {
				rank: "/pages/promotion/rank/index"
			},
			qrWidth: 86,
			qrHeight: 86,
			promotionSwiperHeight: 180,
			swiperList: [{
				image: "",
				key: "icon_share_one",
				en_src: "/static/images/share/icon_share_one.png",
				zh_src: "/static/images/share/icon_share_one_cn.png",
				qrcode: 60
			}, {
				image: "",
				key: "icon_share_two",
				en_src: "/static/images/share/icon_share_two.png",
				zh_src: "/static/images/share/icon_share_two_cn.png",
				qrcode: 60
			}],
			authorizationCode: " ",
			current: 0,
			partnerType: 1,
			pagination: [{
				page: 1,
				limit: 20,
				total: 0
			}, {
				page: 1,
				limit: 20,
				total: 0
			}],
			image:{
				width: 750,
				height: 1330
			},
			promotionList:[[], []]
		}
	},
	computed: {
		canvasWidth: function() {
			return .8 * this.systemInfo.windowWidth
		},
		canvasHeight: function() {
			var t = this.canvasWidth / this.image.width;
			return t * this.image.height
		},
		systemInfo: function() {
			return this.$sysInfo
		},
		windowHeight: function() {
			return this.systemInfo.windowHeight
		},
		inviteLink: function() {
			return this.link ? "".concat(this.link, "?code=").concat(this.partnerInfo.extension_code) : ""
		}
	},
	onReachBottom: function() {
		var t = this
		  , e = this.pagination[this.current];
		e.page * e.limit < e.total && (e.page++,
		this.statusText = "loading",
		Promise.all([this.fetchPromotionRecord()]).then((function() {
			t.statusText = "nomore"
		}
		)))
	},
	onLoad: function() {
		if(!this.checkLogin()){
			return
		}
		this.isLogin = true
		
		var t = this;
		this.loading = !0,
		Promise.all([this.fetchPartnerInfo(), this.fetchPromotionRecord()]).then((function(e) {
			t.loading = !1,
			t.creatQrcode()
		}
		)).catch((function(e) {
			t.loading = !1
		}
		)),
		this.count = 0
		
	},
	watch: {
		current: function() {
			this.partnerType = Number(this.current) + 1,
			this.fetchPromotionRecord()
		}
	},
	methods: {
		fetchPartnerInfo: function() {
			this.$u.api.userInvite().then(res=>{	//包含前3列表
				//console.log("我的邀请",res)
				this.partnerInfo = res
				this.val = res.extension_code
				this.link = res.share_url
			}).catch(err=>{})
		},
		getElementHeight: function(t) {
			var e = this;
			setTimeout((function() {
				var i = uni.createSelectorQuery();
				i.selectAll(t).boundingClientRect(),
				i.exec((function(i) {
					if(i){
						//console.log(i)
						var a = 200
						e.promotionSwiperHeight = i[0].height > a ? i[0].height : a
					}else{
						e.getElementHeight(t)
					}
				}
				))
			}
			), 200)
		},
		encryptText: function(t) {
			t = t.split("");
			var e = "";
			for (var i in t) {
				var a = t[i];
				e += i > 3 ? "*" : a
			}
			return e
		},
		fetchPromotionRecord:async function() {
			let pagination = this.pagination[this.current]
			let params = {
				limit:pagination.limit,
				page:pagination.page
			}
			
			let res = null;
			if(this.current==0){
				res = await this.$u.api.userMyInviteList(params).catch(err=>{})
				//console.log("我的邀请会员列表",res)
			}else{
				res = await this.$u.api.userMyAccountReturn(params).catch(err=>{})
				//console.log("我的邀请返佣列表",res)
			}
			
			pagination.total = res.total
			if(pagination.page==1){
				//this.promotionList[this.current] = res.data
				this.$set(this.promotionList,this.current,res.data)
			}else{
				res.data.forEach(item=>{
					this.promotionList[this.current].push(item)
				})
			}
			
			this.getElementHeight(".record-list")
			
		},
		downloadImage: function() {
			var t = this.swiperList[this.currentSwiper];
			//console.log('download',t)
			//this.$utils.download(t.image)
			// #ifndef H5
			uni.saveImageToPhotosAlbum({
				filePath:t.image,
				success:()=>{
					this.$u.toast(this.$t('assets.deposit.tpbccg'))
				},
				fail: () => {
					this.$u.toast(this.$t('assets.deposit.tpbcsb'))
				}
			})
			// #endif
			// #ifdef H5
			
			var oA = document.createElement("a");
			oA.download = "share"+(new Date().getTime())+".png";// 设置下载的文件名，默认是’下载’
			oA.href = t.image;
			document.body.appendChild(oA);
			oA.click();
			oA.remove();
			
			// #endif
			
			
		},
		createQR: function(t) {
			this.count = this.count + 1,
			this.link && this.partnerInfo.extension_code && this.createPoster(t)
		},
		creatQrcode: function() {
			var t = this;
			setTimeout((function() {
				t.$refs.qrcode._makeCode()
			}
			), 500)
		},
		initCanvas: function() {
			this.createPoster()
		},
		createPoster: function(e) {
			var i = this
			  , a = ["firstCanvas", "secondCanvas", "thirdCanvas"]
			  , n = uni.createCanvasContext("firstCanvas")
			  , r = uni.createCanvasContext("secondCanvas")
			  , o = uni.createCanvasContext("thirdCanvas")
			  , c = [n, r, o]
			  , s = this
			  , l = function(n) {
				var r = i.swiperList[n]
				  , o = c[n]
				  , d = uni.getStorageSync("lang") || i.$i18n.locale
				  , u = r["".concat(d, "_src")];
				uni.getImageInfo({
					src: u,
					success: function(i) {
						i.width,
						i.height,
						i.path;
						var c = s.canvasWidth - 15 - r.qrcode - 5
						  , l = s.canvasHeight - 15 - r.qrcode - 5;
						o.drawImage(u, 0, 0, s.canvasWidth, s.canvasHeight),
						o.fillStyle = "#ffffff",
						o.fillRect(c - 5, l - 5, r.qrcode + 10, r.qrcode + 10),
						o.drawImage(e, c, l, r.qrcode, r.qrcode),
						setTimeout((function() {
							o.draw(!1, (function() {
								uni.canvasToTempFilePath({
									x: 0,
									y: 0,
									width: s.canvasWidth,
									height: s.canvasHeight,
									canvasId: a[n],
									success: function(t) {
										s.swiperList[n].image = t.tempFilePath
									},
									fail: function(e) {
										console.log(e)
									}
								})
							}
							))
						}
						), 100)
					}
				})
			};
			for (var d in this.swiperList)
				l(d)
		},
		onSwiperChange: function(t) {
			var e = t.detail.current;
			this.currentSwiper = e
		},
		onDataSwiperChange: function(t) {
			var e = t.detail.current;
			e != this.current && (this.current = Number(e))
		},
		handleTabChange: function(t) {
			var e = t.target.dataset.current;
			this.current != e && (this.current = Number(e))
		},
		copy: function() {
			uni.setClipboardData({
				data: "hello",
				success: function() {
					this.$u.toast(this.$t("promotion.tips[0]"))
				}
			})
			
			// #ifdef H5
			let textarea = document.createElement("textarea")
			textarea.value = "hello"
			textarea.readOnly = "readOnly"
			document.body.appendChild(textarea)
			textarea.select() // 选中文本内容
			textarea.setSelectionRange(0, "hello".length)
			this.$u.toast(this.$t("promotion.tips[0]"))
			document.execCommand("copy")
			textarea.remove()
			// #endif
		},
		copyContent: function(code, txt) {
			//console.log(t,e)
			uni.setClipboardData({
			    data: code,
			    success: ()=> {
			        this.$u.toast(txt ? this.$t("promotion.tips[0]") + ": ".concat(txt) : this.$t("promotion.tips[0]"))
			    },
				fail: () => {
					this.$u.toast('fail')
				}
			})
			
			// #ifdef H5
			let textarea = document.createElement("textarea")
			textarea.value = code
			textarea.readOnly = "readOnly"
			document.body.appendChild(textarea)
			textarea.select() // 选中文本内容
			textarea.setSelectionRange(0, code.length)
			this.$u.toast(txt ? this.$t("promotion.tips[0]") + ": ".concat(txt) : this.$t("promotion.tips[0]"))
			document.execCommand("copy")
			textarea.remove()
			// #endif
			
		},
		gotoReferalRule: function() {
			var t = {
				id: 195,
				title: this.$t("promotion.default[0]")
			}
			this.$u.route('/pages/help/center/detail', t)
		},
		showSwiper: function() {
			this.show = !0,
			this.isClick = !1
		},
		hideSwiper: function() {
			this.show = !1
		}
	}
}
</script>

<style lang="scss" scoped>
.v-container-wrap.light {
	background: #f8f9fe
}

.v-container-wrap .v-swiper-wrap {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0,0,0,.4);
	z-index: 1001;
	transform: translateY(100%);
	transition: transform .3s;
	transition: transform .3s,-webkit-transform .3s
}

.v-container-wrap .v-swiper-wrap.show {
	transform: translateY(0);
	transition: transform .3s;
	transition: transform .3s,-webkit-transform .3s
}

.v-container-wrap .v-swiper-wrap .swiper-wrap {
	margin-top: 110rpx;
	position: relative
}

.v-container-wrap .v-swiper-wrap .swiper-wrap .swiper {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 120rpx
}

.v-container-wrap .v-swiper-wrap .swiper-wrap .swiper .swiper-item {
	width: 100%
}

.v-container-wrap .v-swiper-wrap .swiper-wrap .indicator {
	display: flex;
	position: absolute;
	top: -40rpx;
	left: 0;
	right: 0;
	height: 40rpx;
	justify-content: center
}

.v-container-wrap .v-swiper-wrap .swiper-wrap .indicator .dots {
	display: flex;
	justify-content: center;
	margin-right: 20rpx
}

.v-container-wrap .v-swiper-wrap .swiper-wrap .indicator .dots:last-child {
	margin-right: 0
}

.v-container-wrap .v-swiper-wrap .swiper-wrap .indicator .dots .dot {
	width: 20rpx;
	height: 8rpx;
	border-radius: 20rpx;
	background: #b1948c;
	transform: translateX(0);
	transition: transform .3s;
	transition: transform .3s,-webkit-transform .3s
}

.v-container-wrap .v-swiper-wrap .swiper-wrap .indicator .dots .dot.active {
	width: 40rpx;
	border-radius: 20rpx;
	background: #fff;
	transition: width .3s
}

.v-container-wrap .v-swiper-wrap .save-button-wrap {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	background: #fff;
	padding: 20rpx 0
}

.v-container-wrap .v-swiper-wrap .save-button-wrap .save-button {
	background: #FFC107;
	height: 80rpx;
	line-height: 80rpx;
	padding: 0 50rpx;
	text-align: center;
	border-radius: 40rpx;
	color: var(--text-color);
	display: flex;
	align-items: center
}

.v-container-wrap .v-swiper-wrap .save-button-wrap .save-button .save-icon {
	width: 40rpx;
	height: 40rpx;
	margin-right: 10rpx
}

.v-container-wrap .v-swiper-wrap .save-button-wrap .save-button .save-button-text {
	height: 40rpx;
	line-height: 40rpx;
	color: #fff
}

.v-container-wrap .v-swiper-wrap .save-button-wrap .cancel-button {
	margin-top: 20rpx;
	color: #c0c4cc;
	padding: 0 50rpx
}

.v-container-wrap .v-head-wrap {
	position: relative;
	background-color: var(--page-part-color)
}

.v-container-wrap .v-head-wrap .title {
	padding: 0 60rpx;
	color: #fff;
	font-size: 40rpx;
	font-weight: 700;
	width: 100%
}

.v-container-wrap .v-head-wrap .title .line1 {
	height: 50rpx
}

.v-container-wrap .v-head-wrap .title .line2 .num {
	font-size: 54rpx;
	font-weight: 700;
	background: linear-gradient(180deg,#fff7ac,#fecf07);
	-webkit-background-clip: text;
	color: transparent
}

.v-container-wrap .v-head-wrap .text-content-wrap {
	height: 318rpx;
	margin: 0 30rpx;
	position: relative;
	display: flex;
	justify-content: center;
	margin-top: 40rpx
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content {
	display: flex;
	height: 100%;
	color: #202020;
	align-items: center;
	justify-content: center
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content .left {
	display: flex;
	flex-direction: column;
	text-align: center;
	flex: 0 0 auto
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content .left .title {
	font-size: 30rpx
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content .left .line {
	display: flex;
	justify-content: center;
	margin-top: 14rpx
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content .left .vip-icon {
	width: 40rpx;
	height: 40rpx;
	margin-right: 5px
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content .right {
	display: flex;
	flex-direction: column;
	flex: 1
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content .right .line {
	margin-bottom: 14rpx;
	display: flex;
	justify-content: center;
	align-items: center
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content .right .line.title {
	font-size: 30rpx;
	flex-direction: row
}

.v-container-wrap .v-head-wrap .text-content-wrap .text-content .right .line .arrow-right {
	width: 30rpx;
	height: 20rpx;
	margin: 0 14rpx
}

.v-container-wrap .v-head-wrap .v-card-wrap {
	background: #fff;
	border-radius: 18rpx;
	margin: 0 30rpx;
	padding: 30rpx
}

.v-container-wrap .v-head-wrap .v-card-wrap .v-card-item {
	display: flex;
	//justify-content: space-between;
	justify-content: space-around;
	text-align: center;
	margin-bottom: 30rpx
}

.v-container-wrap .v-head-wrap .v-card-wrap .v-card-item:last-child {
	margin-bottom: 0
}

.v-container-wrap .v-head-wrap .v-card-wrap .v-card-item .left {
	color: #000;
	font-size: 26rpx;
	font-weight: 400
}

.v-container-wrap .v-head-wrap .v-card-wrap .v-card-item .right {
	display: flex;
	align-items: center;
	color: #000;
	font-weight: 700
}

.v-container-wrap .v-head-wrap .v-card-wrap .v-card-item .icon-copy {
	width: 30rpx;
	height: 30rpx;
	margin-left: 30rpx
}

.v-container-wrap .v-head-wrap .v-card-wrap .v-card-item .button {
	font-size: 26rpx;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 60rpx;
	width: 48%
}

.v-container-wrap .v-head-wrap .v-card-wrap .v-card-item .button.button-share {
	background: #2a968a;
	color: #fff
}

.v-container-wrap .v-head-wrap .v-card-wrap .v-card-item .button.button-referral {
	border: 2rpx solid #2a968a
}

.v-container-wrap .v-head-wrap .v-nav-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 44px;
	padding: 0 30rpx;
	position: relative
}

.v-container-wrap .v-head-wrap .v-nav-bar .right {
	position: absolute;
	font-size: 24rpx;
	color: #000;
	padding: 0 30rpx;
	height: 44rpx;
	display: flex;
	align-items: center;
	justify-content: center
}

.v-container-wrap .v-content-wrap {
	padding-top: 30rpx
}

.v-container-wrap .v-content-wrap .referral-card {
	padding: 20rpx 30rpx
}

.v-container-wrap .v-content-wrap .referral-card .title {
	font-weight: 200;
	display: flex;
	justify-content: space-between
}

.v-container-wrap .v-content-wrap .referral-card .title .left {
	color: var(--text-color);
	font-size: 28rpx;
	font-weight: 700
}

.v-container-wrap .v-content-wrap .referral-card .title .right {
	color: #000;
	font-size: 24rpx
}

.v-container-wrap .v-content-wrap .referral-card .title .right .button {
	height: 60rpx;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #FFC107
}

.v-container-wrap .v-content-wrap .referral-card .title .right .button .rank-icon {
	width: 28rpx;
	height: 34rpx;
	margin-right: 10rpx
}

.v-container-wrap .v-content-wrap .referral-card .title .right .button .rank-right {
	width: 20rpx;
	height: 20rpx;
	margin-left: 10rpx
}

.v-container-wrap .v-content-wrap .referral-card .content {
	display: flex;
	justify-content: space-between;
	margin-top: 36rpx;
	font-size: 24rpx
}

.v-container-wrap .v-content-wrap .referral-card .content .item {
	flex: 0 0 auto;
	width: 220rpx;
	height: 134rpx;
	background: #2a405c;
	border-radius: 10rpx
}

.v-container-wrap .v-content-wrap .referral-card .content .item .icon-left {
	width: 30rpx;
	height: 30rpx;
	text-align: right;
	margin: 10rpx 0 0 20rpx
}

.v-container-wrap .v-content-wrap .referral-card .content .item .value {
	text-align: center;
	font-size: 28rpx;
	color: #ffc107
}

.v-container-wrap .v-content-wrap .referral-card .content .item .name {
	text-align: center;
	color: #768da9;
	font-size: 22rpx
}

.v-container-wrap .v-content-wrap .v-data-list-wrap {
	padding: 20rpx 0;
	margin-top: 30rpx;
	position: relative
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .v-data-list-content .record-list-swiper .swiper-item {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	padding:0 20rpx;
	box-sizing: border-box;
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .v-data-list-content .record-list-swiper .swiper-item .data-list-item {
	width: 100%;
	font-size: 24rpx;
	padding: 20rpx 0;
	font-weight: lighter
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .v-data-list-content .record-list-swiper .swiper-item .data-list-item .head {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10rpx
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .v-data-list-content .record-list-swiper .swiper-item .data-list-item .footer {
	display: flex;
	justify-content: space-between
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .v-data-list-content .record-list-swiper .swiper-item .data-list-item .footer .label {
	color: #13ac59
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .v-data-list-content .record-list-swiper .swiper-item .data-list-item .footer .value {
	color: #b9bbd2
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .tabs-wrap {
	display: flex;
	justify-content: space-between
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .tabs-wrap .tabs-item {
	position: relative;
	line-height: 70rpx
}

.v-container-wrap .v-content-wrap .v-data-list-wrap .v-content-card .tabs-wrap .tabs-item.active {
	color: #FFC107
}

.qrcode-wrap {
	display: inline-block;
	padding: 20rpx;
	background: #fff;
	border-radius: 30rpx
}

.v-data-list-content .record-list-swiper .swiper-item {
	display: flex;
	justify-content: center;
	height: 100%
}

.swiper .swiper-item {
	display: flex;
	justify-content: center;
	height: 100%
}

.dark .header-bg-dark .title {
	text-align: center;
	padding-top: 30rpx
}

.dark .text-content-wrap .text-content {
	background: url('@/static/images/common/dark_header.png') no-repeat!important;
	background-size: 100% 100%!important;
	color: #fff!important
}

.dark .v-card-wrap {
	margin-top: 50rpx!important
}

.dark .v-card-wrap .header-top {
	color: #FFC107;
	font-size: 26rpx;
	text-align: center
}

.dark .v-card-wrap .header-top uni-text {
	margin: 0 20rpx
}

.dark .v-card-wrap .header-top .top-line {
	background-color: #FFC107;
	width: 100rpx;
	height: 2rpx;
	display: inline-block;
	margin: 0 20rpx 10rpx
}

.dark .v-card-wrap .button-referral,
.dark .v-card-wrap .right {
	color: #fff
}

.dark .v-card-wrap .copy-code {
	color: #000
}

.dark .bg-theme .v-card-item .title-tip {
	font-size: 24rpx;
	color: #768da9;
	margin-top: 30rpx
}

.dark .bg-theme .v-card-item .code {
	font-size: 40rpx;
	font-weight: 700;
	color: #dcdcdc;
	line-height: 60rpx
}

.dark .bg-theme .v-card-item .copy-code {
	color: #ffc107;
	background: #18171a
}

.dark .referral-card-dark {
	background: #18171a
}

.dark .tabs-wrap .tabs-item.active {
	color: #FFC107!important
}

.dark .v-data-list-wrap-dark {
	background: url('@/static/images/common/bg_dark2.png') no-repeat;
	background-size: 100% 100%
}

.dark .v-data-list-wrap-dark .tabs-wrap {
	color: #768da9;
	width: 50%;
	margin: 0 auto
}

.dark .v-data-list-wrap-dark .tabs-wrap .margin80 {
	margin: 0 30rpx;
	line-height: 80rpx
}

.light .text-content-wrap {
	top: -80rpx!important;
	height: 206rpx!important;
	background: #fff;
	box-shadow: 0 2rpx 0 0 rgba(0,0,0,.1),0 -8rpx 0 0 #FFC107;
	border-radius: 4rpx
}

.light .text-content-wrap .text-content .title {
	font-size: 30rpx;
	color: #202020;
	font-weight: 400
}

.light .v-head-wrap {
	background: #f8f9fe
}

.light .v-head-wrap .header-bg-light {
	height: 300rpx;
	background: url('@/static/images/common/light_header_bg.png') no-repeat;
	background-size: 100% 100%
}

.light .v-head-wrap .header-bg-light .title {
	text-align: left;
	padding-top: 100rpx
}

.light .v-head-wrap .header-bg-light .title .num {
	color: #00fdbd
}

.light .v-card-wrap {
	height: 278rpx;
	z-index: 100;
	position: absolute;
	bottom: -128rpx;
	left: 0;
	right: 0;
	transform: translateY(40%);
	box-shadow: 0 2rpx 0 0 rgba(0,0,0,.1),0 -8rpx 0 0 #FFC107
}

.light .v-card-wrap .v-card-item .right {
	width: 410rpx;
	height: 40rpx;
	background: hsla(0,0%,89.4%,.2);
	border-radius: 20rpx;
	justify-content: flex-end;
	padding-right: 20rpx
}

.light .v-card-wrap .button {
	background: #fff;
	border-radius: 20rpx
}

.light .v-card-wrap.copy-code {
	color: #202020;
	background: #fff
}

.light .v-content-wrap {
	background: #f8f9fe
}

.light .v-content-wrap .referral-card-light {
	width: 690rpx;
	margin: 250rpx auto 0;
	height: 360rpx;
	background: #fff;
	box-shadow: 0 2rpx 0 0 rgba(0,0,0,.1),0 -8rpx 0 0 rgba(45,226,180,.75);
	border-radius: 4rpx
}

.light .v-content-wrap .referral-card-light .title .left {
	font-size: 32rpx
}

.light .v-content-wrap .referral-card-light .flex-content {
	display: flex;
	justify-content: flex-end;
	height: 230rpx;
	color: #fff;
	text-align: right;
	margin-top: 26rpx
}

.light .v-content-wrap .referral-card-light .flex-content .name,
.light .v-content-wrap .referral-card-light .flex-content .value {
	padding-right: 20rpx
}

.light .v-content-wrap .referral-card-light .flex-content .name {
	line-height: 70rpx
}

.light .v-content-wrap .referral-card-light .flex-content .value {
	font-weight: 700
}

.light .v-content-wrap .referral-card-light .flex-content .flex-content-left {
	width: 240rpx;
	height: 230rpx;
	background: url('@/static/images/common/bg_right.png') no-repeat;
	background-size: 100% 100%;
	margin-right: 20rpx;
	border-radius: 4rpx
}

.light .v-content-wrap .referral-card-light .flex-content .flex-content-left .name {
	margin-top: 50%
}

.light .v-content-wrap .referral-card-light .flex-content .flex-content-right {
	width: 370rpx;
	height: 230rpx
}

.light .v-content-wrap .referral-card-light .flex-content .flex-content-right .top {
	width: 370rpx;
	height: 110rpx;
	background: url('@/static/images/common/bg_left1.png') no-repeat;
	background-size: 100% 100%;
	border-radius: 10rpx
}

.light .v-content-wrap .referral-card-light .flex-content .flex-content-right .buttom {
	background: url('@/static/images/common/bg_left2.png') no-repeat;
	background-size: 100% 100%;
	width: 370rpx;
	height: 110rpx;
	margin-top: 10rpx;
	border-radius: 10rpx
}

.light .v-content-wrap .v-data-list-wrap-light {
	background: #f8f9fe
}

.light .v-content-wrap .v-data-list-wrap-light .v-content-card {
	width: 690rpx;
	background: #fff;
	box-shadow: 0 -8rpx 0 0 rgba(45,226,180,.75);
	border-radius: 4rpx;
	margin: 0 auto
}

.light .v-content-wrap .v-data-list-wrap-light .v-content-card .tabs-wrap .tabs-item {
	width: 50%;
	text-align: center;
	border-bottom: 4rpx solid #dedede
}

.light .v-content-wrap .v-data-list-wrap-light .v-content-card .tabs-wrap .active {
	border-bottom: 4rpx solid #FFC107;
	color: #FFC107
}
</style>
