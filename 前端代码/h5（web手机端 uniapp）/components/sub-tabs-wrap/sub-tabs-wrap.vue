<template>
	<view class="trade-index-sub-tabs-container darkStyle">
		<view class="sub-tabs-wrap">
			<view class="sub-tabs-item" :class="{'active':currentIndex===index}" v-for="(label,index) in listArr" :key="index" @click="tapTab(label,index)">
				<view class="sub-tabs-label">{{label}}</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
		name:"sub-tabs-wrap",
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
.trade-index-sub-tabs-container {
    border-bottom: 2rpx solid var(--border-color);
	.sub-tabs-wrap {
	    display: flex;
	    justify-content: space-between;
	    font-weight: 700;
	    color: #b9bbd2;
	    padding: 0 30rpx;
		.sub-tabs-item {
		    flex: 1;
		    display: flex;
		    justify-content: center;
		    align-items: center;
			.sub-tabs-label {
			    height: 60rpx;
			    line-height: 60rpx;
			    display: inline-block;
			}
			&.active {
				.sub-tabs-label {
				    color: #FFC107;
				    position: relative;
					&::after {
						content: " ";
						position: absolute;
						bottom: 0;
						left: 50%;
						transform: translateX(-50%);
						width: 30rpx;
						height: 4rpx;
						border-radius: 2rpx;
						background-color: #FFC107;
					}
				}
			}
		}
	}
}
</style>
