<template>
	<view class="v-charge-container dark">
		<lw-navbar :border-bottom="false" :title="webConf.name"></lw-navbar>
		<mask-modal ref="tipsModal" :text="textRich" :confirmTxt="$t('common.md_confirm1')"></mask-modal>
		<view class="v-charge-head">
			<view class="head-item bg-theme" @click="goBack()">{{$t("assets.deposit.chongbi")}}<text
					class="span">{{currency_code}}</text></view>
		</view>
		<view class="v-charge-body">
			<view class="v-card-wrap">
				<view class="v-card-head" v-if="currency_id!='9999'">
					<view class="left">{{$t("assets.deposit.ltype")}}</view>
					<view class="right">
						<ex-box-check :lists="wallets" :check-index="currentChain" key-name="name"
							@click="onCheckClick"></ex-box-check>
					</view>
				</view>
				<view class="v-card-content" v-if="currency_id!='9999'">
					<view class="qrcode-wrap">
						<view ref="qrimage" class="qrcode-image qrimage" id="qrimage">
							<tki-qrcode ref="qrcode" class="qrcode" cid="qrcode" :val="address" :size="size"
								:onval="onval" :loadMake="loadMake" :usingComponents="true" :showLoading="false"
								:show="true" @result="createQR"></tki-qrcode>
						</view>
						<view class="tips">{{$t("assets.deposit.hqcbdz")}}</view>
						<view class="save" @click="download">{{$t("assets.deposit.save")}}</view>
					</view>
				</view>
				<view class="v-card-footer" v-if="currency_id!='9999'">
					<view class="item">
						<view class="label">{{$t("assets.deposit.cbdz")}}</view>
						<view class="value">{{address}}</view>
						<ex-icon class="copy copy-code" name="copy" size="small" @on-click="copyContent(address)"></ex-icon>
						<view class="save" style="color: #FFC107;" @click="copyContent(address)">
							{{$t("assets.deposit.copy")}}
						</view>
					</view>
					<view class="form-wrap">
						<u-form ref="uForm" :model="form" :border-bottom="false">
							<u-form-item class="dark-theme" :label="$t('assets.deposit.cbsl')" label-position="top"
								:label-style="formLabelStyle" prop="number" :border-bottom="false">
								<u-input type="digit" :placeholder="$t('assets.deposit.qsrcbsl')"
									:customStyle="formLabelStyle" v-model="form.number"></u-input>
							</u-form-item>
							<u-form-item class="upload-wrap darkStyle" :label="$t('assets.deposit.qsccztp')"
								label-position="top" :label-style="formLabelStyle" :border-bottom="false">
								<u-upload ref="uUpload" :action="action" :file-list="fileList" max-count="1"
									:upload-text="$t('assets.deposit.xztp')" :before-upload="beforeUpload"
									@on-success="onImageUploaded" @on-remove="onRemove"></u-upload>
							</u-form-item>
							<view class="button-wrap">
								<ex-button-wrap theme="primary" :disabled="loading" @click="onSubmit"
									:text="$t('assets.deposit.chongbi')"></ex-button-wrap>
							</view>
						</u-form>
					</view>
					<view class="tips-wrap">
						<view class="title">{{$t("assets.deposit.zysx")}}</view>
						<u-parse :html="noticeContent"></u-parse>
					</view>
				</view>
				
				<view class="v-card-footer" v-if="currency_id==='9999'">
			
					<view class="form-wrap">
						<view style="line-height: 40px;">
							<view style="position: relative; font-size: 16px;">
								<text>{{$t('assets.deposit.bkname')}}:</text>
								<text style="margin-left: 10px;">{{bkname}}</text>
								<text @click="copyContent(bkname)" style="color:#2AA492;float: right;">{{$t('assets.deposit.bkcopy')}}</text>
							</view>
							<view style="position: relative; font-size: 16px;">
								<text>{{$t('assets.deposit.bkcardnumer')}}:</text>
								<text style="margin-left: 10px;">{{bkcardnumer}}</text>
								<text @click="copyContent(bkcardnumer)" style="color:#2AA492;float: right;">{{$t('assets.deposit.bkcopy')}}</text>
							</view>
							
							<view style="position: relative; font-size: 16px;">
								<text>{{$t('assets.deposit.cardname')}}:</text>
								<text style="margin-left: 10px;">{{cardname}}</text>
								<text @click="copyContent(cardname)" style="color:#2AA492;float: right;">{{$t('assets.deposit.bkcopy')}}</text>
							</view>
						</view>
						<u-form ref="uForm" :model="form" :border-bottom="false">
							
							<u-form-item class="dark-theme" :label="$t('assets.deposit.zzjiner')" label-position="top"
								:label-style="formLabelStyle" prop="number" :border-bottom="false">
								<u-input type="digit" :placeholder="$t('assets.deposit.zzjinerts')"
									:customStyle="formLabelStyle" v-model="form.number"></u-input>
							</u-form-item>
							
							<u-form-item class="upload-wrap darkStyle" :label="$t('assets.deposit.qsczztp')"
								label-position="top" :label-style="formLabelStyle" :border-bottom="false">
								<u-upload ref="uUpload" :action="action" :file-list="fileList" max-count="1"
									:upload-text="$t('assets.deposit.xztp')" :before-upload="beforeUpload"
									@on-success="onImageUploaded" @on-remove="onRemove"></u-upload>
							</u-form-item>
							
							<view class="button-wrap">
								<ex-button-wrap theme="primary" :disabled="loading" @click="onSubmit"
									:text="$t('assets.deposit.chongbi')"></ex-button-wrap>
							</view>
							
						</u-form>
					</view>
					<view class="tips-wrap">
						<view class="title">{{$t("assets.deposit.zysx")}}</view>
						<u-parse :html="noticeContent"></u-parse>
					</view>
				</view>
				
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
		data() {
			return {
				form: {
					number: null,
					hash: "",
					address: ""
				},
				bkname:"",
				bkcardnumer:"",
				cardname:"",
				currency_code: '',
				currency_id: 0,
				textRich: this.$t('assets.deposit.tips'),
				info: {},
				// action: this.webConf.staticUrl + "/api/upload",
				action: "/api/upload",
				fileList: [],
				path: {
					accounts: "/pages/assets/deposit/index"
				},
				onval: !0,
				size: 300,
				loadMake: !0,
				wallets: [],
				currentChain: 0,
				imgData: "",
				link: "https://t.me/BFEX016",
				loading: !1,
				imageUrl: null,
				rules: {
					number: [{
						required: true,
						message: this.$t("assets.deposit.qsrcbsl"),
						trigger: ["change", "blur"]
					}]
				},
				formLabelStyle: {
					color: "#e2e8e4",
					fontSize: "24rpx"
				}
			}
		},
		onReady: function() {
			this.$refs.uForm.setRules(this.rules)
		},
		computed: {
			noticeContent: function() {
				let str = this.$t('assets.deposit.noticecontent')
				return str.replace('{coin}', this.currency_code)
			},
			address: function() {
				return this.currentWallet && this.currentWallet.in_address
			},
			currentWallet: function() {
				return this.wallets.length <= 0 ? {} : this.wallets[this.currentChain]
			}
		},
		onLoad: function(t) {
			if (!this.checkLogin()) {
				return
			}
			this.currency_id = t.currency_id,
				this.currency_code = t.currency_code,
				this.$nextTick((function() {
					this.fetchCoinData()
				}))
		},
		methods: {
			onSubmit: function() {
				var t = this;
				if (!this.form.number) {
					this.$u.toast(this.$t("assets.deposit.qsrcbsl"))
					return
				}

				if (!this.imageUrl) {
					this.$u.toast(this.$t("assets.deposit.qsccztp"))
					return
				}
				console.log(this.$refs["number"]);
				this.$refs.uForm.validate((e) => {
					console.log(e);
					if (e) {
						let params = {
							amount: this.form.number,
							account: null,
							currency: this.currency_id,
							imgs: this.imageUrl
						}
						console.log(params);
						this.$u.api.walletChargeReq(params).then(res => {
							this.$u.toast(this.$t("assets.deposit.tjcg"))
							setTimeout(() => {
								this.goBack(2)
							}, 2000)
						}).catch(err => {
							uni.hideToast()
							this.$u.toast(this.$t("assets.deposit.tjsb"))
						})
					}
				})
			},
			onImageUploaded: function(t) {
				if (t.type == 'ok') {
					this.imageUrl = t.message
				} else {
					this.$u.toast(t.message || this.$t('assets.deposit.scsb'))
				}
			},
			onRemove: function(index, lists) {
				console.log('indexindexindexindex');
			},
			beforeUpload: function(index, list) {
				//console.log(index,list)
			},
			onCheckClick: function(obj) {
				this.currentChain = Number(obj.index)
			},
			capture() {
				let that = this
				let pathName = "_doc/" + this.$u.guid(16) + ".jpg"
				var pages = getCurrentPages();
				var page = pages[pages.length - 1];
				var bitmap = null;
				var currentWebview = page.$getAppWebview();
				bitmap = new plus.nativeObj.Bitmap('amway_img');
				// 将webview内容绘制到Bitmap对象中  
				currentWebview.draw(bitmap, function() {
					//console.log('截屏绘制图片成功');  
					bitmap.save(pathName, {}, function(i) {
						//console.log('保存图片成功：'+JSON.stringify(i));  
						uni.saveImageToPhotosAlbum({
							filePath: i.target,
							success: function() {
								bitmap.clear(); //销毁Bitmap图片  
								uni.showToast({
									title: that.$t('assets.deposit.tpbccg'), //保存成功
									mask: false,
									duration: 1500
								});
							}
						});
					}, function(e) {
						that.$u.toast(that.$t('assets.deposit.tpbcsb'))
						//console.log('保存图片失败：'+JSON.stringify(e));  
					});
				}, function(e) {
					that.$u.toast(that.$t('assets.deposit.tpbcsb'))
					//console.log('截屏绘制图片失败：'+JSON.stringify(e));  
				})

			},
			download: function() {
				let e = this.imgData
				// #ifdef APP-PLUS
				this.capture()
				// #endif
				// #ifdef H5
				var t = (Date.parse(new Date) / 1e3).toString();
				if (window.navigator.msSaveOrOpenBlob) {
					var n = atob(e.split(",")[1]),
						a = n.length,
						i = new Uint8Array(a);
					while (a--)
						i[a] = n.charCodeAt(a);
					var o = new Blob([i]);
					window.navigator.msSaveOrOpenBlob(o, "file-download-" + t + ".png")
				} else {
					var r = document.createElement("a");
					r.href = e,
						r.style.display = "none",
						r.setAttribute("download", "file-download-" + t),
						r.click()
				}
				// #endif
			},
			createQR: function(t) {
				this.imgData = t
			},
			fetchCoinData: async function() {

				this.loading = true
				let params = {
					currency: this.currency_id
				}
				let res = await this.$u.api.walletAddress(params).catch(err => {
					this.loading = false
				})
				this.loading = false
				if(this.currency_id === "9999"){ //银行卡充值
					this.bkname = res.bkname;
					this.bkcardnumer=res.bkcardnumer;
					this.cardname=res.cardname;
				}else{
					let wallets = [];
					for (let key in res) {
						let obj = {
							in_address: res[key],
							name: key
						}
						wallets.push(obj)
					}
					this.wallets = wallets
				}
				

			},
			copyContent: function(t) {
				var e = this;
				uni.setClipboardData({
					data: t,
					success: function() {
						e.$u.toast(e.$t("assets.deposit.fzcg"))
					},
					fail: function() {
						e.$u.toast(e.$t("assets.deposit.fzsb"))
					}
				})

				// #ifdef H5
				let textarea = document.createElement("textarea")
				textarea.value = t
				textarea.readOnly = "readOnly"
				document.body.appendChild(textarea)
				textarea.select() // 选中文本内容
				textarea.setSelectionRange(0, t.length)
				e.$u.toast(e.$t("assets.deposit.fzcg"))
				document.execCommand("copy")
				textarea.remove()
				// #endif


			}
		},
		mounted: function() {
			this.$refs.tipsModal.panel('show')

		}
	}
