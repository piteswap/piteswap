<?php

namespace App\Http\Middleware;

use Closure;
use App\Users;

class ValidateUserLocked
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $user_id = Users::getUserId();
        $user = Users::find($user_id);
        if ($user) {
            if ($user->status == 1 && $user->lock_time > time()) {
              $lan = session()->get('lang');
              switch ($lan) {
                case 'zh':
                  $message = '账号锁定中,'.date('Y-m-d H:i:s', $user->lock_time).'前不能进行此操作';
                  break;
                case 'en':
                  $message = 'During account locking, this operation cannot be performed before '.date('Y-m-d H:i:s', $user->lock_time);
                  break;
                case 'jp':
                  $message = 'アカウントロック中、'.date('Y-m-d H:i:s', $user->lock_time).'までこの操作はできません';
                  break;
                case 'kr':
                  $message = '계정 잠금 중, '.date('Y-m-d H:i:s', $user->lock_time).' 이전에는 이 조작을 할 수 없습니다';
                  break;
                case 'hk':
                  $message = '帳號鎖定中，'.date('Y-m-d H:i:s', $user->lock_time).'之前前不能進行此操作';
                  break;
                default:
                  $message = 'During account locking, this operation cannot be performed before '.date('Y-m-d H:i:s', $user->lock_time);
                  break;
              }
                return response()->json(['type' => 'error', 'message' => $message]);
            }
        } else {
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
            return response()->json(['type'=>'999','message'=>$plogin]);
        }
        return $next($request);
    }
}
