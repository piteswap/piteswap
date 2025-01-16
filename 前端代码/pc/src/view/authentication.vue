<template>
  <div class="account-main wrap fColor1">
    <div class="title">{{ $t('security.idcard') }}</div>

    <div class="main-content">
      <!-- <div v-show="review_status==0">
        <div class="main-input">
          <div class="flex alcenter center">
            <span>{{ $t('auth.name') }}：</span>
            <input type="text" :placeholder="$t('auth.truename')" id="name" v-model="name">
          </div>
          <div class="flex alcenter center mt20">
            <span>{{ $t('auth2.authCard') }}：</span>
            <input type="text" :placeholder='$t("auth.truenum")' id="card" v-model="card_id">
          </div>
        </div>
        <div class="mt40 fColor1 ft14 tc">{{ $t('auth.note') }}</div>
        <div class="idimg flex center mt40">
          <div>
            <img :src="src1" alt>
            <input type="file" accept="image/*" name="file" @change="file1($event)">
          </div>
          <div>
            <img :src="src2" alt>
            <input type="file" accept="image/*" name="file" @change="file2($event)">
          </div>
          <div>
            <img :src="src3" alt />
            <input type="file" accept="image/*" name="file" @change="file3($event)">
          </div>
        </div>
        <div class="updata tc">
          <input type="button" :value="$t('ad.up')" @click="updata" class="curPer">
        </div>
      </div>

      <div v-show="review_status==1">
        <div class="tc ft30 au-statue">{{ $t('auth.ising') }}</div>
      </div>
      
      <div v-show="review_status==2">
        <div class="tc ft30 au-statue">{{ $t('auth.ised') }}</div>
      </div> -->

      <div class="header-box">
        <div class="name">{{ $t('shop.truename') }}</div>
        <div class="status">
          <div class="status-item" v-show="review_status==2">
            <img src="@/assets/images/success.png" alt="">
            <span style="color: green">{{ $t('auth.ised') }}</span>
          </div>
          <div class="status-item" v-show="review_status==1">
            <span style="color: ">{{ $t('auth.ising') }}</span>
          </div>
          <div class="status-item" v-show="review_status==0">
            <img src="@/assets/images/icon_error.png" alt="">
            <span style="color: rgb(231, 88, 88)">{{ $t('shop.nowlz') }}</span>
          </div>
        </div>
      </div>

      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="190px" style="margin-top: 20px" size="small" v-if="review_status == 0">
        <el-form-item :label='$t("register01.country")' prop="country">
          <el-select v-model="ruleForm.country" style="width: 100%">
            <el-option v-for="(item, index) in country" :label="item.name_en" :value="item.country_id" :key="index"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item :label='$t("auth.name")' prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item :label='$t("auth.idnum")' prop="card_id">
          <el-input v-model="ruleForm.card_id"></el-input>
        </el-form-item>
        <el-form-item :label='$t("auth.lxaddress")' prop="address">  
          <el-input v-model="ruleForm.address"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm">{{ $t('auth.tjsubmit') }}</el-button>
        </el-form-item>
      </el-form>

      <div class="header-box">
        <div class="name">{{ $t('shop.high') }}</div>
        <div class="status">
          <div class="status-item" v-show="gao_status==2">
            <img src="@/assets/images/success.png" alt="">
            <span style="color: green">{{ $t('auth.ised') }}</span>
          </div> 
          <div class="status-item" v-show="gao_status==1">
            <span style="color: ">{{ $t('auth.ising') }}</span>
          </div>
          <div class="status-item" v-show="gao_status==0">
            <img src="@/assets/images/icon_error.png" alt="">
            <span style="color: rgb(231, 88, 88)">{{ $t('shop.nowlz') }}</span>
          </div>
        </div>
      </div>

      <template v-if="gao_status == 0">  
        <div class="mt40 fColor1 ft14 tc">{{ $t('auth.note') }}</div>
        <div style="display:flex;align-items:center;margin-top: 20px;">
          <div>{{ $t('auth2.authcardid') }}</div>
          <el-input :placeholder='$t("auth2.authcardid")' v-model="cardId" style="width:80%" size="small"></el-input>
        </div>
        <div class="idimg flex center mt20">
          <div>
            <img :src="src1 || '../../static/imgs/addimg.png'" alt>
            <input type="file" accept="image/*" name="file" @change="file1($event)">
          </div>
          <div>
            <img :src="src2 || '../../static/imgs/addimg.png'" alt>
            <input type="file" accept="image/*" name="file" @change="file2($event)">
          </div>
          <div>
            <img :src="src3 || '../../static/imgs/addimg.png'" alt />
            <input type="file" accept="image/*" name="file" @change="file3($event)">
          </div>
        </div>
        <div style="text-align: center;margin-top:30px">
          <el-button type="primary" size="small" @click="gaoSub">{{ $t('auth.tjsubmit') }}</el-button>
        </div>
      </template>
      
    </div>

  </div>
