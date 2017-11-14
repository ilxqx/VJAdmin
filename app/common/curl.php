<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/14 14:04
 +----------------------------------------------------------------------
 * 文件描述: 封装CUrl类的使用
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */
use cn\ixiaopeng\curl\CUrl;

/**
 * get方法请求接口，返回json数据
 * @param $url string 请求地址
 * @param array $params
 * @param array $config
 * @return mixed
 */
function getJson ($url, array $params, array $config = []) {
    $resp = CUrl::get($url, $params, $config);
    if ($resp !== false) {
        try {
            return json_decode($resp);
        } catch (\Exception $exception) {
            return json_decode('');
        }
    } else {
        return json_decode('');
    }
}

/**
 * post方法请求接口，返回json数据
 * @param $url string 请求地址
 * @param array $fields
 * @param array $config
 * @return mixed
 */
function postJson ($url, array $fields, array $config = []) {
    $resp = CUrl::post($url, $fields, $config);
    if ($resp !== false) {
        try {
            return json_decode($resp);
        } catch (\Exception $exception) {
            return json_decode('');
        }
    } else {
        return json_decode('');
    }
}