<template>
	<view class="order-history-container">
		<view style="min-height: 500rpx; position: relative;" v-if="isEmpty">
			<empty-container :empty-text="$t('common.nodata')"></empty-container>
		</view>
		<view class="order-history-list" v-else>
			<order-card v-for="(item,index) in list" :key="index" :info="item">
				<template slot="head-right">
					<!--<text @click.stop="cancelOrder">取消<u-icon name="arrow-right"></u-icon></text>--><!--["取消", "已完成", "已取消"]-->
					<text v-if="item.status==2" class="status2">{{$t('trade.kline.completed')}}</text>
					<text v-else-if="item.status==3" class="status3">{{$t('trade.kline.cancelled')}}</text>
					<text v-else class="status1">{{$t('trade.kline.waiting')}}</text>
				</template>
			</order-card>
			<view class="loadmore-box">
				<u-loadmore :status="status" :load-text="loadText" color="var(--text-color)" font-size="24" margin-top="40" margin-bottom="40" @loadmore="fetchMore" />
			</view>
		</view>
	</view>
</template>

<script>
export default {
	name:"order-history-container",
	props:{
		currencyId: {
			type: String | Number,
			default: 0
		},
		legalId: {
			type: String | Number,
			default: 0
		}
	},
	data() {
		return {
			list: [],
			currency_id:0,
			legal_id:0,
			loading: false,
			ismore:true,//是否有更多
			status: 'loadmore',	//通过status设置组件的状态，加载前值为loadmore，加载中为loading，没有数据为nomore
			pagination: {
				page: 1,
				limit: 10
			},
			loadText: {
				loadmore: this.$t('common.loadmore'),
				loading: this.$t('common.loading'),
				nomore: this.$t('common.nomore')
			}
		};
	},
	watch:{
		currencyId:function(newVal){
			//console.log("currencyId-->",newVal)
			this.currency_id = newVal
		},
		legalId:function(newVal){
			this.legal_id = newVal
		}
	},
	computed: {
		isEmpty: function() {
			return this.$u.test.isEmpty(this.list)
		}
	},
	created:function(){
		this.currency_id = this.currencyId
		this.legal_id = this.legalId
		this.fetchList() 
	},
	methods:{
		cancelOrder:function(id,index){
			let that=this;
			this.$u.api.coinTradeCancel({id:id}).then(res=>{
				that.list[index].status=3
				that.$refs.uToast.show({
					title: res,
					type: 'success'
				})
			}).catch(err=>{})
		},
		fetchList: function() {
			let params = {
					currency_id:this.currency_id,
					legal_id:this.legal_id,
					page: this.pagination.page,
					limit: this.pagination.limit
				}
			this.loading = true
			this.$u.api.coinList(params).then(res=>{
				this.loading = false
				let list = res
				
				if(list.length>0){
					if(list.length < this.pagination.page){	//如果得到的结果数量小于页总数 说明没有下一页了
						this.ismore = false
						this.status = 'nomore'
					}
					
					if (1 == this.pagination.page){	//第一页
						this.list = list
					}else{	
						list.forEach((item)=>{
							this.list.push(item)
						})
					}
				}else{
					this.ismore = false
					this.status = 'nomore'
				}
				
			}).catch(err=>{
				this.loading = false
			})
		},
		reload: function(obj) {
			if(typeof obj == 'object' && obj.currency_id && obj.legal_id){	//父页面传递参数 防止更新不及时
				this.currency_id = obj.currency_id
				this.legal_id = obj.legal_id
			}
			
			this.pagination.page = 1
			this.ismore = true
			this.status = 'loadmore'
			this.loading = false
			this.list = []
			this.fetchList()
		},
		fetchMore: function() {
			if(this.ismore!==true){
				console.log('no more')
				return
			}
			if(this.loading===true){
				console.log('loading...')
				return
			}
			this.pagination.page++
			this.fetchList()
		}
	}
}
</script>

<style lang="scss" scoped>
.order-history-container .order-history-list{min-height:500rpx;}
.loadmore-box{
	display: block; overflow: hidden;
}
.status2{
	color:var(--brand-color)
}
.status3{
	color:#768da9
}
</style>
