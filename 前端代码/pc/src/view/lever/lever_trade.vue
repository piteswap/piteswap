<template>
  <div class="trade">
    <!-- 限价交易 -->
    <div class="content clear" v-if="show">
      <div class="available clear fColor1 first" v-if="address.length<=0">
        <span class="baseColor blueColor curPer" @click="goNext('login')">{{ $t('logins') }}</span>
        {{ $t('center.or') }}
        <span class="baseColor curPer" @click="goNext('register')">{{ $t('registers') }}</span>
        {{ $t('home.toTrade') }}
      </div>

      <div style="padding: 15px 20px; display: flex;flex-direction: row;">
        <div style="color: #00a4d8; flex: 1; display: inline-block;">
          <span style=" border-bottom: 1px solid #00a4d8;">{{ $t('account.taccount') }}</span>
        </div>
        <div class="fColor1">
          <span  @click="$router.push({name: 'transferLegal'})"  class="fColor1 transbtn curPer">{{ $t('account.transfer') }}</span>
        </div>
      </div>
      <div style="width: 100%; text-align: center; line-height: 40px;">
        <span class="fColor1">{{ user_legal }} {{ legal_name }}</span>
      </div>
    <div style="height: 1px; background-color: #2e333c; margin:10px 20px; width:width: calc(100% - 40px); box-sizing: border-box;"></div>
      <div class="btn-wrap">
        <el-button-group style="width: 100%;">
          <el-button @click="optype='buy'" :type="optype=='buy'?'activebuy':'normal'"> {{
              $t("lever.domore")
            }}{{ currency_name }}
          </el-button>
          <el-button @click="optype='sell'" :type="optype=='sell'?'activesell':'normal'"> {{
              $t("lever.doshort")
            }}{{ currency_name }}
          </el-button>
        </el-button-group>
      </div>

      <div class="control-price first">
        <span class="fColor1" :class="[{'active':selectedStatus == 1}]" @click="selectTypes(1)">{{ $t('center.shi') }}</span>
        <span class="fColor1" :class="[{'active':selectedStatus == 0}]" @click="selectTypes(0)">{{ $t('center.xian') }}</span>
      </div>

      <div v-if="optype=='buy'" class="w100 fl first">
        <div class="ft14">
          <div class="input-item clear">
            <div class="">
              <label style="width:100%;">{{ $t('price') }}</label>
              <input
                  type="text"
                  v-model="selectedStatus==1?bestPrice:inputPrice"
                  :disabled="selectedStatus==1"
                  :placeholder='$t("lever.pprice")'
                  style="width:100%;"
                  @input="changePrice('buy')"
              >
            </div>
            <label style="width:100%;">{{ $t('lever.timed') }}</label>
            <select class="buy_multiple" style="width:100%;" v-model="buyInfo.buy_selected" @change="selectMuit('buy')">
              <option disabled value>{{ $t('lever.ptimes') }}</option>
              <option
                  v-for="(item,index) in multiple"
                  :key="index"
                  :value="item.value"
              >{{ item.value }}{{ $t("lever.times") }}
              </option>
            </select>
          </div>
          <div class="shareNum" v-if="shareNum">
            1{{ $t('hand') }}{{ $t('lever.equal') }}{{ shareNum }}{{ currency_name }}
          </div>
          <div class="mt10 input-item clear">
            <label style="width:100%;" :style="minFont?'font-size:10px':'font-size:14px'">{{ $t("lever.hands") }}</label>
            <div class="flex share-total" style="width:100%;">
              <input
                  type="number"
                  class="share-input"
                  v-model="buySahre"
                  :placeholder="$t('pbuynum')"
                  @input="changeValue('buy')"
              >
              <b
                  v-for="item in shareList"
                  :key="item.value"
                  :class="['share2',{'active':type ==item.value}]"
                  @click="select(item.value,'buy')"
              >{{ item.value }}{{ $t('hand') }}</b>
            </div>
          </div>
          <div class="lever-total fColor1">
            <div class="mt15">
              <span class="">{{ $t("lever.contractVal") }}</span>
              <span class="market-value fr">≈ {{ totalPriceBuy || '0.0000' }} {{ legal_name }}</span>
            </div>
            <div class="mt10">
              <span class="">{{ $t("lever.bail") }}</span>
              <span class="bond fr">≈ {{ bonsBuy || '0.0000' }} {{ legal_name }}</span>
            </div>
            <div class="mt10">
              <span class="">{{ $t('lever.charge') }}</span>
              <span class="transaction-fee fr">≈ {{ trandeFreeBuy || '0.0000' }} {{ legal_name }}</span>
            </div>
          </div>
          <div
              class="sell_btn curPer  tc greenBack mt40 fColor1 ft16"
              @click="buyCoin"
          >{{ $t("lever.domore") }}{{ currency_name }}
          </div>
        </div>
      </div>

      <div v-if="optype=='sell'" class="w100 fl second">
        <div class="ft14">
          <div class="available clear fColor1" v-if="address.length<=0">
            <span class="baseColor curPer" @click="goNext('login')">{{ $t('logins') }}</span>
            {{ $t('center.or') }}
            <span class="baseColor curPer" @click="goNext('register')">{{ $t('registers') }}</span>
            {{ $t('home.toTrade') }}
          </div>
          <div class="input-item clear">
            <div class="">
              <label
                  style="width:100%;">{{ $t('price') }}</label>
              <input
                  type="text"
                  style="width:100%;"
                  v-model="selectedStatus==1?bestPrice:sellInputValue"
                  :disabled="selectedStatus == 1"
                  :placeholder='$t("lever.pprice")'
                  @input="changePrice('sell')"
              >
            </div>
            <label
                style="width:100%;">{{ $t("lever.timed") }}</label>
            <select
                style="width:100%;"
                class="sell_multiple"
                v-model="sellInfo.sell_selected"
                @change="selectMuit('sell')"
            >
              <option disabled value>{{ $t("lever.ptimes") }}</option>
              <option
                  v-for="(item,index) in multiple"
                  :key="index"
                  :value="item.value"
              >{{ item.value }}{{ $t("lever.times") }}
              </option>
            </select>
          </div>
          <div class="shareNum" v-if="shareNum">
            1{{ $t('hand') }}{{ $t('lever.equal') }}{{ shareNum }}{{ currency_name }}
          </div>
          <div class="mt10 input-item clear">
            <label
                style="width:100%;" :style="minFont?'font-size:10px':'font-size:14px'">{{ $t("lever.hands") }}</label>
            <div
                style="width:100%;" class="flex share-total">
              <input
                  type="number"
                  class="share-input"
                  v-model="sellShare"
                  :placeholder="$t('pbuynum')"
                  @input="changeValue('sell')"
              >

              <b
                  v-for="item in shareList"
                  :key="item.value"
                  :class="['share2',{'actives':types == item.value}]"
                  @click="select(item.value,'sell')"
              >{{ item.value }}{{ $t("hand") }}</b>

            </div>

            <!-- <b :class="['share',{'actives':types =='3'}]" @click="select(3,'sell')">3手</b>
            <b :class="['share',{'actives':types =='5'}]" @click="select(5,'sell')">5手</b>
            <b :class="['share',{'actives':types =='10'}]" @click="select(10,'sell')">10手</b>-->
          </div>
          <div class="lever-total fColor1">
            <p class="clearfix mt15">
              <span class="">{{ $t("lever.contractVal") }}</span>
              <span class="market-value fr">≈ {{ totalPrice || '0.0000' }} {{ legal_name }}</span>
            </p>
            <p class="clearfix mt10">
              <span class="">{{ $t("lever.bail") }}</span>
              <span class="bond fr">≈ {{ bons || '0.0000' }} {{ legal_name }}</span>
            </p>
            <p class="clearfix mt10">
              <span class="">{{ $t("lever.charge") }}</span>
              <span class="transaction-fee fr">≈ {{ trandeFree || '0.0000' }} {{ legal_name }}</span>
            </p>
          </div>
          <div
              class="sell_btn curPer  tc redBack mt40 fColor1 ft16"
              @click="sellCoin"
          >{{ $t("lever.doshort") }}{{ currency_name }}
          </div>
        </div>
      </div>
    </div>
    <!-- 市价交易 -->

    <div class="content clear" v-if="showNone">
      <div class="w50 fl first">
        <div class="ft14">
          <div class="available clear fColor1" v-if="address.length<=0">
            <span class="baseColor curPer" @click="goNext('login')">{{ $t('logins') }}</span>
            {{ $t('center.or') }}
            <span class="baseColor curPer" @click="goNext('register')">{{ $t('registers') }}</span>
            {{ $t('home.toTrade') }}
          </div>
          <div class="clear available" v-else>
            <span class="fl fColor1">{{ $t('lever.canuse') }} {{ user_currency }} {{ currency_name }}</span>
          </div>
          <div class="mt40 input-item clear">
            <label>{{ $t('center.buyprice') }}</label>
            <input type="number" value="$t('lowbuy')" @keydown.69.prevent disabled>
            <span>{{ currency_name }}</span>
          </div>
          <div class="mt40 input-item clear">
            <label>{{ $t('center.buynumber') }}</label>
            <input type="number" @keydown.69.prevent @keyup="numFilter($event)">
            <span>{{ legal_name }}</span>
          </div>
          <div class="sell_btn curPer mt40 tc greenBack fColor1 ft16">{{ $t("lever.domore") }}{{ currency_name }}</div>
        </div>
      </div>
      <div class="w50 fl second">
        <div class="ft14">
          <div class="available clear fColor1" v-if="address.length<=0">
            <span class="baseColor curPer" @click="goNext('login')">{{ $t('logins') }}</span>
            {{ $t('center.or') }}
            <span class="baseColor curPer" @click="goNext('register')">{{ $t('registers') }}</span>
            {{ $t('home.toTrade') }}
          </div>
          <div class="clear available" v-else>

            <!-- <span class="fr baseColor curPer" @click="goNext('account')">充币</span> -->
          </div>
          <div class="mt40 input-item clear">
            <label>{{ $t('center.sellprice') }}</label>
            <input type="number" :value="$t('bestsell')" @keydown.69.prevent disabled>
            <span>{{ currency_name }}</span>
          </div>
          <div class="mt40 input-item clear">
            <label>{{ $t('center.sellnumber') }}</label>
            <input type="number" @keydown.69.prevent @keyup="numFilter($event)">
            <span>{{ legal_name }}</span>
          </div>
          <div class="sell_btn curPer mt40 tc redBack fColor1 ft16">{{ $t("lever.doshort") }}{{ currency_name }}</div>
        </div>
      </div>
    </div>

    <!-- 买入卖出弹窗 -->
    <div class="comfirm-modal flex" v-show="comfirmShow">
      <div class="comfirm-modal-content">
        <div class="loss-modal-header">
          <h3>{{ $t('lever.sureOd') }}</h3>
          <p @click="closeMosal()">X</p>
        </div>
        <ul>
          <li class="flex">
            <p>{{ currency_name }}/{{ legal_name }}</p>
          </li>
          <li class="flex">
            <p>{{ $t('lever.type') }}：</p>
            <p>{{ buyType == '1' ? $t('lever.dmore') : $t('lever.dshort') }}</p>
          </li>
          <li class="flex">
            <p>{{ $t('lever.hands') }}：</p>
            <p>{{ buyType == '1' ? buySahre : sellShare }}</p>
          </li>
          <li class="flex">
            <p>{{ $t('lever.timed') }}：</p>
            <p>{{ buyType == '1' ? buyInfo.buy_selected : sellInfo.sell_selected }}</p>
          </li>
          <li class="flex">
            <p>{{ $t("lever.bail") }}：</p>
            <p>{{ buyType == '1' ? bonsBuy : bons }}{{ legal_name }}</p>
          </li>
          <li class="flex">
            <p>{{ $t("lever.charge") }}：</p>
            <p>{{ buyType == '1' ? trandeFreeBuy : trandeFree }}{{ legal_name }}</p>
          </li>
		 
        </ul>
        <div class="modal-btn">
          <button type="button" @click="closeMosal()">{{ $t('td.canceil') }}</button>
          <button type="button" @click="comfirm()">{{ $t('td.confirm') }}</button>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: "trade",
  data() {
    return {
      bestPrice:'',
      currency_name: "",
      currency_id: "",
      legal_name: "",
      legal_id: "",
      multiple: "",
      user_currency: "",
      user_legal: "",
      show: true,
      showNone: false,
      allBalance: 0,
      buyInfo: {buy_selected: "", buyNum: 0, url: "lever/submit"},
      sellInfo: {sell_selected: "", sellNum: 0, url: "lever/submit"},
      type: "",
      types: "",
      shares: 0,
      bons: "",
      totalPrice: "",
      trandeFree: "",
      bonsBuy: "",
      totalPriceBuy: "",
      trandeFreeBuy: "",
      lastPrice: "",
      buyType: "",
      comfirmShow: false,
      shareList: [],
      buySahre: "",
      sellShare: "",
      inputPrice: 0,
      selectType: "",
      selectedStatus: 1,
      newPrice: 0,
      pprice: 0,
      sellInputValue: 0,
      minShare: 1,
      maxShare: 0,
      shareNum: '',
      minFont: false,
      optype: 'buy'
    };
  },
  created() {
    this.address = localStorage.getItem("token") || "";
    //this.lang = localStorage.getItem("locale") || "";
    // this.minFont=useMinFont();
  },
  filters: {
    tofixed: function (val) {
      val = Number(val);
      return val.toFixed(2);
    },
    tofixedFour: function (val) {
      val = Number(val);
      return val.toFixed(4);
    }
  },
  mounted() {
    let that = this;
    that.address = localStorage.getItem("token") || "";
    that.legal_id = localStorage.getItem("legal_id");
    that.currency_id = localStorage.getItem("currency_id");
    that.legal_name = localStorage.getItem("legal_name");
    that.currency_name = localStorage.getItem("currency_name");
    that.buy_sell(that.legal_id, that.currency_id);
    that.minFont = that.useMinFont();
    eventBus.$on("tocel", function (datas) {
      if (datas) {
        that.buy_sell(that.legal_id, that.currency_id);
      }
    });

    eventBus.$on('updateKLine', res => {
      // console.log(res);
      if (res.period === '1min') {

        if (that.newPrice === 0) {
          that.newPrice = (res.close - 0).toFixed(4);
          that.inputPrice = that.newPrice;
          that.sellInputValue = that.newPrice;
        } else {
          that.newPrice = (res.close - 0).toFixed(4);
        }
      }
    })
  },
  methods: {
    numFilter(ev) {
      //48-57 96-105 108
      // console.log(ev.keyCode)
    },
    useMinFont() {
      var lang = localStorage.getItem("locale") || "";
      if (lang == "en") {
        return true;
      }
      return false;
    },
    changeType() {
      this.show = !this.show;
    },
    goNext(url) {
      this.$router.push({name: url});
    },

    buyCoin() {
      var that = this;
      if (that.buyInfo.buy_selected == "") {
        layer.msg(that.$t('lever.ptimes'));
        return;
      }
      if (that.selectedStatus == 0) {
        if (that.inputPrice == "") {
          layer.msg(that.$t('lever.pprice'));
          return;
        }
      }
      if (that.buySahre < that.minShare) {
        layer.msg(that.$t('lay.lessnum') + that.minShare);
        return;
      }
      if (that.buySahre > that.maxShare) {
        layer.msg(that.$t('lay.morenum') + that.maxShare);
        return;
      }

      that.comfirmShow = true;
      that.buyType = 1;
    },
    sellCoin() {
      var that = this;
      if (this.sellInfo.sell_selected == "") {
        layer.msg(that.$t('lever.ptimes'));
        return;
      }
      if (that.selectedStatus == 0) {
        if (that.sellInputValue == "") {
          layer.msg(that.$t('lever.pprice'));
          return;
        }
      }
      if (that.sellShare < that.minShare) {
        layer.msg(that.$t('lay.lessnum') + that.minShare);
        return;
      }
      if (that.sellShare > that.maxShare) {
        layer.msg(that.$t('lay.morenum') + that.maxShare);
        return;
      }
      that.comfirmShow = true;
      that.buyType = 2;
    },
    //买入、卖出记录
    buy_sell(legals_id, currencys_id) {
      this.$http({
        url: "/api/" + "lever/deal",
        method: "post",
        data: {
          legal_id: legals_id,
          currency_id: currencys_id
        },
        headers: {Authorization: localStorage.getItem("token")}
      })
          .then(res => {
            if (res.data.type == "ok") {
              this.multiple = res.data.message.multiple.muit;
              this.user_currency = res.data.message.all_levers;
              this.user_legal = res.data.message.user_lever;
              this.lastPrice = res.data.message.last_price;
              this.shareList = res.data.message.multiple.share;
              this.minShare = res.data.message.lever_share_limit.min;
              this.maxShare = res.data.message.lever_share_limit.max;
              this.buyInfo.buyPrice = 0;
              this.buyInfo.buyNum = 0;
              this.type = this.shareList[0].value;
              this.types = this.shareList[0].value;
              this.sellShare = this.types;
              this.buySahre = this.type;
            } else {
              // layer.msg(res.data.message)
            }
          })
          .catch(error => {
            // console.log(error)
          });
    },
    // 选择张数
    select(options, values) {
      let that = this;
      that.shares = options;
      if (values == "buy") {
        that.type = options;
        that.buySahre = options;
      } else {
        that.types = options;
        that.sellShare = options;
      }
      if (that.selectedStatus != 0) {
        if (values == "sell" && that.sellInfo.sell_selected != "") {
          // 价格
          var bond = parseFloat(localStorage.getItem("lastPrice")).toFixed(4);
          // 倍数
          var muitNum = parseFloat(that.sellInfo.sell_selected).toFixed(4);
          // 张数
          var share = parseFloat(options).toFixed(4);
          that.pricesType(bond, values, share, muitNum);
        } else if (values == "buy" && that.buyInfo.buy_selected != "") {
          // 价格
          var bond = parseFloat(localStorage.getItem("lastPrice")).toFixed(4);
          // 倍数
          var muitNum = parseFloat(that.buyInfo.buy_selected).toFixed(4);
          // 张数
          var share = parseFloat(options).toFixed(4);
          that.pricesType(bond, values, share, muitNum);
        } else {
          that.totalPriceBuy = 0.0;
          that.trandeFreeBuy = 0.0;
          that.bonsBuy = 0.0;
        }
      } else {
        if (values == "sell" && that.sellInfo.sell_selected != "") {
          if (that.sellInputValue != "") {
            // 价格
            var bond = parseFloat(that.sellInputValue).toFixed(4);
            // 倍数
            var muitNum = parseFloat(that.sellInfo.sell_selected).toFixed(4);
            // 张数
            var share = parseFloat(options).toFixed(4);
            that.pricesType(bond, values, share, muitNum);
          }
        } else if (values == "buy" && that.buyInfo.buy_selected != "") {
          if (that.inputPrice != "") {
            // 价格
            var bond = parseFloat(that.inputPrice).toFixed(4);
            // 倍数
            var muitNum = parseFloat(that.buyInfo.buy_selected).toFixed(4);
            // 张数
            var share = parseFloat(options).toFixed(4);
            that.pricesType(bond, values, share, muitNum);
          }
        } else {
          that.totalPriceBuy = 0.0;
          that.trandeFreeBuy = 0.0;
          that.bonsBuy = 0.0;
        }
      }
    },
    pricesType(bond, type, share, muitNum) {
      let that = this;
      var i = layer.load(1);
      this.$http({
        url: "/api/" + "currency/quotation_new",
        method: "get",
        data: {},
        headers: {Authorization: localStorage.getItem("token")}
      }).then(res => {
            if (res.data.type == "ok") {
              var list = res.data.message[0].quotation;
              for (let i in list) {
                if (that.currency_id == list[i].currency_id) {
                  var spread = parseFloat(list[i].spread).toFixed(4);
                  var transactionFee = parseFloat(list[i].lever_trade_fee).toFixed(4);
                  var prices = parseFloat((parseFloat(bond * 1) * spread) / 100).toFixed(4);
                  var pricesTotal = 0;
                  if (type == "sell") {
                    pricesTotal = parseFloat(parseFloat(bond * 1) - (prices - 0)).toFixed(4);
                  } else {
                    pricesTotal = parseFloat(parseFloat(bond * 1) + (prices - 0)).toFixed(4);
                  }
                  muitNum = parseFloat(muitNum).toFixed(4);
                  share = parseFloat(share).toFixed(4);
                  var shareNum = parseFloat(list[i].lever_share_num).toFixed(4);
                  that.shareNum = shareNum;
                  var totalPrice = parseFloat(
                      pricesTotal * share * shareNum
                  ).toFixed(4);
                  var bondsValue = parseFloat(
                      (totalPrice - 0) / (muitNum - 0)
                  ).toFixed(4);
                  var tradeFreeValue = parseFloat(
                      (totalPrice * transactionFee) / 100
                  ).toFixed(4);
                  if (type == "buy") {
                    that.totalPriceBuy = (bond * share * shareNum).toFixed(4);
                    that.trandeFreeBuy = tradeFreeValue;
                    that.bonsBuy = bondsValue;
                  } else {
                    that.totalPrice = (bond * share * shareNum).toFixed(4);
                    that.trandeFree = tradeFreeValue;
                    that.bons = bondsValue;
                  }
                }
              }
            }
          })
          .catch(error => {
            console.log(error);
          });
      setTimeout(function () {
        layer.close(i);
      }, 1500);
    },
    // 选择倍数
    selectMuit(type) {
      let that = this;
      if (that.selectedStatus != 0) {
        if (type == "sell" && that.sellShare != "") {
          // 价格
          var bond = parseFloat(localStorage.getItem("lastPrice")).toFixed(4);
          // 倍数
          var muitNum = parseFloat(that.sellInfo.sell_selected).toFixed(4);
          // 张数
          var share = parseFloat(that.sellShare).toFixed(4);
          that.pricesType(bond, type, share, muitNum);
        } else if (type == "buy" && that.buySahre != "") {
          // 价格
          var bond = parseFloat(localStorage.getItem("lastPrice")).toFixed(4);
          // 倍数
          var muitNum = parseFloat(that.buyInfo.buy_selected).toFixed(4);
          // 张数
          var share = parseFloat(that.buySahre).toFixed(4);
          that.pricesType(bond, type, share, muitNum);
        } else {
          that.totalPriceBuy = 0.0;
          that.trandeFreeBuy = 0.0;
          that.bonsBuy = 0.0;
        }
      } else {
        if (type == "sell" && that.sellShare != "") {
          if (that.sellInputValue != "") {
            // 价格
            var bond = parseFloat(that.sellInputValue).toFixed(4);
            // 倍数
            var muitNum = parseFloat(that.sellInfo.sell_selected).toFixed(4);
            // 张数
            var share = parseFloat(that.sellShare).toFixed(4);
            that.pricesType(bond, type, share, muitNum);
          }
        } else if (type == "buy" && that.sellShare != "") {
          if (that.inputPrice != "") {
            // 价格
            var bond = parseFloat(that.inputPrice).toFixed(4);
            // 倍数
            var muitNum = parseFloat(that.buyInfo.buy_selected).toFixed(4);
            // 张数
            var share = parseFloat(that.buySahre).toFixed(4);
            that.pricesType(bond, type, share, muitNum);
          }
        } else {
          that.totalPriceBuy = 0.0;
          that.trandeFreeBuy = 0.0;
          that.bonsBuy = 0.0;
        }
      }
    },

    // 张数输入
    changeValue(type) {
      let that = this;
      let textValue = /^[1-9]*[0-9][0-9]*$/;
      that.totalPriceBuy = 0.0000;
      that.trandeFreeBuy = 0.0000;
      that.bonsBuy = 0.0000;
      that.totalPrice = 0.0000;
      that.trandeFree = 0.0000;
      that.bons = 0.0000;
      if (type == 'sell') {
        that.types = '-1';
        if (that.sellShare != '') {
          if (!textValue.test(that.sellShare)) {
            layer.msg(that.$t('lever.zheng'));
            return;
          } else if (that.sellShare < that.minShare) {
            layer.msg(that.$t('lay.lessnum') + that.minShare);
            return;
          } else {
            if (that.maxShare > 0) {
              if (that.sellShare > that.maxShare) {
                layer.msg(that.$t('lay.morenum') + that.maxShare);
                return;
              }
            }
          }
        } else {
          return;
        }
      } else {
        that.type = '-1';
        if (that.buySahre != '') {
          if (!textValue.test(that.buySahre)) {
            layer.msg(that.$t('lever.zheng'));
            return;
          } else if (that.buySahre < that.minShare) {
            layer.msg(that.$t('lay.lessnum') + that.minShare);
            return;
          } else {
            if (that.maxShare > 0) {
              if (that.buySahre > that.maxShare) {
                layer.msg(that.$t('lay.morenum') + that.maxShare);
                return;
              }
            }
          }
        } else {
          return;
        }
      }
      if (that.selectedStatus != 0) {
        if (type == "sell" && that.sellInfo.sell_selected != "") {
          that.types = '';
          // 价格
          var bond = parseFloat(localStorage.getItem("lastPrice")).toFixed(4);
          // 倍数
          var muitNum = parseFloat(that.sellInfo.sell_selected).toFixed(4);
          // 张数
          var share = parseFloat(that.sellShare).toFixed(4);
          that.pricesType(bond, type, share, muitNum);
        } else if (type == "buy" && that.buyInfo.buy_selected != "") {
          that.type = '';
          // 价格
          var bond = parseFloat(localStorage.getItem("lastPrice")).toFixed(4);
          // 倍数
          var muitNum = parseFloat(that.buyInfo.buy_selected).toFixed(4);
          // 张数
          var share = parseFloat(that.buySahre).toFixed(4);
          that.pricesType(bond, type, share, muitNum);
        } else {
          that.totalPriceBuy = 0.0000;
          that.trandeFreeBuy = 0.0000;
          that.bonsBuy = 0.0000;
          that.totalPrice = 0.0000;
          that.trandeFree = 0.0000;
          that.bons = 0.0000;
        }
      } else {
        if (type == "sell" && that.sellInfo.sell_selected != "") {
          that.types = '';
          if (that.sellInputValue != "") {
            // 价格
            var bond = parseFloat(that.sellInputValue).toFixed(4);
            // 倍数
            var muitNum = parseFloat(that.sellInfo.sell_selected).toFixed(4);
            // 张数
            var share = parseFloat(that.sellShare).toFixed(4);
            that.pricesType(bond, type, share, muitNum);
          }
        } else if (type == "buy" && that.buyInfo.buy_selected != "") {
          that.type = '';
          if (that.inputPrice != "") {
            // 价格
            var bond = parseFloat(that.inputPrice).toFixed(4);
            // 倍数
            var muitNum = parseFloat(that.buyInfo.buy_selected).toFixed(4);
            // 张数
            var share = parseFloat(that.buySahre).toFixed(4);
            that.pricesType(bond, type, share, muitNum);
          }
        } else {
          that.totalPriceBuy = 0.0000;
          that.trandeFreeBuy = 0.0000;
          that.bonsBuy = 0.0000;
          that.totalPrice = 0.0000;
          that.trandeFree = 0.0000;
          that.bons = 0.0000;
        }
      }
    },
    // 关闭买入卖出弹窗
    closeMosal() {
      let that = this;
      that.comfirmShow = false;
    },
    // 下单确认
    comfirm() {
      let that = this;
      let data;
      if (that.buyType == 2) {
        if (that.legal_id != '' && that.currency_id != '') {
          data = {
            legal_id: that.legal_id,
            currency_id: that.currency_id,
            multiple: that.sellInfo.sell_selected,
            share: that.sellShare,
            type: 2,
            status: that.selectedStatus,
            target_price: that.sellInputValue,
          };
        } else {
          layer.msg(that.$t('traedoff'));
        }

      } else {
        if (that.legal_id != '' && that.currency_id != '') {
          data = {
            legal_id: that.legal_id,
            currency_id: that.currency_id,
            multiple: that.buyInfo.buy_selected,
            share: that.buySahre,
            type: 1,
            status: that.selectedStatus,
            target_price: that.inputPrice,
          };
        } else {
          layer.msg(that.$t('traedoff'));
        }

      }
      var i = layer.load(1);
      this.$http({
        url: "/api/" + that.sellInfo.url,
        method: "post",
        data: data,
        headers: {Authorization: localStorage.getItem("token")}
      })
          .then(res => {
            layer.close(i);
            // layer.msg(res.data.message)
            if (res.data.type == "ok") {
              if (that.buyType == 2) {
                that.sellInfo.sellPrice = 0;
                that.sellInfo.sellNum = 0;
              } else {
                that.buyInfo.buyPrice = 0;
                that.buyInfo.buyNum = 0;
              }

              eventBus.$emit("buyTrade", "tradebuy");
              eventBus.$emit("tocel", "updata");
              eventBus.$emit("to_leverExchange", "leverExchange");
              // that.buy_sell(that.legal_id,that.currency_id)
              layer.msg(res.data.message);
              setTimeout(function () {
                // window.reload();
                // that.$router.go(0);
                // if(that.selectedStatus == 1){
                //   that.$router.push({ name: "leverTransactions" });
                // }else{
                //   that.$router.push({ name: "leverList" });
                // }
                that.closeMosal()
              }, 500);
            } else {
              layer.msg(res.data.message);
              that.comfirmShow = false;
            }
          })
          .catch(error => {
            console.log(error);
            that.comfirmShow = false;
          });
    },
    // 选择交易类型
    selectTypes(types) {
      let that = this;
      that.selectedStatus = types;
      that.totalPriceBuy = 0.0000;
      that.trandeFreeBuy = 0.0000;
      that.bonsBuy = 0.0000;
      that.totalPrice = 0.0000;
      that.trandeFree = 0.0000;
      that.bons = 0.0000;
      that.buyInfo.buy_selected = '';
      that.sellInfo.sell_selected = '';
      that.inputPrice = that.newPrice;
      that.sellInputValue = that.newPrice;
    },
    // 手动输入价格
    changePrice(type) {
      let that = this;
      if (that.selectedStatus == 0) {
        if (type == "buy" && that.buyInfo.buy_selected != "") {
          if (that.inputPrice != "") {
            // 价格
            var bond = parseFloat(that.inputPrice).toFixed(4);
            // 倍数
            var muitNum = parseFloat(that.buyInfo.buy_selected).toFixed(4);
            // 张数
            var share = parseFloat(that.buySahre).toFixed(4);
            that.pricesType(bond, type, share, muitNum);
          } else {
            that.totalPriceBuy = 0.0000;
            that.trandeFreeBuy = 0.0000;
            that.bonsBuy = 0.0000;
          }
        } else if (type == "sell" && that.sellInfo.sell_selected != "") {
          if (that.sellInputValue != "") {
            // 价格
            var bond = parseFloat(that.sellInputValue).toFixed(4);
            // 倍数
            var muitNum = parseFloat(that.sellInfo.sell_selected).toFixed(4);
            // 张数
            var share = parseFloat(that.sellShare).toFixed(4);
            that.pricesType(bond, type, share, muitNum);
          } else {
            that.totalPrice = 0.0000;
            that.trandeFree = 0.0000;
            that.bons = 0.0000;
          }
        } else {
          that.totalPrice = 0.0000;
          that.trandeFree = 0.0000;
          that.bons = 0.0000;
          that.totalPriceBuy = 0.0000;
          that.trandeFreeBuy = 0.0000;
          that.bonsBuy = 0.0000;
        }
      }
    },
    AmountFont() {
      return "font-size:'10px'"
    }
  },
  computed: {
    buyTotal() {
      return this.buyInfo.buy_selected * this.buyInfo.buyNum || 0;
    },
    sellTotal() {
      return this.sellInfo.sell_selected * this.sellInfo.sellNum || 0;
    }
  }
};
</script>

