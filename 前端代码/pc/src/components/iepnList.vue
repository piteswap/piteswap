<template>
  <div class="upStar" style="height: auto; background-color: #171c2b;">
    <indexHeader></indexHeader>
    <div class="flex alcenter" style="width: 100%; height: 320px; background: #efb82d">
      <div style="width: 1200px; margin: 0 auto;">
        <h1 style="line-height: 100px;font-size: 24px;">
          {{ $t('iepn.htitle') }}
        </h1>
        <h5 style="line-height: 60px;font-size: 18px;">{{ $t('iepn.subtitle') }}</h5>
      </div>
    </div>
    <div class="SellInfo-wrap"
         style="width: 1200px; margin-top: -15px; background: #fff; margin: -15px auto 0; border-radius:10px;">
      <div class="ModuleTitle-wrap flex alcenter">
        <div class="flex1">UpStart</div>
        <div style="padding-right: 30px;">
          <!--          <el-link href="/#/dealCenter" type="warning">去交易</el-link>-->

          <button @click="goTrade" type="button" class="el-button more-btn el-button--default"><!---->
            <!----><span>{{ $t('iepn.gobuy') }}</span>
          </button>

        </div>
      </div>
      <div class="title">IEPN:{{ $t('iepn.netname') }}</div>
      <div class="plan-amount">{{ $t('iepn.plannum') }}:{{ iepn.total }}</div>
      <div id="echarts" style="width: 600px; margin:0 auto; height: 400px;">
        <v-chart :options="polar" width="482" height="322"/>
      </div>
    </div>
    <div class="HotRecommend-wrap hot-wrap">
      <div class="ModuleTitle-wrap">{{ $t('iepn.hotcommond') }}</div>
      <div class="body">
        <div class="img-wrap"><img
            :src="lang==='zh'?'https://neptuneex.com/static_config/www/hot_cn.jpg':'https://neptuneex.com/static_config/www/hot_en.jpg'"
            alt=""
            class="banner-img"></div>
        <div class="body-right">
          <div class="title"><span class="title-text">{{ $t('iepn.ctitle') }}</span></div>
          <p class="content-text">{{
              $t('iepn.cdsp')
            }}<br>{{ $t('iepn.starttime') }}：{{ iepn.start }} <br>{{ $t('iepn.startprice') }}：{{ iepn.price }}
            <br>{{ $t('iepn.plannum') }}：{{ iepn.total }} <br>{{ $t('iepn.endtime') }}:{{ iepn.end }}</p>
          <a href="https://iepninf.com/" target="_blank">
            <button type="button" class="el-button more-btn el-button--default"><!---->
              <!----><span>{{ $t('iepn.seemore') }}</span>
            </button>
          </a>
          <a href="https://iepninf.com/file/IEPN%E7%99%BD%E7%9A%AE%E4%B9%A6.pdf" class="ml10" target="_blank">
            <button type="button" class="el-button more-btn el-button--default"><!---->
              <!----><span>{{ $t('iepn.baipishu') }}</span>
            </button>
          </a>
        </div>
      </div>
    </div>
    <indexFooter></indexFooter>
  </div>
</template>
<script>
import indexHeader from "@/view/indexHeader";
import indexFooter from "@/view/miniFooter";
import ECharts from 'vue-echarts' // 在 webpack 环境下指向 components/ECharts.vue
import echarts from 'echarts'

export default {
  name: "upStar",
  components: {
    indexHeader, indexFooter,
    'v-chart': ECharts
  },
  data() {
    return {
      more: "{{$t('more')}}...",
      newList: [],
      iepn: {},
      polar: {
        color: [
          '#007aff',
          '#00a4d8',
        ],
        tooltip: {
          trigger: 'item'
        },
        legend: {
          top: '5%',
          left: 'center'
        },
        series: [
          {
            name: '',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: '40',
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: [
              {value: 40000000, name: this.$t('iepn.pushednum')},
              {value: 1802560, name: this.$t('iepn.remindnum')}
            ]
          }
        ]
      },
      lang: localStorage.getItem('lang')
    };
  },
  created() {
  },
  methods: {
    goTrade() {
      window.localStorage.setItem('currency_name', 'IEPN');
      window.localStorage.setItem('currency_id', '18');
      window.localStorage.setItem('symbol', 'IEPN/USDT');
      window.localStorage.setItem('current', 'IEPN/USDT');
      window.localStorage.setItem('index2', 12);
      this.$router.push('/dealCenter');
    },
    getNotice() {
      this.$http({
        url: '/api/' + 'news/list',
        method: 'post',
        data: {c_id: '3'},
      }).then(res => {
        this.newList = res.data.message.list

      })
    },
    goBefore() {
      this.$router.back(-1);
    },
    getMore() {
    },
    goDetail(id) {
      var id = id;
      this.$router.push({
        name: "noticeDetail",
        query: {id: id}
      });
    }
  },
  mounted() {
    var that = this;
    this.$http({
      url: '/api/iepn',
      method: 'get'
    }).then(res => {
      that.iepn = res.data.message;
      that.polar.series[0].data[0].value = that.iepn.yfx;
      that.polar.series[0].data[1].value = that.iepn.sy;
    })
  }
};
</script>
<style lang="scss" scoped>
.ModuleTitle-wrap {
  padding-top: 30px;
  padding-bottom: 30px;
  padding-left: 47px;
  position: relative;
  font-size: 16px;
  font-family: PingFang SC;
  font-weight: 400;
  color: #12161c;
}

.ModuleTitle-wrap:after {
  position: absolute;
  content: "";
  width: 4px;
  height: 23px;
  background: #efb82d;
  border-radius: 2px;
  left: 26px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
}

.SellInfo-wrap {
  .title {
    text-align: center;
    font-size: 16px;
    font-family: PingFang SC;
    font-weight: 400;
    color: #161515;
  }

  .plan-amount {
    text-align: center;
    padding-top: 30px;
    font-size: 14px;
    font-family: PingFang SC;
    font-weight: 400;
    color: #57bc7d;
  }

}

.hot-wrap {
  width: 1200px;
  margin: 0 auto;
  margin-top: 17px;
}

.more-btn {
  border: 0;
  padding: 12px 44px;
  background: #efb82d;
  border-radius: 4px;
  font-size: 12px;
  font-family: PingFang SC;
  font-weight: 500;
  color: #141414;
  font-weight: bold;
}

.HotRecommend-wrap {
  background: #fff;
  border-radius: 8px;
  padding-bottom: 38px;

  .body {
    display: flex;
    flex-direction: row;
    width: 100%;

    .img-wrap {
      flex: 1;
      padding-left: 26px;
    }

    .banner-img {
      width: 100%;
    }

    .body-right {
      width: 500px;
      padding-left: 65px;
      padding-right: 85px;
      text-align: center;
      box-sizing: content-box;

      .title-text {
        font-size: 14px;
        font-family: Adobe Heiti Std;
        font-weight: 400;
        color: #12161c;
        position: relative;
        z-index: 0;
      }

      .content-text {
        padding-top: 35px;
        padding-bottom: 50px;
        font-size: 12px;
        font-family: SimHei;
        font-weight: 400;
        color: #12161c;
        line-height: 24px;
        text-align: left;
      }

      .more-btn {
        border: 0;
        padding: 12px 44px;
        background: #efb82d;
        border-radius: 4px;
        font-size: 12px;
        font-family: PingFang SC;
        font-weight: 500;
        color: #141414;
        font-weight: bold;
      }
    }
  }

}

</style>
