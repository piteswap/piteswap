<template>
	<view class="ex-table-wraps ex-table">
		<view class="ex-table">
			<slot></slot>
		</view>
	</view>
</template>

<script>
export default {
	name:"ex-table",
	data() {
		return {
			
		};
	}
}
</script>

<style lang="scss">
.ex-table-wraps {
    background: var(--page-background-color);
	.ex-table {
	    display: table;
	    width: 100%;
	    border-collapse: collapse;
	}
}
</style>
