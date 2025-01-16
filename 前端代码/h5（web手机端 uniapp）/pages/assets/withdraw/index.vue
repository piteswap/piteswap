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
				detail: "/pages/assets/withdraw/detail",
				wdbank:"/pages/assets/withdraw/bank/bank",
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
			//提现到银行卡
			if(t.currency_id==9999){
				this.$u.route(this.path.wdbank,a)
			}else{
				this.$u.route(this.path.detail,a)
			}
			
		},
		fetchCoinList: function() {
			
		}
	}
}
</script>

<style lang="scss" scoped>
.v-container-wrap{height:100%;background-color:#fff}
</style>
