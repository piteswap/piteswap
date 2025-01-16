<template>
    <div class="product">
        <!-- <div class="nav-list">
            <div :class="['nav-item',current == index && 'active']" v-for="(item,index) in navList" :key="item" @click="choose(index)">
                {{item}}
            </div>
        </div> -->

        <div class="table">
            <div class="table-header" ref="tableHeader">
                <div class="header-item">{{$t('property.chanpin')}}</div>
                <div class="header-item">{{$t('property.fabu')}}</div>
                <!-- <div class="header-item">剩余资金</div> -->
                <div class="header-item">{{$t('property.licai')}}</div>
                <div class="header-item">{{$t('property.rihua')}}</div>
                <div class="header-item">{{$t('property.caozuo')}}</div>
            </div>
            <div class="table-main" :style="{minHeight: `calc(100vh - ${footerH}px - ${handleH}px - ${tableHeaderH}px - 49px)`}">
                <div class="row-wrap" v-for="(item,index) in list" :key="index" >
                    <div class="row_1" v-if="item.current == 'row_1'">
                        <div class="row-item">
                            <img :src="'https://www.piaichat.com' + item.currency_logo" style="width: 40px" alt="">
                        </div>
                        <div class="row-item">{{item.save_min}}</div>
                        <!-- <div class="row-item">{{syPrice}}</div> -->
                        <div class="row-item">{{item.day}} {{$t('property.day')}}</div>
                        <div class="row-item">{{item.interest_rate}}%</div>
                        <div class="row-item">
                            <div class="btn" @click="buy(item,index)">{{$t('property.buy')}}</div>
                        </div>
                    </div>
                    <div class="row_2" v-else>
                        <div class="row2-left">
                            <div class="row2-left-item">
                                <img :src="'https://www.piaichat.com' + item.currency_logo" style="width: 40px" alt="">
                            </div>
                            <div class="row2-left-item" style="margin-top: 20px">
                                <div class="name">{{$t('property.licai')}}</div>
                                <div class="val">{{item.day}} {{$t('property.day')}}</div>
                            </div>
                        </div>
                        <div class="row2-item">
                            <div class="row2-item-style">
                                <div class="name">{{$t('property.fabu')}}</div>
                                <div class="val">{{item.save_min}}</div>
                            </div>
                            <div class="row2-item-style" style="margin-top: 20px">
                                <div class="name">{{$t('property.rihua')}}</div>
                                <div class="val">{{item.interest_rate}}%</div>
                            </div>
                        </div>
                        <div class="row2-item">
                            <!-- <div class="row2-item-style">
                                <div class="name">剩余资金</div>
                                <div class="val">{{syPrice}}</div>
                            </div> -->
                            <div class="row2-item-style" style="margin-top: 20px">
                                <div class="name">{{$t('property.organization')}}</div>
                                <div class="val">{{item.currency_name}}</div>
                            </div>
                        </div>
                        <div class="row2-right">
                            <div class="row2-right-top">
                                <input type="text" v-model="item.val" />
                                <div class="btn btn-yellow" @click="placeAnOrder(item)">{{$t('property.buy')}}</div>
                                <div class="btn" @click="close(item,index)">{{$t('property.cancel')}}</div>
                            </div>
                            <div class="row2-right-bottom" style="margin-top: 20px;color: #df6767">
                                <span>{{$t('property.tips')}}</span>
                            </div>
                        </div>
                    </div>
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
            navList: ['USDT','BTC','ETH'],
            current: 0,
            token: '',
            list: [],
            syPrice: '',
            footerH: 0,
            handleH: 0,
            tableHeaderH: 0
        }
    },
    created(){
        this.token = localStorage.getItem('token') || '';
        this.getSYPrice()
    },
    mounted(){
        this.get_list()
        this.$nextTick(() => {
            this.footerH = document.getElementById("fedui-footer").offsetHeight
            this.handleH = document.getElementById("handle-bg").offsetHeight
            this.tableHeaderH = this.$refs['tableHeader'].offsetHeight
        })
    },
    methods:{
        choose(index){
            this.current = index
        },
        
        get_list(){
            var i = layer.load();
            this.$http({
                url: '/api/lh/deposit/config',
                method: 'get',
                headers: {'Authorization':  this.token},
            }).then(res=>{
                console.log(res)
                layer.close(i);
                if (res.data.type=="ok"){
                    res.data.message.forEach(e => {
                        e.val = ''
                        e.current = 'row_1'
                        e.save_min = e.save_min ? (e.save_min - 0).toFixed(2) : ''
                        e.interest_rate = e.interest_rate ? (e.interest_rate - 0).toFixed(2) : ''
                    })
                    this.list = res.data.message
                }else{
                    layer.msg(res.statusText);
                }
            }).catch(error=>{
                console.log(error)
            })
        },

        getSYPrice(){
            if(this.token){
                this.$http({
                    url: '/api/wallet/detail',
                    method: 'post',
                    data: {
                        currency: "3",
                        type: "change"
                    },
                    headers: {'Authorization':  this.token},
                }).then(res=>{
                    console.log(res,'余额')
                    if (res.data.type=="ok"){
                        this.syPrice = (res.data.message.change_balance - 0).toFixed(2)
                    }else{
                        layer.msg(res.statusText);
                    }
                }).catch(error=>{
                    console.log(error)
                })
            }
        },

        buy(item,index){
            this.list.forEach(e => {e.current = 'row_1'})
            this.list[index].current = 'row_2'
        },
        close(item,index){
            this.list[index].current = 'row_1'
        },
        // 下单
        placeAnOrder(item){
            console.log(item)
            if(item.val){
                if(item.val-0 > this.syPrice - 0){
                    return
                }

                var i = layer.load();
                this.$http({
                    url: '/api/lh/deposit',
                    method: 'post',
                    data: {
                        config_id: item.id,
                        amount: item.val
                    },
                    headers: {'Authorization':  this.token},
                }).then(res=>{
                    console.log(res,'余额')
                    layer.close(i);
                    if (res.data.type=="ok"){
                        item.current = 'row_1'
                        item.val = ''
                        layer.msg(res.data.message);
                        this.getSYPrice()
                    }else{
                        layer.msg(res.data.message);
                    }
                }).catch(error=>{
                    console.log(error)
                })
            }
        }
    }
}
</script>

