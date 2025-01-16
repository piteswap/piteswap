<template>
  <div class="wrap">
    <div class="title fColor1 flex;" style="line-height: 51px">
      <div class="inblock" style="display: flex">
        <div>
          <span @click="load(1)" :class="{ active: load_type == 1 }">{{
            $t("lever.lvchi")
          }}</span>
        </div>
        <div>
          <span @click="load(0)" :class="{ active: load_type == 0 }">{{
            $t("lever.nowentrust")
          }}</span>
        </div>
        <div style="flex: 1"></div>
        <div>
          <span @click="load(3)" :class="{ active: load_type == 3 }">{{
            $t("lever.closed")
          }}</span>
        </div>
        <div>
          <span
            @click="load(4)"
            :class="{ active: load_type == 4 }"
            style="margin-right: 0"
            >{{ $t("lever.revoked") }}</span
          >
        </div>
      </div>
    </div>
    <div
      style="margin: 10px 20px; display: flex; flex-direction: column; flex: 1"
    >
      <div>
        <ul class="list_head ft14">
          <!--合约持仓-->
          <li class="flex" v-if="load_type == 1">
            <span class="li-type" style="text-align: left">{{
              $t("lever.type")
            }}</span>

            <span class="li-openprice">{{ $t("lever.openPrice") }}</span>

            <span class="li-nowprice">{{ $t("lever.nowPrice") }}</span>

            <span class="li-bail">{{ $t("lever.bail") }}</span>
            <span class="li-styprice">{{ $t("lever.styPrice") }}</span>
            <span class="li-stsprice">{{ $t("lever.stsPrice") }}</span>

            <span class="li-opentime">{{ $t("lever.openTime") }}</span>

            <span class="li-rate">{{ $t("lever.rate") }}</span>
            <span class="li-loss">{{ $t("lever.loss") }}</span>
            <span class="li-todo">{{ $t("td.do") }}</span>
          </li>

          <!--当前委托-->
          <li class="flex" v-if="load_type == 0">
            <span class="li-type" style="text-align: left">{{
              $t("lever.type")
            }}</span>

            <span class="li-openprice">{{ $t("lever.entrustPrice") }}</span>

            <span class="li-nowprice">{{ $t("lever.nowPrice") }}</span>

            <span class="li-bail">{{ $t("lever.bail") }}</span>
            <span class="li-styprice">{{ $t("lever.styPrice") }}</span>
            <span class="li-stsprice">{{ $t("lever.stsPrice") }}</span>

            <!--            <span class="width2">{{ $t('lever.openTime') }}</span>-->
            <span class="li-opentime">{{ $t("lever.weituoTime") }}</span>

            <span class="li-rate">{{ $t("lever.rate") }}</span>
            <span class="li-todo">{{ $t("td.do") }}</span>
          </li>

          <!--已平仓-->
          <li class="flex" v-if="load_type == 3">
            <span class="li-type" style="text-align: left">{{
              $t("lever.type")
            }}</span>

            <span class="li-openprice" v-if="load_type == 3">{{
              $t("lever.closePrice")
            }}</span>

            <span class="li-openprice">{{ $t("lever.openPrice") }}</span>

            <span class="li-bail">{{ $t("lever.bail") }}</span>
            <span class="li-styprice">{{ $t("lever.styPrice") }}</span>
            <span class="li-styprice">{{ $t("lever.stsPrice") }}</span>

            <span class="li-opentime">{{ $t("lever.openTime") }}</span>

            <span class="li-rate">{{ $t("lever.rate") }}</span>
            <span class="li-loss" v-if="load_type != 0 && load_type != 4">{{
              $t("lever.loss")
            }}</span>
            <span class="li-opentime" v-if="load_type == 3">{{
              $t("lever.closeTime")
            }}</span>
            <span class="li-status">{{ $t("td1.status") }}</span>
          </li>

          <!--已撤销-->
          <li class="flex" v-if="load_type == 4">
            <span class="li-type" style="text-align: left; text-indent: 10px">{{
              $t("lever.type")
            }}</span>
            <span class="li-openprice">{{ $t("lever.entrustPrice") }}</span>
            <span class="li-bail">{{ $t("lever.bail") }}</span>
            <span class="li-styprice">{{ $t("lever.styPrice") }}</span>
            <span class="li-stsprice">{{ $t("lever.stsPrice") }}</span>
            <span class="li-opentime" v-if="load_type == 0 || load_type == 4">{{
              $t("lever.weituoTime")
            }}</span>
            <span class="li-rate">{{ $t("lever.rate") }}</span>
            <span class="li-opentime">{{ $t("lever.revokeTime") }}</span>
            <span class="li-status">{{ $t("td1.status") }}</span>
          </li>
        </ul>
      </div>
      <ul
        class="list_content fColor1 ft12"
        v-loading="loadingData"
        style="min-height: 300px"
      >
        <li
          v-for="(item, index) in list_content"
          :key="index"
          v-if="load_type == 1"
          class="flex alcenter"
        >
          <span
            class="li-type"
            style="text-align: left; line-height: 25px"
            :class="item.type == 1 ? 'green' : 'red'"
            ><i
              class="iconfont"
              :class="
                item.type == 1 ? 'icon-down-jiantou-up' : 'icon-arrow-down'
              "
            ></i>
            {{ item.symbol }} * {{ item.share }}</span
          >
          <span class="li-openprice">{{
            item.price || "0.00" | tofixedFour
          }}</span>
          <span
            class="li-nowprice"
            :class="
              item.type == 1
                ? item.update_price > item.price
                  ? 'green'
                  : 'red'
                : item.update_price <= item.price
                ? 'green'
                : 'red'
            "
            >{{ item.update_price || "0.00" | tofixedFour }}</span
          >
          <span class="li-bail">{{
            item.caution_money || "0.00" | tofixedFour
          }}</span>
          <span class="li-styprice">{{
            item.target_profit_price || "0.00" | tofixedFour
          }}</span>
          <span class="li-stsprice">{{
            item.stop_loss_price || "0.00" | tofixedFour
          }}</span>

          <span class="li-opentime">{{ item.transaction_time }}</span>
          <span class="li-rate">{{
            item.trade_fee || "0.00" | tofixedFour
          }}</span>

          <span
            class="li-loss"
            :class="['red', 'width1', { green: item.profits > 0 }]"
            >{{ item.profits || "0.00" | tofixedFour }}</span
          >
          <div class="li-todo">
            <span class="stop-btn" @click="stopLoss(item.id)">{{
              $t("lever.setloss")
            }}</span>
            <span style="margin-left: 3px" @click="pingcang(item.id)">{{
              $t("lever.ping")
            }}</span>
          </div>
        </li>

        <li
          v-for="(item, index) in list_content"
          :key="index"
          v-if="load_type == 0"
          class="flex alcenter"
        >
          <span
            class="li-type"
            style="text-align: left; line-height: 25px"
            :class="item.type == 1 ? 'green' : 'red'"
            ><i
              class="iconfont"
              :class="
                item.type == 1 ? 'icon-down-jiantou-up' : 'icon-arrow-down'
              "
            ></i>
            {{ item.symbol }} * {{ item.share }}</span
          >

          <span class="li-openprice">{{
            item.price || "0.00" | tofixedFour
          }}</span>
          <span
            class="li-nowprice"
            :class="
              item.type == 1
                ? item.update_price > item.price
                  ? 'green'
                  : 'red'
                : item.update_price <= item.price
                ? 'green'
                : 'red'
            "
            >{{ item.update_price || "0.00" | tofixedFour }}</span
          >
          <span class="li-bail">{{
            item.caution_money || "0.00" | tofixedFour
          }}</span>
          <span class="li-styprice">{{
            item.target_profit_price || "0.00" | tofixedFour
          }}</span>
          <span class="li-stsprice">{{
            item.stop_loss_price || "0.00" | tofixedFour
          }}</span>

          <span class="li-opentime">{{ item.transaction_time }}</span>
          <span class="li-rate">{{
            item.trade_fee || "0.00" | tofixedFour
          }}</span>

          <div class="li-todo" v-if="load_type == 0">
            <span style="width: 140px" @click="cancel(item.id)">{{
              $t("lever.revoke")
            }}</span>
          </div>
          <div class="width2" v-if="load_type == 3">
            {{ $t("lever.closed") }}
          </div>
          <div class="width2" v-if="load_type == 4">
            {{ $t("lever.revoked") }}
          </div>
        </li>

        <li
          v-for="(item, index) in list_content"
          :key="index"
          v-if="load_type == 3"
          class="flex alcenter"
        >
          <span
            class="li-type"
            style="text-align: left; line-height: 25px"
            :class="item.type == 1 ? 'green' : 'red'"
            ><i
              class="iconfont"
              :class="
                item.type == 1 ? 'icon-down-jiantou-up' : 'icon-arrow-down'
              "
            ></i>
            {{ item.symbol }} * {{ item.share }}</span
          >
          <span class="li-nowprice">{{
            load_type == 3
              ? item.update_price
              : item.price || "0.00" | tofixedFour
          }}</span>
          <span class="li-openprice">{{
            item.price || "0.00" | tofixedFour
          }}</span>
          <span class="li-bail">{{
            item.caution_money || "0.00" | tofixedFour
          }}</span>
          <span class="li-stsprice">{{
            item.target_profit_price || "0.00" | tofixedFour
          }}</span>
          <span class="li-styprice">{{
            item.stop_loss_price || "0.00" | tofixedFour
          }}</span>

          <span class="li-opentime">{{ item.transaction_time }}</span>
          <span class="li-rate">{{
            item.trade_fee || "0.00" | tofixedFour
          }}</span>

          <span
            class="li-loss"
            :class="['red', 'width1', { green: item.profits > 0 }]"
            >{{ item.profits || "0.00" | tofixedFour }}</span
          >
          <span class="li-opentime">{{
            load_type == 4 ? item.complete_time : item.handle_time || "-"
          }}</span>

          <div class="li-status" v-if="load_type == 3">
            {{ $t("lever.closed") }}
          </div>
        </li>

        <li
          v-for="(item, index) in list_content"
          :key="index"
          v-if="load_type == 4"
          class="flex alcenter"
        >
          <span
            class="li-type"
            style="text-align: left; line-height: 25px"
            :class="item.type == 1 ? 'green' : 'red'"
            ><i
              class="iconfont"
              :class="
                item.type == 1 ? 'icon-down-jiantou-up' : 'icon-arrow-down'
              "
            ></i>
            {{ item.symbol }} * {{ item.share }}</span
          >
          <span class="li-openprice">{{
            load_type == 3
              ? item.update_price
              : item.price || "0.00" | tofixedFour
          }}</span>
          <span class="li-bail">{{
            item.caution_money || "0.00" | tofixedFour
          }}</span>
          <span class="li-styprice">{{
            item.target_profit_price || "0.00" | tofixedFour
          }}</span>
          <span class="li-styprice">{{
            item.stop_loss_price || "0.00" | tofixedFour
          }}</span>

          <span class="li-opentime">{{ item.transaction_time }}</span>
          <span class="li-rate">{{
            item.trade_fee || "0.00" | tofixedFour
          }}</span>

          <span
            class="li-openprice"
            v-if="load_type != 0 && load_type != 4"
            :class="['red', 'width1', { green: item.profits > 0 }]"
            >{{ item.profits || "0.00" | tofixedFour }}</span
          >
          <span class="li-opentime">{{
            load_type == 4 ? item.complete_time : item.handle_time || "-"
          }}</span>
          <div class="li-status" v-if="load_type == 4">
            {{ $t("lever.revoked") }}
          </div>
        </li>

        <li
          class="mores"
          v-if="list_content.length <= 0 && !loadingData"
          style="margin-top: 50px"
        >
          <i
            class="iconfont icon-empty1"
            style="font-size: 80px; line-height: 150px"
          ></i>
          <!--        <span v-if="load_type!=1 && load_type!=0">{{ more }}</span>-->
        </li>
      </ul>
      <div style="margin: 0 auto; text-align: center">
        <el-pagination
          small
          v-if="load_type == 3 || load_type == 4"
          :page-size="10"
          layout="prev, pager, next"
          @size-change="changePage"
          @current-change="handleCurrentChange"
          :current-page="page"
          :total="totalCount"
        >
        </el-pagination>
      </div>
      <!--      <div class="mores" v-if="list_content.length<=0">-->
      <!--        <i class="iconfont icon-empty" style="font-size: 80px;"></i>-->
      <!--&lt;!&ndash;        <span v-if="load_type!=1 && load_type!=0">{{ more }}</span>&ndash;&gt;-->
      <!--      </div>-->

      <!-- 止盈止损弹窗 -->
      <div class="loss-modal flex" v-show="modalShow">
        <div class="content">
          <div class="loss-modal-header">
            <h3>{{ $t("lever.setloss") }}</h3>
            <p @click="closeMosal()" class="curPer">X</p>
          </div>
          <div class="loss-madal-content">
            <div class="flex">
              <span>{{ $t("lever.styPrice") }}：</span>
              <p>
                <span @click="reduce(1)">-</span>
                <input
                  type="text"
                  v-model="targetProfit"
                  @input="inputValue(1)"
                />
                <span @click="add(1)">+</span>
              </p>
            </div>
            <p class="modal-text">
              {{ $t("lever.expectProfit") }}：{{ modalProfit }}
            </p>
            <div class="flex">
              <span>{{ $t("lever.stsPrice") }}：</span>
              <p>
                <span @click="reduce(2)">-</span>
                <input type="text" v-model="stopLose" @input="inputValue(2)" />
                <span @click="add(2)">+</span>
              </p>
            </div>
            <p class="modal-text">
              {{ $t("lever.expectLoss") }}：{{ modalStop }}
            </p>
          </div>
          <div class="modal-btn">
            <button type="button" @click="closeMosal()">
              {{ $t("td.canceil") }}
            </button>
            <button type="button" @click="comfirm()">
              {{ $t("td.confirm") }}
            </button>
          </div>
        </div>
      </div>
      <!-- 一键平仓弹窗 -->
      <div class="loss-modal flex" v-show="stopModal">
        <div class="content">
          <div class="loss-modal-header">
            <h5>{{ $t("lever.sureClose") }}</h5>
            <p @click="closeStopModal()">X</p>
          </div>
          <div class="stopModal">
            <span
              :class="['stopall', { alls: selectType == 'all' }]"
              @click="selectStop('all')"
              >{{ $t("lever.allClose") }}</span
            >
            <span
              :class="['stopbuy', { buys: selectType == 'buy' }]"
              @click="selectStop('buy')"
              >{{ $t("lever.moreClose") }}</span
            >
            <span
              :class="['stopsell', { sells: selectType == 'sell' }]"
              @click="selectStop('sell')"
              >{{ $t("lever.nullClose") }}</span
            >
          </div>
          <div class="stop-modal-btns">
            <button type="button" @click="closeStopModal()">
              {{ $t("td.canceil") }}
            </button>
            <button type="button" @click="comfirmModal()">
              {{ $t("td.confirm") }}
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      legal_id: "",
      currency_id: "",
      list_content: [],
      page: 1,
      lastpage: 1,
      more: this.$t("td.more"),
      modalShow: false,
      targetProfit: "",
      stopLose: "",
      modalProfit: "",
      modalStop: "",
      modalId: "",
      // 开仓价
      presentPrice: "",
      riskRate: "",
      totalPro: "",
      stopModal: false,
      selectType: "all",
      // 当前价
      openPrice: "",
      // 当前盈亏
      profitsPrice: "",
      orderType: "",
      shareNum: "",
      load_type: 1,
      loadingData: false,
      totalCount: 0,
    };
  },
  created() {
    let that = this;
    this.legal_id = localStorage.getItem("legal_id");
    this.currency_id = localStorage.getItem("currency_id");
    // this.init();
  },
  mounted() {
    let that = this;
    setTimeout(() => {
      that.load(that.load_type);
    }, 100);

    this.loads();
  },
  filters: {
    tofixed: function (val) {
      val = Number(val);
      return val.toFixed(2);
    },
    tofixedFour: function (val) {
      val = Number(val);
      return val.toFixed(4);
    },
  },
  methods: {
    // 轮询
    loads() {
      let that = this;
      that.$socket.emit("login", localStorage.getItem("user_id"));
      that.sockets.subscribe("lever_trade", (msg) => {
        if (msg.type == "lever_trade" && that.load_type == 1) {
          var datas = JSON.parse(msg.trades_all);
          that.riskRate = msg.hazard_rate;
          that.totalPro = msg.profits_all;
          that.profitsPrice = msg.profits;
          let arr = [];
          for (let i in datas) {
            if (
              that.legal_id == datas[i].legal &&
              that.currency_id == datas[i].currency
            ) {
              arr.push(datas[i]);
            }
          }
          that.list_content = arr;
        }
        if (msg.type == "lever_trade" && that.load_type == 0) {
          var datas = JSON.parse(msg.trades_entrust);
          that.riskRate = msg.hazard_rate;
          that.totalPro = msg.profits_all;
          that.profitsPrice = msg.profits;
          let arr = [];
          for (let i in datas) {
            if (
              that.legal_id == datas[i].legal &&
              that.currency_id == datas[i].currency
            ) {
              arr.push(datas[i]);
            }
          }
          that.list_content = arr;
        }
      });

      setInterval(() => {
        if (that.load_type == 0) {
          if (this.list_content.length > 0) {
          }
        }
      }, 1000);
    },

    all() {
      this.$router.push({ name: "leverTransaction" });
    },
    // 合约持仓
    links() {
      this.$router.push({ name: "leverTransactions" });
    },
    changePage(page) {
      this.page = page;
    },
    handleCurrentChange(val) {
      this.page = val;
      this.load(this.load_type);
    },
    load(type) {
      let that = this;
      if (this.load_type !== type) {
        this.load_type = type;
        this.lastpage = 1;
        this.page = 1;
      } else {
      }

      this.loadingData = true;
      this.list_content = [];
      this.$http({
        url: "/api/" + "lever/my_trade",
        method: "post",
        data: {
          status: type,
          legal_id: this.legal_id,
          currency_id: this.currency_id,
          page: this.page,
        },
        headers: { Authorization: localStorage.getItem("token") },
      })
        .then((res) => {
          console.log(res);
          that.loadingData = false;
          if (res.data.type == "ok") {
            this.more = this.$t("td.more");
            that.list_content = res.data.message.message.data;
            that.totalCount = res.data.message.message.total;
            // this.riskRate = res.data.message.hazard_rate;
            // this.totalPro = res.data.message.profits_total;
            // this.profitsPrice = res.data.message.profits;
          } else {
            layer.msg(res.data.message);
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    // 跳转交易记录
    recordList() {
      this.$router.push({ name: "leverList" });
    },

    pingcang(id) {
      let that = this;
      layer.confirm(
        that.$t("lever.sureClose"),
        {
          title: false,
          btn: [this.$t("confirm"), this.$t("legal.ceil")], //按钮
        },
        function () {
          that
            .$http({
              url: "/api/" + "lever/close",
              method: "post",
              data: {
                id: id,
              },
              headers: { Authorization: localStorage.getItem("token") },
            })
            .then((res) => {
              if (res.data.type == "ok") {
                layer.msg(res.data.message);
                location.reload();
              } else {
                layer.msg(res.data.message);
              }
            })
            .catch((error) => {
              console.log(error);
            });
        }
      );
    },
    load_more() {
      this.page++;
      this.init();
    },
    // 设置止盈止损
    stopLoss(ids) {
      let that = this;
      that.modalShow = true;
      for (let i in that.list_content) {
        if (that.list_content[i].id == ids) {
          that.shareNum = that.list_content[i].share;
          that.modalId = that.list_content[i].id;
          that.presentPrice = parseFloat(that.list_content[i].price).toFixed(2);
          that.openPrice = parseFloat(
            that.list_content[i].update_price
          ).toFixed(2);
          if (that.list_content[i].target_profit_price > 0) {
            that.targetProfit = parseFloat(
              that.list_content[i].target_profit_price
            ).toFixed(2);
          } else {
            that.targetProfit = that.openPrice;
          }
          if (that.list_content[i].stop_loss_price > 0) {
            that.stopLose = parseFloat(
              that.list_content[i].stop_loss_price
            ).toFixed(2);
          } else {
            that.stopLose = that.openPrice;
          }

          if (that.list_content[i].type == 1) {
            that.orderType = "buy";
            if (that.list_content[i].target_profit_price > 0) {
              that.modalProfit = (
                (that.targetProfit -
                  parseFloat(that.list_content[i].price) -
                  0) *
                (that.list_content[i].share - 0)
              ).toFixed(2);
            } else {
              that.modalProfit = "0.00";
            }
            if (that.list_content[i].stop_loss_price > 0) {
              that.modalStop = (
                (parseFloat(that.list_content[i].price).toFixed(2) -
                  that.stopLose -
                  0) *
                (that.list_content[i].share - 0)
              ).toFixed(2);
            } else {
              that.modalStop = "0.00";
            }
          } else {
            that.orderType = "sell";
            if (that.list_content[i].target_profit_price > 0) {
              that.modalProfit = (
                (parseFloat(that.list_content[i].price).toFixed(2) -
                  that.targetProfit -
                  0) *
                (that.list_content[i].share - 0)
              ).toFixed(2);
            } else {
              that.modalProfit = "0.00";
            }
            if (that.list_content[i].stop_loss_price > 0) {
              that.modalStop = (
                (that.stopLose - parseFloat(that.list_content[i].price) - 0) *
                (that.list_content[i].share - 0)
              ).toFixed(2);
            } else {
              that.modalStop = "0.00";
            }
          }
        }
      }
    },
    // 加
    add(type) {
      let that = this;
      if (that.orderType == "buy") {
        if (type == 1) {
          that.targetProfit = (parseFloat(that.targetProfit) + 100).toFixed(2);
          that.modalProfit = (
            (parseFloat(that.targetProfit) - that.presentPrice - 0) *
            (that.shareNum - 0)
          ).toFixed(2);
        } else {
          that.stopLose = (parseFloat(that.stopLose) + 100).toFixed(2);
          that.modalStop = (
            (that.presentPrice - that.stopLose - 0) *
            (that.shareNum - 0)
          ).toFixed(2);
        }
      } else {
        if (type == 1) {
          that.targetProfit = (parseFloat(that.targetProfit) + 100).toFixed(2);
          that.modalProfit = (
            (parseFloat(that.presentPrice - that.targetProfit) - 0) *
            (that.shareNum - 0)
          ).toFixed(2);
        } else {
          that.stopLose = (parseFloat(that.stopLose) + 100).toFixed(2);
          that.modalStop = (
            (parseFloat(that.stopLose - that.presentPrice) - 0) *
            (that.shareNum - 0)
          ).toFixed(2);
        }
      }
    },
    // 减
    reduce(type) {
      let that = this;
      if (that.orderType == "buy") {
        if (type == 1) {
          if (that.targetProfit > 0) {
            that.targetProfit = (parseFloat(that.targetProfit) - 100).toFixed(
              2
            );
            that.modalProfit = (
              (parseFloat(that.targetProfit) - that.presentPrice - 0) *
              (that.shareNum - 0)
            ).toFixed(2);
          } else {
            layer.msg(that.$t("lever.thanzone"));
          }
        } else {
          if (that.stopLose > 0) {
            that.stopLose = (parseFloat(that.stopLose) - 100).toFixed(2);
            that.modalStop = (
              (that.presentPrice - that.stopLose - 0) *
              (that.shareNum - 0)
            ).toFixed(2);
          } else {
            layer.msg(that.$t("lever.thanzone"));
          }
        }
      } else {
        if (type == 1) {
          if (that.targetProfit > 0) {
            that.targetProfit = (parseFloat(that.targetProfit) - 100).toFixed(
              2
            );
            that.modalProfit = (
              (that.presentPrice - that.targetProfit - 0) *
              (that.shareNum - 0)
            ).toFixed(2);
          } else {
            layer.msg(that.$t("lever.thanzone"));
          }
        } else {
          if (that.stopLose > 0) {
            that.stopLose = (parseFloat(that.stopLose) - 100).toFixed(2);
            that.modalStop = (
              (parseFloat(that.stopLose - that.presentPrice) - 0) *
              (that.shareNum - 0)
            ).toFixed(2);
          } else {
            layer.msg(that.$t("lever.thanzone"));
          }
        }
      }
    },
    // 输入框输入
    inputValue(type) {
      let that = this;
      if (that.orderType == "buy") {
        if (type == 1) {
          let inputModal = (
            (parseFloat(that.targetProfit) -
              parseFloat(that.presentPrice) -
              0) *
            (that.shareNum - 0)
          ).toFixed(2);
          if (inputModal > 0) {
            that.modalProfit = inputModal;
          } else {
            that.modalProfit = 0.0;
          }
        } else {
          let inputModal = (
            (parseFloat(that.presentPrice) - parseFloat(that.stopLose) - 0) *
            (that.shareNum - 0)
          ).toFixed(2);
          if (inputModal > 0) {
            that.modalStop = inputModal;
          } else {
            that.modalStop = 0.0;
          }
        }
      } else {
        if (type == 1) {
          let inputModal = (
            (parseFloat(that.presentPrice) -
              parseFloat(that.targetProfit) -
              0) *
            (that.shareNum - 0)
          ).toFixed(2);
          if (inputModal > 0) {
            that.modalProfit = inputModal;
          } else {
            that.modalProfit = 0.0;
          }
        } else {
          let inputModal = (
            (parseFloat(that.stopLose) - parseFloat(that.presentPrice) - 0) *
            (that.shareNum - 0)
          ).toFixed(2);
          if (inputModal > 0) {
            that.modalStop = inputModal;
          } else {
            that.modalStop = 0.0;
          }
        }
      }
    },
    // 关闭弹窗
    closeMosal() {
      let that = this;
      that.modalShow = false;
    },
    // 确认设置  https://www.bbankex.com/ 垃圾
    comfirm() {
      let that = this;
      this.$http({
        url: "/api/" + "lever/setstop",
        method: "post",
        data: {
          id: that.modalId,
          target_profit_price: that.targetProfit,
          stop_loss_price: that.stopLose,
        },
        headers: { Authorization: localStorage.getItem("token") },
      })
        .then((res) => {
          if (res.data.type == "ok") {
            that.modalShow = false;
            layer.msg(res.data.message);
            for (let i in that.list_content) {
              if (that.modalId == that.list_content[i].id) {
                that.list_content[i].target_profit_price = that.targetProfit;
                that.list_content[i].stop_loss_price = that.stopLose;
              }
            }
          } else {
            layer.msg(res.data.message);
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    // 一键平仓
    stopTotal() {
      let that = this;
      that.stopModal = true;
    },
    // 关闭一键平仓弹窗
    closeStopModal() {
      let that = this;
      that.stopModal = false;
    },
    // 选择平仓类型
    selectStop(types) {
      let that = this;
      that.selectType = types;
    },
    comfirmModal() {
      let that = this;
      let num = 0;
      if (that.selectType == "all") {
        num = 0;
      } else if (that.selectType == "buy") {
        num = 1;
      } else {
        num = 2;
      }
      this.$http({
        url: "/api/" + "lever/batch_close",
        method: "post",
        data: {
          type: num,
        },
        headers: { Authorization: localStorage.getItem("token") },
      })
        .then((res) => {
          if (res.data.type == "ok") {
            that.stopModal = false;
            layer.msg(res.data.message);
            that.list_content = [];
            that.init();
          } else {
            that.stopModal = false;
            layer.msg(res.data.message);
          }
        })
        .catch((error) => {
          that.stopModal = false;
          console.log(error);
        });
    },
    cancel(ids) {
      let that = this;
      this.$alert(that.$t("lever.revokeOrder"), "", {
        confirmButtonText: that.$t("cuy.confirm"),
        customClass: "modalConfirm",
        confirmButtonClass: "confirmBtn",
        closeOnClickModal: true,
        callback: (action) => {
          if (action == "confirm") {
            that
              .$http({
                url: "/api/" + "lever/cancel",
                method: "post",
                data: {
                  id: ids,
                },
                headers: { Authorization: localStorage.getItem("token") },
              })
              .then((res) => {
                layer.close(i);
                if (res.data.type == "ok") {
                  layer.msg(res.data.message);
                  setTimeout(function () {
                    that.tabClick(that.status);
                  }, 200);
                } else {
                  layer.msg(res.data.message);
                }
              })
              .catch((error) => {
                layer.close(i);
                console.log(error);
              });
          }
        },
      });
    },
  },
};
</script>
<style lang="scss" scoped>
.total-pro {
  margin-bottom: 20px;
}

/deep/ .inblock {
  span.active {
    border-bottom: 1px solid #00a4d8;
  }
}

.title {
  height: 48px;
  line-height: 46px;
  padding: 0 40px 0 30px;
  padding-left: 20px;
  padding-right: 20px;

  span {
    margin-right: 20px;
    cursor: pointer;
  }

  span:hover {
    color: #00a4d8;
    border-bottom: 1px solid #00a4d8;
  }
}

/deep/ .el-loading-mask {
  background-color: rgba(0, 0, 0, 0);
}

/deep/ .el-loading-spinner .path {
  stroke: #00a4d8;
}

/deep/ .el-pager {
  li {
    background-color: #171c2b !important;
    color: #c7cce6 !important;
    font-weight: normal;
  }

  li:hover {
    color: #00a4d8 !important;
  }

  li.active {
    color: #00a4d8 !important;
  }
}

/deep/ .el-pagination {
  button {
    background-color: #171c2b !important;
  }

  button:disabled {
    background-color: #171c2b !important;
  }

  button {
    color: #c7cce6 !important;
  }

  button:hover {
    color: #00a4d8 !important;
  }
}

.wrap {
  min-height: 500px;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}

ul li {
  padding: 8px 0;
}

ul li span {
  display: inline-block;
}

ul li div {
  display: inline-block;
}

ul li div span {
  border-radius: 3px;
  color: white;
  background-color: #00a4d8;
  cursor: pointer;
  min-height: 33px;
  min-width: 50px;
  font-size: 14px;
  border: none;
  padding: 0 5px;
  line-height: 33px;
  text-align: center;
}

.list_head {
  color: #637085;
  border-bottom: 1px solid #2e333c;

  li {
    > span {
      flex-basis: 0%;
    }
  }
}

.list_content {
  flex: 1;

  li {
    > span,
    > div {
      flex-basis: 0%;
    }
  }
}

.li-type {
  width: 13%;
  flex-grow: 13;
  white-space: nowrap;
}

.li-bail {
  width: 8%;
  flex-grow: 8;
  text-align: center;
}

.li-openprice,
.li-nowprice,
.li-stsprice,
.li-styprice {
  width: 10%;
  flex-grow: 10;
  text-align: center;
}

.li-loss,
.li-rate {
  flex-grow: 9;
  text-align: center;
}

.li-opentime {
  flex-grow: 15;
  text-align: center;
}

.li-todo {
  flex: 1;
  text-align: center;
  min-width: 150px;
}

.li-status {
  min-width: 60px;
  text-align: right;
}

.list_content {
  .li-todo {
    text-align: right;
  }

  .li-status {
    color: #00a4d8;
  }
}

.red {
  color: #cc4951;
  cursor: pointer;
}

.green {
  color: #0d8551;
}

.stop-btn {
}

.nextlink span:hover {
  color: #00a4d8;
}

.mores {
  color: #999;
  font-size: 14px;
  margin-top: 10px;
  cursor: pointer;
  text-align: center;
}

.mores img {
  width: 120px;
  height: 120px;
  margin: 30px auto 0;
}

.mores span {
  display: block;
  text-align: center;
}

.width1 {
  width: 8%;
  text-align: center;
}

.width2 {
  width: 13%;
  text-align: center;
}

.width3 {
  width: 21%;
  text-align: center;
}

.loss-modal {
  width: 100%;
  height: 100%;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.7);
  justify-content: center;
  align-items: center;
  color: #c7cce6;
}

.loss-modal {
  .content {
    width: 500px;
    background-color: #171c2b;
    margin: 0 auto;
    border-radius: 5px;
  }
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

.loss-madal-content {
  margin: 0 15px;
  padding-bottom: 10px;
}

.loss-madal-content div {
  line-height: 40px;
  margin-bottom: 10px;
}

.loss-madal-content div p {
  display: inline-block;
  border: 1px solid #2e333c;
  border-radius: 3px;
  height: 40px;
  position: relative;
}

.loss-madal-content p span {
  display: inline-block;
  width: 60px;
  text-align: center;
  font-size: 30px;
  position: relative;
  top: -3px;
  cursor: pointer;
}

.loss-madal-content input {
  background-color: rgba(0, 0, 0, 0);
  border-left: 1px solid #2e333c;
  border-right: 1px solid #2e333c;
  line-height: 40px;
  position: relative;
  top: -8px;
  color: #c7cce6;
  text-align: center;
}

.modal-text {
  width: 100%;
  text-align: center;
  line-height: 60px;
}

.modal-btn {
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  font-size: 0;
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
  background: #00a4d8;
}

.total-pro button {
  border-radius: 3px;
  color: white;
  background-color: #638bd4;
  cursor: pointer;
  min-height: 33px;
  min-width: 80px;
  font-size: 14px;
  border: none;
  padding: 0 5px;
  line-height: 33px;
  text-align: center;
}

.stopModal {
  margin: 20px 15px;
  text-align: center;
  padding-bottom: 20px;
}

.stopModal span {
  padding: 6px 15px;
  border-radius: 4px;
}

.stopall {
  border: 1px solid #638bd4;
  color: #638bd4;
  margin-right: 10px;
}

.all {
  border-width: 0;
}

.alls {
  color: #fff;
  background-color: #638bd4;
}

.stopbuy {
  border: 1px solid #0d8551;
  color: #0d8551;
  margin-right: 10px;
}

.buys {
  color: #fff;
  background-color: #0d8551;
}

.stopsell {
  border: 1px solid #cc4951;
  color: #cc4951;
}

.sells {
  color: #fff;
  background-color: #cc4951;
}

.stop-modal-btns {
  width: 100%;
  font-size: 0;
}

.stop-modal-btns button {
  width: 50%;
  float: left;
  font-size: 14px;
  line-height: 40px;
  background-color: #9db5c7;
  border: none;
  outline: none;
  color: #fff;
}

.stop-modal-btns button:last-child {
  background-color: #689cf1;
}
</style>
