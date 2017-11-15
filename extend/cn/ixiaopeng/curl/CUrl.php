<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/10/13 21:17
 +----------------------------------------------------------------------
 * 文件描述: CUrl封装curl类库
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */

namespace cn\ixiaopeng\curl;

final class CUrl {
    /**
     * 执行curl的主方法
     * @param $method string 方法类型
     * @param $url string url地址
     * @param array $fields 传送参数
     * @param array $config 其他配置
     * @return array|bool|mixed
     */
    public static function execute ($method, $url, array $fields = [], array $config = []) {
        $_config = [
            'userAgent' => '',
            'httpHeaders' => [],
            'username' => '',
            'password' => ''
        ];
        /*合并配置*/
        $config = array_merge($_config, $config);
        /*创建句柄*/
        $ch = static::create();
        if (false === $ch) {
            return false;
        }
        /*如果url为空直接放回false*/
        if (!empty($url) && is_string($url)) {
            $ret = curl_setopt($ch, CURLOPT_URL, $url);
        } else {
            return false;
        }
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        if (!empty($config['username'])) {
            curl_setopt($ch, CURLOPT_USERPWD, $config['username'] . ':' . $config['password']);
        }
        /*处理请求参数*/
        if (is_array($fields) && !empty($fields)) {
            $fieldStr = http_build_query($fields);
        }
        $method = strtolower($method);
        if ('post' == $method) {
            curl_setopt($ch, CURLOPT_POST, true);
            if (isset($fieldStr)) {
                curl_setopt($ch, CURLOPT_POSTFIELDS, $fieldStr);
            }
        } else if ('put' == $method) {
            curl_setopt($ch, CURLOPT_PUT, true);
            if (isset($fieldStr)) {
                $url = $url . '?' . $fieldStr;
            }
        } else {
            if (isset($fieldStr)) {
                $url = $url . '?' . $fieldStr;
            }
        }
        //设置curl超时秒数
        curl_setopt($ch, CURLOPT_TIMEOUT, 100);
        if (!empty($config['userAgent'])) {
            curl_setopt($ch, CURLOPT_USERAGENT, $config['userAgent']);
        }
        if (!empty($config['httpHeaders']) && is_array($config['httpHeaders'])) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $config['httpHeaders']);
        }
        /*执行curl*/
        $ret = curl_exec($ch);
        if (curl_errno($ch)) {
            curl_close($ch);
            return [
                curl_errno($ch),
                curl_error($ch)
            ];
        } else {
            curl_close($ch);
            /*返回结果*/
            return $ret;
        }
    }

    /**
     * post快捷方法
     * @param $url string 地址
     * @param array $fields 表单参数
     * @param array $config 其他配置
     * @return array|bool|mixed
     */
    public static function post ($url, array $fields, array $config = []) {
        $ret = static::execute('POST', $url, $fields, $config);
        if (false === $ret) {
            return false;
        }
        if (is_array($ret)) {
            return false;
        }
        return $ret;
    }

    /**
     * get快捷方法
     * @param $url string 地址
     * @param array $fields url中的拼接参数
     * @param array $config 其他配置
     * @return array|bool|mixed
     */
    public static function get ($url, array $fields, array $config = []) {
        $ret = static::execute('GET', $url, $fields, $config);
        if (false === $ret) {
            return false;
        }
        if (is_array($ret)) {
            return false;
        }
        return $ret;
    }

    /**
     * 初始化curl句柄
     * @return bool|null|resource
     */
    private static function create() {
        $ch = null;
        if (!function_exists('curl_init')) {
            return false;
        }
        $ch = curl_init();
        if (!is_resource($ch)) {
            return false;
        }
        return $ch;
    }
}
