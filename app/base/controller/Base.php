<?php
/* +----------------------------------------------------------------------
 * 作	者: venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/9/19 21:17
 +----------------------------------------------------------------------
 * 文件描述: Base 基类（用于其它类的继承使用）
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

namespace app\base\controller;
use think\Controller;
use think\Request;
use think\View;

// 定义模块控制器方法常量
define('M', request()->module());
define('C', toCStyle(request()->controller()));
define('A', request()->action());
define('M_C', M . DS . C . DS);
define('M_C_A', M_C . A);
define('MC', M . C);
define('MCA', M . C . A);

/**
 * Class Base 所有业务控制器的基类
 * @package app\base\controller
 */
class Base extends Controller {

    /**
     * @var string 表名
     */
    protected $table;

    /**
     * Common constructor.
     * @param Request|null $request
     */
    public function __construct (Request $request = null)
    {
        parent::__construct($request);
        // 完成表名的赋值（控制器的名字）
        $this->table = $this->request->controller();
    }

    /**
     * 每一个方法执行前先执行的方法
     */
    public function _initialize () {

    }

    /**
     * 处理返回数据为json格式
     * @param $status integer 请求状态信息
     * @param $msg string 提示信息
     * @param bool $close 是否关闭当前target
     * @param array $other 其他配置参数
     *      reload 请求返回成功状态后，是否重新加载当前target
     *      forward 跳转地址，请求返回成功状态后，加载forward地址对应的内容到当前target
     *      forwardConfirm 上面的跳转地址是否确认（默认false）
     *      tabid 请求返回成功状态后，需要刷新的navtab的id集合，多个id以,分隔
     *      dialogid 请求返回成功状态后，需要刷新的dialog的id集合，多个id以,分隔
     *      divid 请求返回成功状态后，需要刷新的div(仅限通过doload加载的div)的id集合，多个id以,分隔
     *      datagrids 请求返回成功状态后，需要刷新的datagrid的id集合，多个id以,分隔
     * @return \think\response\Json 返回json字符串
     * @internal param int $code 返回状态 1 => 成功  0 => 表示失败 2 => 表示回话超时
     */
    protected function handleJson ($status, $msg, $close = false, $other = []) {
        // 返回数组必有的信息
        $retArr = [
            'status' => $status,
            'message' => $msg,
            'closeCurrent' => $close
        ];
        // 处理其他参数
        foreach (['tabid', 'dialogid', 'divid'/*'datagrids'*/] as $item) {
            $arr = [];
            $id = $this->request->param($item, '');
            if (!empty($id)) {
                // 合并前台传来的值
                array_push($arr, trim($id, ','));
            }
            if (array_key_exists($item, $other)) {
                // 合并参数提供的值
                array_push($arr, trim($other[$item], ','));
                unset($other[$item]);
            }
            if (!empty($arr)) {
                $retArr[$item] = join(',', $arr);
            } else if ($item === 'tabid') {
                // 如果tabid不提供的话，默认给一个默认值
                $retArr[$item] = MC . 'index';
            }
        }
        // 合并剩余参数
        $retArr = array_merge($retArr, $other);
        // 返回json字符串
        return json($retArr);
    }

    protected function isGet () {
        return $this->request->isGet();
    }

    protected function isPost () {
        return $this->request->isPost();
    }

    protected function isAjax () {
        return $this->request->isAjax(true);
    }

    protected function isGetAndAjax () {
        return $this->isGet() && $this->isAjax();
    }

    protected function isPostAndAjax () {
        return $this->isPost() && $this->isAjax();
    }

    /**
     * 建造搜索查询（like）
     * 如果要匹配的字段是两个或者两个以上 那么这个数组最后一个元素就必须是 ‘|’ 或者 ‘&’
     * @return array
     */
    protected function buildSearch () {
        // 要想有模糊匹配的功能，必须要在控制器里面定义likeFields属性（必须是数组，不能为空）
        if (isset($this->likeFields) && is_array($this->likeFields) && !empty($this->likeFields)) {
            // 获取前台传来的搜索关键字
            $key = $this->request->param('key', '');
            // 数组长度不能为2
            $len = count($this->likeFields);
            if ($len === 2) {
                return [];
            }
            // 拼接查询
            if ($len > 2) {
                // 如果要匹配的字段是两个或者两个以上 那么这个数组最后一个元素就必须是 ‘|’ 或者 ‘&’
                $op = array_pop($this->likeFields);
                return [
                    implode($op, $this->likeFields) => ['like', '%' . $key . '%']
                ];
            } else {
                return [
                    $this->likeFields[0] => ['like', '%' . $key . '%']
                ];
            }
        } else {
            return [];
        }
    }

