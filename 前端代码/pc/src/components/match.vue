<template>
    <div class="game-wrapper" v-bind:style="{backgroundImage: 'url(' + info.thumbnail + ')'}">
      <div class="game-banner">
        <div class="game-banner-main">
          <div class="game-banner-time">{{info.match_time}}</div>
        </div>
      </div>
      <div class="game-box game-box1">
        <div class="game-box-header">
          <div class="game-box-title">{{info.desc_1}}</div>
        </div>
        <div class="game-box1-content">
          <!-- <div class="game-side-box game-side-box-prev">
              <div class="swiper-button-prev" tabindex="0" role="button"></div>
          </div>
          <div class="game-side-box game-side-box-next">
              <div class="swiper-button-next" tabindex="1" role="button"></div>
          </div> -->
          <div class="game-box1-list">
           <swiper :options="swiperOption" class="swiper-container swiper-container-horizontal swiper-container-ios" id="game-team">
              <!-- slides -->
              <swiper-slide class="swiper-item" v-for="(row,index) in allTeam" :key="index">
                <div class="game-box1-item-box">
                  <div class="game-box1-item" v-for="team in row">
                    <div class="game-box1-item-info">
                      <div class="game-box1-item-title">{{team.name}}</div>
                      <div class="text-ellipsis">
                        <span class="game-box1-item-num">{{team.member_number}}</span>
                        <span>人</span>
                      </div>
                    </div>
                  </div>
                </div>
              </swiper-slide>
              <!-- Optional controls ,显示小点-->
              <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
          </swiper>           

          </div>
        </div>
      </div>
      <div class="game-box game-box2">
        <div class="game-box-header">
          <div class="game-box-title">
            {{info.desc_2}}  
          </div>
        </div>
        <div class="game-box2-content">
          <div class="game-box2-title">
            <span class="game-box2-title-cn">{{info.desc_3}}</span>
          </div>
          <div class="game-box2-list">
              <div v-for="(team,index) in topTeam" class="game-box2-list-item game-box2-list-item1">
                <span class="game-list-rank">{{index + 1}}</span>
                <span class="game-list-name">
                  <div class="game-list-name-wrapper">
                    <div class="game-list-name-cn text-ellipsis">{{team.name}}</div>
                  </div>
                </span>
                <span class="game-list-num">{{team.balance}}</span>
                <span class="game-list-coin">USDT</span>
                <span class="game-list-income">{{info.desc_4}}</span>
              </div>
          </div>
        </div>
      </div>
      <div class="game-box game-box3">
        <div class="game-box-header">
          <div class="game-box-title-box">
            <div class="game-box-title" v-html="info.desc_5">

            </div>
           
          </div>
        </div>
        <div class="game-box3-content">
          <div class="game-box3-info fl" v-html="info.desc_7">    
          </div>         
          <div class="game-box3-time fl" v-html="info.desc_6">          
           </div>         
        </div>
      </div>
      <div class="game-box game-box4" v-html="info.desc_8">
      </div>
    </div>
</template>

<script>
import "swiper/css/swiper.css"
import { Swiper, SwiperSlide } from 'vue-awesome-swiper'
export default {
  components: {
    Swiper,
    SwiperSlide
  },
  computed: {
    allTeam(){
      let result = [];
      for(var i=0;i<this.teams.length;i+=2){
        result.push(this.teams.slice(i,i+2));
      }
      return result;
    },
    topTeam(){
      let teams = this.teams;
      teams = teams.sort(function(a, b){
        return b.balance - a.balance;
      });
      return teams.splice(0, 10);
    },
    swiper() {
      return this.$refs.mySwiper.swiper
    }
  },
  data() {
    return {
      teams: [],
      info: {},
      swiperOption: {
        autoplay: 3000,
        slidesPerView: 8,
        spaceBetween : 0,
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      }
    };
  },
  created() {
    this.getInfo();
    this.getTeams();
  },
  methods: {
    getInfo(){
      let that = this;
      this.$http({
          url: "/api/" + "match/info",
        method: "post"
      }).then(res => {
        this.info = res.data
      })
      .catch(error => {
          
      });
    },
    getTeams(){
      let that = this;
      this.$http({
          url: "/api/" + "match/teams",
        method: "post"
      }).then(res => {
        this.teams = res.data
      })
      .catch(error => {
          
      });
    }
  }
}
</script>

