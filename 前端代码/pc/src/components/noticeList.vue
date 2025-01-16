<template>
  <div class="notice">
    <indexHeader></indexHeader>
    <div class="account-wrap">
      <div class="account">
        <div>
          <div class="back-nav fColor1 ft20 clear"
               style="line-height: 60px; font-size: 18px; padding: 0; height: auto;"> {{ $t('header.help') }}
          </div>

        </div>
        <div class="account-content">
          <div class="tc hide" style="padding-top: 150px;">
            <img src="../assets/images/nodata.png" alt="">
            <p class="fColor2 ft18">{{ $t('nodata') }}</p>
          </div>
          <div>
            <ul class="noticeList" style="border-radius: 10px;">
              <li class="clear curPer" v-for="item in newList" :key="item.id">
                <div class="" @click="goDetail(item.id)">
                  <div class="">{{ item.title }}</div>
                  <span class="fr">{{ item.update_time }}</span>

                </div>
              </li>
            </ul>
          </div>
          <div class="tc" style="padding:15px">
            <!-- <div class="fColor1 ft14 mt10" @click="getMore">{{more}}</div> -->
            <!-- <div>
                <img src="@/assets/images/loading.gif" alt=""  class="lodw20">
                <p class="ft12 baseColor">{{$t('loading')}}...</p>
            </div> -->
          </div>
        </div>
      </div>
    </div>
    <indexFooter></indexFooter>
  </div>
</template>
<script>
import indexHeader from "@/view/indexHeader";
import indexFooter from "@/view/miniFooter";

export default {
  name: "noticeList",
  components: {indexHeader, indexFooter},
  data() {
    return {
      more: "{{$t('more')}}...",
      newList: []
    };
  },
  created() {
  },
  methods: {
    getNotice() {
      this.$http({
        url: '/api/' + 'news/list',
        method: 'post',
        data: {c_id: '3'},
      }).then(res => {
        this.newList = res.data.message.list

      })
    },
    goBefore() {
      this.$router.back(-1);
    },
    getMore() {
    },
    goDetail(id) {
      var id = id;
      this.$router.push({
        name: "noticeDetail",
        query: {id: id}
      });
    }
  },
  mounted() {
    var that = this;
    that.getNotice();
  }
};
</script>
<style lang="scss" scoped>
.notice {
  .account-wrap {
    background: #171c2b;

    .account {
      margin: 0px auto;
      overflow: hidden;
      padding-top: 3px;
      clear: both;

      .back-nav {
        height: 40px;
        font-size: 16px;
        line-height: 40px;
        background: #171c2b;
      }

      .nav-after {
        display: block;
        height: 10px;
        background-color: #262a42;
      }

      .account-content {
        width: 100%;
        min-height: 1060px;
        background-color: #171c2b;
        border-radius: 10px;

        ul {
          padding: 0 20px;
          font-size: 14px;

          li {
            border-bottom: 1px dashed #303b4b;
            height: 72px;
            padding: 10px 0 7px;
            color: #cdd6e4;
            font-size: 12px;

            > div {
              > div {
                height: 52px;
                line-height: 52px;
              }

              span {
                color: #61688a;
              }
            }
          }
        }
      }
    }
  }
}
</style>
