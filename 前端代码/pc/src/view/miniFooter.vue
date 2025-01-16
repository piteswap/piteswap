<template>
  <footer data-v-3ffbf6be="" data-locale="zh-cn" class="fedui-root fedui-footer" data-hostnmae="www.piaichat.com">
    <div style="text-align: center; border-top:1px solid #303035;">
      <div style="line-height: 40px; padding-top: 10px;" class="white ft20" >{{$t('siteName')}}</div>
      <div style="line-height: 40px; padding-bottom: 10px;" class="fColor2 ft12">
        ©Copyright 2021 Pcmcoin. All rights reserved.
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
      wxImg: false
    };
  },
  created() {
    this.token = window.localStorage.getItem("token") || "";
    this.getData();
  },
  mounted() {

    this.aboutUs();
    this.help();
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
    noopen() {

    },
    getData() {
      // var that = this;
      // this.$http({
      //   url:'/api/news/association'
      // }).then(res=>{
      //     if(res.data.type=='ok'){
      //       if(res.data.message){
      //           this.img_link = res.data.message.img_link;
      //           that.img_link.map(function(item){
      //             that.$set(item,'wxImg',false)
      //           })
      //           this.link = res.data.message.link;
      //       }            
      //     }
      // })
    },
    aboutUs() {
      var that = this;
      this.$http.post("/api/news/list", {"c_id": 19}).then(res => {
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
      this.$http.post("/api/news/list", {"c_id": 21}).then(res => {
        if (res.data.type == "ok") {
          var list = res.data.message.list;
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
  // background-color: #171c2b;
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
  // padding-top:20px;
  //border-top:1px solid #00a4d8;
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

.fedui-footer-right{
  a:hover{
    color:#fff;
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
