<template>
	<view class="home-content-container">
		<view class="options-content-item bg-theme" @click.stop="$u.route(path.deposit)">
			<view class="icon-wrap">
				<image src="@/static/images/common/hc1.png" class="icon-image" mode="widthFix"></image>
			</view>
			<view class="options-content">
				<view class="label">{{$t('index.chongzhi')}}</view>
				<view class="tips">{{$t('index.dianjichongzhi')}}</view>
			</view>
		</view>
		<view class="options-cotnent-cell-wrap">
			<view class="options-cotnent-cell " @click.stop="$u.route(path.withdraw)">
				<view class="icon-wrap">
					<image src="@/static/images/common/hc2.png" class="icon-sm-image" mode="widthFix"></image>
				</view>
				<view class="text-wrap">
					<text><span>{{$t('index.kuaishutibi')}}</span></text>
				</view>
			</view>
			<view class="options-cotnent-cell " @click.stop="openService">
				<view class="icon-wrap">
					<image src="@/static/images/common/hc3.png" class="icon-sm-image" mode="widthFix"></image>
				</view>
				<view class="text-wrap">
					<text><span>{{$t('helpCenter.labels[1]')}}</span></text>
					<!--<text><span>{{$t('index.vipchongzhitd')}}</span></text>-->
				</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"home-content",
	data() {
		return {
			path:{
				deposit:'/pages/assets/deposit/index',
				withdraw:'/pages/assets/withdraw/index',
				service:this.webConf.serviceChat
			}
		};
	},
	methods:{
		openUrl: function(e) {
			e = encodeURI(e)
			// #ifdef APP-PLUS
			plus.runtime.openURL(e)
			// #endif
			// #ifndef APP-PLUS
			window.open(e)
			// #endif
		},
		openService:function(){
			if(this.webConf.serviceChatOpenType=='blank'){
				this.openUrl(this.path.service)
			}else{
				this.$u.route('/pages/help/center/chat')
			}
			
		}
	}
}
</script>

<style lang="scss" scoped>
.home-content-container {
    display: flex;
    //grid-template-columns: 49% 49%;
    justify-content: space-between;
    margin-top: 30rpx;
	
	.options-content-item {
	    background: var(--page-part-color);
	    border-radius: 16rpx;
	    padding: 20rpx 0;
	    position: relative;
	    display: flex;
	    align-items: center;
		width: 49%;
		margin-right:1%;
		flex:1;
		flex-shrink: 0;
		.icon-wrap {
		    margin-left: 16rpx;
		    margin-right: 20rpx;
			.icon-image {
			    width: 88rpx;
			    height: 88rpx;
			}
		}
		.options-content {
		    margin-right: 24rpx;
			.tips {
			    color: #7e829b;
			    font-size: 26rpx;
			    margin-top: 10rpx;
			}
		}
	}
	
	.options-cotnent-cell-wrap {
	    display: flex;
	    flex-direction: column;
		margin-left:1%;
		width: 49%;
		flex:1;
		flex-shrink: 0;
		
		.options-cotnent-cell {
		    flex: 1;
		    background-color: var(--page-part-color);
		    border-radius: 8rpx;
		    padding: 12rpx 10rpx;
		    position: relative;
		    display: flex;
		    align-items: center;
		    margin-bottom: 10rpx;
		    font-size: 26rpx;
			
			.icon-wrap {
			    width: 80rpx;
			    height: 100%;
			    display: flex;
			    align-items: center;
			    justify-content: flex-end;
			    margin-right: 20rpx;
				.icon-sm-image{
					width: 56rpx;
					height: 56rpx;
				}
			}
		}
		.options-cotnent-cell:last-child {
		    margin-bottom: 0;
		}
	}
}
</style>
