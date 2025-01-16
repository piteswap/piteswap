<template>
  <div id="c2c-box" class="flex">
    <div class="c2c-l">
      <left></left>
    </div>
    <div class="c2c-r">
      <div class="listbox">
        <div class="flex flextitle">
          <span>{{$t('c2c.type')}}</span>
          <span class="tc">{{$t('c2c.num')}}</span>
          <span class="tc">{{$t('legal.totalmoney')}}</span>
          <span class="tc">{{$t('c2c.payType')}}</span>
          <span class="tc">{{$t('time')}}</span>
          <span class="tc">{{$t('status')}}</span>
          <span class="tr">{{$t('do')}}</span>
        </div>
        <ul>
          <li v-for="(item,index) in list" :key="index" class="flex alcenter curPer">
            <div class="flex alcenter">
              <p class="head">{{item.type=='sell'?$t('c2c.sell'):$t('c2c.buy')}}</p>
              <span class="currencyName ml5">{{item.currency_name}}</span>
            </div>
            <div class="flex center tc">
              <span class="light_blue sellerName">{{item.deal_money || '0.00' | tofixed}}</span>
            </div>
            <div class="tc">{{item.price || '0.00' | tofixed}}</div>
            <div class="tc">
              <img v-if="item.way_name == $t('legal.alipay')" src="../../assets/images/zfb_icon.png">
              <img v-if="item.way_name == $t('legal.wechat')" src="../../assets/images/wx_icon.png">
              <img v-if="item.way_name == $t('c2c.bankcard')" src="../../assets/images/bank_icon.png">
            </div>
            <div class="tc">{{item.create_time}}</div>
            <div class="tc">
              <div v-if="item.is_sure==0">{{$t('legal.nofinish')}}</div>
              <div v-if="item.is_sure==1">{{$t('legal.finished')}}</div>
              <div v-if="item.is_sure==2">{{$t('legal.ceiled')}}</div>
              <div v-if="item.is_sure==3">{{$t('legal.payed')}}</div>
            </div>
            <div class="tr" @click="modals(item.id)">
              <button class="detail-btn" type="button">{{$t('c2c.detail')}}</button>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <!-- 详情弹窗 -->
    <div class="modals flex" v-show="modalShow">
      <div class="modals-content">
        <div class="modal-header">
          <h3>{{$t('c2c.detail')}}</h3>
          <p @click="closes()">X</p>
        </div>
        <!-- 不带按钮的订单详情 -->
        <div class="pay-cannel" v-show="payContent.type == 'buy'" v-if="payContent.type == 'buy'">
          <div>
            <span class="modals-left">{{$t('status')}}：</span>
            <span v-if="payContent.is_sure == 0">{{$t('legal.nofinish')}}</span>
            <span v-if="payContent.is_sure == 1">{{$t('legal.finished')}}</span>
            <span v-if="payContent.is_sure == 2">{{$t('legal.ceiled')}}</span>
            <span v-if="payContent.is_sure == 3">{{$t('legal.payed')}}</span>
          </div>
          <div>
            <span class="modals-left">{{$t('legal.total')}}：</span>
            {{payContent.deal_money || '0.00' | tofixed}}
          </div>
          <div>
            <span class="modals-left">{{$t('c2c.name')}}：</span>
            {{payContent.user_cash_info.real_name}}
          </div>
          <div v-if="payContent.user_cash_info.bank_account">
            <span class="modals-left">{{$t('set.cnum')}}：</span>
            {{payContent.user_cash_info.bank_account}}
          </div>
          <div v-if="payContent.user_cash_info.wechat_account">
            <span class="modals-left">{{$t('c2c.wx')}}：</span>
            {{payContent.user_cash_info.wechat_account}}
          </div>
          <div v-if="payContent.user_cash_info.alipay_account">
            <span class="modals-left">{{$t('c2c.ailipay')}}:</span>
            {{payContent.user_cash_info.alipay_account}}
          </div>
          <div>
            <span class="modals-left">{{$t('c2c.connect')}}：</span>
            {{payContent.phone}}
          </div>
        </div>

        <!-- 带按钮的订单状态 -->
        <div
          class="pay-complete"
          v-show="payContent.type == 'sell'"
          v-if="payContent.type == 'sell'"
        >
          <div>
            <span class="modals-left">{{$t('status')}}：</span>
            <span v-if="payContent.is_sure == 0">{{$t('legal.nofinish')}}</span>
            <span v-if="payContent.is_sure == 1">{{$t('legal.finished')}}</span>
            <span v-if="payContent.is_sure == 2">{{$t('legal.ceiled')}}</span>
            <span v-if="payContent.is_sure == 3">{{$t('legal.payed')}}</span>
          </div>
          <div>
            <span class="modals-left">{{$t('legal.total')}}：</span>
            {{payContent.deal_money || '0.00' | tofixed}}
          </div>
          <div>
            <span class="modals-left">{{$t('price')}}：</span>
            {{payContent.price || '0.00' | tofixed}}
          </div>
          <div>
            <span class="modals-left">{{$t('number')}}：</span>
            {{payContent.number || '0.00' | tofixed}}{{payContent.currency_name}}
          </div>
          <div>
            <span class="modals-left">{{$t('time')}}：</span>
            {{payContent.format_create_time}}
          </div>
          <div>
            <span class="modals-left">{{$t('c2c.connect')}}参考号：</span>
            {{payContent.id}}
          </div>
          <div>
            <span class="modals-left">{{$t('c2c.connect')}}：</span>
            {{payContent.phone}}
          </div>
        </div>
        <!-- 按钮 -->
        <div class="btns" v-show="modalBtnShow">
          <button type="button" @click="comfirm(payContent.id)">{{$t('legal.surepay')}}</button>
        </div>
        <div class="btns" v-show="pannelShow">
          <button type="button" @click="cannel(payContent.id)">{{$t('legal.orderceil')}}</button>
          <button type="button" @click="payComfirm(payContent.id)">{{$t('legal.mypayed')}}</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import left from "@/view/c2c/leftc2c";
