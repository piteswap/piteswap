<template>
  <div class="box">
    <indexHeader></indexHeader>
    <div class="account">
      <div class="topcontent ft20 fColor1">
        <div style="width:1200px; margin:0 auto;">
          <span>{{ $t('account.assets') }}</span>
        </div>
      </div>
      <div style="width:1200px; margin:0px auto;">
        <div class="leftcontent contentBK">
          <left></left>
        </div>
        <div class="rightcontent contentBK">
          <router-view></router-view>
        </div>
      </div>
    </div>

    <indexFooter></indexFooter>
  </div>
</template>
<script>
import indexHeader from '@/view/indexHeader'
import indexFooter from "@/view/indexFooter";
import left from '@/view/accounts/left_account'

export default {
  name: 'account',
  data() {
    return {
      lang: '',
      currentIndex: 0,
    }
  },
  components: {
    indexHeader,
    left,
    indexFooter
  },
  mounted() {

  }
}
</script>
<style lang="scss" scoped>
.box .account {
  width: 100%;
  margin: 0;
  padding-top:0;
  background-color:#1b2c42;
}

.topcontent {
  height: 60px;
  line-height: 60px;
  padding: 0 30px;
  margin: 0px 0;
  font-size: 18px;
  border-radius: 3px;
  // background-color: #171c2b;
}

.leftcontent {
  width: 220px;
  margin-right: 0px;
  height: max-content;
  border-radius: 10px;
  padding: 4px;
  float: left;
  background-color: #171c2b;
}

.rightcontent {
  width: 977px;
  margin-left: 223px;
  min-height: 1000px;
  border-radius:10px;
  background-color: #171c2b;
}

</style>