</template>
<script>
import axios from "axios";
import country from "../lib/country.js";

export default {
  name: "authentication",
  data() {
    return {
      name: "",
      card_id: "",
      src1: "",
      src2: "",
      src3: "",
      review_status: 1,
      gao_status: 1,
      country: [],
      ruleForm:{
        country: "",
        name:"",
        card_id:"",
        address:""
      },
      rules: {
        country: [{required: true, trigger: 'change'}],
        name: [{required: true, trigger: 'blur'}],
        card_id: [{required: true, trigger: 'blur'}],
        address: [{required: true, trigger: 'blur'}],
      },
      cardId: ''
    };
  },
  created() {
    this.token = localStorage.getItem("token");
    let arrSort = country.sort((s,t) => {
      let a = s.name_en[0].toLowerCase()
      let b = t.name_en[0].toLowerCase()
      if(a < b){return -1}
      if(a > b){return 1}
      return 0
    })
    this.country = arrSort

    this.Info();
  },
  methods: {
    // 实名认证
    submitForm(){
      this.$refs['ruleForm'].validate((valid) => {
        if (valid) {
          this.$http({
            url: "/api/user/real_name",
            method: "post",
            data: this.ruleForm,
            headers:{Authorization:window.localStorage.getItem('token')}
          }).then(res => {
            console.log(res,'res')
            if(res.data.type == 'ok'){
              this.$message.success(res.data.message)
              this.Info()
            }else{
              this.$message.error(res.data.message)
            }
          }).catch(err => {
            console.log(err)
            this.$message.error('Error')
          })
        }
      });
    },

    // 高级认证
    gaoSub(){
      if(this.review_status != 2){
        this.$message.warning(this.$t("auth.authts"))
        return
      }
      if(!this.cardId || !this.src1 || !this.src2 || !this.src3){
        this.$message.warning(this.$t("auth.xinxits"))
        return
      }
      this.$http({
        url: "/api/user/real_name2",
        method: "post",
        data: {
          card_id: this.cardId,
          front_pic: this.src1,
          reverse_pic: this.src2,
          hand_pic: this.src3,
        },
        headers:{Authorization:window.localStorage.getItem('token')}
      }).then(res => {
        console.log(res,'res')
        if(res.data.type == 'ok'){
          this.$message.success(res.data.message)
          this.Info()
        }else{
          this.$message.error(res.data.message)
        }
      }).catch(err => {
        console.log(err)
        this.$message.error('Error')
      })
    },

    file1(e) {
      let that = this;
      let reader = new FileReader();
      // console.log(window.event.target.files[0]);
      let file = e.target.files[0];

      reader.readAsDataURL(file);
      reader.onload = function (ed) {
      };
      let formData = new FormData();
      formData.append("file", file);
      axios.post("/api/upload", formData, {
        headers: {"Content-Type": "multipart/form-data"}
      }).then(res => {
        let msg = res.data;
        if (msg.type == 'ok') {
          that.src1 = msg.message;
        } else {
          layer.msg(msg.message)
        }
      });
    },
    file2(e) {
      let that = this;
      let reader = new FileReader();
      // console.log(window.event.target.files[0]);
      let file = e.target.files[0];

      reader.readAsDataURL(file);
      reader.onload = function (ed) {
      };
      let formData = new FormData();
      formData.append("file", file);
      axios.post("/api/upload", formData, {
        headers: {"Content-Type": "multipart/form-data"}
      }).then(res => {
        let msg = res.data;
        if (msg.type == 'ok') {
          that.src2 = msg.message;
        } else {
          layer.msg(msg.message)
        }
      });
    },
    file3(e) {
      let that = this;
      let reader = new FileReader();
      // console.log(window.event.target.files[0]);
      let file = e.target.files[0];

      reader.readAsDataURL(file);
      reader.onload = function (ed) {
      };
      let formData = new FormData();
      formData.append("file", file);
      axios.post("/api/upload", formData, {
        headers: {"Content-Type": "multipart/form-data"}
      }).then(res => {
        let msg = res.data;
        if (msg.type == 'ok') {
          that.src3 = msg.message;
        } else {
          layer.msg(msg.message)
        }
      });
    },

    updata() {
      var that = this;
      let name = this.$utils.trim(that.name);
      let card_id = this.$utils.trim(that.card_id);
      if (this.name.length == "") {
        layer.tips(that.$t('auth.truename'), "#name");
        return;
      }
      if (this.card_id.length == "") {
        layer.tips(that.$t('auth.truenum'), "#card");
        return;
      }

      if (that.src1 == "" || that.src2 == '' || that.src3 == '') {
        layer.tips(that.$t('auth.img'), "#name");
        return;
      }
      this.$http({
        url: "/api/" + "user/real_name",
        method: "post",
        data: {
          name: name,
          card_id: card_id,
          front_pic: that.src1,
          reverse_pic: that.src2,
          hand_pic: that.src3
        },
        headers: {Authorization: that.token}
      })
          .then(res => {
            layer.msg(res.data.message);
            if (res.data.type == 'ok') {
              setTimeout(function () {
                that.$router.push("/");
              }, 500);
            }
          })
          .catch(error => {
          });
    },

    Info() {
      var that = this;
      this.$http({
        url: "/api/" + "user/center",
        method: "get",
        data: {},
        headers: {Authorization: that.token}
      }).then(res => {
        that.review_status = res.data.message.review_status;
      }).catch(error => {});

      this.$http({
        url: "/api/" + "user/center2",
        method: "get",
        data: {},
        headers: {Authorization: that.token}
      }).then(res => {
        that.gao_status = res.data.message.review_status;
      }).catch(error => {});
    }
  }
};
</script>

