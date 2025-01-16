<template>
  <div class="leftNav ft16">
    <ul class="fColor1">
      <li v-for="(item,index) in array" class="flex" :class="index == curActive ? 'active' :''"
          @click="goto(index,item.page)" :key="index">
        <i class="iconfont mr10" :class="item.icon"></i>
        <span>{{ item.text }}</span>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  name: "left",
  data() {
    return {
      curActive: 0,
      array: [
        {
          src1: require("@/assets/images/icon_account_settings.png"),
          src2: require("@/assets/images/icon_account_settings_s.png"),
          text: this.$t('security.accountset'),
          icon: 'icon-shezhi',
          page: 'accountSet'
        },
        {
          src1: require("@/assets/images/icon_news.png"),
          src2: require("@/assets/images/icon_news_s.png"),
          text: this.$t('header.tradelog'),
          icon: 'icon-jiaoyijilu1',
          page: 'transferLog',
        },
        {
          src1: require("@/assets/images/icon_mine.png"),
          src2: require("@/assets/images/icon_mine_s.png"),
          text: this.$t('security.idcard'),
          icon: 'icon-icon',
          page: 'authentication',
        },
		{
		  src1: require("@/assets/images/icon_mine.png"),
		  src2: require("@/assets/images/icon_mine_s.png"),
		  text: this.$t('bankbind.title'),
		  icon: 'icon-icon',
		  page: 'bankbind',
		},
        // {
        // 	src1: require("@/assets/images/icon_news.png"),
        // 	src2: require("@/assets/images/icon_news_s.png"),
        // 	text: this.$t('header.inset'),
        // 	page:'userSetting'
        // },
      ],
    }
  },
  created() {
    let name = this.$route.name;
    this.curActive = this.array.findIndex(val => val.page === name || (val.children && val.children.includes(name)));
  },
  mounted() {
    this.bus.$on("nav_name", name => {
      this.curActive = this.array.findIndex(val => val.page === name || (val.children && val.children.includes(name)));
    })
  },
  methods: {
    goto(index, name) {
      this.curActive = index;
      this.$router.push({name: name, params: {lang: this.lang}})
    },

  }
};
</script>
<style lang="scss" scoped>
.mr10 {
  margin-right: 10px;
}

.flex {
  display: flex;
  flex-direction: row;
  align-items: center;
}

.leftNav {
  margin-right: 0px;
  padding: 4px;
  background-color: #171c2b;
  width: 210px;
  box-sizing: border-box;
  float: left;
  border-radius: 10px;

  .iconfont {
    font-size: 20px;
  }

  ul {
    min-height: 800px;

    li {
      height: 54px;
      line-height: 54px;
      padding-left: 38px;
      margin-bottom: 4px;
      cursor: pointer;

      img {
        margin-right: 12px;
        margin-top: -4px;
        width: 20px;
        vertical-align: middle;
      }
    }

    .active {
      // color: #00a4d8;
      color: #2ab098;
      background-color: #171c2b;
      border-bottom: none;
    }
  }
}
</style>

