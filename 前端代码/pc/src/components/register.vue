<template>
  <div id="register-box" style="height: 100%">
    <indexHeader></indexHeader>

    <div class="main-register">
      <vue-particles
        class="particles"
        color="#fff"
        :particleOpacity="0.7"
        :particlesNumber="60"
        shapeType="circle"
        :particleSize="4"
        linesColor="#fff"
        :linesWidth="1"
        :lineLinked="true"
        :lineOpacity="0.4"
        :linesDistance="150"
        :moveSpeed="2"
        :hoverEffect="true"
        hoverMode="grab"
        :clickEffect="true"
        clickMode="push"
      >
      </vue-particles>

      <div
        class="flex register-bg"
      >
        <div class="reg-content">
          <div class="title">{{ $t("regidters") }}</div>

          <div class="nav-list">
            <div :class="['nav-item', isMb && 'active']" @click="isMb = true">
              {{ $t("login.emailZ") }}
            </div>
            <div :class="['nav-item', !isMb && 'active']" @click="isMb = false">
              {{ $t("login.phoneZ") }}
            </div>
          </div>

          <div class="step-one" v-show="true">
            <!-- <div class="account-box">
              <div class="tip">{{ $t("register01.country") }}</div>
              <el-select
                v-model="countryS"
                style="background-color: #171c2b;width: 520px;color: #c7cce6;border: 0px solid #4e5b85;"
              >
                <el-option
                  v-for="(item, index) in country"
                  :label="item.name_en"
                  :value="item.country_id"
                  :key="index"
                ></el-option>
              </el-select>
            </div> -->

            <div class="account-box" style="margin-top: 10px">
              <!-- <div class="tip" v-if="!isMb">{{ $t("lay.nophone") }}</div>
              <div class="tip" v-if="isMb">{{ $t("lay.nemail") }}</div> -->
              <div class="flex">
                <select
                  style=" background-color: #1e2235; color: #c7cce6; border: 1px solid #4e5b85; "
                  name=""
                  v-if="!isMb"
                  class="chooseTel"
                  v-model="areaCode"
                  ref="select"
                >
                  <option
                    :value="index"
                    v-for="(item, index) in country"
                    :key="index"
                  >
                    {{ item.area_code }}
                    {{ item.name_en }}
                  </option>
                </select>
                <input
                  type="text"
                  v-if="!isMb"
                  v-model="account"
                  class="phone"
                />
                <input
                  type="text"
                  v-if="isMb"
                  :placeholder="$t('register.emailnum')"
                  v-model="account"
                  class=""
                />
              </div>
            </div>

            <!-- <div class="tip" style="margin-bottom: 10px">
              {{ $t("register.codenum") }}
            </div> -->
      <!--      <div class="code-box" style="margin-top: 10px">
              <input
                type="number"
                :placeholder="$t('register.codenum')"
                :readonly="readonly"
                @click="readonly = false"
                v-model="code"
                class="code"
              />
              <button type="button" class="code-btn curPer" @click="sendCode">
                {{ sendCodeText }}
              </button>
            </div> -->

            <button
              class="confirm-btn curPer"
              v-if="false"
              @click="checkCode"
              type="button"
            >
              {{ $t("confirm") }}
            </button>
          </div>

          <div class="pwd-box" style="margin-top: 10px">
            <!-- <div class="tip">{{ $t("register.logpwd") }}</div> -->
            <input
              type="password"
              v-model="pwd"
              class="pwd-input"
              :placeholder="$t('register.pwd')"
            />
          </div>
          <div class="repwd-box" style="margin-top: 10px">
            <!-- <div class="tip">{{ $t("register.repwd") }}</div> -->
            <input
              type="password"
              v-model="repwd"
              class="repwd-input"
              :placeholder="$t('register.repwd')"
            />
          </div>
          <!-- 邀请码 -->
          <div class="invite-box" style="margin-top: 10px">
            <!-- <div class="tip">{{ $t("register.invitecode") }}</div> -->
            <input
              type="text"
              v-model="invite"
              class="invite-input"
              :placeholder="$t('register.invitecode')"
            />
          </div>
          <div class="flex column">
            <el-checkbox v-model="agree">{{ $t("xieyi") }}</el-checkbox>
            <button
              type="button"
              style="border-radius: 4px"
              @click="register"
              class="reg-btn confirm-btn curPer"
            >
              {{ $t("registers") }}
            </button>
          </div>
        </div>

        <div
          class="fColor2"
          style="
            padding-top: 120px;
            font-weight: normal;
            font-size: 14px;
            line-height: 50px;
            flex: 1;
            text-align: left;
            width: 300px;
            color:#ccc
          "
        >
          <div>{{ $t("xieyi1.first") }}</div>
          <div>{{ $t("xieyi1.second") }}</div>
          <div>{{ $t("xieyi1.third") }}</div>
          <div>{{ $t("xieyi1.fourth") }}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import country from "../lib/country.js";
