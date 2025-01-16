<template>
  <div class>
    <div class="header fColor1">
      <p class="fl">
        {{ $t('account.totalassets') }}：
        <span class="asset_num">{{ totle | toFixeds }}</span>
        <span class="asset_name"> USDT</span>
      </p>
      <p class="fr right_text">
        <!-- <span class="record" @click="record">财务记录</span> -->
        <span class="address hide" @click="withdraw_address">{{ $t('account.upaddress') }}</span>
      </p>
    </div>
    <div class="content fColor1 ft12">
      <div class="content_top flex alcenter fColor2">
        <p class="flex1 tc">
          {{ $t('market.currency') }}
          <i></i>
        </p>
        <p class="flex1 tc">{{ $t('center.available') }}</p>
        <p class="flex1 tc">{{ $t('account.freezes') }}</p>
        <!-- <p class="flex1 tc">BTC估值<i></i></p> -->
        <!-- <p class="flex1 tc">锁仓</p> -->
        <!-- <p class="flex1 tc">{{ $t('account.conversion') }}(CNY)</p> -->
        <p class="flex1 tc">{{ $t('do') }}</p>
      </div>

      <ul class="content_ul">
        <li
            v-for="(item,index) in asset_list"
            v-if="item.currency_name == 'USDT'"
            :key="index"
        >
          <div class="content_li flex alcenter between">
            <p class="flex1 tc">{{ item.currency_name }}</p>
            <p class="flex1 tc">{{ item.micro_balance || '0.00' | toFixeds }}</p>
            <p class="flex1 tc">{{ item.lock_micro_balance || '0.00' | toFixeds }}</p>
            <!-- <p class="flex1 tc">{{ item.cny_price * item.micro_balance || '0.00' | toFixeds }}</p> -->
            <!-- <p class="flex1 tc">{{item.valuation}}</p> -->
            <!-- <p class="flex1 tc">{{item.lock_position}}</p> -->
            <p class="flex1 tc operation">
              <span @click="transIn(index)">{{ $t('transin') }}</span>
              <span @click="transOut(index)">{{ $t('transout') }}</span>
              <span @click="rec(index,item.currency)">{{$t('account.record')}}</span>
            </p>
          </div>
          <!--充币区-->
          <div class="hide_div" v-if="index == active">
            <p class="fColor2 ft12">{{ $t('account.cgaddress') }}</p>
            <p class="mt50 mb50">
              <span class="ft18 fColor1 excharge_address" :class="{'bg':flags}">{{ excharge_address }}</span>
              <span id="copy" @click="copy" class="copy ft14">{{ $t('account.copy') }}</span>
              <span class="ewm_wrap">
                <span class="ewm ft14" @click="show_ewm">{{ $t('account.code') }}</span>
                <div class="ewm_img" id="code" :class="{'hide':isHide}"></div>
                <!-- <img class="ewm_img" :class="{'hide':isHide}" src="../../assets/images/ewm.jpg" /> -->
              </span>
            </p>
            <p class="ft12 fColor2 mb50">
              {{ $t('account.view') }}
              <span class="excharge_record">{{ $t('account.charrecord') }}</span>{{ $t('account.fstaus') }}
            </p>
            <p class="ft12 fColor2 mb15">{{ $t('account.notice') }}</p>
            <ul class="tips_ul ft12 fColor2" style="list-style:disc inside">
              <li class="tips_li" style="list-style:disc inside">
                {{ $t('account.a1') }}{{ item.currency_name }}{{ $t('account.a2') }}
              </li>
              <li v-if="item.currency_type=='eth'" class="tips_li" style="list-style:disc inside">
                {{ $t('account.a4') }}
              </li>
              <li v-else-if="item.currency_type=='btc'" class="tips_li" style="list-style:disc inside">
                {{ $t('account.a9') }}
              </li>
              <li v-else-if="item.currency_type=='erc20'" class="tips_li" style="list-style:disc inside">
                {{ $t('account.a4') }}
              </li>
              <li v-else-if="item.currency_type=='omni'" class="tips_li" style="list-style:disc inside">
                USDT{{ $t('account.a3') }}
              </li>
            </ul>
          </div>
          <!--提币区-->
          <div class="hide_div" v-if="index == active01">
            <p class="fColor2 ft12 mb15">{{ $t('account.chaddress') }}</p>
            <input :placeholder="tibi_msg" class="address_inp fColor1 mb30" type="text" v-model="address">
            <p class="fColor2 ft12 mb15 flex between alcenter">
              <span>{{ $t('number') }}</span>
              <span>
                {{ $t('center.available') }}：
                <span class="use_num">{{ balance || '0.00' | toFixeds }}</span>
                {{ coinname }}
                <span>
                  <!-- 限额：
                  <span>1500.00</span>-->
                  <!-- <span class="advance">提升额度</span> -->
                </span>
              </span>
            </p>
            <label class="num_lab flex between mb30">
              <input style="color: white" class="fColor1" type="text" :placeholder="min_number" v-model="number">
              <span>{{ coinname }}</span>
            </label>
            <div class="flex mb50">
              <div class="left_inp_wrap flex1">
                <p class="fColor2 ft12 mb15">
                  <span>{{ $t('rate') }}</span>
                  <span>{{ ratenum }}%</span>
                </p>
                <label class="range_lab flex alcenter between">
                  <!-- <input class="fColor1" type="text" v-model="rate"> -->
                  <span>{{ number * ratenum / 100 | toFixeds }}</span>
                  <span>{{ coinname }}</span>
                </label>
              </div>
              <div class="right_inp_wrap flex1">
                <p class="mb15">
                  <span class="fColor2 ft12">{{ $t('account.havenum') }}</span>
                </p>
                <label class="get_lab flex alcenter between">
                  <span>{{ number - number * ratenum / 100 | toFixeds }}</span>
                  <!-- <input class="fColor1" disabled v-model="reachnum" type="number"> -->
                  <span>{{ coinname }}</span>
                </label>
              </div>
            </div>
            <div class="flex">
              <div class="flex2">
                <p class="ft12 fColor2 mb15">{{ $t('account.notice') }}</p>
                <ul class="tips_ul ft12 fColor2" style="list-style:disc inside">
                  <li class="tips_li" style="list-style:disc inside">
                    {{ $t('account.minnum') }}：{{ min_number_txt }}{{ coinname }}。{{ $t('account.oncemaxnum') }}：{{ max_number }}{{ coinname }}。{{ $t('account.daynum') }}{{ day_limit }}{{ coinname }}
                  </li>
                  <li class="tips_li" style="list-style:disc inside">{{ $t('account.call') }}</li>
                </ul>
              </div>
              <div class="flex1 tc">
                <button class="withdraw_btn" @click="mention">{{ $t('account.withdraw') }}</button>
              </div>
            </div>
          </div>
          <!--记录区-->
          <div class="hide_div rec-box" v-if="index == active02">
            <div class="rec-con">
              <div class="rec-title">
                <span>{{ $t('number') }}</span>
                <span>{{ $t('account.record') }}</span>
                <span>{{ $t('time') }}</span>
              </div>
              <ul class="rec-list">
                <li v-for="(reItem,reIndex) in recData" :key="reIndex">
                  <span>{{ reItem.value || '0.00' | toFixeds }}</span>
                  <span>{{ getInfo(reItem) }}</span>
                  <span>{{ reItem.created_time }}</span>
                </li>
              </ul>
              <p class="more" @click="moreData()">{{ more }}</p>
            </div>
          </div>
        </li>
      </ul>
      <!-- <div class="tc ft16 fColor1 mt50" v-show="asset_list.length<=0"></div> -->
    </div>
    <!-- 划转弹窗 -->
    <div class="transfer-modal flex" v-show="transferData.modalShow">
      <div class="transfer-mask">
        <div class="transfer-header">
          <h3>{{ $t('account.transfer') }}</h3>
          <p @click="closes()">X</p>
        </div>
        <div class="transfer-content">
          <div>
            <p>{{ $t('c2c.currency') }}</p>
            <p>{{ transferData.transferName }}</p>
            <p>{{ $t('center.available') }} {{ $t('cfc.balance') }}</p>
            <p>{{ transferData.transferBalance }}</p>
          </div>
          <div>
            <p>从</p>
            <select v-model="transferData.start">
              <option v-for="item in balanceList" :value="item">{{ item }}</option>
            </select>
          </div>
          <div>
            <p>{{ $t('to') }}</p>
            <select v-model="transferData.end">
              <option v-for="item in balanceList" :value="item">{{ item }}</option>
            </select>
          </div>
          <div>
            <p>{{ $t('count.huanum') }}</p>
            <input type="text" placeholder="$t('lay.huanum')">
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import indexHeader from "@/view/indexHeader";
import left from "@/view/left";
import "@/lib/clipboard.min.js";
import "@/lib/jquery.qrcode.min.js";

