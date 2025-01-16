<template>
  <div class="home">

    <div class="main">
      <tv></tv>
      <div class="flex" style="height: auto;">
        <div class="tv-box">
          <div style="display: flex; flex-direction: column; margin-top:0;">

            <div class="flex">
              <div class="tran-box" style="min-height: 160px">
                <transactions :leverTradeId="leverTradeId"></transactions>
              </div>
            </div>
          </div>
        </div>
        <div class="exchange-box">
          <trade :leverTradeId="leverTradeId" :currencyName="currencyName"></trade>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
import indexHeader from "@/view/indexHeader";
import notice from "@/view/lever/lever_noticeList";
import deal from "@/view/deal";
import market from "@/view/lever/lever_market";
import chart from "@/view/chart";
import entrust from "@/view/lever/lever_entrust";
import hisentrust from "@/view/lever/lever_hisentrust";
import detail from "@/view/detail";
import currency from "@/view/currency";
import complete from "@/view/complete";
import leverTransaction from "@/view/lever/lever_transaction";
import leverTransactions from "@/view/lever_transactions";

// import kline from "@/view/lever/lever_kline";
import tv from '../view/tv';
import trade from "@/mhyjy/second-trade";
import transactions from "@/mhyjy/second_transactions";

export default {
  name: "dealCenter",
  components: {
    indexHeader,
    load: 1,
    notice,
    deal,
    tv,
    market,
    trade,
    chart,
    entrust,
    hisentrust,
    detail,
    currency,
    complete,
    leverTransaction,
    leverTransactions,
    transactions,
    // kline
  },
  data() {
    return {
      isRouterAlive: true,
      currencyName: "",
      leverTradeId: 0,
      leverData: {
        legalId: 0,
        currencyId: 0
      },
      token: ""
    };
  },
  created() {
    this.address = localStorage.getItem("address") || "";

    this.token = localStorage.getItem("token");

    this.leverData.legalId = localStorage.getItem('legal_id');
    this.leverData.currencyId = localStorage.getItem('currency_id');
  },
  methods: {
    init() {
      var that = this;
      this.$http({
        url: "/api/currency/quotation_new",
        method: "get",
        data: {}
      }).then(res => {
        if (res.data.type == "ok") {
          var arr = [];
          var arr2 = [];
          for (var i = 0; i < res.data.message.length; i++) {
            for (var j = 0; j < res.data.message[i].quotation.length; j++) {
              if (res.data.message[i].quotation[j].is_display == 1) {
                arr.push(res.data.message[i].quotation[j]);
                if (
                    that.leverData.legalId == res.data.message[i].quotation[j].legal_id && that.leverData.currencyId == res.data.message[i].quotation[j].currency_id) {
                  that.symbol =
                      res.data.message[i].quotation[j].currency_name +
                      "/" +
                      res.data.message[i].quotation[j].legal_name;
                  that.leverTradeId = res.data.message[i].quotation[j].id;
                  that.currencyName = res.data.message[i].quotation[j].currency_name;
                }
              }
            }
          }
          that.quotationList = arr;
          if (that.symbol == "") {
            that.symbol = arr[0].currency_name + "/" + arr[0].legal_name;
            that.leverData.legalId = arr[0].legal_id;
            that.leverData.currencyId = arr[0].currency_id;
            that.leverTradeId = arr[0].id;
            that.currencyName = arr[0].currency_name;
          }
        }
      })
          .catch(error => {
          });
    },
  },
  mounted() {
    this.init()
  }
};
</script>

<style scoped lang="scss">
.home {
  margin-bottom: 3px;

  .main {
    > div {
      justify-content: space-between;

      > div {
      }

      margin-top: 3px;

      .tv-box {
        width: calc(100% - 406px);
        height: auto;
        background:#1b2c42;
      }

      .exchange-box {
        width: 403px;
        // height: 735px;
        background: #1b2c42;
      }

      .tran-box {
        width: calc(100%);
        height: 650px;
        background: #1b2c42;
      }

      .trade-box {
        width: 485px;
        height: 650px;
      }
    }

  }
}

</style>
