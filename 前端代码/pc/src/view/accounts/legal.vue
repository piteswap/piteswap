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
        <p class="flex1 tc">{{ $t('account.conversion') }}(CNY)</p>
        <p class="flex1 tc">{{ $t('do') }}</p>
      </div>
      <ul class="content_ul">
        <li
            v-for="(item,index) in asset_list"
            v-if="item.is_legal == 1"
            :key="index"
        >
          <div class="content_li flex alcenter between">
            <p class="flex1 tc">{{ item.currency_name }}</p>
            <p class="flex1 tc">{{ item.legal_balance || '0.00' | toFixeds }}</p>
            <p class="flex1 tc">{{ item.lock_legal_balance || '0.00' | toFixeds }}</p>
            <p class="flex1 tc">{{ item.cny_price * item.legal_balance || '0.00' | toFixeds }}</p>
            <!-- <p class="flex1 tc">{{item.valuation}}</p> -->
            <!-- <p class="flex1 tc">{{item.lock_position}}</p> -->
            <p class="flex1 tc operation">
              <span @click="transIn(index)">{{ $t('transin') }}</span>
              <span @click="transOut(index)">{{ $t('transout') }}</span>
              <span @click="rec(index,item.currency)">{{ $t('account.record') }}</span>
            </p>
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
                  <span>{{ reItem.info }}</span>
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
  </div>
