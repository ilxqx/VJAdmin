<?php
/* +----------------------------------------------------------------------
 * 作	者: Venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/12/26 11:11
 +----------------------------------------------------------------------
 * 文件描述: vaptcha.php
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

use Vaptcha\Vaptcha;

/**
 * 手势验证码二次验证
 * @param $challenge
 * @param $token
 * @param $sceneId
 * @return bool 是否验证成功
 */
function vaptchaRevalidate ($challenge, $token, $sceneId) {
    /*获取验证id*/
    $vid = getSysOption('VaptchaVID');
    /*获取key*/
    $key = getSysOption('VaptchaKey');
    $vaptcha = new Vaptcha($vid, $key);
    return $vaptcha->validate($challenge, $token, $sceneId);
}