<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Venus <iweixiaopeng@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
use think\Db;
use think\Loader;

/**
 * 获取 managerId
 * @return string
 */
function getManagerId () {
    return session('managerId');
}

/**
 * 生成UUID
 * @return string
 */
function getUUID () {
    $str = md5(uniqid(mt_rand(), true));
    $uuid  = substr($str,0,8) . '-';
    $uuid .= substr($str,8,4) . '-';
    $uuid .= substr($str,12,4) . '-';
    $uuid .= substr($str,16,4) . '-';
    $uuid .= substr($str,20,12);
    return 'vj' . $uuid;
}

/**
 * 上传图片
 * @param $imgName string 图片引用名字
 * @return int|string 成功返回int类型的图片记录id，失败返回错误信息字符串
 */
function uploadImage ($imgName) {
    // 获取img文件
    $img = request()->file($imgName);
    // 如果img文件存在的话就开始上传
    if ($img) {
        // 获取上传图片的配置
        $config = config('uploads.image');
        // 获取相对路径和绝对路径
        $relPath = config('uploads.relativePath') . 'images' . DS;
        $absPath = rtrim(config('uploads.absolutePath') . $relPath, DS);
        // 获取文件模型
        $model = model('app\\admin\\model\\SysFile');
        // 判断文件是否存在
        try {
            // 查询是否有满足的记录
            $res = $model->where([
                'sha1' => $img->hash('sha1'),
                'type' => 'a'
            ])->find();
        } catch (Exception $exception) {
            return $exception->getMessage();
        }
        // 如果不为空则直接引用
        if (!empty($res)) {
            try {
                // 引用计数加一
                $res->setInc('refs');
            } catch (Exception $exception) {
                // 出现错误直接返回
                return $exception->getMessage();
            }
            // 返回该图片记录的id
            return $res->getAttr(config('system.sys_table_pk'));
        }
        // 上传
        $info = $img->validate($config)->rule('getUUID')->move($absPath);
        if ($info) {
            // 获取文件名字
            $imgName = $info->getSaveName();
            // 获取原文件名字
            $name = $info->getInfo('name');
            // 获取文件的sha1值
            $sha1 = $info->hash('sha1');
            // 开启事务
            $model->startTrans();
            try {
                // 新增一条数据
                $model->isUpdate(false)->data([
                    'name' => $name,
                    'relative_url' => $relPath . $imgName,
                    'sha1' => $sha1,
                    'refs' => 1,
                    'type' => 'a'
                ])->save();
                // 新增成功，进行提交
                $model->commit();
                // 返回新增文件的数据库id
                return intval($model->getAttr('id'));
            } catch (Exception $exception) {
                // 上传失败，回滚
                $model->rollback();
                // 删除刚刚上传的文件
                if (is_file($absPath . DS . $imgName)) {
                    unlink($absPath . DS . $imgName);
                }
                // 返回错误
                return $exception->getMessage();
            }
        } else {
            // 如果上传出错，返回错误
            return $info->getError();
        }
    }
    // 文件不存在则返回错误
    return '没有上传图片！';
}

/**
 * 上传文件
 * @param $fileName string 文件引用名字
 * @param $ext string 文件允许的后缀
 * @return int|string 成功返回int类型的图片记录id，失败返回错误信息字符串
 */
function uploadFile ($fileName, $ext = '') {
    // 获取file文件
    $file = request()->file($fileName);
    // 如果file文件存在的话就开始上传
    if ($file) {
        // 获取上传文件的配置
        $config = config('uploads.file');
        // 获取相对路径和绝对路径
        $relPath = config('uploads.relativePath') . 'files' . DS;
        $absPath = rtrim(config('uploads.absolutePath') . $relPath, DS);
        // 获取文件模型
        $model = model('app\\admin\\model\\SysFile');
        // 获取主键名称
        $idName = config('system.sys_table_pk');
        // 判断文件是否存在
        try {
            // 查询是否有满足的记录
            $res = $model->where([
                'sha1' => $file->hash('sha1'),
                'type' => 'b'
            ])->find();
        } catch (Exception $exception) {
            return $exception->getMessage();
        }
        // 如果不为空则直接引用
        if (!empty($res)) {
            try {
                // 引用计数加一
                $res->setInc('refs');
            } catch (\Exception $exception) {
                // 出现错误直接返回
                return $exception->getMessage();
            }
            // 返回该文件记录的id
            return $res->getAttr($idName);
        }
        // 上传
        $info = $file->validate(array_merge($config, [
            'ext' => explode(',', $ext)
        ]))->rule('getUUID')->move($absPath);
        if ($info) {
            // 获取文件名字
            $fileName = $info->getSaveName();
            // 获取原文件名字
            $name = $info->getInfo('name');
            // 获取文件的sha1值
            $sha1 = $info->hash('sha1');
            // 开启事务
            $model->startTrans();
            try {
                // 新增一条数据
                $model->isUpdate(false)->data([
                    'name' => $name,
                    'relative_url' => $relPath . $fileName,
                    'sha1' => $sha1,
                    'refs' => 1,
                    'type' => 'b'
                ])->save();
                // 新增成功，进行提交
                $model->commit();
                // 返回新增文件的数据库id
                return intval($model->getAttr($idName));
            } catch (Exception $exception) {
                // 上传失败，回滚
                $model->rollback();
                // 删除刚刚上传的文件
                if (is_file($absPath . DS . $fileName)) {
                    unlink($absPath . DS . $fileName);
                }
                // 返回错误
                return $exception->getMessage();
            }
        } else {
            // 如果上传出错，返回错误
            return $info->getError();
        }
    }
    // 文件不存在则返回错误
    return '没有上传文件！';
}

