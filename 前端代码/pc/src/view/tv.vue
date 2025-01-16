<template>
  <div class="k-line-area bg-1d1d29" style="display: flex;flex-direction: row;">
    <div style="width:230px; background: #1b2c42">
      <tv-top></tv-top>
    </div>

    <div class="flex column ml3" style="background: #1b2c42; flex:1;">
      <div class="info-wrap">
        <div>{{ rightName }}/{{ leftName }}</div>
        <div>
          <span :class="change<0?'red':'green'">{{ lastPrice  || '0.0000' | toFixed6 }}</span>
          <span>≈ $ {{ lastPrice }}</span>
        </div>
        <div>
          <span>{{ $t('market.change') }}</span>
          <span :class="change<0?'red':'green'">{{ change }} %</span>
        </div>
        <div>
          <span>{{ $t('home.high') }}</span>
          <span>{{ highPrice || '0.0000' | toFixed4  }}</span>
        </div>
        <div>
          <span>{{ $t('home.min') }}</span>
          <span>{{ lowPrice || '0.0000' | toFixed4 }}</span>
        </div>
        <div>
          <span>24H {{ $t('home.volume') }}</span>
          <span>{{Volume || '0.0000' | toFixed4 }}  {{ rightName }}</span>
        </div>
        <div style="flex:1;"></div>
      </div>
      
      <div id="tv_chart_container" style="padding: 0 0px; flex: 1; background:transparent;"
           class="flex column"></div>
    </div>

    <div style="margin-left: 3px;">
      <exchange></exchange>
    </div>
    <div style="margin-left: 3px;">
      <trade></trade>
    </div>
  </div>
</template>

<style lang="scss">
$baseYellowColor:#2ab098;
.info-wrap {
  line-height: 50px;
  padding-left: 20px;
  display: flex;
  font-size: 12px;
  color: #c7cce6;

  div:first-child {
    font-size: 16px;

    color:$baseYellowColor;
  }

  div {
    padding: 0 15px;
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;

    span {
      line-height: 20px;
    }
  }
}
</style>
<script>

import TvTop from './tvTop.vue'
import exchange from "@/view/lever/lever_exchange";
import trade from '@/view/complete';

