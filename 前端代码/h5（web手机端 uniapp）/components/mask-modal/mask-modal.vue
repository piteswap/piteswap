<template>
	<view class="mask-modal" v-show="show">
		<view class="ex-modal-wrap bg-theme darkStyle">
			<view class="ex-modal-head">
				<view class="left">{{title || $t('common.md_title')}}</view>
				<view class="right" @click="close">{{$t('common.md_close')}}</view>
			</view>
			<view class="ex-modal-content" v-if="text">
				<view v-html="text" v-if="html"></view>
				<text v-else>{{text}}</text>
			</view>
			<view class="ex-modal-content" v-else>
				<slot></slot>
			</view>
			<view class="ex-modal-footer" v-if="footer">
				<view class="left button">
					<ex-button-wrap theme="light" class-name="circle small darkStyle" @click="cancel" :text="cancelTxt || $t('common.md_cancel')" :plain="true"></ex-button-wrap>
				</view>
				<view class="right button">
					<ex-button-wrap theme="primary" class-name="circle small darkStyle" @click="confirm" :text="confirmTxt || $t('common.md_confirm')" :plain="true"></ex-button-wrap>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"mask-modal",
	props:{
		value:{
			type:Boolean,
			default:false
		},
		text:{	//提示内容
			type:String,
			default:''
		},
		title:{	//标题
			type:String,
			default:''
		},
		cancelTxt:{	//取消按钮
			type:String,
			default:''
		},
		confirmTxt:{	//确认按钮
			type:String,
			default:''
		},
		footer:{
			type:Boolean,
			default:true
		},
		html:{	//text内容是否为HTML
			type:Boolean,
			default:true
		}
	},
	watch:{
		'value':function(newVal){
			this.show = newVal
		}
	},
	data() {
		return {
			show:false
		};
	},
	methods:{
		panel:function(type){
			this.show = type=='show'
		},
		close:function(){
			this.panel('hide')
			this.$emit('action','close')
		},
		cancel:function(){
			this.panel('hide')
			this.$emit('action','cancel')
		},
		confirm:function(){
			this.panel('hide')
			this.$emit('action','confirm')
		}
	},
	created() {
		this.show = this.value
	}
}
</script>

<style lang="scss">
.mask-modal {
    position: fixed;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    z-index: 1000;
    background: rgba(0,0,0,.35);
    display: flex;
    justify-content: center;
    align-items: center;
	.ex-modal-wrap {
	    width: 80%;
	    padding: 30rpx;
	    background-color: #fff;
	    border-radius: 8rpx;
	    color: var(--text-color);
		&.darkStyle {
			background-color: #18171a!important;
			color: #768da9!important;
			box-shadow: 0 10rpx 20rpx 0 #000000;
			.ex-modal-head {
				.left {
				    color: #c0c1ca;
				}
			}
		}
		.ex-modal-head {
		    display: flex;
		    justify-content: space-between;
		    padding: 20rpx 0;
			.left {
			    font-size: 28rpx;
			    font-weight: 700;
			    color: #FFC107;
			}
			.right {
			    font-size: 26rpx;
			    color: #ffffff;
			}
		}
	}
	.ex-modal-content {
	    min-height: 100rpx;
	}
	.ex-modal-footer {
	    display: flex;
	    justify-content: space-between;
	    padding: 10rpx 0;
		.button {
		    flex: 1;
		    margin-right: 10rpx;
		}
	}
}

</style>
