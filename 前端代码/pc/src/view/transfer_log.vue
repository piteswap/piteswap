<template>
  <div class="account-main wrap">
    <ul class="white log_ul">
      <li class="flex ft14">
        <span class="flex1 tc">{{ $t("time") }}</span>
        <span class="flex1 tc">{{ $t("legal.account") }}</span>
        <span class="flex1 tc">{{ $t("account2.explain") }}</span>
        <span class="flex1 tc">{{ $t("c2c.money") }}</span>
      </li>
      <div class="li_wrap scroll">
        <li
          class="flex ft12 around"
          v-for="(item, index) in log_list"
          :key="index"
        >
          <span class="flex1 tc">{{ item.created_time }}</span>
          <span class="flex1 tc">{{ item.account }}</span>
          <span class="flex1 tc">{{ getInfo(item) }}</span>
          <span class="flex1 tc">{{ item.value | toFixeds }}</span>
        </li>
        <p class="tc more" @click="getMore">{{ more }}</p>
      </div>
    </ul>
  </div>
</template>
<script>
export default {
  data() {
    return {
      more: this.$t("more"),
      page: 1,
      limit: 20,
      log_list: [],
    };
  },
  filters: {
    toFixeds: function (value) {
      value = Number(value);
      return value.toFixed(2);
    },
  },

  computed: {
    lang () {
      return localStorage.getItem("lang")
    }
  },
  
  created() {},
  mounted() {
    this.init();
  },
  methods: {
    init() {
      this.$http({
        url: "/api/" + "account/list",
        method: "post",
        data: { limit: this.limit, page: this.page },
        headers: { Authorization: localStorage.getItem("token") },
      })
        .then((res) => {
          if (res.data.type == "ok") {
            this.log_list = this.log_list.concat(res.data.message.data);
            if (res.data.message.data.length == 0) {
              this.more = this.$t("nodata");
            }
            if (res.data.message.data.length < this.limit) {
              this.more = this.$t("nomore");
            } else if (res.data.message.data.length == this.limit) {
              this.more = this.$t("more");
            }
          } else {
            layer.msg(res.data.message);
          }
        })
        .catch((error) => {
          // console.log(error)
        });
    },

    getInfo (data) {
      switch (this.lang) {
        case 'en':
          return data.type_info_e
        case 'jp':
          return data.type_info_j
        case 'kr':
          break;
        case 'zh':
          return data.info
        case 'hk':
          return data.type_info_m
        default:
          return 'check customer service for details'
      }
    },

    getMore() {
      this.more = this.$t("loading");
      this.page += 1;
      this.init();
    },
  },
};
</script>
<style scoped>
.wrap {
  overflow: auto;
}
.li_wrap {
  max-height: 600px;
  overflow-y: auto;
}
.log_ul li {
  padding: 15px 0;
}
.log_ul > li:first-child {
  border-bottom: 1px solid #303b4b;
}
.log_ul > li:first-child:hover {
  background: #181b2a;
}
.log_ul li:hover {
  background: #61688a;
}
.more {
  color: #999;
  font-size: 12px;
  margin-top: 10px;
  cursor: pointer;
}
::-webkit-scrollbar {
  background-color: #181b2a;
}
</style>

// WEBPACK FOOTER // // src/view/transfer_log.vue
