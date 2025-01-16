<template>
	<view class="v-trade-container dark">
		<view class="status-bar darkStyle" :style="{ height: statusBarHeight + 'px' }"></view>
		<view class="trade-head-wrap">
			<view class="v-trade-tabs-wrap">
				<view class="search-wrap" v-show="false">
					<image class="search-image" mode="widthFix" src="@/static/images/common/search.png"></image>
				</view>
				<main-tabs-wrap :list="[$t('trade.index.xianhuo')]"></main-tabs-wrap>
			</view>
			
			<view class="v-trade-second-tab">
				<sub-tabs-wrap :list="['USDT']"></sub-tabs-wrap>
			</view>
		</view>
		
		<view class="swiper-wrap">
			<swiper class="swiper">
				<swiper-item>
					<view class="swiper-item">
						<scroll-view class="scroll-view" scroll-y>
							
							<trade-all-wrap class="bg-theme" :list="rankArr" v-if="rankArr.length>0"></trade-all-wrap>
							<empty-container v-else></empty-container>
						</scroll-view>
					</view>
				</swiper-item>
			</swiper>
		</view>
		
		<!--底部导航-->
		<lw-tabbar :current="1"></lw-tabbar>
	</view>
</template>

<script>
let systemInfo = uni.getSystemInfoSync();
export default {
	data() {
		return {
			pageStatus:'show',
			timer:null,
			rankArr:[],
			statusBarHeight: systemInfo.statusBarHeight
		};
	},
	methods:{
		getRank:function(){	//获取行情
			if(this.pageStatus!='show'){
				clearTimeout(this.timer)
				return	//页面隐藏时不请求
			}
			this.$u.api.getRank().then(res=>{
				let tmp = []
				res[0].quotation.forEach(item=>{
					if(item.is_display == 1&&item.open_coin_trade == 1){	//只需要币币交易
						tmp.push(item)
					}
				})
				this.rankArr = tmp
				
				this.timer = setTimeout(()=>{
					this.getRank()
				},4000)
			}).catch(err=>{})
		}
	},
	onHide:function(){
		this.pageStatus = 'hide'
		clearTimeout(this.timer)
	},
	onShow:function(){
		this.pageStatus = 'show'
		this.getRank()
	},
	beforeDestroy:function(){
		clearTimeout(this.timer)
	},
	onLoad:function(){
		console.log('onload...')
	}
}
</script>

<style lang="scss">
.v-trade-container {
    height: 100vh;
    display: flex;
    flex-flow: column nowrap;
    align-items: flex-start;
    justify-content: flex-start;
	
	.status-bar {
	    flex-shrink: 0;
	    width: 100%;
	    flex: 0 0 auto;
	    height: 0;
	    z-index: 1001;
	    top: 0;
	    background-color: var(--page-background-color);
	}
	.trade-head-wrap {
	    flex-shrink: 0;
	    width: 100%;
	}
	.v-trade-tabs-wrap {
	    display: flex;
	    position: relative;
	    width: 100%;
	    font-weight: 700;
		.search-wrap {
		    position: absolute;
		    right: 30rpx;
		    top: 50%;
		    transform: translateY(-50%);
			.search-image {
			    width: 40rpx;
			    height: 40rpx;
			}
		}
	}
	
	.swiper-wrap {
	    width: 100%;
	    height: calc( 100% - var(--status-bar-height) - 142rpx - 100rpx );
		.swiper {
		    height: 100%;
			.swiper-item {
			    height: 100%;
				.scroll-view {
				    height: 100%;
				}
			}
		}
	}
}


</style>
