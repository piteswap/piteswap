let configData = {}
const NODE_ENV = 'dev'; // dev:开发环境 | test:测试环境  
if (process.env.NODE_ENV === "development") {
	console.log('本地环境') 			//本地环境
	configData = {
		apiServer: 'https://piaichat.com/api'	//基础API地址（只修改前面的域名部分 注意是http还是https）
	}
} else {
	if (NODE_ENV === 'test') {//测试环境
		console.log('测试环境')
		configData = {
			apiServer: 'https://piaichat.com/api'	//基础API地址（只修改前面的域名部分 注意是http还是https）
		}
	}else{//生产环境
		//console.log('生产环境')
		configData = {
			apiServer: 'https://piaichat.com'//基础API地址（只修改前面的域名部分 注意是http还是https）
		}
	}
}
configData.staticUrl = 'https://piaichat.com'	//staticURL 静态资源URL(注意后面没有反斜线)

configData.name = 'Pite swap'	//项目名称
configData.version = '2.5.8'	//版本号

//tg链接
configData.serviceLink = 'https://piaichat.com'	
//内部在线客服
configData.serviceChat = 'https://piaichat.com'	
//内部在线客服打开方式 self=当前窗口内嵌   blank=手机默认浏览器中打开(用于在线客服链接无法内嵌情况)
configData.serviceChatOpenType = 'blank' 

//以下不要动！不要动！不要动！
configData.langList = [
	{title:'English',value:'en'},
	{title:'日本',value:'jp'},
	{title:'한국인',value:'kr'},
	{title:'España',value:'esp'},
	{title:'中文',value:'zh'},
	{title:'繁體中文(臺灣)',value:'hk'},
	{title:'ไทย',value:'th'}
]

configData.netType = {
	'USDT':['TRC20','OMNI','ERC20'],
	'BTC':['OMNI'],
	'ETH':['ERC20']
}

configData.baseCoin = [
	{name:'USDT',currency_id:3},
	{name:'ETH',currency_id:2},
	{name:'BTC',currency_id:1},
	{name:'Bank',currency_id:9999}
]

export default configData