<template>
  <div style="width: 100%" class="indexBlackes home-box mt45">
<!-- 
    <div class="md">
      <div class="notice_box">
        <div class="notice_list">
          <span
            v-if="index == 0"
            v-for="(item, index) in noticeList"
            :key="item.id"
            class="list"
            @click="
              $router.push({
                path: 'components/noticeDetail',
                query: { id: item.id },
              })
            "
            ><a class="notice_a ft12" :data-id="item.id">{{
              item.title
            }}</a></span
          >
        </div>
      </div> -->
      
      <div class="quotation_box" style="background-color:#1b2c42;">
        <div style="width: 1300px; margin: 0 auto">
          <div class="main_btn">
            <button class="btn">USDT</button>
          </div>
          <div class="coinbox ft12 rbom" style="border: 1px solid #9ca9b5;">
            <div class="flex classfity txtgray">
              <div class="flex">
                <span>{{ $t("home.pair") }}</span>
                <p class="flex column between"></p>
              </div>
              <div class="flex">
                <span>{{ $t("market.lastprice") }}</span>
                <p class="flex column between">
                  <!--              <span class="up"></span> <span class="down"></span>-->
                </p>
              </div>
              <div class="flex">
                <span>{{ $t("market.change") }}</span>
                <p class="flex column between"></p>
              </div>
              <div class="flex">
                <span>{{ $t("home.high") }}</span>
              </div>
              <div class="flex">
                <span>{{ $t("home.min") }}</span>
              </div>
              <div class="flex">
                <span>24H {{ $t("home.volume") }}</span>
              </div>
              <div class="flex"><span>{{ $t("home.TrendChart") }}</span></div>
            </div>

            <div
              class="flex coinlist alcenter curPer hove"
              style="color: #9ca9b5;"
              v-for="item in quotationList"
              :key="item.id"
              v-if="item.is_display == 1"
            >
              <p class="flex alcenter">
                <span class="iconfont icon-star ft14 gray"></span>
                <img style="width: 20px; margin: 0 10px" :src="item.logo" />
                <span class="ml5">{{ item.currency_name }}</span>
              </p>
              <p>
                <span>{{ item.now_price || "0.00" | numFilters(4) }}</span>
              </p>
              <p class="tl change" :class="item.change < 0 ? 'red' : 'green'">
                <span> {{ item.change || "0.00" }}% </span>
              </p>
              <p>{{ item.high || "0.00" | numFilters(5) }}</p>
              <p>{{ item.low || "0.00" | numFilters(5) }}</p>
              <p>{{ item.volume || "0.00" | numFilters(2) }}</p>
              <p class="flex">
                <span>
                  <div style="width: 100%; max-width: 150px; height: 75px">
                    <ChartBox
                      height="75px"
                      width="150px"
                      :color="parseFloat(item.change) > 0 ? 'up' : 'down'"
                      peorid="1min"
                      :count="60"
                      :symbol="item.currency_name"
                    ></ChartBox>
                  </div>
                </span>
              </p>
            </div>

            <!---->
          </div>
        </div>
      </div>
      
    </div>
  </div>
</template>
<style lang="scss" scoped>
.seamless-warp2 {
  overflow: hidden;
  height: 70px;
  width: 100%;

  > ul {
    li {
      float: left;
      margin-right: 10px;
    }
  }
}

.info-list {
  margin: 60px auto;

  li {
    width: 25%;
    font-size: 14px;
    padding: 0 15px;
    box-sizing: border-box;

    .title {
      font-size: 18px;
      color: #fff;
      line-height: 40px;
    }

    img {
      height: 125px;
    }
  }
}
</style>

<script>
import "@/assets/style/iconfont2.css";
import "@/assets/style/iconfont.css";
import "@/assets/style/index.css";
import "@/assets/style/animate.min.css";
import "swiper/css/swiper.css";
import ChartBox from "@/view/chartBox";

import { Swiper, SwiperSlide, directive } from "vue-awesome-swiper";
import vueSeamlessScroll from "vue-seamless-scroll";

