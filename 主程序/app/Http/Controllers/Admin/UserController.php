<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\Agent;
use App\DAO\UserDAO;
use App\DAO\BlockChain;
use Maatwebsite\Excel\Facades\Excel;
use App\Utils\RPC;
use App\{Address, AccountLog, Currency, IdCardIdentit, Setting, Users, UserCashInfo, UserReal, UsersWallet};
use App\WalletLog;

class UserController extends Controller
{
    public function index()
    {
        return view("admin.user.index");
    }

    //导出用户列表至excel
    public function csv(Request $request)
    {
        // $limit = $request->get('limit', 10);
        $account = $request->get('account', '');

        $list = new Users();
        $list = $list->leftjoin("user_real", "users.id", "=", "user_real.user_id");
        //var_dump($n);die;
        if (!empty($account)) {
            $list = $list->where("phone", 'like', '%' . $account . '%')
                ->orwhere('email', 'like', '%' . $account . '%')
                ->orWhere('account_number', 'like', '%' . $account . '%');
        }
        $list = $list->select("users.*", "user_real.card_id")->orderBy('users.id', 'desc')->get();
        $data = $list;

        return Excel::create('用户数据', function ($excel) use ($data) {
            $excel->sheet('用户数据', function ($sheet) use ($data) {
                $sheet->cell('A1', function ($cell) {
                    $cell->setValue('ID');
                });
                $sheet->cell('B1', function ($cell) {
                    $cell->setValue('账户名');
                });
                /*
                $sheet->cell('C1', function ($cell) {
                    $cell->setValue('团队充值业绩');
                });
                $sheet->cell('D1', function ($cell) {
                    $cell->setValue('直推实名人数');
                });
                $sheet->cell('E1', function ($cell) {
                    $cell->setValue('团队实名人数');
                });
                */
                $sheet->cell('F1', function ($cell) {
                    $cell->setValue('邀请码');
                });
                $sheet->cell('G1', function ($cell) {
                    $cell->setValue('用户状态');
                });
                $sheet->cell('H1', function ($cell) {
                    $cell->setValue('头像');
                });
                $sheet->cell('I1', function ($cell) {
                    $cell->setValue('注册时间');
                });
                if (!empty($data)) {
                    foreach ($data as $key => $value) {
                        $i = $key + 2;
                        $sheet->cell('A' . $i, $value['id']);
                        $sheet->cell('B' . $i, $value['account_number']);
                        $sheet->cell('C' . $i, $value['top_upnumber']);
                        $sheet->cell('D' . $i, $value['zhitui_real_number']);
                        $sheet->cell('E' . $i, $value['real_teamnumber']);
                        $sheet->cell('F' . $i, $value['extension_code']);
                        $sheet->cell('G' . $i, $value['status']);
                        $sheet->cell('H' . $i, $value['head_portrait']);
                        $sheet->cell('I' . $i, $value['time']);
                    }
                }
            });
        })->download('xlsx');
    }

    //用户列表
    public function lists(Request $request)
    {
        $limit = $request->get('limit', 10);
        $account = $request->get('account', '');
        $name = $request->get('name', '');
        $risk = $request->get('risk', -2);

        $list = new Users();
        $list = $list->leftjoin("user_real", "users.id", "=", "user_real.user_id");

        if (!empty($account)) {
            $list = $list->where("phone", 'like', '%' . $account . '%')
                ->orwhere('email', 'like', '%' . $account . '%')
                ->orWhere('account_number', 'like', '%' . $account . '%');
        }

        $list = $list->when($name != '', function ($query) use ($name) {
            $query->whereHas('userReal', function ($query) use ($name) {
                $query->where('name', $name);
            });
        });

        if ($risk != -2) {
            $list = $list->where('risk', $risk);
        }

        $list = $list->select("users.*", "user_real.card_id")
        ->orderBy('users.id', 'desc')
        ->paginate($limit);

        $items = $list->getCollection();
        $items->transform(function ($item, $key) {
            return $item->append('risk_name');
        });
        $list->setCollection($items);

        $USDT_id = Currency::where('name', 'USDT')->first()->id;


        return response()->json(['code' => 0, 'data' => $list->items(), 'count' => $list->total()]);
    }

    public function edit(Request $request)
    {
        $id = $request->get('id', 0);
        if (empty($id)) {
            return $this->error("参数错误");
        }

        $result = new Users();
        $result = $result->leftjoin("user_real", "users.id", "=", "user_real.user_id")->select("users.*", "user_real.card_id")->find($id);
        //var_dump($result->toArray());die;
        $res = UserCashInfo::where('user_id', $id)->first();

        return view('admin.user.edit', ['result' => $result, 'res' => $res]);
    }
    
