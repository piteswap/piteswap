import Vue from 'vue';
import App from './App';
import configData from '@/common/config.js'
import VueSocketIO from "vue-socket.io";
import SocketIO from "socket.io-client";
import moment from 'moment'//导入文件
Vue.prototype.$moment = moment;//赋值使用
Vue.prototype.SocketIO = SocketIO;
Vue.config.productionTip = false;
Vue.prototype.webConf = configData

App.mpType = 'app';



// 引入全局uView
import uView from 'uview-ui';
Vue.use(uView);

// 此处为演示vuex使用，非uView的功能部分
import store from '@/store';

// 引入uView提供的对vuex的简写法文件
let vuexStore = require('@/store/$u.mixin.js');
Vue.mixin(vuexStore);

// 引入uView对小程序分享的mixin封装
//let mpShare = require('uview-ui/libs/mixin/mpShare.js');
//Vue.mixin(mpShare);

//系统信息
let sysInfo = uni.getSystemInfoSync()
Vue.prototype.$sysInfo = sysInfo
function sysLang(){	//换算系统匹配语言
	let lang = 'en'
	// if(sysInfo.language == 'zh-CN'){
	// 	lang = 'zh'
	// }
	return lang
}
let defaultLang = sysLang()
console.log('defaultLang',defaultLang)

// i18n部分的配置
// 引入语言包，注意路径
import Chinese from '@/common/locales/zh.js';
import TChinese from '@/common/locales/hk.js';
import Japanese from '@/common/locales/jp.js';
import Korean from '@/common/locales/kr.js';
import English from '@/common/locales/en.js';
import Spanish from '@/common/locales/esp.js';
import Thai from '@/common/locales/th.js';

// VueI18n
import VueI18n from 'vue-i18n';

// VueI18n
Vue.use(VueI18n);

const i18n = new VueI18n({
	// 默认语言
	locale: uni.getStorageSync('lang') || defaultLang,
	// fallbackLocale: 'en',
	// 引入语言文件
	messages: {
		'zh': Chinese,
		'en': English,
		'hk': TChinese,
		'jp': Japanese,
		'kr': Korean,
		'esp': Spanish,
		'th': Thai,
	}
});

if(!uni.getStorageSync('lang')){	//设置一个默认语言
	uni.setStorageSync('lang',defaultLang)
}

// 由于微信小程序的运行机制问题，需声明如下一行，H5和APP非必填
Vue.prototype._i18n = i18n;

//保留小数位
function iTofixed(values, numbers) {
    let val=Number(values);
	let num=Number(numbers);
	let nums = Number(numbers-0);
	let base='10';
    let decimal=base.padEnd(nums,0)-0;
    var vals = (Math.floor(val*decimal)/decimal).toFixed(num);
	return vals;
}
Vue.prototype.iTofixed = iTofixed;

//返回判断
function goBack(delta) {
	let backLevel = delta || 1
	// #ifdef H5
	const pages = getCurrentPages()
	if (pages.length > backLevel) {
		uni.navigateBack({delta: backLevel})
		return;
	}
	//使用vue-router返回上一级
	let a = this.$router.go(-1)
	if (a == undefined) {
		//重新定向跳转页面
		uni.switchTab({
			url: "/pages/index/index"
		})
	}
	return false;
	// #endif
	uni.navigateBack({delta: backLevel})
}
Vue.prototype.goBack = goBack;


/**
 封装全局登录函数
 backpage : 登录后返回的页面
 backtype : 打开页面的类型[1 : redirectTo 2 : switchTab]
 noJump:	2不跳转
*/
var jumping = false
function checkLogin( backpage, backtype, noJump ){
	if(jumping){
		//console.log('重复跳转被阻止')
		return false
	}

	if(!backpage){	//如果没有则获取当前页面的
		let routes = getCurrentPages(); // 获取当前打开过的页面路由数组
		if(routes.length<1){
			return false
		}
		let currentPath = routes[routes.length - 1].$page.fullPath	//获取最后一个数组的fullpath为当前页面path
		backpage = currentPath
		if(!backtype){	//如果没有指定类型则自动判断
			let path = routes[routes.length - 1].route
			let switchTab = ['pages/index/index','pages/trade/index','pages/option/detail','pages/template/index','pages/assets/index']
			if(switchTab.indexOf(path) > -1){	//如果是tabbar中的路由地址 则使用switchTab跳转
				backtype = 2
			}
		}
	}
	
	let token = this.vuex_token
    let user = this.vuex_user
	let type = backtype || 1
    if( (!token || !user || (typeof user == 'object' && Object.keys(user) == 0 ) ) ){
		
		if(noJump==2) {
			return false	//没有数据
		}	
		
		if(backpage.indexOf('/pages/user/login/login')>-1){
			//console.log('禁止重复跳转',backpage,getCurrentPages())
			return false
		}
		
		jumping = true
		
		let _url = '/pages/user/login/login?backpage='+encodeURIComponent(backpage)+'&backtype='+type
		//console.log("_url",_url,getCurrentPages())
        uni.redirectTo({url:_url})
		setTimeout(()=>{
			jumping = false
		},1000)
        return false
    }
	
    return true
}
Vue.prototype.checkLogin = checkLogin

const app = new Vue({
	i18n,
	store,
	...App
});

// http拦截器，将此部分放在new Vue()和app.$mount()之间，才能App.vue中正常使用
import httpInterceptor from '@/common/http.interceptor.js';
Vue.use(httpInterceptor, app);

// http接口API抽离，免于写url或者一些固定的参数
import httpApi from '@/common/http.api.js';
Vue.use(httpApi, app);

Vue.prototype.$u.api.setLang()

app.$mount();

const baseSocket = 'https://piaichat.com:2000'　
Vue.prototype.socketApi = baseSocket
// Vue.use(VueSocketio, 'https://piaichat.com:2000');
Vue.use(new VueSocketio({
    debug: false,
    connection: SocketIO.connect('https://piaichat.com:2000', {
        path: '',
        transports: ['websocket', 'polling'],
    })
}));

// #ifdef APP-PLUS

let main = plus.android.runtimeMainActivity();
//为了防止快速点按返回键导致程序退出重写quit方法改为隐藏至后台  
plus.runtime.quit = function() {
    main.moveTaskToBack(false);
};
//重写toast方法如果内容为 ‘再次返回退出应用’ 就隐藏应用，其他正常toast 
plus.nativeUI.toast = (function(str) {
    if (str =='再次返回退出应用') {
        plus.runtime.quit();
    } else {
        uni.showToast({
            title: app.$t('common.exit_sure'),
            icon: 'none'
        })
    }
});


// #endif