import indexHeader from "@/view/indexHeader";

export default {
  name: "homeContent",
  components: {
    indexHeader,
    Swiper,
    SwiperSlide,
    vueSeamlessScroll,
    ChartBox,
  },
  filters: {
    numFilters: function (value, num) {
      if (!value) {
        return "0.0000";
      }
      value = (value - 0).toFixed(parseInt(num)).toString();
      return value.slice(0) + " ";
    },
  },
  data() {
    return {
      quotation: [],
      nowCoin: "",
      pics: [{ url: 1 }, { url: 2 }],
      curSwiper: 0,
      curCoinTab: 0,
      coinTabList: [{ title: "USDT行情" }, { title: "BTC行情" }],
      coinKlineList: [],
      coinKline: {},
      swiperList: [],
      bannerHeight: 540,
      bannerWidth: "",
      screenWidth: window.innerWidth,
      coinList: [],
      coin_list: [],
      noticeList: [],
      swiperImgs: [],
      footFrist: [],
      footSecond: [],
      swiperOption: {
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      },

      quotationList: [],
      username: "",
      lang: "zh",
    };
  },
  created() {
    // this.init(this.initKline);
    this.getQuotation();
    this.lang = window.localStorage.getItem("lang");
  },
  mounted() {
    this.connect();
    this.getNews();
    this.getLunbo();
    this.initQuotation();

    let that = this;
    setInterval((res) => {
      that.quotationList.push();
      that.$refs.seamlessScroll && that.$refs.seamlessScroll.reset();
    }, 5000);
  },
  computed: {
    optionLeft() {
      return {
        direction: 2,
      };
    },
  },
  methods: {
    toRegister() {
      this.$router.push({
        name: "register",
        query: { email: this.username },
      });
    },
    initQuotation() {
      var that = this;
      this.$http({
        url: "/api/" + "currency/quotation_new",
        method: "get",
        data: {},
        // headers: { Authorization: localStorage.getItem("token") }
      })
        .then((res) => {
          if (res.data.type == "ok") {
            var arr = [];
            var arr2 = [];
            for (var i = 0; i < res.data.message.length; i++) {
              for (var j = 0; j < res.data.message[i].quotation.length; j++) {
                arr.push(res.data.message[i].quotation[j]);
              }
            }
            that.quotationList = arr;
            // that.marketSocket();
          }
        })
        .catch((error) => {});
    },
    connect() {
      var that = this;
      that.$socket.emit("login", localStorage.getItem("user_id"));
      that.sockets.subscribe("daymarket", (msg) => {
        // console.log(msg.type);
        if (msg.type == "daymarket") {
          var cname = msg.symbol;
          var change = msg.change;
          var now_price = msg.now_price;
          var volume = msg.volume;
          // $("div[data-name='" + cname + "']")
          //     .find(".now_price")
          //     .html((now_price - 0).toFixed(4));
          // $("div[data-name='" + cname + "']")
          //     .find(".volume")
          //     .html((volume - 0).toFixed(4));
          // $("div[data-name='" + cname + "']")
          //     .find(".now_cny")
          //     .html((now_price * 6.9641).toFixed(4) + ' CNY');
          //
          // $("div[data-name='" + cname + "']")
          //     .find("button")
          //     .text(change + '%');
          if (change < 0) {
            $("li[data-name='" + cname + "']")
              .find("button")
              .addClass("downcolor");
          } else {
            $("li[data-name='" + cname + "']")
              .find("button")
              .removeClass("downcolor");
          }
        }
        if (msg.type == "daymarket") {
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
    setPercent(a, b) {
      if (a - b == 0) {
        return "0%";
      } else if (a == 0) {
        return "-100%";
      } else if (b == 0) {
        return "+100%";
      } else {
        var p = ((a - b) / b / 100).toFixed(2);
        if (p > 0) {
          p = "+" + p + "%";
        } else {
          p = p + "%";
        }
        return p;
      }
    },
    getQuotation() {
      this.$http({
        url: "/api/currency/quotation_new",
        method: "get",
      }).then((res) => {
        if (res.data.type == "ok" && res.data.message.length != 0) {
          // this.nowCoin = this.quotation[0].name;
          var data = res.data.message;

          this.quotation = data.find((item) => item.name == "USDT").quotation;
        }
      });
    },
    //去币币交易页
    goTrade(l_id, c_id, l_name, c_name, now_price, change, volume, cny_price) {
      window.localStorage.setItem("currency_id", c_id);
      window.localStorage.setItem("legal_id", l_id);
      window.localStorage.setItem("currency_name", c_name);
      window.localStorage.setItem("legal_name", l_name);
      window.localStorage.setItem("symbol", c_name + "/" + l_name);
      this.$router.push("/leverdealCenter");
    },
    getCurrent(index) {
      this.curCoinTab = index;
    },
    mouseEnter(index) {
      this.curSwiper = index;
    },
    init(callback) {
      this.$http.post("/api/" + "quotation").then((res) => {
        if (res.data.type == "ok") {
          this.coinList = res.data.message.coin_list;
          this.swiperList = res.data.message.coin_list;
          callback && callback();
        } else {
          // layer.msg(res.message);
        }
      });
    },

    timestampToTime(timestamp) {
      var date = new Date(timestamp);
      let Y = date.getFullYear() + "/";
      let M =
        (date.getMonth() + 1 < 10
          ? "0" + (date.getMonth() + 1)
          : date.getMonth() + 1) + "/";
      let D = date.getDate() + " ";
      return Y + M + D;
    },
    // 公告
    getNews() {
      var that = this;
      this.$http
        .post("/api/news/list", {
          c_id: 5,
          lang: window.localStorage.getItem("lang"),
        })
        .then((res) => {
          if (res.data.type == "ok") {
            var list = res.data.message.list;
            if (list.length > 2) {
              that.noticeList = list;
            } else {
              that.noticeList = list;
            }
          } else {
            // layer.msg(res.message);
          }
        });
    },
    // 轮播
    getLunbo() {
      var that = this;
      this.$http
        .post("/api/news/list", {
          c_id: 5,
          lang: window.localStorage.getItem("lang") || 'en',
        })
        .then((res) => {
          if (res.data.type == "ok") {
            var pics = [];
            for (var i = res.data.message.list.length - 1; i >= 0; i--) {
              var item = res.data.message.list[i];
              pics.push({ href: "", pic: item.thumbnail });
            }

            that.pics = pics;
          } else {
          }
        });
    },
    // 公告详情
    goDetail(id) {
      var id = id;
      this.$router.push({
        name: "noticeDetail",
        query: { id: id },
      });
    },
    aboutUs() {
      var that = this;
      this.$http.post("/api/news/list", { c_id: 9 }).then((res) => {
        if (res.data.type == "ok") {
          var list = res.data.message.list;
          if (list.length > 2) {
            that.footFrist = list;
          } else {
            that.footFrist = list;
          }
        } else {
          // layer.msg(res.message);
        }
      });
    },
    help() {
      var that = this;
      this.$http.post("/api/news/list", { c_id: 10 }).then((res) => {
        if (res.data.type == "ok") {
          var list = res.data.message.list;
          if (list.length > 2) {
            that.footSecond = list;
          } else {
            that.footSecond = list;
          }
        } else {
          // layer.msg(res.message);
        }
      });
    },
  },
};
</script>
<style lang='scss'>
$baseYellowColor: #00a4d8;

.ft12 {
  font-size: 12px;
}

.flex {
  display: flex;
  -webkit-display: flex;
  -moz-display: flex;
  -ms-display: flex;
  -o-display: flex;
}

.alcenter {
  -ms-flex-align: center;
  align-items: center;
}

.curPer,
.pointer {
  cursor: pointer;
}

.alcenter {
  -ms-flex-align: center;
  align-items: center;
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
  margin-left: 5px;
}

.between {
  -ms-flex-pack: justify;
  justify-content: space-between;
}

.column {
  -ms-flex-direction: column;
  flex-direction: column;
}

.banner_wrap {
  background: #11102c;
  background-size: 100% 100%;
  width: 100%;
  height: 400px;
  /*padding: 3% 10%;*/
}

.swiper-container {
  // height: 310px;
  width: 100%;
}

.swiper-slide > img {
  width: 100%;
  height: 400px;
}

.swiper-container a {
  display: block;
  // height: 310px;
}

.swiper-container img {
  display: block;
  // margin-top: -50px;
  // height: 310px;
}

div.swiper-container .swiper-pagination > span {
  background: #fff;
  border-radius: 0;
  width: 56px;
  height: 3px;
}

.swiper-pagination-bullet {
  width: 56px !important;
  background-color: #00a4d8 !important;
}

.pur-back[data-v-bab33c70] {
  width: 100%;
  height: 64px;
  text-align: center;
  background-color: #000923;
}

.pur-back .pur-center[data-v-bab33c70] {
  text-align: center;
  height: 64px;
  padding: 14px 0;
  position: relative;
}

.pur-back .pur-center .pur-content[data-v-bab33c70] {
  text-align: center;
}

.pur-back .pur-center .pur-text[data-v-bab33c70] {
  height: 39px;
  text-align: right;
  padding-right: 27px;
  display: inline-block;
  vertical-align: top;
  min-width: 210px;
}

.pur-back .pur-center .pur-text .pur-title[data-v-bab33c70] {
  color: #fff;
  font-size: 18px;
  line-height: 1;
}

.pur-back .pur-center .pur-text .pur-reference[data-v-bab33c70] {
  color: #869ec9;
  font-size: 12px;
  line-height: 14px;
}

.pur-back .pur-center .pur-text .pur-reference .reference[data-v-bab33c70] {
  vertical-align: top;
}

.pur-back
  .pur-center
  .pur-text
  .pur-reference
  .reference-icon[data-v-bab33c70] {
  vertical-align: top;
  position: relative;
  margin: 1px 0 0 2px;
  cursor: pointer;
  width: 12px;
  height: 12px;
  display: inline-block;
  background-size: 12px 12px;
  /*background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHhtbG5zPSJod…AxIDAgMS43MTV6IiBmaWxsPSIjODY5RUM5IiBmaWxsLXJ1bGU9ImV2ZW5vZGQiLz48L3N2Zz4=) no-repeat 50%;*/
}

.pur-back
  .pur-center
  .pur-text
  .pur-reference
  .reference-icon
  .arrow_box[data-v-bab33c70] {
  z-index: 5;
  width: 172px;
  height: 36px;
  padding: 10px 12px;
  display: none;
  background: #fff;
  text-align: center;
  font-size: 12px;
  line-height: 16px;
  color: #596a7a;
  border-radius: 2px;
  -webkit-box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.12);
  box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.12);
  position: absolute;
  top: -44px;
  left: -28px;
}

.pur-back .pur-center .pur-text .pur-reference[data-v-bab33c70] {
  color: #869ec9;
  font-size: 12px;
  line-height: 14px;
}

.pur-back .pur-center .pur-input[data-v-bab33c70] {
  height: 36px;
  position: relative;
  display: inline-block;
}

.pur-back .pur-center .pur-input > a {
  cursor: pointer;
}

.pur-back .pur-center .pur-input .select-box[data-v-bab33c70] {
  position: relative;
  z-index: 5;
  width: 160px;
  background: #fff;
  border-radius: 2px;
  -webkit-box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.12);
  box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.12);
  display: inline-block;
  float: left;
  margin-right: 2px;
}

