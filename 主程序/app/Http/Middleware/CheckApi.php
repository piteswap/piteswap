<?php

namespace App\Http\Middleware;

use App\Users;
use App\Token;
use Closure;
use Session;
use Illuminate\Support\Facades\Auth;

class CheckApi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        $token = Token::getToken();
        $user_id = Token::getUserIdByToken($token);
//        var_dump($user_id);die;
        // return response()->json(['user_id' => $user_id, 'message' => $token]);
//        if (empty($user_id) || ($user_id != session('user_id'))){
//            return response()->json(['type' => '999', 'message' => '请先登录']);
//        }

        $lan = session()->get('lang');
        if($lan == 'zh'){
            $plogin = '请登录';
        }elseif($lan =='en'){
          $plogin = 'please sign in';
        }elseif($lan =='jp'){
            $plogin = 'サインインしてください';
        }elseif($lan =='kr'){
            $plogin = '로그인 해주세요';
        }elseif($lan =='hk'){
            $plogin = '請登錄';
        }else{
            $plogin = 'please sign in';
        }
        if (empty($user_id)){
            return response()->json(['type'=>'999','message'=> $plogin]);
        }
        // if ($user_id != session('user_id')){
        //     return response()->json(['type'=>'999','message'=>'请先登录']);
        // }
        // echo $user_id;
        // $request->attributes->add(['user_id' => $user_id]);//添加参数
        // session(['user_id' => $user_id]);
        return $next($request)->header('Access-Control-Allow-Origin', '*')
            ->header('Access-Control-Allow-Credentials', 'true');
    }
}
