<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redis;

class Language
{
    /**
     * @param $request
     * @param Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

//        if (!empty($request->header('Session'))){
//            session()->setId($request->header('Session'));
////            session()->isStarted();//开启session会话
//        }
//        $lang = session('lang', 'zh');
        $lang = 'en';
        //var_dump($request->header('Session'));exit;
        if (!empty($request->header('language-mark'))){
            $lang = Redis::get('lang_'.$request->header('language-mark'));
        }
        App::setLocale($lang);
        return $next($request);
    }

}