export default {
  name: "finance",
  filters: {
    toFixeds: function (value) {
      value = Number(value);
      return value.toFixed(8);
    }
  },
  data() {
    return {
      totle: "",
      recData: [],
      token: "",
      flags: false,
      flag: false,
      isHide: true,
      active: "a",
      active01: "a",
      tibi_msg: this.$t("account.tibi"),
      active02: "a",
      addr: "",
      url: "",
      excharge_address: "",
      address: "",
      number: "",
      rate: "",
      coinname: "",
      balance: "",
      ratenum: "",
      reachnum: "",
      min_number: "",
      min_number_txt: "",
      currency: "",
      asset_list: [],
      tip_list: [
        this.$t('account.a1') + "USDT" + this.$t('account.a2'),
        "USDT" + this.$t('account.a3')
      ],
      tip_list01: [
        this.$t('account.a1') + "USDT" + this.$t('account.a2'),
        "USDT" + this.$t('account.a3')
      ],
      page: 1,
      more: this.$t("more"),
      balanceList: [this.$t('account.laccount'), this.$t('usercenter.lever')],
      transferData: {
        modalShow: false,
        transferName: "",
        transferBalance: "",
        start: "",
        end: ""
      },
      status: '',
      changeBalance:[]
    };
  },
  components: {
    indexHeader,
    left
  },
  computed: {
    lang () {
      return localStorage.getItem("lang")
    }
  },
  methods: {
    getInfo (data) {
      switch (this.lang) {
        case 'en':
          return data.type_info_e
        case 'jp':
          return data.type_info_j
        case 'kr':
          break;
        case 'zh':
          return data.info
        case 'hk':
          return data.type_info_m
        default:
          return 'check customer service for details'
      }
    },
    transIn(index) {
      console.log(index,'index',this.changeBalance)
      let coin = this.changeBalance[2]
      let avi = this.$t('center.available')
      let that = this;
      console.log(this.changeBalance,coin,avi)
      this.$prompt(`${coin.currency_name} ${avi} ${coin.change_balance} `, this.$t('assets.transfer_in'), {
        confirmButtonText: this.$t('assets.transfer_in'),
        cancelButtonText: this.$t('property.cancel'),
        inputPlaceholder: this.$t('account.huanum'),
        inputType: 'number',
        closeOnClickModal: false
      }).then(({value}) => {
        that.$http({
          url: "/api/" + "wallet/change",
          method: "post",
          data: {
            number: value,
            from_field: 'change',
            to_field: 'micro',
            currency_id: coin.currency
          },
          headers: {Authorization: localStorage.getItem('token')}
        }).then(res => {
          if (res.data.type == "ok") {
            that.getdata();
            this.$message({
              showClose: true,
              message: this.$t('assets.transfer_complete'),
              type: 'success'
            });
          } else {

          }
        }).catch(error => {
          console.log(error);
        });
      }).catch(() => {
      });
    },
    transOut(index) {
      // console.log(this.asset_list[index]);
      let that = this;
      let coin = this.asset_list[index];
      let avi = this.$t('center.available')
      this.$prompt(`${coin.currency_name} ${avi} ${coin.micro_balance} `, this.$t('assets.transfer_out'), {
        confirmButtonText: this.$t('assets.transfer_out'),
        cancelButtonText: this.$t('property.cancel'),
        inputPlaceholder: this.$t('account.huanum'),
        inputType: 'number',
        closeOnClickModal: false
      }).then(({value}) => {
        that.$http({
          url: "/api/" + "wallet/change",
          method: "post",
          data: {
            number: value,
            from_field: 'micro',
            to_field: 'change',
            currency_id: coin.currency
          },
          headers: {Authorization: localStorage.getItem('token')}
        }).then(res => {
          if (res.data.type == "ok") {
            that.getdata();
            this.$message({
              showClose: true,
              message: this.$t('assets.transfer_complete'),
              type: 'success'
            });
          } else {

          }
        }).catch(error => {
          console.log(error);
        });
      }).catch(() => {
      });
    },
    goRecord() {
      this.$router.push({name: "coinRecord"});
    },
    init() {
      var that = this;
      var clipboard = new Clipboard(".copy");
      clipboard.on("success", function (e) {
        layer.alert(that.$t("lay.copys"));
      });
      clipboard.on("error", function (e) {
        alert(that.$t("lay.fcopy"));
      });
    },
    //充币
    excharge(index, currency) {
      if (this.status == 1) {
        this.currency = currency;
        if (this.flag) {
          this.flag = false;
          this.active = "a";
          this.active01 = "a";
          this.active02 = "a";
        } else {
          this.flag = true;
          this.active = index;
          this.active01 = "a";
          this.active02 = "a";
        }
        this.sendData(currency);
      } else {
        layer.alert(this.$t('notopen'))
      }

    },
    sendData(currency) {
      var that = this;
      this.$http({
        url: "/api/" + "wallet/get_in_address",
        method: "post",
        data: {currency: currency},
        headers: {Authorization: that.token}
      })
          .then(res => {
            if (res.data.type == "ok") {
              that.excharge_address = res.data.message;
              // 生成二维码
              $("#code").qrcode({
                width: 100, //宽度
                height: 100, //高度
                text: res.data.message
              });
            } else {

            }
          })
          .catch(error => {
            console.log(error);
          });
    },
    //提币
    withdraw(index, currency) {
      if (this.status == 1) {
        this.currency = currency;
        if (this.flag) {
          this.flag = false;
          this.active = "a";
          this.active01 = "a";
          this.active02 = "a";
        } else {
          this.flag = true;
          this.active01 = index;
          this.active = "a";
          this.active02 = "a";
        }
        this.getNum(currency);
      } else {
        layer.alert(this.$t('notopen'));
      }

    },
    //记录
    rec(index, currency) {
      this.currency = currency;
      this.recData = [];
      if (this.flag) {
        this.flag = false;
        this.active = "a";
        this.active01 = "a";
        this.active02 = "a";
      } else {
        this.flag = true;
        this.active02 = index;
        this.active = "a";
        this.active01 = "a";
        this.$http({
          url: "/api/wallet/legal_log",
          method: "post",
          data: {type: 4, currency: currency, page: 1},
          headers: {Authorization: this.token}
        }).then(res => {
          if (res.data.type == "ok") {
            this.recData = res.data.message.list;
          }
        });
      }
    },
    exchange() {
    },
    //复制
    copy() {
      var that = this;
      var clipboard = new Clipboard(".copy", {
        text: function () {
          return that.excharge_address;
        }
      });
      clipboard.on("success", function (e) {
        that.flags = true;
        layer.msg(that.$t("lay.copys"));
      });
      clipboard.on("error", function (e) {
        that.flags = false;
        layer.msg(that.$t("lay.fcopy"));
      });
    },
    record() {
      this.$router.push({name: "finanrec"});
    },
    withdraw_address() {
      this.$router.push({name: "withdraw_address"});
    },
    show_ewm() {
      if (this.isHide) {
        this.isHide = false;
      } else {
        this.isHide = true;
      }
    },

    getdata() {
      var that = this;
      this.$http({
        url: "/api/" + "wallet/list",
        method: "post",
        data: {},
        headers: {Authorization: that.token}
      })
          .then(res => {
            if (res.data.type == "ok") {
              console.log(res.data.message,'message');
              that.asset_list = res.data.message.micro_wallet.balance;
              that.changeBalance = res.data.message.change_wallet.balance;
              that.totle = res.data.message.micro_wallet.usdt_totle;
            } else {
              return;
            }
          })
          .catch(error => {
            console.log(error);
          });
    },

    // 加载更多
    moreData() {
      let that = this;
      that.page = that.page + 1;
      this.$http({
        url: "/api/wallet/legal_log",
        method: "post",
        data: {type: "4", currency: that.currency, page: that.page},
        headers: {Authorization: this.token}
      }).then(res => {
        if (res.data.type == "ok") {
          var datas = that.asset_list;
          for (let i in datas) {
            if (that.currency == datas[i].currency) {
              that.active02 = i;
              if (res.data.message.list.length > 0) {
                that.recData = that.recData.concat(res.data.message.list);
              } else {
                that.more = that.$t('nomore');
              }

            }
          }
        }
      });
    },
    // 划转
    transfer(index, currency) {
      let that = this;
      that.transferData.modalShow = true;
    }
  },
  created() {
    this.token = localStorage.getItem("token") || "";
  },

  mounted() {
    var that = this;
    that.getdata();
    this.init();
  }
};
</script>
<style scoped lang="scss">
.header {
  padding: 15px 30px;
  overflow: hidden;
}

