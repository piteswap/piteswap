<template>
	<view class="ex-button-wrap">
		<button :class=" newClassArr " :plain="plain" :disabled="disabled" :hover-class="'hover hover-'+theme" @click="btnClick">{{text}}</button>
	</view>
</template>

<script>
export default {
	name:"ex-button-wrap",
	computed:{
		newClassArr:function(){
			let arr = ['btn',this.theme]
			if(this.disabled){
				arr.push(this.theme+'-disabled')
			}
			this.className.split(' ').forEach(item=>{
				arr.push(item)
			})
			return arr
		}
	},
	props:{
		className:{
			type:String,
			default:''
		},
		theme:{
			type:String,
			default:'primary'	//风格 primary  blank
		},
		text:{
			type:String,
			default:'注册'
		},
		plain:{
			type:Boolean,
			default:true
		},
		disabled:{
			type:Boolean,
			default:false
		}
	},
	data() {
		return {
			
		};
	},
	methods:{
		btnClick:function(e){
			this.$emit('click',e)
		}
	}
}
</script>

<style lang="scss">
.ex-button-wrap{
	.btn {
		margin-bottom: 10rpx;
		font-size: 36rpx;
		box-shadow: none;
		border: none;
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 10rpx;
		
		&.square {
			border-radius: 0
		}
		&.circle {
			border-radius: 10rpx
		}
		&.hover {
			opacity: .8
		}
		&.large {
			height: 80rpx;
			line-height: 80rpx
		}
		&.small {
			height: 52rpx;
			line-height: 52rpx;
			font-size: 28rpx
		}
		&.font-bold {
			font-weight: 700
		}
		&.primary {
			background: linear-gradient(0deg,#FFC107,#FF9800);
			color: #fff;
			&.primary-gradient {
				background: linear-gradient(#fd9578,#fd5b2c)
			}
		}
		&.primary-disabled {
			background-color: #feb6a0;
			color: rgba(255,255,255,.4)
		}
		&.hover-primary {
			background-color: #f94d19;
			color: #fff
		}
		&.blank {
			background-color: #e8e8e8;
			color: #9f9f9f;
			&.lightStyle {
				border: 4rpx solid #ffc107;
				background: #ededee;
				color: #4e4d4d
			}
		}
		&.hover-blank {
			background-color: #f3f1f1
		}
		&.darkStyle {
			background-color: #20354f;
			color: #fff
		}
		&.hover-light {
			background-color: #f7f9f8
		}
		&.blue {
			background-color: #f7f6fb;
			color: #3b69cb
		}
		&.hover-blue {
			background-color: #f7f9f8;
			color: #2464bb
		}
		&.danger {
			background-color: #ea6f6d;
			color: #fff
		}
		&.danger-gradient {
			background: linear-gradient(0deg,#c93d4b,#eb4d5c);
			color: #fff
		}
		&.pass {
			background-color: #13ac59;
			color: #fff
		}
		&.pass-gradient {
			background: linear-gradient(0deg,#11a97c,#12b887);
			color: #fff
		}
		&.hover-pass {
			opacity: .8
		}
		&.buy {
			background: linear-gradient(0deg,#FFC107,#FF9800);
			color: #fff;
			&.darkStyle {
				background: linear-gradient(0deg,#FFC107,#FF9800)
			}
		}
		&.sell {
			background: linear-gradient(0deg,#c93d4b,#eb4d5c);
			color: #fff;
			&.darkStyle {
				background: linear-gradient(0deg,#bd6b54,#f5a889)
			}
		}
	}
}
</style>
