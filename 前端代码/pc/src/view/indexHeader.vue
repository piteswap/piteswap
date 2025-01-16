<template>
  <div class="nav_bar">
    <div class="content" style="height: 48px; width: 100%; position: relative">
      <div class="fl">
        <router-link class="nav-list-a" to="/">
          <img
            src="@/assets/images/hlogo.png"
            class="navbar-logo"
            style="width: 80px; position: relative; top: 0px"
          />

          <!-- <img :src="$store.state.logo" class="navbar-logo"
               style="width: 80px;position:relative;top:0px;"> -->
        </router-link>
      </div>
      <ul class="navbar-item fl mouseDefault ml10">
        <li class="base">
          <router-link to="/newmarket">{{
            $t("header.newmarket")
          }}</router-link>
        </li>
        <li class="base">
          <router-link to="/dealCenter">{{
            $t("header.currency")
          }}</router-link>
        </li>
        <li class="base hide">
          <router-link to="/legalTrade">{{ $t("header.c2c") }}</router-link>
        </li>
        <li class="base">
          <router-link to="/leverdealCenter">{{
            $t("lever.transaction")
          }}</router-link>
        </li>
        <li class="base">
          <router-link to="/secondDealCenter">{{
            $t("miscro.transaction")
          }}</router-link>
        </li>
        <li class="base">
          <router-link to="/Property/product">{{
            $t("header.property")
          }}</router-link>
        </li>
        <li class="base" v-if="isShow">
          <router-link to="/myLegalShops">{{ $t("header.shop") }}</router-link>
        </li>
        <li class="base">
          <router-link to="/change">{{ $t("header.assets") }}</router-link>
        </li>
        <li class="base" style="scolor: #fff">
          <router-link to="/accountSet">{{ $t("header.center") }}</router-link>
        </li>
        <li class="base" style="scolor: #fff">
          <span @click="goLink">{{ $t("header.onlineservice") }}</span>
        </li>
        <li class="base" style="scolor: #fff">
          <router-link to="/subscription">{{ $t("currency.subscription") }}</router-link>
        </li>
      </ul>
      <div
        class="fr"
        v-if="false"
        style="height: 100%; align-items: center; display: flex"
      >
        <i :class="night_mode ? 'el-icon-sunny' : 'el-icon-moon'"></i>
        <el-switch
          style="display: block"
          v-model="night_mode"
          :active-value="1"
          :inactive-value="0"
          @change="changeMode"
          active-color="#024093"
          inactive-color="#dcdfe6"
        >
        </el-switch>
      </div>

      <div class="fr" style="margin-right: -5px">
        <div class="account-box f2 positionR curPer flex">
          <div class="msg_wrap">
            <div
              class="account_login flex alcenter fColor1 fl"
              style="margin-right: 0"
              @mouseover="over_lang"
              @mouseout="out_lang"
            >
              <p class="flex alcenter chooselang-wrap">
                <!-- <i class="iconfont ml10 mr5 icon-duoguoyuyan"></i> -->
                <img class="mr10" :src="lang_img">
                <span class="mr5">{{ lang_text }}</span>
                <i
                  class="iconfont icon-zhankai"
                  :class="{ open: showLangMore, close: !showLangMore }"
                ></i>
              </p>
            </div>
          </div>

          <div
            class="lang-choose mine ft14 fColor4"
            @mouseover="over_lang"
            @mouseout="out_lang"
          >
            <p
              class="flex alcenter curPer"
              v-for="(item, index) in langArr"
              :key="index"
              @click="set_lang(item.src, item.text, item.lang)"
            >
              <img class="mr10" :src="item.src" />{{ item.text }}
            </p>
          </div>
        </div>
      </div>

      <!--  <div class="fr flex ml10" style="justify-content: center">
        <el-popover
            placement="top-start"
            :title="$t('scan')"
            width="200"
            trigger="hover"
            content="">
          <img
              style="width:100%;height:100%; max-width: 200px; object-fit: cover;"
              src="@/assets/images/anzhuo.png"
              alt
          />
          <i class="iconfont icon-xiazaiapp curPer fColor1" slot="reference"></i>
        </el-popover>
      </div> -->

      <!--      <div class="fr flex ml10 curPer fColor1 custom-service">-->
      <!--        <i class="iconfont icon-weibiaoti- curPer "></i>-->
      <!--        <span class="ml5 ft14 mr5">{{ $t('home.kefu') }}</span></div>-->

      <div class="fr">
        <a style="color: #cdd6e4">
          <div class="account-box fl positionR curPer flex">
            <div class="msg_wrap">
              <div
                class="account_login flex alcenter fColor1 fl"
                @mouseover="mine_over"
                @mouseout="mine_out"
                v-if="address.length > 0"
              >
                <i class="iconfont mr5 icon-wode"></i>
                <span>{{ account_number | hideFour }}</span>
                <i
                  class="iconfont icon-zhankai ml5"
                  :class="{ open: showUserMore, close: !showUserMore }"
                  style="font-size: 12px; display: inline-block"
                ></i>
              </div>
            </div>

            <div
              class="order-choose ft14 fColor1"
              v-if="show2"
              @mouseover="order_over"
              @mouseout="order_out"
            >
              <p
                class="curPer"
                v-for="(item, index) in orderList"
                :key="index"
                @click="goto(null, item.page)"
              >
                <img :src="item.src1" alt="" />
                <img :src="item.src2" alt="" />
                <span>{{ item.title }}</span>
              </p>
            </div>
            <div
              class="account-choose mine ft14 fColor1"
              v-show="show3"
              @mouseover="mine_over"
              @mouseout="mine_out"
            >
              <p
                class="curPer"
                v-for="(item, index) in accountList"
                :key="index"
                @click="goto(null, item.page)"
              >
                <i class="iconfont mr5" :class="item.icon"></i>
                <span>{{ item.title }}</span>
              </p>
              <p class="curPer" @click="loginOut">
                <i class="iconfont mr5 icon-tuichudenglu"></i>
                <span>{{ $t("header.out") }}</span>
              </p>
            </div>
          </div>
        </a>

        <div class="fl login mr10" v-if="address.length <= 0">
          <router-link :to="{ name: 'login' }">
            <span
              ><i class="mr5 iconfont icon-denglu"></i
              >{{ $t("header.in") }}</span
            >
          </router-link>
          <router-link :to="{ name: 'register' }">
            <span class="ml20"
              ><i class="iconfont mr5 icon-zhuce1"></i
              >{{ $t("header.up") }}</span
            >
          </router-link>
        </div>
      </div>

