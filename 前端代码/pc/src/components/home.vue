<template>
  <div class="indexBlackes">
    <indexHeader></indexHeader>
    <router-view></router-view>
    <indexFooter></indexFooter>
  </div>
</template>
<script>
import indexHeader from "@/view/indexHeader";
import homeContent from "@/view/homeContent";
import indexFooter from "@/view/indexFooter";

export default {
  name: "home",
  data() {
    return {};
  },
  methods: {
    init() {
      var that = this;
      this.$http({
        url: "/api/" + "currency/quotation_new",
        method: "get",
        data: {},
        // headers: { Authorization: localStorage.getItem("token") }
      })
        .then((res) => {
          if (res.data.type == "ok") {
            var arr = [];
            var arr2 = [];
            for (var i = 0; i < res.data.message.length; i++) {
              for (var j = 0; j < res.data.message[i].quotation.length; j++) {
                arr.push(res.data.message[i].quotation[j]);
              }
            }
            that.quotationList = arr;
            that.marketSocket();
          }
        })
        .catch((error) => {});
    },
    // 行情socket
    marketSocket() {
      //				console.error('开始调用ws');
      var that = this;
      that.$socket.emit("login", localStorage.getItem("user_id"));

      that.sockets.subscribe("daymarket", (msg) => {
        //					console.error('收到回调')
        if (msg.type == "daymarket") {
          for (var i = 0; i < that.quotationList.length; i++) {
            if (
              that.quotationList[i].legal_id == msg.legal_id &&
              that.quotationList[i].currency_id == msg.currency_id
            ) {
              that.quotationList[i].now_price = msg.now_price;
              that.quotationList[i].change = msg.change;
              that.quotationList[i].volume = msg.volume;
              that.quotationList[i].high = msg.high;
              that.quotationList[i].low = msg.low;
            }
          }
        }
      });
    },
  },
  components: { indexHeader, homeContent, indexFooter },
  created() {
    this.$http({
      url: "/api/" + "currency/quotation_new",
      method: "get",
      data: {},
      headers: { Authorization: localStorage.getItem("token") },
    })
      .then((res) => {
        if (res.data.type == "ok") {
          this.tabList = res.data.message;
          var msg = res.data.message;
          var arr_quota = [];
          for (var i = 0; i < msg.length; i++) {
            arr_quota[i] = msg[i].quotation;
          }
          if (
            !localStorage.getItem("legal_id") &&
            !localStorage.getItem("currency_id") &&
            !localStorage.getItem("legal_name") &&
            !localStorage.getItem("currency_name")
          ) {
            window.localStorage.setItem(
              "legal_id",
              msg[0].quotation[0].legal_id
            );
            window.localStorage.setItem(
              "currency_id",
              msg[0].quotation[0].currency_id
            );
            window.localStorage.setItem(
              "legal_name",
              msg[0].quotation[0].legal_name
            );
            window.localStorage.setItem(
              "currency_name",
              msg[0].quotation[0].currency_name
            );
            var symbol =
              msg[0].quotation[0].currency_name +
              "/" +
              msg[0].quotation[0].legal_name;
            // var priceScale=Math.pow(10,5);
            var priceScale = 100000;
            window.localStorage.setItem("priceScale", priceScale);
            window.localStorage.setItem("symbol", symbol);
          }
        }
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>


// WEBPACK FOOTER //
// src/components/home.vue