/**
 * 文件引用计数加1
 * @param $id string|integer 文件信息对应的id
 * @return bool|string 成功返回true，错误返回错误信息
 */
function fileRefsInc ($id) {
    // 获取主键名称
    $idName = config('system.sys_table_pk');
    // 主键引用计数加1
    try {
        $file = model('app\\admin\\model\\SysFile')->where($idName, $id)->find();
        if (empty($file)) {
            return '文件并不存在！';
        }
        $file->setInc('refs');
        return true;
    } catch (Exception $exception) {
        return $exception->getMessage();
    }
}

/**
 * 文件引用计数减1
 * @param $id string|integer 文件信息对应的id
 * @return bool|string 成功返回true，错误返回错误信息
 */
function fileRefsDec ($id) {
    // 获取主键名称
    $idName = config('system.sys_table_pk');
    // 主键引用计数加1
    try {
        $file = model('app\\admin\\model\\SysFile')->where($idName, $id)->find();
        if (empty($file)) {
            return '文件并不存在！';
        }
        $file->setDec('refs');
        // 如果引用计数为0，则删除
        if ($file->getAttr('refs') == 0) {
            // 拼接文件绝对路径
            $filePath = config('uploads.absolutePath') . $file->getAttr('relative_url');
            // 删除文件记录
            $file->delete();
            // 删除真实文件
            if (is_file($filePath)) {
                unlink($filePath);
            }
        }
        return true;
    } catch (Exception $exception) {
        return $exception->getMessage();
    }
}

/**
 * 将模型对象或模型对象数组转为纯数组
 * @param $item array | \think\Model
 */
function castToArray (&$item) {
    // 如果是数组则判断每个元素是不是
    if (is_array($item)) {
        foreach ($item as &$val) {
            // 对数组的每一个元素进行递归调用
            castToArray($val);
        }
    } else if ($item instanceof \think\Model) {
        // 仅仅是Model对象，转为数组
        $item = $item->toArray();
    }
}

/**
 * 获取字段字典字段值含义的数组
 * @param $table string 表名
 * @param $field string 字段名
 * @return array 返回数组
 */
function getMeaningsOfFieldValues ($table, $field) {
    // 获取数据字段模型
    $model = model('app\\admin\\model\\SysFieldDict');
    // 返回查询到的字段值含义的数组
    $arr = $model->field([
        'value',
        'meaning'
    ])->where([
        'table' => $table,
        'field' => $field
    ])->order(config('system.sys_table_pk'), 'asc')->select();
    castToArray($arr);
    return $arr;
}

/**
 * 获取某一字段的所有可取的值
 * @param $table string 表名
 * @param $field string 字段名
 * @return mixed 字段值数组
 */
function getFieldValues ($table, $field) {
    // 获取数据字段模型
    $model = model('app\\admin\\model\\SysFieldDict');
    // 返回查询到的字段值的数组
    $arr = $model->where([
        'table' => $table,
        'field' => $field
    ])->order(config('system.sys_table_pk'), 'asc')->column('value');
    return $arr;
}

/**
 * 将某一字段可取的值连接为字符串
 * @param $table string 表名
 * @param $field string 字段名
 * @param string $sep string 分隔符
 * @return string
 */
function getFieldValuesStr ($table, $field, $sep = ',') {
    return join($sep, getFieldValues($table, $field));
}

/**
 * 获取C风格加表前缀的表名
 * @param $modelName string 表名
 * @return string C风格并且加表前缀的表名
 */
function getTableNameOfPrefixWithCStyle ($modelName) {
    return config('database.prefix') . toCStyle($modelName);
}

/**
 * 将字符串转为C风格形式（xxx_xxx）
 * @param $string
 * @return string
 */
function toCStyle ($string) {
    return Loader::parseName($string, 0);
}

/**
 * 将字符串转为Java风格形式（驼峰式 XxxXxx）
 * @param $string
 * @return string
 */
function toJavaStyle ($string) {
    return Loader::parseName($string, 1);
}

/**
 * 登录检测
 * @param $account string 账号
 * @param $pwd string 密码
 * @return bool|array
 */
function loginCheck ($account, $pwd) {
    $model = model('app\\admin\\model\\SysManager');
    $manager = $model
        ->field([
            'id'
        ])
        ->where([
            'account' => $account,
            'pwd' => md5($pwd),
            'status' => 'a'
        ])
        ->find();
    if (empty($manager)) {
        return false;
    } else {
        castToArray($manager);
        return $manager;
    }
}

