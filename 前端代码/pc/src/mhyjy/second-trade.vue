<template>
  <div :class="skins=='nights'?'trade balck':'trade'">
    <div class="trade-currency flex">
      <div class="balance">
        <div class="flex">
          <i class="iconfont ft18 "></i>
          <p class="tc ft16" style="color:#2ab098; border-bottom: 1px solid #2ab098;">{{ $t('miscro.miscroAccount') }}</p>
          <div style="flex:1;"></div>
          <span @click="$router.push({name: 'transferLegal'})" class="fColor1 transbtn curPer">{{ $t('account.transfer') }}</span>
        </div>
        <ul class="fColor1">
          <li v-for="item in walletList" :key="item.id" v-show="item.is_micro == 1 && item.currency_name  == 'USDT'">
            {{ item.micro_balance }} {{ item.currency_name }}
          </li>
        </ul>
      </div>

    </div>
    <div class="contents" style="padding-top: 0;">
      <div class="">
        <div class="flex trade-bg">
          <i class="iconfont icon-moshi"></i>
          <p class="fColor1">{{ $t('miscro.mode') }}</p>
        </div>
        <div class="curency-list flex flex-wrap">
          <span
              class="mb10 fColor1"
              :class="[{'active':currency_id == item.id}]"
              v-for="item in datas"
              :key="item.id"
              @click="currencyTab(item)"
          >{{ item.name }}</span>
        </div>
      </div>
      
      <div class="share mt10">
        <div class="flex trade-bg">
          <i class="iconfont icon-shuliang"></i>
          <p class="fColor1">{{ $t('miscro.num') }}</p>
        </div>
        <div class="share-rights">
          <div class="flex flex-wrap">
            <p v-for="(item,index) in numList"
               :key="index"
               :class="[{'active':inputValue == $utils.filterDecimals(item.number,0)}]"
               @click="selectNum(item.number)"
            >{{ $utils.filterDecimals(item.number) }}</p>
          </div>
          <input type="text" :placeholder="$t('miscro.openNum')" v-model="inputValue">
        </div>
      </div>
      <div class="mult mt10">
        <div class="flex trade-bg">
          <i class="iconfont mr10 icon-shijian"></i>
          <p class="fColor1">{{ $t('lever.openTime') }}</p>
        </div>

        <div class="flex flex-wrap mult-contents">
          <p
              v-for="(item,index) in timeList"
              :key="index"
              :class="[{'active':value4 == item.seconds}]"
              @click="selectTime(item.seconds,item.profit_ratio)"
          >{{ item.seconds | stToStr}}</p>
        </div>
      </div>

      <div class="lever-total mt20 fColor1" style="font-size: 14px;">
        <p class="flex between mt10">
          <span>{{ $t('miscro.balance') }}</span>
          <span>{{ balance || '0.00' }}{{ tradeName }}</span>
        </p>
        <p class="flex between mt10">
          <span>{{ $t('miscro.rate') }}</span>
          <span>{{ profitRatio || '0.00' }}%</span>
        </p>
      </div>
    </div>
    <div class="flex">
      <div class="sell_btn greenBg" @click="transferSumbit(1)">{{ $t('miscro.up') }}</div>
      <div class="sell_btn redBg" @click="transferSumbit(2)">{{ $t('miscro.down') }}</div>
    </div>

    <!-- 买涨、买跌弹窗 -->
    <el-dialog title :visible.sync="modalShow" width="480px" top="200px" center>
      <div class="transfer-contents">
        <!-- <h3>{{buyType==1?$t('miscro.up'):$t('miscro.down')}} {{tradeName}}</h3> -->
        <h3>{{ buyType == 1 ? $t('miscro.up') : $t('miscro.down') }} {{ currencyName }}</h3>
        <div class="transfer-list mt10">
          <div class="loss-madal-contents flex between">
            <div>
              <span>{{ $t('td.num') }}</span>
              <span>{{ inputValue || '0' | numFilters(0) }} {{ tradeName }}</span>
            </div>
            <div>
              <span>{{ $t('td.time') }}</span>
              <span>{{ value4 || '0' | numFilters(0) }}S</span>
            </div>
            <div>
              <span>{{ $t('miscro.rate') }}</span>
              <span>{{ profitRatio || '0' | numFilters(0) }}%</span>
            </div>
          </div>
        </div>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="comfirm()">{{ $t('cuy.confirm') }}</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>

