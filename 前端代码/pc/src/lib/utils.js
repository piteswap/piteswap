let localUtils = {  //公共方法和属性
    phone_reg: /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$/ig,
    trim: function (val) {
        return val.replace(/\s/g, '')
    },
    host: 'http://localhost:8080/',
    back_api: 'http://www.ifti.top:8070/',
    laravel_api: 'http://8.210.189.215//api/',
    node_api: 'http://8.210.189.215//',
    socket_api: 'http://8.210.189.215//',
    filterDecimals: function (values, numbers) {
        let val = Number(values);
        let num = Number(numbers);
        let nums = Number(numbers - 0 + 1);
        let base = '10';
        let decimal = base.padEnd(nums, 0) - 0;
        var vals = (Math.floor(val * decimal) / decimal).toFixed(num)
        return vals;
    }
};

export default {
    install: function (vm) {
        vm.prototype.$utils = localUtils
    }
}