/**
 * session配置
 * @param array $arr 数组
 */
function setSession ($arr = []) {
    if (empty($arr)) {
        session('managerId', null);
        return;
    }
    session('managerId', $arr['id']);
}

/**
 * 获取文件地址
 * @param $id integer 文件id
 * @param $domain bool 是否连接域名
 * @return mixed|string
 */
function getFileUrl ($id, $domain = false) {
    /*文件id为空，直接返回*/
    if (empty($id)) {
        return '';
    }
    $url = model('app\\admin\\model\\SysFile')
        ->where([
            'id' => $id
        ])
        ->value('relative_url');
    return $domain ? request()->domain() . htmlspecialchars_decode($url) : htmlspecialchars_decode($url);
}

/**
 * 获取系统选项的值
 * @param $name string 系统选项名
 * @return mixed|string
 */
function getSysOption ($name) {
    if (empty($name)) {
        return '';
    }
    return model('app\\admin\\model\\SysOption')
        ->where([
            'name' => $name
        ])
        ->value('value');
}

/**
 * 获取应用所有的模块
 * @return array
 */
function getModules () {
    $handle = opendir(APP_PATH);
    $modules = [];
    while (false !== ($entry = readdir($handle))) {
        if ($entry !== '.' && $entry !== '..') {
            array_push($modules, $entry);
        }
    }
    $modules = array_diff($modules, config('deny_module_list'));
    return $modules;
}

/**
 * 获取所有的控制器
 * @param $module string 模块
 * @return array
 */
function getControllers ($module) {
    $controllers = [];
    $handle = opendir(APP_PATH . $module . DS . 'controller');
    while (false !== ($entry = readdir($handle))) {
        if ($entry !== '.' && $entry !== '..') {
            array_push($controllers, str_replace('.php', '', $entry));
        }
    }
    $controllers = array_diff($controllers, config('system.deny_controller'));
    return $controllers;
}

/**
 * 获取所有的方法
 * @param $module string 模块
 * @param $controller string 控制器
 * @return array
 */
function getMethods ($module, $controller) {
    $class = new \ReflectionClass("app\\{$module}\\controller\\{$controller}");
    $methods = $class->getMethods();
    $arr = [];
    foreach ($methods as $method) {
        if ($method->isUserDefined() && $method->isPublic()) {
            array_push($arr, $method->getShortName());
        }
    }
    return array_diff($arr, config('system.deny_method'));
}

/**
 * 获取管理员的角色id
 * @param $managerId integer 管理员id
 * @return mixed|null
 */
function getManagerRoleId ($managerId) {
    if (empty($managerId)) {
        return null;
    }
    return model('app\\admin\\model\\SysManager')
        ->where('id', $managerId)
        ->value('role_id');
}

/**
 * 验证请求权限
 * @return bool
 */
function authenticate () {
    $roleId = getManagerRoleId(getManagerId());
    /*如果管理员所属的角色被停用，则一样不能访问任何东西*/
    $status = model('app\\admin\\model\\SysRole')->where('id', $roleId)->value('status');
    if ($status !== 'a') {
        return false;
    }
    /*查询权限sql*/
    $sql = "SELECT `id` FROM `vj_sys_auth` 
            WHERE  `rule_module` = ?  
            AND `rule_controller` = ?  
            AND LOWER(`rule_method`) = ?
            LIMIT 1";
    /*查询权限id*/
    $auth = Db::name('SysAuth')->query($sql, [
        M, toJavaStyle(C), A
    ]);
    if (!empty($auth)) {
        $authId = $auth[0]['id'];
    } else {
        /*数据库中没有当前请求的权限记录，则允许所有管理有访问*/
        return true;
    }
    /*根据权限id查询当前管理员所属角色是否拥有该权限*/
    $count = model('app\\admin\\model\\SysRoleAuth')
        ->where([
            'role_id' => $roleId,
            'auth_id' => $authId
        ])
        ->count();
    return $count >= 1;
}

/**
 * 生成二维码
 * @param $text string 待生成的字符串
 * @param bool $retErr 是否返回错误字符串
 * @return bool|string
 */
function qrCode ($text, $retErr = false) {
    /*导入二维码类库*/
    import('phpqrcode.qrlib');
    /*获取二维码生成配置*/
    $config = config('qr_code_config');
    /*生成二维码图片名*/
    $name = $config['path'] . getUUID() . '.png';
    /*生成二维码*/
    try {
        QRcode::png($text,
            $name,
            $config['default_level'],
            $config['default_size'],
            $config['default_margin'],
            false,
            $config['default_back_color'],
            $config['default_fore_color']);
    } catch (Exception $exception) {
        /*如果是返回错误信息的化，就直接返回错误信息*/
        if ($retErr) {
            return $exception->getMessage();
        }
        /*否则直接返回false*/
        return false;
    }
    /*返回图片的绝对路径*/
    return $name;
}
