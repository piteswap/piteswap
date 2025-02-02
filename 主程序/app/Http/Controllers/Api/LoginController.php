<?php
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\DB;
use Session;
use App\Agent;
use App\UserCashInfo;
use App\UserChat;
use App\Users;
use App\Token;
use App\AccountLog;
use App\UsersWallet;
use App\Currency;
use App\Utils\RPC;
use App\DAO\UserDAO;
use App\DAO\RewardDAO;
use App\UserProfile;
use App\Sms;
use App\Ems;
use App\Services\CodeService;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redis;

class LoginController extends Controller
{

    // type 1普通密码 2手势密码 testa
    public function login()
    {
        $user_string = Input::get('user_string', '');
        $password = Input::get('password', '');
        $type = Input::get('user_type', 1); //登录类型
        $area_code = Input::get('areacode', 0); // 注册区号
        if (empty($user_string)) {
            return $this->error('请输入账号');
        }
        if (empty($password)) {
            return $this->error('请输入密码');
        }
        // 手机、邮箱、交易账号登录
        $user = Users::where('account_number', $user_string)->first(); //->where('area_code_id', $area_code_id)
        if (empty($user)) {
            return $this->error('用户未找到');
        }
        // dd(Users::MakePassword($password));
        if (Users::MakePassword($password) != $user->password) {
            return $this->error('密码错误');
        }
        
        
        // 是否锁定
        if ($user->status == 1) {
            return $this->error('您好，您的账户已被冻结，详情请咨询客服。');
        }
        // session(['user_id' => $user->id]);
        Token::clearToken($user->id);
        $token = Token::setToken($user->id);
        $ip = request()->getClientIp();
        $user->last_login_ip = $ip;
        $user->save();
        return $this->success($token, 1);
    }

    // 注册 add 邮箱注册
    public function register()
    {
        $area_code_id = Input::get('area_code_id', 0); // 注册区号
        $area_code = Input::get('areacode', 0); // 注册区号
        $type = Input::get('type', '');
        $user_string = Input::get('user_string', '');
        $password = Input::get('password', '');
        $re_password = Input::get('re_password', '');
        $code = Input::get('code', ''); //验证码
        if (empty($type) || empty($user_string) || empty($password) || empty($re_password)) {
            return $this->error('参数错误');
        }
        $extension_code = Input::get('extension_code', '');
        if ($password != $re_password) {
            return $this->error('两次密码不一致');
        }
        if (mb_strlen($password) < 6 || mb_strlen($password) > 16) {
            return $this->error('密码只能在6-16位之间');
        }
        $phone = $area_code.$user_string;
        if($type == 'email'){
            $sys_code = Ems::where('email', $user_string)->orderBy('id', 'DESC')->value('code');//Redis::get('code'.$user_string);
        }else{
            $sys_code = Sms::where('mobile', $user_string)->orderBy('id', 'DESC')->value('code');//Redis::get('code'.$phone);
        }
        if (env('NO_VERIFICATION')=='1' && $code != $sys_code) {  //验证
            return $this->error('验证码错误');
        }
        
        $user = Users::getByString($user_string);
        if (! empty($user)) {
            return $this->error('账号已存在');
        }
        $parent_id = 0;
         if (! empty($extension_code)) {
             $p = Users::where("extension_code", $extension_code)->first();
             if (empty($p)) {
                 $parent_id = 0;
                //  return $this->error("请填写正确的邀请码");
             } else {
                 $parent_id = $p->id;
             }
         }
        
        $users = new Users();
        $users->password = Users::MakePassword($password);
        $users->parent_id = $parent_id;
        $users->account_number = $user_string;
        $users->area_code_id = $area_code_id;
        $users->area_code = $area_code;
        if ($type == "mobile") {
            $users->phone = $user_string;
        } else {
            $users->email = $user_string;
            $users->phone = '';
        }
        $users->head_portrait = URL("mobile/images/user_head.png");
        $users->time = time();
        $users->extension_code = Users::getExtensionCode();
        DB::beginTransaction();
        try {
            $users->parents_path = UserDAO::getRealParentsPath($users); // 生成parents_path tian add
                                                                        
            // 代理商节点id。标注该用户的上级代理商节点。这里存的代理商id是agent代理商表中的主键，并不是users表中的id。
            $users->agent_note_id = Agent::reg_get_agent_id_by_parentid($parent_id);
            // 代理商节点关系
            $users->agent_path = Agent::agentPath($parent_id);
            
            $users->save(); // 保存到user表中
            $test = UsersWallet::makeWallet($users->id);
            // DB::rollBack();
            // return $this->error('File:');
            UserProfile::unguarded(function () use ($users) {
                $users->userProfile()->create([]);
            });
            
            DB::commit();
            //return $this->success("注册成功,钱包状态：" . $test);
            return $this->success("注册成功");
        } catch (\Exception $ex) {
            DB::rollBack();
            return $this->error('File:' . $ex->getFile() . ',Line:' . $ex->getLine() . ',Message:' . $ex->getMessage());
        }
    }

