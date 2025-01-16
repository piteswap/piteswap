<template>
	<view class="trade-index-main-tabs-container darkStyle">
		<view class="main-tabs-wrap">
			<view class="main-tabs-item" :class="{'active':currentIndex===index}" v-for="(label,index) in listArr" :key="index" @click="tapTab(label,index)">
				<view class="main-tabs-label">{{label}}</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"main-tabs-wrap",
	props:{
		list:{
			type:Array,
			default:function(){
				return ['LABEL1','LABEL2']
			}
		}
	},
	data() {
		return {
			currentIndex:0,
			listArr:['LABEL1','LABEL2']
		};
	},
	methods:{
		tapTab:function(label,index){
			this.currentIndex = index
			this.$emit('change',{name:label,index:index})
		}
	},
	created:function(){
		this.listArr = this.list
	},
	watch:{
		list:function(newVal){
			this.listArr = newVal
		}
	}
}
</script>

<style lang="scss">
.trade-index-main-tabs-container {
	padding: 0 30rpx;
	.main-tabs-wrap {
	    display: flex;
	    justify-content: space-between;
	    color: #ffffff;
	    font-size: 30rpx;
	    font-weight: 700;
		.main-tabs-item {
		    padding: 0 30rpx;
		    display: flex;
		    justify-content: center;
		    align-items: center;
			.main-tabs-label {
			    height: 80rpx;
			    line-height: 80rpx;
			    display: inline-block;
			}
			&.active{
				.main-tabs-label {
				    font-size: 40rpx;
				    color: #0f1853;
				    position: relative;
					&::after {
					    content: " ";
					    position: absolute;
					    bottom: 0;
					    left: 50%;
					    transform: translateX(-50%);
					    width: 30rpx;
					    height: 8rpx;
					    border-radius: 4rpx;
					    background-color: #FFC107;
					}
				}
				
			}
		}
	}
}
.darkStyle .main-tabs-wrap .main-tabs-item.active .main-tabs-label {
    color: #e2e8e4;
}
</style>
