<?php
//CodeService.php
namespace App\Service;

use App\Models\Captcha;
use App\Service\qcloudsms\SmsSingleSender;
class CodeService
{
    private $appid = null;
    private $appkey = null;
    private $sign = null;
    private $templateID = null;

    public function ConfigInit()
    {
        $this->appid = env('QCLOUD_SMS_APPID');
        $this->appkey = env('QCLOUD_SMS_APPKEY');
        $this->sign = env('QCLOUD_SMS_SIGN');
        $this->templateID = env('QCLOUD_SMS_REG_TEMPLATE_ID');
    }


   /**
     * 短信发送行为
     * @param Sms $params
     * @return  boolean
     */
    public function smsSend(&$params)
    {
        $this->ConfigInit();
        try {
            $templateID = $this->templateID;
           //普通短信发送
           $this->sender = new SmsSingleSender($this->appid, $this->appkey);
           $result = $this->sender->sendWithParam($params['areacode'], $params['mobile'], $templateID, [$params['code']], $this->sign, "", "");
            $rsp = json_decode($result, true);
            if ($rsp['result'] == 0 && $rsp['errmsg'] == 'OK') {
                return true;
            } else {
                //记录错误信息
                $this->setError($rsp);
                return false;
            }
        } catch (\Exception $e) {
            $this->setError($e->getMessage());
        }
        return false;
    }
     /**
     * 记录失败信息
     * @param [type] $err [description]
     */
    private function setError($err)
    {
        $this->sendError = $err;
    }

    /**
     * 获取失败信息
     * @return [type] [description]
     */
    public function getError()
    {
        return $this->sendError;
    }

    /**
     * 检测验证是否正确
     * @param Sms $params
     * @return  boolean
     */
    public function smsCheck(&$params)
    {
        return true;
    }
}