<?php
/* +----------------------------------------------------------------------
 * 作	者: Venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/9 21:12
 +----------------------------------------------------------------------
 * 文件描述: 二维码生成类
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

/**
 * 生成二维码
 * @param $text string 待生成的字符串
 * @param bool $retErr 是否返回错误字符串
 * @return bool|string
 */
function qrCode ($text, $retErr = false) {
    /*导入二维码类库*/
    import('phpqrcode.qrlib');
    /*获取二维码生成配置*/
    $config = config('qr_code_config');
    /*生成二维码图片名*/
    $name = $config['path'] . getUUID() . '.png';
    /*生成二维码*/
    try {
        QRcode::png($text,
            $name,
            $config['default_level'],
            $config['default_size'],
            $config['default_margin'],
            false,
            $config['default_back_color'],
            $config['default_fore_color']);
    } catch (Exception $exception) {
        /*如果是返回错误信息的化，就直接返回错误信息*/
        if ($retErr) {
            return $exception->getMessage();
        }
        /*否则直接返回false*/
        return false;
    }
    /*返回图片的绝对路径*/
    return $name;
}