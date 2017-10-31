<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-26 14:35
 +----------------------------------------------------------------------
 * 文件描述: 这是SysOption类
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;
use cn\ixiaopeng\backup\Backup;

/**
 * Class SysOption 类
 * @package app\admin\controller
 */
class SysBackup extends Common {

    private $backup;

    public function __construct($request = null)
    {
        parent::__construct($request);
        $this->backup = new Backup();
    }

    public function index () {
        if (!$this->isGetAndAjax()) {
            return null;
        }
        $data = $this->backup->getSqlFileList();
        $this->assign('data', $data);
        return view();
    }

    public function backup () {
        if (!$this->isPostAndAjax()) {
            return null;
        }
        $res = $this->backup->backup();
        if ($res !== false) {
            return $this->handleJson(1, $res);
        } else {
            return $this->handleJson(0, $this->backup->getError());
        }
    }

    public function download () {
        if (!$this->isGet()) {
            return null;
        }
        $filename = $this->request->param('filename', '');
        if (empty($filename)) {
            return $this->handleJson(0, '请指定SQL文件名！');
        }
        $this->backup->downloadSqlFile($filename);
    }

    public function del () {
        if (!$this->isPostAndAjax()) {
            return null;
        }
        $filename = $this->request->param('filename', '');
        if (empty($filename)) {
            return $this->handleJson(0, '请指定SQL文件名！');
        }
        if ($this->backup->delSqlFile($filename)) {
            return $this->handleJson(1, '删除成功！');
        } else {
            return $this->handleJson(0, $this->backup->getError());
        }
    }

    public function restore () {
        if (!$this->isPostAndAjax()) {
            return null;
        }
        $filename = $this->request->param('filename', '');
        if (empty($filename)) {
            return $this->handleJson(0, '请指定SQL文件名！');
        }
        $res = $this->backup->restore($filename);
        if ($res !== false) {
            return $this->handleJson(1, $res);
        } else {
            return $this->handleJson(0, $this->backup->getError());
        }
    }

}