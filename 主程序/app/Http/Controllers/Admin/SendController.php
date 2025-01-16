<?php


namespace App\Http\Controllers\Admin;


use App\AccountLog;
use App\Currency;
use App\LhSendOrder;
use App\Users;
use App\UsersWallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SendController extends Controller
{


    public function depositOrderList(Request $request){
        
        $limit = $request->get('limit', 20);
        $where = [];
        $account = $request->get('search');
        $status = $request->get('status');
        if($status){
            $where['lh_sending_order.status'] = $status;
        }
        $res = LhSendOrder::join('lh_sending_config as c','c.id','=','config_id')
            ->join('users as u','user_id','=','u.id')
            ->where(function($q)use($account){
                if($account){
                    $q->where('u.account_number','=',$account)->orWhere('u.email','=',$account);
                }
            })->where($where)
            ->select(['u.id as uid','u.account_number','u.email','u.phone','c.new_currency_name','lh_sending_order.*'])
            ->orderBy('lh_sending_order.id','desc')
            ->paginate($limit);
        foreach ($res->items() as &$arr){
            if ($arr->status == 1){
                $arr->remain_day = $arr->day;
            }elseif($arr->status == 2){
                $arr->remain_day = $arr->day - floor((time()-strtotime($arr->updated_at))/86400);
            }else{
                $arr->remain_day = '';
            }
        }
        return $this->layuiData($res);

    }
     public function updateOrder(Request $request){
         $id = $request->get('id');
         $exam_status = $request->get('status');
         $order = DB::table('lh_sending_order')->where('id',$id)->first();
         if (!$order){
             return $this->error('该币不存在');
         }
         if($order->status != 1 && $order->exam_status != 3){
             return $this->error('只有待审核状态才能修改订单状态！');
         }
         DB::beginTransaction();
         try{
             if($exam_status == 1){
                 //扣除用户USDT
                 $legal = UsersWallet::where("user_id", $order->user_id)
                     ->where("currency", $order->currency_id) //usdt
                     ->lockForUpdate()
                     ->first();
                 $result = change_wallet_balance(
                    $legal,
                    2,
                    -$order->amount,
                    AccountLog::SEND_CURRENCY,
                    '新币申购', //锁仓
                    false,
                    0,
                    0,
                    serialize([])
                    );
                 if (!$result) throw new \Exception('修改订单失败，稍后再试或者联系技术');
             }else{
                 DB::table('lh_sending_config')->where('id',$order->config_id)->increment('last_num',$order->new_currency_num);
             }
             DB::table('lh_sending_order')->where('id',$id)->update(['exam_status'=>$exam_status]);
             DB::commit();
             return $this->success('审核成功');
         }catch (\Exception $e){
             DB::rollBack();
             return $this->error($e->getMessage());
         }

     }
     public function checkOrder(Request $request){
         $configId = $request->get('id');
         return view('admin.send.check_order',['id' => $configId]);
     }
     public function depositConfig(Request $request){
        $currencyId = $request->get('currency_id');
        $limit = $request->get('limit', 20);
        $where = [];
        if($where){
            $where['currency_id'] = $currencyId;
        }
        $list = DB::table('lh_sending_config')->join('currency','currency.id','=','currency_id')->where($where)->select(['currency.name as currency_name','lh_sending_config.*'])->orderBy('lh_sending_config.id', 'asc')->paginate($limit);
//        foreach ($list->items() as &$arr){
//            $arr->day = floor((strtotime($arr->send_end)-strtotime($arr->send_start))/86400);
//        }
        return $this->layuiData($list);
    }
    public function addConfig(Request $request){

        $currencyId = $request->get('currency_id');
        $new_currency_name = $request->get('new_currency_name');
        $change_rate = $request->get('change_rate');
        $start_time = $request->get('start_time');
        $online_time = $request->get('online_time');
        $num = $request->get('num');
        $day = $request->get('day');
        $buy_num = $request->get('buy_num');
        $interest_rate = $request->get('interest_rate');
        $predict_rate = $request->get('predict_rate');
        $introduction = $request->get('introduction');

        $res = DB::table('lh_sending_config')->where('new_currency_name',$new_currency_name)->first();
        if($res){
            return $this->error('该币已经存在!');
        }
        DB::table('lh_sending_config')->insert([
            'new_currency_name' => $new_currency_name,
            'change_rate' => $change_rate,
            'currency_id' => $currencyId,
            'send_start' => $start_time,
            'online_time' => $online_time,
            'num' => $num,
            'day' => $day,
            'buy_num' => $buy_num,
            'last_num' => $num,
            'interest_rate' => $interest_rate,
            'predict_rate' => $predict_rate,
            'introduction' => $introduction,
            'created_at' => date('Y-m-d H:i:s')
        ]);
        return $this->success('创建成功');
    }

     public function depositConfigView(){
        return view('admin.send.config');
    }
    public function depositConfigAddView(){
        $currency = Currency::all();
         return view('admin.send.config_add',['currencies'=>$currency]);
    }
    public function depositConfigEditView(Request $request){
        $configId = $request->get('id');
        $model = DB::table('lh_sending_config')->where('id',$configId)->first();
        $currency = Currency::where('id',$model->currency_id)->first();
        $model->currency_name = $currency->name;
        $currency = Currency::all();
         return view('admin.send.config_edit',['model' => $model,'currencies'=>$currency]);
    }
    public function depositConfigDelete(Request $request){
        $configId = $request->get('id');
        //有申购订单不能修改
        $order = DB::table('lh_sending_order')->where('config_id',$configId)->first();
        if ($order){
            return $this->error('该币种已经有购买订单，不能删除');
        }
        DB::table('lh_sending_config')->where('id',$configId)->delete();
        return $this->success('删除成功');
    }
    
    
    public function editConfig(Request $request){
        $configId = $request->get('id');
        $new_currency_name = $request->get('new_currency_name');
        $change_rate = $request->get('change_rate');
        $start_time = $request->get('start_time');
        $online_time = $request->get('online_time');
        $num = $request->get('num');
        $day = $request->get('day');
        $buy_num = $request->get('buy_num');
        $interest_rate = $request->get('interest_rate');
        $predict_rate = $request->get('predict_rate');
        $introduction = $request->get('introduction');
        $model = DB::table('lh_sending_config')->where('id',$configId)->first();
        if(!$model){
            return $this->error('没有此币种');
        }
        //有申购订单不能修改
        $order = DB::table('lh_sending_order')->where('config_id',$configId)->first();
        if ($order){
            return $this->error('该币种已经有购买订单，不能编辑');
        }
        $res = DB::table('lh_sending_config')->where('new_currency_name',$new_currency_name)->first();
        if($res && $res->id != $configId){
            return $this->error('该币种名称已存在');
        }
        DB::table('lh_sending_config')->where('id',$configId)->update([
            'new_currency_name' => $new_currency_name,
            'change_rate' => $change_rate,
            'send_start' => $start_time,
            'online_time' => $online_time,
            'num' => $num,
            'day' => $day,
            'buy_num' => $buy_num,
            'interest_rate' => $interest_rate,
            'predict_rate' => $predict_rate,
            'introduction' => $introduction,
            'updated_at' => date('Y-m-d H:i:s')
        ]);
        return $this->success('编辑成功');
    }
    public function unlockOrderView(){
        return view('admin.send.unlock_order');
    }
    public function recommend(Request $request){
        $configId = $request->get('id');
        $model = DB::table('lh_sending_config')->where('id',$configId)->first();
        return view('admin.send.recommend',['model' => $model]);
    }
    public function updateRecommend(Request $request){
        $configId = $request->get('id');
        $is_recommend = $request->get('is_recommend');
        $recommend_title = $request->get('recommend_title');
        $recommend_content = $request->get('recommend_content');
        $update = [];
        if (!empty($recommend_title)){
            $update['recommend_title'] = $recommend_title;
        }
        if (!empty($recommend_content)){
            $update['recommend_content'] = $recommend_content;
        }
        if ($is_recommend == 1){
            DB::table('lh_sending_config')->where('is_recommend',1)->update(['is_recommend'=>2]);
        }
        $update['is_recommend'] = $is_recommend;
        DB::table('lh_sending_config')->where('id',$configId)->update($update);
        return $this->success('操作成功');
    }
    public function checkView(){
        return view('admin.send.check');
    }
    public function checkList(Request $request)
    {
        $currencyId = $request->get('currency_id');
        $account = $request->get('account');
        $status = $request->get('status');
        $limit = $request->get('limit', 20);
        $where = [];
        if ($status) {
            $where['status'] = $status;
        }
        if ($account) {
            $where['user_name'] = $account;
        }
        $list = DB::table('lh_sending_check')
            ->join('lh_sending_config', 'lh_sending_config.id', '=', 'config_id')
            ->where($where)
            ->select(['lh_sending_config.new_currency_name as currency_name', 'lh_sending_check.*'])
            ->orderBy('lh_sending_check.id', 'desc')
            ->paginate($limit);
        return $this->layuiData($list);
    }
    public function checkUpdate(Request $request){

        $id = $request->get('id', 0);
        $check = DB::table('lh_sending_check')->where('id',$id)->first();
        $update = [];
        if (empty($check)) {
            return $this->error('参数错误');
        }
        if ($check->status == 1) {
            $status = 2;
        } else if ($check->status == 2) {
            $status = 1;
        } else {
            $status = 1;
        }
        $update['status'] =  $status;
        $update['updated_at'] = date('Y-m-d H:i:s');
        try {
            DB::table('lh_sending_check')->where('id',$id)->update($update);
            return $this->success('操作成功');
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage());
        }
    }
}
