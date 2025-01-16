<template>
	<view class="option-kline-container" :data-symbol="index_market">
		<view class="kline-tabs-wrap">
			<view v-for="(item,index) in tabList" :key="item.type" :data-current="index" :data-value="item.value"
				:data-period="item.value" :data-type="item.chartType" :data-key="item.type" class="kline-tab-item"
				:class="index == subCurrent ? 'active' : ''" @click="LightweightCharts.onPeriodChange">
				<view class="kline-tab-label">{{item.name}}</view>
			</view>
			<view class="kline-tabs-fixed-wrpas">
				<view class="kline-tab-item has-sub" @click.stop="showMore">
					<view class="kline-tab-label">
						<text class="label"
							:class="subCurrentItem.name ? 'active' :''">{{$t('trade.kline.more')}}</text>
						<u-icon name="arrow-down-fill" class="arrow" :size="arrowSize"></u-icon>
					</view>
					<view class="kline-tab-more-wrap bg-theme" v-if="isMoreShow">
						<view class="kline-tab-more-item" v-for="(sub,idx) in subItem" :key="idx"
							hover-class="kline-tab-more-item-hover" hover-stay-time="50" :data-value="sub.value"
							:data-current="idx" :data-period="sub.value" :data-type="sub.chartType" :data-key="sub.type"
							:data-isMore="true" @click="LightweightCharts.onPeriodChange">
							<text class="kline-more-label">{{sub.name}}</text>
						</view>
					</view>
				</view>

				<view class="kline-tab-item has-sub" @click="showIndex">
					<view class="kline-tab-label">
						<text class="label">{{$t('trade.kline.zhibiao')}}</text>
						<u-icon name="arrow-down-fill" class="arrow" :size="arrowSize"></u-icon>
					</view>
					<view class="kline-tab-index-wrap bg-theme" v-if="isIndexShow">
						<view class="kline-tab-index-item">
							<view class="kline-index-label">{{$t('trade.kline.zhutu')}}</view>
							<view class="kline-index-main">
								<view class="kline-index-text" :class="subActive === idx1 ? 'active' : ''"
									v-for="(sub,idx1) in subList" :key="idx1" hover-class="hover" :data-current="idx1"
									:data-subactive="subActive" hover-stay-time="50"
									@click.stop="LightweightCharts.switchStudy">{{sub.text}}</view>
							</view>
							<view class="kline-index-eye-wrap" @click.stop="LightweightCharts.switchStudyVisible"
								:class=" isSubActive ? 'brand' : '' " :data-subactive="subActive">
								<u-icon name="eye-fill" size="40" :color="null !== subActive ? '#FD5B2C' : '#c3c3cd'">
								</u-icon>
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
		<view class="ma-labels" v-if="subActive==0">
			<view class="label-item ma5">MA5:{{MA.ma5}}</view>
			<view class="label-item ma10">MA10:{{MA.ma10}}</view>
			<view class="label-item ma30">MA30:{{MA.ma30}}</view>
		</view>
		<view class="boll-labels" v-if="subActive==1">
			<view class="label-item middle">BOLL:{{BOLL.middle}}</view>
			<view class="label-item up">UB:{{BOLL.up}}</view>
			<view class="label-item down">LB:{{BOLL.down}}</view>
		</view>

		<view v-if="tooltipVisible" :style="toolPositionComp" class="tooltip bg-theme">
			<!--浮动层-->
			<view class="line">
				<view class="label">{{$t('trade.kline.time')}}:</view>
				<view class="value">{{tooltipData.time}}</view>
			</view>
			<view class="line">
				<view class="label">{{$t('trade.kline.open')}}:</view>
				<view class="value">{{formatPrice(tooltipData.open)}}</view>
			</view>
			<view class="line">
				<view class="label">{{$t('trade.kline.close')}}:</view>
				<view class="value">{{formatPrice(tooltipData.close)}}</view>
			</view>
			<view class="line">
				<view class="label">{{$t('trade.kline.high')}}:</view>
				<view class="value">{{formatPrice(tooltipData.high)}}</view>
			</view>
			<view class="line">
				<view class="label">{{$t('trade.kline.low')}}:</view>
				<view class="value">{{formatPrice(tooltipData.low)}}</view>
			</view>
			<block v-if="subActive == 0">
				<view class="line ma5">
					<view class="label">MA5:</view>
					<view class="value">{{tooltipData.ma5}}</view>
				</view>
				<view class="line ma10">
					<view class="label">MA10:</view>
					<view class="value">{{tooltipData.ma10}}</view>
				</view>
				<view class="line ma30">
					<view class="label">MA30:</view>
					<view class="value">{{tooltipData.ma30}}</view>
				</view>
			</block>

			<block v-if="subActive == 1">
				<view class="line middle">
					<view class="label">BOLL:</view>
					<view class="value">{{tooltipData.middle}}</view>
				</view>
				<view class="line up">
					<view class="label">UB:</view>
					<view class="value">{{tooltipData.up}}</view>
				</view>
				<view class="line down">
					<view class="label">LB:</view>
					<view class="value">{{tooltipData.down}}</view>
				</view>
			</block>

		</view>

		<view class="tv_chart_container" id="tv_chart_container" :prop="series"
			:change:prop="LightweightCharts.updateData">
			<!--图表-->
		</view>
	</view>
