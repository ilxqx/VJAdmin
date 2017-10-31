<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 14:11
 +----------------------------------------------------------------------
 * 文件描述: SysManager验证器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\validate;

class SysManager extends Common {

    // 验证规则
    protected $rule = [];

    // 验证场景（add和edit）
    protected $scene = [];

    public function __construct(array $rules = [], array $message = [], array $field = [])
    {
        parent::__construct($rules, $message, $field);
        /*表单验证的规则*/
        $this->rule = [
            'name' => 'require|max:20',
			'account' => 'require|max:16|unique:sys_manager,account',
			'pwd' => 'require|max:32',
			'avatar' => 'require|integer',
            'role_id' => 'require|integer',
			'status' => 'in:' . getFieldValuesStr('vj_sys_manager', 'status')
        ];
        /*表单验证的场景*/
        $this->scene = [
            'add' => [
                'name',
				'account',
				'pwd',
				'role_id',
				'avatar',
				'status'
            ],
            'edit' => [
                'name',
				'account',
				'role_id',
				'status'
            ]
        ];
    }
}