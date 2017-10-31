<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/20 11:50
 +----------------------------------------------------------------------
 * 文件描述: 菜单模型
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\model;

class SysMenu extends Common {

    protected $hidden = [
        'sysManager'
    ];

    public $fieldDictNames = [
        'status',
        'type',
        'fresh',
        'mask'
    ];

    public $relationModels = [
        'sysManager'
    ];

    public function sysManager() {
        return $this->belongsTo('SysManager', 'manager_id')->bind([
            'manager_name' => 'name'
        ]);
    }

}