</template>
<!-- 逻辑层 -->
<script>
	import io from '@hyoga/uni-socket.io';

	export default {
		name: "option-kline-container",
		props: {
			index_market: {
				type: String,
				default: "BTC/USDT"
			},
			currency_id: {
				type: String | Number,
				default: "0"
			},
			legal_id: {
				type: String | Number,
				default: "0"
			},
			showCharts: {
				type: Boolean,
				default: false
			}
		},
		computed: {
			subCurrentItem: function() {
				return this.subMoreCurrent != null && this.subMoreCurrent > -1 ? this.subItem[this.subMoreCurrent] : {}
			},
			showTimeline: function() {
				return 0 == this.subCurrent
			},
			currentName: function() {
				return this.tabList[this.subCurrent].name
			},
			currentLargerThemZero: function() {
				return this.subCurrent > 0
			},
			isSubActive: function() {
				return 0 == this.subActive || this.subActive > 0
			},
			toolPositionComp: function() {
				let obj = this.toolPosition
				let styles = {
					top: obj.top + 'px',
					left: obj.left + 'px'
				}
				return styles
			}
		},
		watch: {
			showCharts: function(show) {
				console.log('showCharts', show)
				show ? this.fetchHistory() : this.close()
			}
		},
		data() {
			return {
				arrowSize: "20",
				isMoreShow: false, //点击more控制是否显示
				isIndexShow: false, //点击指标控制是否显示
				indexSelect: true,
				indexActive: 0,
				socketTask: null,
				current: 0,
				loading: false,
				period: "1min",
				series: {
					type: "series",
					data: []
				},
				daymarket: {}, //日线
				lastData: {}, //series.data的最后一条消息 用于对比
				BOLL: {
					middle: NaN,
					up: NaN,
					down: NaN
				},
				MA: {
					ma5: NaN,
					ma10: NaN,
					ma30: NaN
				},
				tooltipVisible: false, //图表浮动提示显示框
				toolPosition: {
					top: 0,
					left: 0
				},
				tooltipData: {
					time: "",
					open: NaN,
					close: NaN,
					high: NaN,
					low: NaN,
					ma5: NaN,
					ma10: NaN,
					ma30: NaN,
					up: NaN,
					down: NaN,
					middle: NaN
				},
				subCurrent: 0,
				subCurrentShow: false,
				viceMapVisible: false,
				indexMapVisible: false,
				subMoreCurrent: null,
				subItem: [{ //more
					name: this.$t('trade.kline.time_1week'),
					type: "1week",
					value: "1W",
					period: "1W",
					chartType: 1
				}, {
					name: this.$t('trade.kline.time_1mon'),
					value: "1M",
					type: "1mon",
					period: "1M",
					chartType: 1
				}],
				tabList: [{
					name: this.$t('trade.kline.time_1min'),
					id: 1,
					type: "1min",
					value: "1",
					period: "1m",
					chartType: 1
				}, {
					value: "5",
					name: this.$t('trade.kline.time_5min'),
					id: 2,
					type: "5min",
					period: "5m",
					chartType: 1
				}, {
					value: "30",
					type: "30min",
					name: this.$t('trade.kline.time_30min'),
					id: 3,
					period: "30m",
					chartType: 1
				}, {
					value: "60",
					type: "60min",
					name: this.$t('trade.kline.time_60min'),
					id: 4,
					chartType: 1,
					period: "1hour"
				}, {
					value: "1D",
					type: "1day",
					name: this.$t('trade.kline.time_1day'),
					id: 5,
					period: "1D",
					chartType: 1
				}],
				subList: [{
					text: "MA"
				}, {
					text: "BOLL"
				}],
				subActive: 0
			};
		},
		methods: {
			/*
			动态调用指定方法
			obj = {name:'方法名',params:[参数1,参数2,...]}
			*/
			logicCallFun: function(obj) {
				let methods = this.$options.methods
				const _this = this
				//console.log('methods:',obj,methods)
				methods[obj.name].apply(_this, obj.params)
			},
			formatPrice: function(t) {
				let tmpArr = this.index_market.split("/")
				let plen = 4 //默认小数位数4位
				if (["BTC", "ETH"].indexOf(tmpArr[0]) > -1) {
					plen = 2
				}
				return t.toFixed(plen)
			},
			showIndex: function() {
				this.isMoreShow = false,
					this.isIndexShow = !this.isIndexShow
			},
			showMore: function() {
				this.isIndexShow = false,
					this.isMoreShow = !this.isMoreShow
			},
			onSubTabClick: function(t) {
				this.subCurrent = null,
					this.subMoreCurrent = t,
					this.isIndexShow = false
			},
			setBollData: function(t) {
				Object.assign(this.BOLL, t)
			},
			setTooltipPosition: function(t) {
				this.toolPosition.top = t.top,
					this.toolPosition.left = t.left
			},
			setTooltipData: function(t) {
				Object.assign(this.tooltipData, t)
			},
			setToolTipVisible: function(t) {
				var e = t.visible;
				this.tooltipVisible = e
			},


			showSubCurrent: function(t) {
				var e = t.currentTarget.dataset.current;
				e === this.current ? this.subCurrentShow = !this.subCurrentShow : (this.current = e,
					this.subCurrentShow = true)
			},
			hideSubCurrent: function() {
				this.subCurrentShow = false
			},
			setSubcurrent: function(t) {
				var e = t.index;
				this.subCurrent = e,
					this.subMoreCurrent = null,
					this.hideSubCurrent()
			},
			switchViceMapVisible: function() {
				this.viceMapVisible = !this.viceMapVisible
			},
			setSubActive: function(t) {
				this.subActive = t,
					this.hideSubCurrent()
			},
			setCurrent: function(t) {
				this.current = Number(t)
			},
			serPeriod: function(t) {
				this.period = t
			},
			setMa: function(t, e) {
				//console.log("setma-->",t,e)
				this.MA["ma".concat(t)] = parseFloat(e).toFixed(4)
			},
			periodChange: function(t) {
				//console.log('periodChangeEmit',t)
				this.$emit("onPeriodChange", t)
			},
			upDayMarket: function(daymarket) {
				//console.log("发送数据",daymarket)
				this.$emit("upDayMarket", daymarket)
			},
			fetchHistory: function() { //获取基础图表数据

				//this.close();

				var timestamp = Date.parse(new Date()) / 1000;

				let params = {
					from: timestamp - 86400,
					to: timestamp,
					symbol: this.index_market,
					period: this.period
				}

				this.loading = true

				this.$u.api.getNewTimeShar(params).then(res => {
					this.loading = false
					if (res.length < 1) {
						this.$u.toast(this.$t('trade.kline.noData'))
						return
					}

					this.series = Object.assign({}, this.series, {
						type: "series",
						data: res
					});
					//最后一条数据（最新）
					this.lastData = res[this.series.data.length - 1];

					//??????????????????
					uni.$emit("close", {
						type: this.period,
						close: this.lastData.close,
						open: this.lastData.open
					})

					this.connect()

				}).catch(err => {
					this.loading = false
					//console.log(err)
				})
			},
			connect: function() { //socket.io连接websocket
				if (this.socketTask && this.socketTask.connected) {
					//console.log('在线状态无需重连')
					return
				}
				let that = this
				this.socketTask = this.SocketIO(this.socketApi);
				let socket = this.socketTask;
				socket.on('connect', () => {
					console.log('trade-ws 已连接');

					// socket.io 唯一连接id，可以监控这个id实现点对点通讯
					//  const { id } = socket;
					//  console.log("id",id)

					//  socket.on(id, (message) => {
					// // 收到服务器推送的消息，可以跟进自身业务进行操作
					// console.log('ws 收到服务器消息：', message);
					//  });


					socket.on('kline', function(msg) {
						if (msg.type == 'kline') {
							let obj = {}
							var types = that.period;
							if (that.index_market == msg.symbol && types == msg.period) {
								// //that.msgopenprice = Number(msg.open);
								// //that.newprice = msg.close
								//console.log("来K线了",msg)

								that.updateSeriesData(msg)
							}
						}
					});


					socket.on('daymarket', function(msg) { //日线 更新图表顶部信息
						if (msg.type == 'daymarket') {
							let obj = {}
							if (that.index_market == msg.symbol) {
								//console.log("daymarket",msg)
								let daymarket = {
									high: msg.high,
									low: msg.low,
									volume: msg.volume,
									change: msg.change,
									open: msg.open
								}

								that.$set(that, "daymarket", daymarket)
								that.upDayMarket(daymarket)
							}
						}
					});

					//交易对
					socket.on('match_trade', function(msg) {
						if (msg.type == 'match_trade' && that.index_market == msg.symbol) {
							uni.$emit('match_trade', msg)
						}
					})

					//开口深度
					/*
					socket.on('market_depth',function(msg){
						if(msg.type == 'market_depth' && that.index_market == msg.symbol){
							console.log("market_depth",msg)
						}
					} )*/

					/*
				socket.on('closed_microorder', function (msg) {
	
					if (msg.type == 'closed_microorder') {
						var datas = msg.data;
						for (var i = 0; i < that.orderList.length; i++) {
							if (that.orderList[i].id == datas.id) {
								that.orderList[i] = datas;
								setTimeout(function () {
									var arr = that.orderList;
									arr.splice(i, 1)
									that.orderList = arr;
								}, 500)
	
								return false;
							}
						}
	
	
					}
				})*/


				});


				socket.on('error', (msg) => {
					console.log('ws error', msg);
				})
			},
			close: function() {
				this.socketTask && this.socketTask.close()
			},
			systemlog: function(e) {
				this.$u.toast(e),
					console.log(e)
			},
			updateSeriesData: function(data) {
				if (this.loading) { //切换数据或正在加载中
					return
				}

				if (data.time < this.lastData.time) { //如果是初始化数据并且新消息时间<最后一条消息时间
					console.log("ERROR TIME:", data.time, "<", this.lastData.time)
					return
				}
				this.series = Object.assign({}, this.series, {
					type: "item",
					data: data
				})

				uni.$emit("close", {
					type: this.period,
					close: data.close,
					open: data.open
				})

			}


		},
		created: function() {
			//console.log('created')
			this.fetchHistory()
		},
		beforeDestroy: function() {
			//console.log('beforeDestroy')
			this.close()
		},
	}