</template>
<script>
import indexHeader from "@/view/indexHeader";
import left from "@/view/left";
import "@/lib/clipboard.min.js";
import "@/lib/jquery.qrcode.min.js";
import axios from "axios";

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
      form: {
        from: '',
        num: '',
        pic: [],
        hash: '',

      },
      inDialog: false,
      outDialog: false,
      uploadUrl: '',
      uploadHeaders: {},
      legal_list: [],
      amount: 0,
      current: 0,
      changeBalance: []
    };
  },
  components: {
    indexHeader,
    left
  },
  methods: {
    goRecord() {
      this.$router.push({name: "coinRecord"});
    },
    transIn(index) {
      // console.log(this.asset_list[index]);
      // inputValue:coin.change_balance,
      let coin = this.changeBalance[index]
      let avi = this.$t('center.available')
      let that = this;
      this.$prompt(`${coin.currency_name} ${avi} ${coin.change_balance} `, '从币币账户转入', {
        confirmButtonText: '从币币账户转入',
        cancelButtonText: '取消',
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
            to_field: 'legal',
            currency_id: coin.currency
          },
          headers: {Authorization: localStorage.getItem('token')}
        }).then(res => {
          if (res.data.type == "ok") {
            that.getdata();
            this.$message({
              showClose: true,
              message: '划转完成',
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
      this.$prompt(`${coin.currency_name} ${avi} ${coin.legal_balance} `, '转出到币币账户', {
        confirmButtonText: '转出到币币账户',
        cancelButtonText: '取消',
        inputPlaceholder: this.$t('account.huanum'),
        inputType: 'number',
        closeOnClickModal: false
      }).then(({value}) => {
        that.$http({
          url: "/api/" + "wallet/change",
          method: "post",
          data: {
            number: value,
            from_field: 'legal',
            to_field: 'change',
            currency_id: coin.currency
          },
          headers: {Authorization: localStorage.getItem('token')}
        }).then(res => {
          if (res.data.type == "ok") {
            that.getdata();
            this.$message({
              showClose: true,
              message: '划转完成',
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
    init() {

      var that = this;
      that.uploadHeaders = {Authorization: localStorage.getItem('token')};
      that.uploadUrl = that.$utils.back_api + 'api/upload';
      // console.log('上传地址',that.uploadUrl)
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
      console.log(index, currency);
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

              that.excharge_address = currency == 1 ? res.data.message.btc : res.data.message.usdt_erc20;
              // 生成二维码
              $("#code").qrcode({
                width: 130, //宽度
                height: 130, //高度
                text: that.excharge_address
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
          data: {type: 1, currency: currency, page: 1},
          headers: {Authorization: this.token}
        }).then(res => {
          if (res.data.type == "ok") {
            this.recData = res.data.message.list;
          }
        });
      }
    },
    getNum(currency) {
      var that = this;
      this.$http({
        method: "POST",
        url: "/api/" + "wallet/get_info",
        data: {
          currency: currency
        },
        headers: {
          "Authorization": localStorage.getItem('token')
        }
      }).then(res => {
        res = res.data;
        that.coinname = res.message.name;
        that.balance = res.message.legal_balance;
        that.min_number =
            that.$t('account.minnum') + parseFloat(res.message.min_number).toFixed(2)
            + "   " + that.$t('account.oncemaxnum') + parseFloat(res.message.max_number).toFixed(2)
            + "   " + that.$t('account.daynum') + parseFloat(res.message.day_limit).toFixed(2);
        that.min_number_txt = parseFloat(res.message.min_number).toFixed(8);
        that.minnumber = res.message.min_number;
        that.max_number = res.message.max_number;
        that.day_limit = res.message.day_limit;
        that.ratenum = res.message.rate;
        that.reachnum = 0.0;
        that.rate = res.message.rate;
      });
    },
    // 提币按钮
    mention() {
      var that = this;
      var currency = this.currency;
      var address = this.address;
      var number = this.number;
      var rate = this.rate;
      var min_number = this.minnumber;
      if (!address) {
        layer.alert(that.$t('lay.caddress'));
        return;
      }
      if (!number) {
        layer.alert(that.$t("lay.cnumber"));
        return;
      }
      if (number - 0 < min_number) {
        return layer.alert(that.$t("lay.minnum"));
      }

      this.$http({
        method: "POST",
        url: "/api/" + "wallet/out",
        data: {
          currency: this.currency,
          number: this.number,
          address: this.address,
          rate: this.rate
        },
        headers: {
          "Authorization": localStorage.getItem('token')
        }
      }).then(res => {
        res = res.data;

        if (res.type == "ok") {
          layer.alert(res.message);
          setTimeout(() => {
            window.location.reload();
          }, 1500);
        } else {
          layer.alert(res.message);
        }

      });
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
              console.log('法币余额', res.data.message);
              that.asset_list = res.data.message.legal_wallet.balance;
              that.changeBalance = res.data.message.change_wallet.balance;

              that.totle = res.data.message.legal_wallet.usdt_totle;
              that.status = res.data.message.is_open_CTbi;
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
        data: {type: "1", currency: that.currency, page: that.page},
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
    },
    uploadFile(f) {

      let that = this;
      let formData = new FormData();
      formData.append("file", f.file);

      this.$http.post("/api/upload", formData, {
        headers: {"Content-Type": "multipart/form-data"}
      }).then(res => {
        let msg = res.data;
        if (msg.type == 'ok') {
          that.form.pic = [{name: '', url: msg.message}];
        } else {
          layer.msg(msg.message)
        }
      });
    },
    submitChargeInfo(currency) {
      let data = {};
      data.currency = currency;
      data.acc = this.form.from;
      data.hash = this.form.hash;
      data.amount = this.form.num;

      if (!data.acc || !data.hash || !data.amount || !data.currency || this.form.pic.length < 1) {
        // layer.msg('参数错误');
        layer.msg(this.$t('leymsg.cscw'));
        // layer.msg(this.$t('leymsg.pmobile'));
        return;
      }


      data.pic = this.form.pic[0].url;

      let that = this;
      this.$http({
        url: "/api/wallet/charge_req",
        method: "post",
        data: data,
        headers: {Authorization: this.token}
      }).then(res => {
        if (res.data.type == "ok") {
          layer.msg(this.$t('leymsg.cssbmit'));
          // layer.msg('充值申请已提交');
          that.form.num = '';
          that.form.from = '';
          that.form.hash = '';
          that.form.pic = [];
        } else {
          // layer.msg('充值申请提交失败')
          layer.msg(this.$t('leymsg.cscwsb'));
        }
      });
    }
  },
  created() {
    this.token = localStorage.getItem("token") || "";
  },

  mounted() {
    var that = this;
    that.getdata();
    that.init();
  }
};
</script>
<style lang="scss">
.el-form-item__label {
  color: #637085 !important;
}

.el-message-box {
  .el-input__inner {
    border-color: #F1F1F1 !important;
    background-color: #ffffff !important;
    color: #181b2a !important;
  }
}
</style>
<style lang="scss" scoped>
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
  border-bottom: 1px solid #171c2b;
}

.operation,
.copy,
.ewm {
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
  width: 150px;
  height: 150px;
  position: absolute;
  top: 25px;
  left: -45px;
  border: 10px solid #fff;
  z-index: 1;
}

.hide {
  display: none;
}

.rec-box {
  .rec-con {
    margin: 10px;
    padding: 0 20px;
    background: #171c2b;

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
