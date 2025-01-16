<template>
  <div class="account-main wrap">
        <ul class="white log_ul">
    <div id="pay-opts">
        <div class="inp-item">
            <div>{{$t('set.tname')}}</div>
            <input type="text" :placeholder='$t("auth.truename")' v-model="name">
        </div>
        <div class="inp-item">
            <div>{{$t('legal.bankName')}}</div>
            <input type="text" :placeholder='$t("legaltrade.enterzhihang")' v-model="bankName">
        </div>
        <div class="inp-item">
            <div>{{$t('set.cnum')}}</div>
            <input type="number" :placeholder='$t("wAddress.enterCardNum")' v-model="bankNum">
        </div>
 <!--        <div class="inp-item">
            <div>{{$t('set.ailipay')}}</div>
            <input type="text" :placeholder='$t("set.palipay")' v-model="ali">
        </div>
        <div class="inp-item">
            <div>{{$t('c2c.wxName')}}</div>
            <input type="text" :placeholder='$t("set.pwenum")' v-model="weChatName">
        </div>
        <div class="inp-item">
            <div>{{$t('c2c.wenum')}}</div>
            <input type="text" :placeholder='$t("set.pwenum")' v-model="weChatAccount">
        </div> -->
        <div class="btn bgRed" @click="add">
           {{$t('legal.confirm')}}
        </div>
    </div>
  </ul>
</div>
</template>

<script>
export default {
  data() {
    return {
      token: "",
      name: "",
      bankName: "",
      bankNum: "",
      ali: "",
      weChatAccount: "",
      weChatName: ""
    };
  },
  created() {
    this.token = window.localStorage.getItem("token") || "";
    if(this.token == ''){
      this.$router.push('/components/login');
    }
    this.getInfo();
  },
  methods: {
    getInfo() {
      this.$http({
        url: "/api/user/cash_info",
        method: "post",
        headers: { 'Authorization': this.token }
      }).then(res => {
        if ((res.data.type == "ok")) {
            if(res.data.message != null){
                let data = res.data.message;
                this.name = data.real_name;
                this.bankName = data.bank_name;
                this.bankNum = data.bank_account;
                this.ali = data.alipay_account;
                this.weChatAccount = data.wechat_account;
                this.weChatName = data.wechat_nickname;

            }

        }
      });
    },
    add() {
        if(this.name == ''){
            layer.mag(this.$t('lay.truename'));return;
        }
      this.$http({
        url: "/api/user/cash_save",
        method: "post",
        data: {
          real_name: this.name,
          bank_name: this.bankName,
          bank_account: this.bankNum,
          alipay_account: this.ali,
          wechat_nickname: this.weChatName,
          wechat_account: this.weChatAccount
        },
        headers: { 'Authorization': this.token }
      }).then(res => {
          layer.msg(res.data.message)
      })
    }
  }
};
</script>

<style lang='scss'>
.account-main {
    padding-left: 34px;
    padding-right: 34px;
    padding-top: 34px;
}
#pay-opts {
  width: 600px;
  color: #c7cce6;
  > .inp-item {
    position: relative;
    margin-bottom: 20px;
    background: none;
    padding-left: 120px;
    height: 42px;
    > div {
      position: absolute;
      top: 0;
      left: 0;
      
      width: 120px;
      height: 40px;
      line-height: 40px;
      // text-align: center;
      
    }
    > input {
      display: block;
      padding: 0 20px;
      width: 100%;
      line-height: 40px;
      border: 1px solid #4e5b85;
      color: #c7cce6;
      background: none;
    }
  }
  .btn {
    margin: 30px 0 0 120px;
    width: 480px;
    line-height: 40px;
    text-align: center;
    background: #4e5b85;
    color: #fff;
    cursor: pointer;
  }
}
</style>



// WEBPACK FOOTER //
// src/view/payOpts.vue