.min_lab {
  margin: 0 10px;
}

.min_lab input {
  margin-right: 3px;
}

.inp_lab {
  border: 1px solid #6b80ae;
  border-radius: 2px;
  padding: 3px 5px;
}

.inp_lab input {
  background: none;
  border: none;
  width: 120px;
  color: #fff;
}

.right_text {
  color: #5697f4;
}

.right_text span {
  cursor: pointer;
}

.record {
  margin-right: 10px;
}

.content_ul {
  padding: 0 20px;
}

.content_top {
  padding: 10px 20px;
  // background: #161617c7;
}

.content_li {
  padding: 15px 0;
  border-bottom: 1px solid #1e2c42;
}

.operation,
.copy,
.ewm {
  // color: #00a4d8;
  color: #2ab098;
}

.copy {
  margin: 0 30px;
}

.copy:hover {
  cursor: pointer;
}

.ewm:hover {
  cursor: pointer;
}

.operation span {
  cursor: pointer;
  margin: 0 5px;
}

.hide_div {
  border: 1px solid #1e2c42;
  padding: 20px;
}

.excharge_record {
  color: #5697f4;
}

input {
  background: none;
  border: none;
}

.address_inp {
  width: 100%;
  border: 1px solid #6b80ae;
  border-radius: 3px;
  padding: 15px 15px;
}

