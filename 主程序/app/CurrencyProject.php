<?php


namespace App;


use Illuminate\Database\Eloquent\Model;

class CurrencyProject extends Model
{
    public $table = 'currency_project';
    protected $appends = [
        'time_status',
        'currency_name',
        'pay_currency_name',
        'btc_price',
        'eth_price'
    ];
    public function getCurrencyNameAttribute(){
        $currency_id = $this->attributes['currency_id'];
        return Currency::find($currency_id)->name;
    }
    public function getPayCurrencyNameAttribute(){
        $currency_id = $this->attributes['pay_currency_id'];
        return Currency::find($currency_id)->name;
    }
    public function getBtcPriceAttribute(){
        $btc_price =CurrencyQuotation::where("legal_id","=",3)->where("currency_id","=",1)->first()->now_price;
        return bc_div($this->attributes['price'],$btc_price);
    }
    public function getEthPriceAttribute(){
        $eth_price =CurrencyQuotation::where("legal_id","=",3)->where("currency_id","=",2)->first()->now_price;
        return bc_div($this->attributes['price'],$eth_price);
    }
    public function getTimeStatusAttribute(){
        $start_at = $this->attributes['start_at'];
        $end_at = $this->attributes['end_at'];
        if(time()<strtotime($start_at)){
            return 1;
        }elseif(time()<strtotime($end_at)){
            return 2;
        }else{
            return 3;
        }
     }
}
