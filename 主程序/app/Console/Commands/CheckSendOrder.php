<?php

namespace App\Console\Commands;

use App\AccountLog;
use App\LhSendOrder;
use App\UsersWallet;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

//每天凌晨执行一次
class CheckSendOrder extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'check_send_order';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '检查并结算申购订单';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //更新赎回状态
        $config = DB::table('lh_sending_config')->where('last_num','0.0000')->first();
        if ($config){
            //如果存在待审核状态就说明赎回条件还未满足
            $where = [
                'config_id' => $config->id,
                'status' => '1',
                'exam_status'=> '3'
            ];
            $unchecks = DB::table('lh_sending_order')->where($where)->get()->toArray();

            if (!$unchecks){
                $checkWhere = [
                    'config_id' => $config->id,
                    'status' => '1',
                    'exam_status'=> '1'
                ];
                $list =  DB::table('lh_sending_order')->where($checkWhere)->get();
                if ($list){
                    foreach ($list as $val){
                        DB::table('lh_sending_order')
                            ->where('id',$val->id)
                            ->update(['status'=>2,
                                'updated_at'=>date('Y-m-d H:i:s')]);
                    }
                }
            }
        }
        //结算数据
        $orders = LhSendOrder::query()->where('status',2)->get()->toArray();
        if ($orders){
            foreach ($orders as $order){
                $days = floor((time()-strtotime($order['updated_at'])) / 86400);
                if ($days >= $order['day']){
                    //结算订单
                    DB::beginTransaction();
                    try{
                        $legal = UsersWallet::where("user_id", $order['user_id'])
                            ->where("currency", $order['currency_id']) //usdt
                            ->lockForUpdate()
                            ->first();
                        $temp = bcadd($order['new_currency_num'] , $order['interest'],4);
                        $amount = bcmul($temp,$order['change_rate'],4);
                        $result = change_wallet_balance(
                            $legal,
                            2,
                            $amount,
                            AccountLog::SEND_CURRENCY_IN,
                            '新币申购收益',
                            false,
                            0,
                            0,
                            serialize([])
                        );
                        $original_interest = bcsub($amount,$order['amount'],4);
                        DB::table('lh_sending_order')
                            ->where('id',$order['id'])
                            ->update(['status'=>3,
                                'updated_at'=>date('Y-m-d H:i:s'),
                                'original_interest'=>$original_interest]);
                        DB::commit();
                    }catch (\Exception $e){
                        DB::rollBack();
                        var_dump($e->getMessage());exit();
                    }
                }else{
                    continue;
                }
            }
        }
        echo 'ok';exit();
    }

}
?>