.num_lab {
  display: flex;
  width: 100%;
  border: 1px solid #6b80ae;
  border-radius: 3px;
  padding: 15px;
}

.num_lab input {
  width: 100%;
}

.range_lab,
.get_lab {
  border: 1px solid #6b80ae;
  border-radius: 3px;
  padding: 15px;
}

.get_lab {
  background: #1e2c42;
}

.right_inp_wrap {
  margin-left: 20px;
}

.use_num,
.advance {
  color: #5697f4;
}

.use_num {
  margin-right: 5px;
}

.advance {
  margin-left: 5px;
}

.withdraw_btn {
  background-color: #7a98f7;
  color: #fff;
  padding: 15px 70px;
  border: none;
  border-radius: 5px;
}

.withdraw_btn:hover {
  cursor: pointer;
}

.bg {
  background: #2b3c71;
}

.ewm_wrap {
  position: relative;
}

.ewm_img {
  width: 120px;
  height: 120px;
  position: absolute;
  top: 25px;
  left: -30px;
  border: 10px solid #262a42;
}

.hide {
  display: none;
}

.rec-box {
  .rec-con {
    margin: 10px;
    padding: 0 20px;
    background: #262a42;

    span {
      flex: 1;
      text-align: center;
      line-height: 3;
    }

    .rec-title {
      display: flex;
      justify-content: space-between;
      font-size: 14px;
      color: #fff;
      line-height: 1.5;
    }

    li {
      display: flex;

      justify-content: space-between;
      font-size: 12px;
      color: #728daf;
      border-top: 1px solid #2e394c;
    }
  }
}

.more {
  width: 100%;
  line-height: 40px;
  text-align: center;
  cursor: pointer;
}

.transfer-modal {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.3);
  overflow: hidden;
  justify-content: center;
  align-items: center;
}

.transfer-mask {
  width: 500px;
  background-color: #262a42;
  margin: 0 auto;
  border-radius: 5px;
}

.transfer-header {
  line-height: 40px;
  text-align: center;
  position: relative;
}

.transfer-header p {
  position: absolute;
  right: 10px;
  top: 0;
}

.num_lab input::-webkit-input-placeholder {
  color: #aaa;
  font-size: 12px;
}

</style>


// WEBPACK FOOTER //
// src/view/accounts/finance.vue
