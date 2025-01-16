<template>
  <div class="subscriptionEdit_root">
    <span class="header">
      {{ currentData.new_currency_name }} {{ $t('currency.subscription') }}
    </span>

    <div class="line"></div>

    <section class="contents">
      <div class="item">
        <div class="title">
          <span class="name"
            >{{ currentData.new_currency_name }}
            {{ $t('currency.new_currencies') }}</span
          >
          <!-- <span class="status">申购中</span> -->
          <div class="tips">
            <img src="@/assets/images/wujiaoxing.png" alt="" />
            {{ $t('currency.currency_launched') }}
          </div>
        </div>

        <div class="info">
          {{ Number(currentData.num).toFixed(2) }}
          {{ currentData.new_currency_name }} {{ $t('currency.currency') }}
          <p>/</p>
          <span
            >{{
              (
                Number(currentData.num) * Number(currentData.change_rate)
              ).toFixed(2)
            }}
            {{ currentData.new_currency_name }}
            {{ $t('currency.currency') }}</span
          >
        </div>

        <div class="schedule">
          <div class="left">
            <span class="qixian">
              {{ $t('currency.lockup_period') }}: {{ currentData.day }}
              {{ $t('dep.day') }}
            </span>

            <div class="bar_info">
              <div class="bar_box">
                <div
                  :style="
                    `width: ` +
                    (
                      ((Number(currentData.num) -
                        Number(currentData.last_num || 0)) /
                        Number(currentData.num)) *
                      100
                    ).toFixed(2) +
                    `%;`
                  "
                ></div>
              </div>
              <span
                >{{
                  (
                    ((Number(currentData.num) -
                      Number(currentData.last_num || 0)) /
                      Number(currentData.num)) *
                    100
                  ).toFixed(2)
                }}%</span
              >
            </div>
          </div>
          <div class="right">
            <!-- <div class="btn">立即申购</div> -->
          </div>
        </div>
      </div>
    </section>

    <section class="info_box">
      <div class="item">
        <span>{{ $t('currency.issue_price') }}</span>
        <span
          >1{{ currentData.new_currency_name }} =
          {{ currentData.change_rate }}USTD</span
        >
      </div>
      <div class="item">
        <span>{{ $t('currency.subscription_currencies') }}</span>
        <span>USTD</span>
      </div>
      <div class="item">
        <span>{{ $t('currency.subscription_starttime') }}</span>
        <span>{{ currentData.created_at }}</span>
      </div>
      <div class="item">
        <span>{{ $t('currency.lockup_period') }}</span>
        <span>{{ currentData.day }} {{ $t('dep.day') }}</span>
      </div>
      <div class="item">
        <span>{{ $t('currency.estimated_launchtime') }}</span>
        <span>{{ currentData.online_time }}</span>
      </div>
      <div class="item">
        <span>{{ $t('currency.expected_gross_return') }}</span>
        <span>{{ currentData.predict_rate }}</span>
      </div>
    </section>

    <section class="introduce">
      <span class="title">{{ $t('currency.introduction') }}</span>
      <textarea :value="currentData.introduction" disabled />
    </section>

    <section class="type">
      <span>{{ $t('currency.payment_currency') }}</span>
      <el-select v-model="value">
        <el-option
          v-for="item in options"
          :key="item.value"
          :label="item.label"
          :value="item.value"
        >
        </el-option>
      </el-select>
    </section>

    <section class="input">
      <el-input
        v-model="price"
        :placeholder="$t('currency.please_enter_the_amount')"
        style="width: 340px"
      ></el-input>
    </section>

    <div class="confirm" @click="onConfirm">{{ $t('currency.confirm') }}</div>

    <el-dialog :visible.sync="dialogVisible" width="423px">
      <div class="dialog_tips">
        {{ $t('currency.subscription_successful') }}
      </div>
      <div class="dialog_btn">
        <span @click.stop="onSuccessClick">{{ $t('currency.confirm') }}</span>
      </div>
    </el-dialog>
  </div>
