<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/21 10:47
 +----------------------------------------------------------------------
 * 文件描述: 首页控制器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;

use think\exception\DbException;
use think\exception\PDOException;

class SysHome extends Common {
    /**
     * 查询菜单所需要的字段
     * @var array
     */
    protected $fields = [
        'id',
        'name',
        'icon',
        'url',
        'type_id'
    ];

    /**
     * @var string 菜单模型名
     */
    protected $menuTable = 'SysMenu';

    /**
     * 递归处理子菜单
     * @param $menus
     * @param bool $unsetid
     * @throws DbException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function buildMenus (&$menus, $unsetid = true) {
        $model = model($this->menuTable);
        foreach ($menus as $key => &$menu) {
            /*查找子菜单*/
            $children = $model
                ->field($this->fields)
                ->where([
                    'status' => 'a',
                    'pid' => $menu['id']
                ])
                ->order([
                    'seq' => 'asc',
                    'id' => 'asc'
                ])
                ->select();
            if (empty($children)) {
                /*移除id属性*/
                $menu['id'] = $menu['type_id'];
                unset($menu['type_id']);
                /*检测他的url是否有权限*/
                $menu['auth'] = authenticate($menu['auth'][0], toJavaStyle($menu['auth'][1]), $menu['auth'][2]);
                if (!$menu['auth']) {
                    // 没有权限则删除，不显示
                    unset($menus[$key]);
                }
                /*为空时直接跳过*/
                continue;
            } else {
                /*转为数组*/
                castToArray($children);
                /*处理url*/
                foreach ($children as &$child) {
                    if (!empty($child['url'])) {
                        $child['auth'] = preg_split('/\//', $child['url']);
                        $child['url'] = url($child['url']);
                        $child['target'] = 'navtab';
                    }
                }
                /*不为空时递归查找*/
                $this->buildMenus($children);
                /*最后赋值给children*/
                if (!empty($children)) {
                    $menu['children'] = $children;
                    if ($unsetid) {
                        unset($id);
                    }
                    unset($menu['url']);
                    unset($menu['type_id']);
                } else {
                    unset($menus[$key]);
                }
            }
        }
    }

    /**
     * 获取菜单JSON数据
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getMenus () {
        if (!$this->isPostAndAjax()) {
            return null;
        }
        /*获取菜单的pid参数*/
        $pid = $this->request->param('pid', '');
        if (empty($pid)) {
            /*参数丢失了，返回错误*/
            return $this->handleJson(0, '参数丢失了！');
        }
        /*参数接收到了，进行下一步逻辑，根据pid查所有的pid为pid的菜单*/
        $model = model($this->menuTable);
        $menus = $model
            ->field($this->fields)
            ->where([
                'status' => 'a',
                'pid' => $pid
            ])
            ->order([
                'seq' => 'asc',
                'id' => 'asc'
            ])
            ->select();
        /*处理数据字典的值*/
        castToArray($menus);
        /*处理菜单的url*/
        foreach ($menus as &$menu) {
            if (!empty($menu['url'])) {
                $menu['auth'] = preg_split('/\//', $menu['url']);
                $menu['url'] = url($menu['url']);
                $menu['target'] = 'navtab';
            }
        }
        /*处理子菜单*/
        $this->buildMenus($menus);
        return json($menus);
    }

    /**
     * 系统首页
     * @return \think\response\View
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index () {
        /*获取服务器信息*/
        $info = array(
            '操作系统' => PHP_OS,
            '运行环境' => $_SERVER["SERVER_SOFTWARE"],
            '主机名' => $_SERVER['SERVER_NAME'],
            'WEB服务端口' => $_SERVER['SERVER_PORT'],
            '网站文档目录' => $_SERVER["DOCUMENT_ROOT"],
            '浏览器信息' => substr($_SERVER['HTTP_USER_AGENT'], 0, 40),
            '通信协议' => $_SERVER['SERVER_PROTOCOL'],
            '请求方法' => $_SERVER['REQUEST_METHOD'],
            'ThinkPHP版本' => THINK_VERSION,
            '上传附件限制' => ini_get('upload_max_filesize'),
            '执行时间限制' => ini_get('max_execution_time').'秒',
            '服务器时间' => date("Y年m月d日 H:i:s"),
            '北京时间' => gmdate("Y年m月d日 H:i:s",time() + 8 * 3600),
            '服务器域名/IP' => $_SERVER['SERVER_NAME'] . ' [ '. gethostbyname($_SERVER['SERVER_NAME']).' ]',
            '用户的IP地址'=>$_SERVER['REMOTE_ADDR'],
            '剩余空间'=>round((disk_free_space(".") / (1024 * 1024)), 2) . 'M',
        );
        $this->assign('info', $info);

        /*获取当前登录的管理员信息*/
        $this->assign('manager', model('SysManager')
            ->field([
                'name',
                'avatar'
            ])
            ->where('id', getManagerId())
            ->find()
        );

        /*获取首页上部的菜单*/
        $model = model('SysMenu');
        $menus = $model
            ->field([
                'id',
                'name',
                'icon',
                'url'
            ])
            ->where([
                'status' => 'a',
                'pid' => 0
            ])
            ->order([
                'seq' => 'asc',
                'id' => 'asc'
            ])
            ->select();
        castToArray($menus);
        $this->buildMenus($menus, false);
        $visibilityMenus = [];
        foreach ($menus as &$menu) {
            /*设置顶级菜单的url*/
            $menu['url'] = url(M_C . 'getMenus', [
                'pid' => $menu['id']
            ]);
            unset($menu['id']);
            unset($menu['children']);
            array_push($visibilityMenus, $menu);
        }
        unset($menus);
        $this->assign('menus', $visibilityMenus);
        return view();
    }

    /**
     * 注销
     * @return \think\response\Json
     */
    public function logout () {
        setSession();
        return $this->handleJson('2', '退出系统成功！');
    }

    /**
     * 修改密码
     * @return null|\think\response\Json|\think\response\View
     */
    public function changePassword () {
        if (!$this->isAjax()) {
            return null;
        }
        $id = getManagerId();
        try {
            $manager = model('SysManager')::get($id);
        } catch (DbException $e) {
            return $this->handleJson(0, '修改密码失败：' . $e->getMessage());
        }
        if ($this->isPost()) {
            $data = $this->request->post();
            if ($data['id'] != $id) {
                return $this->handleJson(0, '你不能修改别人的密码！');
            }
            if (md5($data['old_password']) != $manager->getAttr('pwd')) {
                return $this->handleJson(0, '输入的旧密码错误！');
            }
            $manager->setAttr('pwd', md5($data['password']));
            $manager->startTrans();
            try {
                $manager->save();
                $manager->commit();
                return $this->handleJson(1, '修改密码成功！', true);
            } catch (\Exception $exception) {
                try {
                    $manager->rollback();
                } catch (PDOException $e) {
                    return $this->handleJson(0, '修改密码失败：' . $e->getMessage());
                }
                return $this->handleJson(0, '修改密码失败：' . $exception->getMessage());
            }
        }
        $this->assign('manager', $manager);
        return view();
    }
}