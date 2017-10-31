/*
MySQL Database Backup Tools(Venus dump)
Server:127.0.0.1:
Database:vj_admin
Date:2017-10-31 10:24:34
*/
SET FOREIGN_KEY_CHECKS=0;
-------------------------------
-- Table structure for vj_sys_auth
-------------------------------
DROP TABLE IF EXISTS `vj_sys_auth`;
CREATE TABLE `vj_sys_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '权限名',
  `rule_module` varchar(50) NOT NULL COMMENT '模块',
  `rule_controller` varchar(50) NOT NULL COMMENT '控制器',
  `rule_method` varchar(50) NOT NULL COMMENT '方法',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `manager_id` int(10) unsigned NOT NULL COMMENT '管理员',
  `at_datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `fk_vj_sys_auth_manager_id` (`manager_id`),
  CONSTRAINT `fk_vj_sys_auth_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `vj_sys_manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_auth
-------------------------------
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('1', '系统首页', 'admin', 'SysHome', 'index', '系统首页', '1', '2017-10-29 20:23:41');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('2', '系统首页-获取菜单', 'admin', 'SysHome', 'getMenus', '获取系统首页的菜单列表', '1', '2017-10-29 21:02:40');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('4', '系统首页-注销', 'admin', 'SysHome', 'logout', '管理员注销登录', '1', '2017-10-29 21:02:26');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('5', '系统首页-更改密码', 'admin', 'SysHome', 'changePassword', '管理员密码更改', '1', '2017-10-29 21:02:17');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('6', '权限管理-获取控制器', 'admin', 'SysAuth', 'getControllers', '获取系统控制器列表', '1', '2017-10-29 21:02:01');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('7', '权限管理-获取方法', 'admin', 'SysAuth', 'getMethods', '获取系统方法列表', '1', '2017-10-29 21:01:50');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('8', '权限管理-列表', 'admin', 'SysAuth', 'index', '权限管理-列表', '1', '2017-10-29 21:05:35');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('9', '权限管理-添加', 'admin', 'SysAuth', 'add', '权限管理-添加', '1', '2017-10-29 20:57:01');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('10', '权限管理-修改', 'admin', 'SysAuth', 'edit', '权限管理-修改', '1', '2017-10-29 20:58:08');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('11', '权限管理-删除', 'admin', 'SysAuth', 'del', '权限管理-删除', '1', '2017-10-29 21:01:19');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('12', '字段字典-获取表字段', 'admin', 'SysFieldDict', 'getTableFields', '获取一张表中的所有字段', '1', '2017-10-29 21:04:56');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('13', '字段字典-列表', 'admin', 'SysFieldDict', 'index', '字段字典-列表', '1', '2017-10-29 21:05:25');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('14', '字段字典-添加', 'admin', 'SysFieldDict', 'add', '字段字典-添加', '1', '2017-10-29 21:05:58');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('15', '字段字典-修改', 'admin', 'SysFieldDict', 'edit', '字段字典-修改', '1', '2017-10-29 21:06:37');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('16', '字段字典-删除', 'admin', 'SysFieldDict', 'del', '字段字典-删除', '1', '2017-10-29 21:06:53');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('17', '用户管理-列表', 'admin', 'SysManager', 'index', '用户管理-列表', '1', '2017-10-29 21:07:59');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('18', '用户管理-添加', 'admin', 'SysManager', 'add', '用户管理-添加', '1', '2017-10-29 21:08:18');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('19', '用户管理-修改', 'admin', 'SysManager', 'edit', '用户管理-修改', '1', '2017-10-29 21:08:34');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('20', '用户管理-删除', 'admin', 'SysManager', 'del', '用户管理-删除', '1', '2017-10-29 21:08:46');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('21', '系统菜单-列表', 'admin', 'SysMenu', 'index', '系统菜单-列表', '1', '2017-10-29 21:09:43');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('22', '系统菜单-添加', 'admin', 'SysMenu', 'add', '系统菜单-添加', '1', '2017-10-29 21:10:02');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('23', '系统菜单-修改', 'admin', 'SysMenu', 'edit', '系统菜单-修改', '1', '2017-10-29 21:10:15');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('24', '系统菜单-删除', 'admin', 'SysMenu', 'del', '系统菜单-删除', '1', '2017-10-29 21:10:28');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('25', '菜单生成-首页', 'admin', 'SysMenuGenerator', 'index', '菜单生成-首页', '1', '2017-10-29 21:11:22');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('26', '菜单生成-生成', 'admin', 'SysMenuGenerator', 'generator', '菜单生成-生成', '1', '2017-10-29 21:11:38');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('27', '系统选项-列表', 'admin', 'SysOption', 'index', '系统选项-列表', '1', '2017-10-29 21:11:59');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('28', '系统选项-添加', 'admin', 'SysOption', 'add', '系统选项-添加', '1', '2017-10-29 21:12:11');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('29', '系统选项-修改', 'admin', 'SysOption', 'edit', '系统选项-修改', '1', '2017-10-29 21:12:24');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('30', '系统选项-删除', 'admin', 'SysOption', 'del', '系统选项-删除', '1', '2017-10-29 21:12:36');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('31', '角色管理-列表', 'admin', 'SysRole', 'index', '角色管理-列表', '1', '2017-10-29 21:13:06');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('32', '角色管理-添加', 'admin', 'SysRole', 'add', '角色管理-添加', '1', '2017-10-29 21:13:22');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('33', '角色管理-修改', 'admin', 'SysRole', 'edit', '角色管理-修改', '1', '2017-10-29 21:13:44');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('34', '角色管理-删除', 'admin', 'SysRole', 'del', '角色管理-删除', '1', '2017-10-29 21:13:59');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('35', '角色管理-授权', 'admin', 'SysRole', 'authorize', '角色管理-授权', '1', '2017-10-30 21:24:45');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('36', '数据备份-列表', 'admin', 'SysBackup', 'index', '数据备份-列表', '1', '2017-10-30 22:39:50');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('37', '数据备份-备份', 'admin', 'SysBackup', 'backup', '数据备份-备份', '1', '2017-10-30 22:40:10');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('39', '数据备份-还原', 'admin', 'SysBackup', 'restore', '数据备份-还原', '1', '2017-10-30 22:40:46');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('40', '数据备份-删除', 'admin', 'SysBackup', 'del', '数据备份-删除', '1', '2017-10-30 22:41:00');

-------------------------------
-- Table structure for vj_sys_field_dict
-------------------------------
DROP TABLE IF EXISTS `vj_sys_field_dict`;
CREATE TABLE `vj_sys_field_dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `field` varchar(50) NOT NULL COMMENT '字段名',
  `value` varchar(10) NOT NULL COMMENT '字段值',
  `meaning` varchar(50) NOT NULL COMMENT '含义',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `manager_id` int(10) unsigned NOT NULL COMMENT '管理员',
  `at_datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `fk_vj_sys_field_dict_manager_id` (`manager_id`),
  CONSTRAINT `fk_vj_sys_field_dict_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `vj_sys_manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_field_dict