</template>
<script>
export default {
  name: 'SubscriptionEdit',
  data() {
    return {
      options: [
        {
          value: 'USTD',
          label: 'USTD',
        },
      ],
      value: 'USTD',
      dialogVisible: false,
      currentData: {},
      price: '',
    }
  },

  computed: {
    id() {
      return this.$route.query.id
    },
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
        url: '/api/lh/send/product_info?id=' + this.id,
        method: 'get',
      }).then((res) => {
        const {
          data: { message },
        } = res
        this.currentData = message
        loading.close()
      })
    },

    onConfirm() {
      if (!this.price || isNaN(this.price))
        return this.$message.warning(
          this.$t('currency.please_enter_the_amount')
        )

      this.$http({
        url: '/api/lh/send/order',
        method: 'post',
        headers: { Authorization: localStorage.getItem('token') },
        data: {
          amount: this.price,
          config_id: this.currentData.id,
        },
      }).then((res) => {
        console.log('res :>> ', res)
        const {
          data: { type, message },
        } = res
        if (type === 'ok') {
          this.dialogVisible = true
        } else {
          this.$message.error(message)
        }
      })
    },

    onSuccessClick() {
      this.$router.go(-1)
    },
  },
}
</script>
<style lang="scss">
.el-dialog {
  background: rgba(27, 44, 66, 1);

  .dialog_tips {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    font-family: Source Han Sans CN;
    font-weight: 400;
    color: #2ba693;
  }

  .dialog_btn {
    width: 100%;
    margin-top: 40px;
    display: flex;
    justify-content: center;

    span {
      width: 216px;
      height: 40px;
      background: #2ba693;
      border-radius: 4px;
      font-size: 16px;
      font-family: Source Han Sans CN;
      font-weight: 500;
      color: #ffffff;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
    }
  }
}
</style>
<style lang="scss" scoped>
.subscriptionEdit_root {
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
            padding: 0 260px;
          }

          .bar_info {
            margin-top: 12px;
            width: 100%;
            display: flex;
            align-items: center;

            .bar_box {
              position: relative;
              width: 845px;
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
            width: 195px;
            height: 40px;
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

  .info_box {
    width: 1200px;
    display: flex;
    flex-wrap: wrap;

    .item {
      width: 33.33333%;
      display: flex;
      flex-direction: column;
      margin-top: 28px;
      font-size: 16px;
      font-family: Source Han Sans CN;
      font-weight: 400;
      color: #ffffff;

      &:nth-child(n + 3) {
        margin-top: 48px;
      }

      span {
        &:last-child {
          margin-top: 16px;
        }
      }
    }
  }

  .introduce {
    width: 1200px;
    display: flex;
    flex-direction: column;
    margin-top: 52px;

    .title {
      font-size: 16px;
      font-family: Source Han Sans CN;
      font-weight: 400;
      color: #ffffff;
    }

    textarea {
      width: 100%;
      height: 124px;
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 1px;
      margin-top: 24px;
      background: none;
      padding: 16px;
      box-sizing: border-box;
      font-size: 16px;
      font-family: Source Han Sans CN;
      font-weight: 400;
      color: #ffffff;
    }
  }

  .type {
    width: 1200px;
    margin: 24px 0;
    display: flex;
    align-items: center;
    font-size: 16px;
    font-family: Source Han Sans CN;
    font-weight: 400;
    color: #ffffff;

    span {
      margin-right: 42px;
    }
  }

  .input {
    width: 1200px;
    display: flex;
    align-items: center;
  }

  .confirm {
    width: 299px;
    height: 40px;
    background: #2ba693;
    border-radius: 4px;
    font-size: 18px;
    font-family: Source Han Sans CN;
    font-weight: 500;
    color: #ffffff;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 37px;
    cursor: pointer;
  }
}
</style>
