<template>
  <div class="exchange">
    <!-- <div class="title fColor1">交易所</div> -->
    <div class="content fColor1">
      <div class="new_price">
        <span class="ft14">{{ $t('handicap') }}</span>
      </div>
      <div class="exchange_title ft12 clear tc">
        <span>{{ $t('center.direction') }}</span>
        <span>{{ $t('price') }}</span>
        <span>{{ $t('number') }}</span>
      </div>
      <ul class="list-item ft12 tc">
        <li class="curPer" v-for="(out,index) in outlist" :key="out.id" @click="price(out.price)">
          <span class="red">{{ $t('center.sellout') }} {{ outlist.length - index }}</span>
          <span>{{ out[0] | tofixedFour }}</span>
          <span>{{ out[1] | tofixedFour }}</span>

          <span class="info-shadow selli" :style="{width:(out[1]/sellMaxValue-0)*100+'%'}"></span>
        </li>
        <div class="line green">
          {{ newData|tofixedN(6) }} <span
            style="font-size: 12px; color:#a7a7a7;"> USDT</span>
        </div>
        <li class="curPer" v-for="(buy,index) in inlist" :key="index" @click="price(buy.price)">
          <span class="green">{{ $t('center.buyin') }} {{ index + 1 }}</span>
          <span>{{ buy[0] | tofixedFour }}</span>
          <span>{{ buy[1] | tofixedFour }}</span>
          <span class="info-shadow" :style="{width:(buy[1]/inMaxValue-0)*100+'%'}"></span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "exchange",
  data() {
    return {
      outlist: [],
      inlist: [],
      load: 1,
      newData: 0,
      rmbRate: '6',
      currency_name: "",
      legal_name: "",
      currency_id: "",
      legal_id: "",
      sellMaxValue: 0,
      inMaxValue: 0
    };
  },
  watch: {
    rmbRate: val => {
      console.log('dsa');
      eventBus.$emit('receiveRate', val);
    }
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
    tofixedN: function (val, n) {
      val = Number(val);
      return val.toFixed(n);
    },
  },
  mounted: function () {
    var that = this;
  },
  created: function () {
    let that = this;
    let local_lid = window.localStorage.getItem("lever_l_id"),
        local_cid = window.localStorage.getItem("lever_c_id");
    that.legal_id = localStorage.getItem("legal_id");
    that.currency_id = localStorage.getItem("currency_id");
    that.legal_name = localStorage.getItem("legal_name");
    that.currency_name = localStorage.getItem("currency_name");
    that.buy_sell(that.legal_id, that.currency_id);
    that.connect(that.legal_id, that.currency_id);
    that.upPrice(that.legal_id, that.currency_id);

  },
  methods: {
    price(price) {
      eventBus.$emit("toPrice", price);
    },
    // 第一次默认最新价数据
    buy_sell(legals_id, currencys_id) {
      let that = this;
      this.$http({
        url: "/api/" + "lever/deal",
        method: "post",
        data: {
          legal_id: legals_id,
          currency_id: currencys_id
        },
        headers: {Authorization: localStorage.getItem("token")}
      }).then(res => {
            if (res.data.type == "ok") {
              that.inlist = res.data.message.lever_transaction.in;
              that.outlist = res.data.message.lever_transaction.out;
              that.newData = res.data.message.last_price;
              that.rmbRate = res.data.message.ExRAte;
              window.localStorage.setItem('lastPrice', that.newData);
              that.buyInfo.buyPrice = 0;
              that.buyInfo.buyNum = 0;
              that.connect(
                  legals_id,
                  currencys_id
              );
            } else if (res.data.type == "999") {
              this.$router.push("/components/login");
            } else {
              layer.msg(res.data.message);
            }
          })
          .catch(error => {
            // console.log(error)
          });
    },

    connect(legal_id, currency_id) {
      var that = this;
      that.$socket.emit("login", localStorage.getItem("user_id"));
      that.sockets.subscribe("market_depth", msg => {
        if (msg.type == "market_depth") {
          // console.log(msg)
          //组件间传值
          let newPrice = {
            newprice: msg.last_price,
            newup: msg.proportion,
            istoken: msg.token,
            yesprice: msg.yesterday,
            toprice: msg.today
          };
          // setTimeout(() => {
          //   eventBus.$emit("toNew01", newPrice);
          // }, 1000);
          // console.log(msg);
          let inData = msg.bids;
          let outData = msg.asks.reverse();
          if (msg.currency_id == currency_id && msg.legal_id == legal_id) {
            let[inlist,outList] = [inData,outData];
            let [max, max1] = [0, 0];
            for (let i in inData) {
              // console.log(that.inMaxValue, inData[i], '变更');

              inlist[i].price = inlist[i][0];
              inlist[i].number = inlist[i][1];
              max = inlist[i].number > max ? inlist[i].number : max;

            }

            that.inMaxValue = max;
            that.inlist = inlist;

            for (let i in outList) {
              outList[i].price = outList[i][0];
              outList[i].number = outList[i][1];
              max1 = outList[i].number > max1 ? outList[i].number : max;
              that.sellMaxValue = outList[i].number;

            }
            that.sellMaxValue = max1;
            that.outlist = outList;
          }
        }
      });
      that.sockets.subscribe('kline', msg => {
        if (msg.type == 'kline') {
          // console.log('kline',msg.symbol,localStorage.getItem('symbol'))
          // var symbols = $('.trade-name').text();
          if (msg.symbol == localStorage.getItem('symbol')) {
            that.newData = msg.close;
          }
        }
      })

      that.sockets.subscribe('market_depth', msg => {
        if (msg.symbol == localStorage.getItem('symbol')) {

        }
      });
    },
    // 更新最新价
    upPrice(legal_id, currency_id) {
      var that = this;
      that.$socket.emit("login", localStorage.getItem("user_id"));
      that.$socket.on("kline", msg => {
        if (msg.type == "kline") {
          if (msg.currency_id == currency_id && msg.legal_id == legal_id) {
            that.newData = msg.close;
            window.localStorage.setItem('lastPrice', that.newData);
          }
        }
      });
    },

  },
};
</script>

<style lang="scss" scoped>
.title {
  height: 48px;
  line-height: 48px;
  padding: 0 10px 0 30px;
  background-color: #181b2a;
}

.content {
  padding: 0px;
}

.exchange {
  width: 230px;
  background: #1b2c42;
  height: 100%;
}

.new_price {
  height: 40px;
  line-height: 40px;
  border-bottom: 1px solid #303b4b;
  padding: 0 0 0 20px;
  color: #00a4d8;
}

.exchange_title {
  line-height: 25px;
  position: relative;
  color: #637085;
}

.list-item li {
  line-height: 25px;
  overflow: hidden;
  position: relative;

  .info-shadow {
    height: 100%;
    background: rgba(53, 182, 90, .3);
    position: absolute;
    top: 0;
    right: 0;
    z-index: 0;
    transition: 0.2s;
  }

  .info-shadow.selli {
    height: 100%;
    background: rgba(255, 73, 74, .3);
    position: absolute;
    top: 0;
    right: 0;
    z-index: 0;
  }
}

.list-item li span,
.exchange_title span {
  width: 33.3%;
  display: block;
  float: left;
}

.green {
  color: #55a067;
}

.red {
  color: #cc4951;
}

.list-item li:hover {
  background-color: #2b3648;
}

.line {
  line-height: 40px;
  text-align: left;
  padding-left: 30px;
  font-size: 16px;
}
</style>