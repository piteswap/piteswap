<?php

namespace App\Http\Controllers\Api;

use App\AccountLog;
use App\LhSendOrder;
use App\Users;
use App\UsersWallet;
use http\Client\Curl\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SendingOrderController extends Controller
{
    public function config(Request $request){

        $page = $request->get('page');
        $list = DB::table('lh_sending_config')->join('currency','currency.id','=','currency_id')
            ->offset(($page-1)*10)->limit(10)
            ->select(['currency.name as currency_name','lh_sending_config.*'])
            ->get();
//        foreach ($list as &$arr){
//            $arr->
//        }
        return $this->success($list);
//        return $this->success('获取成功',$type=0,$list);
    }
    public function product_info(Request $request){
        $id = $request->get('id','');
        if($id<1){
            return $this->error('参数错误');
        }
        $list = DB::table('lh_sending_config')->where('lh_sending_config.id',$id)->join('currency','currency.id','=','currency_id')
            ->first(['currency.name as currency_name','lh_sending_config.*']);
        return $this->success($list);
//        return $this->success('获取成功',$type=0,$list);
    }
    public function sendOrder(Request $request){
        $id = $request->get('config_id');
        $amount = $request->get('amount');
        $config = DB::table('lh_sending_config')->where('id',$id)->first();
        if(!$config){
            return $this->error('币种不存在');//币种不存在
        }
        //判断是审核表是否存在记录
//        $users = Users::getAuthUser();
//        $where = [
//            'user_id' => $users->id,
//            'config_id' => $id,
//        ];
//        $info = DB::table('lh_sending_check')->where($where)->first();
//        if (!$info){
//            $insert = [
//                'user_id' => $users->id,
//                'config_id' => $id,
//                'user_name' => $users->account_number,
//                'created_at' => date('Y-m-d H:i:s')
//            ];
//            DB::table('lh_sending_check')->insert($insert);
//
//            return $this->error('请联系在线客服，获取购买资格!');
//        }else{
//            if ($info->status == 1){
//                return $this->error('请联系在线客服，获取购买资格!');
//            }
//        }
        $new_currency_num = bcdiv($amount,$config->change_rate,4);//新币的数量
        if ($config->last_num<=0) return $this->error('已售磐');

        if($new_currency_num > $config->last_num){
            
            return $this->error($this->returnStr('最多申购数量为：') . $config->last_num);
        }
        if ($config->last_num > $config->buy_num){
            if($new_currency_num < $config->buy_num){
                return $this->error($this->returnStr('最低申购数量为：') . $config->buy_num);//最少存入数量为：
            }
        }
        //钱包
        $user_id = Users::getUserId();
        $legal = UsersWallet::where("user_id", $user_id)
            ->where("currency", $config->currency_id) //usdt
            ->lockForUpdate()
            ->first();
        DB::beginTransaction();
        try{
            //审核通过才扣款
//            $result = change_wallet_balance(
//                $legal,
//                2,
//                -$amount,
//                AccountLog::SEND_CURRENCY,
//                '新币申购', //锁仓
//                false,
//                0,
//                0,
//                serialize([])
//            );

            $temp = bcmul($config->interest_rate,0.01,4);
            $interest = bcmul($new_currency_num,$temp,4);//收益
            LhSendOrder::newOrder($user_id,$config->currency_id,$amount,$config->day,$new_currency_num,$config->id,$interest,$config->change_rate);
            DB::table('lh_sending_config')->where('id',$id)->decrement('last_num',$new_currency_num);
            DB::commit();
        }catch (\Exception $e){
            DB::rollBack();
            return $this->error($e->getMessage());
        }
        return $this->success('申购成功');
    }
    public function mySendOrder(Request $request){
        $user_id = Users::getUserId();
        $where = [];
        $limit = $request->get('limit', 50);
        $page = $request->get('page', 1);
        $status = $request->get('status', '');//传1为赎回中
        if ($status){
            $where['status']= $status;
        }
        $queryCount = LhSendOrder::query();
        $queryCount->where('user_id',$user_id)
            ->join('currency','currency.id','=','currency_id')
            ->where($where);
        if ($status == 1){
            $queryCount->whereIn('exam_status',[1,3]);
        }
        $count = $queryCount->count();

        $query = LhSendOrder::query();
        $query->where('user_id',$user_id)
            ->join('currency','currency.id','=','lh_sending_order.currency_id')
            ->leftjoin('lh_sending_config','lh_sending_config.id','=','lh_sending_order.config_id')
            ->where($where)
            ->orderBy('lh_sending_order.id','desc')
            ->skip($limit*($page-1))->take($limit);
        if ($status == 1){
            $query->whereIn('exam_status',[1,3]);
        }
        $res = $query->get(['currency.name as currency_name','lh_sending_config.online_time','lh_sending_config.interest_rate','lh_sending_order.*',]);
            //收益率
        $original_interest = LhSendOrder::query()->where(['status'=>'2','user_id'=>$user_id])->sum('original_interest');

        return $this->success([
            'order_list' => $res,
            'total'=>$count,
            'total_interest'=>$original_interest
        ]);
    }
    public function orderInfo(Request $request){
        $id = $request->get('id');
        if($id<1){
            return $this->error('参数错误');
        }
        $res = LhSendOrder::where('lh_sending_order.id',$id)
            ->join('currency','currency.id','=','lh_sending_order.currency_id')
            ->leftjoin('lh_sending_config','lh_sending_config.id','=','lh_sending_order.config_id')
            ->first(['currency.name as currency_name','lh_sending_config.online_time','lh_sending_order.*',]);
        return $this->success($res);
    }
    public function get_recommend(){
        $data = DB::table('lh_sending_config')->where('is_recommend',1)->first();
        return $this->success($data);
    }
    public function sendAdd(Request $request){
        $id = $request->get('config_id');
        $config = DB::table('lh_sending_config')->where('id',$id)->first();
        if(!$config){
            return $this->error('币种不存在');//币种不存在
        }
        $users = Users::getAuthUser();
        //判断是审核表是否存在记录
        $where = [
            'user_id' => $users->id,
            'config_id' => $id,
        ];
        $info = DB::table('lh_sending_check')->where($where)->first();
        if (!$info){
            $insert = [
                'user_id' => $users->id,
                'config_id' => $id,
                'user_name' => $users->account_number,
                'created_at' => date('Y-m-d H:i:s')
            ];
            DB::table('lh_sending_check')->insert($insert);
            return $this->success(['status'=>1]);
        }else{
            return $this->success(['status'=>$info->status]);
        }
    }
}
?>