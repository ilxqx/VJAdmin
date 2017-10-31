<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 15:45
 +----------------------------------------------------------------------
 * 文件描述: SysRole验证器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\validate;

class SysRole extends Common {

    // 验证规则
    protected $rule = [];

    // 验证场景（add和edit）
    protected $scene = [];

    public function __construct(array $rules = [], array $message = [], array $field = [])
    {
        parent::__construct($rules, $message, $field);
        /*表单验证的规则*/
        $this->rule = [
            'name' => 'require|max:50',
			'remark' => 'require|max:255',
			'status' => 'in:' . getFieldValuesStr('vj_sys_role', 'status')
        ];
        /*表单验证的场景*/
        $this->scene = [
            'add' => [
                'name',
				'remark',
				'status'
            ],
            'edit' => [
                'name',
				'remark',
				'status'
            ]
        ];
    }
}