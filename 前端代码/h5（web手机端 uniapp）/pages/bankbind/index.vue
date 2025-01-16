<template>
	<view class="dark">
		<lw-navbar :title="$t('bankbind.title')"></lw-navbar>
		
		<view v-if="isshow==false" class="ifnone_add_bank" @click="$u.route('/pages/bankbind/addbank')">
			<p class="p1">+</p>
			<p class="p2" >{{$t('bankbind.addcard')}}</p>
		</view>
		
		
		<view v-else="" class="hotbg" @click="$u.route('/pages/bankbind/addbank')">
			<p class="ng-binding1">{{this.bkname}}</p>
			<span class="editc" >{{$t('bankbind.examine')}}</span>
			<p class="ng-binding2">{{this.bknumber}}</p>
			<!-- <i class="iconfont red">{{this.bknamesplit}}</i> -->
		</view>
		
		
		
	</view>
</template>

<script>
export default {
	data() {
		return {
			isshow:false,
			bkname:'',
			bknumber:'',
			bknamesplit:''
		};
	},
	onLoad:function(){
		this.checkLogin();
		this.getBankList();
	},
	methods:{
		// exitBtn:function(){
		// 	this.$refs['sureModal'].panel('show')
		// },
		getBankList:function(){
			this.$u.api.cashInfo({'lang':this.$i18n.locale}).then(res => {
				if(res.bank_account){
					this.isshow = true;
					
					this.bknumber = res.bank_account.substr(0,4) + '******' + res.bank_account.substr(res.bank_account.length - 4)
					this.bkname = res.bank_name; //银行名称
					// this.bknamesplit = res.bank_name.substring(0,1);
				}
			})
		},

	}
}
</script>

<style lang="scss">
.dark {
	background: url('@/static/images/common/dark-bg-setting.png') no-repeat;
	background-size: 100% 100%;
}
.dark .ifnone_add_bank{
	background-color: rgb(38, 40, 52);
	border:0.2rem #505050 dashed;
	width: 94%;
	height: 9rem;
	border-radius:1rem;
	margin:1rem 2% 1rem 2%;
	position:relative;
}
.ifnone_add_bank .p1{
	position:static;
	text-align:center;
	width: 100%;
	font-size:8rem;
	height: 6rem;
	line-height:6rem;
	color:#505050;
}
.ifnone_add_bank .p2{
	position:static;
	text-align:center;
	width: 100%;
	font-size:1rem;
	color:#505050;
}
.hotbg{
	background: linear-gradient(to right, #1db292 , #009eb7);
	height: 9rem;
	width: 94%;
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

</style>
