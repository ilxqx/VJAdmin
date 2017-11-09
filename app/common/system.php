<?php
/* +----------------------------------------------------------------------
 * 作	者: Venus <venus-wxp@outlook.com>
 +----------------------------------------------------------------------
 * 创建日期: 2017/11/9 21:15
 +----------------------------------------------------------------------
 * 文件描述: 系统使用的函数
 +----------------------------------------------------------------------
 * 升级记录: 
 +----------------------------------------------------------------------
 */

use think\Db;

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