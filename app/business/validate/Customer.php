<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-11-29 18:21
 +----------------------------------------------------------------------
 * 文件描述: Customer验证器
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\business\validate;

class Customer extends Common {

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
			'content' => 'require|max:10000000',
			'pic' => 'require|integer',
			'status' => 'in:' . getFieldValuesStr('vj_customer', 'status')
        ];
        /*表单验证的场景*/
        $this->scene = [
            'add' => [
                'name',
				'content',
				'pic',
				'status'
            ],
            'edit' => [
                'name',
				'content',
				'status'
            ]
        ];
    }
}