-------------------------------
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('2', 'vj_sys_menu', 'status', 'a', '启用', '菜单的启动状况', '1', '2017-10-29 12:30:03');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('3', 'vj_sys_menu', 'status', 'b', '停用', '菜单的停用状态', '1', '2017-10-29 12:30:36');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('4', 'vj_sys_manager', 'status', 'a', '启用', '管理员的启用状态', '1', '2017-10-29 14:15:28');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('5', 'vj_sys_manager', 'status', 'b', '停用', '管理员的停用状态', '1', '2017-10-29 14:15:51');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('6', 'vj_sys_role', 'status', 'a', '启用', '角色启用状态', '1', '2017-10-29 15:46:04');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('7', 'vj_sys_role', 'status', 'b', '停用', '角色停用状态', '1', '2017-10-29 15:46:26');

-------------------------------
-- Table structure for vj_sys_file
-------------------------------
DROP TABLE IF EXISTS `vj_sys_file`;
CREATE TABLE `vj_sys_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `relative_url` varchar(255) NOT NULL,
  `sha1` varchar(50) NOT NULL,
  `refs` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(2) NOT NULL DEFAULT 'a',
  `at_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_file
-------------------------------
INSERT INTO `vj_sys_file` (`id`, `name`, `relative_url`, `sha1`, `refs`, `type`, `at_datetime`) VALUES ('11', 'Picture20161123140305_看图王.jpg', '\\uploads\\images\\vj2c79d955-4d1f-324c-11ab-47836702cd5f.jpg', '45ea02eecf9227d128a1c0b63f84cfff904e7bfa', '1', 'a', '2017-10-29 15:21:47');

-------------------------------
-- Table structure for vj_sys_manager
-------------------------------
DROP TABLE IF EXISTS `vj_sys_manager`;
CREATE TABLE `vj_sys_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL COMMENT '昵称',
  `account` varchar(16) NOT NULL COMMENT '账号',
  `pwd` varchar(32) NOT NULL COMMENT '密码',
  `avatar` int(10) unsigned NOT NULL COMMENT '头像',
  `role_id` int(10) unsigned NOT NULL,
  `status` varchar(2) NOT NULL DEFAULT 'a' COMMENT '状态',
  `manager_id` int(10) unsigned NOT NULL COMMENT '管理员',
  `at_datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `fk_vj_sys_manager_manager_id` (`manager_id`),
  KEY `fk_vj_sys_manager_avatar` (`avatar`),
  KEY `fk_vj_sys_manager_role_id` (`role_id`),
  CONSTRAINT `fk_vj_sys_manager_avatar` FOREIGN KEY (`avatar`) REFERENCES `vj_sys_file` (`id`),
  CONSTRAINT `fk_vj_sys_manager_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `vj_sys_manager` (`id`),
  CONSTRAINT `fk_vj_sys_manager_role_id` FOREIGN KEY (`role_id`) REFERENCES `vj_sys_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_manager