</script>

<!-- 视图层 -->
<script module="LightweightCharts" lang="renderjs">
	var candleSeries = null //f
		,
		bollStatus = false //p
		,
		maStatus = true //b
		,
		chart = null //s
		,
		seriesData = [] //l
		,
		lineMA5 = null //c
		,
		lineMA10 = null //u
		,
		lineMA30 = null //d
		,
		clientWidth = null //v
		,
		clientHeight = null //h
		,
		m = 4,
		w = {
			up: null,
			middle: null,
			down: null
		}

	export default {
		data() {
			return {
				option: {
					//width: width,
					//height: height,
					layout: { //图表布局
						backgroundColor: "#1B2C42",
						textColor: "#696969",
						fontSize: 12
					},
					grid: { //网格
						vertLines: {
							color: "#4682b4",
							style: 1,
							visible: true
						},
						horzLines: {
							color: "#4682b4",
							style: 1,
							visible: true
						}
					},
					watermark: {
						color: "rgba(0,0,0,.05)",
						visible: true,
						text: "Uniswap",
						fontSize: 80,
						horzAlign: "center",
						vertAlign: "center"
					},
					priceScale: {
						borderVisible: false, //右侧价格刻度
					},
					timeScale: { //底部时间刻度
						borderVisible: false
					}
				}
			}
		},
		created: function() {
			this,
			maStatus = true
		},
		mounted() {
			chart = null //s
				, lineMA5 = null //c
				, lineMA10 = null //u
				, lineMA30 = null //d
			this.loadChart()

		},
		methods: {
			loadChart: function() { //初始化图表
				if (window.LightweightCharts) {
					this.init()
				} else {
					// 动态引入类库
					var script = document.createElement('script')
					script.src = './static/lightweight-charts.js'
					script.onload = this.init.bind(this),
						document.head.appendChild(script)
					//this.init()
				}
			},
			rFun: function(data) { //临时的 等效r.default
				return data
			},
			nFun: function(data) { //临时的 等效于n.default
				return data
			},
			/**
			 * 初始化echarts 
			 */
			init() {
				var layoutOption = {
					backgroundColor: "#1B2C42",
					textColor: "#7E839D",
					fontSize: 12
				};

				var okc = document.getElementsByClassName("option-kline-container")[0];
				chart = LightweightCharts.createChart(document.getElementById("tv_chart_container"), {
						width: okc.clientWidth,
						height: okc.clientHeight - 25
					}),
					clientWidth = okc.clientWidth,
					clientHeight = okc.clientHeight - 25,

					this.applyTimeScale("1min"),
					chart.applyOptions({
						localization: {
							timeFormatter: (t) => {
								return LightweightCharts.isBusinessDay(t),
									this.dateFormat(t, "Y-m-d H:i:s")
							}
						},
						grid: {
							vertLines: {
								color: "rgba(70, 130, 180, 0.5)",
								style: 1,
								visible: true
							},
							horzLines: {
								color: "rgba(70, 130, 180, 0.5)",
								style: 1,
								visible: true
							}
						},
						layout: layoutOption,
						priceScale: {
							borderVisible: false
						},
						timeScale: {
							borderVisible: false
						}
					}),
					chart.subscribeClick(this.handleClick),
					chart.subscribeCrosshairMove(this.handleCrossMove),
					candleSeries = chart.addCandlestickSeries({})


			},
			/**
			 * 监测数据更新
			 */
			updateData(newValue, oldValue, ownerInstance, instance) {
				var that = this;
				if ("series" == this.series.type) {
					//console.log('series init!')
					seriesData = that.rFun(this.series.data);
					var c = ["BTC", "ETH"],
						u = seriesData,
						d = that.nFun(u, 1),
						item = d[0];
					let tmpArr = ownerInstance.$el.dataset.symbol.split("/")
					if (chart) {
						if (item) {
							//console.log("tmpArr-->",tmpArr)
							var h = c.some((function(t) {
								return t == tmpArr[0]
							}))
							//console.log('item-->',item,h,this.index_market)
							var w = h ? 2 : 4;
							m = h ? 2 : 4;
							var k = h ? .01 : 1e-4;
							candleSeries.applyOptions({
								priceFormat: {
									type: "price",
									precision: w,
									minMove: k
								}
							})
						}
						return candleSeries.setData(this.series.data),
							maStatus ? this.createMA() : this.createBoll(),
							void chart.timeScale().resetTimeScale()
					}

					//this.loadChart()

					setTimeout((function() {
						if (item) {
							var t = c.some((function(t) {
									//return t == (item["base-currency"] || item['currency_name'])
									return t == tmpArr[0]
								})),
								e = t ? 2 : 4;
							m = t ? 2 : 4;
							var i = t ? .01 : 1e-4;
							candleSeries.applyOptions({
								priceFormat: {
									type: "price",
									precision: e,
									minMove: i
								}
							})
						}
						candleSeries.setData(that.series.data),
							maStatus ? that.createMA() : that.createBoll(),
							chart.timeScale().resetTimeScale()
					}), 200)

				} else if ("item" == this.series.type) {
					if (!candleSeries)
						return;
					candleSeries.update(this.series.data),
						maStatus ? this.updateMA(this.series.data) : bollStatus && this.updateBoll(this.series.data)
				}

			},
			applyTimeScale: function(t) { //X轴时间线配置(用于切换了数据类型时调用)
				let that = this
				chart && ("1day" == t ? chart.applyOptions({
					timeScale: {
						timeVisible: true,
						secondsVisible: true,
						tickMarkFormatter: function(t) {
							return that.dateFormat(t, "Y/m/d")
						}
					}
				}) : chart.applyOptions({
					timeScale: {
						timeVisible: true,
						secondsVisible: true,
						tickMarkFormatter: function(t) {
							return that.dateFormat(t, "m-d H:i")
						}
					}
				}))
			},

			calculateMD: function(t) {
				for (var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 20, i = t.length, a = [],
						n = 0; n < i; n++)
					if (!(n < e - 1)) {
						for (var r = 0, o = 0; o < e; o++)
							r += Number(t[n - o].close);
						for (var s = r / e, l = 0, c = 0; c < e; c++)
							l += Math.pow(Number(t[n - c].close) - s, 2);
						if (l > 0) {
							var u = Math.sqrt(l / e);
							a.push(Number(u.toFixed(m)))
						}
					}
				return a
			},
			calculateBoll: function(t) {
				for (var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 20, i = this.calculateMA(
						e, t), a = i.length, n = this.calculateMD(t), r = [], o = [], s = 0; s < a; s++) {
					var l = n[s],
						c = i[s];
					r.push({
							time: c.time,
							value: Number((c.value + 2 * l).toFixed(m))
						}),
						o.push({
							time: c.time,
							value: Number((c.value - 2 * l).toFixed(m))
						})
				}
				return {
					middle: i,
					up: r,
					down: o
				}
			},
			calculateMA: function(t, e) {
				for (var i = [], a = 0, n = e.length; a < n; a++)
					if (!(a < t - 1)) {
						for (var r = 0, o = 0; o < t; o++)
							r += Number(e[a - o].close);
						i.push({
							time: e[a].time,
							value: Number((r / t).toFixed(m))
						})
					}
				return i
			},
			closeBoll: function() {
				bollStatus = false;
				for (var t = Object.keys(w), e = 0, i = t; e < i.length; e++) {
					var a = i[e];
					w[a] && (chart.removeSeries(w[a]),
						w[a] = null)
				}
			},
			createBoll: function() {
				if (chart) {
					var t = this.calculateBoll(seriesData),
						e = {
							up: null,
							down: null,
							middle: null
						};
					w.middle || (w.middle = chart.addLineSeries({
							color: "#1683e2",
							lineWidth: 1,
							priceLineVisible: false,
							lastValueVisible: false
						})),
						t.middle.length > 0 ? (w.middle.setData(t.middle),
							e.middle = t.middle[t.middle.length - 1].value.toFixed(m)) : w.middle && (chart
							.removeSeries(w.middle),
							w.middle = null),
						w.up || (w.up = chart.addLineSeries({
							color: "#bd9613",
							lineWidth: 1,
							priceLineVisible: false,
							lastValueVisible: false
						})),
						t.up.length > 0 ? (w.up.setData(t.up),
							e.up = t.up[t.up.length - 1].value.toFixed(m)) : w.up && (chart.removeSeries(w.up),
							w.up = null),
						w.down || (w.down = chart.addLineSeries({
							color: "#b209ac",
							lineWidth: 1,
							priceLineVisible: false,
							lastValueVisible: false
						})),
						t.down.length > 0 ? (w.down.setData(t.down),
							e.down = t.down[t.down.length - 1].value.toFixed(m)) : w.down && (chart.removeSeries(w
								.down),
							w.down = null),
						//this.setBollData(e),
						this.$ownerInstance.callMethod('logicCallFun', {
							name: 'setBollData',
							params: [e]
						}),
						bollStatus = true
				}
			},
			createMA: function() { //创建5 10 30的MA线
				if (chart) {
					var ma5 = this.calculateMA(5, seriesData),
						ma10 = this.calculateMA(10, seriesData),
						ma30 = this.calculateMA(30, seriesData);
					lineMA5 || (lineMA5 = chart.addLineSeries({
							color: "#b19228",
							lineWidth: 1,
							priceLineVisible: false,
							lastValueVisible: false
						})),
						lineMA10 || (lineMA10 = chart.addLineSeries({
							color: "#1783de",
							lineWidth: 1,
							priceLineVisible: false,
							lastValueVisible: false
						})),
						lineMA30 || (lineMA30 = chart.addLineSeries({
							color: "#91208a",
							lineWidth: 1,
							priceLineVisible: false,
							lastValueVisible: false
						})),
						ma5.length > 0 ? lineMA5.setData(ma5) : (chart.removeSeries(lineMA5), lineMA5 = null),
						ma10.length > 0 ? lineMA10.setData(ma10) : (chart.removeSeries(lineMA10), lineMA10 = null),
						ma30.length > 0 ? lineMA30.setData(ma30) : (chart.removeSeries(lineMA30), lineMA30 = null);

					for (var a = [5, 10, 30], i = 0, r = a; i < r.length; i++) {

						var maType = r[i],
							currentMaVal = NaN;

						if (5 == maType && ma5.length > 0) {
							currentMaVal = ma5[ma5.length - 1].value
						} else if (10 == maType && ma10.length > 0) {
							currentMaVal = ma10[ma10.length - 1].value
						} else if (30 == maType && ma30.length > 0) {
							currentMaVal = ma30[ma30.length - 1].value
						}
						//console.log('createMA--->',currentMaVal)
						//this.setMa(maType, currentMaVal)
						this.$ownerInstance.callMethod('logicCallFun', {
							name: 'setMa',
							params: [maType, currentMaVal]
						})
					}
					maStatus = true
				}
			},
			updateBoll: function(t) {
				var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 20;
				if (seriesData.length >= e) {
					var i = {
							middle: null,
							up: null,
							down: null
						},
						a = seriesData.slice(seriesData.length - 2),
						n = (Number(a[1].time),
							Number(a[0].time),
							Number(t.time) - Number(a[1].time));
					0 == n ? (seriesData.pop(),
						seriesData.push(t)) : n > 0 && seriesData.push(t);
					var r = seriesData.slice(seriesData.length - e);
					var o = this.calculateBoll(r);
					o.middle.length > 0 && (i.middle = o.middle[0].value.toFixed(m),
							w.middle.update(o.middle[0])),
						o.up.length > 0 && (i.up = o.up[0].value.toFixed(m),
							w.up.update(o.up[0])),
						o.down.length > 0 && (i.down = o.down[0].value.toFixed(m),
							w.down.update(o.down[0])),
						//this.setBollData(i)	//APP不支持用下面
						this.$ownerInstance.callMethod('logicCallFun', {
							name: 'setBollData',
							params: [i]
						})
				}
			},
			updateMA: function(obj) {
				for (var arr = [5, 10, 30], i = 0, a = arr; i < a.length; i++) {
					var n = a[i];
					if (seriesData.length > n) {
						var r = seriesData.slice(seriesData.length - 2),
							o = (Number(r[1].time),
								Number(r[0].time),
								Number(obj.time) - Number(r[1].time));
						0 == o ? (seriesData.pop(),
							seriesData.push(obj)) : o > 0 && seriesData.push(obj);
						var s = seriesData.slice(seriesData.length - n),
							f = this.calculateMA(n, s);
						//this.setMa(n, f[0].value),
						this.$ownerInstance.callMethod('logicCallFun', {
								name: 'setMa',
								params: [n, f[0].value]
							}),
							5 == n ? lineMA5 && f.length > 0 && lineMA5.update(f[0]) : 10 == n ? lineMA10 && f.length >
							0 && lineMA10.update(f[0]) : 30 == n && lineMA30 && f.length > 0 && lineMA30.update(f[0])
					}
				}
			},
			hideBoll: function() {
				bollStatus = false;
				for (var t = Object.keys(w), e = 0, i = t; e < i.length; e++) {
					var a = i[e],
						n = w[a];
					n && n.applyOptions({
						visible: maStatus
					})
				}
			},
			hideMA: function() {
				maStatus = false;
				for (var t = [lineMA5, lineMA10, lineMA30], e = 0, i = t; e < i.length; e++) {
					var a = i[e];
					a && a.applyOptions({
						visible: maStatus
					})
				}
			},
			destroyMA: function() {
				chart && (lineMA5 && (chart.removeSeries(lineMA5),
							lineMA5 = null),
						lineMA10 && (chart.removeSeries(lineMA10),
							lineMA10 = null),
						lineMA30 && (chart.removeSeries(lineMA30),
							lineMA30 = null)),
					maStatus = false
			},
			switchStudyVisible: function(t, e) { //眼睛
				(maStatus || bollStatus) && (maStatus && this.destroyMA(),
					bollStatus && this.closeBoll(),
					e.callMethod("setSubActive", null))
			},
			switchStudy: function(t, e) { //ma or boll
				//console.log(t)
				var i = t.target.dataset.current,
					a = t.target.dataset.subactive;
				//console.log('switchStudy',i,a,bollStatus)
				if (0 == i) {
					if (maStatus)
						return void(this.bollVisible = false);
					bollStatus && this.closeBoll(),
						this.createMA()
				} else if (1 == i) {
					if (bollStatus)
						return void(maStatus = false);
					maStatus && this.destroyMA(),
						this.createBoll()
				}
				i == a ? e.callMethod("setSubActive", null) : e.callMethod("setSubActive", i)
			},
			handleCrossMove: function(t) {
				if (!t.time || t.point.x < 0 || t.point.x > clientWidth || t.point.y < 0 || t.point.y > clientHeight) {
					this.$ownerInstance.callMethod('logicCallFun', {
						name: 'setToolTipVisible',
						params: [{
							visible: false
						}],
					})
				} else {
					//console.log('tttt->',t)
					var e = 171,
						i = 164,
						a = 15 //偏移值
						,
						n = t.point.y,
						r = t.point.x + a; //left距离
					r > clientWidth - e && (r = t.point.x - a - e); //如果右边放不下 则移左边
					var canvastop = 37
					var s = n + a + canvastop; //top距离
					s > clientHeight - i && (s = t.point.y - i - a + canvastop);

					var l = t.time,
						k = t.seriesPrices.get(candleSeries),
						y = {};
					if (maStatus) {
						var x = t.seriesPrices.get(lineMA5) || NaN;
						x && (x = x.toFixed(m));
						var g = t.seriesPrices.get(lineMA10) || NaN;
						g && (g = g.toFixed(m));
						var C = t.seriesPrices.get(lineMA30) || NaN;
						C && (C = C.toFixed(m)),
							Object.assign(y, {
								ma5: x,
								ma10: g,
								ma30: C
							})
					}
					if (bollStatus)
						for (var _ = Object.keys(w), S = 0, A = _; S < A.length; S++) {
							var M = A[S],
								T = w[M],
								E = t.seriesPrices.get(T);
							E && (y[M] = E.toFixed(m))
						}
					var L = Object.assign({}, k, y, {
						time: this.dateFormat(l, "Y-m-d H:i")
					});

					//设置提示框坐标
					// this.setTooltipPosition({
					// 	top: s,
					// 	left: r
					// }),
					this.$ownerInstance.callMethod('logicCallFun', {
							name: 'setTooltipPosition',
							params: [{
								top: s,
								left: r
							}]
						}),
						//设置提示框显示
						// this.setToolTipVisible({
						// 	visible: true
						// }),
						this.$ownerInstance.callMethod('logicCallFun', {
							name: 'setToolTipVisible',
							params: [{
								visible: true
							}]
						}),
						//更新提示框数据
						//this.setTooltipData(L)
						this.$ownerInstance.callMethod('logicCallFun', {
							name: 'setTooltipData',
							params: [L]
						})
				}
			},
			handleClick: function(t) {},
			testClick: function(t, e) {
				var i = "hello world";
				e.callMethod("systemlog", i)
			},
			onPeriodChange: function(e, i) {

				var a = e.currentTarget.dataset,
					current = a.current,
					r = (a.period, a.key),
					ismore = (a.type, a.ismore);
				//console.log('aaaa',a)
				ismore ? (console.log("ismore = ", ismore),
						i.callMethod("onSubTabClick", current)) : i.callMethod("setSubcurrent", {
						index: current
					}),
					i.callMethod("setCurrent", current),
					i.callMethod("serPeriod", r),
					i.callMethod("fetchHistory", {}),
					i.callMethod("periodChange", r),
					this.applyTimeScale(r)
			},




			dateFormat: function(timestamp, formats) { //格式化时间戳到任意时间
				// formats格式包括
				// 1. Y-m-d
				// 2. Y-m-d H:i:s
				// 3. Y年m月d日
				// 4. Y年m月d日 H时i分
				formats = formats || 'Y-m-d';

				let zero = function(value) {
					if (value < 10) {
						return '0' + value;
					}
					return value;
				};

				let myDate = timestamp ? new Date(timestamp) : new Date();
				
				let localTime = myDate.getTime();
				let localOffset = myDate.getTimezoneOffset() * 60 * 1000;
				myDate = new Date(localTime + localOffset);
				
				let newyorkTime = myDate.getTime();
				let newyorkOffset = -4 * 60 * 60 * 1000;
				myDate = new Date(newyorkTime + newyorkOffset);

				let year = myDate.getFullYear();
				let month = zero(myDate.getMonth() + 1);
				let day = zero(myDate.getDate());

				let hour = zero(myDate.getHours());
				let minite = zero(myDate.getMinutes());
				let second = zero(myDate.getSeconds());

				return formats.replace(/Y|m|d|H|i|s/ig, function(matches) {
					return ({
						Y: year,
						m: month,
						d: day,
						H: hour,
						i: minite,
						s: second
					})[matches];
				});
			}
		}
	}