<!--      <div class="fr">
        <a style="color: #cdd6e4">
          <div class="account-box fl positionR curPer flex">
            <div class="msg_wrap">
              <div
                class="account_login flex alcenter fColor1 fl"
                v-if="address.length > 0"
              >
                <span>{{ userId }}</span>
              </div>
            </div>
          </div>
        </a>
      </div> -->
    </div>
  </div>
</template>
<script>
export default {
  name: "indexHeader",
  data() {
    return {
      customer_url: "",
      appshow: false,
      address: "",
      night_mode: 0,
      account_number: "",
      assets: this.$t("header.assets"),
      orders: this.$t("header.orders"),
      isShow: false,
      show1: false,
      show2: false,
      show3: false,
      current: 0,
      extension_code: "",
      tabList: [],
      showUserMore: false,
      showLangMore: false,
      accountList: [
        {
          src1: require("@/assets/images/z0.png"),
          src2: require("@/assets/images/z1.png"),
          icon: "icon-shezhi",
          title: this.$t("security.accountset"),
          page: "accountSet",
        },
        {
          src1: require("@/assets/images/icon_news.png"),
          src2: require("@/assets/images/icon_news_s.png"),
          icon: "icon-jiaoyijilu1",
          title: this.$t("header.tradelog"), //"交易日志",
          page: "transferLog",
        },
        {
          src1: require("@/assets/images/icon_mine.png"),
          src2: require("@/assets/images/icon_mine_s.png"),
          icon: "icon-icon",
          title: this.$t("security.idcard"),
          page: "authentication",
        },
      ],
      assetstList: [],
      orderList: [],
      langArr: [
        {
          src: require("@/assets/images/en.png"),
          text: this.$t("lang.en"),
          lang: "en",
        },
        {
          src: require("@/assets/images/jp.png"),
          text: this.$t("lang.jp"),
          lang: "jp",
        },
        {
          src: require("@/assets/images/han.png"),
          text: this.$t("lang.kr"),
          lang: "kr",
        },
        {
          src: require("@/assets/images/zh.png"),
          text: this.$t("lang.zh"),
          lang: "zh",
        },
        {
          src: require("@/assets/images/zh.png"),
          text: this.$t("lang.hk"),
          lang: "hk",
        },
        {
          src: require("@/assets/images/sp.png"),
          text: this.$t("lang.sp"),
          lang: "sp",
        },
		{
		  src: require("@/assets/images/th.png"),
		  text: this.$t("lang.th"),
		  lang: "th",
		},
      ],
      lang_img: require("@/assets/images/en.png"),
      lang_text: this.$t("lang.en"),
    };
  },
  filters: {
    hideFour: function (value) {
      value = value.replace(/(\d{3})\d{4}(\d{4})/, "$1****$2");
      return value;
    },
  },

  computed: {
    userId() {
      return window.localStorage.getItem("user_id");
    },
  },

  created() {
    let night_mode = localStorage.getItem("night_mode");
    if (night_mode == null) {
      localStorage.setItem("night_mode", 0);
    }
    night_mode = night_mode == null ? 0 : night_mode;
    this.night_mode = parseInt(night_mode);
    console.log(typeof night_mode, typeof this.night_mode);
    this.address = localStorage.getItem("token") || "";
    var lang = localStorage.getItem("locale");
    this.$cookies.set("lang", lang); //return this

    if (lang == "zh") {
      this.lang_img = require("../assets/images/zh.png");
      this.lang_text = this.$t("lang.zh");
    } else if (lang == "hk") {
      this.lang_img = require("../assets/images/zh.png");
      this.lang_text = this.$t("lang.hk");
    } else if (lang == "en") {
      this.lang_img = require("../assets/images/en.png");
      this.lang_text = this.$t("lang.en");
    } else if (lang == "kr") {
      this.lang_img = require("../assets/images/han.png");
      this.lang_text = this.$t("lang.kr");
    } else if (lang == "jp") {
      this.lang_img = require("../assets/images/jp.png");
      this.lang_text = this.$t("lang.jp");
    } else if (lang == "sp") {
      this.lang_img = require("../assets/images/sp.png");
      this.lang_text = this.$t("lang.sp");
    }else if (lang == "th") {
	  this.lang_img = require("../assets/images/th.png");
	  this.lang_text = this.$t("lang.th");
	}

    // 查询logo
    this.$http({
      url: "/api/set/get_customer_url",
      method: "post",
    }).then((res) => {
      console.log(res, "logo");
      if (res.data.type == "ok" && res.data && res.data.message) {
        this.$store.commit("setLogo", res.data.message.cover);
      }
    });

    this.$http({
      url: "/api/set/get_customer_url",
      method: "post",
    }).then((res) => {
      console.log(res, "客服地址");
      this.customer_url = res.data.message.customer_url;
    });
  },
  mounted() {
    this.account_number = localStorage.getItem("accountNum") || "";
    this.extension_code = localStorage.getItem("extension_code") || "";
    this.is_seller = window.localStorage.getItem("is_seller") || "";

    if (this.is_seller == 1) {
      this.isShow = true;
    }
    eventBus.$on("seller", (msg) => {
      if (msg) {
        this.is_seller = window.localStorage.getItem("is_seller") || "";
        if (this.is_seller == 1) {
          this.isShow = true;
        }
      }
    });
    this.bus.$on("nav_name", (name) => {
      this.current = this.tabList.findIndex(
        (val) =>
          val.page === name || (val.children && val.children.includes(name))
      );
      // console.log(this.current);
    });
  },
  methods: {
    goLink() {
      window.open(this.customer_url);
    },

    changeMode(e) {
      console.log(e);
      localStorage.setItem("night_mode", e);
      location.reload();
    },

    set_lang(img, text, lang) {
      console.log(img, text, lang);
      this.$http({
        url: "/api/set/lang",
        method: "post",
        data: { lang },
      })
        .then((res) => {
          console.log(res, "res");
          if (res.data.type == "ok") {
            this.lang_img = img;
            this.lang_text = text;
            $(".lang-choose").css("display", "none");
            var l = window.localStorage.getItem("locale") || "en";
            if (l == lang) {
              return;
            } else {
              window.localStorage.setItem("locale", lang);
              this.$i18n.locale = lang;
              var templang = lang;
              if (lang == "kr") {
                var templang = "kr";
              } else if (lang == "jp") {
                var templang = "jp";
              } else if (lang == "hk") {
                var templang = "hk";
              }
              window.localStorage.setItem("lang", templang);
              window.location.reload();
            }
          } else {
            this.$message.error("error");
          }
        })
        .catch((err) => {
          console.log(err.response.statusText, "err");
          this.$message.error(err.response.statusText);
        });
    },

    over_lang() {
      this.showLangMore = true;
      $(".lang-choose").css("display", "block");
    },
    out_lang() {
      this.showLangMore = false;
      $(".lang-choose").css("display", "none");
    },
    candy() {
      layer.msg(this.$t("lay.notopen"));
    },
    noopen() {
      layer.msg(this.$t("lay.notopen"));
    },
    getNotice() {
      this.$http({
        url: "/api/news/list",
        method: "get",
        data: { language: this.$i18n.locale == "zh" ? 1 : 2, c_id: 21 },
      }).then((res) => {
        this.noticeList = res.data.message.list;
      });
    },
    setLang(lang) {
      var l = window.localStorage.getItem("locale") || "en";
      if (l == lang) {
        return;
      } else {
        window.localStorage.setItem("locale", lang);
        this.$i18n.locale = lang;
        this.$cookies.set("lang", lang);
        var templang = lang;
        if (lang == "han") {
          var templang = "kr";
        } else if (lang == "jp") {
          var templang = "jp";
        } else if (lang == "hk") {
          var templang = "hk";
        }
        window.localStorage.setItem("lang", templang);
        window.location.reload();
      }
    },
    showapp() {
      this.appshow = !this.appshow;
    },
    goto(index, name) {
      this.current = index;
      // console.log(index, name);

      this.bus.$emit("nav_name", name);
      if (name == "userSetting") {
        this.$router.push("/userSetting");
      } else {
        this.$router.push({ name: name });
      }
    },
    gotoAccount(index, name) {
      // this.current = index;
      // console.log(index, name);
      this.bus.$emit("nav_name", name);
      this.$router.push({ name: name });
    },
    loginOut() {
      // console.log("out");
      localStorage.removeItem("token");
      localStorage.removeItem("accountNum");
      localStorage.clear();
      this.$router.push("/components/login");
    },
    assets_over() {
      this.show1 = true;
    },
    assets_out() {
      this.show1 = false;
    },
    order_over() {
      this.show2 = true;
    },
    order_out() {
      this.show2 = false;
    },
    mine_over() {
      this.show3 = true;
      this.showUserMore = true;
    },
    mine_out() {
      this.show3 = false;
      this.showUserMore = false;
    },
  },
};
</script>
<style scoped lang="scss">
// $baseYellowColor: #00a4d8;
$baseYellowColor: #2ab098;
.fr {
  .icon-xiazaiapp {
    font-size: 18px;
    margin-top: 0px;
  }

  .icon-xiazaiapp:hover {
    color: $baseYellowColor;
  }
}
.custom-service:hover {
  color: $baseYellowColor;
}

