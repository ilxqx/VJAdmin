<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 14:11
 +----------------------------------------------------------------------
 * 文件描述: 这是SysManager类
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;

/**
 * Class SysManager 类
 * @package app\admin\controller
 */
class SysManager extends Common {

    // 这里配置是否分页
    protected $paginate = true;

    // 定义搜索字段（必须是数组）
    // 注意：如果你的搜索字段是2个或者两个以上，那么数组必须在最后面赘上一个元素“|”或者“&”
    // 用来表示这些模糊匹配的字段是或者关系还是且的关系
    protected $likeFields = [
        'name',
		'account',
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
        /*查询所有的角色*/
        $roles = model('SysRole')
            ->field([
                'id',
                'name'
            ])
            ->where('status', 'a')
            ->select();
        $this->assign('roles', $roles);
    }

    protected function beforeInsert (&$data) {
        $data['pwd'] = md5($data['pwd']);
    }

}