.pur-back .pur-center .pur-input .select-box span.BTC[data-v-bab33c70] {
  background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjIiIGhlaWdodD0iMjIiIHhtbG5zPSJod…guNDU0eiIgZmlsbD0iI0ZBQUQxNCIgZmlsbC1ydWxlPSJub256ZXJvIi8+PC9nPjwvc3ZnPg==)
    no-repeat 10px;
}

.pur-back
  .pur-center
  .pur-input
  .select-box
  .select-btn
  .btn-icon[data-v-bab33c70] {
  width: 20px;
  height: 20px;
  margin: 11px 10px 0 0;
  float: right;
  background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAiIGhlaWdodD0iNiIgeG1sbnM9Imh0d…QiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Ik02IDhsNCA0IDQtNCIvPjwvZz48L3N2Zz4=)
    no-repeat 5px 4px;
}

.pur-back .pur-center .pur-input .select-box .select-btn[data-v-bab33c70] {
  display: inline-block;
  width: 100%;
  height: 36px;
  border: none;
  cursor: pointer;
  text-align: left;
}

.pur-back .pur-center .pur-input .shortcut[data-v-bab33c70] {
  /*float: left;*/
  display: inline-block;
  text-align: center;
  margin-left: 2px;
  width: 122px;
  height: 36px;
  border-radius: 2px;
  color: #fff;
  font-size: 14px;
  line-height: 36px;
  -webkit-box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.12);
  box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.12);
  background: #05c19e;
}