    /**
     * 获取数据字典字段值的含义
     * @param $table string 表名
     * @param $field string 字段名
     * @param $value string 字段值
     * @return string 字段值含义
     */
    protected function getMeaningOfFiledValue ($table, $field, $value) {
        /*如果为空，直接返回空*/
        if (empty($value)) {
            return '';
        }
        // 获取数据字段模型
        $model = model('app\\admin\\model\\SysFieldDict');
        // 返回查询到的字段值含义
        return $model->where([
            'table' => $table,
            'field' => $field,
            'value' => $value
        ])->value('meaning');
    }

    /**
     * 查询数据字段有的值的含义
     * @param $table string 表名
     * @param $data array 处理的数据
     * @param $tableFields array 需要处理的表的字段
     * @param bool $override 是否覆盖
     * @param $single boolean 是否是单条数据，默认为false
     */
    protected function handleFieldsInDict ($table, &$data, $tableFields, $override = false, $single = false) {
        if (!empty($tableFields)) {
            // 获取C风格加表前缀的表名
            $tableName = getTableNameOfPrefixWithCStyle($table);
            foreach ($tableFields as $val) {
                if (!$single) {
                    /*处理多条数据*/
                    foreach ($data as &$value) {
                        if (key_exists($val, $value)) {
                            if (!$override) {
                                $value[$val . '_name'] = $this->getMeaningOfFiledValue($tableName, $val, $value[$val]);
                            } else {
                                $value[$val] = $this->getMeaningOfFiledValue($tableName, $val, $value[$val]);
                            }
                        }
                    }
                } else {
                    /*处理一条数据*/
                    if (key_exists($val, $data)) {
                        if (!$override) {
                            $data[$val . '_name'] = $this->getMeaningOfFiledValue($tableName, $val, $data[$val]);
                        } else {
                            $data[$val] = $this->getMeaningOfFiledValue($tableName, $val, $data[$val]);
                        }
                    }
                }
            }
        }
    }

    /**
     * 详情页面
     * @return null|\think\response\Json|\think\response\View
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function detail () {
        if (!$this->isGetAndAjax()) {
            return null;
        }
        $idName = config('system.sys_table_pk');
        // 获取主键
        $id = $this->request->param($idName, '');
        // 主键丢失
        if (empty($id)) {
            return $this->handleJson(300, '主键丢失了！');
        }

        // 获取模型对象
        $model = model($this->table);
        // 预加载关联模型 如果有的话
        $model->with($model->relationModels);
        // 处理自定义想查的字段属性
        if (isset($this->detailFields) && !empty($this->detailFields)) {
            $model->field($this->detailFields);
        } else if (isset($this->fields) && !empty($this->fields)) {
            $model->field($this->fields);
        }

        // 处理查询数据
        $data = $model
            ->where($idName, $id)
            ->find();
        // 转数组处理
        castToArray($data);
        // 处理数据字典属性
        $this->handleFieldsInDict($this->table, $data, $model->fieldDictNames, false, true);
        // 最终处理数据 如果有的话
        if (method_exists($this, 'afterDetail')) {
            $this->afterDetail($data);
        }
        // 返回数据
        $this->assign('data', $data);
        return view();
    }

    /**
     * 数据页面
     * @return View
     * @throws \think\Exception
     */
    public function index () {
        // 过滤非Ajax请求
        if (!$this->isAjax()) {
            return null;
        }
        // 获取模型对象
        $model = model($this->table);
        // 查询条件数组
        $config = [
            'field' => [],
            'condition' => [],
            'conditionOr' => [],
            'order' => []
        ];
        // 处理自定义想查的字段属性
        if (isset($this->fields) && !empty($this->fields)) {
            $config['field'] = $this->fields;
        } else {
            $config['field'][0] = '*';
        }
        // 处理搜索
        $searchCondition = $this->buildSearch();
        $config['condition'] = $searchCondition;
        // 默认排序
        $config['order'] = [
            config('system.sys_table_pk') => 'desc'
        ];
        // 处理特殊情况的查询
        if (method_exists($this, 'beforeData')) {
            $customConfig = $this->beforeData();
            if (!empty($customConfig) && is_array($customConfig)) {
                /*和自定义的条件进行合并*/
                foreach (['condition', 'conditionOr', 'field', 'order'] as $val) {
                    if (array_key_exists($val, $customConfig) && is_array($customConfig[$val])) {
                        $config[$val] = array_merge($config[$val], $customConfig[$val]);
                    }
                }
            }
        }
        // 处理分页
        if (isset($this->paginate) && $this->paginate) {
            /*分页数据处理*/
            $pageSize = $this->request->param('page_size', config('paginate.list_rows'));
            $pageCurrent = $this->request->param('page_current', 1);
            $total = $model
                ->field($config['field'])
                ->where($config['condition'])
                ->whereOr($config['conditionOr'])
                ->order($config['order'])
                ->count();
            /*发送到前台数据*/
            $this->assign('page_size', $pageSize);
            $this->assign('page_current', $pageCurrent);
            $this->assign('total', $total);
            /*查询数据*/
            $data = $model
                ->with($model->relationModels)
                ->field($config['field'])
                ->where($config['condition'])
                ->whereOr($config['conditionOr'])
                ->order($config['order'])
                ->page($pageCurrent, $pageSize)
                ->select();
        } else {
            /*查询数据*/
            $data = $model
                ->with($model->relationModels)
                ->field($config['field'])
                ->where($config['condition'])
                ->whereOr($config['conditionOr'])
                ->order($config['order'])
                ->select();
        }
        // 处理查询数据
        // 转数组处理
        castToArray($data);
        // 处理数据字典属性
        $this->handleFieldsInDict($this->table, $data, $model->fieldDictNames);
        // 最终处理数据 如果有的话
        if (method_exists($this, 'afterData')) {
            $this->afterData($data);
        }
        $this->assign('data', $data);
        return view();
    }

