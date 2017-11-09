VJ Admin 1.1.1
===============

## 系统介绍

首先感谢ThinkPHP5和BJUI。该Admin系统继承了tp5和bjui的传统风格，对bjui框架源码进行了改动，基于其进行了拓展，为的就是方便开发高拓展性和高伸缩性的框架，其主要特性包括：

 + 功能的自动生成（完全应对包括有文件上传这样的功能）
 + 清晰的架构，志在减少代码的重复
 + 完善的基础功能（让开发变得更加便捷）
 + 后续会继承大量常用功能（包括微信，PHPWord，PHPExcel等）

> 运行环境要求PHP5.6以上。

对tp5不了解，可以参考开发文档 [ThinkPHP5完全开发手册](http://www.kancloud.cn/manual/thinkphp5)

## 演示地址

[http://vjadmin.ixiaopeng.cn](http://vjadmin.ixiaopeng.cn)

*用户名：youke*

*密码：123456*

## 开发规范

> + 模块名称统一使用小写加下划线（多个单词用下划线分割）
> + 控制器名称在定义php类文件时使用驼峰命名，在使用时，比如地址栏输入小写加下划线的形式
> + 方法名称统一使用驼峰命名，（以小写字母开头）
> + index代表列表页面（对应的方法为index方法），update代表添加和修改页面（对应的方法为add和edit方法），del代表删除方法，detail代表详情方法
> + 返回数据统一使用Base类中提供的handleJson方法，即一般调用方式`$this->handleJson(状态码，信息，是否关闭当前对话框或者tab页面，其他信息)`
> + 返回状态码：0->失败，1->成功，2->session超时，需要重新登录

## 目录结构

本系统目录结构如下：
```
www  WEB部署目录（或者子目录）
├─app           应用目录
│  ├─common                 应用公共函数目录
│  |  ├─common.php          应用公共函数文件
│  ├─admin                  admin模块目录
│  │  ├─config              模块配置文件目录
│  │  |  ├─config.php       模块配置文件
│  │  ├─extra               拓展配置文件目录（可选）
│  │  ├─controller          控制器目录
│  │  ├─model               模型目录
│  │  ├─view                视图目录
│  │  └─validate            验证器目录
│  │
│  ├─base                   base模块目录
│  |  ├─controller          控制器目录
│  |  |  ├─Base.php         base控制器文件
│  |  ├─model               模型目录
│  |  |  ├─Base.php         base模型文件
│  |  ├─validate            验证器目录
│  |  |  ├─Base.php         base验证器文件
│  ├─config                 应用配置目录
│  |  ├─config.php          应用配置文件
│  |  ├─route.php           应用路由配置文件
│  |  ├─tags.php            应用行为扩展定义文件
│  |  └─database.php        应用数据库配置文件
│  ├─extra                  应用其他配置目录
│  |  └─qr_code_config.php  二维码生成配置文件
│  ├─template               菜单自动生成模板目录
│  |  ├─Controller.vj       控制器模板文件
│  |  ├─Model.vj            模型模板文件
│  |  ├─Validate.vj         验证器模板文件
│  |  ├─index.vj            功能首页模板文件
│  |  └─udpate.vj           功能添加修改模板文件
│
├─public                    WEB目录（对外访问目录）
│  ├─index.php              入口文件
│  ├─router.php             快速测试文件
│  └─.htaccess              用于apache的重写
│
├─thinkphp                  框架系统目录
│  ├─lang                   语言文件目录
│  ├─library                框架类库目录
│  │  ├─think               Think类库包目录
│  │  └─traits              系统Trait目录
│  │
│  ├─tpl                    系统模板目录
│  ├─base.php               基础定义文件
│  ├─console.php            控制台入口文件
│  ├─convention.php         框架惯例配置文件
│  ├─helper.php             助手函数文件
│  ├─phpunit.xml            phpunit配置文件
│  └─start.php              框架入口文件
│
├─backup                    数据库备份sql文件存放目录
|
├─extend                    扩展类库目录
|  ├─cn                     cn扩展类库目录
|  |  ├─ixiaopeng           ixiaopeng扩展类库目录
|  |  |  ├─backup           备份扩展类库目录
|  |  |  |  └─Backup.php    备份类库文件
|
├─runtime                   应用的运行时目录（可写，可定制）
├─vendor                    第三方类库目录（Composer依赖库）
├─build.php                 自动生成定义文件（参考）
├─composer.json             composer 定义文件
├─LICENSE.txt               授权说明文件
├─README.md                 README 文件
├─think                     命令行入口文件
```

## 系统使用

> 系统中的admin模块里面有Demo控制器，Demo模型，Demo验证器的示例，里面注释详细，使用简介，一看即会。

## 系统公用函数库API的使用

> 1.getManagerId

作用：获取`session`中保存的`managerId`

参数：无

返回值：`integer` 管理员ID

使用：调用例子：`$id = getManagerId();`

> 2.getUUID

作用：生成唯一的字符串，常用于文件上传后的文件名等

参数：无

返回值：`string` UUID 唯一字符串

使用：调用例子：`$uuid = getUUID();`

> 3.uploadImage

作用：上传图片

参数：`string` 图片引用名字（也就是前台表单中的name值）

返回值：`int|string` 成功返回int类型的图片记录的id，失败返回错误信息字符串
这个id也就是系统中SysFile表中的id值

使用：调用例子：
```php
$res = uploadImage($name); // $name 为前台表单的name属性值
if (is_integer($res)) { // 也可以使用is_string()先判断上传失败的情况
    // 上传成功
    ...
} else {
    // 上传失败 此事$res为失败的原因字符串
    ...
}
```

> 4.uploadFile

作用：上传文件

参数：`string` 文件引用名字（也就是前台表单中的name值），`string` 文件允许的后缀（默认为空，不限制）（多个后缀以英文逗号分隔）

返回值：`int|string` 成功返回int类型的图片记录的id，失败返回错误信息字符串
这个id也就是系统中SysFile表中的id值

使用：调用例子：
```php
$res = uploadFile($name); // $name 为前台表单的name属性值
if (is_integer($res)) { // 也可以使用is_string()先判断上传失败的情况
    // 上传成功
    ...
} else {
    // 上传失败 此事$res为失败的原因字符串
    ...
}
```

> 5.fileRefsInc

作用：文件引用计数加1

参数：`integer` 文件对应的id

返回值：`bool|string` 成功返回true，错误返回错误信息

使用：调用例子：`fileRefsInc($fileId);`

注意：一般来说该API不需用用户来调用，由上传图片和文件的函数内部调用

> 6.fileRefsDec

作用：文件引用计数减1

参数：`integer` 文件对应的id

返回值：`bool|string` 成功返回true，错误返回错误信息

使用：调用例子：`fileRefsDec($fileId);`

注意：一般来说该API不需用用户来调用，由上传图片和文件的函数内部调用

> 7.castToArray

作用：将模型对象或模型对象数组转为纯数组

参数：`array<\think\Model> | \think\Model` 模型对象数组或者模型对象

返回值：无

使用：调用例子：`castToArray($data);`

> 8.getMeaningsOfFieldValues

作用：获取字段字典字段值含义的数组

参数：`string` 表名，`string` 字段名

返回值：`array` 数组（数组每一项包含两个键值value和meaning）

使用：调用例子：`$arr = getMeaningsOfFieldValues($tableName, $fieldName);`

> 9.getFieldValues

作用：获取某一字段的所有可取的值

参数：`string` 表名，`string` 字段名

返回值：`array` 字段值数组

使用：调用例子：`$arr = getFieldValues($tableName, $fieldName);`

> 10.getFieldValuesStr

作用：将某一字段可取的值连接为字符串

参数：`string` 表名，`string` 字段名，`string` 分隔符（默认为英文逗号）

返回值：`string` 连接后的字符串

使用：调用例子：`$str = getFieldValuesStr($tableName, $fieldName, ','); // 以逗号连接`

> 11.getTableNameOfPrefixWithCStyle

作用：根据驼峰式模型名获取C风格加表前缀的表名

参数：`string` 驼峰式模型名

返回值：`string` C风格并且加表前缀的表名

使用：调用例子：`$str = getTableNameOfPrefixWithCStyle('SysManager'); // 得到 vj_sys_manager`

> 12.toCStyle

作用：将字符串转为C风格形式（xxx_xxx）

参数：`string` 待转字符串

返回值：`string` C风格字符串

使用：调用例子：`$str = toCStyle('HelloWorld'); // 得到 hello_world`

> 13.toJavaStyle

作用：将字符串转为Java风格形式（驼峰式 XxxXxx）

参数：`string` 待转字符串

返回值：`string` Java风格字符串

使用：调用例子：`$str = toCStyle('hello_world'); // 得到 HelloWorld`

> 14.getFileUrl

作用：获取文件地址

参数：`integer` 文件id，`bool` 是否连接域名（默认为false）

返回值：`string` 文件的url地址

使用：调用例子：`$url = getFileUrl($fileId); // 连接域名的默认为false`

> 15.getSysOption

作用：获取系统选项的值

参数：`string` 系统选项名

返回值：`string` 系统选项的值

使用：调用例子：`$value = getSysOption($name);`

> 16.qrCode

作用：生成二维码

参数：`string` 待生成的字符串，`bool` 是否返回错误字符串（默认为false）

返回值：`bool|string` 返回false、生成二维码的url绝对地址或者错误字符串（取决于第二个参数）

使用：调用例子：
```php
$qrUrl = qrCode($text);
if ($qrUrl !== false) {
    // 生成二维码成功 $qrUrl为二维码的绝对路径url（默认保存在/public/generator/*.png）
    // 生成二维码的配置项在app目录下面的extra目录中的qr_code_config.php中
    ...
} else {
    // 生成二维码失败，可以通过设置第二个参数为true查看失败原因
}
```

