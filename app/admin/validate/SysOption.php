<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-26 14:35
 +----------------------------------------------------------------------
 * 文件描述: SysOption验证器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\validate;

class SysOption extends Common {

    // 验证规则
    protected $rule = [];

    // 验证场景（add和edit）
    protected $scene = [];

    public function __construct(array $rules = [], array $message = [], array $field = [])
    {
        parent::__construct($rules, $message, $field);
        /*表单验证的规则*/
        $this->rule = [
            'name|键值' => 'require|max:50|unique:sys_option,name',
			'value' => 'require|max:100',
			'remark' => 'max:255'
        ];
        /*表单验证的场景*/
        $this->scene = [
            'add' => [
                'name',
				'value',
				'remark'
            ],
            'edit' => [
                'name',
				'value',
				'remark'
            ]
        ];
    }
}