</script>

<style lang="scss" scoped>
	/* 请根据需求修改图表容器尺寸，如果父容器没有高度图表则会显示异常 */
	/*.tv_chart_container{
  width: 100vw;
  height:100vw;
  max-height: 1200rpx;
}*/
	.echarts {
		width: 100%;
		height: 100%;
	}




	.ma-labels {
		position: absolute;
		top: 72rpx;
		left: 4rpx;
		display: flex;
		flex-direction: row;
		z-index: 100;

		.label-item {
			font-size: 22rpx;
			margin-right: 10rpx;

			&.ma5 {
				color: #b19228
			}

			&.ma10 {
				color: #1783de
			}

			&.ma30 {
				color: #91208a
			}
		}
	}

	.boll-labels {
		position: absolute;
		top: 72rpx;
		left: 4rpx;
		display: flex;
		flex-direction: row;
		z-index: 100;

		.label-item {
			font-size: 22rpx;
			margin-right: 10rpx;

			&.up {
				color: #b19228
			}

			&.middle {
				color: #1783de
			}

			&.down {
				color: #91208a
			}
		}
	}

	.up {
		color: #b19228
	}

	.middle {
		color: #1783de
	}

	.down {
		color: #91208a
	}

	.ma5 {
		color: #b19228
	}

	.ma10 {
		color: #1783de
	}

	.ma30 {
		color: #91208a
	}

	.option-kline-container {
		width: 100%;
		height: 100%;
		min-height: 428rpx;
		position: relative;
		background-color: #1B2C42;

		#tv_chart_container {
			position: relative;
			height: calc(214px);
			width: 100%;
			min-height: 428rpx;
		}
	}

	.button-hover {
		background-color: #f7f9f8
	}

	.option-kline-tabs {
		display: flex;
		font-weight: 700;
		position: relative;
		font-size: 24rpx;

		.kline-tabs-item {
			padding: 10rpx 0;

			&:first-child {
				padding: 10rpx 32rpx
			}

			&.brand {
				color: #FFC107
			}

			.tabdown-icon {
				margin-left: 10rpx
			}

			.kline-tabs-sub {
				color: var(--text-color);
				background-color: #fff;
				padding: 10rpx;
				position: absolute;
				bottom: -10rpx;
				left: 10rpx;
				right: 10rpx;
				transform: translateY(100%);
				display: flex;
				flex-flow: row wrap;
				justify-content: space-between;
				white-space: nowrap;
				z-index: 101
			}

			.kline-tabs-sub {
				&.index {
					display: flex;
					flex-flow: column nowrap;
					padding: 20rpx;

					.kline-tabs-sub-item {
						display: flex;
						justify-content: space-between;
						margin-bottom: 20rpx;

						.kline-tabs-label {
							flex: 0 0 auto;
							width: 214rpx;
							text-align: center;
							display: flex;
							align-items: center;
							justify-content: center
						}

						.kline-tabs-sub-main {
							flex: 1;
							display: flex;
							flex-flow: row wrap;
							justify-content: space-between;

							.tabs-sub-main-item {
								flex: 0 0 50%;
								text-align: center;
								padding: 10rpx 0;

								&.active {
									color: #FFC107
								}
							}
						}

						.tabs-sub-visible {
							flex: 0 0 auto;
							width: 214rpx;
							text-align: center;
							color: #c3c3cd
						}

						.tabs-sub-visible {
							&.brand {
								color: #FFC107
							}
						}
					}
				}

				.kline-sub-tab-mask {
					z-index: 100;
					position: fixed;
					width: 100%;
					height: 100%;
					top: 0;
					left: 0;
					right: 0;
					bottom: 0
				}

				.tabs-sub-item {
					width: 128rpx;
					display: flex;
					justify-content: center;
					padding: 10rpx 0;
					align-items: center;

					&.active {
						color: #FFC107
					}
				}

			}
		}
	}


	.tooltip {
		position: absolute;
		top: 23px;
		left: 16px;
		width: 171px;
		z-index: 199;
		background-color: #fff;
		color: #909399;
		padding: 16px;
		border-radius: 8px;
		border: 1px solid var(--border-color);
		font-size: 10px;

		.line {
			display: flex;
			justify-content: space-between
		}
	}


	.kline-tabs-wrap {
		font-size: 24rpx;
		display: flex;
		flex-flow: row nowrap;
		align-items: center;
		justify-content: space-between;
		padding: 0 32rpx;
		background: var(--page-background-color);
		color: var(--text-color);
		font-weight: 700;
		position: relative;
		z-index: 101;

		.kline-tab-item {
			/*padding: 0 10rpx;*/
			height: 70rpx;
			line-height: 70rpx;
			text-align: center;

			/*&:first-child {*/
			/*  padding-left: 0;*/
			/*}*/
			&.has-sub {
				margin-right: 20rpx
			}

			&:last-child {
				margin-right: 0
			}

			&.active {
				color: #FFC107
			}

			.kline-tab-label {
				.label {
					&.active {
						color: #FFC107
					}
				}
			}
		}
	}


	.kline-tabs-wrap .kline-tabs-fixed-wrpas {
		display: flex;

		/*position: absolute;*/
		/*right: 0;*/
		.arrow {
			-webkit-transform: scale(.63);
			transform: scale(.63);
			margin-left: 8rpx
		}
	}

	.kline-tabs-wrap {
		.kline-tab-more-wrap {
			z-index: 110;
			display: flex;
			flex-flow: row wrap;
			background-color: #fff;
			position: absolute;
			left: 10rpx;
			right: 10rpx;
			bottom: 0;
			transform: translateY(100%);
			padding: 10rpx;

			.kline-tab-more-item {
				width: 128rpx;

				.kline-tab-more-item-hover {
					background-color: #f7f9f8
				}

				&.kline-tab-more-item-hover {
					background-color: #f7f9f8
				}
			}
		}

		.kline-tab-index-wrap {
			position: absolute;
			left: 10rpx;
			right: 10rpx;
			bottom: -10rpx;
			transform: translateY(100%);
			padding: 10rpx;
			background-color: #fff;
			padding: 0 32rpx;

			.kline-tab-index-item {
				display: flex;
				justify-content: space-between;

				.kline-index-label {
					flex: 0 0 auto;
					width: 214rpx
				}

				.kline-index-main {
					flex: 1;
					display: flex;
					flex-flow: row wrap;

					.kline-index-text {
						width: 106rpx;

						&.active {
							color: #FFC107
						}
					}
				}
			}

			.kline-index-eye-wrap {
				flex: 0 0 auto;
				width: 214rpx;
				font-size: 32rpx
			}

		}

	}
</style>
