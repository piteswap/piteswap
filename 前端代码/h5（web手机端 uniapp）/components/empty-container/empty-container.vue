<template>
	<view class="bg-theme empty-container">
		<view class="empty-content-wrap">
			<image class="empty-image" mode="widthFix" src="@/static/images/common/empty-icon-dark.png" lazy-load></image>
			<view class="empty-text">{{empty_text}}</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"empty-container",
	props:{
		emptyText:{	//显示的文字
			type:String,
			default: ''
		}
	},
	watch:{
		emptyText:function(newVal){
			this.empty_text = newVal
		}
	},
	created:function(){
		if(this.emptyText){
			this.empty_text = this.emptyText
		}
	},
	data() {
		return {
			empty_text:this.$t('common.nodata')
		};
	}
}
</script>

<style lang="scss" scoped>
.empty-container{
	.empty-content-wrap {
	    position: absolute;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    top: 0;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
		.empty-image {
		    width: 120rpx;
		    height: 142rpx;
		}
		.empty-text {
		    color: #c0c4cc;
		    margin-top: 10rpx;
		}
	}
}
</style>
