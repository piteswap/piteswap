<template>
	<view class="darkStyle">
		<u-tabbar v-model="index" :list="listArr" height="100" :hide-tab-bar="true" :border-top="false" bg-color="var(--tabbar-color)" inactive-color="var(--inactive-clor)" active-color="var(--brand-color)" :before-switch="beforeSwitch"></u-tabbar>
	</view>
</template>

<script>
export default {
	props: {
		current: {
			type:Number,
			default:0
		},
	},
	computed:{
		listArr(){
			let arr = [ 
				{
					"iconPath": "/static/images/tabbar/tabbar-home-dark.png",
					"selectedIconPath": "/static/images/tabbar/tabbar-home-select-dark.png",
					"text": this.$t('tabbar.shouye'),
					"pagePath":"/pages/index/index"
				},
				{
					"iconPath": "/static/images/tabbar/tabbar-trade-dark.png",
					"selectedIconPath": "/static/images/tabbar/tabbar-trade-select-dark.png",
					"text": this.$t('tabbar.jiaoyi'),
					"pagePath":"/pages/trade/index"
				},
				{
					"iconPath": "/static/images/tabbar/tabbar-option-dark.png",
					"selectedIconPath": "/static/images/tabbar/tabbar-option-select-dark.png",
					"text": this.$t('tabbar.qiquan'),
					"pagePath": "/pages/option/detail"
				},
				{
					"iconPath": "/static/images/tabbar/tabbar-finance-dark.png",
					"selectedIconPath": "/static/images/tabbar/tabbar-finance-select-dark.png",
					"text": this.$t('tabbar.xintuo'),
					"pagePath": "/pages/template/index"
				},
				{
					"iconPath": "/static/images/tabbar/tabbar-assets-dark.png",
					"selectedIconPath": "/static/images/tabbar/tabbar-assets-select-dark.png",
					"text": this.$t('tabbar.zichan'),
					"pagePath": "/pages/assets/index"
				}
			]
			return arr
		}
	},
	data() {
		return {
			index: -1,
		}
	},
	created() {
		this.index = this.current
	},
	methods:{
		
		async beforeSwitch(index) {
			/*
			//判断哪些页面需要登录 并检测登录状态
			if([2,4].indexOf(index) > -1 && this.checkLogin(this.listArr[index].pagePath,null,2)!==true){	//如果这2个页面没有登录
				setTimeout(()=>{
					this.checkLogin()
				},100)	//延迟一下 否则可能无法跳转
				
				return false	//返回false不切换页面
			}*/
		} 
	}
}
</script>

<style>

</style>
