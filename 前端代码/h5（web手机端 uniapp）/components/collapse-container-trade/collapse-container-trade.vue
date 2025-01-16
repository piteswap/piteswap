<template>
	<view class="collapse-container">
		<u-mask :show="show" @click="hidePanel">
			<view class="menu-collapse bg-theme" :class="{'open':show}" @click.stop="">
				<view class="status-bar" :style="{'height':statusbarHeight +'px'}"></view>
				<slot></slot>
			</view>
		</u-mask>
	</view>
</template>

<script>
export default {
	name:"collapse-container-trade",
	data() {
		return {
			show:false,
			statusbarHeight:0	//状态栏高度
		};
	},
	methods:{
		panel:function(status){
			this.show = status=='show'
			this.$emit('menuStatus',status)
		},
		hidePanel:function(){
			this.panel('hide')
		}
	},
	created:function(){
		this.statusbarHeight = this.$sysInfo.statusBarHeight	//获取状态栏高度
	}
}
</script>

<style lang="scss" scoped>
.menu-collapse {
	width: 80%;
	max-width: 700rpx;
	//height: 100vh;
	position: relative;
	background-color: #fff;
	transform: translate(-100%);
	transition: .4s transform;
	//overflow-y: auto;
	&.dark {
		background-color: #102030;
		color: #fff
	}
	&.open {
		transform: translateX(0)
	}
}
</style>
