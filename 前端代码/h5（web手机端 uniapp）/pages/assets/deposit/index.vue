<template>
	<view class="v-container-wrap dark">
		<ex-search :list="list" @click-item="clickItem"></ex-search>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			loading: !1,
			path: {
				charge: "/pages/assets/deposit/charge"
			},
			list:this.webConf.baseCoin
		}
	},
	onLoad: function(t) {
		if(!this.checkLogin()){
			return
		}
		this.account_type_id = t.account_type_id,
		this.fetchCoinList()
	},
	methods: {
		clickItem: function(t, e) {
			var a = {
				currency_code: t.name,
				currency_id: t.currency_id
			};
			this.$u.route(this.path.charge,a)
		},
		fetchCoinList: function() {
			
		}
	}
}
</script>

<style lang="scss" scoped>
.v-container-wrap{height:100%;background-color:#fff}
</style>
