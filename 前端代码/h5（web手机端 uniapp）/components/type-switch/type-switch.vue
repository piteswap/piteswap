<template>
	<view class="login-type-switch">
		<view class="switch-wrapper" style="width: 100%;">
			<view class="move darkStyle" :class="{'right': activeBtn=='right'}"></view>
			<view class="switch-button left darkStyle" v-if="leftLabel" :class="{'active':activeBtn=='left'}" @click="tapBtn('left')">{{leftLabel}}</view>
			<view class="switch-button right darkStyle" v-if="rightLabel" :class="{'active':activeBtn=='right'}" @click="tapBtn('right')">{{rightLabel}}</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"type-switch",
	props:{
		leftLabel:{
			type:String,
			default:''
		},
		rightLabel:{
			type:String,
			default:''
		}
	},
	data() {
		return {
			activeBtn:'left'
		};
	},
	methods:{
		tapBtn:function(btnName){
			this.activeBtn = btnName
			this.$emit('change',btnName)
		}
	}
}
</script>

<style lang="scss">
.login-type-switch {
    width: 100%;
	.switch-wrapper {
	    margin: 0 auto;
	    width: 500rpx;
	    height: 80rpx;
	    background-color: var(--page-part-color);
	    border-radius: 80rpx;
	    box-sizing: border-box;
	    position: relative;
	    display: flex;
	    align-items: center;
	    justify-content: center;
		
		.move {
		    position: absolute;
		    left: 0;
		    width: 55%;
		    height: 80rpx;
		    line-height: 80rpx;
		    color: #fff;
		    border-radius: 80rpx;
		    background: #2bd6aa;
		    transition: left .5s;
			&.darkStyle {
			    background: linear-gradient(0deg,#FFC107,#FF9800);
			}
			
			&.right {
			    left: 45%;
			}
		}
		
		.switch-button {
		    width: 50%;
		    box-sizing: border-box;
		    height: 80rpx;
		    line-height: 80rpx;
		    text-align: center;
		    align-items: center;
		    position: absolute;
		    color: #64667d;
			&.darkStyle {
			    color: var(--text-color);
			}
			&.active {
			    color: #fff;
			}
			&.left {
			    left: 0;
			}
			&.right {
			    right: 0;
			}
		}
		
	}
	
}
</style>