<style lang='scss'>
.game-wrapper{
  background-color:black;
  background: url('')no-repeat 50% 0;
  text-align: center;
  font-size: 24px;
  color: #AEC6FA
}
.game-banner{
  height: 650px;
  color: #CADFFC;
  margin: 0 auto;
  text-align: right;
  box-sizing: border-box;
}
.game-banner-main{
 text-align: center;
 padding-top: 450px;
}
.game-banner-time{
  font-size: 24px;
}
.game-box1{
  width: 1598px;
  height: 716px;
  box-sizing: border-box;
  margin: 0 auto;
  text-align: center;
  padding-top: 130px;
}
.game-box-header-img{
  width: 728px;
  height: 54px;
  margin: 0 auto;
}
.game-box-title{
  line-height: 1;
  padding-top: 17px;
  font-size: 14px;
}
.game-box1-content{
  background: url(../../static/imgs/game/game-box1-bg1.png)no-repeat center;
  background-size: 100% auto; 
  font-size: 0;
  padding: 44px 20px 32px;
  margin-top: 24px;
  text-align: left;
  position: relative;
}
.game-side-box{
  position: absolute;
  top: 50%;
  transform: translateY(-50%)
}
.game-side-box-prev{
  left: -82px
}
.game-side-box-next{
  right: -82px
}
.game-side-box-next .swiper-button-next, 
.game-side-box-prev .swiper-button-prev{
  width: 71px;
  height: 124px;
  background-size: 71px 124px;
  outline: none;
}
.game-side-box-next .swiper-button-next, .swiper-container-rtl .swiper-button-prev{
  background-image: url(../../static/imgs//game/next1.png);
}
.game-side-box-prev .swiper-button-prev, .swiper-container-rtl .swiper-button-prev{
  background-image: url(../../static/imgs//game/prev1.png);
}
.game-box1-item-box{
  display: inline-block;
}
.game-box1-item{
  width: 170px;
  height: 171px;
  box-sizing: border-box;
  text-align: center;
  margin-bottom: 10px;
}
.game-box1-item-info{
  font-size: 20px;
  color: #fff;
}
.game-box1-item-info{
  width: 170px;
  height: 171px;
  background: url(../../static/imgs/game/game-box1-item-bg1.png)no-repeat center;
  background-size: cover;
}
.game-box1-item-title{
  color: #fff;
  font-size: 18px;
  padding-top: 10px;
  font-weight: bold;
}
.color-active{
  color: #EBD90A
}
.game-box1-item-num{
  font-size: 56px;
  font-weight: bold;
  padding-top: 12px;
  display: inline-block;
}
.game-box2{
  padding-top: 140px;
  height: 1284px;
  box-sizing: border-box;
}
.game-box2-content{
  width: 1161px;
  background: url(../../static/imgs/game/game-box2-bg1.png)no-repeat center;
  background-size: 100% 100%;
  margin: 40px auto 0;
  height: 1078px;
  box-sizing: border-box;
}
.game-box2-title{
  position: relative;
  color: #fff;
  text-align: center;
  margin-left: 54px;
  padding-top: 60px;
  padding-bottom: 36px;
  font-size: 0;
}
.game-box2-title-cn{
  font-size: 40px;
  font-weight: bold;
  line-height: 1;
}
.game-box2-title-en{
  font-size: 28px;
}
.game-box2-list{
  box-sizing: border-box;
  padding: 0 41px 0 24px;
  color: #fff;
}
.game-box2-list-header{
  font-size: 0;
  text-align: left;
  margin-bottom: 12px;
}
.game-box2-list-header-item{
  display: inline-block;
  width: 300px;
  height: 62px;
  line-height: 62px;
  background: #141314;
  border-right: 8px solid #43A8F4;
  border-left: 8px solid #43A8F4;
  border-radius: 2px;
  font-size: 36px;
  vertical-align: middle;
  margin-right: 10px;
  text-align: center;
}
.game-box2-list-header-en{
  font-size: 24px;
}
.game-box2-list-item{
  height: 90px;
  line-height: 90px;
  padding-left: 28px;
  font-size: 0;
  text-align: left;
  font-weight: 500;
  text-shadow:2px 2px 2px rgba(0, 0, 0, 0.89);
  font-family:SourceHanSansCN-Medium,'寰蒋闆呴粦',"Droid Sans Fallback", Helvetica, Arial, sans-serif;
}
.game-box2-list-item:nth-child(odd){
  background: #9b9faa
}
.game-box2-list-item span{
  display: inline-block;
  vertical-align: middle;
}
.game-list-rank{
  width: 100px;
  box-sizing: border-box;
  font-size: 60px;
}
.game-list-name{
  box-sizing: border-box;
  width: 306px;
  height: 60px;
  line-height: 60px;
  padding: 0 44px;
  border-left: 2px solid #bfbfbf;
  border-right: 2px solid #bfbfbf;
}
.game-list-name-wrapper{
  display: inline-block;
}
.game-list-name-cn{
  font-size: 40px;
}
.game-list-name-en{
  font-size: 16px;
}
.game-list-income{
  height: 58px;
  line-height: 58px;
  padding: 0 46px;
  border-radius: 2px;
  font-size: 24px;
}
.game-box2-list-item:nth-child(odd) .game-list-income{
  background: #5c5c98;
}
.game-box2-list-item:nth-child(even) .game-list-income{
  background: #9bb6e8;
}
.game-list-num{
  width: 282px;
  font-size: 44px;
  padding-left: 80px;
  box-sizing: border-box;
  text-align: left;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.game-list-coin{
  width: 138px;
  height: 100%;
  font-size: 44px;
  font-weight: bold;
  text-align: left;
  text-shadow: none;
}
.game-box2-list-item1{
  position: relative;
}
.game-box3{
  margin-top: 0px;
  height: 1094px;
  box-sizing: border-box;
}
.game-box3 .game-box-header{
  box-sizing: border-box;
  padding: 176px 0 56px;
}
.game-box-title-box{
  display: inline-block;
  text-align: left;
}
.game-box3  .game-box-title{
  line-height: 26px;
  padding-top: 0;
}
.game-box3-content{
  margin: 0 auto;
  padding-top: 130px;
  padding-left: 90px;
}
.game-box3-info{
  margin-left: 53px;
  width: 430px;
  color: #fff;
  font-size: 18px;
  line-height: 30px;
  text-align: left;
  position: relative;
  top: 28px;
}
.game-box3-time{
  font-size: 26px;
  color: #fff;
  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.89);
  padding: 160px 56px;
}
.game-box3-time-name{
  color: #808080;
}
.game-box3-info-title{
  margin-bottom: 16px;
  line-height: 20px;
}
.game-box3-title-name{
  font-size: 20px;
  line-height: 1;
  padding-left: 10px;
  border-left: 5px solid #fff1b8;
  color: #ffeb9b;
}
.game-box3-title-tips{
  font-size: 12px;
  color: #fff;
  line-height: 1;
}
.game-box3-info-order{
  color: #fff1b8;
}
.game-box3-info-active{
  color: #fff1b8
}
.game-box3-info-section2{
  margin-top: 52px;
}
.game-box3-info-section2:after{
  content: '';
  width: 370px;
  height: 1px;
  background: #312a39;
  display: block;
}
.game-box3-line{
  margin-top: 22px;
  margin-bottom: 20px;
  width: 447px;
  height: 1px;
  background: #312a39;
  border: none;
}
.game-box3-title-num{
  color: #ED615F;
}
.game-box4{
  padding-top: 210px;
}
.game-box4-content{
  margin-top: 32px;
  padding-bottom: 64px;
}
.game-rule-wrapper{
  display: inline-block;
  text-align: left;
}
.game-rule-item{
  margin-bottom: 10px;
  font-size: 18px;
  color: #fff;
}
.order-tips{
  height: 32px;
  line-height: 32px;
  padding: 0 7px;
  color: #000115;
  background: #5DADD5;
  margin-right: 20px;
  margin-top: 4px;
  font-size: 30px;
  font-weight: bold;
}
.game-rule-item-text{
  max-width: 688px;
  text-align: left;
  /* font-weight: bold; */
  line-height: 40px;
}
@media (max-width: 600px){
  .game-wrapper{
    background: url(../../static/imgs/game/game-bg2.png)no-repeat;
    background-size: 100% auto;
    font-size: 0.24rem;
  }
  .game-banner{
    height: 2.6rem;
  }
  .game-banner-main{
    padding-top: 2.2rem;
  }
  .game-banner-time{
    font-size: 0.2rem;
  }
  /*****/
  .game-box1{
    width: 100%;
    height: auto;
    padding-top: 0.9rem;
    box-sizing: border-box;
  }
  .game-box-header-img{
    width: 100%;
    height: auto;
  }
  .game-box-title{
    line-height: 0.32rem;
    font-size: 0.2rem;
    padding-top: 0.04rem;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
  }
  .game-box1-content{
    margin-top: 0;
    padding: 0.2rem 0rem 0.1rem;
    background-size: 100% 100%;
  }
  .game-side-box{
    top: 1.8rem;
    transform: none;
    display: none;
  }
  .game-side-box-prev{
    left: -0.16rem;
  }
  .game-side-box-next{
    right: -0.16rem;
  }
  .game-side-box-next .swiper-button-next, .game-side-box-prev .swiper-button-prev{
    width: 0.32rem;
    height: 0.32rem;
    background-size: 0.32rem 0.32rem;
  }
  .game-box1-item{
    width: 0.8rem;
    height: 0.8rem;
    padding: 0;
    margin-bottom: 0.1rem;
  }
  .game-box1-item-info{
    font-size: 0.24rem;
  }
  .game-box1-item-info{
    width: 0.8rem;
    height: 0.8rem;
  }
  .game-box1-item-title{
    font-size: 0.2rem;
    padding-top: 0;
    line-height: 1;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    padding-bottom: 0.05rem;
  }
  .text-ellipsis{
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
  }
  .game-box1-item-num{
    font-size: 0.24rem;
    padding-top: 0;
  }
  /**********/
  .game-box2{
    margin-top: 0;
    height: auto;
    padding: 0.3rem 0.24rem 0;
  }
  .game-box2-content{
    width: 100%;
    height: auto;
    margin-top: 0.1rem;
    padding-bottom: 0;
  }
  .game-box2-title{
    margin-left: 0.24rem;
    padding-top: 0.32rem;
    padding-bottom: 0.2rem;
  }
  .game-box2-title:after{
    width: 0.5rem;
    height: 0.06rem;
    left: 0.04rem;
    bottom: 0.16rem;
  }
  .game-box2-title-cn{
    font-size: 0.28rem;
  }
  .game-box2-title-en{
    font-size: 0.24rem;
  }
  .game-box2-list{
    width: auto;
    margin: 0 0.1rem;
    padding: 0.16rem 0.16rem 0;
  }
  .game-box2-list-header{
    margin-bottom: 0.08rem;
  }
  .game-box2-list-header-item{
    width: 2.2rem;
    height: 0.6rem;
    line-height: 0.6rem;
    font-size: 0.28rem;
    border-width: 0.08rem;
    margin-right: 0.1rem;
  }
  .game-box2-list-header-en{
    font-size: 0.2rem;
  }
  .game-box2-list-item{
    height: 0.75rem;
    line-height: 0.75rem;
    padding-left: 0.2rem;
  }
  .game-box2-list-item1::before{
    width: 0.08rem;
    height: 0.8rem;
  }
  .game-list-rank{
    width: 0.8rem;
    font-size: 0.24rem;
  }
  .game-list-name{
    width: 1.2rem;
    height: 0.6rem;
    line-height: 0.6rem;
    padding: 0 0.1rem
  }
  .game-list-name::before{
    width: 0.08rem;
    height: 0.08rem;
    margin-right: 0.1rem;
    margin-top: 0.08rem;
  }
  .game-list-name-cn{
    font-size: 0.24rem;
    padding-bottom: 0.04rem;
  }
  .game-list-name-en{
    font-size: 0.24rem;
  }
  .game-list-income{
    height: 0.6rem;
    line-height: 0.6rem;
    padding: 0 0.28rem;
    font-size: 0.24rem;
  }
  .game-list-num{
    width: 1.4rem;
    font-size: 0.24rem;
    padding-left: 0.1rem;
  }
  .game-list-coin{
    width: 0.89rem;
    font-size: 0.24rem;
  }
  .game-box2-list-item1::after{
    width: 100%;
    height: 0.02rem;
  }
  /***/
  .game-box3{
    margin-top: 0;
    height: auto;
    padding: 0 0.24rem;
  }
  .game-box3 .game-box-header{
    height: auto;
    padding: 0.8rem 0 0;
  }
  .game-box3 .game-box-header-img{
    margin-bottom: 0;
  }
  .game-box3 .game-box-title{
    line-height: 0.32rem;
  }
  .game-box3-content{
    width: auto;
    padding-top: 0;
    padding-left: 0;
  }
  .game-box3-info{
    margin-left: 0;
    width: 100%;
    font-size: 0.24rem;
    line-height: 0.4rem;
    top: 0.2rem;
  }
  .game-box3-info-title{
    margin-bottom: 0.16rem;
    line-height: 0.28rem;
  }
  .game-box3-title-name{
    font-size: 0.28rem;
    padding-left: 0.1rem;
    border-width: 0.06rem;
  }
  .game-box3-title-tips{
    font-size: 0.2rem;
  }
  .game-box3-info-section2{
    margin-top: 0.24rem;
  }
  .game-box3-info-section2:after{
    display: none;
  }
  .game-box3-line{
    margin-top: 0.2rem;
    margin-bottom: 0.2rem;
    width: 100%;
  }
  .game-box4{
    margin-top: 0.4rem;
    height: auto;
    padding: 0 0.24rem;
  }
  .game-box4-content{
    margin-top: 0.2rem;
  }
  .game-rule-item{
    font-size: 0.24rem;
  }
  .order-tips{
    height: 0.32rem;
    line-height: 0.32rem;
    padding: 0 0.08rem;
    margin-right: 0.12rem;
    margin-top: 0;
    font-size: 0.24rem;
  }
  .game-rule-item-text{
    max-width: 6.4rem;
    line-height: 0.32rem;
  }
}
</style>



// WEBPACK FOOTER //
// src/components/match.vue