export default {
  name: "trade",
  filters: {
    numFilters: function (value) {
      if (!value) return ''
      value = value.toString()
      return value.slice(0) + ' '
    }
  },
  props: {
    leverTradeId: {
      type: Number,
      required: true
    },
    currencyName: {
      type: String,
      required: true
    },
    filters: {
      numFilters: function (value) {
        if (!value) return ''
        value = value.toString()
        return value.slice(0) + ' '
      }
    }
  },
  data() {
    return {
      selectedStatus: 1,
      multNum: "",
      shareNum: "",
      buyType: 1,
      controlInput: "",
      obj: "",
      spread: localStorage.getItem("spread") || 0,
      token: localStorage.getItem("token"),
      dialogVisible: false,
      marketTotal: "",
      bonds: "",
      serviceCharge: "",
      value4: "",
      numList: [],
      timeList: [],
      currency_id: "3",
      balance: "",
      inputValue: "",
      datas: {},
      profitRatio: "",
      seconds: "",
      tradeName: "",
      modalShow: false,
      walletList: [],
      skins: localStorage.getItem("skin") || "days",
      bmbBalance: "",
      insurancType: [],
      userInsurancId: ""
    };
  },
  created() {
  },
  mounted() {
    var that = this;
    that.getDeal();
    that.init();

  },
  watch: {
    leverTradeId: {
      immediate: true, // 这句重要
      handler(val) {
        this.obj = val;
        console.log('levertradeid', this.obj)

      },
      deep: true
    }
  },
  computed: {
    switchStatus: function () {
      return this.obj; // 直接监听props里的status状态
    }
  },
  methods: {
    init() {
      var that = this;
      this.$http({
        url: "/api/wallet/list",
        method: "post",
        data: {},
        headers: {Authorization: that.token}
      })
          .then(res => {
            if (res.data.type == "ok") {
              that.walletList = res.data.message.micro_wallet.balance;
            } else {
              return;
            }
          })
          .catch(error => {
            console.log(error);
          });
    },

    getDeal() {
      var that = this;
      this.$http({
        url: "/api/microtrade/payable_currencies",
        method: "get",
        data: {},
        headers: {Authorization: that.token}
      }).then(res => {
        console.log(res,'res.data.message')
        if (res.data.type == "ok") {
          that.datas = res.data.message.filter(e => e.name == "USDT")
          if (res.data.message.length > 0) {
            for (var i = 0; i < res.data.message.length; i++) {
              if (res.data.message[i].name == "AITB") {
                that.bmbBalance =
                    res.data.message[i].user_wallet.insurance_balance;

                that.insurancType = res.data.message[i].insurance_types;
                if (res.data.message[i].user_insurance) {
                  that.userInsurancId =
                      res.data.message[i].user_insurance.insurance_type_id;
                }
              }
            }
            that.currency_id = res.data.message[0].id;
            that.numList = res.data.message[0].micro_numbers;
            if (res.data.message[0].user_wallet) {
              that.balance =
                  res.data.message[0].user_wallet.micro_with_insurance;
            }

            that.serviceCharge = res.data.message[0].micro_trade_fee;

            if (that.numList[0] !== undefined)
              that.inputValue = that.$utils.filterDecimals(that.numList[0].number, 0);
            that.tradeName = res.data.message[0].name;
          }
        }

        console.log('datas', that.datas);
        let opt = that.datas.find(x => {
          return x.id == 3
        });
        setTimeout(that.currencyTab(opt), 50)
      });

      this.$http({
        url: "/api/microtrade/seconds",
        method: "get",
        data: {},
        headers: {Authorization: that.token}
      }).then(res => {
        if (res.data.type == "ok") {
          that.timeList = res.data.message;
          that.profitRatio = res.data.message[0].profit_ratio;
          that.value4 = res.data.message[0].seconds;
        }
      });
    },
    
    // 选择是出售还是购买
    selectBuy() {
      var that = this;
      that.buyType = that.buyType == 1 ? "2" : "1";
      that.multNum = "";
      that.shareNum = "";
      that.marketTotal = 0.0;
      that.bonds = 0.0;
      that.serviceCharge = 0.0;
    },
    // 选择交易模式
    currencyTab(options) {
      // that.currency_id = options.id;

      var that = this;
      console.log(options);
      that.currency_id = options.id;
      that.numList = options.micro_numbers;
      if (options.user_wallet) {
        that.balance = options.user_wallet.micro_with_insurance;
      }
      that.tradeName = options.name;
      that.serviceCharge = options.micro_trade_fee;
      that.inputValue = that.$utils.filterDecimals(that.numList[0].number, 0);
    },

    // 选择开仓 数量
    selectNum(num) {
      var that = this;
      that.inputValue = that.$utils.filterDecimals(num, 0);
    },

    // 选择开仓时间
    selectTime(num, rate) {
      var that = this;
      that.value4 = num;
      that.profitRatio = rate;
    },

    // 下单
    transferSumbit(types) {
      var that = this;
      that.buyType = types;
      if (!that.inputValue) {
        layer.msg(that.$t("miscro.openNum"));
        return false;
      }
      that.modalShow = true;
    },
    // 下单
    comfirm() {
      var that = this;
      this.$http({
        url: "/api/microtrade/submit",
        method: "post",
        data: {
          match_id: that.obj,
          currency_id: that.currency_id,
          type: that.buyType,
          seconds: that.value4,
          number: that.inputValue
        },
        headers: {Authorization: that.token}
      }).then(res => {
        that.modalShow = false;
        // layer.msg(res.data.message);
        if (res.data.type == "ok") {
          layer.msg(that.$t("miscro.success"));
          that
              .$http({
                url: "/api/microtrade/payable_currencies",
                method: "get",
                data: {},
                headers: {Authorization: that.token}
              })
              .then(res => {
                if (res.data.type == "ok") {
                  if (res.data.message.length > 0) {
                    for (var i = 0; i < res.data.message.length; i++) {
                      if (res.data.message[i].id == that.currency_id) {
                        that.balance =
                            res.data.message[i].user_wallet.micro_with_insurance;
                      }
                    }
                  }
                }
              });
          localStorage.setItem("orderStatus", 1);
          setTimeout(function () {
            localStorage.setItem("orderStatus", "");
          }, 30);
        } else {
          layer.msg(res.data.message);
        }
      });
    },
	
	
	
  },
  computed: {},
  filters:{
	  stToStr:function(seconds){
	  	let desc = ''
	  	if(seconds>=3600){
	  		desc = parseInt(seconds/3600)+'H';
	  	}else if(seconds>=60){
	  		desc = parseInt(seconds/60)+'M';
	  	}else{
	  		desc = seconds+'S'
	  	}
	  	return desc
	  },
  }
};
</script>

