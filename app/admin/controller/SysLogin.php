<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/20 11:50
 +----------------------------------------------------------------------
 * 文件描述: 登录控制器
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;

use cn\ixiaopeng\backup\Backup;

class SysLogin extends Common {

    /**
     * 登录页面
     * @return \think\response\View
     */
    public function login () {
        return view();
    }

    /**
     * 处理登录逻辑
     * @return null|\think\response\Json
     */
    public function doLogin () {
        if (!$this->isPostAndAjax()) {
            return null;
        }
        /*获取验证码*/
        $verifyCode = $this->request->param('verify_code', '');
        /*验证*/
        if (!captcha_check($verifyCode, 'vj')) {
            return $this->handleJson(0, '验证码错误！');
        }
        /*获取用户名和密码*/
        $account = $this->request->param('username');
        $pwd = $this->request->param('password');

        /*登录检测*/
        $res = loginCheck($account, $pwd);
        if ($res === false) {
            return $this->handleJson(0, '用户名或密码错误！');
        } else {
            setSession($res);
            return $this->handleJson(1, '登录成功！', false, [
                'url' => url('admin/sys_home/index')
            ]);
        }
    }
}