<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 17:38
 +----------------------------------------------------------------------
 * 文件描述: SysAuth验证器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\validate;

class SysAuth extends Common {

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
			'rule_module' => 'require|max:50',
			'rule_controller' => 'require|max:50',
			'rule_method' => 'require|max:50',
			'remark' => 'max:255'
        ];
        /*表单验证的场景*/
        $this->scene = [
            'add' => [
                'name',
				'rule_module',
				'rule_controller',
				'rule_method',
				'remark'
            ],
            'edit' => [
                'name',
				'rule_module',
				'rule_controller',
				'rule_method',
				'remark'
            ]
        ];
    }
}