<style lang="scss" scoped>

.trade {
  width: 350px;
  padding-bottom: 15px;
}

.input.disabled
{
  color: #627085;
  cursor: not-allowed;
}

.btn-wrap {
  padding:10px 20px;
}

/deep/ .el-button, .el-button:hover, .el-button:focus {
  background-color: #2e2e2e;
  color: #c4c4c4;
  border-color: #848383;
  width: 50%;
}

/deep/ .el-button--success {
  background-color: #35b65a;
  width: 50%;
}

/deep/ .el-button--activesell:focus, .el-button--activesell:hover {
  color: #fff;
  background-color: #ff494a;
  border-color: #848383;
}

/deep/ .el-button--activebuy:focus, .el-button--activebuy:hover {
  color: #fff;
  background-color: #35b65a;
  border-color: #848383;
}

/deep/ .el-button--activesell {
  background-color: #ff494a;
  color: #fff;
  width: 50%;
}

/deep/ .el-button--activebuy {
  background-color: #35b65a;
  color: #fff;
  width: 50%;
}

.shareNum {
  color: #637085;
  position: relative;
  top: 5px;
}

.mb10 input {
  margin-bottom: 30px;
}

.padds {
  margin: 0 15px 0 25px;
  padding: 0 10px;
}

.share-total {
  flex-wrap: wrap;
}

