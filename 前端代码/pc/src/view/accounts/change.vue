<template>
  <div class>
    <div class="header fColor1">
      <p class="fl">
        {{ $t("account.totalassets") }}：
        <span class="asset_num">{{ totle | toFixeds }}</span>
        <span class="asset_name"> USDT</span>
      </p>
      <p class="fr right_text">
        <!-- <span class="record" @click="record">财务记录</span> -->
        <span class="address hide" @click="withdraw_address">{{
          $t("account.upaddress")
        }}</span>
      </p>
    </div>

    <div class="content fColor1 ft12">
      <div class="content_top flex alcenter fColor2">
        <p class="flex1 tc">
          {{ $t("market.currency") }}
          <i></i>
        </p>
        <p class="flex1 tc">{{ $t("center.available") }}</p>
        <p class="flex1 tc">{{ $t("account.freezes") }}</p>
        <!-- <p class="flex1 tc">BTC估值<i></i></p> -->
        <!-- <p class="flex1 tc">锁仓</p> -->
        <!-- <p class="flex1 tc">{{ $t('account.conversion') }}(CNY)</p> -->
        <p class="flex1 tc">{{ $t("do") }}</p>
      </div>
      <ul class="content_ul">
        <li
          v-for="(item, index) in asset_list"
          v-if="item.is_match == 1"
          :key="index"
        >
          <div class="content_li flex alcenter between">
            <p class="flex1 tc">{{ item.currency_name }}</p>
            <p class="flex1 tc">
              {{ item.change_balance || "0.00" | toFixeds }}
            </p>
            <p class="flex1 tc">
              {{ item.lock_change_balance || "0.00" | toFixeds }}
            </p>
            <!-- <p class="flex1 tc">{{ item.cny_price * item.change_balance || '0.00' | toFixeds }}</p> -->
            <!-- <p class="flex1 tc">{{item.valuation}}</p> -->
            <!-- <p class="flex1 tc">{{item.lock_position}}</p> -->
            <p class="flex1 tc operation">
              <span
                @click="excharge(index, item.currency)"
                v-if="
                  item.currency_name == 'BTC' ||
                  item.currency_name == 'ETH' ||
                  item.currency_name == 'USDT'
                "
              >
                {{ $t("account.charging") }}
              </span>
              <span
                @click="withdraw(index, item.currency)"
                v-if="item.currency_name == 'USDT'"
                >{{ $t("account.withdraw") }}</span
              >
              <span @click="rec(index, item.currency)">{{
                $t("account.record")
              }}</span>
            </p>
          </div>

          <!--充币区-->
        <div class="hide_div" v-if="index == active">
            <p class="fColor2 ft12">{{ $t("account.cgaddress") }}</p>

            <template v-if="messageArr.length == 0">
              <p style="margin: 10px 0">
                <!-- 地址 -->
                <span
                  class="ft18 fColor1 excharge_address"
                  :class="{ bg: flags }"
                  >{{ excharge_address }}</span
                >
                <!-- 复制 -->
                <span id="copy" @click="copy" class="copy ft14">{{
                  $t("account.copy")
                }}</span>
                <!-- 二维码 -->
                <span class="ewm_wrap" style="margin-left: 50px">
                  <span class="ewm ft14" @click="show_ewm">{{
                    $t("account.code")
                  }}</span>
                  <div
                    class="ewm_img"
                    id="code"
                    :class="{ hide: isHide }"
                  ></div>
                </span>
              </p>
            </template>

            <template v-if="messageArr.length">
                <!-- 地址下拉选项 -->
                <!-- <el-select v-model="excharge_address" placeholder="请选择" style="width: 400px;margin: 10px 0" >
                  <el-option v-for="item in messageArr" :key="item.value" :label="item.value" :value="item.value">
                    <el-tag type="success" size="small">{{ item.label }}</el-tag>
                    <span style="margin-left: 20px">{{ item.value }}</span>
                  </el-option>
                </el-select> -->

                <div class="label-wrap">
                  <div :class="['label-item',current == index && 'currentStyle']" 
                    v-for="(item,index) in messageArr" 
                    :key="index" 
                    @click="excharge_address = messageArr[index].value, current = index , currencyname =item.label "
                  >
                    {{item.label}}
                  </div>
                </div>

                <div style="margin-bottom: 10px" v-if="currencyname !='Bank'">
                  <span style="font-size: 18px">{{excharge_address}}</span>
                  <!-- 复制 -->
                  <span id="copy" @click="copy_second(excharge_address)" class="copy ft14">{{$t("account.copy")}}</span>
                  <!-- 二维码 -->
                  <span class="ewm_wrap" style="margin-left: 50px">
                      <span class="ewm ft14" @click="show_ewm">
                        {{$t("account.code")}}
                      </span>
                      <div class="ewm_img" id="code" :class="{ hide: isHide }" ></div>
                  </span>
				  
                </div>
      
            </template>

            <el-form ref="form" :model="form" label-style="color:#fff;" >
			<!--银行卡信息-->
			<div style="font-size: 14px;margin-top: 20px;" v-if="currencyname=='Bank'">
				<div style="margin-top: 20px;">
					<span>{{$t('c2c.bankName')}} ：</span>
					<span>{{bkname}}</span>
					<span id="copy" @click="copy_second(bkname)" class="copy ft14">{{$t("account.copy")}}</span>
				</div>
				<div style="margin-top: 20px;">
					<span>{{$t('c2c.name')}} ：</span>
					<span>{{cardname}}</span>
					<span id="copy" @click="copy_second(cardname)" class="copy ft14">{{$t("account.copy")}}</span>
				</div>
				<div style="margin: 20px 0 20px 0;">
					<span>{{$t('c2c.payAccount')}} ：</span>
					<span>{{bkcardnumer}}</span>
					<span id="copy" @click="copy_second(bkcardnumer)" class="copy ft14">{{$t("account.copy")}}</span>
				</div>
				
			</div>	
			
			  <el-form-item :label="$t('account.Rechargequantity')">
				<el-input
				  v-model="form.num"
				  :placeholder="$t('account.pquantity')"
				></el-input>
			  </el-form-item>
			  <!-- <el-form-item label="钱包地址">
				<el-input v-model="form.from" placeholder="请输入您转出钱包的地址"></el-input>
			  </el-form-item>  "$t('account.Screenshottransfer')" 
					Screenshottransfer : 'Screenshot of transfer',
			  <el-form-item label="钱包地址">   
				<el-input v-model="form.hash" placeholder="请输入交易哈希值"></el-input>
			  </el-form-item> -->

			  <el-form-item :label="$t('account.Screenshottransfer')" >
				<el-upload ref="uploader" class="upload-demo" :action="uploadUrl" :headers="uploadHeaders" :http-request="uploadFile" :multiple="false" :limit="1" list-type="picture" :file-list="form.pic"
				>
				  <el-button size="mini" type="success">{{ $t("account.upload") }}</el-button>
				  <div slot="tip" class="el-upload__tip">
					{{ $t("account.uploadimg") }}
				  </div>
				</el-upload>
			  </el-form-item>

			  <el-form-item>
				<el-button
				  type="primary"
				  size="medium"
				  @click="submitChargeInfo(item.currency)"
				  >{{ $t("account.Submitn") }}</el-button
				>
			  </el-form-item>
            </el-form>

            <p class="ft12 fColor2 mb15">{{ $t("account.notice") }}</p>
            <ul class="tips_ul ft12 fColor2" style="list-style: disc inside">
              <li class="tips_li" style="list-style: disc inside">
                {{ $t("account.a1") }}{{ item.currency_name
                }}{{ $t("account.a2") }}
              </li>
              <li
                v-if="item.currency_type == 'eth'"
                class="tips_li"
                style="list-style: disc inside"
              >
                {{ $t("account.a4") }}
              </li>
              <li
                v-else-if="item.currency_type == 'btc'"
                class="tips_li"
                style="list-style: disc inside"
              >
                {{ $t("account.a9") }}
              </li>
              <li
                v-else-if="item.currency_type == 'usdt'"
                class="tips_li"
                style="list-style: disc inside"
              >
                {{ $t("account.a4") }}
              </li>
              <li
                v-else-if="item.currency_type == 'omni'"
                class="tips_li"
                style="list-style: disc inside"
              >
                USDT{{ $t("account.a3") }}
              </li>
            </ul>
        </div>

          <!--提币区-->
          <div class="hide_div" v-if="index == active01">
			<!-- 链名切换 -->
			<div class="label-wrap">
			  <div :class="['label-item',current == index && 'currentStyle']" 
			    v-for="(label,index) in tibiList" 
			    :key="index" 
			    @click="getTibiAddress(label,index)"
			  >
			    {{label}}
			  </div>
			</div>
			
			<!--银行卡信息-->
			<!-- <div style="font-size: 14px;margin-top: 20px;" v-if="currencyname=='Bank'">
				<div style="margin-top: 20px;">
					<span>{{$t('c2c.bankName')}} ：</span>
					<span>{{bkname}}</span>
				</div>
				<div style="margin-top: 20px;">
					<span>{{$t('c2c.name')}} ：</span>
					<span>{{real_name}}</span>
				</div>
				<div style="margin: 20px 0 20px 0;">
					<span>{{$t('c2c.payAccount')}} ：</span>
					<span>{{bknumber}}</span>
				</div>
			</div> -->
			
			<!-- 银行卡信息 -->
			<div>
				<div class="hotbg" @click="$router.push('/bankbind')" v-if="currencyname=='Bank'">
					<p class="ng-binding1">{{bkname}}</p>
					<span class="editc" >{{$t('bankbind.examine')}}</span>
					<p class="ng-binding2">{{bknumber}}</p>
				</div>
			</div>
			
			<div v-if="currencyname!='Bank'">
				<p class="fColor2 ft12 mb15">{{ $t("account.chaddress") }}</p>
				<!-- <input
				  :placeholder="tibi_msg"
				  class="address_inp fColor1 mb30"
				  type="text"
				  v-model="address"
				/> -->

				<el-select v-model="address" empty-text="No Data" :placeholder='$t("legaltrade.select")' style="width: 400px;margin-bottom:10px" >
				  <el-option v-for="item in tbAddressList" :key="item.id" :label="item.address" :value="item.address" >
					<el-tag type="success" size="small">{{ item.nettype }}</el-tag>
					<span style="margin-left: 20px">{{ item.address }}</span>
				  </el-option>
				</el-select>
			</div>
            <p class="fColor2 ft12 mb15 flex between alcenter">
              <span>{{ $t("number") }}</span>
              <span>
                {{ $t("center.available") }}：
                <span class="use_num">{{ balance || "0.00" | toFixeds }}</span>
                {{ coinname }}
                <span>
                  <!-- 限额：
                  <span>1500.00</span>-->
                  <!-- <span class="advance">提升额度</span> -->
                </span>
              </span>
            </p>
			
            <label class="num_lab flex between mb30">
              <input
                style="color: white"
                class="fColor1"
                type="text"
                :placeholder="min_number"
                v-model="number"
				@change="expectedFee"
              />
              <span>{{ coinname }}</span>
            </label>
            <p class="fColor2 ft12 mb15">{{ $t("security.jymm") }}</p>
            <input
              :placeholder="$t('security.logjymm')"
              class="address_inp fColor1 mb30"
              type="text"
              v-model="pwd"
            />
            <div class="flex mb50">
              <div class="left_inp_wrap flex1">
                <p class="fColor2 ft12 mb15">
                  <span>{{ $t("rate") }}</span>
                  <span></span>
                </p>
                <label class="range_lab flex alcenter between">
                  <!-- <input class="fColor1" type="text" v-model="rate"> -->
                  <span>{{ ratenum }}</span>
                  <span>{{ coinname }}</span>
                </label>
              </div>
              <!-- <div class="right_inp_wrap flex1">
                <p class="mb15">
                  <span class="fColor2 ft12">{{ $t('account.havenum') }}</span>
                </p>
                <label class="get_lab flex alcenter between">
                  <span>{{ number - number * ratenum / 100 | toFixeds }}</span>
                  <input class="fColor1" disabled v-model="reachnum" type="number">
                  <span>{{ coinname }}</span>
                </label>
              </div> -->
            </div>
            <div class="flex">
              <div class="flex2">
                <p class="ft12 fColor2 mb15">{{ $t("account.notice") }}</p>
                <ul
                  class="tips_ul ft12 fColor2"
                  style="list-style: disc inside"
                >
                  <li class="tips_li" style="list-style: disc inside">
                    {{ $t("account.minnum") }}：{{ min_number_txt
                    }}{{ coinname }}。{{ $t("account.oncemaxnum") }}：{{
                      max_number
                    }}{{ coinname }}。{{ $t("account.daynum") }}{{ day_limit
                    }}{{ coinname }}
                  </li>
                  <li class="tips_li" style="list-style: disc inside">
                    {{ $t("account.call") }}
                  </li>
                </ul>
              </div>
              <div class="flex1 tc">
                <button class="withdraw_btn" @click="mention">
                  {{ $t("account.withdraw") }}
                </button>
              </div>
            </div>
          </div>

          <!--记录区-->
          <div class="hide_div rec-box" v-if="index == active02">
            <div class="rec-con">
              <div class="rec-title">
                <span>{{ $t("number") }}</span>
                <span>{{ $t("account.record") }}</span>
                <span>{{ $t("time") }}</span>
              </div>
              <ul class="rec-list">
                <li v-for="(reItem, reIndex) in recData" :key="reIndex">
                  <span>{{ reItem.value || "0.00" | toFixeds }}</span>
                  <span>{{ getInfo(reItem) }}</span>
                  <span>{{ reItem.created_time }}</span>
                </li>
              </ul>
              <p class="more" @click="moreData()">{{ more }}</p>
            </div>
          </div>
        </li>
      </ul>
      <!-- <div class="tc ft16 fColor1 mt50" v-show="asset_list.length<=0"></div> -->
    </div>
  </div>