.mr5 {
  margin-right: 5px;
}

.mr10 {
  margin-right: 10px;
}

.nav-list-a {
  display: flex;
  height: 48px;
  flex-direction: row;
  align-items: center;
}

.fr {
  .el-icon-sunny {
    color: #f39049;
    margin: 0 12px;
  }

  .el-icon-moon {
    color: #d5b433;
    margin: 0 12px;
  }
}

.day .nav_bar {
  background: rgba(0, 0, 0, 0.85);
}

.icon-zhankai {
  transition: all 0.2s;
  font-size: 14px;
}

.icon-zhankai.open {
  transform: scale(0.9) rotate(450deg) !important;
}

.icon-zhankai.close {
  transform: scale(0.9) rotate(180deg) !important;
}

.chooselang-wrap:hover,
.account_login:hover {
  color: $baseYellowColor;
}

.nav_bar {
  line-height: 48px;
  height: 49px;
  width: 100%;
  min-width: 1200px;
  padding: 0 20px;
  // background: #1b2945;
  background: #2a405c;
  border-bottom-color: transparent;

  .base {
    a {
      display: flex;
      box-sizing: border-box;
      height: 48px;
    }

    a:hover,
    .router-link-active {
      color: $baseYellowColor;
      border-bottom: 2px solid $baseYellowColor;
    }
  }

  .login {
    font-size: 14px;

    a:hover,
    .router-link-active {
      color: $baseYellowColor;
    }
  }

  .content {
    // width: 1200px;
    margin: 0 auto;
  }

  .router-link-active {
    color: #7a98f7;
  }

  .msg_wrap {
    display: flex;
    align-items: center;

    > div {
      margin: 0 10px;
    }
  }

  .icon_img {
    width: 15px;
  }

  .assets_icon_img,
  .order_icon_img {
    width: 20px;
    height: 20px;
  }

  .sp {
    line-height: normal;
    margin: 0 4px;
  }

  .navbar-logo {
    vertical-align: middle;
  }

  .account_login,
  .assets_item,
  .order_item {
    // width: 100px;
    font-size: 14px;
  }

  .assets_item,
  .order_item {
    height: 48px;
    display: flex;
    align-items: center;
  }

  .lang-choose {
    display: none;
    cursor: default;
    position: absolute;
    top: 48px;
    right: -44px;
    z-index: 999;
    width: 188px;
    line-height: 40px;
    background-color: #fff;
    z-index: 5000;
    border-radius: 3px;
    box-shadow: 0 0 2px 4px rgba(0, 0, 0, 0.2);

    p {
      padding-left: 20px;

      img {
        width: 14px;
        vertical-align: middle;
        margin-right: 8px;
        display: inline-block;
      }

      img:nth-child(2) {
        display: none;
      }
    }

    p:hover {
      color: #00a4d8;
      background-color: rgba(242, 246, 250, 0.7) !important;
    }

    p:hover img:nth-child(2) {
      display: inline-block;
    }
  }

  .account-choose {
    cursor: default;
    position: absolute;
    top: 48px;
    right: -44px;
    z-index: 999;
    width: 188px;
    line-height: 40px;
    background-color: #181d25;
    z-index: 5000;
    border-radius: 3px;
    box-shadow: 0 0 2px 4px rgba(0, 0, 0, 0.2);

    p {
      padding-left: 20px;

      img {
        width: 14px;
        vertical-align: middle;
        margin-right: 8px;
        display: inline-block;
      }

      img:nth-child(2) {
        display: none;
      }
    }

    p:hover {
      color: #00a4d8;
      background-color: #30323c;
    }

    p:hover img:nth-child(2) {
      display: inline-block;
    }

    p:hover img:nth-child(1) {
      display: none;
    }
  }

  .asset-choose {
    // display: none;
    cursor: default;
    position: absolute;
    top: 48px;
    right: 156px;
    width: 188px;
    line-height: 40px;
    background-color: #262a42;
    z-index: 5000;
    border-radius: 3px;
    box-shadow: 0 0 2px 4px rgba(0, 0, 0, 0.2);

    p {
      padding-left: 20px;

      img {
        width: 14px;
        vertical-align: middle;
        margin-right: 8px;
        display: inline-block;
      }

      img:nth-child(2) {
        display: none;
      }
    }

    p:hover {
      color: #5697f4;
      background-color: #181b2a;
    }

    p:hover img:nth-child(2) {
      display: inline-block;
    }

    p:hover img:nth-child(1) {
      display: none;
    }
  }

  .order-choose {
    // display: none;
    cursor: default;
    position: absolute;
    top: 48px;
    right: 56px;
    width: 188px;
    line-height: 40px;
    background-color: #262a42;
    z-index: 5000;
    border-radius: 3px;
    box-shadow: 0 0 2px 4px rgba(0, 0, 0, 0.2);

    p {
      padding-left: 20px;

      img {
        width: 14px;
        vertical-align: middle;
        margin-right: 8px;
        display: inline-block;
      }

      img:nth-child(2) {
        display: none;
      }
    }

    p:hover {
      color: #5697f4;
      background-color: #181b2a;
    }

    p:hover img:nth-child(2) {
      display: inline-block;
    }

    p:hover img:nth-child(1) {
      display: none;
    }
  }

  .navbar-item {
    color: #cdd6e4;

    li {
      float: left;
      height: 48px;
      line-height: 48px;
      padding: 0 11px;
      display: block;
      text-align: center;
      font-size: 14px;
      cursor: pointer;
      color: #c7cce6;

      &.active {
        color: #00a4d8;
        border: none;
      }
    }
  }

  .login {
    color: #cdd6e4;

    span {
      cursor: pointer;
    }

    .ml20 {
      margin-left: 20px;
    }
  }
}

