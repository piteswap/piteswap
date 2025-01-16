<template>
  <div id="transfer-legal" v-if="coins.length">
    <div class="title">{{ $t('account.transfer') }}</div>


    <div class="choose-wrap">
      <div class="flex" style="align-items: center">
        <label class="mr20">{{ $t('account.choosecoin') }}</label>
        <el-select v-model="coinIndex" @change="changeCoin" placeholder="请选择">
          <el-option
              v-for="(coin,index) in coins"
              :key="index"
              :label="coin.currency_name"
              :value="index">
          </el-option>
        </el-select>
      </div>

      <div class="flex" style="align-items: center">
        <label class="mr20">{{ $t('from') }}</label>
        <el-select v-model="value1" @change="selectOne" :placeholder="$t('transfer.select')">
          <el-option
              v-for="(item,index) in accountList"
              :key="index"
           
              :label="item.texts"
              :value="item.type">
          </el-option>
        </el-select>
      </div>

      <div class="flex" style="align-items: center">
        <label class="mr20">{{ $t('to') }}</label>
        <el-select v-model="value2" @change="selectOne" :placeholder="$t('transfer.select')">
          <el-option
              v-for="(item,index) in accountList"
              :key="index"
              :disabled="item.type==value1"
              :label="item.texts"
              :value="item.type">
          </el-option>
        </el-select>
      </div>
      <div class="flex" style="align-items: center">
        <label class="mr20">{{ $t('account.huanum') }}</label>
        <el-input type="number" max="99999999" maxlength="10" :placeholder="$t('account.huanum')" v-model="number">
          <template slot="suffix"><span style="line-height: 40px; margin: 10px;">{{
              coins[coinIndex].currency_name
            }}</span></template>
          <template slot="append"><span class="curPer" @click="number = transferBalance">{{ $t('lever.all') }}</span>
          </template>
        </el-input>
      </div>
      
      <div class="flex ft14">{{ $t('center.available') }}：<span class="green">{{ transferBalance }}</span></div>
    </div>
    <button type='button' class="transfer curPer" @click="transfer">{{ $t('account.transfer') }}</button>
  </div>
</template>

