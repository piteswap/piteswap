<template>
  <footer data-v-3ffbf6be="" data-locale="zh-cn" class="fedui-root fedui-footer" data-hostnmae="www.piaichat.com" id="fedui-footer">
    <div class="fedui-footer-inner">
      <div class="fedui-footer-left">
        <div class="fedui-footer-logo">
          <!-- <img width="80" height="auto" :src="$store.state.logo" alt=""> -->
           <img width="80" height="auto" src="@/assets/images/flogo.png" alt="">
          </div>
		  <!-- <div style="line-height: 20px; padding-bottom: 20px;margin-top: 15px;" class="fColor2 ft12">
		    ©Copyright 2021 Pcmcoin. All rights reserved.
		  </div> -->
        <div class="fedui-footer-copyright"></div>
        <div class="fedui-footer-link">
          <a rel="noopener noreferrer nofollow" target="_blank" href="https://www.facebook.com/huobiglobalofficial">
            <i class="fedui-icon-facebook"></i>
          </a>
          <a rel="noopener noreferrer nofollow" target="_blank" href="https://twitter.com/HuobiGlobal">
            <i class="fedui-icon-twitter"></i>
          </a>
          <a rel="noopener noreferrer nofollow" target="_blank" href="https://www.youtube.com/HuobiGlobal">
            <i class="fedui-icon-youtube"></i>
          </a>
          <a rel="noopener noreferrer nofollow" target="_blank" href="https://www.huobichat.com/globalGroup">
            <i class="fedui-icon-chat"></i>
          </a>
          <a rel="noopener noreferrer nofollow" target="_blank" href="https://medium.com/@huobiglobal">
            <i class="fedui-icon-medium"></i>
          </a>
          <a rel="noopener noreferrer nofollow" target="_blank" href="https://www.instagram.com/huobiglobalofficial/">
            <i class="fedui-icon-instagram"></i>
          </a>
          <a rel="noopener noreferrer nofollow" target="_blank" href="https://weibo.com/huobicom">
            <i class="fedui-icon-weibo"></i>
          </a>
          <a rel="noopener noreferrer nofollow" target="_blank"
             href="https://coinmarketcap.com/zh/exchanges/huobi-global/">
            <i class="fedui-icon-coinmarketcap"></i>
          </a>
          <a rel="noopener noreferrer nofollow" target="_blank" href="https://www.coingecko.com/zh/exchanges/huobi/">
            <i class="fedui-icon-clingecko"></i>
          </a>
        </div>
      </div>
      <div class="fedui-footer-right">
        <dl>
          <dt class="ft16">{{ $t('footer.about') }}</dt>
          <dd>
            <a href="javascript:;" @click="goDetail(item.id)" v-for="(item,key) in footSecond2" :key="key">{{ item.title }}</a>
          </dd>
        </dl>
        <dl>
          <dt>{{ $t('footer.explain') }}</dt>
          <dd>
            <a href="javascript:;" @click="goDetail(item.id)" v-for="(item,key) in footFrist2" :key="key">{{ item.title }}</a>
          </dd>
        </dl>
		
        <dl style="margin-left: 50px;">
          <dt style="color: #f1be1b ;text-align: center">{{ $t('footer.support') }}</dt>
          <dd>
            <a href="javascript:;" v-for="(item,key) in footContract" :key="key">{{ item.title }}</a>
          </dd>
		      <dt class="fColor2 ft12" style="margin-top: 8px;">
            <a :href="customer_url" style="text-align: center">
              <img src="@/assets/images/kefu.png" alt="" style="width: 30px">
            </a>
          </dt>
        </dl>
      </div>
    </div>
   <div style="text-align: center; border-top:1px solid #303035;background: #2a405c">
      <div style="line-height: 30px; color:#2ab098; padding-top: 15px;" class="white ft20">{{$t('siteName')}}</div>
      <div style="line-height: 30px; padding-bottom: 20px;" class="fColor2 ft12">
        ©Copyright 2021 YCoin. All rights reserved.
      </div>
    </div>
  </footer>
</template>

<script>

