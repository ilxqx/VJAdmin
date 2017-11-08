VJ Admin 1.0.0
===============

## 系统介绍

该Admin系统继承了tp5和bjui的传统风格，但又基于其进行了拓展，为的就是方便开发高拓展性和高伸缩性的框架，其主要特性包括：

 + 功能的自动生成（完全应对包括有文件上传这样的功能）
 + 清晰的架构，志在减少代码的重复性
 + 完善的基础功能（让开发变得更加便捷）
 + 后续会继承大量常用功能（包括微信，二维码，PHPWord，PHPExcel等）

> 运行环境要求PHP5.6以上。

对tp5不了解，可以参考开发文档 [ThinkPHP5完全开发手册](http://www.kancloud.cn/manual/thinkphp5)

## 演示地址

[http://vjadmin.ixiaopeng.cn](http://vjadmin.ixiaopeng.cn)

用户名：youke

密码：123456

## 开发规范

> 1.模块名称统一使用小写加下划线（多个单词用下划线分割）

> 2.控制器名称在定义php类文件时使用驼峰命名，在使用时，比如地址栏输入小写加下划线的形式

> 3.方法名称统一使用驼峰命名，（以小写字母开头）

## 目录结构

本系统目录结构如下：
```
www  WEB部署目录（或者子目录）
├─app           应用目录
│  ├─common             应用公共函数目录
│  |  ├─common.php      应用公共函数文件
│  ├─admin              admin模块目录
│  │  ├─config          模块配置文件目录
│  │  |  ├─config.php   模块配置文件
│  │  ├─extra           拓展配置文件目录（可选）
│  │  ├─controller      控制器目录
│  │  ├─model           模型目录
│  │  ├─view            视图目录
│  │  └─validate        验证器目录
│  │
│  ├─base               base模块目录
│  |  ├─controller      控制器目录
│  |  |  ├─Base.php     base控制器文件
│  |  ├─model           模型目录
│  |  |  ├─Base.php     base模型文件
│  |  ├─validate        验证器目录
│  |  |  ├─Base.php     base验证器文件
│  ├─config             应用配置目录
│  |  ├─config.php      应用配置文件
│  |  ├─route.php       应用路由配置文件
│  |  ├─tags.php        应用行为扩展定义文件
│  |  └─database.php    应用数据库配置文件
│  ├─extra              应用其他配置目录
│  ├─template           菜单自动生成模板目录
│  |  ├─Controller.vj   控制器模板文件
│  |  ├─Model.vj        模型模板文件
│  |  ├─Validate.vj     验证器模板文件
│  |  ├─index.vj        功能首页模板文件
│  |  └─udpate.vj       功能添加修改模板文件
│
├─public                WEB目录（对外访问目录）
│  ├─index.php          入口文件
│  ├─router.php         快速测试文件
│  └─.htaccess          用于apache的重写
│
├─thinkphp              框架系统目录
│  ├─lang               语言文件目录
│  ├─library            框架类库目录
│  │  ├─think           Think类库包目录
│  │  └─traits          系统Trait目录
│  │
│  ├─tpl                系统模板目录
│  ├─base.php           基础定义文件
│  ├─console.php        控制台入口文件
│  ├─convention.php     框架惯例配置文件
│  ├─helper.php         助手函数文件
│  ├─phpunit.xml        phpunit配置文件
│  └─start.php          框架入口文件
│
├─backup                数据库备份sql文件存放目录
|
├─extend                扩展类库目录
|  ├─cn                 cn扩展类库目录
|  |  ├─ixiaopeng       ixiaopeng扩展类库目录
|  |  |  ├─backup       备份扩展类库目录
|  |  |  |  └─Backup.php备份类库文件
|
├─runtime               应用的运行时目录（可写，可定制）
├─vendor                第三方类库目录（Composer依赖库）
├─build.php             自动生成定义文件（参考）
├─composer.json         composer 定义文件
├─LICENSE.txt           授权说明文件
├─README.md             README 文件
├─think                 命令行入口文件
```
