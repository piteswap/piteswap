<template>
  <div class="wrap" style="flex: 1">
    <div class="title fColor1 topshadow" style="width: 1200px; margin:0 auto; line-height: 60px; text-indent: 0; font-size: 18px;">
      <div class="inblock">
        <a class="curPer" onclick="javascript:history.back(-1);"><span>{{ $t('back') }}</span></a>
      </div>
      <div class="inblock fr">
        <!--         <span class="all" @click="links">合约持仓</span>-->
        <span class="all" @click="all">{{ $t('lever.all') }}</span>
        <span class="all" @click="recordList">{{ $t('lever.tdrecord') }}</span>
      </div>
    </div>
    <div class="detail">

    <div class="content">
      <ul class="list_head ft14">
        <li>
          <span>{{ $t('time') }}</span>
          <span>{{ $t('price') }}</span>
          <span>交易量</span>
          <span>{{ $t('do') }}</span>
        </li>
      </ul>
      <ul class="list_content fColor1 ft12">
        <li v-for="(item,index) in list_content" :key="index">
          <span>{{ item.time }}</span>
          <span>{{ item.price | tofixedFour }}</span>
          <span>{{ item.number | tofixed }}</span>
          <span class="red" @click="pingcang(item.id)">平仓</span>
        </li>
      </ul>
      <p class="more" @click="load_more">{{ more }}</p>
    </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      legal_id: "",
      currency_id: "",
      list_content: [],
      page: 1,
      more: "加载更多"
    };
  },
  filters: {
    tofixed: function (val) {
      val = Number(val);
      return val.toFixed(2);
    },
    tofixedFour: function (val) {
      val = Number(val);
      return val.toFixed(4);
    }
  },
  created() {
    this.legal_id = localStorage.getItem("legal_id");
    this.currency_id = localStorage.getItem("currency_id");
    this.init();
  },
  methods: {
    init() {
      this.more = "加载中...";
      this.$http({
        url: "/api/" + "lever/dealall",
        method: "post",
        data: {
          legal_id: this.legal_id,
          currency_id: this.currency_id,
          page: this.page
        },
        headers: {Authorization: localStorage.getItem("token")}
      })
          .then(res => {
            if (res.data.type == "ok") {
              this.more = "加载更多";
              this.list_content = this.list_content.concat(
                  res.data.message.order.data
              );
              if (res.data.message.order.data.length == 0) {
                this.more = "没有更多了...";
              }
            } else {
              layer.msg(res.data.message);
            }
          })
          .catch(error => {
            console.log(error);
          });
    },
    pingcang(id) {
      let that = this;
      layer.confirm("确定平仓？", function () {
        that.$http({
          url: "/api/" + "lever/close",
          method: "post",
          data: {
            id: id
          },
          headers: {Authorization: localStorage.getItem("token")}
        })
            .then(res => {
              if (res.data.type == "ok") {
                layer.msg(res.data.message);
                location.reload();
              } else {
                layer.msg(res.data.message);
              }
            })
            .catch(error => {
              console.log(error);
            });
      });
    },
    load_more() {
      this.page++;
      this.init();
    },

    all() {
      this.$router.push({name: 'allTransaction'})
    },
    // 合约持仓
    links() {
      this.$router.push({name: 'leverTransactions'})
    },
    // 跳转交易记录
    recordList() {
      this.$router.push({name: 'leverList'})
    }
  }
};
</script>
<style lang="scss" scoped>
.wrap {
  min-height: 700px;
  background: #171c2b;
  width: 100%;
  margin: auto;

}
.wrap{
  background: #171c2b;
}
.detail {
  min-height: 500px;
  background: #000000;
  width: 1200px;
  margin: 0px auto;
  padding: 0;
}

ul li {
  padding: 8px 0;
}

ul li span {
  width: 24%;
  display: inline-block;
  text-align: center;
}

.list_head {
  color: #637085;
  border-bottom: 1px solid #2e333c;
}

.red {
  color: #cc4951;
  cursor: pointer;
}

.more {
  text-align: center;
  color: #999;
  font-size: 14px;
  margin-top: 10px;
  cursor: pointer;
}
.all {
  font-size: 14px;
  cursor: pointer;
  color: #00a4d8;
  margin-left: 10px;
}
</style>
