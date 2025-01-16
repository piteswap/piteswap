<template>
  <div class="home" style="padding-top: 48px">
    <div class="hangqiang">
      全部行情
    </div>
    <div class="main_shuju">

      <div class="main_btn">
        <button class="btn">

          USDT
        </button>
      </div>
      <!--

数据
-->
      <div class="coinbox ft12 rbom" style="min-height: 700px">
        <div class="flex classfity txtgray">
          <div class="flex alcenter"><span>交易对</span>
            <p class="flex column between"></p>
          </div>
          <div class="flex alcenter jscenter"><span>最新价</span>
            <p class="flex column between">
              <!--              <span class="up"></span> <span class="down"></span>-->
            </p>
          </div>
          <div class="flex alcenter jscenter"><span>涨幅</span>
            <p class="flex column between">
              <!--              <span class="up"></span> <span class="down"></span>-->
            </p>
          </div>
          <div class="flex alcenter jscenter"><span>最高价</span>
            <!---->
          </div>
          <div class="flex alcenter jscenter"><span>最低价</span>
            <!---->
          </div>
          <div class="flex alcenter jscenter"><span>24H量</span>
            <!---->
          </div>
        </div>
        <ul>
          <li>
            <div class=" flex coinlist alcenter curPer hove hove" style=""
                 v-for="item in quotationList" :key="item.id" v-if="item.is_display == 1 && item.open_microtrade == 1"
            >
              <p class="flex alcenter">
                <span class="iconfont ft14 gray"><img src="../../static/imgs/wjx.png" alt=""
                                                      style="width: 14px;height: 14px;margin-top: 5px"/></span>
                <span class="ml5">{{ item.currency_name }}</span></p>
              <p><span>{{ item.now_price || '0.00' |numFilters(4) }}</span></p>
              <p class="tl change" :class="item.change < 0?'red':'green'"><span>
					                 {{ item.change || '0.00' }}%
					                </span></p>
              <p> {{ item.high || '0.00'| numFilters(5) }}</p>
              <p>{{ item.low || '0.00'| numFilters(5) }}</p>
              <p>{{ item.volume || '0.00' | numFilters(2) }}</p>
            </div>

            <!---->
          </li>
        </ul>
      </div>

    </div>
  </div>
</template>

<script>
//	import headerHome from '../header/header.vue';
import indexHeader from "@/view/indexHeader";

