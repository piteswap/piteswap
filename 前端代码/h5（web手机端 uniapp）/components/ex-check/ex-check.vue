<template>
	<view class="ex-check-container">
		<view class="checkbox" :class="{'checked':value}" @click.stop="check"></view>
	</view>
</template>

<script>
export default {
	name:"ex-check",
	props:{
		value:{
			type:Boolean,
			default:false
		}
	},
	data() {
		return {
			
		};
	},
	methods:{
		check: function(e) {
			this.$emit("click", e)
		}
	}
}
</script>

<style lang="scss" scoped>
.ex-check-container .checkbox {
	-webkit-box-flex: 1;
	-webkit-flex: 1 0 auto;
	flex: 1 0 auto;
	width: 25px;
	height: 25px;
	background: url('@/static/images/common/checkbox_1.png');background-size: 100% 100%;
	margin-right: 5px;
	&.checked {
		background: url('@/static/images/common/checkbox_2.png');background-size: 100% 100%
	}
}
</style>