<script>
let [loadedCoin, loadCurrency] = [false, false];
export default {
  data() {
    return {
      token: "",
      selectedCoin: {name: "", id: ""},
      coins: [],
      coinIndex: 0,
      types: [this.$t('usercenter.lever'), this.$t('usercenter.change')],
      number: '',
      selectedFrom: '合约账户',
      selectedTo: '资产账户',
      currencyList: [],
      accountList: [],
      value1: "change",
      value2: "lever",
      transferBalance: 0
    };
  },
  created() {
    this.getCoins();
    this.initCurrencyList();
  },
  watch: {
    value1: {
      handler(newVal) {
        if (loadedCoin)
          this.computeBalance();
      },
      deep: true,
      immediate: false
    },
    value2: {
      handler(newVal) {
        // this.computeBalance();
      },
      deep: true,
      immediate: false
    },
    coinIndex: {
      handler(newVal) {
        if (loadCurrency)
          this.computeBalance();
      },
      deep: true,
      immediate: false
    },

  },
  methods: {
    getCoins() {
      let that = this;
      this.token = window.localStorage.getItem("token") || "";
      this.$http({
        url: "/api/wallet/list",
        method: "post",
        headers: {Authorization: this.token}
      }).then(res => {
        if (res.data.type == "ok") {
          let [lever_balance, micro_balance, change_balance, lever_wallet, micro_wallet, legal_wallet, change_wallet] = [
            {},
            {},
            {},
            res.data.message.lever_wallet,
            res.data.message.micro_wallet,
            res.data.message.legal_wallet,
            res.data.message.change_wallet
          ];

          lever_wallet.balance.forEach(x => {
            lever_balance[x.currency_name] = x.lever_balance;
          });

          micro_wallet.balance.forEach(x => {
            micro_balance[x.currency_name] = x.micro_balance;
          });

          change_wallet.balance.forEach(x => {
            change_balance[x.currency_name] = x.change_balance;
          });


          let coins = legal_wallet.balance;
          for (let i = coins.length - 1; i >= 0; i--) {
            let item = coins[i];
            coins[i].lever_balance = lever_balance[item.currency_name];
            coins[i].micro_balance = micro_balance[item.currency_name];
            coins[i].change_balance = change_balance[item.currency_name];
          }
          that.coins = coins;
          that.coinIndex = 0;
          setTimeout(() => {

            that.value1 = "change";
            that.value2 = "lever";
          }, 100);


          loadedCoin = true;

        }
      });
    },
    
    transfer() {
      let that = this;
      if (this.number == '') {
        layer.msg(this.$t('account.huanum'));
        return;
      } else {
        let data = {};
        data.number = this.number;

        let baseCoin = this.coins[this.coinIndex];

        data.from_field = this.value1;
        data.to_field = this.value2;


        data.currency_id = this.coins[this.coinIndex].currency;

        const loading = this.$loading({
          lock: true,
          text: 'Loading',
          spinner: 'el-icon-loading',
          background: 'rgba(0, 0, 0, 0.7)'
        });

        this.$http({
          url: '/api/wallet/change',
          method: 'post',
          data: data,
          headers: {'Authorization': this.token}
        }).then(res => {

          loading.close();
          if (res.data.type == 'ok') {
            this.$message({
              message: that.$t('transfer.ok'),
              type: 'success'
            });
            setTimeout(() => {
              location.reload();
            }, 1000);
          } else {
            if(res.data.type == 'error_xm'){
              this.$message.error(that.$t('transfer.error_xm'));
            }else{
              this.$message.error(that.$t('transfer.error'));
            }
          }
        }).catch(err => {
          console.log(err,'err')
          loading.close();
          this.$message.error('Error');
        })
      }
    },

    initCurrencyList() {
      let token = localStorage.getItem('token')
      let that = this;
      this.$http({
        url: "/api/" + "currency/user_currency_list",
        method: "get",
        data: {},
        headers: {Authorization: token}
      }).then(res => {
        if (res.data.type == "ok") {
          var datas = res.data.message;
          if (datas.length > 0) {
            var arr = [];
            for (var i = 0; i < datas.length; i++) {
              var nums =
                  datas[i].is_legal - 0 +
                  (datas[i].is_lever - 0) +
                  (datas[i].is_match - 0) +
                  (datas[i].is_micro - 0);
              if (nums > 1) {
                arr.push(datas[i]);
              }
            }

            console.log(arr,'arr');

            var arr2 = [];
            // if (arr[0].is_legal == 1) {
            //   var obj = {
            //     type: "legal",
            //     texts: that.$t("account.laccount")
            //   };
            //   arr2.push(obj);
            // }

            if (arr[0].is_micro == 1) {
              var obj = {
                type: "micro",
                texts: that.$t("account.letransaction")
              };
              arr2.push(obj);
            }
            if (arr[0].is_lever == 1) {
              var obj = {
                type: "lever",
                texts: that.$t("account.taccount")
              };
              arr2.push(obj);
            }

            if (arr[0].is_match == 1) {
              var obj = {
                type: "change",
                texts: that.$t("usercenter.change")
              };
              arr2.push(obj);
            }
          
            that.accountList = arr2;
            that.currencyList = arr;

            console.log('账户列表', arr2, arr)

            that.value1 = arr2[0].texts;
            that.value2 = arr2[1].texts;
            if (arr2[0].type == "lever") {
              that.transferBalance = arr[0].wallet.lever_balance;
            } else if (arr2[0].type == "micro") {
              that.transferBalance = arr[0].wallet.micro_balance;
            } else if (arr2[0].type == "change") {
              that.transferBalance = arr[0].wallet.change_balance;
            } else if (arr2[0].type == "legal") {
              that.transferBalance = arr[0].wallet.legal_balance;
            }

            loadCurrency = true;
          }
        } else {
          return;
        }
      }).catch(error => {
        console.log(error);
      });
    },
    
    selectOne(command) {
    },
    selectTwo(command) {
    },
    computeBalance() {
      if (loadedCoin && loadCurrency) {
        let baseCoin = this.coins[this.coinIndex];
        if (!baseCoin) {
          return;
        }
        this.number = '';
        switch (this.value1) {
          case 'legal':
            //法币
            this.transferBalance = baseCoin.legal_balance;
            break;
          case 'micro':
            //秒合约
            this.transferBalance = baseCoin.micro_balance;
            break;
          case 'lever':
            //合约
            this.transferBalance = baseCoin.lever_balance;
            break;
          case 'change':
            this.transferBalance = baseCoin.change_balance;
            break;
        }
      }
    },
    changeCoin(e) {
      this.coinIndex = e;
    },

  }
};
</script>

<style lang="scss">
.el-select-dropdown__item.selected {
  color: #00a4d8 !important;
  font-weight: normal !important;
}

.el-loading-spinner .el-loading-text {
  color: #00a4d8 !important;
}

.el-loading-spinner i{
  color: #00a4d8 !important;

}
</style>
<style lang='scss' scoped>

.choose-wrap {
  padding-top: 50px;
  width: 70%;
  margin: 0 auto;

  /deep/ {
    .el-input__inner {
      background: #171c2b !important;
    }


    .el-input-group__append {
      background: #171c2b;
      border-color: #4d5373;
    }
  }

  > div {

    margin-bottom: 40px;

    *:first-child {
      width: 30%;
    }

    *:last-child {
      flex: 1;
    }
  }
}

.el-dropdown {
  cursor: pointer;
}

#transfer-legal {
  padding: 0 30px;
  color: #c7cce6;

  > .title {
    padding: 20px 0;
    font-size: 24px;
    color: #61688a;
  }

  > .coins {
    display: flex;
    justify-content: center;

    li {
      margin-right: 20px;
      padding: 5px 20px;
      color: #fff;
      background: #234165;
    }

    .active {
      background: #00a4d8;
    }
  }

  > .types {
    margin: 30px 0;
    //   width: 400px;
    height: 80px;
    display: flex;
    justify-content: space-between;
    line-height: 40px;

    .types-r {
      display: flex;
    }

    img {
      margin: 25px;
      width: 30px;
      height: 30px;
    }
  }

  .number {
    margin: 30px 0 0;
    //   width: 430px;
    line-height: 40px;

    input {
      border: none;
      color: #f2f5ff;
      background: none;
      line-height: 40px;
      width: 800px;
      border-bottom: 2px solid #ccc;

    }

    .all {
      margin-left: 10px;
      padding-left: 10px;
      border-left: 1px solid #ccc;
    }
  }

  .transfer {
    display: block;
    margin: 0 auto;
    line-height: 40px;
    width: 50%;
    background: #00a4d8;
    color: #fff;
    border: none;
    border-radius: 5px;
  }
}
</style>
