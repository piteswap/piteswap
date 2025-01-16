<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('loginurl','Api\LoginController@jumpUrl');//认购
 Route::post('project/order','Api\CurrencyProjectController@postOrder');//认购
Route::get('config/getSetting','Api\WalletController@getSetting');//认购

 Route::get('lh/deposit/config','Api\BankController@config');
 Route::get('lh/deposit/product_info','Api\BankController@product_info');
 Route::get('lh/interest','Api\BankController@dispatchInterest');//派息接口

 Route::get('lh/send/config','Api\SendingOrderController@config');//获取新币数据列表
 Route::get('lh/send/product_info','Api\SendingOrderController@product_info');
 Route::get('lh/send/get_recommend','Api\SendingOrderController@get_recommend');
 //测试用
//Route::post('lh/send/order','Api\SendingOrderController@sendOrder');//新币申购
//Route::get('/lh/send/order_list','Api\SendingOrderController@mySendOrder');
//Route::get('/lh/send/order_info','Api\SendingOrderController@orderInfo');

 /*
 Route::middleware('check_api')->post('/lh/deposit','Api\BankController@newDeposit');//新质押
 Route::middleware('check_api')->get('/lh/deposit/report','Api\BankController@depositReport');//汇总
 Route::middleware('check_api')->get('/lh/deposit/log','Api\BankController@depositLog');//汇总
 Route::middleware('check_api')->get('/lh/deposit/order','Api\BankController@myDepositOrder');//我的质押订单
 Route::middleware('check_api')->post('/lh/deposit/order/cancel','Api\BankController@cancelOrderNew');
 */
 Route::get('user/numberPromoters', 'Api\UserController@numberPromoters');//下级用户
 Route::get('/admin/allStatus','Admin\UserController@allStatus');