<style lang="scss" scoped>
.tabs {
  background-color: #2f3d45;
  line-height: 32px;
  border-bottom: 1px solid #2f3d45;
}


.transbtn:hover{
  color: #2ab098;
  border-bottom: 1px solid #2ab098;
}

.tabs span {
  display: block;
  width: 50%;
  text-align: center;
  color: #babbbb;
  font-size: 12px;
}

.tabs .active {
  background-color: #1e2b34;
}

.contents {
  padding: 7px 0;
  padding-bottom: 15px;
  /* background-color: #fff; */
  margin-top: 10px;
  .iconfont{
    margin-right: 10px;
    color:#00a4d8;
  }
}

.iconfont{
  margin-right: 10px;
  color:#00a4d8;
}

.mt5 {
  margin-top: 10px;
}

.trade > > > .el-select .el-input.is-focus .el-input__inner {
  border-color: #304049;
}

.lefts {
  width: 80px;
  line-height: 30px;
  color: #000000;
}

.curency-list {
  .mb10{
    flex:1;
  }
  .mb10:last-child{
    margin-right: 0;
  }
  span {
    display: inline-block;
    width: 100px;
    line-height: 30px;
    height: 30px;
    border: 1px solid #304049;
    border-radius: 4px;
    margin-right: 12px;
    color: #fff;
    text-align: center;
    cursor: pointer;
    background-color: #fff;
  }
}

.contents > > > .el-select {
  background-color: #1e2b34;
}

.contents > > > .el-input__inner {
  background-color: #1e2b34;
  border: 1px solid #304049;
  height: 30px;
  line-height: 30px;
  font-size: 12px;
}

.contents > > > .el-input__icon {
  line-height: 30px;
}

.contents > > > .popper__arrow {
  left: 50% !important;
}

.rights {
  width: calc(100% - 80px);
  line-height: 30px;
  height: 30px;
  border: 1px solid #304049;
  position: relative;
  background-color: #1e2b34;
}

.rights .iconfont {
  position: absolute;
  right: 10px;
  top: 0;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0);
}

.rights input {
  background-color: rgba(0, 0, 0, 0);
  padding: 0 15px;
  color: #fff;
}

.shareNumber {
  margin-top: 10px;
  width: 100%;
}

input {
  padding: 0 15px;
  color: #fff;
}

.share-rights {
  position: relative;
  /* background-color: #1e2b34; */
}

.share-rights input {
  line-height: 40px;
  height: 40px;
  width: 100%;
  /* background-color: #1e2b34; */
  background-color: transparent;
  border: 1px solid #304049;
  padding: 0 15px;
  color: #c7cce6;
  font-size: 12px;
}

.share-rights p {
  line-height: 30px;
  border: 1px solid #304049;
  width: calc(24.73% - 8px);
  text-align: center;
  border-radius: 4px;
  margin-right: 12px;
  font-size: 12px;
  color: #fff;
  cursor: pointer;
  margin-bottom: 10px;
}

.share-rights p:nth-child(4n) {
  margin-right: 0;
}

