<template>
  <div style="width:100%">
    <v-chart :options="polar" :style="'width: '+width+';height:'+height+';'"/>
  </div>
</template>
<script>
import ECharts from 'vue-echarts' // 在 webpack 环境下指向 components/ECharts.vue
import echarts from 'echarts'

export default {
  props: {
    symbol: {
      type: String,
      default: ''
    },
    peorid: {
      type: String,
      default: '1day'
    },
    count: {
      type: Number,
      default: 7
    },
    color: {
      type: String,
      default: ''
    },
    width: {
      type: String,
      default: '150px'
    },
    height: {
      type: String,
      default: '50px'
    }
  },
  name: "ChartBox",
  data() {
    console.log('顔色', this.color);
    return {
      books: ["book0", "book1"],
      msg: 'this is BookList',
      polar: {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        xAxis: {
          type: 'category',
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
          splitLine: false,
          show: false,
        },
        yAxis: {
          type: 'value',
          splitLine: false,
          show: false
        },
        series: [{
          data: [0, 0, 0, 0, 0, 0, 0],
          type: 'line',
          symbol: "none",
          smooth: true,
          areaStyle: {
            normal: {
              color: {
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [{
                  offset: 0,
                  color: this.color == 'up' ? "rgba(53,182,90,.9)" : 'rgba(255,73,74,9)' // 0% 处的颜色
                }, {
                  offset: 0.7,
                  color: this.color == 'up' ? "rgba(53,182,90,.0)" : 'rgba(255,73,74,0)' // 100% 处的颜色
                }],
                globalCoord: false // 缺省为 false
              }
            }
          },
          itemStyle: {
            normal: {
              color: this.color == 'up' ? "#35b65a" : "#ff494a",//折线点的颜色
              lineStyle: {
                color: this.color == 'up' ? "#35b65a" : "#ff494a",//折线的颜色
                width: .4
              }
            }
          }
        }]
      }

    };
  },
  components: {
    'v-chart': ECharts
  },
  methods: {},
  watch: {
    color(val) {
      this.polar.series[0].itemStyle.normal.color = val == 'up' ? '#35b65a' : '#ff494a';
      this.polar.series[0].itemStyle.normal.lineStyle.color = val == 'up' ? '#35b65a' : '#ff494a';

      this.polar.series[0].areaStyle.normal.color.colorStops[0].color = this.color == 'up' ? "rgba(53,182,90,.9)" : 'rgba(255,73,74,.9)'
      this.polar.series[0].areaStyle.normal.color.colorStops[1].color = this.color == 'up' ? "rgba(53,182,90,.0)" : 'rgba(255,73,74,0)'
    }
  },
  mounted() {

    let that = this;
    let now = parseInt((new Date()).valueOf() / 1000);
    let start = now - (3600 * 24 * 7);
    this.$http.get('/api/currency/new_timeshar', {
      params: {
        'symbol': this.symbol + '/USDT',
        from: start,
        to: parseInt((new Date()).valueOf() / 1000),
        period: this.peorid
      }
    }).then(res => {
      let rsp = res.data;
      let invoke = (rsp.data.reverse().slice(0, this.count)).reverse();
      let data = [];
      let data1 = [];
      invoke.forEach(x => {
        data.push(x.id);
        data1.push(x.close);
      });
      let min = Math.min.apply(null, data1);
      // console.log('最小值', min);
      for (let i = 0; i < data1.length; i++) {
        data1[i] = data1[i] - min;
      }
      that.polar.xAxis.data = data;
      that.polar.series[0].data = data1;

    });
  }

}
</script>