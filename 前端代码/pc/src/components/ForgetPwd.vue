<template>
  <div id="register-box" style="height: 100%">
    <indexHeader></indexHeader>

    <div class="main-register">
      <div class="flex" style="max-width: 1200px; margin: 0 auto">
        <div class="reg-content" style="min-height: 700px; width: 620px">
          <div class="title">{{ $t('forget.fpwd') }}</div>

          <div class="nav-list">
			  <div :class="['nav-item', !isMb && 'active']" @click="isMb = false">
          {{ $t('login.emailY') }}
        </div>
			   <div :class="['nav-item', isMb && 'active']" @click="isMb = true">
           {{ $t('login.phoneY') }}
         </div>
          </div>

          <div class="step-one" v-show="true">
        

            <div class="account-box">
              <div class="tip" v-if="isMb">{{ $t("lay.nophone") }}</div>
              <div class="tip" v-if="!isMb">{{ $t("lay.nemail") }}</div>
              <div class="flex">
                <select style="background-color: #1e2235;color: #c7cce6;border: 1px solid #4e5b85;" name="" v-if="isMb" class="chooseTel" v-model="areaCode" ref="select">
                  <option :value="index" v-for="(item, index) in country" :key="index" >
                    {{ item.area_code }}
                    {{ item.name_en }}
                  </option>
                </select>
                <input type="text" v-if="isMb" v-model="account_number" class="phone" />
                <input type="text" v-if="!isMb" :placeholder="$t('register.emailnum')" v-model="account_number" class=""/>
              </div>
            </div>

            <!-- <div class="tip" style="margin-bottom: 10px">
              {{ $t("register.codenum") }}
            </div>
            <div class="code-box">
              <input type="number" :placeholder="$t('register.codenum')" :readonly="readonly" @click="readonly = false" v-model="phoneCode" class="code"/>
              <button type="button" class="code-btn curPer" @click="sendCode">
                {{ sendCodeText }}
              </button>
            </div>
            <button class="confirm-btn curPer" v-if="false" @click="checkCode" type="button" >
              {{ $t("confirm") }}
            </button> -->
          </div>
          <div class="pwd-box">
            <div class="tip">{{ $t("forget.inpwd") }}</div>
            <input  type="password"  v-model="password"  class="pwd-input" :placeholder="$t('forget.inpwd')" />
          </div>
         <div class="repwd-box">
            <div class="tip">{{ $t("register.repwd") }}</div>
            <input   type="password"  v-model="re_password"  class="repwd-input" :placeholder="$t('register.repwd')"/>
          </div>
        <!--   <div class="invite-box">
            <div class="tip">{{ $t("register.invitecode") }}</div>
            <input
              type="text"
              v-model="invite"
              class="invite-input"
              :placeholder="$t('register.invitecode')"
            />
          </div> -->
		  <div style="margin-top: 10px;">
		    <span class="register-item"></span>
		    <button class="register-button curPer" @click="resetPass">
          {{ $t("confirm") }}
        </button>
		    <!-- <div class="have-account">
		      <router-link tag="span" class="baseColor" to="/forgetPwd" style="cursor:pointer">
		        {{ $t('login.forget') }}
		      </router-link>
		    </div> -->
		  </div>
          <!-- <div class="flex column">
            <el-checkbox v-model="agree">{{ $t("xieyi") }}</el-checkbox>
            <button
              type="button"
              style="border-radius: 4px"
              @click="login"
              class="reg-btn confirm-btn curPer"
            >
              {{ $t('logins') }}
            </button>
          </div> -->
        </div>
        <div class="fColor2" style="padding-top:120px;font-weight:normal;font-size:14px;line-height:50px;flex:1;text-align:left;">
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
      isMb: false, //是否为手机注册
      account_number: "", //用户名
      pwd: "", //密码
      repwd: "", //重复密码
      code: "", //验证码
      invite: "", //邀请码
      timer: "", //倒计时timer
      showList: false, //是否显示地址列表
      country: country,
      province: { id: "", name: this.$t("legaltrade.select") }, //所选省份
      provinces: [], //省份列表
      city: { id: "", name: this.$t("legaltrade.select") }, //所选城市
      cities: [], //城市列表
      district: { id: "", name: this.$t("legaltrade.select") }, //所选地区
      districts: [], //地区列表
      countryS: "",
      re_password:'',
      password:'',
      phoneCode:'',
    };
  },
  created() {
 //    var invite = this.get_all_params().extension_code;
	
 //    if (invite) {
 //      this.invite = invite;
 //    }

 //    console.log(country,"99");
 //    let account = this.get_all_params().email;
 //    account = decodeURIComponent(account);
 //    if (account) {
 //      var emreg =
 //        /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
 //      if (!emreg.test(account)) {
 //      } else {
 //        this.account = account;
 //      }
 //    }
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
      } else if (isMb) {
        // var reg = /^1[3456789]\d{9}$/;
        // if (!reg.test(this.account)) {
        //   // layer.msg("您输入的手机号不符合规则");
        //   // return;
        // }
      } else if (!isMb) {
        var emreg =
          /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if (!emreg.test(this.account)) {
          this.$message.error(this.$t("register.emailnum"));
          return;
        } else {
          url = "sms_mail";
        }
      } else {
      }

      let data = { user_string: this.account_number,type:'forget' };
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
          this.timer = setInterval(function () {
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
      } else if (this.code == "") {
        layer.msg(this.$t("lay.notcode"));
        return;
      } else {
        if (!this.isMb) {
          if (
            !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(
              this.account
            )
          ) {
            layer.msg(this.$t("register.emailnum"));
            return;
          }
        } else {
          if (!/^1[0-9]{10}$/.test(this.account)) {
            layer.msg("请输入正确的手机号");
            return;
          }
        }

        let data = {};
        let url = "user/check_email";
        if (this.isMb) {
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
        this.$message.warning("请先勾选同意用户协议");
        return false;
      }

      let code = this.code;
      if (this.account == "") {
        this.$message.warning(this.$t("lay.paccount"));
        return;
      } else if (this.code == "") {
        this.$message.warning(this.$t("lay.notcode"));
        return;
      } else {
        if (!this.isMb) {
          if (
            !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(
              this.account
            )
          ) {
            this.$message.warning(this.$t("register.emailnum"));
            return;
          }
        } else {
          if (!/^1[0-9]{10}$/.test(this.account)) {
            this.$message.warning("请输入正确的手机号");
            return;
          }
        }

        let data = {};
        let url = "user/check_email";
        if (this.isMb) {
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
          // layer.msg(res.data.message);

          if (res.data.type == "ok") {
            if (that.pwd == "") {
              that.$message.warning(that.$t("lay.inpwd"));
              return;
            } else if (that.pwd.length < 6 || that.pwd.length > 16) {
              that.$message.warning(that.$t("lay.pwdlength"));
              return;
            } else if (that.repwd == "") {
              that.$message.warning(that.$t("lay.repwd"));
              return;
            } else if (that.pwd !== this.repwd) {
              that.$message.warning(that.$t("lay.twopwd"));
              return;
            } else if (that.invite == "") {
              that.$message.warning(that.$t("register.invitecode"));
              return;
            }
            var data = {};
            var isMb = that.isMb;
            data.type = isMb ? "mobile" : "email";
            data.user_string = that.account;
            data.code = that.code;
            data.password = that.pwd;
            data.re_password = that.repwd;
            data.extension_code = that.invite;
            data.country_code = country[this.areaCode].area_code;

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
      }
    },
  
	//登陸
	login(){
		console.log(this.account_number,this.pwd,"99")
		let account_number = this.$utils.trim(this.account_number);
		let pwd = this.$utils.trim(this.pwd);
		if (this.account_number.length == '') {
		  layer.tips('请输入账号!', '#account');
		  return;
		}
		if (this.pwd.length < 6) {
		  layer.tips('密码不能小于六位!', '#pwd');
		  return;
		}
		var i = layer.load();
		this.$http({
		  url: '/api/' + 'user/login',
		  method: 'post',
		  data: {
		    user_string: account_number,
		    password: pwd,
		    type: 1
		  }
		}).then(res => {
		  layer.close(i);
		  res = res.data;
		  if (res.type === 'ok') {
		    localStorage.setItem('token', res.message);
		    localStorage.setItem('accountNum', account_number);
		    this.$store.commit('setAccountNum');
		    this.userInfo();
		    this.$router.push('/');
		  } else {
		    layer.msg(res.message);
		  }
		}).catch(error => {
		  console.log(error)
		})
	},
	
	userInfo() {
	  this.$http({
	    url: '/api/' + 'user/info',
	    method: 'get',
	    data: {},
	    headers: {'Authorization': localStorage.getItem('token')},
	  }).then(res => {
	    if (res.data.type == 'ok') {
	      localStorage.setItem('user_id', res.data.message.id);
	      // localStorage.setItem('email',res.data.message.email);
	      localStorage.setItem('extension_code', res.data.message.extension_code);
	      localStorage.setItem('is_seller', res.data.message.is_seller);
	      eventBus.$emit("seller", res.data.message.is_seller);
	    }
	  }).catch(error => {
	
	  })
	
	},
  
	// 确认密码
	resetPass() {
	  if (this.password == "") {
	    layer.msg("请输入密码");
	    return;
	  } else if (this.re_password == "") {
	    layer.msg("请再次输入密码");
	    return;
	  } else if (this.password !== this.re_password) {
	    layer.msg("两次输入的密码不一致");
	    return;
	  } else {
	    let data = {
        areacode: country[this.areaCode].area_code,
	      account: this.account_number,
	      password: this.password,
	      repassword: this.re_password,
	      code: this.phoneCode
         
	    };
	    this.$http({
	      url: "/api/user/forget",
	      method: "post",
	      data: data
	    }).then(res => {
	      layer.msg(res.data.message);
	      if (res.data.type == "ok") {
	        this.$router.push("/components/login");
	      }
	    });
	  }
	}
  },
};
</script>
<style scoped>
.content-wrap {
  background: url(../assets/images/bg_login.png) center bottom 316px repeat-x,
    -webkit-linear-gradient(top, #21263f, #262a42);
}
.account {
  width: 1200px;
  margin: 0 auto;
  padding-top: 93px;
  overflow: hidden;
  min-height: 880px;
}
.main {
  position: relative;
  padding: 0 0 60px 30px;
}
.main_title {
  font-size: 36px;
  color: #c7cce6;
}
.register-item {
  display: block;
  height: 22px;
  color: #61688a;
  font-size: 12px;
}
.register-input {
  position: relative;
  margin-top: 20px;
}
.input-box {
  position: relative;
  margin-top: 40px;
}
.input-main {
  width: 520px;
  min-height: 46px;
  border: 1px solid #4e5b85;
  padding: 0 20px;
  color: #c7cce6;
  font-size: 14px;
  border-radius: 3px;
  background-color: #1e2235;
}
.icon {
  width: 48px;
  height: 48px;
  line-height: 48px;
  border-right: 1px solid #52688c;
  position: absolute;
  top: 0;
}
.login-btn {
  width: 420px;
  margin-top: 40px;
  background: #5697f4;
  font-size: 16px;
  border-radius: 4px;
  color: #fff;
  line-height: 48px;
  cursor: pointer;
}
.noaccount {
  color: #fff;
}
.register-button {
  width: 200px;
  display: inline-block;
  line-height: 46px;
  background-color: #7a98f7;
  border-radius: 4px;
  color: #fff;
  border: none;
}
.have-account {
  font-size: 14px;
  display: inline-block;
  margin-left: 30px;
}
.right-tip {
  position: absolute;
  left: 620px;
  top: 70px;
  line-height: 24px;
  padding-right: 50px;
  margin-top: 10px;
  font-size: 14px;
  color: #61688a;
}
.code-box {
  width: 520px;
  border: 1px solid #4e5b85;
  background: #1e2235;
}
.code-box .input-main {
  width: 419px;
  border: none;
}
.code-box button {
  border: none;
  border-left: 1px solid #4e5b85;
  line-height: 44px;
  color: #7a98f7;
  background: #1e2235;
  width: 94px;
}
</style>

<style lang='scss' scoped>
.el-checkbox__input.is-checked .el-checkbox__inner,
.el-checkbox__input.is-indeterminate .el-checkbox__inner {
  border-color: #00a4d8 !important;
  background: #00a4d8 !important;
}

.el-checkbox__input.is-checked + .el-checkbox__label {
  color: #00a4d8 !important;
}

.nav-list{
  display: flex;
  margin-top: 20px;
  .nav-item{
    margin-right: 40px;
    cursor: pointer;
    padding-bottom: 10px;
    &.active{
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
  margin-bottom: 20px;
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
      -webkit-linear-gradient(top, #181d25, #181d25);
    min-height: 100%;
  }

  .tip {
    color: #61688a;
    font-size: 12px;
    margin: 15px 0 10px;
  }

  .reg-content {
    padding: 43px 0px;
    width: 1200px;
    margin: 0 auto;
    box-sizing: border-box;

    color: #c7cce6;

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
    margin: 20px 0 0;
    border: none;
    background: #00a4d8;
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
