<template>
    <div class="box">
        <indexHeader></indexHeader>
        <div class="account" style="padding-top: 48px">
            <div class="topcontent ft20 ">
                <span class="white"><span class="baseColor">{{$t('account.taccount')}}></span> {{$t('account.mrecord')}}</span>
            </div>
            <div class="content">
               <div class="con_box">
                   <div class="account_title ttBk white">
                       最新
                   </div>
                   <div class="contentBK fColor1  pdlr20 pdtb20 ft12">
                       <div class="flex alcenter">
                           <span class="flex1">{{$t('time')}}</span>
                           <span class="flex1">{{$t('market.currency')}}</span>
                           <span class="flex1">{{$t('c2c.type')}}</span>
                           <span class="flex1">{{$t('number')}}</span>
                           <span class="flex1">{{$t('c2c.state')}}</span>
                           <span class="flex1">{{$t('do')}}</span>
                       </div>
                       <div class="mt10">
                            <div class="flex alcenter">
                                <span class="flex1">2018-01-29 12:23:45</span>
                                <span class="flex1">usdt</span>
                                <span class="flex1">usdt</span>
                                <span class="flex1">245</span>
                                <span class="flex1">{{$t("c2c.completed")}}</span>
                                <span class="flex1">{{$t("revoke")}}</span>
                            </div>
                            <div class="none color1 tc">
                                {{$t('nodata')}}
                            </div>
                       </div>
                       
                   </div>
               </div>
               <div class="con_box mt15">
                   <div class="account_title ttBk white flex">
                       <div class="active">{{$t('account.charging')}}{{$t('account.record')}}</div>
                       <div class="ml20">{{$t('account.withdraw')}}{{$t('account.record')}}</div>
                       <div class="ml20">{{$t('account.transfer')}}{{$t('account.record')}}</div>
                       <div class="ml20">{{$t('auth2.other')}}{{$t('account.record')}}</div>
                   </div>
                   <div class="contentBK fColor1  pdlr20 pdtb20 ft12">
                       <div class="flex alcenter">
                            <span class="flex1">{{$t('time')}}</span>
                           <span class="flex1">{{$t('market.currency')}}</span>
                           <span class="flex1">{{$t('c2c.type')}}</span>
                           <span class="flex1">{{$t('number')}}</span>
                           <span class="flex1">{{$t('c2c.state')}}</span>
                           <span class="flex1">{{$t('do')}}</span>
                       </div>
                       <div class="mt10">
                            <div class="flex alcenter">
                                <span class="flex1">2018-01-29 12:23:45</span>
                                <span class="flex1">usdt</span>
                                <span class="flex1">usdt</span>
                                <span class="flex1">245</span>
                                <span class="flex1">{{$t("c2c.completed")}}</span>
                                <span class="flex1">{{$t("revoke")}}</span>
                            </div>
                            <div class="none color1 tc">
                                {{$t('nodata')}}
                            </div>
                       </div>
                       
                   </div>
               </div>
            </div>
        </div>
    </div>
</template>
<script>
import indexHeader from '@/view/indexHeader'
export default {
    name:'finanrec',
    components:{indexHeader},
    data(){
        return {
            lang:'',
            token:'',
            changeList:[]
        }
    },
    created(){
        this.token= localStorage.getItem('token') || '';
    },
    methods:{
        getdata(){
            $.ajax({
                type: "POST",
                url: '/api/' + 'wallet/legal_log',
                data: {

                    // type:'change'
                },
                dataType: "json",
                async: true,
                beforeSend: function beforeSend(request) {
                    request.setRequestHeader("Authorization", that.token);
                },
                success: function(res){
                    if (res.type=="ok"){
                 
                    }else{
                       
                    }
                }
            })
        }
    },
    mounted(){
        var that = this;
        that.getdata();
    }
    
}
</script>

<style lang="scss" scoped>
    .box .account{
        width: 1200px;
        margin: 0 auto 82px;
        margin-top: 30px;
    }
    .topcontent{
        padding: 22px 30px;
        margin-bottom: 20px;
        background-color: #1a2330;
        border-radius: 5px;
    }
    .account_title{
        padding: 15px 20px;
    }
    .content{

    }
</style>





// WEBPACK FOOTER //
// src/view/accounts/finanrec.vue