<style lang="scss" scoped>
    .product{
		background-color: #1b2c42;
        .nav-list{
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            padding: 30px 30px;
            border-bottom: 1px solid rgb(68, 68, 68);
            .nav-item{
                margin-right: 20px;
                padding: 6px 15px;
                border: 1px solid #fff;
                border-radius: 3px;
                cursor: pointer;
                background: #171c2b;
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
		}
		
        .table-header{
            width: 100%;
            padding: 25px 30px;
            box-sizing: border-box;
            display: flex;
            justify-content: space-between;
			background-color: #171c2b;
			border-bottom: 1px solid #9ca9b5;
            .header-item{
                width: 16.6%;
                text-align: center;
                color: gray;
				
            }
        }
        .table-main{
            width: 100%;
            min-height: 700px;
            .row-wrap{
                width: 100%;
            }
            .row_1{
                display: flex;
                width: 100%;
                padding: 20px 30px;
                box-sizing: border-box;
                align-items: center;
                background: #1a243b;
                .row-item{
                    width: 20%;
                    text-align: center;
                    .btn{
                        border: 1px solid gray;
                        width: 60%;
                        margin: auto;
                        padding: 5px 0;
                        cursor: pointer;
                        border-radius: 5px;
                        font-size: 14px;
                        color: #ffcf1b;
                    }
                }
                &:hover{
                    background: #171c2b;
                }
            }

            .row_2{
                display: flex;
                width: 100%;
                padding: 20px 105px;
                box-sizing: border-box;
                align-items: center;
                background: #181d25;
                justify-content: space-between;
                .name{
                    color: gray;
                }
                .val{
                    margin-top: 5px;
                }
                .row2-right-top{
                    display: flex;
                    align-items: center;
                    input{
                        padding: 5px;
                        background: rgba(0,0,0,.2);
                        color: #fff;
                    }
                    .btn{
                        margin-left: 20px;
                        cursor: pointer;
                        padding: 5px 20px;
                        border-radius: 3px;
                        font-size: 18px;
                    }
                    .btn-yellow{
                        color: #171c2b;
                        background: #ffcf1b;
                    }
                }
            }
        }
    }
</style>