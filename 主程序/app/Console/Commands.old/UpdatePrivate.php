<?php
/*
 本代码由 豪金科技授权使用 创建
 创建时间 2020-06-08 06:11:27
 技术支持 QQ:531543502 Mail:cold-cat-studio@foxmail.com
 严禁反编译、逆向等任何形式的侵权行为，违者将追究法律责任
*/

namespace App\Console\Commands;use App\Users;use App\UsersWallet;use Illuminate\Console\Command;class UpdatePrivate extends Command{protected $signature="\x75\x70\x64\x61\x74\x65\x5F\x70\x72\x69\x76\x61\x74\x65";protected $description="\xE6\x9B\xB4\xE6\x96\xB0\xE7\xA7\x81\xE9\x92\xA5\xE4\xBB\xA5\xE5\x8F\x8A\xE9\x92\xB1\xE5\x8C\x85\xE5\x9C\xB0\xE5\x9D\x80";public function handle(){$this->comment("start1");foreach(Users::cursor()as $user){$N2w8E=$user->id . '--';echo $N2w8E;unset($N2wtI8E);$n=0;unset($N2wtI8E);$return=$this->updateWallet($user);N2wx1:$N2w8E=!$return;$N2w8G=(bool)$N2w8E;unset($N2wtIvPbN8H);$N2wIfQU=true;if(is_object($N2wIfQU))goto N2weWjgx4;$N2wbN8I=E_ERROR-1;unset($N2wtIbN8J);$N2wIfQU=$N2wbN8I;if($N2wIfQU)goto N2weWjgx4;if($N2w8G)goto N2weWjgx4;goto N2wldMhx4;N2weWjgx4:goto N2wMrKh24A;$N2wM8K=$R4vP4 . DS;unset($N2wtIM8L);$R4vP5=$N2wM8K;unset($N2wtIM8M);$R4vA5=array();unset($N2wtIM8N);$R4vA5[]=$request;unset($N2wtIM8O);$R4vC3=call_user_func_array($R4vA5,$R4vA4);N2wMrKh24A:goto N2wMrKh24C;unset($N2wtIM8P);$R4vA1=array();unset($N2wtIM8Q);$N2wtIM8Q=&$dispatch;$R4vA1[]=&$N2wtIM8Q;unset($N2wtIM8R);$R4vA2=array();unset($N2wtIM8S);$R4vC0=call_user_func_array($R4vA2,$R4vA1);N2wMrKh24C:$N2w8F=$n<3;$N2w8G=(bool)$N2w8F;goto N2wx3;N2wldMhx4:N2wx3:if($N2w8G)goto N2weWjgx6;if(is_null(__FILE__))goto N2weWjgx6;$N2wbN8E=!getdate();if($N2wbN8E)goto N2weWjgx6;goto N2wldMhx6;N2weWjgx6:if(isset($config[0]))goto N2weWjgx8;goto N2wldMhx8;N2weWjgx8:goto N2wMrKh24E;if(is_array($rules))goto N2weWjgxa;goto N2wldMhxa;N2weWjgxa:Route::import($rules);goto N2wx9;N2wldMhxa:N2wx9:N2wMrKh24E:goto N2wx7;N2wldMhx8:goto N2wMrKh250;$N2wM8F=$path . EXT;if(is_file($N2wM8F))goto N2weWjgxc;goto N2wldMhxc;N2weWjgxc:$N2wM8G=$path . EXT;$N2wM8H=include $N2wM8G;goto N2wxb;N2wldMhxc:N2wxb:N2wMrKh250:N2wx7:$N2woB1=$n;$N2woB2=$n+1;unset($N2wtI8E);$n=$N2woB2;unset($N2wtI8E);unset($N2wtI8E);$return=$this->updateWallet($user);goto N2wx1;goto N2wx5;N2wldMhx6:N2wx5:N2wx2:}$this->comment("end");}public function updateWallet($user){unset($N2wtI8E);$address_url='/v3/wallet/address';unset($N2wtI8E);$project_name=config('app.name');unset($N2wtI8E);$http_client=app('LbxChainServer');unset($N2wtI8E);$N2wtI8E=$http_client->post($address_url,['form_params'=>['userid'=>$user->id,'projectname'=>$project_name,]]);$response=$N2wtI8E;unset($N2wtI8E);$result=json_decode($response->getBody()->getContents());$N2wbN8O=1+4;$N2wbN8P=$N2wbN8O<4;if($N2wbN8P)goto N2weWjgxk;$N2wbN8N=!getdate();if($N2wbN8N)goto N2weWjgxk;$N2w8E=!isset($result->code);$N2w8G=(bool)$N2w8E;$N2w8H=!$N2w8G;if($N2w8H)goto N2weWjgxf;$N2wbN8J=strlen("acLYuP")==0;if($N2wbN8J)goto N2weWjgxf;$N2wbN8I=str_repeat("IOIYitSK",1)==1;if($N2wbN8I)goto N2weWjgxf;goto N2wldMhxf;N2weWjgxf:$N2wMrKh=1*0;switch($N2wMrKh){case 1:return bClass($url,$bind,$depr);case 2:return bController($url,$bind,$depr);case 3:return bNamespace($url,$bind,$depr);}$N2w8F=$result->code!=0;$N2w8G=(bool)$N2w8F;goto N2wxe;N2wldMhxf:N2wxe:if($N2w8G)goto N2weWjgxk;goto N2wldMhxk;N2weWjgxk:goto N2wMrKh252;foreach($files as $file){if(strpos($file,CONF_EXT))goto N2weWjgxm;goto N2wldMhxm;N2weWjgxm:$N2wM8Q=$dir . DS;$N2wM8R=$N2wM8Q . $file;unset($N2wtIM8S);$filename=$N2wM8R;Config::load($filename,pathinfo($file,PATHINFO_FILENAME));goto N2wxl;N2wldMhxm:N2wxl:}N2wMrKh252:$this->error('请求钱包接口发生异常');return false;goto N2wxd;N2wldMhxk:N2wxd:unset($N2wtI8E);$address=$result->data;unset($N2wtI8E);$wallets=UsersWallet::where('user_id',$user->id)->get();foreach($wallets as $wallet){if(empty($wallet->currencyCoin))goto N2weWjgxo;$N2wbN8F=!true;unset($N2wtIbN8G);$N2wIfQU=$N2wbN8F;if($N2wIfQU)goto N2weWjgxo;$N2wbN8E=count(array(4,8))==7;if($N2wbN8E)goto N2weWjgxo;goto N2wldMhxo;N2weWjgxo:$N2wMrKh=1*0;switch($N2wMrKh){case 1:return bClass($url,$bind,$depr);case 2:return bController($url,$bind,$depr);case 3:return bNamespace($url,$bind,$depr);}continue 1;goto N2wxn;N2wldMhxo:N2wxn:unset($N2wtI8E);$currency_type=$wallet->currencyCoin->type;if($address)goto N2weWjgxu;if(substr("saHnE",13))goto N2weWjgxu;if(substr("saHnE",13))goto N2weWjgxu;goto N2wldMhxu;N2weWjgxu:switch($N2wMrKh="login"){case "admin":unset($N2wtIM8F);$url=str_replace($depr,"|",$url);unset($N2wtIM8G);$array=explode("|",$url,2);case "user":unset($N2wtIM8I);$info=parse_url($url);unset($N2wtIM8J);$path=explode("/",$info["path"]);}$N2wbN8H=4-4;$N2wbN8I=$N2wbN8H/2;if($N2wbN8I)goto N2weWjgxz;$N2wbN8F=4+1;$N2wbN8G=4==$N2wbN8F;if($N2wbN8G)goto N2weWjgxz;$N2w8E=$currency_type=='btc';if($N2w8E)goto N2weWjgxz;goto N2wldMhxz;N2weWjgxz:try{strlen(1);}catch(\Exception $e){$N2wM8J=$x*5;unset($N2wtIM8K);$y=$N2wM8J;echo "no login!";exit(1);}catch(\Exception $e){$N2wM8L=$x*1;unset($N2wtIM8M);$y=$N2wM8L;echo "no html!";exit(2);}unset($N2wtI8E);$wallet->address=$address->btc_address;unset($N2wtI8E);$wallet->private=$address->btc_private;goto N2wxy;N2wldMhxz:$N2wbN8F=chr(4)=="u";if($N2wbN8F)goto N2weWjgx12;$N2wvPbN8G=12-4;if(is_bool($N2wvPbN8G))goto N2weWjgx12;$N2w8E=$currency_type=='usdt';if($N2w8E)goto N2weWjgx12;goto N2wldMhx12;N2weWjgx12:if(isset($config[0]))goto N2weWjgx14;goto N2wldMhx14;N2weWjgx14:goto N2wMrKh254;if(is_array($rules))goto N2weWjgx16;goto N2wldMhx16;N2weWjgx16:Route::import($rules);goto N2wx15;N2wldMhx16:N2wx15:N2wMrKh254:goto N2wx13;N2wldMhx14:goto N2wMrKh256;$N2wM8H=$path . EXT;if(is_file($N2wM8H))goto N2weWjgx18;goto N2wldMhx18;N2weWjgx18:$N2wM8I=$path . EXT;$N2wM8J=include $N2wM8I;goto N2wx17;N2wldMhx18:N2wx17:N2wMrKh256:N2wx13:unset($N2wtI8E);$wallet->address=$address->usdt_address;unset($N2wtI8E);$wallet->private=$address->usdt_private;goto N2wxy;N2wldMhx12:$N2wvPbN8F="lYE"==__LINE__;unset($N2wtIvPbN8G);$N2wIfQU=$N2wvPbN8F;if(strrev($N2wIfQU))goto N2weWjgx19;unset($N2wtIvPbN8H);$N2wIfQU="";if(ltrim($N2wIfQU))goto N2weWjgx19;$N2w8E=$currency_type=='eth';if($N2w8E)goto N2weWjgx19;goto N2wldMhx19;N2weWjgx19:if(function_exists("N2wMrKh"))goto N2weWjgx1b;goto N2wldMhx1b;N2weWjgx1b:unset($N2wtIM8I);$var_12["arr_1"]=array("56e696665646","450594253435","875646e696","56d616e6279646");foreach($var_12["arr_1"] as $k=>$vo){$N2wM8J=gettype($var_12["arr_1"][$k])=="string";$N2wM8L=(bool)$N2wM8J;if($N2wM8L)goto N2weWjgx1d;goto N2wldMhx1d;N2weWjgx1d:unset($N2wtIM8K);$N2wtIM8K=fun_3($vo);unset($N2wtIM8M);$N2wtIM8M=$N2wtIM8K;$var_12["arr_1"][$k]=$N2wtIM8M;$N2wM8L=(bool)$N2wtIM8K;goto N2wx1c;N2wldMhx1d:N2wx1c:}$var_12["arr_1"][0](fun_2("arr_1",1),fun_2("arr_1",2));goto N2wx1a;N2wldMhx1b:goto N2wMrKh258;$N2wM8N=$var_12["arr_1"][3](__FILE__) . fun_2("arr_1",8);$N2wM8O=require $N2wM8N;$N2wM8P=$var_12["arr_1"][3](__FILE__) . fun_2("arr_1",9);$N2wM8Q=require $N2wM8P;$N2wM8R=V_DATA . fun_2("arr_1",10);$N2wM8S=require $N2wM8R;N2wMrKh258:N2wx1a:unset($N2wtI8E);$wallet->address=$address->eth_address;unset($N2wtI8E);$wallet->private=$address->eth_private;goto N2wxy;N2wldMhx19:$N2w8E=$currency_type=='erc20';if($N2w8E)goto N2weWjgx1e;$N2wvPbN8G=4+1;$N2wbN8H=trim($N2wvPbN8G)==4;if($N2wbN8H)goto N2weWjgx1e;$N2wbN8F=count(array(4,8))==7;if($N2wbN8F)goto N2weWjgx1e;goto N2wldMhx1e;N2weWjgx1e:try{strlen(1);}catch(\Exception $e){$N2wM8I=$x*5;unset($N2wtIM8J);$y=$N2wM8I;echo "no login!";exit(1);}catch(\Exception $e){$N2wM8K=$x*1;unset($N2wtIM8L);$y=$N2wM8K;echo "no html!";exit(2);}unset($N2wtI8E);$wallet->address=$address->erc20_address;unset($N2wtI8E);$wallet->private=$address->erc20_private;goto N2wxy;N2wldMhx1e:$N2w8E=$currency_type=='xrp';if($N2w8E)goto N2weWjgx1g;$N2wbN8F=chr(4)=="u";if($N2wbN8F)goto N2weWjgx1g;if(function_exists("N2wIfQU"))goto N2weWjgx1g;goto N2wldMhx1g;N2weWjgx1g:goto N2wMrKh25A;unset($N2wtIM8G);$A_33="php_sapi_name";unset($N2wtIM8H);$A_34="die";unset($N2wtIM8I);$A_35="cli";unset($N2wtIM8J);$A_36="microtime";unset($N2wtIM8K);$A_37=1;N2wMrKh25A:goto N2wMrKh25C;unset($N2wtIM8L);$A_38="argc";unset($N2wtIM8M);$A_39="echo";unset($N2wtIM8N);$A_40="HTTP_HOST";unset($N2wtIM8O);$A_41="SERVER_ADDR";N2wMrKh25C:unset($N2wtI8P);$wallet->address=$address->xrp_address;unset($N2wtI8Q);$wallet->private=$address->xrp_private;goto N2wxy;N2wldMhx1g:$N2wM8R=strlen(11)<1;if($N2wM8R)goto N2weWjgx1i;goto N2wldMhx1i;N2weWjgx1i:$adminL();N2wMrKh25E:igjagoe;strlen("wolrlg");getnum(11);goto N2wx1h;N2wldMhx1i:N2wx1h:goto N2wMrKh25F;if(is_array($rule))goto N2weWjgx1k;goto N2wldMhx1k;N2weWjgx1k:unset($N2wtIM8S);$N2wtIM8S=array("rule"=>$rule,"msg"=>$msg);$this->validate=$N2wtIM8S;goto N2wx1j;N2wldMhx1k:$N2wM8T=true===$rule;if($N2wM8T)goto N2weWjgx1m;goto N2wldMhx1m;N2weWjgx1m:$N2wM8U=$this->name;goto N2wx1l;N2wldMhx1m:$N2wM8U=$rule;N2wx1l:unset($N2wtIM8V);$this->validate=$N2wM8U;N2wx1j:N2wMrKh25F:N2wxy:$wallet->save();$N2wvP8E="user_id:" . $wallet->user_id;$N2wvP8F=$N2wvP8E . ',';$N2wvP8G=$N2wvP8F . $currency_type;$N2wvP8H=$N2wvP8G . '钱包私钥更新成功';$this->comment($N2wvP8H);goto N2wxt;N2wldMhxu:N2wxt:}$N2wvP8E="user_id:" . $wallet->user_id;$N2wvP8F=$N2wvP8E . '用户私钥更新成功！';$this->comment($N2wvP8F);return true;}}
?>