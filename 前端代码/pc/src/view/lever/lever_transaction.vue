<template>
  <div class="wrap">
    <div class="detail">
      <div class="title fColor1 topshadow">
        <div class="inblock">
          <a class="curPer" onclick="javascript:history.back(-1);"><span>{{ $t('back') }}</span></a>
        </div>
        <div class="inblock fr">
          <!--         <span class="all" @click="links">合约持仓</span>-->
          <span class="all" @click="all">{{ $t('lever.all') }}</span>
          <span class="all" @click="recordList">{{ $t('lever.tdrecord') }}</span>
        </div>
      </div>
      <div class="content">
        <ul class="list-title fColor2 ft12 clear">
          <li class="fl w12">{{ $t('time') }}</li>
          <li class="fl w12">{{ $t('price') }}</li>
          <li class="fl w8">{{ $t('home.volume') }}</li>
        </ul>
        <div class="containers scroll" v-if="deList.length>0">
          <ul v-for="(itm,index) in deList" :key="index" class="list-item fColor1 ft12">
            <li class="clear">
              <span class="fl w12">{{ itm.time }}</span>
              <span class="fl w12">{{ itm.price | tofixedFour }}</span>
              <span class="fl w8">{{ itm.number | tofixed }}</span>
            </li>
          </ul>
        </div>
        <div class="no_data tc" v-if="deList.length<=0">
          <img src="../../assets/images/nodata.png" alt="">
          <p class="fColor2 ft18">{{ $t('nodata') }}</p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "leverTransaction",
  data() {
    return {
      address: '',
      isChoosed: 2,
      new: false,
      wayList: [this.$t('center.inbuy'), this.$t('center.outsell'), this.$t('center.all')],
      deList: [],
      legal_id: '',
      currency_id: ''
    }
  },
  filters: {
    numFilters: function (value) {
      if (!value) return ''
      value = value.toString()
      return value.slice(0) + ' '
    }
    ,
    tofixed: function (val) {
      val = Number(val);
      return val.toFixed(2);
    },
    tofixedFour: function (val) {
      val = Number(val);
      return val.toFixed(4);
    },
  },
  created() {
    this.address = localStorage.getItem('address') || '';
    this.legal_id = localStorage.getItem('legal_id');
    this.currency_id = localStorage.getItem('currency_id');
    var that = this;
    that.complete(this.legal_id, this.currency_id);
    eventBus.$on('to_leverExchange', function (data) {
      if (data) {
        that.complete(localStorage.getItem('legal_id'), localStorage.getItem('currency_id'));
      }
    })
  },
  methods: {
    wayChoosed(index) {
      this.isChoosed = index;
    },
    //我的交易记录
    complete(legals_id, currencys_id) {
      this.$http({
        url: '/api/' + 'lever/deal',
        method: 'post',
        data: {
          legal_id: legals_id,
          currency_id: currencys_id
        },
        headers: {'Authorization': localStorage.getItem('token')},
      }).then(res => {
        // layer.close(i);
        if (res.data.type == "ok") {
          this.deList = res.data.message.my_transaction;
          //    this.connect();
        } else {
          // layer.msg(res.data.message)
        }
      }).catch(error => {
        // console.log(error)
      })
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

  },
  mounted() {
    var that = this;

    eventBus.$on('buyTrade', function (data) {
      // that.connect();
    });

  }


}
</script>
<style lang="scss" scoped>
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

.red {
  color: #cc4951;
  cursor: pointer;
}

.title {
  height: 60px;
  line-height: 60px;
  padding: 0;
  font-size: 18px;
  background-color: #181b2a;
}

.tab_title {
  display: inline-block;
  line-height: 46px;
  height: 46px;
}

.tab_title span {
  cursor: pointer;
}

.tab_title span:not(:last-child) {
  margin-right: 40px;
}

.content {
  //padding: 0 40px 0 30px;
  height: 330px;
}

.list-title {
  line-height: 40px;
  border-bottom: 1px solid #303b4b;
  height: 40px;
}

.list-title li {
  width: 33.3%;
  text-align: center;
}

.no_data {
  padding: 50px 0;
}

.containers {
  height: 260px;
  overflow: auto;
  float: left;
  width: 100%;
}

.list-item li {
  line-height: 45px;
  display: flex;
}

.list-item li span {
  display: block;
  float: left;
  width: 33.3%;
  text-align: center;
}

.list-item li:hover {
  cursor: pointer;
  background-color: #171c2b
}

.list-item li span.green {
  color: #55a067
}

.all {
  font-size: 14px;
  cursor: pointer;
  color: #00a4d8;
  margin-left: 10px;
}
</style>
