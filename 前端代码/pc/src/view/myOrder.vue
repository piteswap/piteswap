<template>
    <div class="myOrder">
        <div class="nav-list" ref="navDom">
            <div :class="['nav-item',current == index && 'active']" v-for="(item,index) in navList" :key="item" @click="choose(index)">
                {{$t(`${item}`)}}
            </div>
        </div>

        <div class="table">
            <div class="table-header" ref="tableHeader">
                <div class="header-item">{{$t('myOrder.product')}}</div>
                <div class="header-item">{{$t('myOrder.price')}}</div>
                <div class="header-item">{{$t('myOrder.now')}}</div>
                <div class="header-item">{{$t('myOrder.days')}}</div>
                <div class="header-item">{{$t('myOrder.rihua')}}</div>
                <div class="header-item">{{$t('myOrder.time')}}</div>
            </div>
            <div class="table-main" :style="{minHeight: `calc(100vh - ${footerH}px - ${handleH}px - ${tableHeaderH}px - ${navH}px - 49px)`}">
                <div class="row" v-for="(item,index) in orderList" :key="index">
                    <div class="row-item">
                        <img :src="'https://www.piaichat.com' + item.logo" alt="">
                        <span>{{item.currency_name}}</span>
                    </div>
                    <div class="row-item">{{item.amount}}</div>
                    <div class="row-item">{{(item.total_interest - 0).toFixed(2)}}</div>
                    <div class="row-item">{{item.remain_day}}</div>
                    <div class="row-item">{{(item.day_rate * 100).toFixed(3)}}%</div>
                    <div class="row-item">{{item.updated_at}}</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "Product",
    data(){
        return{
            navList: ['myOrder.all','myOrder.tuoguan','myOrder.done'],
            current: 0,
            orderList:[],
            footerH: 0,
            handleH: 0,
            tableHeaderH: 0,
            navH: 0
        }
    },
    methods:{
        choose(index){
            this.current = index
            console.log(this.current)
            this.getOrder()
        },

        getOrder(){
            var i = layer.load();
            this.$http({
                url: '/api/lh/deposit/order',
                method: 'get',
                params: {
                    page: 1,
                    limit: 1000,
                    status: this.current
                },
                headers: {'Authorization':  this.token},
            }).then(res=>{
                console.log(res,'订单列表')
                layer.close(i);
                if (res.data.type=="ok"){
                    this.orderList = res.data.message.order_list
                }else{
                    layer.msg(res.statusText);
                }
            }).catch(error=>{
                console.log(error)
            })
        }
    },
    mounted(){
        this.token = localStorage.getItem('token') || '';
        this.getOrder()

        this.$nextTick(() => {
            this.footerH = document.getElementById("fedui-footer").offsetHeight
            this.handleH = document.getElementById("handle-bg").offsetHeight
            this.tableHeaderH = this.$refs['tableHeader'].offsetHeight 
            this.navH = this.$refs['navDom'].offsetHeight 
        })
    }
}
</script>

<style scoped lang="scss">
    .myOrder{
            background: #1b2c42;
        .nav-list{
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            padding: 10px 150px;
            border-bottom: 1px solid rgb(68, 68, 68);
            background: #1b2c42;
            .nav-item{
                margin-right: 20px;
                padding: 6px 15px;
                border: 1px solid #fff;
                border-radius: 3px;
                cursor: pointer;
                background: #2b2a2a;
            }
            .active{
                color: #171c2b;
                background: #fff;
            }
        }

		.table{
			width: 80%;
			margin-left: 10%;
			border: 1px solid #9ca9b5;
            background: #1b2c42;
		}
        .table-header{
            width: 100%;
            padding: 25px 30px;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
			background-color: #171c2b;
            .header-item{
                width: 16.6%;
                text-align: center;
                color: gray;
            }
        }
        .table-main{
            width: 100%;
            min-height: 700px;
            .row{
                display: flex;
                width: 100%;
                padding: 20px 30px;
                box-sizing: border-box;
                align-items: center;
                background: #161616;
                justify-content: space-between;
				background: #1a243b;
                .row-item{
                    width: 16.6%;
                    text-align: center;
                    img{
                        width: 50px;
                        margin-right: 10px;
                    }     
                }

                &:hover{
                    background: #171c2b;
                }
            }
        }
    }
</style>