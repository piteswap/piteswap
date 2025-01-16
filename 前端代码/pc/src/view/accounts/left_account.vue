<template>
  <div class="leftNav ft14">
    <ul class="fColor1">
      <li
        v-for="(item, index) in array"
        :key="index"
      >
        <!-- <i class="iconfont mr10" :class="item.icon"></i> -->
        <div class="content" :class="index == curActive ? 'active' : ''" @click="goto(index, item.page)">
          <img :src="index == curActive ? item.src2 : item.src1" alt="" />
          <span>{{ item.text }}</span>
        </div>
        <div class="children" v-if="item.list && item.list.length">
          <span
            v-for="(element, k) in item.list"
            :key="k"
            :class="{ children_active: type === element.type }"
            @click.stop="goto(index, element.page, element.type)"
            >{{ element.name }}</span
          >
        </div>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  name: "left_account",
  data() {
    return {
      curActive: 1,
      array: [
        // {
        //   src1: require("@/assets/images/账户余额 拷贝.png"),
        //   src2: require("@/assets/images/账户余额 拷贝 2.png"),
        //   text: this.$t("account.laccount"),
        //   page: "legal",
        //   icon: "icon-fabijiaoyi",
        //   children: ["legal"],
        // },
        {
          src1: require("@/assets/images/yu.png"),
          src2: require("@/assets/images/yu_xz.png"),
          text: this.$t("usercenter.change"),
          icon: "icon-bibijiaoyi",
          page: "change",
          children: ["change"],
        },

        {
          src1: require("@/assets/images/shengou.png"),
          src2: require("@/assets/images/shengou_xz.png"),
          text: this.$t("currency.subscription"),
          icon: "icon-bibijiaoyi",
          page: "MySubscription",
          children: ["MySubscription"],
          list: [
            {
              name: this.$t("currency.duringsubscription"),
              type: 1,
              page: "MySubscription",
            },
            {
              name: this.$t("currency.launched"),
              type: 2,
              page: "MySubscription",
            },
            {
              name: this.$t("myOrder.done"),
              type: 3,
              page: "MySubscription",
            },
          ],
        },

        {
          src1: require("@/assets/images/qiquan.png"),
          src2: require("@/assets/images/qixuan_xz.png"),
          text: this.$t("usercenter.option"),
          icon: "icon-qukuailian",
          page: "letransactions",
          children: ["letransactions"],
        },
        {
          src1: require("@/assets/images/sdhy.png"),
          src2: require("@/assets/images/sdhy_xz.png"),
          text: this.$t("usercenter.lever"),
          icon: "icon-qukuailian",
          page: "finance",
          children: ["finance"],
        },

        // {
        //   src1: require("@/assets/images/账户余额 拷贝.png"),
        //   src2: require("@/assets/images/账户余额 拷贝 2.png"),
        //   text: 'c2c账户',
        //   page:'legal',
        //   children:['legal']
        // },
        {
          //					 	src1: require("@/assets/images/transfer.png"),
          src1: require("@/assets/images/gerenzhognxin.png"),
          //					 	src2: require("@/assets/images/transferSelected.png"),
          src2: require("@/assets/images/gerenzhongxin_xz.png"),
          text: this.$t("account.transfer"),
          icon: "icon-huazhuan",
          page: "transferLegal",
          children: ["transferLegal"],
        },
      ],
    };
  },

  computed: {
    type() {
      return this.$route.query?.type || undefined;
    },
  },

  created() {
    let name = this.$route.name;
    this.curActive = this.array.findIndex(
      (val) =>
        val.page === name || (val.children && val.children.includes(name))
    );
  },
  mounted() {
    this.bus.$on("nav_name", (name) => {
      this.curActive = this.array.findIndex(
        (val) =>
          val.page === name || (val.children && val.children.includes(name))
      );
    });
  },
  methods: {
    goto(index, name, type) {
      this.curActive = index;
      if (name === "MySubscription") {
        this.$router.push({
          name: name,
          params: { lang: this.lang },
          query: { type: type || 1 },
        });
      } else {
        this.$router.push({ name: name, params: { lang: this.lang } });
      }
    },
  },
};
</script>
<style lang="scss" scoped>
.leftNav {
  // background-color: #1b2945;
  .mr10 {
    margin-right: 10px;
  }

  .flex {
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  ul {
    height: max-content;

    li {
      min-height: 54px;
      padding-left: 38px;
      margin-bottom: 4px;
      display: flex;
      flex-direction: column;

      .content {
        width: 100%;
        height: 54px;
        display: flex;
        align-items: center;
        cursor: pointer;

        img {
          width: 20px;
          height: 20px;
          margin-right: 18px;
        }
      }

      .active {
        color: #2ab098;
        background-color: #171c2b;
        border-bottom: none;
        // display: block;
      }

      .children {
        margin-left: 38px;
        display: flex;
        flex-direction: column;
        span {
          width: max-content;
          margin-top: 27px;
          cursor: pointer;

          &:last-child {
            margin-bottom: 27px;
          }
        }

        .children_active {
          color: #2ab098;
          border-bottom: 1px solid rgba(43, 166, 147, 1);
          padding-bottom: 8px;
        }
      }
    }
  }
}
</style>
