<template>
	<view class="v-container-wrap dark">
		<lw-navbar :title='$t("user.address.title")' :border-bottom="false"></lw-navbar>
		<view class="search-item search-item-dark">
			<u-search color="#fff" v-model="keyword" :show-action="false" :isCustomIcon="true" :clearabled="false" shape="square" :placeholder='$t("user.address.search")' bg-color="var(--page-part-color)" @change="onSearchChange">
				<view slot="customIcon">
					<view style="display:flex;align-items:center;">
						<image class="search-icon" src="@/static/images/common/search2.png"></image>
					</view>
				</view>
			</u-search>
		</view>
		<scroll-view class="scroll-wrap" :scroll-y="true">
			<setting-item v-for="(item,index) in currencyList" :key="index" :title="item.name" :weight="false" @click="onAddressClick(item)"></setting-item>
		</scroll-view>
	</view>
</template>

<script>
export default {
	data: function() {
		return {
			path: "/pages/user/address/address",
			keyword: "",
			loading: !1,
			list:this.webConf.baseCoin
		}
	},
	computed: {
		currencyList: function() {
			var t = this.keyword.toLowerCase();
			let obj = this.list.filter((function(e) {
				if(e.currency_id!=9999){
					return e.name.toLowerCase().indexOf(t) > -1
				}
				
			}
			))
			return obj
		}
	},
	onLoad: function() {
		this.fetchAccountsList()
	},
	methods: {
		onSearchChange: function(t) {
			var e = this;
			this.list.filter((function(t) {
				var i = e.keyword.toLowerCase();
				return t.name.indexOf(i) > 0
			}
			))
		},
		onAddressClick: function(t) {
			//console.log(t)
			let obj = {
				currency_id:t.currency_id,
				coin:t.name
			}
			this.$u.route({url:this.path,params:obj})
		},
		fetchAccountsList: function() {
			
		}
	}
}
</script>

<style lang="scss" scoped>
.v-contianer-wrap {
	height: 100%;
	background-color: #fff
}

.v-contianer-wrap.dark {
	background-color: var(--page-part-color)
}

.search-item {
	background-color: var(--page-part-color);
	padding: 10rpx 12rpx;
	border-bottom: 2rpx solid var(--border-color);
	left: 0;
	right: 0;
	top: 0;
	z-index: 100
}

.search-icon {
	width: 40rpx;
	height: 40rpx
}

.scroll-wrap {
	height: calc(100% - 44px);
	overflow: hidden
}
</style>