    // 忘记密码
    public function forgetPassword()
    {
        $account = Input::get('account', '');
        $areacode = Input::get('areacode', '');
        $password = Input::get('password', '');
        $repassword = Input::get('repassword', '');
        $code = Input::get('code', '');
        
        if (empty($account)) {
            return $this->error('请输入账号');
        }
        if (empty($password) || empty($repassword)) {
            return $this->error('请输入密码或确认密码');
        }
        
        if ($repassword != $password) {
            return $this->error('输入两次密码不一致');
        }
        $phone =  $areacode.$account;
        $code_string = Redis::get('code'.$phone);
        
        
        if (empty($code) || ($code != $code_string)) {
            return $this->error('验证码不正确');
        }
        
        
        $user = Users::getByString($account);
        if (empty($user)) {
            return $this->error('账号不存在');
        }
        
        $user->password = Users::MakePassword($password);
        
        try {
            $user->save();
            Redis::del('code'.$phone);
            return $this->success("修改密码成功");
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage());
        }
    }

    public function checkEmailCode()
    {
        $email_code = Input::get('email_code', '');
        // if (empty($email_code))
        //     return $this->error('请输入验证码');
        // $session_code = session('code');
        // if ($email_code != $session_code)
        //     return $this->error('验证码错误');
        return $this->success('验证成功');
    }

    public function checkMobileCode()
    {
        $mobile_code = Input::get('mobile_code', '');
        // // var_dump($mobile_code);
        // if (empty($mobile_code)) {
        //     return $this->error('请输入验证码');
        // }
        // $session_mobile = session('code');
        // // var_dump($session_mobile);
        // if ($session_mobile != $mobile_code) {
        //     return $this->error('验证码错误');
        // }
        return $this->success('验证成功');
    }

    /**
     * 获取短信验证码
     */
    public function sms_send()
    {
        $mobile = Input::get('user_string',"");
        $areacode = Input::get("area_code");
        try {
            $pool = '0123456789';
            $len = env('CAPTCHA_LENGTH');
            $sms = new Sms();
            $sms->event = 'register';
            $sms->mobile = $mobile;
            $sms->code = substr(str_shuffle(str_repeat($pool, ceil($len / strlen($pool)))), 0, $len);
            $sms->ip = request()->getClientIp();

            $smsRes = $sms->save();
            if($smsRes)
            {
                $codeService = new \App\Service\CodeService();
                $params = [
                    'areacode'=>$areacode,
                    'mobile' => $sms->mobile,
                    'code'  => $sms->code
                ];
                $result = $codeService->smsSend($params);
                if($result){
                    return $this->success('发送成功');    
                }
                $err = $codeService->getError();
                return $this->error($err['errmsg']);
            }
            return $this->error('发送失败');
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage());
        }
    }
    /**
     * 获取邮箱验证码
     */
     public function sms_mail()
     {
        $email = Input::get('user_string', '');
        
        try {
            $pool = '0123456789';
            $len = env('CAPTCHA_LENGTH');
            $expire = env('CAPTCHA_EXPIRE');
            $ems = new Ems();
            $ems->event = 'register';
            $ems->email = $email;
            $ems->code = substr(str_shuffle(str_repeat($pool, ceil($len / strlen($pool)))), 0, $len);
            $ems->ip = request()->getClientIp();
            $emsRes = $ems->save();
            if($emsRes)
            {
                $title = "注册验证码邮件";
                $content = "您的注册验证码为：{$ems->code}, " . ceil($expire / 60). "分钟内有效。";
                // var_dump(env('WALLET_API'));die;
                Mail::raw($content, function ($said) use ($email, $title) {
                    $said->to($email)->subject($title);
                });
                $err = Mail::failures();
                if(!$err){
                    return $this->success('发送成功');  
                }
                // dd();//打印返回的参数 json格式
                return $this->error($err);
            }
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage());
        }
     }
}