    /**
     * 添加方法
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function add () {
        /*过滤非Ajax请求*/
        if (!$this->isAjax()) {
            return null;
        }
        // 如果是post提交，这就是表单提交
        // 处理表单逻辑即可
        if ($this->isPost()) {
            // 获取表单提交数据
            $data = $this->request->post();
            // 实例化模型
            $model = model($this->table);
            // 获取上传文件的名称列表
            $uploadFields = $model->uploadFields;
            // 不为空时进行文件上传
            if (!empty($uploadFields)) {
                // 定义一个已经上传文件的数组
                $alreadyUploads = [];
                foreach ($uploadFields as $key => $val) {
                    // $val 不是一个数组则返回
                    if (!is_array($val)) {
                        // 删除已经上传成功的文件
                        if (!empty($alreadyUploads)) {
                            foreach ($alreadyUploads as $value) {
                                fileRefsDec($value);
                            }
                        }
                        return $this->handleJson(0, '上传文件配置格式不正确！');
                    }
                    if ($val['type'] == 'image') {
                        // 上传图片
                        $res = uploadImage($key);
                        if (is_integer($res)) {
                            $alreadyUploads[$key] = $res;
                        } else {
                            // 删除已经上传成功的文件
                            if (!empty($alreadyUploads)) {
                                foreach ($alreadyUploads as $value) {
                                    fileRefsDec($value);
                                }
                            }
                            return $this->handleJson(0, $res);
                        }
                    } else if ($val['type'] == 'file') {
                        // 上传文件
                        if (isset($val['ext'])) {
                            $res = uploadFile($key, $val['ext']);
                        } else {
                            $res = uploadFile($key);
                        }
                        if (is_integer($res)) {
                            $alreadyUploads[$key] = $res;
                        } else {
                            // 删除已经上传成功的文件
                            if (!empty($alreadyUploads)) {
                                foreach ($alreadyUploads as $value) {
                                    fileRefsDec($value);
                                }
                            }
                            return $this->handleJson(0, $res);
                        }
                    } else {
                        // 删除已经上传成功的文件
                        if (!empty($alreadyUploads)) {
                            foreach ($alreadyUploads as $value) {
                                fileRefsDec($value);
                            }
                        }
                        return $this->handleJson(0, '上传文件配置的类型不正确！');
                    }
                }
                // 所有文件上传成功，将上传结果放入data数组中
                foreach ($alreadyUploads as $key => $val) {
                    $data[$key] = $val;
                }
            }
            // 插入和更新前的公共操作
            if (method_exists($this, 'beforeAlter')) {
                $this->beforeAlter($data);
            }
            // 验证通过后，对插入之前对要插入的数据进行处理
            if (method_exists($this, 'beforeInsert')) {
                $this->beforeInsert($data);
            }
            // 获取相应的验证器实例
            $validate = validate($this->table);
            // 对表表单数据进行验证
            $res = $validate->scene('add')->check($data);
            // 验证不通过逻辑
            if (!$res) {
                return $this->handleJson(0, is_array($validate->getError()) ? join('，', $validate->getError()) : $validate->getError());
            }
            // 开启事务（注意：表结构要innoDB类型）
            $model->startTrans();
            try {
                $model->isUpdate(false)->data($data)->allowField(true)->save();
                $idName = config('system.sys_table_pk');
                $data[$idName] = $model->getAttr($idName);
                // 处理插入和更新后的公共操作
                if (method_exists($this, 'afterAlter')) {
                    $this->afterAlter($data);
                }
                // 处理插入之后的逻辑
                if (method_exists($this, 'afterInsert')) {
                    $this->afterInsert($data);
                }
                // 没有出现错误进行提交
                $model->commit();
            } catch(\Exception $exception) {
                // 出现错误进行回滚
                $model->rollback();
                // 删除已经上传成功的图片（如果有的话）
                if (!empty($alreadyUploads)) {
                    foreach ($alreadyUploads as $val) {
                        fileRefsDec($val);
                    }
                }
                return $this->handleJson(0, '添加出错：' . $exception->getMessage());
            }
            return $this->handleJson(1, '添加成功！', true);
        }
        // 不是表单提交处理逻辑
        // 查询数据字典的值放入页面
        $model = model($this->table);
        if (!empty($model->fieldDictNames)) {
            // 获取C风格表名加前缀
            $tableName = getTableNameOfPrefixWithCStyle($this->table);
            // 遍历数据字典字段名字
            foreach ($model->fieldDictNames as $val) {
                // 将数据字典值含义数组发到页面
                $this->assign($val . '_values_meanings', getMeaningsOfFieldValues($tableName, $val));
            }
        }

