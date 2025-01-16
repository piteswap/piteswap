<template>
	<view class="ex-tr" :class="{'border-bottom':borderBottom}" @click="click">
		<slot></slot>
	</view>
</template>

<script>
export default {
	name:"ex-tr",
	props:{
		borderBottom:{
			type:Boolean,
			default:true
		}
	},
	data() {
		return {
			
		};
	},
	methods:{
		click:function(e){
			this.$emit('click',e)
		}
	}
}
</script>

<style lang="scss">
.ex-tr {
    display: table-row;
    width: 100%;
    height: 100%;
	&.border-bottom {
	    border-bottom: 2rpx solid var(--border-color);
	}
}
</style>
