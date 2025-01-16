<template>
    <div class="detail">
        <div class="title fColor1">
            <div class="inblock">
                <span>{{$t('treaddetail')}}</span>
                <span class="fColor2">({{$t('lastweek')}})</span>
                <span class="ft12 curPer ml10 baseColor" @click="newData">{{$t('reload')}}</span>
            </div>
            <div class="tab_title fr ft12 clear hide">
                <span v-for="(way,index) in wayList" :class="{'active': index == isChoosed}" @click="wayChoosed(index)">{{way}}</span>
            </div>
        </div>
        <div class="content">
            <ul class="list-title fColor2 ft12 clear">
                <li class="fl w14">{{$t('dealtime')}}</li>
                <!-- <li class="fl w8">资产代码</li> -->
                <li class="fl w12">{{$t('way')}}</li>
                <!-- <li class="fl w6">方向</li> -->
                <li class="fl w12">{{$t('dealed')}}</li>
                <li class="fl w12">{{$t('center.price')}}</li>
                <li class="fl w12">{{$t('torg')}}</li>
                <!-- <li class="fl w12">{{$t('dealno')}}</li> -->
                <li class="fl w12">{{$t('tnum')}}</li>
                <li class="fl w14">{{$t('ttotal')}}</li>
                <li class="fl w10 tr">{{$t('lever.rate')}}</li>
            </ul>
            <div class="container scroll" v-if="deList.length>0">
                <ul class="list-item fColor1 ft12">
                    <li v-for="item in deList" class="clear">
                        <span class="fl w14">{{item.create_time}}</span>
                        <!-- <span class="fl w8">12312313</span> -->
                        <span class="fl w12">{{$t('auto')}}</span>
                        <!-- <span class="fl w6" :class="{'green': item.methods == '买入'}">买入</span> -->
                        <span class="fl w12">{{$t('dep.yes')}}</span>
                        <span class="fl w12">{{item.price}}</span>
                        <span class="fl w12">imtoken</span>
                        <!-- <span class="fl w12">20180804</span> -->
                        <span class="fl w12">{{item.number}}</span>
                        <span class="fl w14">{{item.price * item.number}}</span>
                        <span class="fl w10 tr">0.00</span>
                    </li>
                </ul>
            </div>
            <div class="no_data tc" v-if="deList.length<=0">
                <img src="../assets/images/nodata.png" alt="">
                <p class="fColor2 ft18">{{$t('nodata')}}</p>   
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name:"detail",
    data (){
        return{
            address:'',
            isChoosed:2,
            new:false,
            wayList:[this.$t('center.inbuy'), this.$t('center.outsell'), this.$t('center.all')],
            deList:[]
        }
    },
    created(){
        this.address = localStorage.getItem('address') || '';
    },
    methods:{
        wayChoosed(index){
            this.isChoosed=index;
        },
        getData(){
            this.$http({
                url: '/api/' + 'transaction/deal',
                method:'post',
                data:{
                    address:this.address
                }
            }).then(res=>{
                res = res.data;
                this.deList=res.message.complete;
                this.new=true;
            }).catch(error=>{
                console.log(error)
            })
        },
        newData(){
            // this.getData();
            if(this.new){
                layer.msg("更新成功")
            }
        }
    },
    mounted(){
        // this.getData();
    }

    
}
</script>
<style scoped>
.title{height: 48px;line-height: 46px;padding: 0 40px 0 30px;background-color: #181b2a;}
.tab_title{display: inline-block;line-height: 46px;height: 46px;}
.tab_title span{cursor: pointer;}
.tab_title span:not(:last-child) {margin-right: 40px;}
.content{padding: 0 40px 0 30px;height: 330px;}
.list-title{line-height: 40px; border-bottom: 1px solid #303b4b;height: 40px;}
.no_data{padding: 50px 0;}
.container{height: 260px;overflow: auto;}
.list-item li{line-height: 30px;}
.list-item li span{display: inline-block;float: left;}
.list-item li span:nth-child(3){color:#cc4951;}
.list-item li:hover{background-color: #2b3648}
.list-item li span.green{color: #55a067}
</style>





// WEBPACK FOOTER //
// src/view/detail.vue