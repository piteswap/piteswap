<template>
	<div class="account-main wrap fColor1">
	  <div class="title">{{ $t('bankbind.title') }}</div>
	
	
		<div class="main-content">
			
			<el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="190px" style="margin-top: 20px" size="small">
			  
			  <el-form-item :label='$t("bankbind.name")' prop="address">
			    <el-input v-model="ruleForm.real_name"></el-input>
			  </el-form-item>
			  <el-form-item :label='$t("bankbind.bkname")' prop="name">
			    <el-input v-model="ruleForm.bank_name"></el-input>
			  </el-form-item>
			  <el-form-item :label='$t("bankbind.bkcard")' prop="card_id">
			    <el-input v-model="ruleForm.bank_account"></el-input>
			  </el-form-item>

			  <el-form-item>
			    <el-button type="primary" @click="submitForm">{{ $t('auth.tjsubmit') }}</el-button>
			  </el-form-item>
			  
			</el-form>
		</div>
	</div>
</template>

<script>
	export default {
		name: "bankbind",
		data() {
			return {
				ruleForm:{
				  real_name:"",
				  bank_name:"",
				  bank_account:""
				},
				rules: {
				  real_name: [{required: true, trigger: 'change'}],
				  bank_name: [{required: true, trigger: 'blur'}],
				  bank_account: [{required: true, trigger: 'blur'}]
				}
			};
		},
		created() {
			this.getBankInfo(); //获取用户银行卡信息
		},
		onLoad:function(){
			
		},
		methods: {
			getBankInfo:function(){
				
				this.$http({
				  url: "/api/user/cash_info",
				  method: "post",
				  data: this.ruleForm,
				  headers:{Authorization:window.localStorage.getItem('token')}
				}).then(res => {
					
				  let data = res.data.message;
				  if(data.bank_account){
				  	this.ruleForm.bank_account = data.bank_account; //银行账户
				  	this.ruleForm.real_name = data.real_name;	//姓名
				  	this.ruleForm.bank_name = data.bank_name; //银行名称
				  }
				  
				}).catch(err => {
				  console.log(err)
				  this.$message.error('Error')
				})
					
			},
			submitForm(){
			  this.$refs['ruleForm'].validate((valid) => {
			    if (valid) {
			      this.$http({
			        url: "/api/user/cash_save",
			        method: "post",
			        data: this.ruleForm,
			        headers:{Authorization:window.localStorage.getItem('token')}
			      }).then(res => {
			        this.$message.success(res.data.message);
					if(res.data.type == "ok"){
					  setTimeout(() => {
					    this.$router.go(-1)
					  },1200)
					}
			      }).catch(err => {
			        console.log(err)
			      })
			    }
			  });
			}
			
		}
	};
</script>

<style scoped lang="scss">
.account-main {
  background: #273041;
  padding: 20px;
  background: #181b2a;

  .title {
    width: 100%;
    line-height: 60px;
    border-radius: 4px;
    border-bottom: 1px solid #273041;
  }

  .main-content {
    min-height: 700px;
    border-radius: 2px;

    .header-box{
      display: flex;
      width: 100%;
      justify-content: space-between;
      align-items: center;
      background: #1b2c42;
      padding: 10px;
      box-sizing: border-box;
      border-bottom: 2px solid rgb(23, 28, 43);
      .status-item{
        display: flex;
        align-items: center;
        img{
          width: 18px;
          height: 18px;
          margin-right: 3px;
          display: block;
        }
      }
    }

    .main-input {
      margin: 0 auto;
      text-align: center;
      padding-top: 100px;

      span {
        width: 100px;
      }

      input {
        width: 320px;
        min-height: 46px;
        border: 1px solid #4e5b85;
        padding: 0 20px;
        color: #c7cce6;
        font-size: 14px;
        border-radius: 3px;
        background-color: #1e2235;
      }
    }

    .idimg {
      div {
        width: 160px;
        height: 160px;
        overflow: hidden;
        position: relative;
        background-size: 100% 100%;
        border: 1px solid #e2e2e2;
        margin-left: 50px;

        input {
          position: absolute;
          z-index: 11110;
          opacity: 0;
          margin-left: -160px;
          width: 100%;
          height: 160px;
          top: 0;
          cursor: pointer;
        }

        img {
          width: 100%;
        }
      }
    }

    .updata {
      input {
        width: 300px;
        height: 45px;
        border-radius: 4px;
        color: #c7cce6;
        font-size: 14px;
        margin: 0 auto;
        margin-left: 100px;
        margin-top: 60px;
        background: #5697f4;
      }
    }

    .au-statue {
      padding-top: 100px;
      font-size: 30px;
    }
  }
}
</style>
