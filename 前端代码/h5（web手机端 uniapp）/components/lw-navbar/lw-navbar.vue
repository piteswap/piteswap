<template>
	<view class="content darkStyle">
		<u-navbar :is-back="isBack" :custom-back="goToBack" :title="title" :leftIconColor="leftIconColor" :border-bottom="borderBottom" :class="{'noboxshadow':boxShadow!=true}">
			<view style="flex:1" slot="default">
				<slot name="default"></slot>
			</view>
			<view class="slot-wrap" slot="right">
				<slot name="right"></slot>
			</view>
		</u-navbar>
	</view>
</template>

<script>
export default {
	props: {
		isBack:{	//是否显示返回按钮
			type:Boolean,
			default:true
		},
		title: {
			type:String,
			default:''
		},
		borderBottom:{
			type:Boolean,
			default:false
		},
		boxShadow:{
			type:Boolean,
			default:true
		},
		leftIconColor: {
			type: String,
			default: '#303133'
		}
	},
	data() {
		return {
		}
	},
	methods:{
		
		goToBack:function(){
			const pages = getCurrentPages();
			if (pages.length === 1) {	//如果当前是顶级页面 则直接反回首页
				uni.switchTab({
					url: '/pages/index/index',
				})
				
			} else {
				uni.navigateBack({
					delta: 1
				});
			}
		}
	}
}
</script>

<style scoped>
.noboxshadow >>> .u-navbar{box-shadow: none;}

.v-center {
	display: flex;
	align-items: center
}

.r-center {
	display: flex;
	justify-content: center
}

.center {
	display: flex;
	justify-content: center;
	align-items: center
}

.column {
	display: flex;
	flex-flow: column nowrap
}

.no-shrink {
	flex-shrink: 0
}

.grow {
	flex-grow: 1
}

.page-height {
	height: calc(100vh - 44px - 0px)
}

.page-back {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%
}

.bg {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed
}

.top-bar-height {
	height: calc(44px + 0px)
}

.content.darkStyle .u-status-bar {
	background-color: var(--page-background-color)!important
}

.content.darkStyle .u-navbar {
	background-color: var(--page-background-color)!important;
	box-shadow: 0 4rpx 4rpx 0 rgba(10,16,23,.4)
}

.content.darkStyle .u-navbar .u-title {
	color: #fff!important
}

.content.darkStyle .u-navbar.u-border-bottom::after {
	border-color: #1a293c
}

.content .u-navbar .u-title {
	color: #202020!important
}

.content .u-navbar.u-border-bottom::after {
	border-color: #ededed
}

.content .slot-wrap {
	height: 100%;
	display: flex;
	align-items: center
}

.content .title {
	font-weight: 700;
	font-size: 30rpx;
	padding: 0 30rpx;
	width: 630rpx;
	text-align: center
}

.content .title.ellipsis {
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
	text-overflow: ellipsis;
	white-space: nowrap
}

.slot-wrap {
	display: flex;
	padding-left: 30rpx;
	padding-right: 30rpx;
	justify-content: space-between
}

.slot-wrap .slot-back {
	width: 40rpx;
	height: 40rpx
}
</style>