-------------------------------
INSERT INTO `vj_sys_manager` (`id`, `name`, `account`, `pwd`, `avatar`, `role_id`, `status`, `manager_id`, `at_datetime`) VALUES ('1', '超级管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '11', '1', 'a', '1', '2017-10-29 15:21:47');

-------------------------------
-- Table structure for vj_sys_menu
-------------------------------
DROP TABLE IF EXISTS `vj_sys_menu`;
CREATE TABLE `vj_sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '''菜单ID''',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '''菜单名称''',
  `seq` int(10) unsigned NOT NULL COMMENT '''排序''',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '''父菜单ID''',
  `icon` varchar(50) NOT NULL COMMENT '''图标类名''',
  `url` varchar(100) DEFAULT NULL COMMENT '''url''',
  `type_id` varchar(100) DEFAULT NULL,
  `status` varchar(2) NOT NULL DEFAULT 'a' COMMENT '''菜单状态''',
  `remark` varchar(255) DEFAULT NULL COMMENT '''菜单备注''',
  `manager_id` int(10) unsigned NOT NULL COMMENT '''管理员ID''',
  `at_datetime` datetime NOT NULL COMMENT '''操作日期''',
  PRIMARY KEY (`id`),
  KEY `fk_vj_menu_manager_id` (`manager_id`),
  CONSTRAINT `fk_sys_menu_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `vj_sys_manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_menu
-------------------------------
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('1', '系统管理', '1', '0', 'laptop', '', '', 'a', '系统核心管理', '1', '2017-10-30 20:14:52');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('2', '系统设置', '1', '1', 'cog', '', '', 'a', '系统的一些配置', '1', '2017-10-29 13:02:52');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('3', '系统菜单', '1', '2', 'th-large', 'admin/sys_menu/index', 'adminsys_menuindex', 'a', '系统菜单', '1', '2017-10-11 17:24:15');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('4', '系统数据', '2', '2', 'cubes', '', '', 'a', '系统使用到的数据', '1', '2017-10-23 12:27:56');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('5', '系统选项', '1', '4', 'asterisk', 'admin/sys_option/index', 'adminsys_optionindex', 'a', '系统配置选项', '1', '2017-10-28 17:41:42');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('6', '字段字典', '2', '4', 'send', 'admin/sys_field_dict/index', 'adminsys_field_dictindex', 'a', '数据表中的配置项', '1', '2017-10-23 12:36:24');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('7', '数据备份', '3', '1', 'database', 'admin/sys_backup/index', 'adminsys_backupindex', 'a', '数据备份管理', '1', '2017-10-30 21:40:53');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('8', '菜单生成', '2', '2', 'coffee', 'admin/sys_menu_generator/index', 'adminsys_menu_generatorindex', 'a', '生成菜单逻辑', '1', '2017-10-23 20:56:35');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('9', '权限设置', '2', '1', 'life-bouy', '', '', 'a', '对权限进行设置', '1', '2017-10-29 13:02:12');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('10', '用户管理', '1', '9', 'users', 'admin/sys_manager/index', 'adminsys_managerindex', 'a', '对系统的管理员进行管理', '1', '2017-10-29 17:25:02');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('11', '角色管理', '2', '9', 'user-circle', 'admin/sys_role/index', 'adminsys_roleindex', 'a', '对系统中的角色进行管理', '1', '2017-10-29 17:25:13');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('12', '权限管理', '3', '9', 'unlock-alt', 'admin/sys_auth/index', 'adminsys_authindex', 'a', '对系统中的权限进行管理', '1', '2017-10-29 17:25:25');

-------------------------------
-- Table structure for vj_sys_option
-------------------------------
DROP TABLE IF EXISTS `vj_sys_option`;
CREATE TABLE `vj_sys_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '键值',
  `value` varchar(100) NOT NULL COMMENT '值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `manager_id` int(10) unsigned NOT NULL COMMENT '管理员',
  `at_datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `vj_sys_option_manager_id` (`manager_id`),
  CONSTRAINT `vj_sys_option_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `vj_sys_manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_option
-------------------------------
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('4', '发多少', '发多少', '佛挡杀佛', '1', '2017-10-28 18:33:23');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('5', '系统时间', '哈哈', '这是锡系统时间', '1', '2017-10-29 11:48:36');

-------------------------------
-- Table structure for vj_sys_role
-------------------------------
DROP TABLE IF EXISTS `vj_sys_role`;
CREATE TABLE `vj_sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` varchar(2) NOT NULL COMMENT '状态',
  `manager_id` int(10) unsigned NOT NULL COMMENT '管理员',
  `at_datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `fk_vj_sys_role_manager_id` (`manager_id`),
  CONSTRAINT `fk_vj_sys_role_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `vj_sys_manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_role
-------------------------------
INSERT INTO `vj_sys_role` (`id`, `name`, `remark`, `status`, `manager_id`, `at_datetime`) VALUES ('1', '超级管理员', '这是超级管理员，拥有最高权限', 'a', '1', '2017-10-29 15:47:00');

-------------------------------
-- Table structure for vj_sys_role_auth
-------------------------------
DROP TABLE IF EXISTS `vj_sys_role_auth`;
CREATE TABLE `vj_sys_role_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` int(10) unsigned NOT NULL COMMENT '''权限的id''',
  `role_id` int(10) unsigned NOT NULL COMMENT '''权限所属角色''',
  PRIMARY KEY (`id`),
  KEY `vj_sys_role_auth_role_id` (`role_id`),
  KEY `vj_sys_role_auth_auth_id` (`auth_id`),
  CONSTRAINT `vj_sys_role_auth_auth_id` FOREIGN KEY (`auth_id`) REFERENCES `vj_sys_auth` (`id`),
  CONSTRAINT `vj_sys_role_auth_role_id` FOREIGN KEY (`role_id`) REFERENCES `vj_sys_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_role_auth
-------------------------------
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('2', '9', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('3', '7', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('4', '6', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('5', '8', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('6', '10', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('7', '11', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('8', '12', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('10', '14', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('11', '15', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('12', '16', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('13', '1', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('14', '2', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('15', '4', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('16', '5', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('17', '17', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('18', '18', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('19', '19', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('20', '20', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('21', '21', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('22', '22', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('23', '23', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('24', '24', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('25', '25', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('26', '26', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('27', '27', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('28', '28', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('29', '29', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('30', '30', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('31', '31', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('32', '32', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('33', '33', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('34', '34', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('35', '13', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('36', '35', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('37', '36', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('38', '37', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('39', '39', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('40', '40', '1');

-------------------------------
-- Table structure for vj_util_icons
-------------------------------
DROP TABLE IF EXISTS `vj_util_icons`;
CREATE TABLE `vj_util_icons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '图标',
  `at_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1951 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_util_icons
-------------------------------
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('976', 'fa fa-address-book', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('977', 'fa fa-address-book-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('978', 'fa fa-address-card', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('979', 'fa fa-address-card-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('980', 'fa fa-bandcamp', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('981', 'fa fa-bath', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('982', 'fa fa-bathtub', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('983', 'fa fa-drivers-license', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('984', 'fa fa-drivers-license-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('985', 'fa fa-eercast', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('986', 'fa fa-envelope-open', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('987', 'fa fa-envelope-open-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('988', 'fa fa-etsy', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('989', 'fa fa-free-code-camp', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('990', 'fa fa-grav', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('991', 'fa fa-handshake-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('992', 'fa fa-id-badge', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('993', 'fa fa-id-card', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('994', 'fa fa-id-card-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('995', 'fa fa-imdb', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('996', 'fa fa-linode', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('997', 'fa fa-meetup', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('998', 'fa fa-microchip', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('999', 'fa fa-podcast', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1000', 'fa fa-quora', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1001', 'fa fa-ravelry', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1002', 'fa fa-s15', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1003', 'fa fa-shower', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1004', 'fa fa-snowflake-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1005', 'fa fa-superpowers', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1006', 'fa fa-telegram', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1007', 'fa fa-thermometer', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1008', 'fa fa-thermometer-0', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1009', 'fa fa-thermometer-1', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1010', 'fa fa-thermometer-2', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1011', 'fa fa-thermometer-3', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1012', 'fa fa-thermometer-4', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1013', 'fa fa-thermometer-empty', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1014', 'fa fa-thermometer-full', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1015', 'fa fa-thermometer-half', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1016', 'fa fa-thermometer-quarter', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1017', 'fa fa-thermometer-three-quarters', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1018', 'fa fa-times-rectangle', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1019', 'fa fa-times-rectangle-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1020', 'fa fa-user-circle', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1021', 'fa fa-user-circle-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1022', 'fa fa-user-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1023', 'fa fa-vcard', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1024', 'fa fa-vcard-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1025', 'fa fa-window-close', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1026', 'fa fa-window-close-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1027', 'fa fa-window-maximize', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1028', 'fa fa-window-minimize', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1029', 'fa fa-window-restore', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1030', 'fa fa-wpexplorer', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1031', 'fa fa-address-book', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1032', 'fa fa-address-book-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1033', 'fa fa-address-card', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1034', 'fa fa-address-card-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1035', 'fa fa-adjust', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1036', 'fa fa-american-sign-language-interpreting', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1037', 'fa fa-anchor', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1038', 'fa fa-archive', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1039', 'fa fa-area-chart', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1040', 'fa fa-arrows', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1041', 'fa fa-arrows-h', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1042', 'fa fa-arrows-v', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1043', 'fa fa-asl-interpreting', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1044', 'fa fa-assistive-listening-systems', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1045', 'fa fa-asterisk', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1046', 'fa fa-at', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1047', 'fa fa-audio-description', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1048', 'fa fa-automobile', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1049', 'fa fa-balance-scale', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1050', 'fa fa-ban', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1051', 'fa fa-bank', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1052', 'fa fa-bar-chart', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1053', 'fa fa-bar-chart-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1054', 'fa fa-barcode', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1055', 'fa fa-bars', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1056', 'fa fa-bath', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1057', 'fa fa-bathtub', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1058', 'fa fa-battery', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1059', 'fa fa-battery-0', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1060', 'fa fa-battery-1', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1061', 'fa fa-battery-2', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1062', 'fa fa-battery-3', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1063', 'fa fa-battery-4', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1064', 'fa fa-battery-empty', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1065', 'fa fa-battery-full', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1066', 'fa fa-battery-half', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1067', 'fa fa-battery-quarter', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1068', 'fa fa-battery-three-quarters', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1069', 'fa fa-bed', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1070', 'fa fa-beer', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1071', 'fa fa-bell', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1072', 'fa fa-bell-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1073', 'fa fa-bell-slash', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1074', 'fa fa-bell-slash-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1075', 'fa fa-bicycle', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1076', 'fa fa-binoculars', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1077', 'fa fa-birthday-cake', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1078', 'fa fa-blind', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1079', 'fa fa-bluetooth', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1080', 'fa fa-bluetooth-b', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1081', 'fa fa-bolt', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1082', 'fa fa-bomb', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1083', 'fa fa-book', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1084', 'fa fa-bookmark', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1085', 'fa fa-bookmark-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1086', 'fa fa-braille', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1087', 'fa fa-briefcase', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1088', 'fa fa-bug', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1089', 'fa fa-building', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1090', 'fa fa-building-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1091', 'fa fa-bullhorn', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1092', 'fa fa-bullseye', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1093', 'fa fa-bus', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1094', 'fa fa-cab', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1095', 'fa fa-calculator', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1096', 'fa fa-calendar', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1097', 'fa fa-calendar-check-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1098', 'fa fa-calendar-minus-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1099', 'fa fa-calendar-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1100', 'fa fa-calendar-plus-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1101', 'fa fa-calendar-times-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1102', 'fa fa-camera', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1103', 'fa fa-camera-retro', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1104', 'fa fa-car', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1105', 'fa fa-caret-square-o-down', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1106', 'fa fa-caret-square-o-left', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1107', 'fa fa-caret-square-o-right', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1108', 'fa fa-caret-square-o-up', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1109', 'fa fa-cart-arrow-down', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1110', 'fa fa-cart-plus', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1111', 'fa fa-cc', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1112', 'fa fa-certificate', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1113', 'fa fa-check', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1114', 'fa fa-check-circle', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1115', 'fa fa-check-circle-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1116', 'fa fa-check-square', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1117', 'fa fa-check-square-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1118', 'fa fa-child', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1119', 'fa fa-circle', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1120', 'fa fa-circle-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1121', 'fa fa-circle-o-notch', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1122', 'fa fa-circle-thin', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1123', 'fa fa-clock-o', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1124', 'fa fa-clone', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1125', 'fa fa-close', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1126', 'fa fa-cloud', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1127', 'fa fa-cloud-download', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1128', 'fa fa-cloud-upload', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1129', 'fa fa-code', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1130', 'fa fa-code-fork', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1131', 'fa fa-coffee', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1132', 'fa fa-cog', '2017-10-10 18:28:23');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1133', 'fa fa-cogs', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1134', 'fa fa-comment', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1135', 'fa fa-comment-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1136', 'fa fa-commenting', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1137', 'fa fa-commenting-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1138', 'fa fa-comments', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1139', 'fa fa-comments-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1140', 'fa fa-compass', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1141', 'fa fa-copyright', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1142', 'fa fa-creative-commons', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1143', 'fa fa-credit-card', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1144', 'fa fa-credit-card-alt', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1145', 'fa fa-crop', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1146', 'fa fa-crosshairs', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1147', 'fa fa-cube', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1148', 'fa fa-cubes', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1149', 'fa fa-cutlery', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1150', 'fa fa-dashboard', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1151', 'fa fa-database', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1152', 'fa fa-deaf', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1153', 'fa fa-deafness', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1154', 'fa fa-desktop', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1155', 'fa fa-diamond', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1156', 'fa fa-dot-circle-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1157', 'fa fa-download', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1158', 'fa fa-drivers-license', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1159', 'fa fa-drivers-license-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1160', 'fa fa-edit', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1161', 'fa fa-ellipsis-h', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1162', 'fa fa-ellipsis-v', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1163', 'fa fa-envelope', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1164', 'fa fa-envelope-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1165', 'fa fa-envelope-open', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1166', 'fa fa-envelope-open-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1167', 'fa fa-envelope-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1168', 'fa fa-eraser', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1169', 'fa fa-exchange', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1170', 'fa fa-exclamation', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1171', 'fa fa-exclamation-circle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1172', 'fa fa-exclamation-triangle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1173', 'fa fa-external-link', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1174', 'fa fa-external-link-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1175', 'fa fa-eye', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1176', 'fa fa-eye-slash', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1177', 'fa fa-eyedropper', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1178', 'fa fa-fax', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1179', 'fa fa-feed', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1180', 'fa fa-female', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1181', 'fa fa-fighter-jet', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1182', 'fa fa-file-archive-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1183', 'fa fa-file-audio-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1184', 'fa fa-file-code-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1185', 'fa fa-file-excel-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1186', 'fa fa-file-image-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1187', 'fa fa-file-movie-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1188', 'fa fa-file-pdf-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1189', 'fa fa-file-photo-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1190', 'fa fa-file-picture-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1191', 'fa fa-file-powerpoint-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1192', 'fa fa-file-sound-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1193', 'fa fa-file-video-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1194', 'fa fa-file-word-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1195', 'fa fa-file-zip-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1196', 'fa fa-film', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1197', 'fa fa-filter', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1198', 'fa fa-fire', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1199', 'fa fa-fire-extinguisher', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1200', 'fa fa-flag', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1201', 'fa fa-flag-checkered', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1202', 'fa fa-flag-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1203', 'fa fa-flash', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1204', 'fa fa-flask', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1205', 'fa fa-folder', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1206', 'fa fa-folder-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1207', 'fa fa-folder-open', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1208', 'fa fa-folder-open-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1209', 'fa fa-frown-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1210', 'fa fa-futbol-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1211', 'fa fa-gamepad', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1212', 'fa fa-gavel', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1213', 'fa fa-gear', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1214', 'fa fa-gears', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1215', 'fa fa-gift', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1216', 'fa fa-glass', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1217', 'fa fa-globe', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1218', 'fa fa-graduation-cap', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1219', 'fa fa-group', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1220', 'fa fa-hand-grab-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1221', 'fa fa-hand-lizard-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1222', 'fa fa-hand-paper-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1223', 'fa fa-hand-peace-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1224', 'fa fa-hand-pointer-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1225', 'fa fa-hand-rock-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1226', 'fa fa-hand-scissors-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1227', 'fa fa-hand-spock-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1228', 'fa fa-hand-stop-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1229', 'fa fa-handshake-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1230', 'fa fa-hard-of-hearing', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1231', 'fa fa-hashtag', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1232', 'fa fa-hdd-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1233', 'fa fa-headphones', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1234', 'fa fa-heart', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1235', 'fa fa-heart-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1236', 'fa fa-heartbeat', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1237', 'fa fa-history', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1238', 'fa fa-home', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1239', 'fa fa-hotel', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1240', 'fa fa-hourglass', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1241', 'fa fa-hourglass-1', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1242', 'fa fa-hourglass-2', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1243', 'fa fa-hourglass-3', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1244', 'fa fa-hourglass-end', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1245', 'fa fa-hourglass-half', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1246', 'fa fa-hourglass-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1247', 'fa fa-hourglass-start', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1248', 'fa fa-i-cursor', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1249', 'fa fa-id-badge', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1250', 'fa fa-id-card', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1251', 'fa fa-id-card-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1252', 'fa fa-image', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1253', 'fa fa-inbox', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1254', 'fa fa-industry', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1255', 'fa fa-info', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1256', 'fa fa-info-circle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1257', 'fa fa-institution', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1258', 'fa fa-key', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1259', 'fa fa-keyboard-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1260', 'fa fa-language', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1261', 'fa fa-laptop', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1262', 'fa fa-leaf', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1263', 'fa fa-legal', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1264', 'fa fa-lemon-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1265', 'fa fa-level-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1266', 'fa fa-level-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1267', 'fa fa-life-bouy', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1268', 'fa fa-life-buoy', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1269', 'fa fa-life-ring', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1270', 'fa fa-life-saver', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1271', 'fa fa-lightbulb-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1272', 'fa fa-line-chart', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1273', 'fa fa-location-arrow', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1274', 'fa fa-lock', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1275', 'fa fa-low-vision', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1276', 'fa fa-magic', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1277', 'fa fa-magnet', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1278', 'fa fa-mail-forward', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1279', 'fa fa-mail-reply', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1280', 'fa fa-mail-reply-all', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1281', 'fa fa-male', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1282', 'fa fa-map', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1283', 'fa fa-map-marker', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1284', 'fa fa-map-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1285', 'fa fa-map-pin', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1286', 'fa fa-map-signs', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1287', 'fa fa-meh-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1288', 'fa fa-microchip', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1289', 'fa fa-microphone', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1290', 'fa fa-microphone-slash', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1291', 'fa fa-minus', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1292', 'fa fa-minus-circle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1293', 'fa fa-minus-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1294', 'fa fa-minus-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1295', 'fa fa-mobile', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1296', 'fa fa-mobile-phone', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1297', 'fa fa-money', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1298', 'fa fa-moon-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1299', 'fa fa-mortar-board', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1300', 'fa fa-motorcycle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1301', 'fa fa-mouse-pointer', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1302', 'fa fa-music', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1303', 'fa fa-navicon', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1304', 'fa fa-newspaper-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1305', 'fa fa-object-group', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1306', 'fa fa-object-ungroup', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1307', 'fa fa-paint-brush', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1308', 'fa fa-paper-plane', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1309', 'fa fa-paper-plane-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1310', 'fa fa-paw', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1311', 'fa fa-pencil', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1312', 'fa fa-pencil-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1313', 'fa fa-pencil-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1314', 'fa fa-percent', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1315', 'fa fa-phone', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1316', 'fa fa-phone-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1317', 'fa fa-photo', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1318', 'fa fa-picture-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1319', 'fa fa-pie-chart', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1320', 'fa fa-plane', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1321', 'fa fa-plug', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1322', 'fa fa-plus', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1323', 'fa fa-plus-circle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1324', 'fa fa-plus-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1325', 'fa fa-plus-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1326', 'fa fa-podcast', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1327', 'fa fa-power-off', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1328', 'fa fa-print', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1329', 'fa fa-puzzle-piece', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1330', 'fa fa-qrcode', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1331', 'fa fa-question', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1332', 'fa fa-question-circle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1333', 'fa fa-question-circle-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1334', 'fa fa-quote-left', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1335', 'fa fa-quote-right', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1336', 'fa fa-random', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1337', 'fa fa-recycle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1338', 'fa fa-refresh', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1339', 'fa fa-registered', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1340', 'fa fa-remove', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1341', 'fa fa-reorder', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1342', 'fa fa-reply', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1343', 'fa fa-reply-all', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1344', 'fa fa-retweet', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1345', 'fa fa-road', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1346', 'fa fa-rocket', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1347', 'fa fa-rss', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1348', 'fa fa-rss-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1349', 'fa fa-s15', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1350', 'fa fa-search', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1351', 'fa fa-search-minus', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1352', 'fa fa-search-plus', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1353', 'fa fa-send', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1354', 'fa fa-send-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1355', 'fa fa-server', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1356', 'fa fa-share', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1357', 'fa fa-share-alt', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1358', 'fa fa-share-alt-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1359', 'fa fa-share-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1360', 'fa fa-share-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1361', 'fa fa-shield', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1362', 'fa fa-ship', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1363', 'fa fa-shopping-bag', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1364', 'fa fa-shopping-basket', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1365', 'fa fa-shopping-cart', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1366', 'fa fa-shower', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1367', 'fa fa-sign-in', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1368', 'fa fa-sign-language', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1369', 'fa fa-sign-out', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1370', 'fa fa-signal', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1371', 'fa fa-signing', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1372', 'fa fa-sitemap', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1373', 'fa fa-sliders', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1374', 'fa fa-smile-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1375', 'fa fa-snowflake-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1376', 'fa fa-soccer-ball-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1377', 'fa fa-sort', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1378', 'fa fa-sort-alpha-asc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1379', 'fa fa-sort-alpha-desc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1380', 'fa fa-sort-amount-asc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1381', 'fa fa-sort-amount-desc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1382', 'fa fa-sort-asc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1383', 'fa fa-sort-desc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1384', 'fa fa-sort-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1385', 'fa fa-sort-numeric-asc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1386', 'fa fa-sort-numeric-desc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1387', 'fa fa-sort-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1388', 'fa fa-space-shuttle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1389', 'fa fa-spinner', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1390', 'fa fa-spoon', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1391', 'fa fa-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1392', 'fa fa-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1393', 'fa fa-star', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1394', 'fa fa-star-half', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1395', 'fa fa-star-half-empty', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1396', 'fa fa-star-half-full', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1397', 'fa fa-star-half-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1398', 'fa fa-star-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1399', 'fa fa-sticky-note', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1400', 'fa fa-sticky-note-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1401', 'fa fa-street-view', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1402', 'fa fa-suitcase', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1403', 'fa fa-sun-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1404', 'fa fa-support', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1405', 'fa fa-tablet', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1406', 'fa fa-tachometer', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1407', 'fa fa-tag', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1408', 'fa fa-tags', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1409', 'fa fa-tasks', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1410', 'fa fa-taxi', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1411', 'fa fa-television', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1412', 'fa fa-terminal', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1413', 'fa fa-thermometer', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1414', 'fa fa-thermometer-0', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1415', 'fa fa-thermometer-1', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1416', 'fa fa-thermometer-2', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1417', 'fa fa-thermometer-3', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1418', 'fa fa-thermometer-4', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1419', 'fa fa-thermometer-empty', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1420', 'fa fa-thermometer-full', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1421', 'fa fa-thermometer-half', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1422', 'fa fa-thermometer-quarter', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1423', 'fa fa-thermometer-three-quarters', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1424', 'fa fa-thumb-tack', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1425', 'fa fa-thumbs-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1426', 'fa fa-thumbs-o-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1427', 'fa fa-thumbs-o-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1428', 'fa fa-thumbs-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1429', 'fa fa-ticket', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1430', 'fa fa-times', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1431', 'fa fa-times-circle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1432', 'fa fa-times-circle-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1433', 'fa fa-times-rectangle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1434', 'fa fa-times-rectangle-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1435', 'fa fa-tint', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1436', 'fa fa-toggle-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1437', 'fa fa-toggle-left', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1438', 'fa fa-toggle-off', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1439', 'fa fa-toggle-on', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1440', 'fa fa-toggle-right', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1441', 'fa fa-toggle-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1442', 'fa fa-trademark', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1443', 'fa fa-trash', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1444', 'fa fa-trash-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1445', 'fa fa-tree', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1446', 'fa fa-trophy', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1447', 'fa fa-truck', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1448', 'fa fa-tty', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1449', 'fa fa-tv', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1450', 'fa fa-umbrella', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1451', 'fa fa-universal-access', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1452', 'fa fa-university', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1453', 'fa fa-unlock', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1454', 'fa fa-unlock-alt', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1455', 'fa fa-unsorted', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1456', 'fa fa-upload', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1457', 'fa fa-user', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1458', 'fa fa-user-circle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1459', 'fa fa-user-circle-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1460', 'fa fa-user-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1461', 'fa fa-user-plus', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1462', 'fa fa-user-secret', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1463', 'fa fa-user-times', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1464', 'fa fa-users', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1465', 'fa fa-vcard', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1466', 'fa fa-vcard-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1467', 'fa fa-video-camera', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1468', 'fa fa-volume-control-phone', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1469', 'fa fa-volume-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1470', 'fa fa-volume-off', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1471', 'fa fa-volume-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1472', 'fa fa-warning', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1473', 'fa fa-wheelchair', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1474', 'fa fa-wheelchair-alt', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1475', 'fa fa-wifi', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1476', 'fa fa-window-close', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1477', 'fa fa-window-close-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1478', 'fa fa-window-maximize', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1479', 'fa fa-window-minimize', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1480', 'fa fa-window-restore', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1481', 'fa fa-wrench', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1482', 'fa fa-american-sign-language-interpreting', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1483', 'fa fa-asl-interpreting', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1484', 'fa fa-assistive-listening-systems', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1485', 'fa fa-audio-description', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1486', 'fa fa-blind', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1487', 'fa fa-braille', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1488', 'fa fa-cc', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1489', 'fa fa-deaf', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1490', 'fa fa-deafness', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1491', 'fa fa-hard-of-hearing', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1492', 'fa fa-low-vision', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1493', 'fa fa-question-circle-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1494', 'fa fa-sign-language', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1495', 'fa fa-signing', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1496', 'fa fa-tty', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1497', 'fa fa-universal-access', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1498', 'fa fa-volume-control-phone', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1499', 'fa fa-wheelchair', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1500', 'fa fa-wheelchair-alt', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1501', 'fa fa-hand-grab-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1502', 'fa fa-hand-lizard-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1503', 'fa fa-hand-o-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1504', 'fa fa-hand-o-left', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1505', 'fa fa-hand-o-right', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1506', 'fa fa-hand-o-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1507', 'fa fa-hand-paper-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1508', 'fa fa-hand-peace-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1509', 'fa fa-hand-pointer-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1510', 'fa fa-hand-rock-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1511', 'fa fa-hand-scissors-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1512', 'fa fa-hand-spock-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1513', 'fa fa-hand-stop-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1514', 'fa fa-thumbs-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1515', 'fa fa-thumbs-o-down', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1516', 'fa fa-thumbs-o-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1517', 'fa fa-thumbs-up', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1518', 'fa fa-ambulance', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1519', 'fa fa-automobile', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1520', 'fa fa-bicycle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1521', 'fa fa-bus', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1522', 'fa fa-cab', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1523', 'fa fa-car', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1524', 'fa fa-fighter-jet', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1525', 'fa fa-motorcycle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1526', 'fa fa-plane', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1527', 'fa fa-rocket', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1528', 'fa fa-ship', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1529', 'fa fa-space-shuttle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1530', 'fa fa-subway', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1531', 'fa fa-taxi', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1532', 'fa fa-train', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1533', 'fa fa-truck', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1534', 'fa fa-wheelchair', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1535', 'fa fa-wheelchair-alt', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1536', 'fa fa-genderless', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1537', 'fa fa-intersex', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1538', 'fa fa-mars', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1539', 'fa fa-mars-double', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1540', 'fa fa-mars-stroke', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1541', 'fa fa-mars-stroke-h', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1542', 'fa fa-mars-stroke-v', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1543', 'fa fa-mercury', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1544', 'fa fa-neuter', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1545', 'fa fa-transgender', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1546', 'fa fa-transgender-alt', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1547', 'fa fa-venus', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1548', 'fa fa-venus-double', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1549', 'fa fa-venus-mars', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1550', 'fa fa-file', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1551', 'fa fa-file-archive-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1552', 'fa fa-file-audio-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1553', 'fa fa-file-code-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1554', 'fa fa-file-excel-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1555', 'fa fa-file-image-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1556', 'fa fa-file-movie-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1557', 'fa fa-file-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1558', 'fa fa-file-pdf-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1559', 'fa fa-file-photo-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1560', 'fa fa-file-picture-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1561', 'fa fa-file-powerpoint-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1562', 'fa fa-file-sound-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1563', 'fa fa-file-text', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1564', 'fa fa-file-text-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1565', 'fa fa-file-video-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1566', 'fa fa-file-word-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1567', 'fa fa-file-zip-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1568', 'fa fa-circle-o-notch', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1569', 'fa fa-cog', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1570', 'fa fa-gear', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1571', 'fa fa-refresh', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1572', 'fa fa-spinner', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1573', 'fa fa-check-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1574', 'fa fa-check-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1575', 'fa fa-circle', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1576', 'fa fa-circle-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1577', 'fa fa-dot-circle-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1578', 'fa fa-minus-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1579', 'fa fa-minus-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1580', 'fa fa-plus-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1581', 'fa fa-plus-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1582', 'fa fa-square', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1583', 'fa fa-square-o', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1584', 'fa fa-cc-amex', '2017-10-10 18:28:24');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1585', 'fa fa-cc-diners-club', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1586', 'fa fa-cc-discover', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1587', 'fa fa-cc-jcb', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1588', 'fa fa-cc-mastercard', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1589', 'fa fa-cc-paypal', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1590', 'fa fa-cc-stripe', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1591', 'fa fa-cc-visa', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1592', 'fa fa-credit-card', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1593', 'fa fa-credit-card-alt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1594', 'fa fa-google-wallet', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1595', 'fa fa-paypal', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1596', 'fa fa-area-chart', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1597', 'fa fa-bar-chart', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1598', 'fa fa-bar-chart-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1599', 'fa fa-line-chart', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1600', 'fa fa-pie-chart', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1601', 'fa fa-bitcoin', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1602', 'fa fa-btc', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1603', 'fa fa-cny', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1604', 'fa fa-dollar', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1605', 'fa fa-eur', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1606', 'fa fa-euro', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1607', 'fa fa-gbp', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1608', 'fa fa-gg', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1609', 'fa fa-gg-circle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1610', 'fa fa-ils', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1611', 'fa fa-inr', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1612', 'fa fa-jpy', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1613', 'fa fa-krw', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1614', 'fa fa-money', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1615', 'fa fa-rmb', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1616', 'fa fa-rouble', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1617', 'fa fa-rub', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1618', 'fa fa-ruble', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1619', 'fa fa-rupee', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1620', 'fa fa-shekel', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1621', 'fa fa-sheqel', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1622', 'fa fa-try', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1623', 'fa fa-turkish-lira', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1624', 'fa fa-usd', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1625', 'fa fa-won', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1626', 'fa fa-yen', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1627', 'fa fa-align-center', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1628', 'fa fa-align-justify', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1629', 'fa fa-align-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1630', 'fa fa-align-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1631', 'fa fa-bold', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1632', 'fa fa-chain', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1633', 'fa fa-chain-broken', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1634', 'fa fa-clipboard', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1635', 'fa fa-columns', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1636', 'fa fa-copy', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1637', 'fa fa-cut', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1638', 'fa fa-dedent', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1639', 'fa fa-eraser', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1640', 'fa fa-file', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1641', 'fa fa-file-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1642', 'fa fa-file-text', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1643', 'fa fa-file-text-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1644', 'fa fa-files-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1645', 'fa fa-floppy-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1646', 'fa fa-font', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1647', 'fa fa-header', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1648', 'fa fa-indent', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1649', 'fa fa-italic', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1650', 'fa fa-link', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1651', 'fa fa-list', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1652', 'fa fa-list-alt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1653', 'fa fa-list-ol', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1654', 'fa fa-list-ul', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1655', 'fa fa-outdent', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1656', 'fa fa-paperclip', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1657', 'fa fa-paragraph', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1658', 'fa fa-paste', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1659', 'fa fa-repeat', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1660', 'fa fa-rotate-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1661', 'fa fa-rotate-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1662', 'fa fa-save', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1663', 'fa fa-scissors', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1664', 'fa fa-strikethrough', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1665', 'fa fa-subscript', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1666', 'fa fa-superscript', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1667', 'fa fa-table', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1668', 'fa fa-text-height', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1669', 'fa fa-text-width', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1670', 'fa fa-th', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1671', 'fa fa-th-large', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1672', 'fa fa-th-list', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1673', 'fa fa-underline', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1674', 'fa fa-undo', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1675', 'fa fa-unlink', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1676', 'fa fa-angle-double-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1677', 'fa fa-angle-double-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1678', 'fa fa-angle-double-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1679', 'fa fa-angle-double-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1680', 'fa fa-angle-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1681', 'fa fa-angle-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1682', 'fa fa-angle-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1683', 'fa fa-angle-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1684', 'fa fa-arrow-circle-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1685', 'fa fa-arrow-circle-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1686', 'fa fa-arrow-circle-o-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1687', 'fa fa-arrow-circle-o-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1688', 'fa fa-arrow-circle-o-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1689', 'fa fa-arrow-circle-o-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1690', 'fa fa-arrow-circle-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1691', 'fa fa-arrow-circle-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1692', 'fa fa-arrow-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1693', 'fa fa-arrow-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1694', 'fa fa-arrow-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1695', 'fa fa-arrow-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1696', 'fa fa-arrows', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1697', 'fa fa-arrows-alt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1698', 'fa fa-arrows-h', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1699', 'fa fa-arrows-v', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1700', 'fa fa-caret-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1701', 'fa fa-caret-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1702', 'fa fa-caret-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1703', 'fa fa-caret-square-o-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1704', 'fa fa-caret-square-o-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1705', 'fa fa-caret-square-o-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1706', 'fa fa-caret-square-o-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1707', 'fa fa-caret-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1708', 'fa fa-chevron-circle-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1709', 'fa fa-chevron-circle-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1710', 'fa fa-chevron-circle-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1711', 'fa fa-chevron-circle-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1712', 'fa fa-chevron-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1713', 'fa fa-chevron-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1714', 'fa fa-chevron-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1715', 'fa fa-chevron-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1716', 'fa fa-exchange', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1717', 'fa fa-hand-o-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1718', 'fa fa-hand-o-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1719', 'fa fa-hand-o-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1720', 'fa fa-hand-o-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1721', 'fa fa-long-arrow-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1722', 'fa fa-long-arrow-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1723', 'fa fa-long-arrow-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1724', 'fa fa-long-arrow-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1725', 'fa fa-toggle-down', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1726', 'fa fa-toggle-left', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1727', 'fa fa-toggle-right', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1728', 'fa fa-toggle-up', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1729', 'fa fa-arrows-alt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1730', 'fa fa-backward', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1731', 'fa fa-compress', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1732', 'fa fa-eject', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1733', 'fa fa-expand', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1734', 'fa fa-fast-backward', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1735', 'fa fa-fast-forward', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1736', 'fa fa-forward', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1737', 'fa fa-pause', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1738', 'fa fa-pause-circle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1739', 'fa fa-pause-circle-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1740', 'fa fa-play', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1741', 'fa fa-play-circle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1742', 'fa fa-play-circle-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1743', 'fa fa-random', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1744', 'fa fa-step-backward', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1745', 'fa fa-step-forward', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1746', 'fa fa-stop', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1747', 'fa fa-stop-circle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1748', 'fa fa-stop-circle-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1749', 'fa fa-youtube-play', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1750', 'fa fa-500px', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1751', 'fa fa-adn', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1752', 'fa fa-amazon', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1753', 'fa fa-android', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1754', 'fa fa-angellist', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1755', 'fa fa-apple', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1756', 'fa fa-bandcamp', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1757', 'fa fa-behance', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1758', 'fa fa-behance-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1759', 'fa fa-bitbucket', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1760', 'fa fa-bitbucket-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1761', 'fa fa-bitcoin', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1762', 'fa fa-black-tie', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1763', 'fa fa-bluetooth', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1764', 'fa fa-bluetooth-b', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1765', 'fa fa-btc', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1766', 'fa fa-buysellads', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1767', 'fa fa-cc-amex', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1768', 'fa fa-cc-diners-club', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1769', 'fa fa-cc-discover', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1770', 'fa fa-cc-jcb', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1771', 'fa fa-cc-mastercard', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1772', 'fa fa-cc-paypal', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1773', 'fa fa-cc-stripe', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1774', 'fa fa-cc-visa', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1775', 'fa fa-chrome', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1776', 'fa fa-codepen', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1777', 'fa fa-codiepie', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1778', 'fa fa-connectdevelop', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1779', 'fa fa-contao', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1780', 'fa fa-css3', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1781', 'fa fa-dashcube', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1782', 'fa fa-delicious', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1783', 'fa fa-deviantart', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1784', 'fa fa-digg', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1785', 'fa fa-dribbble', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1786', 'fa fa-dropbox', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1787', 'fa fa-drupal', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1788', 'fa fa-edge', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1789', 'fa fa-eercast', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1790', 'fa fa-empire', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1791', 'fa fa-envira', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1792', 'fa fa-etsy', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1793', 'fa fa-expeditedssl', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1794', 'fa fa-fa', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1795', 'fa fa-facebook', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1796', 'fa fa-facebook-f', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1797', 'fa fa-facebook-official', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1798', 'fa fa-facebook-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1799', 'fa fa-firefox', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1800', 'fa fa-first-order', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1801', 'fa fa-flickr', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1802', 'fa fa-font-awesome', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1803', 'fa fa-fonticons', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1804', 'fa fa-fort-awesome', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1805', 'fa fa-forumbee', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1806', 'fa fa-foursquare', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1807', 'fa fa-free-code-camp', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1808', 'fa fa-ge', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1809', 'fa fa-get-pocket', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1810', 'fa fa-gg', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1811', 'fa fa-gg-circle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1812', 'fa fa-git', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1813', 'fa fa-git-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1814', 'fa fa-github', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1815', 'fa fa-github-alt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1816', 'fa fa-github-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1817', 'fa fa-gitlab', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1818', 'fa fa-gittip', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1819', 'fa fa-glide', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1820', 'fa fa-glide-g', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1821', 'fa fa-google', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1822', 'fa fa-google-plus', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1823', 'fa fa-google-plus-circle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1824', 'fa fa-google-plus-official', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1825', 'fa fa-google-plus-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1826', 'fa fa-google-wallet', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1827', 'fa fa-gratipay', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1828', 'fa fa-grav', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1829', 'fa fa-hacker-news', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1830', 'fa fa-houzz', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1831', 'fa fa-html5', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1832', 'fa fa-imdb', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1833', 'fa fa-instagram', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1834', 'fa fa-internet-explorer', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1835', 'fa fa-ioxhost', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1836', 'fa fa-joomla', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1837', 'fa fa-jsfiddle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1838', 'fa fa-lastfm', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1839', 'fa fa-lastfm-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1840', 'fa fa-leanpub', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1841', 'fa fa-linkedin', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1842', 'fa fa-linkedin-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1843', 'fa fa-linode', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1844', 'fa fa-linux', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1845', 'fa fa-maxcdn', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1846', 'fa fa-meanpath', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1847', 'fa fa-medium', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1848', 'fa fa-meetup', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1849', 'fa fa-mixcloud', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1850', 'fa fa-modx', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1851', 'fa fa-odnoklassniki', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1852', 'fa fa-odnoklassniki-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1853', 'fa fa-opencart', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1854', 'fa fa-openid', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1855', 'fa fa-opera', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1856', 'fa fa-optin-monster', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1857', 'fa fa-pagelines', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1858', 'fa fa-paypal', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1859', 'fa fa-pied-piper', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1860', 'fa fa-pied-piper-alt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1861', 'fa fa-pied-piper-pp', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1862', 'fa fa-pinterest', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1863', 'fa fa-pinterest-p', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1864', 'fa fa-pinterest-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1865', 'fa fa-product-hunt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1866', 'fa fa-qq', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1867', 'fa fa-quora', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1868', 'fa fa-ra', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1869', 'fa fa-ravelry', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1870', 'fa fa-rebel', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1871', 'fa fa-reddit', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1872', 'fa fa-reddit-alien', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1873', 'fa fa-reddit-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1874', 'fa fa-renren', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1875', 'fa fa-resistance', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1876', 'fa fa-safari', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1877', 'fa fa-scribd', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1878', 'fa fa-sellsy', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1879', 'fa fa-share-alt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1880', 'fa fa-share-alt-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1881', 'fa fa-shirtsinbulk', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1882', 'fa fa-simplybuilt', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1883', 'fa fa-skyatlas', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1884', 'fa fa-skype', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1885', 'fa fa-slack', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1886', 'fa fa-slideshare', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1887', 'fa fa-snapchat', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1888', 'fa fa-snapchat-ghost', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1889', 'fa fa-snapchat-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1890', 'fa fa-soundcloud', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1891', 'fa fa-spotify', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1892', 'fa fa-stack-exchange', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1893', 'fa fa-stack-overflow', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1894', 'fa fa-steam', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1895', 'fa fa-steam-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1896', 'fa fa-stumbleupon', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1897', 'fa fa-stumbleupon-circle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1898', 'fa fa-superpowers', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1899', 'fa fa-telegram', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1900', 'fa fa-tencent-weibo', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1901', 'fa fa-themeisle', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1902', 'fa fa-trello', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1903', 'fa fa-tripadvisor', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1904', 'fa fa-tumblr', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1905', 'fa fa-tumblr-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1906', 'fa fa-twitch', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1907', 'fa fa-twitter', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1908', 'fa fa-twitter-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1909', 'fa fa-usb', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1910', 'fa fa-viacoin', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1911', 'fa fa-viadeo', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1912', 'fa fa-viadeo-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1913', 'fa fa-vimeo', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1914', 'fa fa-vimeo-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1915', 'fa fa-vine', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1916', 'fa fa-vk', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1917', 'fa fa-wechat', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1918', 'fa fa-weibo', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1919', 'fa fa-weixin', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1920', 'fa fa-whatsapp', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1921', 'fa fa-wikipedia-w', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1922', 'fa fa-windows', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1923', 'fa fa-wordpress', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1924', 'fa fa-wpbeginner', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1925', 'fa fa-wpexplorer', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1926', 'fa fa-wpforms', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1927', 'fa fa-xing', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1928', 'fa fa-xing-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1929', 'fa fa-y-combinator', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1930', 'fa fa-y-combinator-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1931', 'fa fa-yahoo', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1932', 'fa fa-yc', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1933', 'fa fa-yc-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1934', 'fa fa-yelp', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1935', 'fa fa-yoast', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1936', 'fa fa-youtube', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1937', 'fa fa-youtube-play', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1938', 'fa fa-youtube-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1939', 'fa fa-ambulance', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1940', 'fa fa-h-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1941', 'fa fa-heart', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1942', 'fa fa-heart-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1943', 'fa fa-heartbeat', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1944', 'fa fa-hospital-o', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1945', 'fa fa-medkit', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1946', 'fa fa-plus-square', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1947', 'fa fa-stethoscope', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1948', 'fa fa-user-md', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1949', 'fa fa-wheelchair', '2017-10-10 18:28:25');
INSERT INTO `vj_util_icons` (`id`, `name`, `at_datetime`) VALUES ('1950', 'fa fa-wheelchair-alt', '2017-10-10 18:28:25');

