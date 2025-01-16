<template>
  <div class="mySubscription_root">
    <section class="header">
      <div class="title">{{ $t('currency.are_purchasing') }}<span>{{ total }}</span></div>
      <div class="info">
        <span class="info_title">{{ $t('currency.accumulated_return') }}<span>{{ totalInterest }} USDT</span></span>
        <!-- <div class="content">
          <div class="item">
            <span>0</span>
            <span>USDT</span>
          </div>
          <div class="item">
            <span>0</span>
            <span>BTC</span>
          </div>
          <div class="item">
            <span>0</span>
            <span>ETH</span>
          </div>
        </div> -->
      </div>
    </section>

    <section class="table">
      <span class="title"> {{ $t('currency.mysubscription') }} </span>
      <table v-if="type === 1">
        <thead>
          <tr>
            <td>{{ $t('currency.subscription_amount') }}</td>
            <td>{{ $t('currency.lockup_period') }}</td>
            <td>{{ $t('currency.expected_gross_return') }}</td>
            <td>{{ $t('currency.subscription_time') }}</td>
            <td>{{ $t('currency.estimated_launchtime') }}</td>
            <td>{{ $t('status') }}</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in list" :key="index">
            <td>{{ item.amount }}{{ item.currency_name }}</td>
            <td>{{ item.day }} {{ $t('dep.day') }}</td>
            <td>{{ item.interest_rate }}%</td>
            <td>{{ item.created_at }}</td>
            <td>{{ item.online_time }}</td>
            <td v-if="item.exam_status === 1" style="color: rgba(255, 228, 0, 1)">{{ $t('currency.passed') }}</td>
            <td v-if="item.exam_status === 3" style="color: rgba(255, 24, 0, 1)">{{ $t('currency.under_review') }}</td>
            <!-- exam_status 1审核通过 3待审核 -->
          </tr>
        </tbody>
      </table>

      <table v-if="type === 2">
        <thead>
          <tr>
            <td>{{ $t('currency.subscription_amount') }}</td>
            <td>{{ $t('currency.lockup_period') }}</td>
            <td>{{ $t('currency.expected_gross_return') }}</td>
            <td>{{ $t('currency.subscription_time') }}</td>
            <td>{{ $t('currency.estimated_launchtime') }}</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in list" :key="index">
            <td>{{ item.amount }}{{ item.currency_name }}</td>
            <td>{{ item.day }} {{ $t('dep.day') }}</td>
            <td>{{ item.interest_rate }}%</td>
            <td>{{ item.created_at }}</td>
            <td>{{ item.online_time }}</td>
          </tr>
        </tbody>
      </table>

      <table v-if="type === 3">
        <thead>
          <tr>
            <td>{{ $t('currency.subscription_amount') }}</td>
            <td>{{ $t('currency.the_total_return_rate') }}</td>
            <td>{{ $t('currency.completion_time') }}</td>
            <td>{{ $t('currency.total_return') }}</td>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in list" :key="index">
            <td>{{ item.amount }}{{ item.currency_name }}</td>
            <td>{{ item.interest_rate }}%</td>
            <td>{{ item.uodated_at }}</td>
            <td>{{ item.original_interest || 0 }}</td>
          </tr>
        </tbody>
      </table>
    </section>
  </div>
</template>
<script>
export default {
  name: "MySubscription",
  data() {
    return {
      total: 0,
      totalInterest: 0,
      list: []
    };
  },

  computed: {
    type() {
      return this.$route.query.type || 1; // 根据路由判断是哪个页面
    },
  },

  watch: {
    type: {
      handler () {
        this.init();
      },
      immediate: true
    }
  },

  methods: {
    init() {
      this.$http({
        url: "/api/lh/send/order_list?status=" + this.type,
        method: "get",
        headers: { Authorization: localStorage.getItem("token") },
      }).then((res) => {
        const {
          data: { type, message: { order_list, total, total_interest } },
        } = res;
        console.log("order_list :>> ", order_list);
        this.total = total || 0
        this.totalInterest = total_interest || 0
        this.list = order_list
      });
    },
  },
};
</script>
<style lang="scss" scoped>
.mySubscription_root {
  width: 100%;
  min-height: 1000px;
  border-radius: 10px;
  background-color: rgba(27, 44, 66, 1);
  display: flex;
  flex-direction: column;

  .header {
    width: 100%;
    // height: 243px;
    background: #171c2b;
    border-radius: 12px;
    display: flex;
    flex-direction: column;
    padding: 33px 36px;
    box-sizing: border-box;

    .title {
      display: flex;
      align-items: center;
      font-size: 20px;
      font-family: Source Han Sans CN;
      font-weight: 500;
      color: #ffffff;

      span {
        margin-left: 30px;
      }
    }

    .info {
      width: 100%;
      display: flex;
      flex-direction: column;
      margin-top: 33px;

      .info_title {
        font-size: 20px;
        font-family: Source Han Sans CN;
        font-weight: 500;
        color: #ffffff;

        span {
          margin-left: 30px;
        }
      }

      .content {
        width: 100%;
        flex: 1 0;
        display: flex;
        margin-top: 16px;

        .item {
          flex: 1 0;
          height: 100%;
          display: flex;
          flex-direction: column;
          align-items: center;
          font-size: 20px;
          font-family: Source Han Sans CN;
          font-weight: 500;
          color: #ffffff;

          span {
            &:last-child {
              margin-top: 19px;
            }
          }
        }
      }
    }
  }

  .table {
    width: 100%;
    flex: 1 0;
    background: #171c2b;
    border-radius: 12px;
    margin-top: 16px;
    display: flex;
    flex-direction: column;
    padding: 33px 36px;
    box-sizing: border-box;

    .title {
      font-size: 20px;
      font-family: Source Han Sans CN;
      font-weight: 500;
      color: #ffffff;
    }

    table {
      margin-top: 30px;
      width: 100%;
      display: flex;
      flex-direction: column;

      thead {
        width: 100%;

        tr {
          width: 100%;
          display: flex;
          align-items: center;

          td {
            flex: 1 0;
            font-size: 16px;
            font-family: Source Han Sans CN;
            font-weight: 400;
            color: #ffffff;
            margin-right: 16px;
          }
        }
      }

      tbody {
        width: 100%;

        tr {
          width: 100%;
          display: flex;
          align-items: center;
          margin-top: 24px;

          td {
            flex: 1 0;
            font-size: 16px;
            font-family: Source Han Sans CN;
            font-weight: 400;
            color: rgba(255, 255, 255, 0.6);
            margin-right: 16px;
          }
        }
      }
    }
  }
}
</style>