.control-price {
  margin: 0px 0 0;
  line-height: 46px;

  color: #fff;
}

.control-price span {
  margin-right: 15px;
  //padding-bottom: 10px;
  cursor: pointer;
}

.control-price .active,.control-price span:hover{
  border-bottom: 1px solid #00a4d8;
  color:#00a4d8;
}

.control-price div {
  margin-top: 30px;
}

.control-price input {
  width: 60%;
  line-height: 30px;
  padding: 5px 10px;
  border: 1px solid #52688c;
  background-color: rgba(0, 0, 0, 0);
  color: #fff;
}

.title_box {
  height: 48px;
  line-height: 48px;
  padding: 0 30px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.tabtitle span {
  cursor: pointer;
}

.tabtitle span:not(:last-child) {
  margin-right: 40px;
}

.content .first {
  padding: 0 20px;
}

.content .second {
  padding: 0 20px;
}

.available {
  height: 48px;
  border-bottom: 1px solid #303b4b;
  line-height: 48px;
}

.input-item {
  position: relative;
  line-height: 40px;
}

.input-item2 {
  position: relative;
  line-height: 40px;
}

.input-item label {
  width: 20%;
  float: left;
  font-size: 14px;
  color: #637085;
}

.fb10 {
  font-size: 10px;
}

.input-item2 label {
  width: 20%;
  float: left;
  font-size: 10px;
  color: #637085;
}

.input-item2 input {
  width: 80%;
  float: left;
  border: 1px solid #52688c;
  border-radius: 3px;
  height: 40px;
  text-indent: 15px;
  font-size: 16px;
  color: #cdd6e4;
  background-color: #262a42;
  line-height: 38px;
}

.input-item input {
  width: 80%;
  float: left;
  border: 1px solid #52688c;
  border-radius: 3px;
  height: 40px;
  text-indent: 15px;
  font-size: 16px;
  color: #cdd6e4;
  background-color: #171c2b;
  line-height: 38px;
}

.input-item span {
  position: absolute;
  right: 15px;
  color: #637085;
  font-size: 16px;
}

.input-item select {
  width: 80%;
  background: #171c2b;
  color: #cdd6e4;
  border: 1px solid #52688c;
  border-radius: 3px;
  height: 40px;
  text-indent: 10px;
  font-size: 16px;
}

.attion {
  height: 20px;
  line-height: 30px;
  font-size: 12px;
}

.sell_btn {
  width: 100%;
  height: 40px;
  border-radius: 3px;
  color: #f5f5f5;
  line-height: 40px;
}

.greenBack {
  margin-top: 40px;
  background-color: #35b65a;
}

.redBack {
  margin-top: 40px;
  background-color: #ff494a;
}

input:disabled {
  color: #627085;
  cursor: not-allowed;
}

.share {
  display: inline-block;
  font-weight: normal;
  border: 1px solid #eee;
  border-radius: 2px;
  font-size: 14px;
  color: #fff;
  line-height: 1.2;
  width: 22.5%;
  text-align: center;
  padding: 5px 0;
  margin-right: 3.14px;
}

.share2 {
  display: inline-block;
  font-weight: normal;
  border: 1px solid #52688c;
  border-radius: 2px;
  font-size: 11px;
  color: #fff;
  line-height: 1.2;
  width: 23.7%;
  text-align: center;
  padding: 5px 0;
  cursor:pointer;
  margin: 2px;
}

.transbtn:hover{
  color: #00a4d8;
  border-bottom: 1px solid #00a4d8;
}

.ft9 {
  font-size: 9px;
}

b.active {
  background-color: #02c289;
  border: 1px solid #02c289;
}

b.actives {
  background-color: #de5959;
  border: 1px solid #de5959;
}

.comfirm-modal {
  width: 100%;
  height: 100%;
  position: fixed;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.7);
  justify-content: center;
  align-items: center;
  color: #c7cce6;
}

.comfirm-modal-content {
  width: 500px;
  background-color: #262a42;
  margin: 0 auto;
  border-radius: 5px;
}

.loss-modal-header {
  line-height: 40px;
  text-align: center;
  position: relative;
}

.loss-modal-header p {
  position: absolute;
  right: 10px;
  top: 0;
}

.comfirm-modal-content li {
  line-height: 40px;
  margin: 0 20px;
}

.modal-btn {
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  font-size: 0;
  padding-top: 30px;
}

.modal-btn button {
  width: 50%;
  line-height: 50px;
  border: none;
  float: left;
  font-size: 14px;
  color: #fff;
  background: #9db5c7;
}

.modal-btn button:last-child {
  border-left: 1px solid #2e333c;
  background: #689cf1;
}

.input-item .share-input {
  border: 1px solid #52688c;
  border-radius: 2px;
  font-size: 14px;
  color: #fff;
  line-height: 26px;
  width: 100%;
  padding: 5px 10px;
  background-color: rgba(0, 0, 0, 0);
  height: auto;
  float: none;
  text-indent: 0;
  margin-bottom: 10px;
}

#amtlabel {
  font-size: 10px;
}
</style>