.pur-back .pur-center .pur-input .shortcut:hover {
  background-color: #0da88b;
}

.coin-tab {
  max-width: 70%;
  margin: 0 auto;
  padding: 10px 0;
  margin-bottom: 10px;
  // background: #110a5d;
  // color: #c7cce6;
  display: flex;

  > ul {
    max-width: 90%;
    display: flex;

    li {
      padding: 0 15px;
      color: #9a9eba;
      border-bottom: 1px solid #fff;
      border-right: 1px solid #ccc;
    }

    .activeCoin {
      color: #130928;
      font-weight: 900;
      z-index: 1;
    }
  }
}

.coins-list {
  margin: 10px auto;
  max-width: 70%;
  line-height: 51px;
  text-align: center;
  margin-top: 0;

  .list-title {
    display: flex;
    padding: 0 30px;
    background: #e8ebf6;

    > span {
      flex: 1;
      font-family: Roboto Condensed, sans-serif;
      font-size: 14px;
      font-weight: 700;
      /*line-height: 1.57;*/

      text-align: center;
      // color: #c7cce6;
      /*font-size: 14px;*/
      color: #9a9e9a;
      /*font-weight: 700;*/
    }

    > span:first-child {
      text-align: left;
    }

    > span:last-child {
      text-align: right;
    }
  }

  .list-con {
    // max-height: 400px;
    overflow-y: scroll;
    // border: 1px solid #563bd1;
    border-top: none;

    li {
      font-family: Roboto Condensed, sans-serif;
      font-size: 12px;
      font-weight: 400;
      font-style: normal;
      font-stretch: condensed;
      color: #130928;
      text-align: right;
      border-bottom: 1px solid #eee;
      cursor: pointer;
      display: flex;
      // border-top: 1px solid #ddd;
      padding: 0px 30px;
      line-height: 40px;
      // color: #c7cce6;
      &:hover {
        background: #f1f6ff;
      }

      .high_blue {
        color: #563bd1;
      }

      .low_blue {
        color: #8d75f7;
      }

      img {
        vertical-align: bottom;
      }

      > div {
        flex: 1;
        text-align: center;
      }

      > div:first-child {
        text-align: left;
      }

      > div:last-child {
        text-align: right;
      }
    }

    li:last-child {
    }
  }
}

