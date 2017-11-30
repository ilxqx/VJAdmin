<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/29 20:23
 +----------------------------------------------------------------------
 * 文件描述: 系统文件管理类
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;
use think\Exception;

class SysFileManagement extends Common {
    /**
     * 首页
     */
    public function index () {
        if (!$this->isGetAndAjax()) {
            return false;
        }
        /*获取配置*/
        $config = config('neditor');
        /*过滤本目录和上级目录数组*/
        $ignore = ['.', '..'];
        /*处理上传的文件*/
        $files = [];
        foreach (['user', 'scrawl', 'snapscreen', 'catcher', 'files'] as $val) {
            if (is_dir($config['absolutePath'] . $config[$val])) {
                $handle = opendir($config['absolutePath'] . $config[$val]);
                while (($item = readdir($handle)) !== false) {
                    if (!in_array($item, $ignore)) {
                        $files[$val][]['url'] = $config[$val] . $item;
                    }
                }
            }
        }
        /*遍历查找引用*/
        $this->fileUsed($files);
        $this->assign('files', $files);
        return view();
    }

    /**
     * 查找文件是否被使用
     * @param $files array 所有文件
     * @return bool 使用返回true，否则返回false
     */
    private function fileUsed (&$files) {
        $config = config('neditor.table_names');
        foreach ($config as $key => $val) {
            $model =  model($key);
            $data = $model->field($val)->select();
            castToArray($data);
            foreach ($data as $value) {
                foreach ($value as $item) {
                    foreach ($files as &$file) {
                        foreach ($file as &$v) {
                            if (strpos($item, $v['url']) !== false ||
                                strpos($item, str_replace('\\', '/', $v['url'])) !== false) {
                                $v['ref'] = true;
                            }
                        }
                    }
                }
            }
        }
        foreach ($files as &$file) {
            foreach ($file as &$v) {
                if (!isset($v['ref'])) {
                    $v['ref'] = false;
                }
            }
        }
    }

    /**
     * 删除文件
     * @return bool|\think\response\Json
     */
    public function del () {
        if (!$this->isPostAndAjax()) {
            return false;
        }
        $url = $this->request->param('url', '');
        if (empty($url)) {
            return $this->handleJson(0, '文件url丢失了！');
        }
        $abs = config('neditor.absolutePath');
        if (is_file($abs . $url)) {
            try {
                unlink($abs . $url);
            } catch (\Exception $exception) {
                return $this->handleJson(0, '删除失败：' . $exception->getMessage());
            }
        }
        return $this->handleJson(1, '删除成功！');
    }

    /**
     * 图片的详情查看
     * @return bool|\think\response\Json|\think\response\View
     */
    public function view () {
        if (!$this->isGetAndAjax()) {
            return false;
        }
        $url = $this->request->param('url', '');
        if (empty($url)) {
            return $this->handleJson(0, '文件url丢失了！', true);
        }
        $this->assign('url', $url);
        return view();
    }
}