let instance;
export default {
  name: "tv",
  components: {
    TvTop,
    exchange,
    trade
  },
  filters: {
    toFixedN(val, n) {
      return (val - 0).toFixed(n);
    },
    toFixeds: function(value) {
				value = Number(value);
				return value.toFixed(2);
			},
			toFixed4: function(value) {
				value = Number(value);
				return value.toFixed(4);
			},
			toFixed6: function(value) {
				value = Number(value);
				return value.toFixed(6);
			}
  },
  data() {
    return {
      widget: null,
      symbolInfo: null,
      feed: null,
      wsEx: null,
      ws: null,
      lists: [],
      newData: '',
      cny: 111,
      symbol: '',
      priceScale: 100000,
      histime: '',
      leftName: "",
      volume:'',
      rightName: "",
      lastPrice: "0.0000",
      change: '0.00',
      highPrice: '0.0000',
      lowPrice: '0.0000',
      volumn: '0.00',
      rateNum: 1,
    }

  },
  created() {
    
    this.symbol = window.localStorage.getItem('symbol');

    this.leftName = window.localStorage.getItem("legal_name") || "";
    this.rightName = window.localStorage.getItem("currency_name") || "";
    this.currencyId = window.localStorage.getItem("legal_id");
    this.legalId = window.localStorage.getItem("currency_id");
    // this.init(this.legalId, this.currencyId);
    this.downUp = window.localStorage.getItem("downUp");
  },
  sockets: {},
  computed: {
    listenState() { //监听交易对
      return this.symbol;
    },	
  },
  watch: {
    listenState: function (a, b) {  //监听交易对
      if (a != b && b != '') {
        this.widget.setSymbol(a, localStorage.getItem('tim'), function onReadyCallback() {
        }) //切换币种
        // this.$store.state.symbol=b
      }
    }
  },
  mounted() {
    instance = this;
    this.createWidget();

    eventBus.$on("toNew", function (msg) {

      let thattoken = instance.rightName + '/' + instance.leftName;
      if (msg.istoken == thattoken) {
        instance.lastPrice = (msg.newprice - 0).toFixed(4);
        instance.downUp = (msg.newup - 0).toFixed(2);
        // that.coin.total = msg.hour24;
      }

    });
   
    eventBus.$on('receiveRate', function (msg) {
      
      instance.rateNum = msg;

    });

    eventBus.$on('updateKLine', res => {
      
      if (res.period === '1day') {
        instance.lastPrice = (res.close - 0).toFixed(4);
        instance.highPrice = (res.high - 0).toFixed(4);
        instance.lowPrice = (res.low - 0).toFixed(4);
        instance.volumn = (res.volume - 0).toFixed(4);
      }
      if (res.change) {
        instance.change = res.change;
      }
    })
  },
  destroyed() {
    this.removeWidget();
  },
  beforeDestroy() {

  },

  methods: {
    getrate() {
				var that = this;
				this.$http({
					url: "/api/market/get_current",
					method:'post',
                    data:{
						base_currency:this.currency_name,
						quote_currency:this.legal_name,
						period:'1day'
					},
				}).then(res => {
					// console.log(res.data.message.change)
					that.change = res.data.message.change
					that.Volume	= res.data.message.vol
					that.High = res.data.message.high
					that.Low = res.data.message.low	
					that.data.close = res.data.message.close
				});
			},
    connect(real) { //封装推送数据
      let that = this;
      
      that.$socket.emit("login", localStorage.getItem('user_id'));
      
      that.sockets.subscribe("kline", msg => {
        let obj = {}
        // console.log(that.symbol + '==============' + msg.symbol )
        if (that.symbol == msg.symbol) {
          obj.open = Number(msg.open)
          obj.low = Number(msg.low)
          obj.high = Number(msg.high)
          obj.close = Number(msg.close)
          obj.volume = Number(msg.volume)
          obj.time = Number(msg.time)
          real(obj)
          obj.change = msg.change;
          obj.period = msg.period;
          eventBus.$emit('updateKLine', obj);

        }
      });
      that.sockets.subscribe("daymarket", msg => {
        
					if(that.symbol==msg.symbol){	
						that.change = msg.change
						that.Volume	= msg.volume
						that.highPrice = msg.high
						that.lowPrice = msg.low			
            that.lastPrice = 	msg.now_price
					}
				})
    },

    createWidget() {
      let _this = this;

      this.$nextTick(function () {
        let widget = _this.widget = new TradingView.widget({
          symbol: _this.symbol,
          interval: 1,
          debug: false,
          fullscreen: false,
          autosize: true,
          container_id: "tv_chart_container",
          // datafeed: new Datafeeds.UDFCompatibleDatafeed("http://demo_feed.tradingview.com"),
          datafeed: _this.createFeed(),
          library_path: "./static/tradeview/charting_library/",
          custom_css_url: 'bundles/new.css',
          locale: localStorage.lang || 'en',
          width: "100%",
          height: 516,
          drawings_access: {type: 'black', tools: [{name: "Regression Trend"}]},
          disabled_features: [  //  禁用的功能
            'left_toolbar', 'header_saveload', 'compare_symbol', 'display_market_status',
            'go_to_date', 'header_chart_type', 'header_compare', 'header_interval_dialog_button',
            'header_resolutions', 'header_screenshot', 'header_symbol_search', 'header_undo_redo',
            'legend_context_menu', 'show_hide_button_in_legend', 'show_interval_dialog_on_key_press',
            'snapshot_trading_drawings', 'symbol_info', 'timeframes_toolbar', 'use_localstorage_for_settings',
            'volume_force_overlay', 'widget_logo'
          ],
          enabled_features: [ //  启用的功能（备注：disable_resolution_rebuild 功能用于控制当时间范围为1个月时，日期刻度是否都是每个月1号
            'dont_show_boolean_study_arguments', 'hide_last_na_study_output', 'move_logo_to_main_pane',
            'same_data_requery', 'side_toolbar_in_fullscreen_mode', 'disable_resolution_rebuild'
          ],
          charts_storage_url: 'http://saveload.tradingview.com',
          charts_storage_api_version: "1.1",
          toolbar_bg: "transparent",
          timezone: "America/New_York",
          studies_overrides: {
            'volume.precision': '1000'
          },
          overrides: _this.overrides(),
          loading_screen: {backgroundColor: 'transparent', foregroundColor: 'transparent'}
        });

        widget.MAStudies = [];
        widget.selectedIntervalButton = null;
        // widget.setLanguage('en')
        widget.onChartReady(function () { //图表方法
          // document.getElementById('trade-view').childNodes[0].setAttribute('style', 'display:block;width:100%;height:100%;');
          //let that =this
          widget.chart().createStudy('Moving Average', false, true, [15, 'close', 0], null, {'Plot.color': '#e843da'});
          widget.chart().createStudy("MA Cross", false, false, [10, 20]);
          let buttonArr = [
            {
              value: "1min",
              period: "1",
              text: _this.$t('center.realtime'),
              chartType: 3
            },
            {
              value: "1",
              period: "1m",
              text: "1" + _this.$t('m'),
              chartType: 1
            },
            {
              value: "5",
              period: "5m",
              text: "5" + _this.$t('m'),
              chartType: 1
            },
            {
              value: "15",
              period: "15m",
              text: "15" + _this.$t('m'),
              chartType: 1
            },
            {
              value: "30",
              period: "30m",
              text: "30" + _this.$t('m'),
              chartType: 1
            },
            {
              value: "60",
              period: "60分钟",
              text: "1" + _this.$t('hour'),
              chartType: 1
            },
            {
              value: "1D",
              period: "1D",
              text: "1" + _this.$t('day'),
              chartType: 1
            },
            {
              value: "1W",
              period: "1W",
              text: "1" + _this.$t('week'),
              chartType: 1
            }, {
              value: "1M",
              period: "1M",
              text: "1" + _this.$t('mon'),
              chartType: 1
            }
          ];
          let btn = {};
          let nowTime = '';
          buttonArr.forEach((v, i) => {
            // console.log(v)
            let button = widget.createButton()
            button.attr('title', v.text)
                .addClass("my2")
                .text(v.text)

            if (v.text == '1' + _this.$t('m')) {
              button.css({"background-color": "#00a4d8", 'color': '#fff'});
              button.addClass('mydate');
              localStorage.setItem('tim', '1')  //默认为1分钟
            }

            // console.log($(this),'999999')
            btn = button.on("click", function (e) {
              $(this).parents(".left").children().find(".my2").removeAttr("style"); //去掉1分钟的
              handleClick(e, v.value);

              widget.chart().setChartType(v.chartType); //改变K线类型
            });

          });
          let handleClick = (e, value) => {
            _this.setSymbol = function (symbol, value) {
              gh.chart().setSymbol(symbol, value);
            };
            localStorage.setItem('tim', value)
            widget.chart().setResolution(value, function onReadyCallback() {
            });  //改变分辨率

            $(e.target)
                .addClass("mydate")
                .closest("div.space-single")
                .siblings("div.space-single")
                .find("div.button")
                .removeClass("mydate")
          };
        });
        _this.widget = widget;
      })
    },

    createFeed() {
      let this_vue = this;
      let Datafeed = {};


      Datafeed.DataPulseUpdater = function (datafeed, updateFrequency) {
        this._datafeed = datafeed;
        this._subscribers = {};

        this._requestsPending = 0;
        var that = this;

        var update = function () {
          if (that._requestsPending > 0) {
            return;
          }

          for (var listenerGUID in that._subscribers) {
            var subscriptionRecord = that._subscribers[listenerGUID];
            var resolution = subscriptionRecord.resolution;

            var datesRangeRight = parseInt((new Date().valueOf()) / 1000);


            //	BEWARE: please note we really need 2 bars, not the only last one
            //	see the explanation below. `10` is the `large enough` value to work around holidays
            var datesRangeLeft = datesRangeRight - that.periodLengthSeconds(resolution, 10);

            that._requestsPending++;

            (function (_subscriptionRecord) { // eslint-disable-line
              that._datafeed.getBars(_subscriptionRecord.symbolInfo, resolution, datesRangeLeft, datesRangeRight, function (bars) {
                    that._requestsPending--;

                    //	means the subscription was cancelled while waiting for data
                    if (!that._subscribers.hasOwnProperty(listenerGUID)) {
                      return;
                    }

                    if (bars.length === 0) {
                      return;
                    }

                    var lastBar = bars[bars.length - 1];
                    if (!isNaN(_subscriptionRecord.lastBarTime) && lastBar.time < _subscriptionRecord.lastBarTime) {
                      return;
                    }

                    var subscribers = _subscriptionRecord.listeners;

                    //	BEWARE: this one isn't working when first update comes and this update makes a new bar. In this case
                    //	_subscriptionRecord.lastBarTime = NaN
                    var isNewBar = !isNaN(_subscriptionRecord.lastBarTime) && lastBar.time > _subscriptionRecord.lastBarTime;

                    //	Pulse updating may miss some trades data (ie, if pulse period = 10 secods and new bar is started 5 seconds later after the last update, the
                    //	old bar's last 5 seconds trades will be lost). Thus, at fist we should broadcast old bar updates when it's ready.
                    if (isNewBar) {
                      if (bars.length < 2) {
                        throw new Error('Not enough bars in history for proper pulse update. Need at least 2.');
                      }

                      var previousBar = bars[bars.length - 2];
                      for (var i = 0; i < subscribers.length; ++i) {
                        subscribers[i](previousBar);
                      }
                    }

                    _subscriptionRecord.lastBarTime = lastBar.time;

                    for (var i = 0; i < subscribers.length; ++i) {
                      subscribers[i](lastBar);
                    }
                  },

                  //	on error
                  function () {
                    that._requestsPending--;
                  });
            })(subscriptionRecord);
          }
        };

        if (typeof updateFrequency != 'undefined' && updateFrequency > 0) {
          setInterval(update, updateFrequency);
        }
      };

      Datafeed.DataPulseUpdater.prototype.periodLengthSeconds = function (resolution, requiredPeriodsCount) {
        var daysCount = 0;

        if (resolution === 'D') {
          daysCount = requiredPeriodsCount;
        } else if (resolution === 'M') {
          daysCount = 31 * requiredPeriodsCount;
        } else if (resolution === 'W') {
          daysCount = 7 * requiredPeriodsCount;
        } else {
          daysCount = requiredPeriodsCount * resolution / (24 * 60);
        }

        return daysCount * 24 * 60 * 60;
      };

      Datafeed.DataPulseUpdater.prototype.subscribeDataListener = function (symbolInfo, resolution, newDataCallback, listenerGUID) {
        this._datafeed._logMessage('Subscribing ' + listenerGUID);

        if (!this._subscribers.hasOwnProperty(listenerGUID)) {
          this._subscribers[listenerGUID] = {
            symbolInfo: symbolInfo,
            resolution: resolution,
            lastBarTime: NaN,
            listeners: []
          };
        }

        this._subscribers[listenerGUID].listeners.push(newDataCallback);
      };

      Datafeed.DataPulseUpdater.prototype.unsubscribeDataListener = function (listenerGUID) {
        this._datafeed._logMessage('Unsubscribing ' + listenerGUID);
        delete this._subscribers[listenerGUID];
      };

      Datafeed.Container = function (updateFrequency) {
        this._configuration = {
          supports_search: false,
          supports_group_request: false,
          supported_resolutions: ['1', '3', '5', '15', '30', '60', '120', '240', '360', '720', '1D', '3D', '1W', '1M'],
          supports_marks: true,
          supports_timescale_marks: true,
          exchanges: ['gh']
        };

        this._barsPulseUpdater = new Datafeed.DataPulseUpdater(this, updateFrequency || 10 * 1000);
        // this._quotesPulseUpdater = new Datafeed.QuotesPulseUpdater(this);

        this._enableLogging = true;
        this._callbacks = {};

        this._initializationFinished = true;
        this._fireEvent('initialized');
        this._fireEvent('configuration_ready');
      };

      Datafeed.Container.prototype._fireEvent = function (event, argument) {
        if (this._callbacks.hasOwnProperty(event)) {
          var callbacksChain = this._callbacks[event];
          for (var i = 0; i < callbacksChain.length; ++i) {
            callbacksChain[i](argument);
          }

          this._callbacks[event] = [];
        }
      };

      Datafeed.Container.prototype._logMessage = function (message) {
        if (this._enableLogging) {
          var now = new Date();
          // console.log("CHART LOGS: "+now.toLocaleTimeString() + '.' + now.getMilliseconds() + '> ' + message);
        }
      };

      Datafeed.Container.prototype.on = function (event, callback) {
        if (!this._callbacks.hasOwnProperty(event)) {
          this._callbacks[event] = [];
        }

        this._callbacks[event].push(callback);
        return this;
      };

      Datafeed.Container.prototype.onReady = function (callback) {
        let that = this;
        if (this._configuration) {
          setTimeout(function () {
            callback(that._configuration);
          }, 0);
        } else {
          this.on('configuration_ready', function () {
            callback(that._configuration);
          });
        }
      };

      Datafeed.Container.prototype.resolveSymbol = function (symbolName, onSymbolResolvedCallback, onResolveErrorCallback) {
        this._logMessage("GOWNO :: resolve symbol " + symbolName);
        Promise.resolve().then(() => {
          // console.log(this_vue.priceScale,'12345s313123122adaslast')


          // this._logMessage("GOWNO :: onResultReady inject "+'AAPL');
          // console.log(this_vue.priceScale,'123stf')
          onSymbolResolvedCallback({
            "name": this_vue.symbol,
            "timezone": "America/New_York",
            "pricescale": this_vue.priceScale,
            "minmov": 1, //minmov(最小波动), pricescale(价格精度), minmove2, fractional(分数)
            "minmov2": 0,//这是一个神奇的数字来格式化复杂情况下的价格。
            "ticker": this_vue.symbol,
            "description": "",
            "type": "bitcoin",
            "volume_precision": 8,
            // "exchange-traded": "sdt",
            // "exchange-listed": "sdt",
            //现在，这两个字段都为某个交易所的略称。将被显示在图表的图例中，以表示此商品。目前此字段不用于其他目的。
            "has_intraday": true,
            "has_weekly_and_monthly": true,
            "has_no_volume": false, //布尔表示商品是否拥有成交量数据。
            'session': '24x7',
            'supported_resolutions': ['1', '3', '5', '15', '30', '60', '120', '240', '360', '720', '1D', '3D', '1W', '1M']

          });
        })
      };


      //初始化数据
      Datafeed.Container.prototype.getBars = function (symbolInfo, resolution, rangeStartDate, rangeEndDate, onHistoryCallback, onErrorCallback) {
        // if (rangeStartDate > 0 && (rangeStartDate + '').length > 10) {
        //   throw new Error(['Got a JS time instead of Unix one.', rangeStartDate, rangeEndDate]);
        // }

        if (resolution.indexOf('D') == -1 && resolution.indexOf('W') == -1 && resolution.indexOf('M') == -1) {
          resolution = resolution + 'min'
        } else if (resolution.indexOf('W') != -1 || resolution.indexOf('M') != -1) {
          resolution = resolution
        }
        let url = '/api/currency/new_timeshar?from=' + rangeStartDate + '&to=' + rangeEndDate + '&symbol=' + symbolInfo.name + '&period=' + resolution;
        instance.$http.get(url).then(function (resj) {
          let res = resj.data;

          if (res.code == 1 && res.data && res.data.length > 0) {
            res.data.forEach((item, i) => {
              item.open = Number(item.open)
              item.close = Number(item.close)
              item.high = Number(item.high)
              item.low = Number(item.low)
            })
            onHistoryCallback(res.data, {noData: false})
            onHistoryCallback([], {noData: true})
          }
          if (!res.data || res.code == -1) {
            onHistoryCallback([], {noData: true})
          }
          if (res.data && res.data.length == 0) {
            onHistoryCallback([], {noData: true})
          }
        })

      };
      //实时数据
      Datafeed.Container.prototype.subscribeBars = function (symbolInfo, resolution, onRealtimeCallback, listenerGUID, onResetCacheNeededCallback) {
        this_vue.connect(onRealtimeCallback)

        //this._barsPulseUpdater.subscribeDataListener(symbolInfo, resolution, onRealtimeCallback, listenerGUID, onResetCacheNeededCallback);
      };

      Datafeed.Container.prototype.unsubscribeBars = function (listenerGUID) {

        this._barsPulseUpdater.unsubscribeDataListener(listenerGUID);

      };

      return new Datafeed.Container;
    },
    updateData(data) {
      if (data) {
        this.$emit('real-time', data);
      }
    },

    updateWidget(item) {
      this.symbolInfo = {
        name: item,
        ticker: item,
        description: "",
        session: "24x7",
        supported_resolutions: ['1', '5', '15', '30', '60', '240', '1D', '3D', '1W', '1M'],
        has_intraday: true,
        has_daily: true,
        has_weekly_and_monthly: true,
        timezone: "UTC",
      }
      this.removeWidget();
      this.createWidget();
    },

    removeWidget() {
      if (this.widget) {
        try {
          this.widget.remove();
          this.widget = null;
        } catch (e) {
          // console.log(e);
        }
      }
    },
    overrides() {
      let style = {
        up: "#35b65a",
        down: "#ff494a",
        bg: "#1b2c42",
        grid: "#3e4752",
        cross: "#c7cce6",
        border: "#171c2b",
        text: "#c7cce6",
        areatop: "rgba(122, 152, 247, .1)",
        areadown: "rgba(122, 152, 247, .02)"
      };
      return {
        'volumePaneSize': "medium", //large, medium, small, tiny
        'paneProperties.topMargin': '20',
        "scalesProperties.lineColor": style.text,
        "scalesProperties.textColor": style.text,
        "paneProperties.background": style.bg,//改变背景色的重要代码
        "paneProperties.vertGridProperties.color": style.grid,
        "paneProperties.horzGridProperties.color": style.grid,
        "paneProperties.crossHairProperties.color": style.cross,
        "paneProperties.legendProperties.showLegend": true,
        "paneProperties.legendProperties.showStudyArguments": true,
        "paneProperties.legendProperties.showStudyTitles": true,
        "paneProperties.legendProperties.showStudyValues": true,
        "paneProperties.legendProperties.showSeriesTitle": true,
        "paneProperties.legendProperties.showSeriesOHLC": true,
        "mainSeriesProperties.candleStyle.upColor": style.up,
        "mainSeriesProperties.candleStyle.downColor": style.down,
        "mainSeriesProperties.candleStyle.drawWick": true,
        "mainSeriesProperties.candleStyle.drawBorder": true,
        "mainSeriesProperties.candleStyle.borderColor": style.border,
        "mainSeriesProperties.candleStyle.borderUpColor": style.up,
        "mainSeriesProperties.candleStyle.borderDownColor": style.down,
        "mainSeriesProperties.candleStyle.wickUpColor": style.up,
        "mainSeriesProperties.candleStyle.wickDownColor": style.down,
        "mainSeriesProperties.candleStyle.barColorsOnPrevClose": false,
        "mainSeriesProperties.hollowCandleStyle.upColor": style.up,
        "mainSeriesProperties.hollowCandleStyle.downColor": style.down,

        "mainSeriesProperties.hollowCandleStyle.drawWick": true,
        "mainSeriesProperties.hollowCandleStyle.drawBorder": true,
        "mainSeriesProperties.hollowCandleStyle.borderColor": style.border,
        "mainSeriesProperties.hollowCandleStyle.borderUpColor": style.up,
        "mainSeriesProperties.hollowCandleStyle.borderDownColor": style.down,
        "mainSeriesProperties.hollowCandleStyle.wickColor": style.line,
        "mainSeriesProperties.haStyle.upColor": style.up,
        "mainSeriesProperties.haStyle.downColor": style.down,
        "mainSeriesProperties.haStyle.drawWick": true,
        "mainSeriesProperties.haStyle.drawBorder": true,
        "mainSeriesProperties.haStyle.borderColor": style.border,
        "mainSeriesProperties.haStyle.borderUpColor": style.up,
        "mainSeriesProperties.haStyle.borderDownColor": style.down,
        "mainSeriesProperties.haStyle.wickColor": style.border,
        "mainSeriesProperties.haStyle.barColorsOnPrevClose": false,
        "mainSeriesProperties.barStyle.upColor": style.up,
        "mainSeriesProperties.barStyle.downColor": style.down,
        "mainSeriesProperties.barStyle.barColorsOnPrevClose": false,
        "mainSeriesProperties.barStyle.dontDrawOpen": false,
        "mainSeriesProperties.lineStyle.color": style.border,
        "mainSeriesProperties.lineStyle.linewidth": 1,
        "mainSeriesProperties.lineStyle.priceSource": "close",
        "mainSeriesProperties.areaStyle.color1": style.areatop,
        "mainSeriesProperties.areaStyle.color2": style.areadown,
        "mainSeriesProperties.areaStyle.linecolor": style.border,
        "mainSeriesProperties.areaStyle.linewidth": 1,
        "mainSeriesProperties.areaStyle.priceSource": "close"
      }
      // this.sty2()
    },


    chose() {
      // console.log(this.widget,'000')
      this.widget.setLanguage('en') //设置语言

      // this.$store.commit('symbol','sdt')
      // this.$store.state.symbol='sdt6456' //切换交易对
    }
  },


}
</script>

