<template>
  <div :class="skins=='nights'?'flex between tops balck':'flex between tops'">
    <div class="widths">
      <div class="flex top-header">
        <div
          v-for="item in list"
          :key="item.id"
          v-show="item.is_display == 1 && item.open_microtrade == 1"
          :class="[{'active':symbol==item.currency_name+'/'+item.legal_name}]"
          @click="tabs(item.legal_id,item.currency_id)"
        >
          {{item.currency_name}}
          
        </div>
        
      </div>
      <ul class="flex between top-center"  v-for="item in list"
          :key="item.id" v-if="symbol==item.currency_name+'/'+item.legal_name">
            <li>
              <p>{{item.now_price || '0.00' | numFilters(4)}}</p>
              <p>{{$t('second.newprice')}}</p>
            </li>
            <li>
              <p :class="item.change <0?'redColor':'greenColor'">{{item.change|| '0.00'}}%</p>
              <p>{{$t('second.zhangfu')}}</p>
            </li>
            <li>
              <p>≈{{item.now_price * item.rmb_relation || '0.00' | numFilters(2)}}CNY</p>
              <p>{{$t('second.conversion')}}</p>
            </li>
            <li>
              <p>{{item.volume || '0.00' |numFilters(0)}}</p>
              <p>{{$t('second.hourday')}}</p>
            </li>
          </ul>
    </div>
  </div>
</template>

<script>
import Kline from "./kline.vue";
export default {
  name: "tv",
  components: { Kline },
  props: {
    quotationList: {
      type: Array,
      required: false
    },
    symbol: {
      type: String,
      required: true
    },
    types: {
      type: String,
      required: true
    },
    filters:{
      numFilters:function(value){
        if (!value) return ''
        value = value.toString()
        return value.slice(0)+' '
      }
    },
  },
 filters:{
			numFilters:function(value){
				if (!value) return ''
				value = value.toString()
				return value.slice(0)+' '
		    }
		  },
  data() {
    return {
      list: [],
      secondsType: "",
      skins: localStorage.getItem("skin") || "days",
    };
  },
  watch: {
    quotationList: {
      immediate: true, // 这句重要
      handler(val) {
        this.list = val;
      },
      deep: true
    }
  },
  computed: {
    switchStatus: function() {
      return this.list; // 直接监听props里的status状态
    }
  },
  created() {},
  mounted() {
    // this.list = this.quotationList;
    this.secondsType = this.types;
  },

  destroyed() {},
  beforeDestroy() {},

  methods: {
    tabs(legalId, currencyId) {
      var that = this;
      if (that.secondsType == "seconds") {
        that.$router.push({
          name: "secondContract",
          query: { legalId: legalId, currencyId: currencyId }
        });
      } else {
        that.$router.push({
          name: "heyue",
          query: { legalId: legalId, currencyId: currencyId }
        });
      }
      
      return false;
    }
  }
};
</script>
<style scoped>
	.flex {
		display: flex;
		-webkit-display: flex;
		-moz-display: flex;
		-ms-display: flex;
		-o-display: flex;
	}
.tops {
  width: 100%;
  margin-top: 10px;
}
.top-header{
  width: 100%;
  /*border-bottom: 1px solid #e6ecf2;*/
  background-color: #181b2a;
  color: #fff;
}
.top-header div{
  margin-left: 25px;
  padding: 10px 0;
  cursor: pointer;
}
.top-header .active{
  border-bottom: 2px solid #f0b90b;
}
.widths{
  width: 100%;
}
.top-center{
  padding: 10px 0;
  background-color: #181b2a;
  color: #fff;
  margin-bottom: 10px;
}
.top-center li{
  width: 25%;
  text-align: center;
  /*border-right: 1px solid #e6ecf2;*/
}
.top-center li:last-child{
  border: 0!important;
}
.top-center li p:last-child{
  margin-top: 3px;
}
.balck .top-header{
  background-color: #1e2b34;
  border-bottom: 1px solid #171c2b;
}
.balck .top-center{
  background-color: #1e2b34;
}
.balck .top-center li{
  border-right: 1px solid #171c2b;
}

</style>