        // 添加前的操作
        if (method_exists($this, 'beforeAdd')) {
            $this->beforeAdd();
        }
        // 添加和修改前的公共操作
        if (method_exists($this, 'beforeUpdate')) {
            $this->beforeUpdate();
        }
        // 返回视图
        return view('update');
    }

    /**
     * 修改方法
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function edit () {
        /*过滤非Ajax请求*/
        if (!$this->isAjax()) {
            return null;
        }
        // 获取待修改的数据的主键（在这里默认所有表的主键都是id）
        $idName = config('system.sys_table_pk');
        $id = $this->request->param($idName, '');
        // 如果没有主键，则直接返回
        if (empty($id)) {
            return $this->handleJson(0, '主键丢失！');
        }
        // 实例化模型
        $model = model($this->table);
        // 获取旧的数据
        $oldData = $model->with($model->relationModels)->where($idName, $id)->find();
        // 讲旧数据转为数组
        castToArray($oldData);
        // 如果是POST提交，则进行修改逻辑处理
        if ($this->isPost()) {
            // 获取到表单数据（包括id）
            $data = $this->request->post();
            // 获取上传文件的名称列表
            $uploadFields = $model->uploadFields;
            // 待删除的文件id数组
            $delFileIds = [];
            // 不为空时进行文件上传
            if (!empty($uploadFields)) {
                // 定义一个已经上传文件的数组
                $alreadyUploads = [];
                foreach ($uploadFields as $key => $val) {
                    // 这里是修改特例，如果文件不存在，则代表不修改，直接跳过
                    if (!$this->request->file($key)) {
                        continue;
                    }
                    // $val 不是一个数组则返回
                    if (!is_array($val)) {
                        // 删除已经上传成功的文件
                        if (!empty($alreadyUploads)) {
                            foreach ($alreadyUploads as $value) {
                                fileRefsDec($value);
                            }
                        }
                        return $this->handleJson(0, '上传文件配置格式不正确！');
                    }
                    if ($val['type'] == 'image') {
                        // 上传图片
                        $res = uploadImage($key);
                        if (is_integer($res)) {
                            $alreadyUploads[$key] = $res;
                        } else {
                            // 删除已经上传成功的文件
                            if (!empty($alreadyUploads)) {
                                foreach ($alreadyUploads as $value) {
                                    fileRefsDec($value);
                                }
                            }
                            return $this->handleJson(0, $res);
                        }
                    } else if ($val['type'] == 'file') {
                        // 上传文件
                        if (isset($val['ext'])) {
                            $res = uploadFile($key, $val['ext']);
                        } else {
                            $res = uploadFile($key);
                        }
                        if (is_integer($res)) {
                            $alreadyUploads[$key] = $res;
                        } else {
                            // 删除已经上传成功的文件
                            if (!empty($alreadyUploads)) {
                                foreach ($alreadyUploads as $value) {
                                    fileRefsDec($value);
                                }
                            }
                            return $this->handleJson(0, $res);
                        }
                    } else {
                        // 删除已经上传成功的文件
                        if (!empty($alreadyUploads)) {
                            foreach ($alreadyUploads as $value) {
                                fileRefsDec($value);
                            }
                        }
                        return $this->handleJson(0, '上传文件配置的类型不正确！');
                    }
                }
                // 所有文件上传成功，将上传结果放入data数组中
                foreach ($alreadyUploads as $key => $val) {
                    $data[$key] = $val;
                    // 干掉记录中已经上传的文件
                    array_push($delFileIds, $oldData[$key]);
                }
            }
            // 插入和更新前的公共操作
            if (method_exists($this, 'beforeAlter')) {
                $this->beforeAlter($data);
            }
            // 数据验证通过后就可以执行修改前的操作了
            if (method_exists($this, 'beforeModify')) {
                $this->beforeModify($data, $oldData);
            }
            // 实例化验证器
            $validate = validate($this->table);
            // 根据场景验证数据
            $res = $validate->scene('edit')->check($data);
            // 数据验证不合法返回错误
            if (!$res) {
                return $this->handleJson(0, is_array($validate->getError()) ? join('，', $validate->getError()) : $validate->getError());
            }
            // 开启事务
            $model->startTrans();
            try {
                $model->isUpdate(true)->allowField(true)->data($data)->save();
                // 干掉之前的文件引用
                foreach ($delFileIds as $val) {
                    if (($res = fileRefsDec($val)) !== true) {
                        // 删除失败时，抛出异常
                        throw new \Exception($res);
                    }
                }
                // 处理插入和更新后的公共操作
                if (method_exists($this, 'afterAlter')) {
                    $this->afterAlter($data);
                }
                // 处理更新后的操作
                if (method_exists($this, 'afterModify')) {
                    $this->afterModify($data, $oldData);
                }
                // 事务提交
                $model->commit();
            } catch(\Exception $exception) {
                // 事务回滚
                $model->rollback();
                // 删除已经上传成功的图片（如果有的话）
                if (!empty($alreadyUploads)) {
                    foreach ($alreadyUploads as $val) {
                        fileRefsDec($val);
                    }
                }
                return $this->handleJson(0, '修改出错：' . $exception->getMessage());
            }
            return $this->handleJson(1, '修改成功！', true);
        }
        // 不是POST提交，则执行展示逻辑

        // 查询数据字典的值放入页面
        $model = model($this->table);
        if (!empty($model->fieldDictNames)) {
            // 遍历数据字典字段名字
            foreach ($model->fieldDictNames as $val) {
                // 将数据字典值含义数组发到页面
                $this->assign($val . '_values_meanings', getMeaningsOfFieldValues(getTableNameOfPrefixWithCStyle($this->table), $val));
            }
        }

        // 修改页面展现之前的操作
        if (method_exists($this, 'beforeEdit')) {
            $this->beforeEdit($oldData);
        }
        // 添加和修改前的公共操作
        if (method_exists($this, 'beforeUpdate')) {
            $this->beforeUpdate();
        }
        // 返回一个标志
        $this->assign('data', $oldData);
        // 返回视图
        return view('update');
    }

    /**
     * 删除方法
     * @return \think\response\Json
     * @throws \think\exception\PDOException
     */
    public function del () {
        // 这里删除只能是get方式
        if ($this->isGetAndAjax()) {
            return null;
        }
        // 获取要删除的数据的主键
        $idName = config('system.sys_table_pk');
        $id = $this->request->param($idName, '');
        // 如果主键为空则直接返回
        if (empty($id)) {
            return $this->handleJson(0, '主键丢失！');
        }
        // 实例化模型
        $model = model($this->table);
        // 开启事务
        $model->startTrans();
        try {
            $res = $model->where($idName, $id)->find();
            // 如果找不到
            if (empty($res)) {
                return $this->handleJson(0, '数据不存在或已被删除！');
            }
            // 删除前执行的操作
            $oldData = $res->toArray();
            if (method_exists($this, 'beforeDel')) {
                $this->beforeDel($oldData);
            }
            // 删除数据
            $res->delete();
            // 删除上传文件（如果有的话）
            $uploadFields = array_keys($model->uploadFields);
            if (!empty($uploadFields)) {
                foreach ($uploadFields as $field) {
                    fileRefsDec($oldData[$field]);
                }
            }
            // 事务提交
            $model->commit();
        } catch (\Exception $exception) {
            // 事务回滚
            $model->rollback();
            return $this->handleJson(0, '删除出错：' . $exception->getMessage());
        }
        return $this->handleJson(1, '删除成功！');
    }
}