.mults {
  border: none;
}

/* .mult-contents {
  width: calc(100% - 80px);
} */
.mult-contents p {
  line-height: 30px;
  border: 1px solid #304049;
  width: calc(24.73% - 8px);
  text-align: center;
  border-radius: 4px;
  margin-right: 12px;
  margin-bottom: 10px;
  color: #fff;
  cursor: pointer;
  font-size: 12px;
  background-color: transparent;
}

.mult-contents p:nth-child(4n) {
  margin-right: 0;
}

.sell_btn {
  line-height: 40px;
  text-align: center;
  height: 40px;
  color: #fff;
  margin: 0!important;
  cursor: pointer;
  width: calc(100% - 20px);
  border-radius: 10px!important;
}
.sell_btn:first-child{
  margin-right: 5px!important;
}
.sell_btn:last-child{
  margin-left: 5px!important;
}

.greenColor {
  border-color: #00c087;
}

.redColor {
  border-color: #e3046f;
}

.transfer-contents h3 {
  text-align: center;
  color: #f0b90b;
  font-size: 18px;
}

.transfer-list p {
  line-height: 30px;
  color: #606266;
  line-height: 40px;
}

.trade > > > .el-button--primary {
  background-color: #f0b90b;
  width: 140px;
  border: none;
}

.trade > > > .el-dialog--center .el-dialog__body {
  padding: 25px 25px 10px;
}

.active {
  background: url(../../static/imgs/selects.png) no-repeat right bottom;
  background-size: 35px 30px;
  border: 1px solid #5e94ea;
}

.trade {
  margin-top: 10px;
  padding: 0 20px;
}

.trade-currency {
  color: #fff;
  padding: 10px 0px;
  padding-bottom: 0;
}

.trade-currency p {
  //margin-left: 5px;
}

.trade-currency li {
  text-align: center;
  margin-top: 10px;
  font-size: 14px;
}

.trade-bg {
  color: #fff;
  line-height: 40px;
  padding: 0;
  font-size: 14px;
  margin-bottom: 10px;
  /*color: #171c2b;*/
}

.trade-bg img {
  margin-top: 15px;
  margin-right: 5px;
  width: 20px;
  height: 20px;
}

.balck .trade-currency {
  background-color: #1e2b34;
}

.balck .trade-bg {
  background-color: #1e2b34;
}

.balck .curency-list span {
  background-color: #181b2a;
  color: #fff;
}

.balck .share-rights p {
  background-color: #181b2a;
  color: #fff;
}

.balck .mult-contents p {
  background-color: #181b2a;
  color: #fff;
}

.balck .share-rights input {
  background-color: #181b2a;
  color: #fff;
}

.balance {
  width: 100%;
  /* border-right: 1px solid #f1f1f1; */
  ul{
    margin-top:20px;
  }
}

.insuranc {
  width: 50%;
}

.insuranc-list span {
  display: inline-block;
  padding: 5px;
  border: 1px solid #999;
  border-radius: 4px;
  color: #999;
}

.insuranc-list span:first-child {
  margin-right: 15px;
}

.insuranc-list .active {
  color: #f0b90b;
  border: 1px solid #f0b90b;
  background: rgba(0, 0, 0, 0)
}

.loss-madal-contents span {
  display: block;
  text-align: center;
  margin-top: 5px;
}

.mb10 {
  margin-bottom: 10px;
}

.flex {
  display: flex;
  -webkit-display: flex;
  -moz-display: flex;
  -ms-display: flex;
  -o-display: flex;
}

.sell_btn {
  line-height: 40px;
  text-align: center;
  height: 40px;
  color: #fff;
  margin: 10px 15px;
  cursor: pointer;
  width: calc(100% - 20px);
  border-radius: 40px;
}

.greenBg {
  background-color: #35b65a !important;
  border-color: #35b65a !important;
}

.redBg {
  background-color: #ff494a !important;
  border-color:#ff494a !important;
}

.whiteBg .curency-list span, .whiteBg .mult-content p, .whiteBg .share-rights p {
  color: #fff;
  border: 1px solid #e9e9e9;
}

.whiteBg .curency-list span {
  color: #fff;
}

.curency-list span {
  display: inline-block;
  width: 100px;
  line-height: 30px;
  height: 30px;
  border: 1px solid #304049;
  border-radius: 4px;
  margin-right: 12px;
  /*color: #fff;*/
  background: transparent;
  font-size: 12px;
  text-align: center;
  cursor: pointer;
  color: #fff;
}

.mb10 {
  margin-bottom: 10px;
}

.active {
  /*background: url(../../static/img/selects.c92cc6d.png) no-repeat 100% 100%;*/
  background-size: 35px 30px;
  border: 1px solid #69530d !important;
  background: none;
}
</style>