</template>
<script>
import indexHeader from "@/view/indexHeader";
import left from "@/view/left";
import "@/lib/clipboard.min.js";
import "@/lib/jquery.qrcode.min.js";
import axios from "axios";
import QRCode  from "qrcodejs2"

export default {
  name: "finance",
  filters: {
    toFixeds: function (value) {
      value = Number(value);
      return value.toFixed(8);
    },
  },
  data() {
    return {
	  bknumber:"",
	  bkname:"",
	  real_name:"",
	  tibiList:['TRC20','OMNI','ERC20','Bank'],
	  tbAddressList:[],
	  tbAddressArr:[],
	  bkname:'',
	  bkcardnumer:'',
	  cardname:'',
	  currencyname:'',
      current: 0,
      totle: "",
      recData: [],
      token: "",
      flags: false,
      flag: false,
      isHide: true,
      active: "a",
      active01: "a",
      tibi_msg: "", //this.$t("account.tibi"),
      active02: "a",
      addr: "",
      url: "",
      excharge_address: "",
      address: "",
      pwd: "",
      number: "",
      rate: "",
      coinname: "",
      balance: "",
      ratenum: "",
      reachnum: "",
      min_number: "",
	  max_number:"",
	  day_limit:"",
      min_number_txt: "",
      currency: "",
      asset_list: [],
      tip_list: [
        this.$t("account.a1") + "USDT" + this.$t("account.a2"),
        "USDT" + this.$t("account.a3"),
      ],
      tip_list01: [
        this.$t("account.a1") + "USDT" + this.$t("account.a2"),
        "USDT" + this.$t("account.a3"),
      ],
      page: 1,
      more: this.$t("more"),
      balanceList: [this.$t("account.laccount"), this.$t("usercenter.lever")],
      transferData: {
        modalShow: false,
        transferName: "",
        transferBalance: "",
        start: "",
        end: "",
      },
      status: "",
      form: {
        from: "",
        num: "",
        pic: [],
        hash: "",
      },
      uploadUrl: "",
      uploadHeaders: {},
      messageArr: [],
      qrcode: null
    };
  },
  components: {
    indexHeader,
    left,
    QRCode
  },
  computed: {
    lang () {
      return localStorage.getItem("lang")
    }
  },
  methods: {
	//公共信息提示弹框
	LayerMsg(msg,btnArray,toUrl){
		let that = this;
		if(btnArray!=null){ //有多个按钮
			
			layer.alert(msg,{
				btn:btnArray,
				title:that.$t('leymsg.title')
			},function(index, layero){
			   layer.close(index);
			   //需要跳转
			   if(toUrl!=null){
				   that.$router.push(toUrl); //跳转到交易密码修改页面
			   }
			 });
		}else{
			layer.alert(msg,{
				btn:[that.$t('leymsg.confirm')],
				title:that.$t('leymsg.title')
			},function(index, layero){
			   layer.close(index);
			 });
			
		}

	},
	//手续费随着数量变化
	expectedFee: function() {
		this.ratenum = (Number(this.rate) * Number(this.number) / 100).toFixed(6)
	},
	//提币链名切换
	getTibiAddress(label,index){
		this.current = index;
		this.currencyname =label;
		let obj = this.tbAddressArr.filter((item)=>{
			return item.nettype == label
		})
		this.tbAddressList = obj;
		
	},
    getInfo (data) {
      switch (this.lang) {
        case 'en':
          return data.type_info_e
        case 'jp':
          return data.type_info_j
        case 'kr':
          break;
        case 'zh':
          return data.info
        case 'hk':
          return data.type_info_m
        default:
          // return 'check customer service for details'
		  return data.type_info_e
      }
    },
    goRecord() {
      this.$router.push({ name: "coinRecord" });
    },

    init() {
      var that = this;
      that.uploadHeaders = { Authorization: localStorage.getItem("token") };
      that.uploadUrl = that.$utils.back_api + "api/upload";
      // console.log('上传地址',that.uploadUrl)
      var clipboard = new Clipboard(".copy");
      clipboard.on("success", function (e) {
		that.LayerMsg(that.$t("lay.copys"),null,null);
      });
      clipboard.on("error", function (e) {
        alert(that.$t("lay.fcopy"));
      });
    },

    //充币
    excharge(index, currency) {
      console.log(index, currency, this.status);
      if (this.status == 1) {
        this.currency = currency;
        if (this.flag) {
          this.flag = false;
          this.active = "a";
          this.active01 = "a";
          this.active02 = "a";
        } else {
          this.flag = true;
          this.active = index;
          this.active01 = "a";
          this.active02 = "a";
        }
        this.messageArr = [];
        this.excharge_address = ''
        this.sendData(currency);
      } else {
		this.LayerMsg(this.$t("notopen"),null,null);
      }
    },

    sendData(currency) {
      var that = this;
      this.$http({
        url: "/api/" + "wallet/get_in_address",
        method: "post",
        data: {"currency":currency,"requestType":"pc"},
        headers: { Authorization: that.token },
      })
        .then((res) => {
          console.log(res,'生成二维码');
          if (res.data.type == "ok") {
            if (currency == 1 || currency == 2 || currency == 3) {
              // that.excharge_address = currency == 1 ? res.data.message.BTC : res.data.message.ETH;
              // this.messageArr = [];
			  this.messageArr = [];
			  for (let key in res.data.message) {
				//银行卡信息
				if(key == 'Bank'){
					that.bkname = res.data.message[key].bkname;
					that.cardname = res.data.message[key].cardname;
					that.bkcardnumer = res.data.message[key].bkcardnumer;
				}
				//链钱包地址
			    if(key !== 'BTC' && key !== 'ETH'){
			      this.messageArr.push({
			        value: res.data.message[key],
			        label: key,
			      });
			    }
			  }
			  this.excharge_address = this.messageArr[0].value;
              
            }
			 // else if (currency == 3) {
    //           this.messageArr = [];
    //           for (let key in res.data.message) {
    //             if(key !== 'BTC' && key !== 'ETH'){
    //               this.messageArr.push({
    //                 value: res.data.message[key],
    //                 label: key,
    //               });
    //             }
    //           }
    //           this.excharge_address = this.messageArr[0].value;
    //         } 
			else {
              that.excharge_address = "Not support yet!";
              $("#code").qrcode({
                width: 130, //宽度
                height: 130, //高度
                text: that.excharge_address,
              });
            }
          } else {
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },

    //提币
    withdraw(index, currency) {
		console.log("tibi:"+index+" "+currency);
      if (this.status == 1) {
        this.currency = currency;
        if (this.flag) {
          this.flag = false;
          this.active = "a";
          this.active01 = "a";
          this.active02 = "a";
        } else {
          this.flag = true;
          this.active01 = index;
          this.active = "a";
          this.active02 = "a";
        }
        this.getNum(currency);
		this.getHasPwd();
		this.getBankInfo();
		this.getWithdrawAddress("TRC20");
      } else {
		this.LayerMsg(this.$t("notopen"),null,null);
      }
    },
    //记录
    rec(index, currency) {
      this.currency = currency;
      this.recData = [];
      if (this.flag) {
        this.flag = false;
        this.active = "a";
        this.active01 = "a";
        this.active02 = "a";
      } else {
        this.flag = true;
        this.active02 = index;
        this.active = "a";
        this.active01 = "a";
        this.$http({
          url: "/api/wallet/legal_log",
          method: "post",
          data: { type: 2, currency: currency, page: 1 },
          headers: { Authorization: this.token },
        }).then((res) => {
          if (res.data.type == "ok") {
            this.recData = res.data.message.list;
          }
        });
      }
    },
    getNum(currency) {
      var that = this;
      this.$http({
        method: "POST",
        url: "/api/" + "wallet/get_info",
        data: {
          currency: currency,
        },
        headers: {
          Authorization: localStorage.getItem("token"),
        },
      }).then((res) => {
        res = res.data;
        that.coinname = res.message.name;
        that.balance = res.message.change_balance;
        that.min_number =that.$t("account.minnum") + parseFloat(res.message.min_number).toFixed(2)
		+ "   " + that.$t("account.oncemaxnum") +parseFloat(res.message.max_number).toFixed(2);
		  
        that.min_number_txt = parseFloat(res.message.min_number).toFixed(8);
        that.minnumber = res.message.min_number;
        that.max_number = res.message.max_number;
        that.ratenum = res.message.rate;
        that.reachnum = 0.0;
        that.rate = res.message.rate;
      });
    },
	getWithdrawAddress(currencyname){
		this.$http({
		  method: "POST",
		  url: "/api/wallet/get_address",
		  data: {
		    currency: this.currency,
		  },
		  headers: {
		    Authorization: localStorage.getItem("token"),
		  },
		}).then((res) => {
			let list = res.data.message;
			this.tbAddressArr = list;
			for(let i in list){
				if(list[i].nettype == currencyname){
					this.tbAddressList[i] = list[i];
				}
			}

		});
	},
	//查询是否设置交易密码
	getHasPwd(){
		let that = this;
		this.$http({
		  method: "POST",
		  url: "/api/user/has_password",
		  data: {
		    currency: this.currency,
		  },
		  headers: {
		    Authorization: localStorage.getItem("token"),
		  },
		}).then((res) => {
			let isok = res.data.message;
			//判断是否设置了交易密码
			if(isok===2){
				this.LayerMsg(this.$t('leymsg.tibits'),[this.$t('leymsg.set')],'/jymm');			
			}
		});
		
	},
	getBankInfo(){
		let that = this;
		this.$http({
		  method: "POST",
		  url: "/api/user/cash_info",
		  data: {
		    currency: this.currency,
		  },
		  headers: {
		    Authorization: localStorage.getItem("token"),
		  },
		}).then((res) => {
			res = res.data.message;

			//判断是否绑定了银行卡号
			if(res.bank_account==null){
				 that.LayerMsg(this.$t('leymsg.bindbankts'),[this.$t('leymsg.set')],'/bankbind');
			}
			this.bknumber = res.bank_account.substr(0,4) + '******' + res.bank_account.substr(res.bank_account.length - 4)
			this.bkname = res.bank_name; //银行名称
			this.real_name = res.real_name;
		});
	},

    // 提币按钮
    mention() {
      var that = this;
      var currency = this.currency;
      var address = that.currencyname !="Bank"?this.address:"--";
      var pwd = this.pwd;
      var number = this.number;
      var rate = this.rate;
      var min_number = this.minnumber;
	  
      if (!address && that.currencyname !="Bank") {
		that.LayerMsg(that.$t("lay.caddress"),null,null);
        return;
      }
      if (!number) {
		that.LayerMsg(this.$t("lay.cnumber"),null,null);
        return;
      }
      if (!pwd) {
		that.LayerMsg(that.$t("security.logjymm"),null,null);
        return;
      }
      if (number - 0 < min_number) {
		that.LayerMsg(that.$t("lay.minnum"),null,null);
      }

      this.$http({
        method: "POST",
        url: "/api/" + "wallet/out",
        data: {
          currency:that.currencyname =="Bank"?9999:currency,
          number,
          address,
          rate,
          pay_password: pwd
        },
        headers: {
          Authorization: localStorage.getItem("token"),
        },
      }).then((res) => {
        res = res.data;

        if (res.type == "ok") {
		  that.LayerMsg(res.message,null,null);
          setTimeout(() => {
            window.location.reload();
          }, 1500);
        } else {
          that.LayerMsg(res.message,null,null);
        }
      });
    },

    exchange() {},

    //复制
    copy() {
      var that = this;
      var clipboard = new Clipboard(".copy", {
        text: function () {
          return that.excharge_address;
        },
      });
      clipboard.on("success", function (e) {
        that.flags = true;
        layer.msg(that.$t("lay.copys"));
      });
      clipboard.on("error", function (e) {
        that.flags = false;
        layer.msg(that.$t("lay.fcopy"));
      });
    },

    copy_second(value){
      var clipboard = new Clipboard(".copy", {
        text: () => {
          return value;
        },
      });
      clipboard.on("success", (e) => {
        layer.msg(this.$t("lay.copys"));
      });
      clipboard.on("error", (e) => {
        layer.msg(this.$t("lay.fcopy"));
      });
    },

    record() {
      this.$router.push({ name: "finanrec" });
    },
    withdraw_address() {
      this.$router.push({ name: "withdraw_address" });
    },
    show_ewm() {
      if (this.isHide) {
        this.isHide = false;
        this.$nextTick(() => {
          // 生成二维码
          document.getElementById('code').innerHTML = ''
          new QRCode('code', {
            width: 130,
            height: 130,        // 高度
            text:  this.excharge_address,   // 二维码内容
          })
        })
      } else {
        this.isHide = true;
      }
    },
    getdata() {
      var that = this;
      this.$http({
        url: "/api/" + "wallet/list",
        method: "post",
        data: {},
        headers: { Authorization: that.token },
      })
        .then((res) => {
          if (res.data.type == "ok") {
            // console.log("法币余额", res.data.message);
            that.asset_list = res.data.message.change_wallet.balance;
            that.totle = res.data.message.change_wallet.usdt_totle;
            that.status = res.data.message.is_open_CTbi;
          } else {
            return;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    // 加载更多
    moreData() {
      let that = this;
      that.page = that.page + 1;
      this.$http({
        url: "/api/wallet/legal_log",
        method: "post",
        data: { type: "2", currency: that.currency, page: that.page },
        headers: { Authorization: this.token },
      }).then((res) => {
        if (res.data.type == "ok") {
          var datas = that.asset_list;
          for (let i in datas) {
            if (that.currency == datas[i].currency) {
              that.active02 = i;
              if (res.data.message.list.length > 0) {
                that.recData = that.recData.concat(res.data.message.list);
              } else {
                that.more = that.$t("nomore");
              }
            }
          }
        }
      });
    },
    // 划转
    transfer(index, currency) {
      let that = this;
      that.transferData.modalShow = true;
    },
    uploadFile(f) {
      let that = this;
      let formData = new FormData();
      formData.append("file", f.file);

      this.$http
        .post("/api/upload", formData, {
          headers: { "Content-Type": "multipart/form-data" },
        })
        .then((res) => {
          let msg = res.data;
          if (msg.type == "ok") {
            that.form.pic = [{ name: " ", url: msg.message }];
          } else {
            layer.msg(msg.message);
          }
        });
    },

    submitChargeInfo(currency) {
      let data = {};
      data.currency = currency;
	  console.log(this.currencyname);
	  if(this.currencyname=='Bank'){
		  data.currency = 9999;
	  }
      // data.acc = this.form.from;
      // data.hash = this.form.hash;
      data.amount = this.form.num;

      console.log(
        data.acc,
        data.hash,
        data.amount,
        data.currency,
        this.form.pic
      );

      // if (!data.acc || !data.hash || !data.amount || !data.currency || this.form.pic.length < 1) {
      //   layer.msg('参数错误');
      //   return;
      // }
      if (!data.amount || !data.currency || this.form.pic.length < 1) {
        layer.msg(this.$t('leymsg.cscw'));
        return;
      }

      data.pic = this.form.pic[0].url;

      let that = this;
      this.$http({
        url: "/api/wallet/charge_req",
        method: "post",
        data: data,
        headers: { Authorization: this.token },
      }).then((res) => {
        if (res.data.type == "ok") {
          layer.msg(this.$t('leymsg.cssbmit'));
          // layer.msg("充值申请已提交");
          that.form.num = "";
          that.form.from = "";
          that.form.hash = "";
          that.form.pic = [];
        } else {
          // layer.msg("充值申请提交失败");
          layer.msg(this.$t('leymsg.cscwsb'));
        }
      });
    },

  },

  created() {
    this.token = localStorage.getItem("token") || "";
  },

  mounted() {
    var that = this;
    that.getdata();
    that.init();
  },
};
</script>
<style lang="scss">
.el-form-item__label {
  color: #637085 !important;
}

.el-input__inner {
  border-color: #4d5373 !important;
  background-color: #171c2b !important;
  color: #cecfd0 !important;
}
</style>

<style lang="scss" scoped>


.label-wrap{
  display: flex;
  margin-top: 10px;
  margin-bottom: 10px;
  .label-item{
    margin-right: 20px;
    border: 1px solid #ccc;
    padding: 4px 12px;
    border-radius: 3px;
    cursor: pointer;
    font-size: 14px;
  }
  .currentStyle{
    border: 1px solid #2ab098;
    color: #2ab098;
  }
}
.header {
  padding: 15px 30px;
  overflow: hidden;
}

.min_lab {
  margin: 0 10px;
}

.min_lab input {
  margin-right: 3px;
}

.inp_lab {
  border: 1px solid #6b80ae;
  border-radius: 2px;
  padding: 3px 5px;
}

.inp_lab input {
  background: none;
  border: none;
  width: 120px;
  color: #fff;
}

.right_text {
  color: #5697f4;
}

.right_text span {
  cursor: pointer;
}

.record {
  margin-right: 10px;
}

.content_ul {
  padding: 0 20px;
}

.content_top {
  padding: 10px 20px;
  // background: #161617c7;
}

.content_li {
  padding: 15px 0;
  border-bottom: 1px solid #1e2c42;
}

.operation,
.copy,
.ewm {
  color: #2ab098;
}

.copy {
  margin: 0 30px;
}

.copy:hover {
  cursor: pointer;
}

.ewm:hover {
  cursor: pointer;
}

.operation span {
  cursor: pointer;
  margin: 0 5px;
}

.hide_div {
  border: 1px solid #1e2c42;
  padding: 20px;
  
  .hotbg{
  	background: linear-gradient(to right, #1db292 , #009eb7);
  	height: 9rem;
  	width: 60%;
  	border-radius: 1rem;
  	margin: 1rem 2% 1rem 2%;
  	position: relative;
  }
  .hotbg .ng-binding1{
  	// height: 10rem;
      font-size: 1.5rem;
      // line-height: 10rem;
      text-align: left;
      position: absolute;
      top: 1rem;
      // left: 7rem;
  	left: 0.5rem;
      color: #FFFFFF;
      z-index: 1000;
      margin: 0;
  	width: 380px;
  }
  .hotbg .ng-binding2{
  	// height: 11rem;
  	font-size: 2rem;
  	// line-height: 10rem;
  	text-align: left;
  	position: absolute;
  	bottom: 1rem;
  	right: 1rem;
  	color: #FFFFFF;
  	z-index: 1000;
  	font-weight: 700;
  	margin: 0;
  }
      
  .hotbg .editc{
  	float: right;
  	color: #FFBC0C;
  	font-weight: 600;
  	margin-right: 2rem;
  	margin-top: 1rem;
  }
  .hotbg .iconfont{
  	position: absolute;
  	display: block;
  	width: 4.5rem;
  	height: 4.5rem;
  	background: rgba(255,255,255,0.7);
  	font-size: 3rem;
  	top: 2rem;
  	left: 1rem;
  	line-height: 4.5rem;
  	text-align: center;
  	border-radius: 50%;
  	z-index: 1000;
  	font-style: normal;
  }
  .hotbg .iconfont .red{color: red;}
}

.excharge_record {
  color: #5697f4;
}

input {
  background: none;
  border: none;
}

.address_inp {
  width: 100%;
  border: 1px solid #6b80ae;
  border-radius: 3px;
  padding: 15px 15px;
}

.num_lab {
  display: flex;
  width: 100%;
  border: 1px solid #6b80ae;
  border-radius: 3px;
  padding: 15px;
}

.num_lab input {
  width: 100%;
}

.range_lab,
.get_lab {
  border: 1px solid #6b80ae;
  border-radius: 3px;
  padding: 15px;
}

.get_lab {
  background: #1e2c42;
}

.right_inp_wrap {
  margin-left: 20px;
}

.use_num,
.advance {
  color: #5697f4;
}

.use_num {
  margin-right: 5px;
}

.advance {
  margin-left: 5px;
}

.withdraw_btn {
  background-color: #7a98f7;
  color: #fff;
  padding: 15px 50px;
  border: none;
  border-radius: 5px;
  width: 130px;
}

.withdraw_btn:hover {
  cursor: pointer;
}

.bg {
  background: #2b3c71;
}

.ewm_wrap {
  position: relative;
}

.ewm_img {
  width: 150px;
  height: 150px;
  position: absolute;
  top: 25px;
  left: -45px;
  border: 10px solid #fff;
  z-index: 1;
}

.hide {
  display: none;
}

.rec-box {
  .rec-con {
    margin: 10px;
    padding: 0 20px;
    background: #262a42;

    span {
      flex: 1;
      text-align: center;
      line-height: 3;
    }

    .rec-title {
      display: flex;
      justify-content: space-between;
      font-size: 14px;
      color: #fff;
      line-height: 1.5;
    }

    li {
      display: flex;

      justify-content: space-between;
      font-size: 12px;
      color: #728daf;
      border-top: 1px solid #2e394c;
    }
  }
}

.more {
  width: 100%;
  line-height: 40px;
  text-align: center;
  cursor: pointer;
}

.transfer-modal {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.3);
  overflow: hidden;
  justify-content: center;
  align-items: center;
}

.transfer-mask {
  width: 500px;
  background-color: #262a42;
  margin: 0 auto;
  border-radius: 5px;
}

.transfer-header {
  line-height: 40px;
  text-align: center;
  position: relative;
}

.transfer-header p {
  position: absolute;
  right: 10px;
  top: 0;
}

.num_lab input::-webkit-input-placeholder {
  color: #aaa;
  font-size: 12px;
}
</style>
