<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Venus <iweixiaopeng@gmail.com>
// +----------------------------------------------------------------------

/*手势验证码路由注册*/
\think\Route::get('vaptcha/:sceneId', '\\cn\\ixiaopeng\\vaptcha\\VaptchaController@index');
/*收拾验证码没网时的验证*/
\think\Route::get('downtime', '\\cn\\ixiaopeng\\vaptcha\\VaptchaController@downtime');

return [
    '/' => 'admin/sys_home/index',
    'login' => 'admin/sys_login/login'
];
