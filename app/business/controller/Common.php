<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/19 21:43
 +----------------------------------------------------------------------
 * 文件描述: 
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\business\controller;
use app\base\controller\Base;

class Common extends Base {

    /*是否分页*/
    protected $paginate = false;

    /**
     * 方法拦截
     */
    public function _initialize () {
        if (!session('?managerId')) {
            if ($this->isAjax()) {
                echo '<script>window.location.reload();</script>';
                exit;
            } else {
                $this->redirect(url(M . '/sys_login/login'));
            }
        }
        if ($this->isAjax()) {
            /*权限验证*/
            if (!authenticate()) {
                $this->forbid();
            }
        } else {

        }
    }

    private function forbid () {
        $accept = $this->request->header('accept');
        if (strpos($accept, 'text/html') !== false) {
            echo '<script>BJUI.alertmsg(\'warn\', \'您没有权限！\');if ($.CurrentDialog) {BJUI.dialog(\'closeCurrent\');} else {BJUI.navtab(\'closeCurrentTab\');}</script>';
        } else if (strpos($accept, 'application/json') !== false) {
            echo json_encode([
                'status' => 0,
                'message' => '您没有权限！',
                'closeCurrent' => true
            ]);
        }
        exit();
    }

}