.carousel .swiper-slide:hover {
  background-color: #327add;
}

.nav_left,
.con_left {
  display: flex;
  align-items: center;
  justify-content: space-around;
}

.withdraw {
  margin: 0 4px;
}

.carousel .last a:hover {
  cursor: pointer;
}

.sliders {
  width: 100%;
}

.sliders img {
  width: 100%;
}

.notice_box {
  z-index: 4;
  width: 100%;
  height: 52px;
  box-sizing: border-box;
  border-top: 1px solid rgba(29, 50, 66, 0.7);
  margin-top: -1px;
  background-color: #1b2c42;
  position: relative;
}

.notice_box .notice_list {
  width: 100%;
  font-size: 12px;
  line-height: 52px;
  overflow: hidden;
  word-break: keep-all;
  text-align: center;
}

.notice_box .notice_list .list {
  display: inline-block;
  box-sizing: border-box;
  position: relative;
  padding: 0 2em 0 1.5em;
  text-align: center;
}

.notice_box .notice_list .list :hover {
  color: #00a4d8;
}

.notice_box .notice_list .list:not(:first-child)::before {
  content: "/";
  position: absolute;
  left: -0.5em;
  color: #1c242c;
}

.notice_ul {
  margin-bottom: 5px;
  background-color: rgb(246, 249, 252);
  font-size: 12px;
  line-height: 52px;
  text-align: center;
}

