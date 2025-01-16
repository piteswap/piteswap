<template>
	<view class="dark">
		<lw-navbar :title="$t('settings.language.title')"></lw-navbar>
		<u-cell-group class="setting-item" :border="false">
			<u-cell-item :title="item.title" :arrow="false" v-for="(item,index) in langList" :key="index" :index="index" @click="switchLang(item)"></u-cell-item>
		</u-cell-group>
	</view>
</template>

<script>
export default {
	data() {
		return {
			langList:[]
		}
	},
	methods: {
		switchLang(item) {
			this.$i18n.locale = item.value;
			uni.setStorageSync('lang',item.value)
			this.$u.api.setLang().then(res=>{
				console.log(res,'res')
				/*uni.reLaunch({
					url:'/pages/index/index'
				})*/
				uni.$emit('langChange',item.value)	//发送一个事件标明语言切换了
				this.goBack()
			})
		}
	},
	onLoad:function(){
		this.langList = this.webConf.langList
	}
}
</script>

<style>

</style>
