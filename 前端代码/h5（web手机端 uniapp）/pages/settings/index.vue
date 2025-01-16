<template>
	<view class="dark">
		<lw-navbar :boxShadow="false"></lw-navbar>
		<u-cell-group class="setting-item" :border="false">
			<u-cell-item :title="$t('settings.index.language')" :value="lang" @click="$u.route('/pages/settings/language/language')"></u-cell-item>
			<u-cell-item :title="$t('settings.index.guanyu')" :arrow="false" hover-class="none" :value="$t('settings.index.banben') + guanyu"></u-cell-item>
			<u-cell-item :title="$t('settings.index.huanchun')" :arrow="false" hover-class="none" :value="huanchun" @click="clearCache"></u-cell-item>
		</u-cell-group>
		<u-cell-group class="setting-item" :border="false" style="margin-top: 20rpx;" v-if="vuex_token">
			<u-cell-item :title="$t('settings.account.tuichu')" :arrow="false" hover-class="none" @click="exitBtn"></u-cell-item>
		</u-cell-group>
		
		<view class="bg-theme">
			<mask-modal ref="sureModal" :text="$t('settings.account.tuichuqueren')" @action="tapModal"></mask-modal>
		</view>
	</view>
</template>

<script>
export default {
	data() {
		return {
			lang:'繁體中文',
			guanyu: '',
			huanchun:'0KB'
		};
	},
	methods:{
		exitBtn:function(){
			this.$refs['sureModal'].panel('show')
		},
		tapModal:function(type){
			if(type=='confirm'){
				this.$u.vuex('vuex_token','')
				this.$u.vuex('vuex_user','{}')
				uni.reLaunch({
					url:'/pages/index/index'
				})
			}
		},
		formatSize:function() {	//获取缓存大小 非APP获取的storage
			let that = this;
			// #ifdef APP-PLUS
			plus.cache.calculate(function(size) {
				let sizeCache = parseInt(size);
				if (sizeCache == 0) {
					that.huanchun = "0B";
				} else if (sizeCache < 1024) {
					that.huanchun = sizeCache + "B";
				} else if (sizeCache < 1048576) {
					that.huanchun = (sizeCache / 1024).toFixed(2) + "KB";
				} else if (sizeCache < 1073741824) {
					that.huanchun = (sizeCache / 1048576).toFixed(2) + "MB";
				} else {
					that.huanchun = (sizeCache / 1073741824).toFixed(2) + "GB";
				}
			});
			// #endif
			
			// #ifndef APP-PLUS
			const res = uni.getStorageInfoSync();
			let sizeCache = res.currentSize
			if (sizeCache == 0) {
				that.huanchun = "0B";
			} else if (sizeCache < 1024) {
				that.huanchun = sizeCache + "B";
			} else if (sizeCache < 1048576) {
				that.huanchun = (sizeCache / 1024).toFixed(2) + "KB";
			} else if (sizeCache < 1073741824) {
				that.huanchun = (sizeCache / 1048576).toFixed(2) + "MB";
			} else {
				that.huanchun = (sizeCache / 1073741824).toFixed(2) + "GB";
			}
			// #endif
		},
		// 清理缓存
		clearCache:function() {
			let that = this;
			let clearTxtOk = this.$t('settings.index.clearCacheOk')
			
			// #ifdef APP-PLUS
			
			let os = plus.os.name;
			if (os == 'Android') {
				let main = plus.android.runtimeMainActivity();
				let sdRoot = main.getCacheDir();
				let files = plus.android.invoke(sdRoot, "listFiles");
				let len = files.length;
				for (let i = 0; i < len; i++) {
					let filePath = '' + files[i]; // 没有找到合适的方法获取路径，这样写可以转成文件路径 
					plus.io.resolveLocalFileSystemURL(filePath, function(entry) {
						if (entry.isDirectory) {
							entry.removeRecursively(function(entry) { //递归删除其下的所有文件及子目录 
								uni.showToast({
									title: clearTxtOk,
									duration: 2000
								});
								that.formatSize(); // 重新计算缓存 
							}, function(e) {
								console.log(e.message)
							});
						} else {
							entry.remove();
						}
					}, function(e) {
						console.log('文件路径读取失败')
					});
				}
			} else { // ios 
				plus.cache.clear(function() {
					uni.showToast({
						title: clearTxtOk,
						duration: 2000
					});
					that.formatSize();
				});
			}
			
			// #endif
			uni.clearStorageSync()	//清除本地所有缓存
			this.formatSize()
			uni.setStorageSync('lang',this.$i18n.locale)	//重新写入语言
			this.$u.vuex('vuex_user',this.vuex_user)	//重新写入用户信息
			this.$u.vuex('vuex_token',this.vuex_token)	//重新写入用户token
			uni.showToast({
				title: clearTxtOk,
				duration: 2000
			});
		},
		getLang:function(){	//获取当前语言
			let lang = this.$i18n.locale
			this.webConf.langList.forEach(item=>{
				if(item.value == lang){
					this.lang = item.title
					return
				}
			})
		}
	},
	onLoad:function(){
		//this.checkLogin()
		this.guanyu = this.webConf.version || '1.0.0'
	},
	onShow:function(){
		this.getLang()
		this.formatSize()
	}
}
</script>

<style lang="scss">

</style>
