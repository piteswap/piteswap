<template>
	<view class="ex-tab-container">
		<view class="tab_list-wrap">
			<view class="tab_item" :class="{'active':index == currentIndex}" v-for="(label,index) in newList" :key="index" @click="clickLabel(label,index)">
				<text>{{label}}</text>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"ex-tab-container",
	props:{
		list:{
			type:Array,
			default:function(){
				return ['LABEL1','LABEL2']
			}
		},
		current:{	//默认选项
			type:Number | String,
			default:0
		}
	},
	watch:{
		list:function(newVal){
			this.newList = newVal
		},
		current:function(newVal){
			this.currentIndex = newVal
		}
	},
	created:function(){
		this.newList = this.list
		this.currentIndex = this.current
	},
	data() {
		return {
			currentIndex:0,
			newList:[]
		};
	},
	methods:{
		clickLabel:function(label,index){
			this.currentIndex = index
			this.$emit('clickTab',{name:label,index:index})
		}
	}
}
</script>

<style lang="scss" scoped>
.ex-tab-container {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: var(--page-background-color);
	.tab_list-wrap {
		display: flex;
		align-content: center;
		color: #768da9;
		.tab_item {
			position: relative;
			padding: 30rpx 50rpx;
			font-size: 28rpx;
			font-weight: 700;
			&::after {
				color: #768da9;
				content: "/";
				position: absolute;
				right: 0;
				top: 50%;
				transform: translateY(-50%)
			}
			&:last-child::after {
				content: ""
			}
			&.active {
				color: #FFC107
			}
		}
	}
}

</style>