    //编辑用户信息  
    public function doedit()
    {
       // $phone = Input::get("phone");
       // $email = Input::get("email");
        $card_id = Input::get("card_id");
        $password = Input::get("password");
        $account_number = Input::get("account_number");
        $pay_password = Input::get("pay_password");
        $bank_account = Input::get("bank_account");
        $bank_name = Input::get("bank_name");
        $alipay_account = Input::get("alipay_account");
        $wechat_nickname = Input::get("wechat_nickname");
        $wechat_account = Input::get("wechat_account");
        $is_service = Input::get("is_service",0)??0;
        
        $parent_id = Input::get("parent_id");   //上级代理ID
        
        $risk = Input::get('risk', 0);

        $id = Input::get("id");
        if (empty($id)) return $this->error("参数错误");

        $user = Users::find($id);
        if (empty($user)) {
            return $this->error("数据未找到");
        }

        $user->account_number = $account_number;

        if (!empty($password)) {
            $user->password = Users::MakePassword($password);
        }
        if (!empty($pay_password)) {
            if (mb_strlen($pay_password) < 6 || mb_strlen($pay_password) > 16) {
                return $this->error('密码只能在6-16位之间');
            }
            //var_dump(Users::MakePassword($pay_password, $user->type));exit;
            $user->pay_password = Users::MakePassword($pay_password, $user->type);

        }
        
        
        
        
        if(!empty($parent_id)){
            $parents = Users::find($parent_id);
            if (empty($parents)) {
                return $this->error("上级ID错误");
            }
            
            $user->parent_id = $parent_id;
            
            $user->parents_path = UserDAO::getRealParentsPath($user); // 生成parents_path
                                                                        
            // 代理商节点id。标注该用户的上级代理商节点。这里存的代理商id是agent代理商表中的主键，并不是users表中的id。
            $user->agent_note_id = Agent::reg_get_agent_id_by_parentid($parent_id);
            // 代理商节点关系
            $user->agent_path = Agent::agentPath($parent_id);
            
        }
        
        
        
        
        if (!empty($is_service)) {
            $has_service = Users::where('is_service',1)->first();
            if($has_service){
                return $this->error("只允许设置一个客服,当前客服账号:{$has_service->account_number}");
            }
            $user->is_service = $is_service;
        }
        
        $user->risk = $risk;
        DB::beginTransaction();

        try {
            
            $user->save();
            $cashinfo = UserCashInfo::where('user_id', $id)->first();
            if (empty($cashinfo)) {
                $cashinfo = new UserCashInfo();
                $cashinfo->user_id = $id;
            }

            $cashinfo->bank_name = $bank_name ?? '';
            $cashinfo->bank_account = $bank_account ?? '';
            $cashinfo->alipay_account = $alipay_account ?? '';
            $cashinfo->wechat_account = $wechat_account ?? '';
            $cashinfo->wechat_nickname = $wechat_nickname ?? '';
            $cashinfo->save();
            //更改身份证号
            if (!empty($card_id)) {
                $real = UserReal::where("user_id", "=", $id)->first();
                $real->card_id = $card_id;
                $real->save();
            }
            DB::commit();
            return $this->success('编辑成功');
        } catch (\Exception $ex) {
            DB::rollBack();
            return $this->error($ex->getMessage());
        }
    }

    public function lockUser(Request $request)
    {
        $id = $request->get('id', 0);
        if (empty($id)) {
            return $this->error("参数错误");
        }
        $result = Users::find($id);
        //
        // $res=UserCashInfo::where('user_id',$id)->first();
        return view('admin.user.lock', ['result' => $result]);
    }

    public function doLock(Request $request)
    {
        $id = $request->get('id', 0);
        $date = $request->get('date', 0);
        $status = $request->get('status', 0);

        if (empty($id)) {
            return $this->error('参数错误');
        }
        $user = Users::find($id);
        if (empty($user)) {
            return $this->error('参数错误');
        }
        if (empty($date)) {
            return $this->error('缺少时间！');
        }
        $users = new Users();
        $result = $users->lockUser($user, $status, $date);
        if (!$result) {
            return $this->error('锁定失败');
        }
        return $this->success('操作成功');
    }

    public function del(Request $request)
    {
        $id = $request->get('id');
        $user = Users::getById($id);
        if (empty($user)) {
            $this->error("用户未找到");
        }
        try {
            $user->delete();
            return $this->success('删除成功');
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage());
        }
    }

    public function lock(Request $request)
    {
        $id = $request->get('id', 0);

        $user = Users::find($id);
        if (empty($user)) {
            return $this->error('参数错误');
        }
        if ($user->status == 1) {
            $user->status = 0;
        } else {
            $user->status = 1;
        }
        try {
            $user->save();
            return $this->success('操作成功');
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage());
        }
    }

    public function wallet(Request $request)
    {
        $id = $request->get('id', null);
        if (empty($id)) {
            return $this->error('参数错误');
        }
        return view("admin.user.user_wallet", ['user_id' => $id]);
    }

    public function walletList(Request $request)
    {
        $limit = $request->get('limit', 10);
        $user_id = $request->get('user_id', null);
        if (empty($user_id)) {
            return $this->error('参数错误');
        }
        $list = new UsersWallet();
        $list = $list->where('user_id', $user_id)->orderBy('id', 'desc')->paginate($limit);

        return response()->json(['code' => 0, 'data' => $list->items(), 'count' => $list->total()]);
    }