import indexHeader from "@/view/indexHeader";
import indexFooter from "@/view/indexFooter";

export default {
  components: {
    indexHeader,
    indexFooter,
  },
  data() {
    return {
      agree: false,
      readonly: true,
      sendCodeText: this.$t("register.sendcode"),
      sendCodeTime: 60,
      areaCode: 0,
      codeTrue: false, //验证码是否正确
      isMb: true, //是否为手机注册
      account: "", //用户名
      pwd: "", //密码
      repwd: "", //重复密码
      code: "", //验证码
      invite: "", //邀请码
      timer: "", //倒计时timer
      showList: false, //是否显示地址列表
      country: [],
      province: { id: "", name: this.$t("legaltrade.select") }, //所选省份
      provinces: [], //省份列表
      city: { id: "", name: this.$t("legaltrade.select") }, //所选城市
      cities: [], //城市列表
      district: { id: "", name: this.$t("legaltrade.select") }, //所选地区
      districts: [], //地区列表
      countryS: "",
    };
  },
  created() {
    let arrSort = country.sort((s, t) => {
      let a = s.name_en[0].toLowerCase();
      let b = t.name_en[0].toLowerCase();
      if (a < b) {
        return -1;
      }
      if (a > b) {
        return 1;
      }
      return 0;
    });
    this.country = arrSort;

    var invite = this.get_all_params().extension_code;

    if (invite) {
      this.invite = invite;
    }

    // console.log(country,"99");
    let account = this.get_all_params().email;
    account = decodeURIComponent(account);
    if (account) {
      var emreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
      if (!emreg.test(account)) {
      } else {
        this.account = account;
      }
    }
  },
  methods: {
    get_all_params() {
      var url = location.href;
      var nameValue;
      var paraString = url
        .substring(url.indexOf("?") + 1, url.length)
        .split("&");
      var paraObj = {};
      for (var i = 0; (nameValue = paraString[i]); i++) {
        var name = nameValue.substring(0, nameValue.indexOf("=")).toLowerCase();
        var value = nameValue.substring(
          nameValue.indexOf("=") + 1,
          nameValue.length
        );
        if (value.indexOf("#") > -1) {
          value = value.split("#")[0];
        }
        paraObj[name] = decodeURI(value);
      }
      return paraObj;
    },
    // 获取地区列表
    getRegion(id, type, name) {
      if (type == "") {
        this.showList = false;
        this.district = { id: id, name: name };
        return;
      } else if (type == "cities") {
        if (name == this.province.name) {
          this.showList = "cities";
          return;
        }
      } else if (type == "districts") {
        if (name == this.city.name) {
          this.showList = "districts";
          return;
        }
      }
      var pId = "";
      //  if(id != ''){
      //    data.parent_id = id;
      //  }
      if (id !== "") {
        pId = "?parent_id=" + id;
      }
    },
    // 切换注册方式
    setIsMb(boo) {
      this.account = "";
      this.pwd = "";
      this.repwd = "";
      this.code = "";
      this.invite = "";
      this.isMb = boo;
      this.codeTrue = false;
      this.showList = false;
      this.provinces = [];
      this.cities = [];
      this.districts = [];
      this.province = { id: "", name: this.$t("legaltrade.select") };
      this.city = { id: "", name: this.$t("legaltrade.select") };
      this.district = { id: "", name: this.$t("legaltrade.select") };

      clearInterval(this.timer);
      var codeBtn = document.querySelector(".code-btn");
      codeBtn.disabled = false;
      codeBtn.innerHTML = this.$t("code");
    },

    // 发送验证码
    sendCode(e) {
      let that = this;
      let isMb = this.isMb;
      let url = "sms_send";
      if (this.account == "") {
        this.$message.error(that.$t("lay.paccount"));
        return;
      } else if (e.target.disabled) {
        return;
      } else if (!isMb) {
        // var reg = /^1[3456789]\d{9}$/;
        // if (!reg.test(this.account)) {
        //   // layer.msg("您输入的手机号不符合规则");
        //   // return;
        // }
      } else if (isMb) {
        var emreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if (!emreg.test(this.account)) {
          this.$message.error(this.$t("register.emailnum"));
          return;
        } else {
          url = "sms_mail";
        }
      } else {
      }

      let data = { user_string: this.account };
      if (url == "sms_send") {
        data.country_code = country[this.areaCode].area_code;
      }

      const loading = this.$loading({
        lock: true,
        text: "Loading",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });

      this.$http({
        url: "/api/" + url,
        method: "post",
        data: data,
      }).then((res) => {
        loading.close();
        if (res.data.type != "error") {
          // var time = 60;
          this.$message({
            message: res.data.message,
            type: "success",
          });
          that.sendCodeTime = 60;
          this.timer = setInterval(function() {
            that.sendCodeTime--;
            that.sendCodeText = that.sendCodeTime + "s";
            // e.target.innerHTML = time + "s";
            // e.target.disabled = true;
            if (that.sendCodeTime == 0) {
              window.clearInterval(that.timer);
              that.sendCodeText = that.$t("register.sendcode");
              // e.target.innerHTML = that.$t('code');
              // e.target.disabled = false;
              return;
            }
          }, 1000);
        } else {
          that.$message.error(res.data.message);
        }
      });
    },

    // 验证验证码
    checkCode() {
      let code = this.code;
      if (this.account == "") {
        layer.msg(this.$t("lay.paccount"));
        return;
      } 
	  // else if (this.code == "") {
   //      layer.msg(this.$t("lay.notcode"));
   //      return;
   //    }
	   else {
        if (this.isMb) {
          if (
            !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(
              this.account
            )
          ) {
            layer.msg(this.$t("register.emailnum"));
            return;
          }
        } else {
          // if (!/^1[0-9]{10}$/.test(this.account)) {
          //   layer.msg("请输入正确的手机号");
          //   return;
          // }
        }

        let data = {};
        let url = "user/check_email";
        if (!this.isMb) {
          // 手机号
          data = { mobile_code: this.code };
          url = "user/check_mobile";
        } else {
          data = { email_code: this.code };
        }

        this.$http({
          url: "/api/" + url,
          method: "post",
          data: data,
        }).then((res) => {
          layer.msg(res.data.message);

          if (res.data.type == "ok") {
            this.codeTrue = true;
            this.getRegion("", "provinces");
          } else {
          }
        });
      }
    },

    // 注册
    register() {
      var that = this;

      if (!this.agree) {
        this.$message.warning(this.$t("leymsg.userager"));
        // this.$message.warning("请先勾选同意用户协议");
        return false;
      }

      if (this.account == "") {
        this.$message.warning(this.$t("lay.paccount"));
        return;
      }

      // if (this.code == "") {
      //   this.$message.warning(this.$t("lay.notcode"));
      //   return;
      // }

      if (this.isMb) {
        // 不是手机注册
        if (
          !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(
            this.account
          )
        ) {
          this.$message.warning(this.$t("register.emailnum"));
          return;
        }
      } else {
        // if (!/^1[0-9]{10}$/.test(this.account)) {
        //   this.$message.warning("请输入正确的手机号");
        //   return;
        // }
      }

      let data = {};
      let url = "user/check_email";
      if (!this.isMb) {
        data = { mobile_code: this.code };
        url = "user/check_mobile";
      } else {
        data = { email_code: this.code };
      }

      const loading = this.$loading({
        lock: true,
        text: "Loading",
        spinner: "el-icon-loading",
        background: "rgba(0, 0, 0, 0.7)",
      });

      this.$http({
        url: "/api/" + url,
        method: "post",
        data: data,
      }).then((res) => {
        console.log(res, url);
        // layer.msg(res.data.type);

        if (res.data.type == "ok") {
          if (that.pwd == "") {
            that.$message.warning(that.$t("lay.inpwd"));
            loading.close();
            return;
          }
          if (that.pwd.length < 6 || that.pwd.length > 16) {
            that.$message.warning(that.$t("lay.pwdlength"));
            loading.close();
            return;
          }
          if (that.repwd == "") {
            that.$message.warning(that.$t("lay.repwd"));
            loading.close();
            return;
          }
          if (that.pwd !== this.repwd) {
            that.$message.warning(that.$t("lay.twopwd"));
            loading.close();
            return;
          }
          var data = {};
          var isMb = that.isMb;
          data.type = isMb ? "email" : "mobile";
          data.user_string = that.account;
          data.code = that.code;
          data.password = that.pwd;
          data.re_password = that.repwd;
          data.extension_code = that.invite;
          data.country_code = country[that.areaCode].area_code;

          that
            .$http({
              url: "/api/" + "user/register",
              data: data,
              method: "post",
            })
            .then((res) => {
              loading.close();
              if (res.data.type == "ok") {
                that.$message({
                  message: res.data.message,
                  type: "success",
                });
                that.$router.push("/components/login");
              } else {
                that.$message.error(res.data.message);
              }
            });
        } else {
          loading.close();
          this.$message.error(res.data.message);
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.particles {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
}

.register-bg{
  position: fixed;
  left: 50%;
  top: 52%;
  transform: translate(-50%, -50%);
  max-height: calc(100vh - 200px);
  overflow: auto;
  background: rgba(255, 255, 255, 0.1);
  padding: 30px;
  border-radius: 10px;
}

::-webkit-scrollbar {
  /*滚动条整体样式*/
  width : 10px;  /*高宽分别对应横竖滚动条的尺寸*/
  height: 1px;
  }
 ::-webkit-scrollbar-thumb {
  /*滚动条里面小方块*/
  border-radius: 10px;
  box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
  background   : #639ef5;
  }
 ::-webkit-scrollbar-track {
  /*滚动条里面轨道*/
  box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  background   : #b8b7b7;
  }

.el-checkbox__input.is-checked .el-checkbox__inner,
.el-checkbox__input.is-indeterminate .el-checkbox__inner {
  border-color: #06da9a !important;
  background: #06da9a !important;
}

.el-checkbox__input.is-checked + .el-checkbox__label {
  color: #06da9a !important;
}

.nav-list {
  display: flex;
  margin-top: 20px;
  .nav-item {
    margin-right: 40px;
    cursor: pointer;
    padding-bottom: 10px;
    &.active {
      color: #7a98f7;
      border-bottom: 2px solid #7a98f7;
    }
  }
}

.aggre {
  width: 16px !important;
  margin-right: 5px;
}

.invite-box {
  margin-bottom: 10px;
}
.link_text {
  color: #d45858;
}

.pointer {
  cursor: not-allowed !important;
  opacity: 0.6;
}

.chooseCountry {
  width: 520px;
  min-height: 46px;
  border-radius: 3px;
  padding: 0 15px;
  border-color: #ccc;
}

.chooseTel {
  height: 46px;
  width: 160px;
  border-color: #ccc;
  padding: 0 10px;
  font-size: 14px;
}

.phone {
  width: 360px !important;
  border-left: none;
}

.code-btn {
  cursor: pointer;
}

#register-box {
  .main-register {
    background: url(../../static/imgs/bg_login.png) center top repeat-x,
      -webkit-linear-gradient(top, #1b2c42, #1b2c42);
    height: calc(100vh - 49px);
    background-size: cover;
    position: relative;
  }

  .tip {
    color: #ccc;
    font-size: 12px;
    margin: 15px 0 10px;
  }

  .reg-content {
    box-sizing: border-box;
    color: #ccc;
    margin-right: 50px;

    input {
      width: 520px;
      min-height: 46px;
      border: 1px solid #4e5b85;
      padding: 0 20px;
      color: #c7cce6;
      font-size: 14px;
      border-radius: 3px;
      background-color: #181d25;
    }

    > .title {
      font-size: 36px;
    }

    > .tab {
      margin: 10px 0 20px;

      span {
        margin: 0 20px;
      }
    }

    .code-box {
      width: 520px;
      height: 46px;
      background-color: #181d25;
      border: 1px solid #4e5b85;

      input {
        border: none;
        height: 44px;
        min-height: 44px;
        width: 319px;
      }

      button {
        border: none;
        line-height: 43px;
        width: 193px;
        color: #c7cce6;
        border-left: 1px solid #2c3846;
        background: #181d25;
      }
    }
  }

  .reg-btn,
  .confirm-btn {
    line-height: 46px;
    width: 200px;
    margin: 10px 0 0 0;
    border: none;
    background: #2ab098;
    color: #fff;
  }

  .area-box {
    position: relative;
    width: 520px;
    line-height: 44px;
    //background-color: #1e2235;
    //color: #c7cce6;
    text-align: center;
    height: 46px;

    .light {
      color: #7a98f7;
    }

    // overflow: hidden;
    .area {
      display: flex;
      border: 1px solid #4e5b85;

      > div {
        flex: 1;
      }

      .city {
        border-left: 1px solid #4e5b85;
        border-right: 1px solid #4e5b85;
      }
    }

    .area-list {
      position: absolute;
      width: 520px;
      top: 46px;
      left: 0;
      display: flex;
      z-index: 999;

      > ul {
        flex: 1;
        background-color: #1e2235;
        height: 265px;
        overflow: scroll;
      }

      > ul::-webkit-scrollbar {
        display: none;
      }
    }
  }
}

.day {
  #register-box {
    background: #ffffff;

    .reg-content {
      background: #ffffff;

      input {
        border: 1px solid #d4d4d4;
        background-color: #ffffff;
        color: #999;
      }

      .code-box {
        background-color: #ffffff;
        border: 1px solid #d4d4d4;
      }
    }
  }

  .main_title {
    color: #484f73;
  }
}
</style>
