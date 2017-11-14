<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/14 20:30
 +----------------------------------------------------------------------
 * 文件描述: 短信发送服务
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */
use Aliyun\Core\Config;
use Aliyun\Core\Profile\DefaultProfile;
use Aliyun\Core\DefaultAcsClient;
use Aliyun\Api\Sms\Request\V20170525\SendSmsRequest;
use Aliyun\Api\Sms\Request\V20170525\QuerySendDetailsRequest;

// 加载区域结点配置
Config::load();

/**
 * 取得AcsClient
 * @return DefaultAcsClient|null
 */
function getAcsClient () {
    static $acsClient = null;
    // 获取配置
    $config = config('send_msg_config');
    // 产品名称:云通信流量服务API产品,开发者无需替换
    $product = getSysOption('ProductName');
    // 产品域名,开发者无需替换
    $domain = getSysOption('Domain');
    // TODO 此处需要替换成开发者自己的AK (https://ak-console.aliyun.com/)
    $accessKeyId = getSysOption('AccessKeyId'); // AccessKeyId
    $accessKeySecret = getSysOption('AccessKeySecret'); // AccessKeySecret
    // 暂时不支持多Region
    $region = $config['region'];
    // 服务结点
    $endPointName = $config['end_point_name'];
    if($acsClient == null) {
        //初始化acsClient,暂不支持region化
        $profile = DefaultProfile::getProfile($region, $accessKeyId, $accessKeySecret);
        // 增加服务结点
        DefaultProfile::addEndpoint($endPointName, $region, $product, $domain);
        // 初始化AcsClient用于发起请求
        $acsClient = new DefaultAcsClient($profile);
    }
    return $acsClient;
}

/**
 * 发送短信
 * @param string $signName <p>
 * 必填, 短信签名，应严格"签名名称"填写，参考：<a href="https://dysms.console.aliyun.com/dysms.htm#/sign">短信签名页</a>
 * </p>
 * @param string $templateCode <p>
 * 必填, 短信模板Code，应严格按"模板CODE"填写, 参考：<a href="https://dysms.console.aliyun.com/dysms.htm#/template">短信模板页</a>
 * (e.g. SMS_0001)
 * </p>
 * @param string $phoneNumbers 必填, 短信接收号码 (e.g. 12345678901)
 * @param array|null $templateParam <p>
 * 选填, 假如模板中存在变量需要替换则为必填项 (e.g. Array("code"=>"12345", "product"=>"阿里通信"))
 * </p>
 * @param string|null $outId [optional] 选填, 发送短信流水号 (e.g. 1234)
 * @param string|null $smsUpExtendCode [optional] 选填，上行短信扩展码（扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段）
 * @return bool|string
 */
function sendSM ($signName, $templateCode, $phoneNumbers, $templateParam = null, $outId = null, $smsUpExtendCode = null) {
    // 初始化SendSmsRequest实例用于设置发送短信的参数
    $request = new SendSmsRequest();
    // 必填，设置雉短信接收号码
    $request->setPhoneNumbers($phoneNumbers);
    // 必填，设置签名名称
    $request->setSignName($signName);
    // 必填，设置模板CODE
    $request->setTemplateCode($templateCode);
    // 可选，设置模板参数
    if($templateParam) {
        $request->setTemplateParam(json_encode($templateParam));
    }
    // 可选，设置流水号
    if($outId) {
        $request->setOutId($outId);
    }
    // 选填，上行短信扩展码
    if($smsUpExtendCode) {
        $request->setSmsUpExtendCode($smsUpExtendCode);
    }
    // 发起访问请求
    $acsResponse = getAcsClient()->getAcsResponse($request);
    // 返回执行结果
    if ($acsResponse->Code == 'OK') {
        return true;
    }
    return $acsResponse->Message;
}

/**
 * 短信发送记录查询
 * @param string $phoneNumbers 必填, 短信接收号码 (e.g. 12345678901)
 * @param string $sendDate 必填，短信发送日期，格式Ymd，支持近30天记录查询 (e.g. 20170710)
 * @param int $pageSize 必填，分页大小
 * @param int $currentPage 必填，当前页码
 * @param string $bizId 选填，短信发送流水号 (e.g. abc123)
 * @return stdClass|string
 */
function querySMDetails ($phoneNumbers, $sendDate, $pageSize = 10, $currentPage = 1, $bizId = null) {
    // 初始化QuerySendDetailsRequest实例用于设置短信查询的参数
    $request = new QuerySendDetailsRequest();
    // 必填，短信接收号码
    $request->setPhoneNumber($phoneNumbers);
    // 选填，短信发送流水号
    $request->setBizId($bizId);
    // 必填，短信发送日期，支持近30天记录查询，格式Ymd
    $request->setSendDate($sendDate);
    // 必填，分页大小
    $request->setPageSize($pageSize);
    // 必填，当前页码
    $request->setCurrentPage($currentPage);
    // 发起访问请求
    $acsResponse = getAcsClient()->getAcsResponse($request);
    // 返回结果
    if ($acsResponse->Code == 'OK') {
        return $acsResponse->SmsSendDetailDTOs;
    }
    return $acsResponse->Message;
}

/**
 * 生成验证码（纯数字）
 * @param int $numCount 数字的个数
 * @return int 返回验证码
 */
function generateCode ($numCount = 6) {
    if ($numCount < 1) {
        return 0;
    }
    $min = '1';
    for ($i = 0; $i < $numCount - 1; $i++) {
        $min .= '0';
    }
    $max = '';
    for ($i = 0; $i < $numCount; $i++) {
        $max .= '9';
    }
    return mt_rand(intval($min), intval($max));
}

/**
 * 对短信验证码的进一步封装
 * @param $phone string 电话号码
 * @return bool|string
 */
function sendSMCode ($phone) {
    return sendSM(getSysOption('SignName'),
        getSysOption('SMCodeTemplateCode'),
        $phone,
        [
            'code' => generateCode()
        ]);
}