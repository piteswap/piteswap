<template>
    <div class="entrust">
        <div class="title fColor1 topshadow">
            <div class="tab_title">
                <span>{{$t('lever.hisentrust')}}</span>
            </div>
            <!-- <div class="tab_title fr ft12">
                <span v-for="(way,index) in wayList" :class="{'active': index == isChoosed}" @click="wayChoose(index,way.url)">{{way.title}}</span>
            </div> -->
        </div>
        <div class="content">
            <ul class="list-title fColor2 ft12 clear">
                <li class="fl w20">{{$t('time')}}</li>
                <li class="fl w10">{{$t('center.pairs')}}</li>
                <li class="fl w8">{{$t('number')}}</li>
                <li class="fl w10">{{$t('price')}}</li>
                <li class="fl w8">{{$t('center.dealtotal')}}</li>
                <li class="fl w10">{{$t('center.tprice')}}</li>
                <li class="fl w10">{{$t('status')}}</li>
                <li class="fl w10">{{$t('rate')}}</li>
                <li class="fl w8 tr">{{$t('center.direction')}}</li>
            </ul>
            <div class="containers scroll" v-if="comList.length>0">
                <ul class="list-item fColor1 ft12">
                    <li v-for="item in comList" class="clear">
                        <span class="fl w20">{{item.time}}</span>
                        <span class="fl w10">{{item.currency_name}}/{{item.legal_name}}</span>
                        <span class="fl w8">{{item.number}}</span>
                        <span class="fl w10">{{item.price}}</span>
                        <span class="fl w8">{{(item.price * item.number) | numFilter}}</span>
                        <span class="fl w10">{{item.price}}</span>
                        <span class="fl w10">{{$t('dealed')}}</span>
                        <span class="fl w10">{{item.type=='in'? item.in_fee:item.out_fee}}</span>
                        <span class="fl w8 tr" :class="item.type=='out'?'redColor':''">{{item.type=='in'?$t('center.inbuy'):$t('center.outsell')}}</span>
                    </li>
                </ul>
                <div class="getmore tc fColor1 ft14 mt10 curPer pdb20" @click="getMore" v-if="!loading && comList.length>8">{{more}}</div>
                <div class="tc pdb20" v-if="loading">
                    <img src="@/assets/images/loading.gif" alt=""  class="lodw20">
                    <p class="ft12 baseColor">{{$t('loading')}}...</p>
                </div>
            </div>
            <div class="no_data tc" v-if="comList.length<=0 && !loading">
                <img src="@/assets/images/nodata.png" alt="">
                <p class="fColor2 ft18">{{$t('nodata')}}</p> 
            </div>
        </div>
    </div>
</template>
<script>

export default {
    name:"hisentrust",
    data (){
        return{
            address:'',
            isChoosed:0,
            isUrl:0,
            page:1,
            url:"transaction_in",
            type:'in',
            more:this.$t('more'),
            loading:false,
            wayList:[{title:this.$t('center.inbuy'),url:"transaction_in"},{title:this.$t('center.outsell'),url:"transaction_out"},{title:this.$t('center.all'),url:"transaction_all"}],
            comList:[]
        }
    },
    created(){
        this.token = localStorage.getItem('token') || '';
    },
    wacth(){
        eventBus.$on('buyTrade', function (data) {
            if(data){
                that.getData();
            }
        });
    },
    methods:{
        // 类型切换
        wayChoose(index,url){
            var that=this;
            that.comList='';
            that.page=1;
            that.url = url;
            if(url=='transaction_in'){
                that.type="in";
            }else{
                that.type="out";
            }
            that.more=that.$t('more');
            that.isChoosed=index;
            that.getData();
        },
        // 加载更多
        getMore(){
            this.page = ++this.page;
            this.getData();
        },
        getData(){
            var that = this;
            var page = that.page;
            that.loading = true;
            this.$http({
                url: '/api/' + 'transaction_complete',
                method:'post',
                data:{page:page},
                headers: {'Authorization':  that.token}
            }).then(res=>{
                // console.log(res)
                that.loading=false;
                if(res.data.type == 'ok'){
                        // console.log(res.data.message.list)
                        var list=res.data.message.list;
                        if(that.page==1){
                            that.comList=list;
                        }else{
                            if(list.length<=0){
                                    that.more=$t('td.nomore')+'...';
                                    return;
                                }else{
                                    that.comList=that.comList.concat(list)
                                }
                            }
                    }else{
                        // layer.msg(res.message);
                }
            }).catch(error=>{
                console.log(error)
        })
      },
    },
    mounted(){
        var that = this;
        eventBus.$on('buyTrade', function (data) {
            if(data){
                that.getData();
            }
        });
        that.getData();
    }
}
</script>
<style scoped>
.title{height: 48px;line-height: 46px;padding: 0 40px 0 30px;background-color: #181b2a;}
.tab_title{display: inline-block;line-height: 46px;height: 46px;}
.tab_title span{cursor: pointer;}
.tab_title span:not(:last-child) {margin-right: 40px;}
.content{padding: 0 40px 0 30px;height: 300px;}
.list-title{line-height: 40px; border-bottom: 1px solid #303b4b;height: 40px;}
.no_data{padding: 50px 0;}
.containers{height: 260px;overflow: auto;}
.list-item li{line-height: 30px;}
.list-item li span{display: inline-block;float: left;height: 30px;}
/* .list-item li span:nth-child(3){color:#cc4951;} */
.list-item li:hover{background-color: #2b3648}
.list-item li span.green{color: #55a067}
.pdb20{padding-bottom: 20px;}
.containers span{
    margin-left: 0;
}
</style>





// WEBPACK FOOTER //
// src/view/lever/lever_hisentrust.vue