</script>

<style lang="scss" scoped>
	.v-charge-container {
		&.dark {
			.v-card-head {
				border-bottom: 1rpx solid #2f4159 !important
			}

			.v-card-content {
				border-bottom: 1rpx solid #2f4159 !important
			}

			.tips-wrap {
				background-color: #18171a
			}
		}

		.v-charge-head {
			margin-bottom: 18rpx;

			.head-item {
				display: flex;
				align-items: center;
				line-height: 88rpx;
				padding: 0 30rpx;
				background-color: #fff;
				font-size: 34rpx;
				position: relative;
				cursor: pointer;

				.span {
					display: inline-block;
					margin-left: 10rpx;
					color: #FFC107
				}

				&::after {
					content: " ";
					background: url('@/static/images/common/arrow-right.png');
					background-size: 100% 100%;
					width: 40rpx;
					height: 40rpx;
					position: absolute;
					right: 30rpx
				}
			}
		}

		.v-charge-body {
			.v-card-wrap {
				.v-card-head {
					display: flex;
					justify-content: space-between;
					border-bottom: 1rpx solid #ebeef5;
					padding: 20rpx 30rpx 20rpx 20rpx;
					align-items: center;

					.left {
						font-size: 26rpx;
						font-weight: 400
					}

					.right {
						display: flex
					}
				}

				.v-card-content {
					display: flex;
					justify-content: center;
					align-items: center;
					padding: 30rpx 0;
					border-bottom: 1rpx solid #ebeef5;

					.qrcode-wrap {
						margin-top: 50rpx;
						text-align: center;

						.qrcode-image {
							padding: 20rpx;
							min-height: 320rpx;
							background: #fff;
							display: inline-block;
							margin: 0 auto
						}

						.tips {
							font-size: 26rpx;
							margin-top: 30rpx;
							font-weight: lighter
						}

						.save {
							margin-top: 10rpx;
							text-align: center;
							font-size: 24rpx;
							font-weight: lighter;
							color: #FFC107
						}
					}
				}

				.v-card-footer {
					padding: 20rpx 30rpx;

					.item {
						text-align: center;
						// display: flex;
						// justify-content: space-between;
						padding-bottom: 20rpx;

						.label {
							// display: flex;
							flex: 0 0 auto;
							font-size: 24rpx;
							line-height: 50rpx;
							// align-items: center
						}

						.value {
							// width: 60%;
							line-height: 50rpx;
							// overflow-wrap: break-word;
							// text-align: right
						}

						.copy {
							line-height: 50rpx;
							// display: flex;
							// align-items: center
						}
					}
				}
			}
		}

		.dark-theme {
			/deep/.u-input {
				align-items: center;
			}

			/deep/.u-form-item--right {
				min-height: 88rpx;
				line-height: 88rpx;
				border-radius: 10rpx;
				background: #2a405c;

				.u-form-item--right__content {
					padding: 0 30rpx;
					min-height: 88rpx;
				}
			}
		}

	}


	.tips-wrap {
		background: #f7f8fa;
		padding: 30rpx 20rpx;
		font-size: 24rpx;
		color: #707287;

		.title {
			margin-bottom: 20rpx;
			color: var(--text-color);
			font-weight: 700
		}

		.line {
			position: relative;
			display: flex;
			line-height: 40rpx;
			margin-top: 4rpx;

			.link {
				color: #FFC107;
				margin-left: 10rpx
			}
		}
	}

	.form-wrap {
		margin-top: 20rpx;

		.button-wrap {
			margin-top: 20rpx;
			margin-bottom: 20px
		}

		.upload-wrap {
			/deep/.u-form-item--right {
				&.u-form-item-dark {
					background-color: initial
				}

				&.u-form-item-light {
					background-color: initial
				}

				.u-form-item--right__content {
					padding: 0
				}
			}

			/deep/.u-upload {
				.u-list-item {
					background-color: var(--page-part-color)
				}

				.u-add-wrap {
					color: #c0c4cc
				}
			}
		}
	}
</style>
