<template>
    <div>
        <index-header></index-header>
        <div  class="account-wrap">
            <div  class="account">
                <div >
                    <div class="back-nav fColor1 ft20">
                        {{$t('security.setting')}}{{$t('security.tbpw')}}
                        <span class="fr fColor2 mouseDefault" @click="goBack">&lt;&lt;{{$t('back')}}</span>
                    </div>
                    <div class="nav-after"></div>
                </div>
                <div  class="account-content">
                    <div  class="main ft14">
                        <div >
                            <span  class="fColor2 left">{{$t('security.tbpw')}}</span> <input  type="password" maxlength="6" placeholder="6位字母或数字" class="main-input"></div>
                        <div  class="mt40">
                            <span  class="fColor2 left">{{$t('register.repwd')}}</span> <input  type="password" maxlength="6" placeholder="$t('lpwd.repwd')" class="main-input"></div>
                        <div  class="mt60">
                            <span  class="fColor2 left">&nbsp;</span>
                            <div  class="baseBtn ml20 mouseDefault">{{$t('confirm')}}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import indexHeader from "@/view/indexHeader";
export default {
  name: "setCash",
  data() {
    return {};
  },
  components: {
    indexHeader
  },
  methods:{
      goBack(){
        this.$router.back(-1);
      }
  }
}
</script>

<style lang="scss" scoped>
$navBack:#181b2a;	
$base:#5697f4;
$line:#303b4b;
$fColor2:#637085;
.account-main {
    padding-left: 34px;
    padding-right: 34px;
    padding-top: 34px;
    .bar-bottom {
      width: 320px;
      height: 8px;
      border-radius: 4px;
      background-color: $navBack;
      margin: 22px 0 12px 0;
      overflow: hidden;
      .bar-top {
        background-color: $base;
        height: 100%;
      }
    }
    ul {
      border-top: 1px solid $line;
      color: $fColor2;
      font-size: 14px;
      img {
        width: 16px;
        vertical-align: middle;
      }
      li {
        border-bottom: 1px solid $line;
        line-height: 72px;
        position: relative;
        p {
          position: absolute;
          left: 300px;
          top: 0;
        }
      }
    }
  }
.main{
    padding: 208px 0 0 400px;
    line-height: 48px;
}
.main .left{
    display: inline-block;
    width: 80px;
    text-align: right;
}
.main .main-input {
    margin-left: 20px;
    width: 428px;
}
.main-input {
    width: 360px;
    height: 48px;
    border: 1px solid #52688c;
    padding: 0 20px;
    color: #cdd6e4;
    font-size: 16px;
    border-radius: 3px;
    background-color: #262a42;
}
</style>





// WEBPACK FOOTER //
// src/components/setCash.vue