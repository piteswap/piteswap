<template>
  <div class="subscription_root">
    <span class="header"> {{ $t('currency.subscription') }} </span>

    <div class="line"></div>

    <section class="contents">
      <div class="item" v-for="(item, index) in list" :key="index">
        <div class="title">
          <span class="name">{{ item.new_currency_name }}</span>
          <!-- <span class="status">申购中</span> -->
          <div class="tips">
            <img src="@/assets/images/wujiaoxing.png" alt="" />
            {{ $t('currency.currency_launched') }}
          </div>
        </div>

        <div class="info">
          {{ Number(item.num).toFixed(2) }} {{ item.new_currency_name }}
          {{ $t('currency.currency') }}
          <p>/</p>
          <span
            >{{ (Number(item.num) * Number(item.change_rate)).toFixed(2) }}
            {{ item.new_currency_name }} {{ $t('currency.currency') }}</span
          >
        </div>

        <div class="schedule">
          <div class="left">
            <span class="qixian">
              {{ $t('currency.lockup_period') }}: {{ item.day }}
              {{ $t('dep.day') }}
            </span>

            <div class="bar_info">
              <div class="bar_box">
                <div
                  :style="
                    `width: ` +
                    (
                      ((Number(item.num) - Number(item.last_num || 0)) /
                        Number(item.num)) *
                      100
                    ).toFixed(2) +
                    `%;`
                  "
                ></div>
              </div>
              <span
                >{{
                  (
                    ((Number(item.num) - Number(item.last_num || 0)) /
                      Number(item.num)) *
                    100
                  ).toFixed(2)
                }}%</span
              >
            </div>
          </div>
          <div class="right">
            <div
              class="btn"
              :class="{ disabled: Number(item.num) < 0 }"
              @click="onConfirm(item)"
            >
              {{ $t('currency.immediate_subscription') }}
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
<script>
export default {
  name: 'Subscription',
  data() {
    return {
      list: [],
    }
  },

  mounted() {
    this.init()
  },

  methods: {
    init() {
      const loading = this.$loading({
        lock: true,
        text: 'Loading',
        spinner: 'el-icon-loading',
      })
      this.$http({
        url: '/api/lh/send/config',
        method: 'get',
      }).then((res) => {
        const {
          data: { message },
        } = res
        this.list = message || []
        loading.close()
      })
    },

    onConfirm(data) {
      if (Number(data.num) < 0) return
      this.$router.push({
        path: '/subscription-edit',
        query: {
          id: data.id,
        },
      })
    },
  },
}
</script>
<style lang="scss" scoped>
.subscription_root {
  width: 100%;
  min-height: 769px;
  background-color: rgba(27, 44, 66, 1);
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 24px;
  box-sizing: border-box;

  .header {
    font-size: 19px;
    font-family: Source Han Sans CN;
    font-weight: 500;
    color: #ffffff;
  }

  .line {
    width: 1200px;
    height: 1px;
    background: #ffffff;
    border-radius: 1px;
    margin-top: 23px;
  }

  .contents {
    width: 1200px;
    display: flex;
    flex-direction: column;
    align-items: center;

    .item {
      width: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-top: 30px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.2);
      padding-bottom: 37px;

      .title {
        width: 100%;
        display: flex;
        align-items: center;
        font-size: 16px;
        font-family: Source Han Sans CN;
        font-weight: 500;
        color: #ffffff;

        .status {
          background: #2ba693;
          border-radius: 2px;
          padding: 4px 8px;
          margin-left: 16px;
        }

        .tips {
          margin-left: 50px;
          display: flex;
          align-items: center;
          font-size: 14px;
          font-family: Source Han Sans CN;
          font-weight: 400;
          color: #ffffff;

          img {
            width: 16px;
            height: 16px;
            margin-right: 9px;
          }
        }
      }

      .info {
        margin-top: 28px;
        width: 100%;
        display: flex;
        align-items: center;
        font-size: 16px;
        font-family: Source Han Sans CN;
        font-weight: 400;
        color: #ffffff;

        p {
          margin: 0 8px;
        }

        span {
          // margin-left: 14px;
        }
      }

      .schedule {
        width: 100%;
        margin-top: 3px;
        display: flex;

        .left {
          flex: 1 0;
          display: flex;
          flex-direction: column;

          .qixian {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            font-size: 16px;
            font-family: Source Han Sans CN;
            font-weight: 400;
            color: #ffffff;
            padding: 0 60px;
          }

          .bar_info {
            margin-top: 12px;
            width: 100%;
            display: flex;
            align-items: center;

            .bar_box {
              position: relative;
              width: 100%;
              height: 20px;
              background: rgba(0, 0, 0, 0.1);
              border-radius: 10px;
              overflow: hidden;

              div {
                top: 0;
                left: 0;
                height: 100%;
                position: absolute;
                background-color: rgba(43, 166, 147, 1);
                border-radius: 10px;
              }
            }

            span {
              width: 70px;
              margin-left: 24px;
              font-size: 16px;
              font-family: Source Han Sans CN;
              font-weight: 400;
              color: #ffffff;
            }
          }
        }

        .right {
          margin-left: 101px;
          display: flex;
          align-items: flex-end;
          justify-content: flex-end;

          .btn {
            padding: 10px 60px;
            background-color: #2ba693;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            font-family: Source Han Sans CN;
            font-weight: 500;
            color: #ffffff;
            cursor: pointer;
          }

          .disabled {
            background-color: rgba(13, 22, 33, 1);
          }
        }
      }
    }
  }
}
</style>