.downapp {
  position: relative;

  .appcode {
    position: absolute;
    top: 50px;
    z-index: 10;
    left: -80px;
    width: 260px;
    background-color: #fff;
    height: 140px;
    border-radius: 4px;

    span {
      position: absolute;
      top: -20px;
      left: 130px;
      display: inline-block;
      width: 0;
      height: 0;
      border-width: 10px;
      border-style: solid;
      border-color: transparent transparent #fff transparent;
    }

    .app-left {
      width: 130px;
      float: left;
      text-align: center;
      position: relative;

      .code {
        position: relative;
        top: 5px;
        left: 10px;

        img {
          width: 100px;
          height: 100px;
        }

        p:last-child {
          position: absolute;
          bottom: 0;
        }
      }
    }

    .app-right {
      float: right;
      width: 110px;
      text-align: center;
      margin-right: 10px;
      padding-right: 10px;
      margin-top: 5px;

      p {
        top: -10px;

        img {
          width: 20px;
          position: relative;
          top: 4px;
          margin-top: 0;
        }
      }

      img {
        width: 40px;
        margin-top: 30px;
      }

      b {
        display: block;
        width: 100px;
        height: 100px;
        border: 1px solid #f7f6f6;
        text-align: center;
        top: 0;
        border-radius: 4px;
      }
    }

    .texts {
      position: relative;
      top: -30px;
      color: #333;
    }
  }
}

.register_btn {
  border: 1px solid #00a4d8;
  padding: 0 16px;
  line-height: 28px;
  border-radius: 2px;
  font-size: 14px;
}

.register_btn:hover {
  background-color: #00a4d8;
  color: #fff;
}
</style>

// WEBPACK FOOTER // // src/view/indexHeader.vue