.notice_li {
  float: left;
  position: relative;
  /*（不换行） white-space: nowrap;*/
  display: block;
  float: left;
  overflow: hidden;
  word-break: keep-all;
  text-align: center;
}

.notice_li a {
  height: 36px;
  font-size: 12px;
  padding: 0 25px;
  letter-spacing: 1px;
}

.notice_li::after {
  content: "/";
  float: right;
}

.notice_li:last-child:after {
  content: "";
  color: #6b80ae;
}

.notice_a:hover {
  color: #194b64;
  cursor: pointer;
}

.coins li {
  position: relative;
}

.arrow {
  border-width: 16px;
  border-right: 8px solid transparent;
  border-left: 8px solid transparent;
  border-top: none;
  border-bottom: 8px dashed;
  position: absolute;
  bottom: 0;
  left: 50%;
  margin-left: -4px;
}

.coins li:hover {
  cursor: pointer;
  // background: #303e4c;
}

.content01 {
  padding: 40px 0;
  background: #fff;

  .imgs01 {
    width: 300px;
  }

  .imgs02 {
    width: 400px;
  }

  .imgs03 {
    width: 450px;
  }

  .imgs04 {
    width: 450px;
  }

  .imgs05 {
    width: 450px;
  }
}

.bg01 {
  background: url("../assets/images/content_bg01.png") center no-repeat;
  width: 100%;
  // height: 300px;
  background-size: cover;
  padding: 50px 0;
}

.bg02 {
  background: url("../assets/images/content_bg02.png") center no-repeat;
  width: 100%;
  background-size: cover;
  padding: 50px 0;
}

.login_btn {
  padding: 15px 80px;
  border: 1px solid rgba(0, 0, 0, 1);
  border-radius: 5px;
  cursor: pointer;
}

.register_btn {
  padding: 15px 80px;
  border-radius: 5px;
  cursor: pointer;
}

.go_transfer {
  padding: 50px 0;
}

.foot {
  padding: 50px 0;
}

.market_list {
  width: 100%;
  box-sizing: border-box;
  border-top: 1px solid hsla(0, 0%, 100%, 0.15);
  background-color: #181d25;
  height: 60px;

  li {
    // padding: 0 10px;
    height: 100%;
    display: flex;
    flex-direction: row;
    align-items: center;
    box-sizing: border-box;
    margin: 0px 0;
    // padding: 15px 0;

    > div {

      .flex {
        p {
          display: block;
          line-height: 30px;
          height: 30px;
          //padding: 0 15px;
          border-radius: 5px;
          font-size: 14px;
        }

        p.greens {
          //background: #0d2f32;
        }

        p.red {
          //background: #3b2128;
        }
      }

      .symbol {
        display: block;
        line-height: 25px;
        height: 25px;
        font-size: 14px;
      }

      .now_price {
        display: block;
        line-height: 35px;
        height: 35px;
        font-size: 18px;
        margin: 0;
      }

      > p {
        font-size: 14px;

        span:first-child {
          color: #477a90;
        }
      }
    }
  }

  li:hover {
    background-color: #9e9e9e;
  }

  li:last-child {
    border-width: 0;
  }
}

.blue {
  color: #a8adcc;
}

.nowPrice {
  font-size: 20px;
  line-height: 20px;
  margin-top: 8px;

  .cny_price {
    font-size: 12px;
    line-height: 12px;
  }
}

