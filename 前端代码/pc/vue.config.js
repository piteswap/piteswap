module.exports = {
    lintOnSave: false,
    devServer: {
        overlay: {
            warning: false,
            errors: false
        }
    },
    publicPath: './',
    productionSourceMap: false,
    devServer: {
        port: 8008,
        open: false,
        overlay: {
          warnings: false,
          errors: true,
        },
        //配置跨域代理http,https
        proxy: {
          "/api": {
            target: "https://www.piaichat.com", //请求地址
			secure: false,
            changeOrigin: true, // 在本地会创建一个虚拟服务端，然后发送请求的数据，并同时接收请求的数据
            pathRewrite: {
              // 路径重写，
             "^/api": "", //相当于是http://139.9.170.120:8001/admin，不加则是http://139.9.170.120:8001/admin/api
            },
          }
        },
    },
}
