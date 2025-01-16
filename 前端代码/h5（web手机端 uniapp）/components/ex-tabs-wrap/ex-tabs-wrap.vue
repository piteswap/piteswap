<template>
	<view class="ex-tabs-wrap ex-tabs-wrap-dark">
		<view class="tabs-item" :class="{'weight':weight, 'default':def, 'brand':brand, 'active':currentIndex===index,'border-bottom':borderBottom}" v-for="(item,index) in listArr" :key="index" @click="tapItem(item,index)">{{item}}</view>
	</view>
</template>

<script>
export default {
	name:"ex-tabs-wrap",
	props:{
		list:{
			type:Array,
			default:function(){
				return ['公告','消息']
			}
		},
		weight:{
			type:Boolean,
			default:true
		},
		def:{
			type:Boolean,
			default:true
		},
		brand:{
			type:Boolean,
			default:false
		},
		borderBottom:{	//选中项显示下边框
			type:Boolean,
			default:true
		}
	},
	data() {
		return {
			listArr:[],
			currentIndex:0
		};
	},
	methods:{
		tapItem:function(item,index){
			this.currentIndex = index
			this.$emit('change',{label:item,index:index})
		}
	},
	created:function(){
		this.listArr = this.list
	}
}
</script>

<style lang="scss">
.ex-tabs-wrap {
	display:flex;
	background-color:var(--page-background-color);
	color:#606266;
	font-size:26rpx;
	padding:0 30rpx;
	align-items:baseline;
	height:88rpx;
	line-height:88rpx;
	z-index:1000;
	
	&.ex-tabs-wrap-dark{
		.active.default {
			color:#e2e8e4!important
		}
	}
	
	.tabs-item {
		margin-right:30rpx;
		&.active {
			font-weight:700;
			&.weight {
				font-size:36rpx
			}
			&.default {
				color:var(--text-color)
			}
			&.brand {
				color:#ffc107
			}
			&.border-bottom {
				position:relative;
				&::after {
					content:" ";
					position:absolute;
					bottom:0;
					left:50%;
					transform:translateX(-50%);
					width:60%;
					height:4rpx;
					background:#ffc107;
					transform:width .3s
				}
			}
		}
	}
}


</style>