.symbol {
  margin: 0;
  padding: 0;
  color: #b0b8db;
  font-size: 14px;
  line-height: 14px;
  height: 14px;
}

.rateup {
  font-size: 16px;
  top: 0;
  right: 0;
  font-weight: 500;
  margin: 0;
  padding-right: 15px;
  box-sizing: content-box;
}

.volume {
  font-size: 12px;
  line-height: 12px;
  color: #61698a;
  margin-top: 16px;
}

.greens {
  color: #27b054;
}

.feature_wrap {
  background-color: #1b2c42;
  padding: 60px 0;
  min-width: 550px;
  text-align: center;
  color: #54748f;
  line-height: 2em;
}

.feature_wrap h2 {
  font-size: 28px;
  margin-bottom: 10px;
  color: #2ab098;
}

.feature_wrap .feature_list {
  padding-top: 80px;
  width: 70%;
  margin: 0 auto;
}

.feature_wrap .feature_list li {
  float: left;
  width: 33%;
  background: transparent none no-repeat top;
}

.feature_list {
  li {
    div:first-child {
      height: 61px;
    }
  }
}

.feature_wrap h3 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 10px;
  color: #192544;
}

.client_wrap {
  width: 100%;
  // height: 710px;
  color: #9eb5ca;
  text-align: center;
  line-height: 2em;
  background-color: #fff;

  .wrap_in {
    height: 610px;
    //background-image: url('../assets/images/downbg.png');
    background-position: top center;
    background-repeat: no-repeat;
    background-color: #1b2c42;

    /deep/ .el-button {
      width: 120px;
      text-align: center;
    }

    .inner-wrap {
      max-width: 1920px;
      min-width: 1280px;
      width: 1200px;
      margin: 0 auto;
    }

    h2 {
      margin-bottom: 24px;
      color: #fff;
      font-weight: 400;
      text-align: right;
      padding-right: 50px;
      font-size: 36px;
    }

    .nextp {
      color: #9eb5ca;
      text-align: right;
      font-size: 18px;
      padding-right: 50px;
    }

    ul {
      width: 810px;
      margin: 0 auto;
      text-align: left;
      justify-content: space-around;

      li {
        margin: 0 15px;
        color: #9eb5ca;
        padding: 40px 0;
        line-height: 48px;
        position: relative;
        cursor: pointer;

        p {
          height: 48px;
          width: 48px;
          margin: 0 10px 0 0;
          vertical-align: top;
          border-radius: 50%;
          background: rgba(53, 124, 225, 0.1) none no-repeat 50%;
          background-image: url("../assets/images/ios.svg");
        }

        .p1 {
          background-image: url("../assets/images/anzhuo.svg");
        }

        .p2 {
        }

        .codebox {
          position: absolute;
          left: 26%;
          top: 0px;
          -webkit-transform: translate(-50%);
          -ms-transform: translate(-50%);
          transform: translate(-50%);
          -webkit-box-sizing: border-box;
          box-sizing: border-box;
          width: 120px;
          // height: 130px;
          border: 1px solid #357ce1;
          border-radius: 2px;
          background: #fff none no-repeat 12px 12px/96px 96px;
          text-align: center;
          color: #357ce1;
          font-size: 12px;
          line-height: 18px;
          z-index: 6;
          display: none;

          img {
            width: 100px;
            // height: 100px;
            margin: 0 auto;
            display: block;
            margin-top: 10px;
          }
        }
      }

      li:hover .codebox {
        display: block;
      }
    }

    .mon_mind {
      width: 800px;
      position: relative;
      margin: 0 auto;

      > div {
        width: 100%;

        .pcimg {
          width: 518px;
          margin: 0 auto;
        }
      }

      > div {
        display: flex;
        flex-direction: row;

        .el-button {
          border-radius: 25px;
          padding: 12px 40px;
        }

        > div {
          width: 400px;
          display: flex;
          align-items: center;
          margin-bottom: 30px;

          div:last-child {
            display: flex;
            flex-direction: column;
            justify-content: start;
            text-align: left;
            padding-left: 20px;
            box-sizing: border-box;

            > p {
              font-size: 14px;
            }

            > p:first-child {
              color: #ffffff;
              font-size: 16px;
              font-weight: bold;
            }
          }
        }
      }

      .mobimg {
        width: 122px;
        position: absolute;
        right: -60px;
        bottom: -20px;
        width: 122px;
        height: 253px;
        background: #0a151e none no-repeat 50% / cover;
        -webkit-box-shadow: -9px 12px 62px 0 rgba(36, 52, 69, 0.3);
        box-shadow: -9px 12px 62px 0 rgba(36, 52, 69, 0.3);
        border-radius: 16.47px;
      }
    }
  }
}

