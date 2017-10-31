<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/20 21:54
 +----------------------------------------------------------------------
 * 文件描述: 菜单验证器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\validate;

class SysMenu extends Common {

    // 验证规则
    protected $rule = [];

    // 验证场景（add和edit）
    protected $scene = [];

    public function __construct(array $rules = [], array $message = [], array $field = [])
    {
        parent::__construct($rules, $message, $field);
        /*表单验证的规则*/
        $this->rule = [
            'pid' => 'require|integer',
            'name' => 'require|max:10',
            'icon' => 'require|max:50',
            'url' => 'regex:menuUrl|requireWith:type|max:100',
            'seq' => 'require|integer|between:1,10000',
            'remark' => 'max:255',
            'type_id' => 'requireWith:url',
            'status' => 'require|in:' . getFieldValuesStr('vj_sys_menu', 'status')
        ];
        /*表单验证的场景*/
        $this->scene = [
            'add' => [
                'pid',
                'name',
                'icon',
                'url',
                'seq',
                'remark',
                'type_id',
                'status'
            ],
            'edit' => [
                'pid',
                'name',
                'icon',
                'url',
                'seq',
                'remark',
                'type_id',
                'status'
            ]
        ];
    }
}