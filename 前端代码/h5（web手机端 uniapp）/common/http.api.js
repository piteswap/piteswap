// 此处第二个参数vm，就是我们在页面使用的this，你可以通过vm获取vuex等操作，更多内容详见uView对拦截器的介绍部分：
// https://uviewui.com/js/http.html#%E4%BD%95%E8%B0%93%E8%AF%B7%E6%B1%82%E6%8B%A6%E6%88%AA%EF%BC%9F
const install = (Vue, vm) => {

	// 将各个定义的接口名称，统一放进对象挂载到vm.$u.api(因为vm就是this，也即this.$u.api)下
	vm.$u.api = {
		setLang: (params = {
			lang: uni.getStorageSync('lang') || 'en'
		}) => vm.$u.post('set/lang', params).then((res) => {
			uni.setStorageSync('language-mark', res)
		}),
		cashInfo: (params = {}) => vm.$u.post('user/cash_info', params),
		cashSave: (params = {}) => vm.$u.post('user/cash_save', params),
		areaCode: (params = {}) => vm.$u.post('area_code', params),
		sendMail: (params = {}) => vm.$u.post('user/sms_mail', params), //发邮件
		sendSms: (params = {}) => vm.$u.post('user/sms_send', params), //发短信
		userRegister: (params = {}) => vm.$u.post('user/register', params),
		userLogin: (params = {}) => vm.$u.post('user/login', params),
		getUserInfo: () => vm.$u.get('user/center'),
		getRank: () => vm.$u.get('currency/quotation_new'),
		getNews: (params = {}) => vm.$u.post('news/list', params), //获取新闻等
		getNewsDetail: (params = {}) => vm.$u.post('news/detail', params), //获取新闻详情
		getNewTimeShar: (params = {}) => vm.$u.get('currency/new_timeshar', params),
		getDealInfo: (params = {}) => vm.$u.get('currency/deal', params), //获取交易对详情
		getWallet: (params = {}) => vm.$u.post('wallet/detail', params), //获取钱包详情
		coinTrade: (params = {}) => vm.$u.post('coin/trade', params), //币币交易提交订单
		coinTradeCancel: (params = {}) => vm.$u.put('coin/trade', params), //币币交易取消订单
		coinList: (params = {}) => vm.$u.get('coin/list', params), //币币交易列表
		microTradeList: (params = {}) => vm.$u.get('microtrade/lists', params), //秒合约（期权）交易列表
		microTradeSeconds: (params = {}) => vm.$u.get('microtrade/seconds', params), //秒合约（期权）时间列表
		microTradePayable: (params = {}) => vm.$u.get('microtrade/payable_currencies', params), //支付币种列表
		microTradeSubmit: (params = {}) => vm.$u.post('microtrade/submit', params), //期权提交订单
		userCenter: (params = {}) => vm.$u.get('user/center', params), //用户中心（基础认证）
		userCenter2: (params = {}) => vm.$u.get('user/center2', params), //用户中心（高级认证）
		userRealname: (params = {}) => vm.$u.post('user/real_name', params), //用户提交实名）
		userRealname2: (params = {}) => vm.$u.post('user/real_name2', params), //用户提交高级实名）
		walletList: (params = {}) => vm.$u.post('wallet/list', params), //钱包列表
		walletLog: (params = {}) => vm.$u.post('wallet/legal_log', params), //钱包日志
		walletDetail: (params = {}) => vm.$u.post('wallet/detail', params), //钱包详情
		currencyList: (params = {}) => vm.$u.get('currency/user_currency_list', params), //用户钱包
		walletChange: (params = {}) => vm.$u.post('wallet/change', params), //划转
		walletHzHistory: (params = {}) => vm.$u.get('wallet/hzhistory', params), //划转日志
		walletAddress: (params = {}) => vm.$u.post('wallet/get_in_address', params), //获取充值地址
		walletChargeReq: (params = {}) => vm.$u.post('wallet/charge_req', params), //提交充值
		walletGetInfo: (params = {}) => vm.$u.post('wallet/get_info', params), //提币限制
		walletGetAddress: (params = {}) => vm.$u.post('wallet/get_address', params), //提币地址
		walletOut: (params = {}) => vm.$u.post('wallet/out', params), //提币
		walletAdd: (params = {}) => vm.$u.post('wallet/addaddress', params), //添加地址
		walletDelete: (params = {}) => vm.$u.post('wallet/deladdress', params), //删除地址
		userEditPwd: (params = {}) => vm.$u.post('user/e_pwd', params), //修改密码
		lHDepositReport: (params = {}) => vm.$u.get('lh/deposit/report', params), //理财统计
		lHDepositProduct: (params = {}) => vm.$u.get('lh/deposit/config', params), //理财产品列表 
		lHDepositProductInfo: (params = {}) => vm.$u.get('lh/deposit/product_info', params), //理财产品详情
		lHDepositSubmit: (params = {}) => vm.$u.post('lh/deposit', params), //提交理财
		lHDepositOrder: (params = {}) => vm.$u.get('lh/deposit/order', params), //理财订单
		lHDepositOrderCancel: (params = {}) => vm.$u.post('lh/deposit/order/cancel', params), //理财订单取消

		userPoster: (params = {}) => vm.$u.get('user/my_poster', params), //专属海报
		userShare: (params = {}) => vm.$u.get('user/my_share', params), //邀请好友分享
		userInvite: (params = {}) => vm.$u.get('user/invite', params), //我的邀请
		userInviteList: (params = {}) => vm.$u.post('user/invite_list', params), //邀请返佣榜单

		userMyInviteList: (params = {}) => vm.$u.post('user/my_invite_list', params), //我的邀请会员列表

		userMyAccountReturn: (params = {}) => vm.$u.post('user/my_account_return', params), //我的邀请返佣列表
		chongbiLog: (params = {}) => vm.$u.get('charge_mention/log2', params), //充币记录
		tibiLog: (params = {}) => vm.$u.get('charge_mention/log3', params), //提币记录
		leverDeal: (params = {}) => vm.$u.post('lever/deal', params), //合约交易信息
		leverSubmit: (params = {}) => vm.$u.post('lever/submit', params), //提交合约交易
		leverMyTrade: (params = {}) => vm.$u.post('lever/my_trade', params), //合约持仓列表
		leverClose: (params = {}) => vm.$u.post('lever/close', params), //合约平仓
		hasPwd: (params = {}) => vm.$u.post('user/has_password', params), //检查是否有交易密码
		editPayPwd: (params = {}) => vm.$u.post('safe/update_password', params), //修改交易密码
		checkMoblie: (params = {}) => vm.$u.post('user/check_mobile', params),
		checkEmail: (params = {}) => vm.$u.post('user/check_email', params),
		forgetPwd: (params = {}) => vm.$u.post('user/forget', params),

		yingsunsubmit: (params = {}) => vm.$u.post('lever/setstop', params), //提交盈损
		zy: (params = {}) => vm.$u.post('get/lang'), //获取设置的中英文

		getCon: (params = {}) => vm.$u.post('/set/get_customer_url', params), // 获取客服地址
		getCode: (params = {}) => vm.$u.post('/set/sms_other_mail', params), // 获取提币验证码
		
		getPurchaseList: (params = {}) =>vm.$u.get('lh/send/config', params), // 获取申购列表
		getPurchaseDetails: (params = {}) =>vm.$u.get('lh/send/product_info', params), // 获取申购详情
		sendOrder: (params = {}) =>vm.$u.post('lh/send/order', params), // 申购订单
		getOrderList: (params = {}) =>vm.$u.get('lh/send/order_list', params), // 订单列表
		getNotice: (params = {}) =>vm.$u.get('lh/send/get_recommend', params), // 获取消息信息
	}
}

export default {
	install
}