import Vue from "vue";
Vue.filter("circle", function(value) {
  return value.substring(0, 1);
});
export default {
  components: { left },
  data() {
    return {
      token: "",
      current: 0,
      type: "sell",
      page: 1,
      list: [],
      legal_id: "",
      classify: "求购",
      ids: "",
      payContent: {},
      modalShow: false,
      pannelShow: false,
      modalBtnShow: false
    };
  },
   filters: {
    tofixed: function(val) {
      val = Number(val);
      return val.toFixed(2);
    },
    tofixedFour: function(val) {
      val = Number(val);
      return val.toFixed(4);
    }
  },
  created() {
    let that = this;
    that.token = window.localStorage.getItem("token") || "";
    that.ids = this.$route.query.id;
    if (that.token == "") {
      this.$router.push("/components/login");
    }
    that.getList(that.ids);
  },
  methods: {
    changeType(index, type, title) {
      this.current = index;
      this.classify = title;
      this.type = type;
      this.list = [];
      this.page = 1;
      this.getList(type);
    },
    // 获取买入列表
    getList(ids) {
      let that = this;
      let page = 1;
      let i = layer.load();
      this.$http({
        url: "/api/c2c/legal_send_deal_list?&page=" + that.page + "&id=" + ids,
        method: "get",
        headers: { Authorization: this.token }
      }).then(res => {
        layer.close(i);
        if (res.data.type == "ok") {
          let listdata = res.data.message.data;
          if (listdata.length != 0) {
            this.list = this.list.concat(listdata);
            this.page += 1;
          }
        }
      });
    },
    // 下单
    order(id) {
      var that = this;
      layer.confirm(
        "确认下单吗？",
        {
          btn: [that.$t('confirm'), that.$t('legal.ceil')] //按钮
        },
        function() {
          that.sureOrder(id);
        },
        function() {
          // layer.msg('取消成功');
        }
      );
    },
    // 下单请求
    sureOrder(id) {
      var i = layer.load();
      this.$http({
        url: "/api/c2c/do_legal_deal",
        method: "post",
        data: { id: id },
        headers: { Authorization: this.token }
      }).then(res => {
        layer.close(i);
        if (res.data.type == "ok") {
          layer.msg(res.data.message);
        } else {
          layer.msg(res.data.message);
        }
      });
    },
    // 弹窗内容
    modals(ids) {
      let that = this;
      let i = layer.load();
      this.$http({
        url: "/api/c2c_deal?&id=" + ids,
        method: "get",
        headers: { Authorization: this.token }
      }).then(res => {
        layer.close(i);
        if (res.data.type == "ok") {
          that.modalShow = true;
          that.payContent = res.data.message;
          // 判断按钮是否显示
          if (res.data.message.is_sure == 3 &&res.data.message.type == "sell") {
            that.modalBtnShow = true;
          } else {
            that.modalBtnShow = false;
          }
          if (res.data.message.is_sure == 0 && res.data.message.type == "buy") {
            that.pannelShow = true;
          } else {
            that.pannelShow = false;
          }
        }
      });
    },
    // 关闭弹窗
    closes() {
      this.modalShow = false;
    },
    // 确认收款
    comfirm(ids) {
      let that = this;
      layer.confirm(
        "请确认买家已向您付款？",
        {
          btn: [that.$t('legal.surepay'), that.$t('legal.ceil')] //按钮
        },
        function() {
          let i = layer.load();
          that.$http({
            url: "/api/c2c/legal_deal_sure",
            method: "post",
            data: { id: ids },
            headers: { Authorization: that.token }
          }).then(res => {
            layer.close(i);
            if (res.data.type == "ok") {
              layer.msg(res.data.message);
              that.modalShow = false;
              setTimeout(function() {
               that.getList(that.ids);
              }, 500);
            } else {
              layer.msg(res.data.message);
            }
          });
        },
        function() {
          // layer.msg('取消成功');
        }
      );
    },
  //  取消订单
  cannel(ids){
    let that = this;
    layer.confirm(
        that.$t('legal.ceilnot'),
        {
          btn: ["取消确认",  that.$t('legal.ceil')] //按钮
        },
        function() {
          let i = layer.load();
          that.$http({
            url: "/api/c2c/user_legal_pay_cancel",
            method: "post",
            data: { id: ids },
            headers: { Authorization: that.token }
          }).then(res => {
            layer.close(i);
            if (res.data.type == "ok") {
              layer.msg(res.data.message);
              that.modalShow = false;
              setTimeout(function() {
               that.getList(that.ids);
              }, 500);
            } else {
              layer.msg(res.data.message);
            }
          });
        },
        function() {
          // layer.msg('取消成功');
        }
      );
  },
  // 买家付款确认
  payComfirm(ids){
    let that = this;
    layer.confirm(
        "付款确认后请尽快向卖家付款,恶意点击将直接冻结账户？",
        {
          btn: ["付款确认", "取消"] //按钮
        },
        function() {
          let i = layer.load();
          that.$http({
            url: "/api/c2c/user_legal_pay",
            method: "post",
            data: { id: ids },
            headers: { Authorization: that.token }
          }).then(res => {
            layer.close(i);
            if (res.data.type == "ok") {
              layer.msg(res.data.message);
              that.modalShow = false;
              setTimeout(function() {
               that.getList(that.ids);
              }, 500);
            } else {
              layer.msg(res.data.message);
            }
          });
        },
        function() {
          // layer.msg('取消成功');
        }
      );
  },

  }
};
</script>
<style lang='scss'>
#c2c-box {
  margin: 10px 0 10px;
  color: #c7cce6;
  .ml5 {
    margin-left: 5px;
  }
  .detail-btn{
    border-radius: 3px;
    color: white;
    background-color: #638BD4;
    cursor: pointer;
    min-height: 33px;
    min-width: 80px;
    font-size: 14px;
    font-weight: 600;
    border: none;
  }
  .c2c-r {
    .title-top {
      p {
        margin-right: 30px;
        padding: 5px 0;
        cursor: pointer;
      }
    }
    .coin-select {
      p {
        margin-right: 10px;
        cursor: pointer;
      }
      .select {
        color: #7a98f7;
      }
    }
    .listbox {
      .flextitle {
        padding: 20px 0;
        border-bottom: 1px solid #242840;
        span {
          flex: 1;
        }
      }
      li {
        padding: 15px 0;
        > div {
          flex: 1;
          line-height: 36px;
        }
        .head {
          width: 36px;
          height: 36px;
          border-radius: 50%;
          margin-right: 10px;
          background: #5d8cc2;
          color: #fff;
          text-align: center;
          font-size: 14px;
        }
        .btn {
          border-radius: 3px;
          color: white;
          background-color: #638bd4;
          cursor: pointer;
          min-height: 33px;
          min-width: 80px;
          font-size: 14px;
          font-weight: 600;
          border: none;
        }
      }
      li:nth-child(even) {
        background: #242840;
      }
      li:last-child {
        border-bottom: 1px solid #242840;
      }
    }
  }

  > .c2c-l {
    margin: 0 10px;
    padding: 10px;
    background: #181b2a;
    width: 23%;
    li {
      padding: 0 20px;
      justify-content: space-between;
      cursor: pointer;
      .redColor {
        margin-left: 10px;
      }
      &:hover {
        background: rgb(38, 42, 66);
      }
    }
  }
  > .c2c-r {
    padding: 10px 30px;
    background: #181b2a;
    margin-right: 10px;
    width: 77%;
  }
  // 弹窗
  .modals {
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
    .modals-content {
      width: 500px;
      background-color: #262a42;
      margin: 0 auto;
      border-radius: 5px;
      .modal-header {
        line-height: 40px;
        text-align: center;
        position: relative;
        p {
          position: absolute;
          right: 10px;
          top: 0;
        }
      }
      .pay-cannel {
        margin: 0 15px;
        padding-bottom: 10px;
        div {
          line-height: 40px;
        }
      }
      .pay-complete {
        margin: 0 15px;
        padding-bottom: 10px;
        div {
          line-height: 40px;
        }
      }
      .modals-left {
        width: 100px;
        display: inline-block;
      }
      .btns {
        line-height: 40px;
        margin: 0 15px;
        padding-bottom: 10px;
        button {
          border-radius: 3px;
          color: white;
          background-color: #638bd4;
          cursor: pointer;
          min-height: 33px;
          min-width: 80px;
          font-size: 14px;
          font-weight: 600;
          border: none;
          padding: 0 10px;
        }
      }
    }
  }
}
</style>





// WEBPACK FOOTER //
// src/view/c2c/c2cDetail.vue