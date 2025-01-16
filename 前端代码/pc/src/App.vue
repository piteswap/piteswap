<template>
  <div
    id="app"
    :class="night_mode == null || parseInt(night_mode) == 0 ? 'night' : 'day'"
  >
    <router-view />
  </div>
</template>

<style lang="scss">
.flex {
  display: flex;
  flex-direction: row;
}

.column {
  flex-direction: column;
}

.flex-all {
  flex: 1;
}
</style>

<script>
export default {
  name: 'App',
  data() {
    return {
      night_mode: '1',
    }
  },
  created() {
    document.title = this.$t('siteName')
    this.night_mode = localStorage.getItem('night_mode')
    this.$http({
      url: '/api/set/lang',
      method: 'post',
      data: { lang: localStorage.getItem('lang') || 'th' },
    }).then((res) => {
      const { data: { message } } = res
      localStorage.setItem('language-mark', message)
    })

    this.$http({
      url: '/api/' + 'currency/quotation_new',
      method: 'get',
      data: {},
      headers: { Authorization: localStorage.getItem('token') },
    })
      .then((res) => {
        if (res.data.type == 'ok') {
          this.tabList = res.data.message
          var msg = res.data.message
          var arr_quota = []
          for (var i = 0; i < msg.length; i++) {
            arr_quota[i] = msg[i].quotation
          }
          if (!window.localStorage.getItem('downUp')) {
            window.localStorage.setItem('downUp', arr_quota[0][0].change)
          }
          if (!window.localStorage.getItem('legal_id_cur')) {
            window.localStorage.setItem(
              'legal_id_cur',
              arr_quota[0][0].currency_id
            )
          }
          if (
            !localStorage.getItem('legal_id') &&
            !localStorage.getItem('currency_id') &&
            !localStorage.getItem('legal_name') &&
            !localStorage.getItem('currency_name')
          ) {
            window.localStorage.setItem(
              'legal_id',
              msg[0].quotation[0].legal_id
            )
            window.localStorage.setItem(
              'currency_id',
              msg[0].quotation[0].currency_id
            )
            window.localStorage.setItem(
              'legal_name',
              msg[0].quotation[0].legal_name
            )
            window.localStorage.setItem(
              'currency_name',
              msg[0].quotation[0].currency_name
            )
            var symbol =
              msg[0].quotation[0].currency_name +
              '/' +
              msg[0].quotation[0].legal_name
            window.localStorage.setItem(
              'shareNum',
              msg[0].quotation[0].lever_share_num
            )
            // var priceScale=Math.pow(10,5);
            var priceScale = 100000
            window.localStorage.setItem('priceScale', priceScale)
            window.localStorage.setItem('symbol', symbol)
          }
        }
      })
      .catch((error) => {
        console.log(error)
      })

      // this.$alert('这是一段内容', '标题名称', {
      //   confirmButtonText: this.$t('lay.sure'),
      // })

    this.$http({
      url: '/api/lh/send/get_recommend',
      method: 'get',
      data: {},
    }).then((res) => {

      const { data: { message } } = res

      console.log('message :>> ', message);
      

      if (message.recommend_title && message.recommend_content) {
        this.$alert(message.recommend_title, message.recommend_content, {
          confirmButtonText: this.$t('lay.sure'),
        })
      }
    })
  },
}
</script>

<style lang='scss'>
#app {
  .el-slider__runway {
    background-color: #2e3244;
  }
}

.el-message-box {
  background-color: #2e3244 !important;
  border: none !important;

  

  .el-message-box__title {
    color: #fff !important;
  }
}
</style>

