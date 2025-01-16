<template>
	<view class="v-content-wrap dark">
		<view class="search-wrap bg-theme">
			<view class="statusbar-height" style="height: var(--status-bar-height);"></view>
			<view class="top-head">
				<view class="input-wrap">
					<view class="search-icon"></view>
					<input class="input" v-model="key" :placeholder="$t('common.ssgjz')" @input="$u.debounce(search, 100)" />
				</view>
				<view class="right" @click="cancel">{{$t('common.md_cancel')}}</view>
			</view>
		</view>
		<view class="search-immersive" style="height:calc(var(--status-bar-height) + 88rpx);"></view>
		
		<view class="list-wrap" v-if="newList.length>0">
			<uni-view class="list-item" v-for="(item,index) in newList" :key="item.id" @click="select(item)">
				<uni-view class="left">{{item.name}}</uni-view>
				<uni-view class="right">+ {{item.area_code}}</uni-view>
			</uni-view>
		</view>
		<view class="bg-theme" v-else>
			<empty-container></empty-container>
		</view>
		
	</view>
</template>

<script>
export default {
	data() {
		return {
			key:'',
			sourceList:[],
			newList:[]
		};
	},
	methods:{
		cancel:function(){
			this.goBack()
		},
		select:function(item){
			uni.$emit('chooseArea',item)
			this.goBack()
		},
		search:function(){
			let key = this.key
			if(!key){
				this.newList = this.sourceList
				return
			}
			
			let res = this.sourceList.filter( one => one.name.toLowerCase().includes(key.toLowerCase()) )
			this.newList = res
		},
		getList:function(){
			this.$u.api.areaCode({'lang':this.$i18n.locale}).then(res => {
				this.sourceList = res
				this.newList = this.sourceList
			})
		}
	},
	onLoad:function(){
		this.getList()
	}
}
</script>

<style lang="scss" scoped>
.v-content-wrap {
    background-color: #fff;
    height: 100%;
    font-size: 26rpx;
    overflow: hidden;
    overflow-y: auto;
	.search-wrap {
	    border-bottom: 2rpx solid var(--border-color);
	    padding: 0 30rpx;
	    position: fixed;
	    width: 100%;
	    background-color: #fff;
	    z-index: 200;
		
		.top-head {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    //height: calc(var(--status-bar-height) + 88rpx);
			height: 88rpx;
		}
		
		.input-wrap {
		    flex: 1;
		    display: flex;
		    align-items: center;
		    box-sizing: border-box;
		    padding-right: 20rpx;
			
			.search-icon {
			    flex: 0 0 auto;
			    width: 46rpx;
			    height: 46rpx;
			    background: url('@/static/images/common/search.png');
			    background-size: 100% 100%;
			    margin-right: 20rpx;
			}
			.input {
			    flex: 1;
			    font-size: 26rpx;
			    text-align: left;
			    color: var(--text-color);
			    caret-color: #FFC107;
			}
		}
		
		.right {
		    flex: 0 0 auto;
		    font-size: 28rpx;
		    color: var(--text-color);
		}
	}
	
	.list-wrap {
	    font-size: 24rpx;
		.list-item {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 30rpx;
			.right {
			    color: #909399;
			}
		}
	}
}
</style>
