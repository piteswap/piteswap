<?php
/**
 * 短信验证码
 */
namespace App;


use Illuminate\Database\Eloquent\Model;

class Sms extends Model
{
    protected $table = 'sms';
    public $timestamps = false;

}
