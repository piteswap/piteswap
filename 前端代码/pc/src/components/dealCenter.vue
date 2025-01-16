<template>
  <div style="margin-top: 3px;">
    <div>
      <tv></tv>
    </div>
    <div class="flex" style="margin:3px 0;">
      <div style="flex:1;">
        <div class="entrusts">
          <div class="tab-entrust">
          <span class="fColor1"  :class="{active:whichEntrust == 'entrust'}"
                @click="whichEntrust = 'entrust'">{{ $t('center.cdel') }}</span>
            <span  class="fColor1" :class="{active:whichEntrust == 'hisentrust'}"
                  @click="whichEntrust = 'hisentrust'">{{ $t('center.hdeal') }}</span>
          </div>
          <div class="scroll flex column" style="flex: 1;">

            <div class="entrust-box" v-if="whichEntrust == 'entrust'">
              <entrust></entrust>
            </div>
            <div class="histentrust-box" v-if="whichEntrust == 'hisentrust'">
              <hisentrust></hisentrust>
            </div>
          </div>
        </div>
      </div>
      <div>
        <trade></trade>
      </div>
    </div>
  </div>

</template>

<script>
import indexHeader from "@/view/indexHeader";
import notice from "@/components/noticeList";
import deal from "@/view/deal";
import exchange from "@/view/exchange";
import trade from "@/view/trade";
import chart from "@/view/chart";
import entrust from "@/view/entrust";
import hisentrust from "@/view/hisentrust";
import currency from "@/view/currency";
import complete from "@/view/complete";
import tv from "@/view/tv";

export default {
  name: "dealCenter",
  components: {
    indexHeader,
    load: 1,
    notice,
    deal,
    exchange,
    // market,
    trade,
    chart,
    entrust,
    hisentrust,
    // detail,
    currency,
    complete,
    // TvTop,
    // kline,
    tv
  },
  data() {
    return {
      isRouterAlive: true,
      whichEntrust: 'entrust'
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

<style scoped lang="scss">
.home {
  margin-top: 0px;
  margin-bottom: 3px;
  justify-content: space-between;
  height: 100%;

  > .home-l {
    width: calc(100% - 683px);
    margin-top: 3px;
  }

  > .home-r {

    width: 680px;
    margin-top: 3px;

    > .home-r-t {
      justify-content: space-between;
      min-height: 220px;
      max-height: calc(100% - 360px);

      > div {
        width: 338px;
        background: #1b2c42;
      }
    }

    > .home-r-b {
      margin-top: 3px;
      background: #181b2a;
      height: 360px;
    }
  }

}

.entrusts {
  background: #1b2c42;
  padding: 15px 20px;
  height: 100%;
  display: flex;
  flex-direction: column;
  .tab-entrust {
    color: #F1F1F1;

    span {
      margin-right: 15px;
      cursor: pointer;
    }
    span:hover{
      color:#2ab098;
      border-bottom: 1px solid #2ab098;
    }
  }
  .histentrust-box,.entrust-box{
    flex:1;
  }
}
.active{
  border-bottom: 1px solid #2ab098;
}
.trade {
  height: 100%;
  background: #1b2c42;
  margin-left: 3px;
}
</style>