export default {
  data() {
    return {
      token: "",
      img_link: [],
      link: [],
      footFrist2: [],
      footSecond2: [],
      footContract: [],
      wxImg: false,
      customer_url: ''
    };
  },
  created() {
    this.token = window.localStorage.getItem("token") || "";
    // 获取客服地址
    this.$http.post("/api/set/get_customer_url", {}).then(res => {
      console.log(res,'获取客服地址')
      if (res.data.type == "ok") {
        this.customer_url = res.data.message.customer_url
      }
    });
  },
  mounted() {

    this.aboutUs();
    this.help();
    this.contract();
  },
  methods: {

    goDetail(id) {
      this.$router.push({
        path: 'components/noticeDetail',
        query: {
          id: id
        }
      })
    },

    aboutUs() {
      var that = this;
      this.$http.post("/api/news/list", {"c_id": 19, 'lang': localStorage.getItem('lang')}).then(res => {
        if (res.data.type == "ok") {
          var list = res.data.message.list;
          if (list.length > 2) {
            that.footFrist2 = list;
          } else {
            that.footFrist2 = list;
          }
        } else {
          // layer.msg(res.message);
        }
      });
    },

    help() {
      var that = this;
      this.$http.post("/api/news/list", {"c_id": 23, 'lang': localStorage.getItem('lang')}).then(res => {
        if (res.data.type == "ok") {
          var list = res.data.message.list;
          console.log('list :>> ', list);
          if (list.length > 2) {
            that.footSecond2 = list;
          } else {
            that.footSecond2 = list;
          }
        } else {
          // layer.msg(res.message);
        }
      });
    },

    contract() {
      var that = this;
      this.$http.post("/api/news/list", {"c_id": 25}).then(res => {
        if (res.data.type == "ok") {
          var list = res.data.message.list;
          if (list.length > 2) {
            that.footContract = list;
          } else {
            that.footContract = list;
          }
        } else {
          // layer.msg(res.message);
        }
      });
    },

    wxImg_over(i) {
      this.img_link[i].wxImg = true;
    },
    wxImg_out(i) {
      this.img_link[i].wxImg = false;
    }
  }
};
</script>

<style lang='scss'>

.fedui-footer {
  width: 100%;
  background-color: #2a405c;
  color: #697080;
  // padding-top: 60px;
  // padding-bottom: 0px;
  min-width: 1280px;
}

.fedui-root, .fedui-root *, .fedui-root :after, .fedui-root :before {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

.fedui-footer-inner {
  // width: 1200px;
  margin-left: auto;
  margin-right: auto;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  padding: 30px 130px;
  background: #1b2c42;
  // padding-top: 20px;
  //border-top: 1px solid #00a4d8;
}

.fedui-footer-logo {
  height: 23px;
}

.fedui-footer-copyright {
  font-size: 12px;
  color: #6a707f;
  line-height: 12px;
  padding-top: 16px;
}

.fedui-footer-link {
  padding-top: 40px;
}

.fedui-footer-link a:first-child {
  margin-left: 0;
}

.fedui-footer-link a {
  margin-left: 8px;
  width: 24px;
  height: 24px;
  text-align: center;
  line-height: 24px;
  color: #a8b7c8;
  display: inline-block;
  border-radius: 50%;
  vertical-align: top;
}

.fedui-footer-right {
  width: 792px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
}

.fedui-footer-right {
  a:hover {
    color: #fff;
  }
}

.fedui-footer-right dl {
  width: 180px;
}

.fedui-root dd, .fedui-root dl, .fedui-root dt, .fedui-root li, .fedui-root ul {
  padding: 0;
  margin: 0;
}

.fedui-footer-right dt {
  line-height: 20px;
  font-size: 16px;
  padding-bottom: 8px;
}

.fedui-footer[data-locale=ko-kr] .fedui-footer-right a, .fedui-footer[data-locale=zh-cn] .fedui-footer-right a, .fedui-footer[data-locale=zh-hk] .fedui-footer-right a, .fedui-footer[data-locale=zh-tw] .fedui-footer-right a {
  line-height: 18px;
}

.fedui-footer-right a {
  padding-top: 8px;
  display: block;
  font-size: 12px;
  line-height: 16px;
  color: #d5def2;
  word-wrap: break-word;
}
</style>
