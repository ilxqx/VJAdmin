<?php
/* +----------------------------------------------------------------------
 * 作	者: Venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/12/26 10:43
 +----------------------------------------------------------------------
 * 文件描述: VaptchaController.php
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */
namespace cn\ixiaopeng\vaptcha;

use Vaptcha\Vaptcha;

/**
 * 手势验证码控制器
 * Class VaptchaController
 * @package cn\ixiaopeng\vaptcha
 */
class VaptchaController {
    /*手势验证码vid*/
    private $vid;
    /*手势验证码key*/
    private $key;

    /**
     * VaptchaController constructor.
     */
    public function __construct()
    {
        /*获取验证id*/
        $this->vid = getSysOption('VaptchaVID');
        /*获取key*/
        $this->key = getSysOption('VaptchaKey');
    }


    /**
     * 验证流水号获取
     * @return \think\response\Json
     */
    public function index () {
        /*获取场景ID*/
        $sceneId = request()->param('sceneId', '');
        if (empty($sceneId)) {
            return json([
                'code' => 0,
                'msg' => '场景ID丢失！'
            ]);
        }
        /*实例化验证类*/
        $vaptcha = new Vaptcha($this->vid, $this->key);
        /*获取验证流水号*/
        $info = $vaptcha->getChallenge($sceneId);
        return json([
            'code' => 1,
            'data' => json_decode($info)
        ]);
    }

    /**
     * 宕机验证接口
     * @return string|void
     */
    public function downtime () {
        /*获取宕机数据*/
        $data = request()->param('data', '');
        /*实例化验证类*/
        $vaptcha = new Vaptcha($this->vid, $this->key);
        return $vaptcha->downTime($data);
    }
}