<style scoped lang="scss">
// .leftNav {
//   margin-right: 0px !important;
// }

.account-main {
  background: #273041;
  padding: 20px;
  background: #181b2a;

  .title {
    width: 100%;
    line-height: 60px;
    border-radius: 4px;
    border-bottom: 1px solid #273041;
  }

  .main-content {
    min-height: 700px;
    border-radius: 2px;

    .header-box{
      display: flex;
      width: 100%;
      justify-content: space-between;
      align-items: center;
      background: #1b2c42;
      padding: 10px;
      box-sizing: border-box;
      border-bottom: 2px solid rgb(23, 28, 43);
      .status-item{
        display: flex;
        align-items: center;
        img{
          width: 18px;
          height: 18px;
          margin-right: 3px;
          display: block;
        }
      }
    }

    .main-input {
      margin: 0 auto;
      text-align: center;
      padding-top: 100px;

      span {
        width: 100px;
      }

      input {
        width: 320px;
        min-height: 46px;
        border: 1px solid #4e5b85;
        padding: 0 20px;
        color: #c7cce6;
        font-size: 14px;
        border-radius: 3px;
        background-color: #1e2235;
      }
    }

    .idimg {
      div {
        width: 160px;
        height: 160px;
        overflow: hidden;
        position: relative;
        background-size: 100% 100%;
        border: 1px solid #e2e2e2;
        margin-left: 50px;

        input {
          position: absolute;
          z-index: 11110;
          opacity: 0;
          margin-left: -160px;
          width: 100%;
          height: 160px;
          top: 0;
          cursor: pointer;
        }

        img {
          width: 100%;
        }
      }
    }

    .updata {
      input {
        width: 300px;
        height: 45px;
        border-radius: 4px;
        color: #c7cce6;
        font-size: 14px;
        margin: 0 auto;
        margin-left: 100px;
        margin-top: 60px;
        background: #5697f4;
      }
    }

    .au-statue {
      padding-top: 100px;
      font-size: 30px;
    }
  }
}
</style>


// WEBPACK FOOTER //
// src/view/authentication.vue