.register_wrap {
  height: 240px;
  width: 100%;
  background: #1b2c42;
  border-top: 1px solid #648db0;
  border-bottom: 1px solid #648db0;

  h2 {
    color: #fff;
    font-size: 22px;
    line-height: 24px;
  }

  .rebox {
    margin: 32px auto 0 auto;
  }

  .input-register {
    width: 400px;
    height: 40px;
    font-size: 12px;
    color: #000;
    border: 1px solid #bdced9;
    border-radius: 2px;
    padding-left: 16px;
  }

  button {
    margin-left: 8px;
    display: inline-block;
    height: 40px;
    padding: 0 44px;
    font-size: 16px;
    min-width: 120px;
    -webkit-appearance: none;
    background-color: #2ab098;
    color: #fff;
    border: none;
    outline: none;
    border-radius: 2px;
    cursor: pointer;
  }

  button:hover {
    opacity: 0.8;
  }
}

.block {
  display: block;
}
</style>

<style lang="scss">
// $baseYellowColor: #00a4d8;
$baseYellowColor: #2ab098;
.quotation_box {
  // background: #181d25;
  padding: 15px 50px;

  margin: 0 auto;

  .coinbox {
    min-height: 700px;
    width: 100%;
    margin: 0 auto;
    //box-shadow: 0 0px 5px #e7e6e6;
    border: 1px solid #f5f5f5;
    padding: 0 10px;

    .flex {
      display: flex;
    }

    .classfity {
      line-height: 40px;
      color: #9ca9b5;
      padding: 0 30px;

      > div {
        flex: 1;
        display: flex;
        justify-content: center;
      }

      //div:nth-child(1),
      //div:nth-child(6) {
      //  width: 10%;
      //}
      //
      //div:nth-child(2),
      //div:nth-child(3),
      //div:nth-child(4),
      //div:nth-child(5),
      //{
      //  width: 20%;
      //}
    }

    .coinlist {
      color: rgb(156, 169, 181);
      padding: 0 30px;
      border-bottom: 1px solid #9ca9b5;

      > p {
        flex: 1;
      }

      .icon-star {
        color: $baseYellowColor;
      }

      p {
        line-height: 50px;
        font-size: 14px;
        font-family: "Arial";
        text-align: center;
        display: flex;
        justify-content: center;
      }
    }

    .coinlist:last-child {
      border-bottom-width: 0;
    }

    .hove:hover {
      background-color: #f2f6fa;
	  // background-color: #9ca9b5;
      animation: aaa 0.1s ease-in 0s 2.8 alternate;
      animation-fill-mode: forwards;
    }

    @keyframes aaa {
      from {
        -webkit-transform: scale(1);
        transform: scale(1);
      }
      to {
        -webkit-transform: scale(1.03);
        transform: scale(1.03);
      }
    }
  }

  .change span {
    width: 90px;
    display: block;

    padding: 3px 10px;

    border-radius: 5px;
    line-height: 25px;
    text-align: center;
  }

  .change.red span {
    background: rgba(239, 86, 86, 0.1);
  }

  .change.green span {
    background: rgba(13, 168, 139, 0.1);
  }

  .main_btn {
    width: 100%;
    margin: 0 auto;
    line-height: 80px;

    button {
      color: #fff;
      background-color: $baseYellowColor;
      padding: 5px 15px;
      border-radius: 5px;
      line-height: 25px;
    }
  }
}
</style>
