module.exports = {
	devServer: {
		port:2000,
		// disabledHostCheck:true,
	    proxy: {
	      '/api': {
	        target: 'https://piaichat.com',
			changeOrigin:true,
	        pathRewrite: {
	          '^/api': ''
	        }
	      }
	    },
	}
}
