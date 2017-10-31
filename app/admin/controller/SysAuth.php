<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 17:38
 +----------------------------------------------------------------------
 * 文件描述: 这是SysAuth类
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;

/**
 * Class SysAuth 类
 * @package app\admin\controller
 */
class SysAuth extends Common {

    // 这里配置是否分页
    protected $paginate = true;

    // 定义搜索字段（必须是数组）
    // 注意：如果你的搜索字段是2个或者两个以上，那么数组必须在最后面赘上一个元素“|”或者“&”
    // 用来表示这些模糊匹配的字段是或者关系还是且的关系
    protected $likeFields = [
        'name',
        'rule_controller',
        'rule_module',
        'rule_method',
        '|'
    ];

    /**
     * 此方法在查询之前调用
     */
    protected function beforeData () {
        // 这里对查询条件进行返回
        // 每一项都是可选的，你所写的每一项都会与默认合并，相同键值你的将覆盖系统默认的
        return [
            'order' => [
                'id' => 'asc'
            ]
        ];
    }

    protected function beforeUpdate () {
        $this->assign('modules', getModules());
    }

    protected function beforeEdit ($data) {
        $controllers = getControllers($data['rule_module']);
        $cArr = array_map(function ($item) use ($data) {
            return [
                'name' => $item,
                'value' => $data['rule_module'] . '&' . $item
            ];
        }, $controllers);
        $methods = getMethods($data['rule_module'], $data['rule_controller']);
        $mArr = array_map(function ($item) {
            return [
                'name' => $item,
                'value' => $item
            ];
        }, $methods);
        $this->assign('controllers', $cArr);
        $this->assign('methods', $mArr);
    }

    protected function beforeAlter (&$data) {
        $data['rule_controller'] = explode('&', $data['rule_controller'])[1];
    }

    public function getControllers () {
        if (!$this->isPostAndAjax()) {
            return json([]);
        }
        $module = $this->request->param('module', '');
        if (empty($module)) {
            return json([]);
        }
        $controllers = getControllers($module);
        $arr = [
            [
                'value' => '',
                'label' => '请选择控制器'
            ]
        ];
        foreach ($controllers as $controller) {
            array_push($arr, [
                'value' => $module . '&' . $controller,
                'label' => $controller
            ]);
        }
        return json($arr);
    }

    public function getMethods () {
        if (!$this->isPostAndAjax()) {
            return json([]);
        }
        $controller = $this->request->param('controller', '');
        if (empty($controller)) {
            return json([]);
        }
        $arr = explode('&', $controller);
        $methods = getMethods($arr[0], $arr[1]);
        $methodArr = [];
        foreach ($methods as $method) {
            array_push($methodArr, [
                'value' => $method,
                'label' => $method
            ]);
        }
        return json($methodArr);
    }

}