export default {
  name: "quotation",
  components: {
    indexHeader,
  },
  filters: {
    numFilters: function (value,num) {
      if (!value) {
        return '0.0000'
      }
      value = value.toFixed(parseInt(num)).toString()
      return value.slice(0) + ' '
    }
  },
  data() {
    return {
      account_number: "",
      password: "",
      quotationList: [],
      btnSelect: 0,
      userAccount: localStorage.getItem("userAccount") || "",
      codeShow: 3,
      newsList: [],
      skins: localStorage.getItem("skin") || "days",
      swiperImgs: []
    };
  },
  created() {
    this.account_number = "";
    this.password = "";
    this.init();
    this.$http({
      url: "/api/" + "news/list",
      method: "post",
      data: {
        c_id: 4
      }
    }).then(res => {
      if (res.data.type == "ok") {
        this.newsList = res.data.message.list;
      }
    });
    this.getSwiper();
  },
  beforeCreate() {
    // if(
    // 	localStorage.getItem("skin") &&
    // 	localStorage.getItem("skin") == "nights"
    // ) {
    // 	document
    // 		.querySelector("html")
    // 		.setAttribute("style", "background-color:#171c2b;");
    // } else {
    // 	document
    // 		.querySelector("html")
    // 		.setAttribute("style", "background-color:#f8f6f6;");
    // }
  },
  beforeDestroy() {
    document.querySelector("html").removeAttribute("style");
  },
  methods: {
    init() {
      var that = this;
      this.$http({
        url: "/api/" + "currency/quotation_new",
        method: "get",
        data: {}
        // headers: { Authorization: localStorage.getItem("token") }
      }).then(res => {
        if (res.data.type == "ok") {

          var arr = [];
          var arr2 = [];
          for (var i = 0; i < res.data.message.length; i++) {
            for (var j = 0; j < res.data.message[i].quotation.length; j++) {
              arr.push(res.data.message[i].quotation[j]);
            }
          }
          that.quotationList = arr;
          that.marketSocket();
        }
      })
          .catch(error => {
          });
    },
    userInfo() {
      var that = this;
      this.$http({
        url: "/api/" + "user/info",
        method: "get",
        data: {},
        headers: {
          Authorization: localStorage.getItem("token")
        }
      })
          .then(res => {
            if (res.data.type == "ok") {
              localStorage.setItem("user_id", res.data.message.id);
              localStorage.setItem("userAccount", res.data.message.account);
              localStorage.setItem(
                  "extension_code",
                  res.data.message.extension_code
              );
              localStorage.setItem("is_seller", res.data.message.is_seller);
              if (res.data.message.seller) {
                if (res.data.message.seller.length > 0) {
                  localStorage.setItem(
                      "status",
                      res.data.message.seller[0].status
                  );
                  let obj = {
                    sellerValue: res.data.message.is_seller,
                    statusValue: res.data.message.seller[0].status
                  };
                  eventBus.$emit("seller", obj);
                }
              }
              that.$router.push({
                path: "/"
              });
            }
          })
          .catch(error => {
          });
    },
    login() {
      let account_number = this.$utils.trim(this.account_number);
      let password = this.$utils.trim(this.password);
      if (this.account_number.length == "") {
        layer.tips(this.$t('set.enterAccount'), "#account");

        return;
      }
      if (this.password.length < 6) {
        layer.tips(this.$t('login.psw6'), "#pwd");
        return;
      }
      var i = layer.load();
      this.$http({
        url: "/api/" + "user/login",
        method: "post",
        data: {
          user_string: account_number,
          password: password,
          type: 1
        }
      })
          .then(res => {
            layer.close(i);
            res = res.data;
            if (res.type === "ok") {
              localStorage.setItem("token", res.message);
              localStorage.setItem("accountNum", account_number);
              this.$store.commit("setAccountNum");
              this.userInfo();
            } else {
              layer.msg(res.message);
            }
          })
          .catch(error => {
            console.log(error);
          });
    },
    inputs() {
      var that = this;
      if (that.account_number != "" && that.password.length >= 6) {
        that.btnSelect = 1;
      } else {
        that.btnSelect = 0;
      }
    },
    // 行情socket
    marketSocket() {
//				console.error('开始调用ws');
      var that = this;
      that.$socket.emit("login", localStorage.getItem("user_id"));

      that.sockets.subscribe("daymarket", msg => {
//					console.error('收到回调')
        if (msg.type == "daymarket") {
          console.log('daymarket',msg);
          for (var i = 0; i < that.quotationList.length; i++) {
            if (
                that.quotationList[i].legal_id == msg.legal_id &&
                that.quotationList[i].currency_id == msg.currency_id
            ) {
              that.quotationList[i].now_price = msg.now_price;
              that.quotationList[i].change = msg.change;
              that.quotationList[i].volume = msg.volume;
              that.quotationList[i].high = msg.high;
              that.quotationList[i].low = msg.low;
            }
          }
        }
      });
    },
    links() {
      var that = this;
      that.$router.push({
        path: "/leverdealCenter"
      });
    },
    mine_over() {
      var that = this;
      that.codeShow = true;
    },
    mine_out() {
      var that = this;
      that.codeShow = false;
    },
    getSwiper() {
      this.swiperImgs = [{
        "id": 99,
        "c_id": 4,
        "lang": "zh",
        "title": "IFTI",
        "thumbnail": "http://www.iftiex.com/images/zwtp.png",
        "cover": "http://www.iftiex.com/images/zwtp.png",
        "sorts": 0
      }, {
        "id": 99,
        "c_id": 4,
        "lang": "zh",
        "title": "IFTI",
        "thumbnail": "http://www.iftiex.com/images/zwtp.png",
        "cover": "http://www.iftiex.com/images/zwtp.png",
        "sorts": 0
      }]
      return
      this.$http({
        url: "/api/news/list",
        method: "post",
        data: {
          c_id: 8
        }
      })
          .then(res => {
            console.log(res);
            if (res.data.type == "ok") {
              this.swiperImgs = res.data.message.list;
            }
          })
          .then(() => {
            var mySwiper02 = new Swiper(".banner_wrap", {
              // direction: 'vertical',
              loop: true,
              autoplay: 2000,
              // 如果需要分页器
              pagination: ".swiper-pagination02",
              paginationClickable: true,
              observer: true, //修改swiper自己或子元素时，自动初始化swiper
              observeParents: true //修改swiper的父元素时，自动初始化swiper
            });
          });
    },
  }
  // beforeRouteEnter(to, from, next) {
  //   if (from.name == "dealCenter") {
  //     window.location.reload();
  //   }
  //   next();
  // }
};
</script>

