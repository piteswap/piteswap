<template>
  <div class="box">
    <indexHeader></indexHeader>
    <div class="minheight" style="background: #1b2c42;">
      <div class="fColor1" style="line-height: 60px; text-indent: 1em; font-size: 18px;  width:1200px;margin:0 auto;">{{ $t("home.accountname") }}</div>
      <div class="account flex">
        <left v-bind:lang="lang" :current="0"></left>
        <router-view style="flex:1; border-radius: 10px; background: #171c2b;margin-left: 3px;"></router-view>
      </div>
    </div>
    <indexFooter></indexFooter>
  </div>
</template>
<script>
import indexHeader from '@/view/indexHeader';
import indexFooter from "@/view/miniFooter";
import left from '@/view/left'

export default {
  name: 'account',
  data() {
    return {
      lang: ''
    }
  },
  components: {
    indexHeader,
    indexFooter,
    left,
  },
  // mounted(){
  //     this.bus.$on('nav_name',cur=>{
  //         this.array.findIndex()
  //     })
  // }
}
</script>
<style scoped>
.box {
  background-color: #273041;
}

@media screen and (max-width: 1920px) {
  .minheight{
    min-height: 850px;
  }
}

@media screen and (min-width: 2500px) {
  .minheight{
    min-height: 1150px;
  }
}

.box .account {
  width: 1200px;
  padding-top: 0px;
  margin: 0px auto;
  overflow: hidden;
}

</style>
