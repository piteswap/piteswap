// 这里的vm，就是我们在vue文件里面的this，所以我们能在这里获取vuex的变量，比如存放在里面的token

const install = (Vue, vm) => {
	
	// 同时，我们也可以在此使用getApp().globalData，如果你把token放在getApp().globalData的话，也是可以使用的
	let baseUrl = vm.webConf.apiServer
	// #ifdef H5
	baseUrl = '/api'//
	// #endif
	Vue.prototype.$u.http.setConfig({
		baseUrl: baseUrl,
		showLoading: true, // 是否显示请求中的loading
		loadingText: '', // 请求loading中的文字提示
		loadingTime: 1000, // 在此时间内，请求还没回来的话，就显示加载中动画，单位ms
		loadingMask: true,	// 展示loading的时候，是否给一个透明的蒙层，防止触摸穿透
		// 如果将此值设置为true，拦截回调中将会返回服务端返回的所有数据response，而不是response.data
		// 设置为true后，就需要在this.$u.http.interceptor.response进行多一次的判断，请打印查看具体值
		// originalData: true, 
		// 设置自定义头部content-type
		 header: {
		 	'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
			'language-mark': uni.getStorageSync('language-mark') || ''
		 }
	});
	
	// 请求拦截，配置Token等参数
	Vue.prototype.$u.http.interceptor.request = (config) => {
		//config.header.Authorization = 'xxxxxx';
		//config.header.Authorization = '24546d4481d166efc1f6066db39216be';
		// 方式一，存放在vuex的token，假设使用了uView封装的vuex方式，见：https://uviewui.com/components/globalVariable.html
		config.header.Authorization = vm.vuex_token;
		
		// 方式二，如果没有使用uView封装的vuex方法，那么需要使用$store.state获取
		// config.header.Authorization = vm.$store.state.token;
		
		// 方式三，如果token放在了globalData，通过getApp().globalData获取
		// config.header.Authorization = getApp().globalData.username;
		
		// 方式四，如果token放在了Storage本地存储中，拦截是每次请求都执行的，所以哪怕您重新登录修改了Storage，下一次的请求将会是最新值
		 //const token = uni.getStorageSync('token');
		 //config.header.Authorization = token;
		
		return config; 
	}
	// 响应拦截，判断状态码是否通过
	Vue.prototype.$u.http.interceptor.response = (res) => {
		// 如果把originalData设置为了true，这里得到将会是服务器返回的所有的原始数据
		// 判断可能变成了res.statueCode，或者res.data.code之类的，请打印查看结果
		//console.log('拦截',res)
		if(res.type === 'ok' || res.code===1) {
			// 如果把originalData设置为了true，这里return回什么，this.$u.post的then回调中就会得到什么
			return res.message || res.data;  
		}else if(res.type == '999') {
			// 假设invalid为token失效，这里跳转登录
			//vm.$u.toast('验证失败，请重新登录');
			vm.$u.vuex('vuex_token','')
			vm.$u.vuex('vuex_user',{})
			uni.showToast({
				icon:'none',
				title:res.message
			})
			
			uni.$emit('notLogin',999)	//发送一个没有登录的消息通知
			
			/*
			setTimeout(() => {
				// 此为uView的方法，详见路由相关文档
				vm.$u.route('/pages/user/login/login')
			}, 1000)
			*/
		   
			return false
		} else {
			// 如果返回false，则会调用Promise的reject回调，
			vm.$u.toast(res.message || 'ERROR');
			return false
		}
	}
}

export default {
	install
}