<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-12-31 17:11
 +----------------------------------------------------------------------
 * 文件描述: User2验证器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\business\validate;

class User2 extends Common {

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
			'age' => 'require|integer'
        ];
        /*表单验证的场景*/
        $this->scene = [
            'add' => [
                'name',
				'age'
            ],
            'edit' => [
                'name',
				'age'
            ]
        ];
    }
}