<style scoped>
html {
  background: #262a42;
}

.home {
  margin-bottom: 3px
}

.hangqiang {
  width: 100%;
  height: 60px;
  line-height: 60px;
  color: #c7cce6;
  margin-top: 3px;
  background-color: #181b2a;
  text-indent: 2em;
}

.main_shuju {
  width: 100%;
  height: 100%;
  background-color: #181b2a;
  color: #c7cce6;
}

.main_quanbu {
  width: 100%;
  height: 60px;
  line-height: 60px;
  border-bottom: 1px solid #192638;
}

.btn {
  color: #fff;
  background-color: #357ce1;
  margin: 0 10px;
  height: 30px;
  line-height: 30px;
  padding: 0 10px;
  border-radius: 2px;
  font-size: 14px;
  cursor: pointer;
  border: none;
  margin-top: 15px;
  margin-left: 35px;
}

.coinbox {
  padding: 0 40px;
  box-shadow: 0 2px 4px rgba(28, 36, 44, .05);
}

.ft12 {
  font-size: 12px;
}

.classfity {
  padding: 0 10px;
  height: 40px;
  line-height: 40px;
  color: #9ca9b5;
}

.flex {
  display: flex;
  -webkit-display: flex;
  -moz-display: flex;
  -ms-display: flex;
  -o-display: flex;
}


.coinbox .classfity > div:first-child, .coinbox .classfity div:nth-child(4) {
  width: 18%;
  -ms-flex: none;
  flex: none;
}

.coinbox .classfity > div:first-child, .coinbox .classfity div:nth-child(1) {
  width: 10%;
  -ms-flex: none;
  flex: none;
}

.coinbox .classfity > div:first-child, .coinbox .classfity div:nth-child(6) {

  /*margin-left: 20px;*/
}

.innerbox .coinbox .classfity > div {
  -ms-flex: 1;
  flex: 1;
  cursor: pointer;
}

.alcenter {
  -ms-flex-align: center;
  align-items: center;
}

.coinbox ul li div {
  height: 56px;
  font-size: 16px;
  line-height: 56px;
  border-bottom: 1px solid #171c2b;
  color: #c7cce6;
}

.curPer, .pointer {
  cursor: pointer;
}

.alcenter {
  -ms-flex-align: center;
  align-items: center;
}

.coinbox ul li div > p:first-child, .innerbox .coinbox ul li div p:nth-child(4) {
  width: 10%;
  -ms-flex: none;
  flex: none;
}

.coinbox ul li div p {
  /*-ms-flex: 1;*/
  flex: 1;
}

.gray {
  color: #d3dfe6;
}

.ft14 {
  font-size: 14px;
}

.iconfont {
  font-family: "iconfont" !important;
  font-size: 16px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.ml5 {
  margin-left: 15px;
}

.tl {
  /* text-align: left; */
}

.coinbox ul li div .green span {
  color: #0da88b;
  background-color: rgba(13, 168, 139, .1);
}

.coinbox ul li div .red span {
  color: #ef5656;
  background-color: rgba(239, 86, 86, .1);
}

.coinbox ul li div .change span {
  width: 80px;
  display: block;
  height: 30px;
  line-height: 30px;
  text-align: center;
}

.coinbox .classfity > div p {
  height: 25px;
}

.between {
  -ms-flex-pack: justify;
  justify-content: space-between;
}

.column {
  -ms-flex-direction: column;
  flex-direction: column;
}

.coinbox .classfity > div p .up.sort {
  border-color: transparent transparent #4e5b85;
}

.coinbox .classfity > div p .up {
  border-color: transparent transparent #9ca9b5;
}

.coinbox .classfity > div p span {
  width: 0;
  height: 0;
  border-width: 5px;
  border-style: solid;
  margin-left: 10px;
}

.coinbox .classfity > div p .down {
  border-color: #9ca9b5 transparent transparent;
}

.coinbox .classfity > div p span {
  width: 0;
  height: 0;
  border-width: 5px;
  border-style: solid;
  margin-left: 10px;
}

.classfity > div {
  -ms-flex: 1;
  flex: 1;
  /* cursor: pointer; */
}

.hove:hover {
  background-color: #190303;
}
</style>
