<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        defined('DECIMAL_SCALE') || define('DECIMAL_SCALE', 8);
        bcscale(DECIMAL_SCALE);

        // sql 调试日志
        // DB::listen(function ($query) {
        //     $tmp = str_replace('?', '"'.'%s'.'"', $query->sql);
        //     $qBindings = [];
        //     foreach ($query->bindings as $key => $value) {
        //         if (is_numeric($key)) {
        //             $qBindings[] = $value;
        //         } else {
        //             $tmp = str_replace(':'.$key, '"'.$value.'"', $tmp);
        //         }
        //     }
        //     $tmp = vsprintf($tmp, $qBindings);
        //     $tmp = str_replace("\\", "", $tmp);
        //     Log::info(' execution time: '.$query->time.'ms; '.$tmp."\n\n\t");

        // });

    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(Client::class, function ($app) {
            return new Client();
        });
        $this->app->singleton('LbxChainServer', function ($app) {
            $api_url = config('app.wallet_api');
            return new Client(['base_uri' => $api_url]);
        });
    }
}
