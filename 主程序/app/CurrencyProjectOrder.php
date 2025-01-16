<?php


namespace App;


use Illuminate\Database\Eloquent\Model;

class CurrencyProjectOrder extends Model
{
    public $table = 'currency_project_order';

   protected $appends = [
       
       
        'pay_currency_name'
    ];

    public function getPayCurrencyNameAttribute(){
        $currency_id = $this->attributes['pay_currency_id'];
        return Currency::find($currency_id)->name;
    }
}
