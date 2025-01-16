<template>
	<view>
		<view class="LightweightCharts" :id="chartId" 
			:chg="action" :change:chg="LightweightCharts.update"></view>
	</view>
</template>

<!--
    H5:所有 UNI 框架的生命周期都可使用
    APP:仅可使用 VUE 组件生命周期
    视图层与逻辑层可以重复定义生命周期，都会执行。
	视图层可以通过this.$ownerInstance.callMethod('方法名', 传的值) 来和逻辑层进行通信
	
	:变量名="变量值" :change:变量名=”renderjs模块上的方法“
	change就是监听定义的变量发生改变---->触发视图层上的方法----->通过this.$ownerInstance.callMethod('方法名', 传的值)给页面传参---->页面接收值---->渲染页面
	https://www.jianshu.com/p/8cd2b0db7b65
-->
<!-- 逻辑层 -->
<script>
export default {
	name:"lightweightcharts",
	props: {
		chartId:{	//ID
			type:String,
			default:'Lcharts'
		}
	},
	data() {
		return {
			runtime:0, 
			action:{}
		}
	},
	methods:{
		emit:function(obj){	//发送相关事件（只能传递简单数据）
			this.$emit(obj[0],obj[1])
		}
	},
	created:function(){
		//this.option = this.setOption
		//this.createTime('option')
	},
	mounted:function(){
		uni.$on('chartEvent',(obj)=>{	//监听到数据
			this.action = obj
			console.log('接收到事件',obj)
		})
	},
	beforeDestroy:function(){
		uni.$off('chartEvent')
	}
}
</script> 
 <!-- 视图层 -->
<script module="LightweightCharts" lang="renderjs">
	export default {
		data() {
			return {
				chart: null,
				option:{
				  //width: width,
				  //height: height,
				    layout: {	//图表布局
					  backgroundColor: "#1B2C42",
					  textColor: "#696969",
					  fontSize: 12
					},
					grid: {	//网格
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
						borderVisible: false ,//右侧价格刻度
					},
					timeScale: {//底部时间刻度
						borderVisible: false
					}
				}
			}
		},
		mounted() {
			
			if (typeof window.LightweightCharts === 'object') {
				this.init()
			} else {
				// 动态引入类库
				const script = document.createElement('script')
				script.src = './static/lightweight-charts.js'
				script.onload = this.init
				document.head.appendChild(script)
			}
			
		},
		methods: {
			/**
			 * 初始化echarts 
			 */
			init() {
				
				this.chart = LightweightCharts.createChart(this.$el,this.option)
				//this.chart = LightweightCharts.createChart(document.getElementById("tv_chart_container"),this.option)
				//点击取消十字线相关
				/*this.chart.subscribeCrosshairMove(param => {
				    console.log("subscribeCrosshairMove",param);
				});
				
				this.chart.subscribeClick(param => {
				    console.log("subscribeClick",param);
				});*/
				
				//this.$ownerInstance.callMethod('emit', ['chartInit','success'])	//调用逻辑层方法发送chartInit初始化指令
				
				this.applyTimeScale('min')
			},
			/**
			 * 监测数据更新
			 * @param {Object} option
			 */
			update(newValue, oldValue, ownerInstance, instance) {
				console.log('action-->')
				let act = this.action
				if (this.chart) {
					//console.log('act',act)
					
					if(act.name=='addCandlestickSeries'){
						//console.log("addCandlestickSeries-->",act.name)
						this.candlestickSeries(act)
						
					}else if (act.name=='option') {// 因App端，回调函数无法从renderjs外传递，故在此自定义设置相关回调函数
						// tooltip
						/*
						if (option.tooltip) {
							// 判断是否设置tooltip的位置
							if (option.tooltip.positionStatus) {
								option.tooltip.position = this.tooltipPosition()
							}
							// 判断是否格式化tooltip
							if (option.tooltip.formatterStatus) {
								option.tooltip.formatter = this.tooltipFormatter(option.tooltip.formatterUnit, option.tooltip.formatFloat2, option.tooltip.formatThousands)
							}
						}*/
						// 设置新的option
						console.log('更新opti')
						this.chart.applyOptions(act.data)
					}else{
						//this.chart.applyOptions(option)
						console.log('未知类型')
					}
					
					
				}
			},
			candlestickSeries:function(obj){
				const candlestickSeries = this.chart.addCandlestickSeries();
				if(obj.method=='setData'){
					candlestickSeries.setData(obj.data);
				}else{
					candlestickSeries.update(obj.data);
				}
				
			},
			applyTimeScale: function(t) {	//X轴时间线配置(用于切换了数据类型时调用)
				let that = this
				this.chart && ("1day" == t ? this.chart.applyOptions({
					timeScale: {
						timeVisible: true,
						secondsVisible: true,
						tickMarkFormatter: function(t) {
							return that.dateFormat(t,"Y/m/d")
						}
					}
				}) : this.chart.applyOptions({
					timeScale: {
						timeVisible: true,
						secondsVisible: true,
						tickMarkFormatter: function(t) {
							return that.dateFormat(t,"m-d H:i")
						}
					}
				}))
			},
			dateFormat:function (timestamp, formats) {	//格式化时间戳到任意时间
			    // formats格式包括
			    // 1. Y-m-d
			    // 2. Y-m-d H:i:s
			    // 3. Y年m月d日
			    // 4. Y年m月d日 H时i分
			    formats = formats || 'Y-m-d';
			
			    let zero = function (value) {
			        if (value < 10) {
			            return '0' + value;
			        }
			        return value;
			    };
			
			    let myDate = timestamp? new Date(timestamp): new Date();
				
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
			
			    return formats.replace(/Y|m|d|H|i|s/ig, function (matches) {
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
	.echarts {
		width: 100%;
		height: 100%;
	}
</style>