//钱包锁定状态
    public function walletLock(Request $request)
    {
        $id = $request->get('id', 0);

        $wallet = UsersWallet::find($id);
        if (empty($wallet)) {
            return $this->error('参数错误');
        }
        if ($wallet->status == 1) {
            $wallet->status = 0;
        } else {
            $wallet->status = 1;
        }
        try {
            $wallet->save();
            return $this->success('操作成功');
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage());
        }
    }

    /*
     * 调节账户
     * */
    public function conf(Request $request)
    {
        $id = $request->get('id', 0);
        if (empty($id)) {
            return $this->error('参数错误');
        }
        $result = UsersWallet::find($id);
        if (empty($result)) {
            return $this->error('无此结果');
        }
        $account = Users::where('id', $result->user_id)->value('phone');
        if (empty($account)) {
            $account = Users::where('id', $result->user_id)->value('email');
        }
        $result['account'] = $account;
        return view('admin.user.conf', ['results' => $result]);
    }

    //调节账号  type  1法币交易余额  2法币交易锁定余额 3币币交易余额 4币币交易锁定余额  5合约交易余额 6合约交易锁定余额
    public function postConf(Request $request)
    {
        $message = [
            'required' => ':attribute 不能为空',
        ];
        $validator = Validator::make($request->all(), [
            'way' => 'required',   //增加 increment；减少 decrement
            'type' => 'required',       //原生余额1；消费余额2；增值余额3；可增加其他账户调节字段
            'conf_value' => 'required',       //值
        ], $message);

        //以上验证通过后 继续验证
        $validator->after(function ($validator) use ($request) {

            $wallet = UsersWallet::find($request->get('id'));
            if (empty($wallet)) {
                return $validator->errors()->add('isUser', '没有此钱包');
            }
            $user = Users::getById($wallet->user_id);
            if (empty($user)) {
                return $validator->errors()->add('isUser', '没有此用户');
            }
            $way = $request->get('way', 'increment');
            $type = $request->get('type', 1);
            $conf_value = $request->get('conf_value', 0);
            if ($type == 1 && $way == 'decrement') {
                if ($wallet->legal_balance < $conf_value) {
                    return $validator->errors()->add('isBalance', '此钱包法币交易余额不足' . $conf_value . '元');
                }
            } elseif ($type == 2 && $way == 'decrement') {
                if ($wallet->lock_legal_balance < $conf_value) {
                    return $validator->errors()->add('isBalance', '此钱包法币交易锁定余额不足' . $conf_value . '元');
                }
            } elseif ($type == 3 && $way == 'decrement') {
                if ($wallet->change_balance < $conf_value) {
                    return $validator->errors()->add('isBalance', '此钱包币币交易余额不足' . $conf_value . '元');
                }
            } elseif ($type == 4 && $way == 'decrement') {
                if ($wallet->lock_change_balance < $conf_value) {
                    return $validator->errors()->add('isBalance', '此钱包币币交易锁定余额不足' . $conf_value . '元');
                }
            } elseif ($type == 5 && $way == 'decrement') {
                if ($wallet->lever_balance < $conf_value) {
                    return $validator->errors()->add('isBalance', '此钱包闪兑交易余额不足' . $conf_value . '元');
                }
            } elseif ($type == 6 && $way == 'decrement') {
                if ($wallet->lock_lever_balance < $conf_value) {
                    return $validator->errors()->add('isBalance', '此钱包闪兑交易锁定余额不足' . $conf_value . '元');
                }
            }elseif ($type == 7 && $way == 'decrement') {
                if ($wallet->micro_balance < $conf_value) {
                    return $validator->errors()->add('isBalance', '此钱包秒合约余额不足' . $conf_value . '元');
                }
            } elseif ($type == 8 && $way == 'decrement') {
                if ($wallet->lock_micro_balance < $conf_value) {
                    return $validator->errors()->add('isBalance', '此钱包秒合约锁定余额不足' . $conf_value . '元');
                }
            }




        });
        //如果验证不通过
        if ($validator->fails()) {
            return $this->error($validator->errors()->first());
        }

        $id = $request->get('id', null);
        $way = $request->get('way', 'increment');
        $type = $request->get('type', 1);
        $conf_value = $request->get('conf_value', 0);
        $info = $request->get('info', ':');
        $wallet = UsersWallet::find($id);
        $user = Users::getById($wallet->user_id);


        $data_wallet['wallet_id'] = $id;
        $data_wallet['create_time'] = time();
        DB::beginTransaction();
        try {
            if ($type == 1) {
                $data_wallet['balance_type'] = 1;
                $data_wallet['lock_type'] = 0;
                $data_wallet['before'] = $wallet->legal_balance;
                if ($way == 'increment') {
                    $data_wallet['change'] = $conf_value;
                    $data_wallet['after'] = bc_add($wallet->legal_balance, $conf_value, 5);
                    $wallet->increment('legal_balance', $conf_value);
                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LEGAL_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LEGAL_BALANCE, 'currency' => $wallet->currency], $data_wallet);
                } else {
                    $data_wallet['change'] = $conf_value * -1;
                    $data_wallet['after'] = bc_sub($wallet->legal_balance, $conf_value, 5);
                    $wallet->decrement('legal_balance', $conf_value);
                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value * -1, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LEGAL_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LEGAL_BALANCE, 'currency' => $wallet->currency], $data_wallet);
                }
            } elseif ($type == 2) {
                $data_wallet['balance_type'] = 1;
                $data_wallet['lock_type'] = 1;
                $data_wallet['before'] = $wallet->lock_legal_balance;
                if ($way == 'increment') {
                    $data_wallet['change'] = $conf_value;
                    $data_wallet['after'] = bc_add($wallet->lock_legal_balance, $conf_value, 5);
                    $wallet->increment('lock_legal_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LOCK_LEGAL_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LOCK_LEGAL_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                } else {
                    $data_wallet['change'] = $conf_value * -1;
                    $data_wallet['after'] = bc_sub($wallet->lock_legal_balance, $conf_value, 5);
                    $wallet->decrement('lock_legal_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value * -1, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LOCK_LEGAL_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LOCK_LEGAL_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                }
            } elseif ($type == 3) {
                $data_wallet['balance_type'] = 2;
                $data_wallet['lock_type'] = 0;
                $data_wallet['before'] = $wallet->change_balance;
                if ($way == 'increment') {
                    $data_wallet['change'] = $conf_value;
                    $data_wallet['after'] = bc_add($wallet->change_balance, $conf_value, 5);
                    $wallet->increment('change_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_CHANGE_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_CHANGE_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                } else {
                    $data_wallet['change'] = $conf_value * -1;
                    $data_wallet['after'] = bc_sub($wallet->change_balance, $conf_value, 5);
                    $wallet->decrement('change_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value * -1, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_CHANGE_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_CHANGE_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                }
            } elseif ($type == 4) {
                $data_wallet['balance_type'] = 2;
                $data_wallet['lock_type'] = 1;
                $data_wallet['before'] = $wallet->lock_change_balance;
                if ($way == 'increment') {
                    $data_wallet['change'] = $conf_value;
                    $data_wallet['after'] = bc_add($wallet->lock_change_balance, $conf_value, 5);
                    $wallet->increment('lock_change_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LOCK_CHANGE_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LOCK_CHANGE_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                } else {
                    $data_wallet['change'] = $conf_value * -1;
                    $data_wallet['after'] = bc_sub($wallet->lock_change_balance, $conf_value, 5);
                    $wallet->decrement('lock_change_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value * -1, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LOCK_CHANGE_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LOCK_CHANGE_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                }
            } elseif ($type == 5) {
                $data_wallet['balance_type'] = 3;
                $data_wallet['lock_type'] = 0;
                $data_wallet['before'] = $wallet->lever_balance;
                if ($way == 'increment') {
                    $data_wallet['change'] = $conf_value;
                    $data_wallet['after'] = bc_add($wallet->lever_balance, $conf_value, 5);
                    $wallet->increment('lever_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LEVER_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LEVER_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                } else {
                    $data_wallet['change'] = $conf_value * -1;
                    $data_wallet['after'] = bc_sub($wallet->lever_balance, $conf_value, 5);
                    $wallet->decrement('lever_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value * -1, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LEVER_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LEVER_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                }
            } elseif ($type == 6) {
                $data_wallet['balance_type'] = 3;
                $data_wallet['lock_type'] = 1;
                $data_wallet['before'] = $wallet->lock_lever_balance;
                if ($way == 'increment') {
                    $data_wallet['change'] = $conf_value;
                    $data_wallet['after'] = bc_add($wallet->lock_lever_balance, $conf_value, 5);
                    $wallet->increment('lock_lever_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LOCK_LEVER_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LOCK_LEVER_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                } else {
                    $data_wallet['change'] = $conf_value * -1;
                    $data_wallet['after'] = bc_sub($wallet->lock_lever_balance, $conf_value, 5);
                    $wallet->decrement('lock_lever_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value * -1, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LOCK_LEVER_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LOCK_LEVER_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                }
            }elseif ($type == 7) {
                $data_wallet['balance_type'] = 4;
                $data_wallet['lock_type'] = 0;
                $data_wallet['before'] = $wallet->micro_balance;
                if ($way == 'increment') {
                    $data_wallet['change'] = $conf_value;
                    $data_wallet['after'] = bc_add($wallet->micro_balance, $conf_value, 5);
                    $wallet->increment('micro_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_MICRO_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_MICRO_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                } else {
                    $data_wallet['change'] = $conf_value * -1;
                    $data_wallet['after'] = bc_sub($wallet->micro_balance, $conf_value, 5);
                    $wallet->decrement('micro_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value * -1, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_MICRO_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_MICRO_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                }
            } elseif ($type == 8) {
                $data_wallet['balance_type'] = 4;
                $data_wallet['lock_type'] = 1;
                $data_wallet['before'] = $wallet->lock_micro_balance;
                if ($way == 'increment') {
                    $data_wallet['change'] = $conf_value;
                    $data_wallet['after'] = bc_add($wallet->lock_micro_balance, $conf_value, 5);
                    $wallet->increment('lock_micro_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LOCK_MICRO_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LOCK_MICRO_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                } else {
                    $data_wallet['change'] = $conf_value * -1;
                    $data_wallet['after'] = bc_sub($wallet->lock_micro_balance, $conf_value, 5);
                    $wallet->decrement('lock_micro_balance', $conf_value);

                    AccountLog::insertLog(['user_id' => $user->id, 'value' => $conf_value * -1, 'info' => AccountLog::getTypeInfo(AccountLog::ADMIN_LOCK_MICRO_BALANCE) . ":" . $info, 'type' => AccountLog::ADMIN_LOCK_MICRO_BALANCE, 'currency' => $wallet->currency], $data_wallet);

                }
            }
            //$wallet->save();
            //$user->save();
            DB::commit();
            return $this->success('操作成功');
        } catch (\Exception $e) {
            DB::rollback();
            return $this->error($e->getMessage());
        }
    }

    //删除钱包
    public function delw(Request $request)
    {
        $id = $request->get('id');
        $wallet = UsersWallet::find($id);
        if (empty($wallet)) {
            $this->error("钱包未找到");
        }
        try {
            $wallet->delete();
            return $this->success('删除成功');
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage());
        }
    }

    /*
     * 提币地址信息
     * */
    public function address(Request $request)
    {
        $id = $request->get('id', 0);
        if (empty($id)) {
            return $this->error('参数错误');
        }
        $result = UsersWallet::find($id);
        if (empty($result)) {
            return $this->error('无此结果');
        }


        $list = Address::where('user_id', $result->user_id)->where('currency', $result->currency)->get()->toArray();

        return view('admin.user.address', ['results' => $result, 'list' => $list]);
    }
      /*
     * 修改提币地址信息
     * */
    public function addressEdit(Request $request)
    {
        $user_id = $request->get('user_id', 0);
        $currency = $request->get('currency', 0);
        $total_arr = $request->get('total_arr', '');
        if (empty($user_id) || empty($currency)) {
            return $this->error('参数错误');
        }
        DB::beginTransaction();
        try {
            Address::where('user_id', $user_id)->where('currency', $currency)->delete();
            if (!empty($total_arr)) {
                foreach ($total_arr as $key => $val) {
                    $ads = new Address();
                    $ads->user_id = $user_id;
                    $ads->currency = $currency;
                    $ads->address = $val['address'];
                    $ads->notes = $val['notes'];
                    $ads->save();
                }
            }
            DB::commit();
            return $this->success('修改提币地址成功');
        } catch (\Exception $e) {
            DB::rollback();
            return $this->error($e->getMessage());
        }

    }

    //加入黑名单
    public function blacklist(Request $request)
    {
        $id = $request->get('id', 0);

        $user = Users::find($id);
        if (empty($user)) {
            return $this->error('参数错误');
        }
        if ($user->is_blacklist == 1) {
            $user->is_blacklist = 0;
        } else {
            $user->is_blacklist = 1;
        }
        try {
            $user->save();
            return $this->success('操作成功');
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage());
        }
    }

    public function candyConf(Request $request, $id)
    {
        $user = Users::find($id);
        return view('admin.user.candy_conf')->with('user', $user);
    }

    public function postCandyConf(Request $request, $id)
    {
        $user = Users::find($id);
        $way = $request->input('way', 0);
        $change = $request->input('change', 0);
        $memo = $request->input('memo', '');
        if (!in_array($way, [1, 2])) {
            return $this->error('调整方式传参错误');
        }
        if ($change <= 0) {
            return $this->error('调整金额必须大于0');
        }
        if ($way == 2) {
            $change = bc_mul($change, -1);
        }
        $result = change_user_candy($user, $change, AccountLog::ADMIN_CANDY_BALANCE, '后台调整' . ($way == 2 ? '减少' : '增加') . '通证 ' . $memo);
        return $result === true ? $this->success('调整成功') : $this->error('调整失败:' . $result);
    }

    //链上余额归集到总账号
    public function balance(Request $request)
    {
        exit('功能被禁用');
        set_time_limit(0);
        $id = $request->get('id', 0);//钱包id
        $wallet = UsersWallet::find($id);
        if (empty($wallet)) {
            return $this->error('钱包不存在');
        }
        $btc_chain_balance = 0;
        $currency = Currency::find($wallet->currency);
        $total_account = $currency->total_account;
        $user_address = $wallet->address;
        $number = $wallet->old_balance;
        $lessen = bc_pow(10, 8);
        //$origin_number = $number = $wallet->old_balance;
        $btc_key = decrypt($wallet->private);
        $btc_id = Currency::where('name', 'BTC')->first()->id;
        $fee = bc_mul($currency->chain_fee, bc_pow(10, $currency->decimal_scale ?? 8));
        if ($id != $btc_id) {
            $btc_wallet = UsersWallet::where('address', $user_address)
                ->where('currency', $btc_id)
                ->first();
            $usdt_balance_url = 'http://47.92.148.83:82/wallet/usdt/balance?address=' . $user_address;
            $content = RPC::apihttp($usdt_balance_url);
            $content = json_decode($content, true);
            if (isset($content['code']) && $content['code'] == 0 && isset($content['data'])) {
                $origin_number = $content['data']['balance'];
            } else {
                return $this->error('获取USDT链上余额失败:' . var_export($content, true));
            }
        } else {
            $btc_wallet = $wallet;
        }
        $btc_balance_url = 'http://47.92.148.83:82/wallet/btc/balance?address=' . $user_address;
        $btc_content = RPC::apihttp($btc_balance_url);
        $btc_content = json_decode($btc_content, true);
        if (isset($btc_content["code"]) && $btc_content["code"] == 0) {
            $btc_chain_balance = $btc_content['data']['balance'];
            if ($id == $btc_id) {
                $origin_number = bc_sub($btc_chain_balance, $fee);
            }
            $btc_chain_balance = bc_div($btc_chain_balance, $lessen, 8);
        } else {
            return $this->error('获BTC取链上余额失败');
        }

        if (bc_comp($btc_chain_balance, $currency->chain_fee) < 0) {
            return $this->error('当前账户BTC余额不足,请充值之后再归拢');
        }

        $origin_number = bc_div($origin_number, $lessen);

        $old_balance = 0;
        if (empty($total_account)) {
            return $this->error('usdt币种设置错误');
        }
        if ($currency->type == 'usdt') {
//            var_dump($currency->type);var_dump($total_account);var_dump($origin_number);var_dump($user_address);var_dump($btc_key);var_dump($fee);die;
            $content = BlockChain::transfer($currency->type, $currency->type, $total_account, $origin_number, $user_address, $btc_key, 1, $fee);
        } elseif ($currency->type == 'btc') {
            $content = BlockChain::transfer($currency->type, $currency->type, $total_account, $origin_number, $user_address, $btc_key, 1, $fee);
        } else {
            return $this->error('只支持usdt、btc归拢');
        }
        //记录错误日志
        Log::useDailyFiles(base_path('storage/logs/blockchain/collect'), 7);
        Log::critical('用户id:' . $wallet->user_id . ',币种:' . $currency->type . ',归拢:' . $origin_number, $content);
        if (isset($content["errcode"]) &&  $content["errcode"] == "0" && isset($content['txid'])) {
            try {
                DB::beginTransaction();
                $wallet = UsersWallet::lockForUpdate()->find($id);
                //如果转的是usdt，需要扣btc
                $btc_wallet->refresh();
                if ($currency->type == 'usdt') {
                    //扣手续费不用更新old_balance，这样直接扣除可避免原打入的手续费被当作充值到账
                    $btc_wallet->old_balance = $btc_wallet->old_balance - $currency->chain_fee - 0.00000546;
                    $btc_wallet->save();
                }
                AccountLog::insertLog([
                    'user_id' => 0,
                    'value' => 0,
                    'info' => '对用户id' . $wallet->user_id . ',币种:' . $currency->type . ',归拢:' . $origin_number . ',交易哈希值:' . $content['txid'],
                    'type' => 881
                ]);
                $wallet->refresh();
                $wallet->old_balance = $old_balance;;
                $wallet->gl_time = time();
                $wallet->txid = $content['txid'];
                $wallet->save();
                DB::commit();
                return $this->success('归拢成功，请在30分钟后刷新余额');
            } catch (\Exception $ex) {
                DB::rollback();
                return $this->error($ex->getMessage());
            }
        } else {
            return $this->error(var_export($content, true));
        }
    }


    //向账户充btc手续费0.00006
    public function sendBtc(Request $request)
    {
        exit('功能被禁用');
        set_time_limit(0);
        $id = $request->get('id', 0);//钱包id
        $wallet = UsersWallet::find($id);
        if (empty($wallet)) {
            return $this->error('钱包不存在');
        }
        $user_address = $wallet->address;
        $currency = Currency::find($wallet->currency);
        $btc_id = Currency::where('name', 'BTC')->first()->id;
        // return $currency->id.'+'.$btc_id;
        if ($currency->id != $btc_id) {
            return $this->error('只支持btc账户');
        }
        $total_account = $currency->total_account;
        $key = $currency->key;
        $account = bc_mul($currency->chain_fee, 100000000, 0);
        $url = "http://47.92.148.83:82/wallet/btc/sendto?fromaddress=" . $total_account . "&toaddress=" . $user_address . "&privkey=" . $key . "&amount=" . $account;
        $content = file_get_contents($url);
        $content = @json_decode($content, true);
        if ($content['code'] == 0) {
            AccountLog::insertLog([
                'user_id' => 0,
                'value' => $currency->chain_fee,
                'info' => '向' . $wallet->user_id . '打手续费',
                'type' => 8888888
            ]);
            $wallet->old_balance = $wallet->old_balance + $currency->chain_fee;
            $wallet->gl_time = time();
            $wallet->save();
            return $this->success('转入手续费成功');
        } else {
            return $this->error('转入错误' . $content['msg']);
        }
    }

    public function batchRisk(Request $request)
    {
        try {
            $ids = $request->input('ids', []);
            $risk = $request->input('risk', 0);
            if (empty($ids)) {
                throw new \Exception('请先选择用户');
            }
            if (!in_array($risk, [-1, 0, 1])) {
                throw new \Exception('风控类型不正确');
            }
            $affect_rows = Users::whereIn('id', $ids)
                ->update([
                    'risk' => $risk,
                ]);
            return $this->success('本次提交:' . count($ids) . '条,设置成功:' . $affect_rows . '条');
        } catch (\Throwable $th) {
            return $this->error($th->getMessage());
        }
    }
    
     public function chargeList(Request $request){
	    $limit = $request->get('limit', 20);
	    
	    $account = $request->get('account_number','');
	    $type = $request->get('type', '');
	    $start_time = $request->get('start_time', '');
	    $end_time = $request->get('end_time', '');
	    
	    $list = DB::table('charge_req');
	    if (!empty($type)) {
	        if($type=='1'){ //未处理 1
	            $list = $list->where('charge_req.status', '=', 1);
	        }else if($type=='2'){   //已处理 2   3
	            $list = $list->where('charge_req.status', '>', 1);
	        }
        }
	    
        if (!empty($start_time)) {
            $list = $list->where('created_at', '>=', $start_time);
        }
        if (!empty($end_time)) {
            $list = $list->where('created_at', '<=', $end_time);
        }
	    if (!empty($account)) {
            $list = $list->where('users.account_number', '=', $account);
        }
	    $list = $list->join('users', 'users.id', '=', 'charge_req.uid')
            ->join('currency', 'currency.id', '=', 'charge_req.currency_id')
            ->select('charge_req.*', 'users.account_number', 'currency.name')
            ->orderBy('charge_req.id', 'desc')->paginate($limit);
        // $userWalletOut = new UsersWalletOut();
        // $userWalletOutList = $userWalletOut->orderBy('id', 'desc')->paginate($limit);
        // var_dump($list);exit;
        
        return $this->layuiData($list);
    }
	
	public function passReq(Request $request){
		$id = $request->get('id',0);
		 if(empty($id)){
            return $this->error('参数错误');
        }
		$req = Db::table('charge_req')->where(['id' => $id,'status'=> 1])->first();
		if(!$req){
			return $this->error('充值记录错误');
		}
		// return $this->success('充值成功');
		
		DB::beginTransaction();
        try {
    		//通过并加钱
    		DB::table('charge_req')->where('id',$id)->update(['status'=>2,'warn'=>1,'updated_at'=>date('Y-m-d H:i:s')]);
    		if($req->currency_id!='9999'){    //非银行卡充值方式要给对应钱包加钱
    		
    		    //增加余额
    		    //DB::table('users_wallet')->where(['currency'=>$req->currency_id,'user_id'=>$req->uid])->increment('change_balance',$req->amount);
    		    $user_wallet = UsersWallet::where('user_id',$req->uid)->where('currency',$req->currency_id)->lockForUpdate()->first();
    		    change_wallet_balance($user_wallet,2,$req->amount,AccountLog::ETH_EXCHANGE,'链上充币',false);
    		    
    		    //派发邀请佣金
    		    $user = Users::find($req->uid);
    		    
    		    $lv1 = Setting::getValueByKey('partner_ratio_lv1'); //第一级佣金比
    		    if($user['parent_id']>0 && $lv1>0){
    		        
	                $user_lv1 = Users::find($user['parent_id']);//找出上级
	                if($user_lv1){
	                    
        		        $amount_lv1 = round($req->amount*$lv1/100,8);   //第一级佣金
        		        $this->yongjing($user_lv1['id'],$amount_lv1,$req->currency_id,$req->uid);
        		        
        		        
        		        
        		        //第二级
        		        $lv2 = Setting::getValueByKey('partner_ratio_lv2'); //第二级佣金比
        		        if($user_lv1['parent_id']>0 && $lv2>0){
        		            
        		            $user_lv2 = Users::find($user_lv1['parent_id']);//找出上上级
        		            if($user_lv2){
        		                
        		                $amount_lv2 = round($req->amount*$lv2/100,8);   //第二级佣金
        		                $this->yongjing($user_lv2['id'],$amount_lv2,$req->currency_id,$req->uid);
        		                
        		                
        		                //第三级
                		        $lv3 = Setting::getValueByKey('partner_ratio_lv3'); //第三级佣金比
                		        if($user_lv2['parent_id']>0 && $lv3>0){
                		            
                		            $user_lv3 = Users::find($user_lv2['parent_id']);//找出上上上级
                		            if($user_lv3){
                		                
                		                $amount_lv3 = round($req->amount*$lv3/100,8);   //第三级佣金
                		                $this->yongjing($user_lv3['id'],$amount_lv3,$req->currency_id,$req->uid);
                		                
                		                
                		            }
                		            
                		        }
        		                
        		                
        		                
        		            }
        		            
        		        }
        		        
        		        
        		        
	                }
    		        
    		    }
    		    
    		    
    		    
    		    
    		}
    		
            DB::commit();
    		return $this->success('充值成功');
    		
        } catch (\Exception $ex) {
            
            DB::rollBack();
            //return $this->error('File:' . $ex->getFile() . ',Line:' . $ex->getLine() . ',Message:' . $ex->getMessage());
            return $this->error('参数错误');
            
        }
	}
	//充值提醒
    public function chargeCheck(){
        $req = Db::table('charge_req')->where(['warn'=> 0])->first();
        if($req){
            return $this->error('您有新的充值消息');
        }else{
            return $this->success('无提醒');
        }
    }
    //忽略所有提醒
    public function systemIgnore(){
        DB::table('charge_req')->where('id','<>',0)->update(['warn'=>1]);
        $this->success("操作成功");
    }
    //通过不加钱
    public function passReqNoMoney(Request $request){
        $id = $request->get('id',0);
         if(empty($id)){
            return $this->error('参数错误');
        }
        $req = Db::table('charge_req')->where(['id' => $id,'status'=> 1])->first();
        if(!$req){
            return $this->error('充值记录错误');
        }
        // return $this->success('充值成功');
        
        DB::beginTransaction();
        try {
            //通过并加钱
            DB::table('charge_req')->where('id',$id)->update(['status'=>2,'warn'=>1,'updated_at'=>date('Y-m-d H:i:s')]);
            if($req->currency_id!='9999'){    //非银行卡充值方式要给对应钱包加钱
            
                //增加余额
                //DB::table('users_wallet')->where(['currency'=>$req->currency_id,'user_id'=>$req->uid])->increment('change_balance',$req->amount);
                $user_wallet = UsersWallet::where('user_id',$req->uid)->where('currency',$req->currency_id)->lockForUpdate()->first();
                //change_wallet_balance($user_wallet,2,$req->amount,AccountLog::ETH_EXCHANGE,'链上充币',false);
                
                //派发邀请佣金
                $user = Users::find($req->uid);
                
                $lv1 = Setting::getValueByKey('partner_ratio_lv1'); //第一级佣金比
                if($user['parent_id']>0 && $lv1>0){
                    
                    $user_lv1 = Users::find($user['parent_id']);//找出上级
                    if($user_lv1){
                        
                        $amount_lv1 = round($req->amount*$lv1/100,8);   //第一级佣金
                        $this->yongjing($user_lv1['id'],$amount_lv1,$req->currency_id,$req->uid);
                        
                        
                        
                        //第二级
                        $lv2 = Setting::getValueByKey('partner_ratio_lv2'); //第二级佣金比
                        if($user_lv1['parent_id']>0 && $lv2>0){
                            
                            $user_lv2 = Users::find($user_lv1['parent_id']);//找出上上级
                            if($user_lv2){
                                
                                $amount_lv2 = round($req->amount*$lv2/100,8);   //第二级佣金
                                $this->yongjing($user_lv2['id'],$amount_lv2,$req->currency_id,$req->uid);
                                
                                
                                //第三级
                                $lv3 = Setting::getValueByKey('partner_ratio_lv3'); //第三级佣金比
                                if($user_lv2['parent_id']>0 && $lv3>0){
                                    
                                    $user_lv3 = Users::find($user_lv2['parent_id']);//找出上上上级
                                    if($user_lv3){
                                        
                                        $amount_lv3 = round($req->amount*$lv3/100,8);   //第三级佣金
                                        $this->yongjing($user_lv3['id'],$amount_lv3,$req->currency_id,$req->uid);
                                        
                                        
                                    }
                                    
                                }
                                
                                
                                
                            }
                            
                        }
                        
                        
                        
                    }
                    
                }
                
                
                
                
            }
            
            DB::commit();
            return $this->success('充值成功');
            
        } catch (\Exception $ex) {
            
            DB::rollBack();
            //return $this->error('File:' . $ex->getFile() . ',Line:' . $ex->getLine() . ',Message:' . $ex->getMessage());
            return $this->error('参数错误');
            
        }
    }
	
    
    //给用户派发佣金
    public function yongjing($user_id,$amount,$currency_id,$from_user_id=0){

	        //增加余额
	        $user_wallet = UsersWallet::where('user_id',$user_id)->where('currency',$currency_id)->lockForUpdate()->first();
	        /*DB::table('users_wallet')->where(['currency'=>$currency_id,'user_id'=>$user_id])->increment('change_balance',$amount);
	        return AccountLog::insertLog(
                            [
                                'user_id' =>$user_id,
                                'value' => $amount,
                                'info' => '下级充值返佣金',
                                'type' => AccountLog::INVITATION_TO_RETURN,
                                'currency' =>$currency_id
                            ],
                            [
                                'balance_type' =>  2,   //币币
                                'wallet_id' => $wallet->id,
                                'lock_type' => 0,   //不锁定
                                'create_time' => time(),
                                'before' => $wallet->change_balance,
                                'change' => $amount,
                                'after' => bc_add($wallet->change_balance,$amount, 5),
                            ]
                        );*/
            change_wallet_balance($user_wallet,2,$amount,AccountLog::INVITATION_TO_RETURN,'下级充值返佣金',false,$from_user_id);
            return true;
    }
	
	
	
	public function refuseReq(Request $request){
		$id = $request->get('id',0);
		 if(empty($id)){
            return $this->error('参数错误');
        }
		$req = Db::table('charge_req')->where(['id' => $id,'status'=> 1])->first();
		if(!$req){
			return $this->error('充值记录错误');
		}
		
		DB::table('charge_req')->where('id',$id)->update(['status'=>3,'warn'=>1]);
		return $this->success('拒绝成功');
	}
    public function chargeReq(Request $request){
    	
    	return view('admin.user.charge');
    }

}
