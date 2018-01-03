<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 15:45
 +----------------------------------------------------------------------
 * 文件描述: 这是SysRole类
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;

/**
 * Class SysRole 类
 * @package app\admin\controller
 */
class SysRole extends Common {

    // 这里配置是否分页
    protected $paginate = true;

    // 定义搜索字段（必须是数组）
    // 注意：如果你的搜索字段是2个或者两个以上，那么数组必须在最后面赘上一个元素“|”或者“&”
    // 用来表示这些模糊匹配的字段是或者关系还是且的关系
    protected $likeFields = [
        'name',
		'remark',
		'|'
    ];

    // 这里是定义要查询所需要的表的字段，默认为 *
    protected $fields = [

    ];

    // 这里是定义详情页展示数据需要的字段，如果没有提供，默认会和$fields保持一致
    protected $detailFields = [

    ];

    public function authorize () {
        if (!$this->isAjax()) {
            return null;
        }
        /*获取角色id*/
        $roleId = $this->request->param('role_id', '');
        if (empty($roleId)) {
            return $this->handleJson(0, '角色ID丢失了！');
        }
        /*获取角色已有的权限的id*/
        $raModel = model('SysRoleAuth');
        $authIds = $raModel
            ->where([
                'role_id' => $roleId
            ])
            ->column('auth_id');
        /*如果是post请求的话就进行权限的更改*/
        if ($this->isPost()) {
            /*获取前台传来的权限的id数组*/
            $post = $this->request->post();
            $ids = isset($post['ids']) ? $post['ids'] : [];
            /*如果id数组不为空*/
            $newAuthIds = array_map(function ($item) {
                return $item;
            }, array_diff($ids, $authIds));
            $delAuthIds = array_map(function ($item) {
                return $item;
            }, array_diff($authIds, $ids));
            /*开始执行数据库操作*/
            $raModel->startTrans();
            try {
                /*如果待删除的权限不为空的话*/
                if (!empty($delAuthIds)) {
                    $raModel->where([
                        'role_id' => $roleId,
                        'auth_id' => ['in', $delAuthIds]
                    ])->delete();
                }
                /*如果待新增的权限不为空的话*/
                if (!empty($newAuthIds)) {
                    foreach ($newAuthIds as $newAuthId) {
                        $raModel->isUpdate(false)->data([
                            'role_id' => $roleId,
                            'auth_id' => $newAuthId
                        ])->save();
                    }
                }
                $raModel->commit();
                return $this->handleJson(1, '授权成功！', true);
            } catch (\Exception $exception) {
                $raModel->rollback();
                return $this->handleJson(0, '授权失败：' . $exception->getMessage());
            }
        }
        $model = model('SysAuth');
        $modules = getModules();
        $arr = [];
        /*对每一个模块进行循环*/
        foreach ($modules as $module) {
            $controllers = getControllers($module);
            $controllerArr = [];
            foreach ($controllers as $val) {
                $data = $model->where([
                    'rule_module' => $module,
                    'rule_controller' => $val
                ])->select();
                castToArray($data);
                $controllerArr[$val] = $data;
            }
            $arr[$module] = $controllerArr;
        }
        $rules = [];
        /*拼接前台用到的循环数组*/
        foreach ($arr as $key => $val) {
            $outer = true;
            foreach ($val as $k => $v) {
                $mid = true;
                foreach ($v as $item) {
                    if ($outer) {
                        $co = count($val);
                        $cm = count($v);
                        $rules[] = [
                            'outer' => true,
                            'module' => $key . ' 模块',
                            'countOuter' => $co * $cm,
                            'mid' => true,
                            'countMid' => $cm,
                            'controller' => $k . ' 控制器',
                            'name' => $item['name'],
                            'id' => $item['id'],
                            'checked' => in_array($item['id'], $authIds)
                        ];
                        $outer = false;
                        $mid = false;
                    } else if ($mid) {
                        $cm = count($v);
                        $rules[] = [
                            'outer' => false,
                            'mid' => true,
                            'countMid' => $cm,
                            'controller' => $k . ' 控制器',
                            'name' => $item['name'],
                            'id' => $item['id'],
                            'checked' => in_array($item['id'], $authIds)
                        ];
                        $mid = false;
                    } else {
                        $rules[] = [
                            'outer' => false,
                            'mid' => false,
                            'name' => $item['name'],
                            'id' => $item['id'],
                            'checked' => in_array($item['id'], $authIds)
                        ];
                    }
                }
            }
        }
        $this->assign('rules', $rules);
        return view();
    }

    /**
     * 删除前的操作
     * @param $data array 待删除的数据
     * @throws \Exception
     */
    protected function beforeDel ($data) {
        /*
         * 如果删除的角色id为1，则不让其删除。
         */
        if ($data['id'] == config('system.super_manager_id')) {
            throw new \Exception('超级管理员角色不可以删除！');
        }
    }

}