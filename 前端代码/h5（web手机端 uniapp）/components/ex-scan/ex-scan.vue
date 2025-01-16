<template>
	<view>
		<div class="scan-container" v-show="showScan">
			<div class="close">
				<u-icon name="close" @click="closeScan"></u-icon>
			</div>
			<div class="scanContainer" id="scanContainer"></div>
			<div class="flash" @click="setFlash">点击打开灯光</div>
		</div>
	</view>
</template>

<script>
export default {
	name:"ex-scan",
	data: function() {
		return {
			showScan: !1,
			flash: !1,
			barScan:null
		}
	},
	mounted: function() {},
	beforeDestroy: function() {
		this.barScan && this.barScan.close()
	},
	methods: {
		startScan: function() {
			var t = this;
			plus.navigator.getUserAgent().indexOf("Html5Plus") > -1 ? (this.showScan = !0,
			setTimeout((function() {
				t.scanCode()
			}
			), 1000)) : this.$u.toast(this.$t("assets.withdraw.tips[0]"))
		},
		closeScan: function() {
			this.barScan && (this.barScan.close(),
			this.showScan = !1)
		},
		scanCode: function() {
			var t = this
			var e = new plus.barcode.Barcode("scanContainer")
			
			this.barScan = e
			
			e.onmarked = function(a, i, n) {
				console.log('onmarked',a,i,n)
				t.$emit("onScanResult", i),
				e.close(),
				t.showScan = !1
			}
			
			e.start({
				conserve: !0,
				filename: "_doc/barcode/"
			})
			//e.start()
			console.log('start',e)
		},
		setFlash: function() {
			this.flash = !this.flash,
			this.barScan.setFlash(this.flash)
		}
	}
}
</script>

<style lang="scss" scoped>
.scan-container {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: rgba(0,0,0,.9);
	z-index: 2000;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column
}

.scan-container .close {
	position: absolute;
	top: 60rpx;
	right: 60rpx;
	color: #fc6668;
	font-size: 40rpx;
	z-index: 2001
}

.scan-container .scanContainer {
	width: 600rpx;
	height: 600rpx;
	border: 1rpx solid #fc6668;
	margin: 0 auto
}

.scan-container .flash {
	margin-top: 200rpx;
	color: #fff
}
</style>
