<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/19 21:42
 +----------------------------------------------------------------------
 * 文件描述: 这是所有功能的范例类
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\admin\controller;

/**
 * Class Demo 范例类
 * @package app\admin\controller
 */
class Demo extends Common {
    // 这里定义表名，默认是会控制器名字，所以尽量保持表名和控制器名字一致
    protected $table = '';

    // 这里配置是否分页
    protected $paginate = false;

    // 定义搜索字段（必须是数组）
    // 注意：如果你的搜索字段是2个或者两个以上，那么数组必须在最后面赘上一个元素“|”或者“&”
    // 用来表示这些模糊匹配的字段是或者关系还是且的关系
    protected $likeFields = [

    ];

    // 这里是定义要查询所需要的表的字段，默认为 *
    protected $fields = [

    ];

    // 这里是定义详情页展示数据需要的字段，如果没有提供，默认会和$fields保持一致
    protected $detailFields = [

    ];

    /**
     * 此方法在查询之前调用
     */
    protected function beforeData () {
        // 这里对查询条件进行返回
        // 每一项都是可选的，你所写的每一项都会与默认合并，相同键值你的将覆盖系统默认的
        return [
            'condition' => [],
            'conditionOr' => [],
            'order' => [],
            'field' => []
        ];
    }

    /**
     * 此方法在查询之后调用
     * @param $data array 数据
     */
    protected function afterData (&$data) {
        // 遍历查出来的数据
    }

    /**
     * 此方法在detail数据查询之后调用
     * @param $data array detail页面的数据
     */
    protected function afterDetail (&$data) {
        // 这里修改元数据，或者添加一些额外的数据
    }

    /**
     * 在执行数据插入之前执行的方法
     * @param $data array 这是待插入的数据（表单传过来的所有数据）
     */
    protected function beforeInsert (&$data) {
        // 这里可以对数据进行二次加工处理
        // 注意：但是不要将数据修改为验证不通过的数据，因为数据之后就直接进行插入，所以为了避免报错，请注意
    }

    /**
     * 插入数据之后的操作
     * @param $data array 带有刚刚插入数据id的数据（比beforeInsert传来的data多了一个id）
     * @throws \Exception
     */
    protected function afterInsert ($data) {

        /*
         * 注意：我建议所有与该记录有关的其他插入操作在该方法中执行
         * 比如：一篇文章有标签，那么在文章插入完成之后标签的插入在这里执行，因为
         * 这里的环境依旧处于文章插入的事务当中，当这里出错之后文章也是不会插入的。
         */

        // 实例化有联系的模型，比如标签模型
        $model = model('RelationModel');
        // 开启事务
        $model->startTrans();
        try {
            // 这里开始执行插入的逻辑
            // 主要是方便了多条标签的插入，如果是单个记录的插入可以不用事务（建议都用事务）
        } catch (\Exception $exception) {
            // 如果捕获到错误，那么继续抛出，让调用afterInsert的上层来处理
            // 其实也就是让文章也别插进数据库中
            throw $exception;
        }
    }

    /**
     * 添加数据的页面展示之前的操作
     */
    protected function beforeAdd () {
        /*
         * 在这里，你可以做一些在展示添加页面之前的操作
         * 比如说一些的额外的数据的查询和展示
         */
    }

    /**
     * 修改数据的页面展示之前的操作
     * @param $data array 修改的数据的模型对象
     */
    protected function beforeEdit ($data) {
        /*
         * 在这里，你可以做一些在展示修改页面之前的操作
         * 比如说一些的额外的数据的查询和展示或者根据$data
         * 做些其他的数据操作
         */
    }

    /**
     * 这里是添加和修改页面公共的操作部分
     */
    protected function beforeUpdate () {
        /*
         * 在这里，你可以做些添加和修改页面都做的事情，这样就不用添加页面做一次
         * 修改页面也做一次了
         */
    }

    /**
     * 修改数据之前的操作
     * @param $data array 修改的数据
     * @param $oldData array 旧数据
     */
    protected function beforeModify (&$data, $oldData) {
        /*
         * 注意：$oldData 的&号是可选的，因为你改变
         * 它的没有任何意义
         */
    }

    /**
     * 修改之后执行的操作
     * @param $data array 修改的数据
     * @param $oldData array 旧的数据
     * @throws \Exception
     */
    protected function afterModify ($data, $oldData) {
        /*
         * 注意：我建议所有与该记录有关的其他更新的操作在该方法中执行
         */

        // 实例化有联系的模型
        $model = model('RelationModel');
        // 开启事务
        $model->startTrans();
        try {
            // 这里开始执行更新的逻辑
        } catch (\Exception $exception) {
            // 如果捕获到错误，那么继续抛出，让调用afterModify的上层来处理
            throw $exception;
        }
    }

    /**
     * 插入和更新前的公共操作
     * @param $data array 待处理数据
     */
    protected function beforeAlter (&$data) {

    }

    /**
     * 插入和更新后的公共操作
     * @param $data array 待处理数据
     */
    protected function afterAlter ($data) {

    }

    /**
     * 删除前的操作
     * @param $data array 待删除的数据
     * @throws \Exception
     */
    protected function beforeDel ($data) {

        /*
         * 如果删除其他的数据，请使用事务
         */

        // 实例化有联系的模型
        $model = model('RelationModel');
        // 开启事务
        $model->startTrans();
        try {
            // 这里开始执行删除其他数据的逻辑
        } catch (\Exception $exception) {
            // 如果捕获到错误，那么继续抛出，让调用beforeDel的上层来处理
            throw $exception;
        }
    }

}