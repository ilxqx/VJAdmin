<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 12:03
 +----------------------------------------------------------------------
 * 文件描述: 这是SysFieldDict类
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;
use think\Db;

/**
 * Class SysFieldDict 类
 * @package app\admin\controller
 */
class SysFieldDict extends Common {

    // 这里配置是否分页
    protected $paginate = true;

    // 定义搜索字段（必须是数组）
    // 注意：如果你的搜索字段是2个或者两个以上，那么数组必须在最后面赘上一个元素“|”或者“&”
    // 用来表示这些模糊匹配的字段是或者关系还是且的关系
    protected $likeFields = [
        'table',
		'field',
		'value',
		'meaning',
		'|'
    ];

    /**
     * 获取表中的字段
     * @return \think\response\Json
     */
    public function getTableFields () {
        if (!$this->isPostAndAjax()) {
            return json([]);
        }
        $table = $this->request->param('table', '');
        if (empty($table)) {
            return json([]);
        }
        /*查询表结构*/
        $info = Db::query("SHOW COLUMNS FROM " . $table);
        $fields = [];
        /*整理表结构数据*/
        foreach ($info as $val) {
            array_push($fields, [
                $val['Field'], $val['Field']
            ]);
        }
        return json($fields);
    }

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

    /**
     * 这里是添加和修改页面公共的操作部分
     */
    protected function beforeUpdate () {
        /*
         * 在这里，你可以做些添加和修改页面都做的事情，这样就不用添加页面做一次
         * 修改页面也做一次了
         */
        $tables = Db::query("SHOW TABLES");

        foreach ($tables as &$val)
        {
            $val = array_values($val)[0];
        }

        $this->assign('tables', $tables);
    }

}