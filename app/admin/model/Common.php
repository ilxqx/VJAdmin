<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/20 11:40
 +----------------------------------------------------------------------
 * 文件描述: 所有类的公用模型
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\model;
use app\base\model\Base;

class Common extends Base {

    // 这里改变创建时间的字段名字
    protected $createTime = false;
    // 这里是取消更新时间字段的自动插入
    protected $updateTime = 'at_datetime';
    // 这里定义查询出的数据要进行隐藏的字段
    protected $hidden = [];
    // 这是定义每个模型关联的模型
    public $relationModels = [];
    // 这里定义每个模型的有数据字典的字段
    public $fieldDictNames = [];
    // 这里定义每个模型的上传文件字段
    public $uploadFields = [];

    // 对于managerId自动完成
    protected $auto = [
        'manager_id'
    ];
    // 自动完成managerId函数
    protected function setManagerIdAttr () {
        return getManagerId();
    }

}