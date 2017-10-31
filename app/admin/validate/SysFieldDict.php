<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 12:03
 +----------------------------------------------------------------------
 * 文件描述: SysFieldDict验证器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\validate;

class SysFieldDict extends Common {

    // 验证规则
    protected $rule = [];

    // 验证场景（add和edit）
    protected $scene = [];

    public function __construct(array $rules = [], array $message = [], array $field = [])
    {
        parent::__construct($rules, $message, $field);
        /*表单验证的规则*/
        $this->rule = [
            'table' => 'require|max:50',
			'field' => 'require|max:50',
			'value' => 'require|max:10',
			'meaning' => 'require|max:50',
			'remark' => 'max:255'
        ];
        /*表单验证的场景*/
        $this->scene = [
            'add' => [
                'table',
				'field',
				'value',
				'meaning',
				'remark'
            ],
            'edit' => [
                'table',
				'field',
				'value',
				'meaning',
				'remark'
            ]
        ];
    }
}