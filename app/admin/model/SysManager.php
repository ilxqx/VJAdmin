<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017-10-29 14:11
 +----------------------------------------------------------------------
 * 文件描述: SysManager模型
 +----------------------------------------------------------------------
 * 升级记录:
 +----------------------------------------------------------------------
 */

namespace app\admin\model;

class SysManager extends Common {

    // 这里定义查询出的数据要进行隐藏的字段
    protected $hidden = [
        'sysManager', 'sysFile', 'sysRole'
    ];
    // 这是定义每个模型关联的模型
    public $relationModels = [
        'sysManager', 'sysFile', 'sysRole'
    ];
    // 这里定义每个模型的有数据字典的字段
    public $fieldDictNames = [
        'status'
    ];

    // 这里定义每个模型的上传文件字段
    public $uploadFields = [
        'avatar' => [
			'type' => 'image'
		]
    ];

    public function sysManager () {
		return $this->belongsTo('SysManager', 'manager_id')->bind([
			'manager_name' => 'name',
		]);
	}

	public function sysFile () {
		return $this->belongsTo('SysFile', 'avatar')->bind([
			'avatar_name' => 'name',
		]);
	}

    public function sysRole () {
        return $this->belongsTo('SysRole', 'role_id')->bind([
            'role_name' => 'name',
        ]);
    }
}