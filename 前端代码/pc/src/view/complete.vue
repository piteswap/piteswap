<template>
  <div class="detail" style="background: #1b2c42;">
    <div class="title fColor1 topshadow">
      <div class="title-head">
        <span>{{ $t('alltread') }}</span>
      </div>
    </div>
    <div class="content">
      <ul class="list-title fColor2 ft12 clear">
        <li class="fl w12">{{ $t('time') }}</li>
        <!-- <li class="fl w12">交易对</li> -->
        <li class="fl w12">{{ $t('price') }}</li>
        <li class="fl w12">{{ $t('treadnum') }}</li>
      </ul>
      <div class="containers scroll" v-if="deList.length>0">
        <ul v-for="item in deList" class="list-item fColor1 ft12">
          <li class="clear" :class="item.direction">
            <span class="fl w12">{{ item.time }}</span>
            <!-- <span class="fl w12">{{itm.currency_name}} / {{itm.legal_name}}</span> -->
            <span class="fl w14">{{ item.price|tofixedFour }}</span>
            <span class="fl">{{ item.amount|tofixedN(6) }}</span>
          </li>
        </ul>
      </div>
      <!-- <div class="no_data tc" v-if="deList.length<=0">
          <img src="../assets/images/nodata.png" alt="">
          <p class="fColor2 ft18">{{$t('nodata')}}</p>
      </div> -->
    </div>
  </div>
</template>
<script>
export default {
  name: "detail",
  data() {
    return {
      address: "",
      isChoosed: 2,
      new: false,
      wayList: [this.$t('center.inbuy'), this.$t('center.outsell'), this.$t('center.all')],
      deList: [],
      legal_id: "",
      currency_id: "",
      leftName: "",
      rightName: ""
    };
  },
  created() {
    this.address = localStorage.getItem("address") || "";
  },
  filters: {
    cutDate(v) {
      // return v.substr(-8)
      return v;
    },
    tofixed: function (val) {
      val = Number(val);
      return val.toFixed(2);
    },
    tofixedFour: function (val) {
      val = Number(val);
      return val.toFixed(4);
    },
    tofixedN: function (val, n) {
      val = Number(val);
      return val.toFixed(n);
    },
  },

  methods: {
    wayChoosed(index) {
      this.isChoosed = index;
    },
    //全站交易记录
    complete(legals_id, currencys_id) {
      let that=this;
      let url = `/api/currency/new_tradehistory?legal_id=${legals_id}&currency_id=${currencys_id}`;
      this.$http.get(url).then(res => {
        // console.log(res,'res');
        if (res.data.type == "ok") {
          that.deList = res.data.message;
          that.connect();
        } else {
          // layer.msg(res.data.message)
        }
      })
          .catch(error => {
            // console.log(error)
          });
    },
    timestampToTime(timestamp) {
        var time=''
        if(timestamp.toString().length>11){
          time=timestamp
        }else{
          time=timestamp*1000
        }
        var date = new Date(time); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = date.getDate() > 10 ? date.getDate() + ' ' : ('0' + date.getDate()) + ' ';
        var h = date.getHours() > 10 ? date.getHours() + ':' : ('0' + date.getHours()) + ':';
        var m = date.getMinutes() > 10 ? date.getMinutes() + ':' : ('0' + date.getMinutes()) + ':';
        var s = date.getSeconds() > 10 ? date.getSeconds() : ('0' + date.getSeconds());
        return h + m + s;
    },
    connect() {
      var that = this;
      that.$socket.emit("login", localStorage.getItem("user_id"));
      that.sockets.subscribe("match_trade", function (msg) {
        // console.log(msg,'msg')
        if (msg.type == "match_trade") {

          if (msg.legal_id == that.legal_id && msg.currency_id == that.currency_id) {

            let stayLength = 20;
            msg.data.forEach(x => {
              x.time = that.timestampToTime(x.ts)
              that.deList.unshift(x);
              if (that.deList.length > stayLength) {
                that.deList.splice(stayLength, that.deList.length - stayLength);
              }
            })

          }


        }
      });
    }
  },
  mounted() {
    var that = this;
    this.legal_id = localStorage.getItem("legal_id");
    this.currency_id = localStorage.getItem("currency_id");

    this.complete(this.legal_id, this.currency_id);

    // this.connect();
  }
};
</script>
<style lang="scss" scoped>
.title-head {
  height: 40px;
  line-height: 40px;
  border-bottom: 1px solid #303b4b;
  padding: 0 20px;
  color: #00a4d8;
  display: block;
  margin: 0 00px;
}

.detail {
  width: 250px;
  height: 100%;
}

.content {
  //height: 100%
}

.title {
  font-size: 14px;
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

.containers {
  height: calc(100% - 60px);
  overflow-y: auto;
  overflow-x: hidden;
}

.list-title {
  line-height: 25px;
  /* border-bottom: 1px solid #303b4b; */
  /* height: 35px; */
}

.list-title li {
  width: 33.33%;
  text-align: center;
}

.no_data {
  padding: 50px 0;
}

.containers {
  overflow: auto;
}
.list-title{

  padding:0 20px;
  li:last-child{
    text-align: right;
  }
}
.list-item {
  li {
    padding:0 20px;
    line-height: 2.3;
    display: flex;
    cursor: pointer;

    span {
      display: inline-block;
      float: left;
      width: 33.3%;
      text-align: center;
    }

    span:last-child{
      text-align: right;
    }

    span.green {
      color: #55a067;
    }
  }

  li:hover {
    background-color: #2b3648;
  }

  li.buy {
    color: #35b65a;
  }

  li.sell {
    color: #ff494a;
  }
}

</style>



