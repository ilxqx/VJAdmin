/*
MySQL Database Backup Tools(Venus dump)
Server:127.0.0.1:
Database:vj_admin
Date:2017-12-31 18:08:46
*/
SET FOREIGN_KEY_CHECKS=0;
-------------------------------
-- Table structure for vj_customer
-------------------------------
DROP TABLE IF EXISTS `vj_customer`;
CREATE TABLE `vj_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `content` text NOT NULL COMMENT '内容',
  `pic` int(10) unsigned NOT NULL COMMENT '图片',
  `status` varchar(2) NOT NULL COMMENT '状态',
  `manager_id` int(10) unsigned NOT NULL COMMENT '管理员',
  `at_datetime` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `fk_vj_customer_manager_id` (`manager_id`),
  KEY `fk_vj_customer_pic` (`pic`),
  CONSTRAINT `fk_vj_customer_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `vj_sys_manager` (`id`),
  CONSTRAINT `fk_vj_customer_pic` FOREIGN KEY (`pic`) REFERENCES `vj_sys_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_customer
-------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
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
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('41', '数据备份-下载', 'admin', 'SysBackup', 'download', '数据备份-下载', '1', '2017-11-15 16:31:13');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('42', '文件管理-列表', 'admin', 'SysFileManagement', 'index', '文件管理-列表', '1', '2017-11-30 12:02:26');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('43', '文件管理-查看', 'admin', 'SysFileManagement', 'view', '文件管理-查看', '1', '2017-11-30 12:02:49');
INSERT INTO `vj_sys_auth` (`id`, `name`, `rule_module`, `rule_controller`, `rule_method`, `remark`, `manager_id`, `at_datetime`) VALUES ('44', '文件管理-删除', 'admin', 'SysFileManagement', 'del', '文件管理-删除', '1', '2017-11-30 12:03:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_field_dict
-------------------------------
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('2', 'vj_sys_menu', 'status', 'a', '启用', '菜单的启动状况', '1', '2017-10-29 12:30:03');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('3', 'vj_sys_menu', 'status', 'b', '停用', '菜单的停用状态', '1', '2017-10-29 12:30:36');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('4', 'vj_sys_manager', 'status', 'a', '启用', '管理员的启用状态', '1', '2017-10-29 14:15:28');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('5', 'vj_sys_manager', 'status', 'b', '停用', '管理员的停用状态', '1', '2017-10-29 14:15:51');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('6', 'vj_sys_role', 'status', 'a', '启用', '角色启用状态', '1', '2017-10-29 15:46:04');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('7', 'vj_sys_role', 'status', 'b', '停用', '角色停用状态', '1', '2017-10-29 15:46:26');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('8', 'vj_customer', 'status', 'a', '开启', '开启', '1', '2017-11-29 18:23:50');
INSERT INTO `vj_sys_field_dict` (`id`, `table`, `field`, `value`, `meaning`, `remark`, `manager_id`, `at_datetime`) VALUES ('9', 'vj_customer', 'status', 'b', '关闭', '关闭', '1', '2017-11-29 18:24:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_file
-------------------------------
INSERT INTO `vj_sys_file` (`id`, `name`, `relative_url`, `sha1`, `refs`, `type`, `at_datetime`) VALUES ('14', 'b42af90c30bfd40ed1b0ae70ccc6a39a.jpg', '\\uploads\\images\\vjeaa3ef6a-4a17-bba3-2c4b-e95f008ea42d.jpg', 'eb40f6a07deed6f5226e86ef7164e165af4f0624', '1', 'a', '2017-11-09 10:24:41');

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
INSERT INTO `vj_sys_manager` (`id`, `name`, `account`, `pwd`, `avatar`, `role_id`, `status`, `manager_id`, `at_datetime`) VALUES ('1', '超级管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '14', '1', 'a', '1', '2017-11-09 10:24:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
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
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('13', '业务管理', '2', '0', 'compass', '', '', 'a', '业务管理', '1', '2017-11-09 12:21:56');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('14', '数据维护', '1', '13', 'globe', '', '', 'a', '数据维护', '1', '2017-11-09 12:24:34');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('15', '客户管理', '1', '14', 'vcard', 'business/customer/index', 'businesscustomerindex', 'a', '客户管理', '1', '2017-11-09 14:11:20');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('16', '文件管理', '4', '1', 'file-text-o', '', '', 'a', '文件管理', '1', '2017-11-30 10:46:05');
INSERT INTO `vj_sys_menu` (`id`, `name`, `seq`, `pid`, `icon`, `url`, `type_id`, `status`, `remark`, `manager_id`, `at_datetime`) VALUES ('17', 'NEditor文件', '1', '16', 'file', 'admin/sys_file_management/index', 'adminsys_file_managementindex', 'a', 'NEditor文件', '1', '2017-11-30 10:47:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
-------------------------------
-- Records of vj_sys_option
-------------------------------
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('6', 'AccessKeyID', 'LTAIrfZRYf7z8JiAeT', '阿里云短信服务访问key', '1', '2017-11-14 22:30:56');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('7', 'AccessKeySecret', 'w8wcCLXoxWpdM8kvMw4GoH6rjerhGZaD', '阿里云短信服务secret', '1', '2017-11-14 22:30:40');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('8', 'ProductName', 'Dysmsapi', '阿里云短信服务所使用产品名称', '1', '2017-11-14 20:38:09');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('9', 'Domain', 'dysmsapi.aliyuncs.com', '阿里云所使用产品域名', '1', '2017-11-14 20:38:43');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('12', 'SignName', 'VJ管理系统', '阿里云短信签名', '1', '2017-11-14 21:02:31');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('13', 'SMCodeTemplateCode', 'SMS_110120102', '阿里云短信模板号', '1', '2017-11-14 22:00:50');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('14', 'MailHost', 'smtp.qq.com', '邮件服务器', '1', '2017-11-14 21:21:27');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('15', 'MailUsername', 'venus-wxp@qq.com', '邮件用户名', '1', '2017-11-14 21:25:02');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('16', 'MailPassword', 'juiylwmbodotdcfbaf', '邮件密码', '1', '2017-11-14 22:30:29');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('17', 'MailSecure', 'ssl', '邮件传输协议（ssl、tls）', '1', '2017-11-14 21:23:34');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('18', 'MailPort', '465', '邮件服务器端口号', '1', '2017-11-14 21:24:09');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('19', 'MailFrom', 'venus-wxp@qq.com', '邮件发送者', '1', '2017-11-14 21:24:41');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('20', 'MailName', 'Venus', '邮件发送者名称', '1', '2017-11-14 21:26:38');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('21', 'VaptchaVID', '5a41a035a48612214c4a982e', '手势验证码的vid', '1', '2017-12-26 09:25:34');
INSERT INTO `vj_sys_option` (`id`, `name`, `value`, `remark`, `manager_id`, `at_datetime`) VALUES ('22', 'VaptchaKey', 'b7c2caa1afcb4e2eb08c7b47004886c3', '手势验证码的key', '1', '2017-12-26 09:25:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
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
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('35', '13', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('36', '35', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('38', '37', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('39', '39', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('40', '40', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('41', '36', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('42', '41', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('43', '42', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('44', '43', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('45', '44', '1');
INSERT INTO `vj_sys_role_auth` (`id`, `auth_id`, `role_id`) VALUES ('46', '34', '1');

