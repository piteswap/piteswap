<template>
  <div class="home">
    <div class="main">
      <div class="main-top flex">
        <div class="tv-box lever">
          <tv></tv>
        </div>
      </div>
      <div class="main-bottom flex">
        <div class="tran-box">
          <leverTransactions></leverTransactions>
        </div>
        <div class="trade-box" style="background: #1b2c42">
          <trade></trade>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import indexHeader from "@/view/indexHeader";
import notice from "@/view/lever/lever_noticeList";
import deal from "@/view/deal";
import exchange from "@/view/lever/lever_exchange";
import market from "@/view/lever/lever_market";
import trade from "@/view/lever/lever_trade";
import chart from "@/view/chart";
import entrust from "@/view/lever/lever_entrust";
import hisentrust from "@/view/lever/lever_hisentrust";
import detail from "@/view/detail";
import currency from "@/view/currency";
import complete from "@/view/complete";
import leverTransaction from "@/view/lever/lever_transaction";
import leverTransactions from "@/view/lever_transactions";

import tv from '../view/tv'

export default {
  name: "dealCenter",
  components: {
    indexHeader,
    load: 1,
    notice,
    deal,
    tv,
    exchange,
    market,
    trade,
    chart,
    entrust,
    hisentrust,
    detail,
    currency,
    complete,
    leverTransaction,
    leverTransactions
  },
  data() {
    return {
      isRouterAlive: true
    };
  },
  created() {
    this.address = localStorage.getItem("address") || "";
  },
  methods: {},
  mounted() {

  }
};
</script>

<style lang="scss">
.lever {
}

.home {
  // margin-bottom: 3px;

  .main {
    > div {
      justify-content: space-between;

      margin-top: 3px;

      .tv-box {
        width: 100%;
        height: auto;
      }

      .exchange-box {
        width: 403px;
        height: auto;
        padding-bottom: 10px;
      }

      .tran-box {
        background: #1b2c42;
        flex: 1;
      }

      .trade-box {
        width: 350px;
        margin-left: 3px;
      }
    }

  }
}

</style>