/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : simple_demo

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-09-20 18:02:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('6', '0', '研发部', '1', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('7', '6', '研發一部', '1', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('8', '6', '研发二部', '2', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('9', '0', '销售部', '2', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('10', '9', '销售一部', '1', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('11', '0', '产品部', '3', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('12', '11', '产品一部', '1', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('13', '0', '测试部', '5', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('14', '13', '测试一部', '1', '1', null, null, null, null);
INSERT INTO `sys_dept` VALUES ('15', '13', '测试二部', '2', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类', '40', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('96', '男', '1', 'sex', '性别', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('97', '女', '2', 'sex', '性别', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', null, '1', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', null, '0', '1', null, '1', null);
INSERT INTO `sys_dict` VALUES ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', null, '0', '1', null, '1', null);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `response_time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '1', 'admin', '登录', '329', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 16:41:29');
INSERT INTO `sys_log` VALUES ('2', '1', 'admin', 'error', null, 'http://localhost/index', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'gmt_create\' in \'field list\'\r\n### The error may exist in file [E:\\Intellij ideaWorkSpace\\bootdo\\bootdo\\target\\classes\\mybatis\\system\\MenuMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select distinct   m.menu_id , parent_id, name, url,   perms,`type`,icon,order_num,gmt_create, gmt_modified   from sys_menu m   left   join sys_role_menu rm on m.menu_id = rm.menu_id left join   sys_user_role ur   on rm.role_id =ur.role_id where ur.user_id = ?   and   m.type in(0,1)   order by   m.order_num\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'gmt_create\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'gmt_create\' in \'field list\'', null, '2018-09-08 16:41:30');
INSERT INTO `sys_log` VALUES ('3', '1', 'admin', '登录', '56', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 16:45:36');
INSERT INTO `sys_log` VALUES ('4', '1', 'admin', 'error', null, 'http://localhost/index', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'gmt_create\' in \'field list\'\r\n### The error may exist in file [E:\\Intellij ideaWorkSpace\\bootdo\\bootdo\\target\\classes\\mybatis\\system\\MenuMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select distinct   m.menu_id , parent_id, name, url,   perms,`type`,icon,order_num,gmt_create, gmt_modified   from sys_menu m   left   join sys_role_menu rm on m.menu_id = rm.menu_id left join   sys_user_role ur   on rm.role_id =ur.role_id where ur.user_id = ?   and   m.type in(0,1)   order by   m.order_num\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'gmt_create\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'gmt_create\' in \'field list\'', null, '2018-09-08 16:45:36');
INSERT INTO `sys_log` VALUES ('5', '1', 'admin', '登录', '52', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 16:47:16');
INSERT INTO `sys_log` VALUES ('6', '1', 'admin', 'error', null, 'http://localhost/index', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' in field list is ambiguous\r\n### The error may exist in file [E:\\Intellij ideaWorkSpace\\bootdo\\bootdo\\target\\classes\\mybatis\\system\\MenuMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select distinct   m.menu_id , parent_id, name, url,   perms,`type`,icon,order_num,`create_time`,`update_time`,`create_by`,`update_by`   from sys_menu m   left   join sys_role_menu rm on m.menu_id = rm.menu_id left join   sys_user_role ur   on rm.role_id =ur.role_id where ur.user_id = ?   and   m.type in(0,1)   order by   m.order_num\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' in field list is ambiguous\n; ]; Column \'create_time\' in field list is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'create_time\' in field list is ambiguous', null, '2018-09-08 16:47:17');
INSERT INTO `sys_log` VALUES ('7', '1', 'admin', '登录', '53', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 16:50:13');
INSERT INTO `sys_log` VALUES ('8', '1', 'admin', '请求访问主页', '92', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 16:50:13');
INSERT INTO `sys_log` VALUES ('9', '1', 'admin', '删除用户', '243', 'com.sf.system.controller.UserController.remove()', null, '127.0.0.1', '2018-09-08 16:50:23');
INSERT INTO `sys_log` VALUES ('10', '1', 'admin', '添加用户', '108', 'com.sf.system.controller.UserController.add()', null, '127.0.0.1', '2018-09-08 16:50:25');
INSERT INTO `sys_log` VALUES ('11', '1', 'admin', '保存用户', '227', 'com.sf.system.controller.UserController.save()', null, '127.0.0.1', '2018-09-08 16:50:43');
INSERT INTO `sys_log` VALUES ('12', '1', 'admin', '编辑用户', '44', 'com.sf.system.controller.UserController.edit()', null, '127.0.0.1', '2018-09-08 16:51:04');
INSERT INTO `sys_log` VALUES ('13', '1', 'admin', '更新用户', '251', 'com.sf.system.controller.UserController.update()', null, '127.0.0.1', '2018-09-08 16:51:06');
INSERT INTO `sys_log` VALUES ('14', null, null, 'error', null, 'http://localhost/;JSESSIONID=66fbf1fc-1ab2-4504-97b9-9cac2fb634e1login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-08 17:06:42');
INSERT INTO `sys_log` VALUES ('15', null, null, 'error', null, 'http://localhost/;JSESSIONID=66fbf1fc-1ab2-4504-97b9-9cac2fb634e1login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-08 17:07:05');
INSERT INTO `sys_log` VALUES ('16', '1', 'admin', '登录', '270', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 17:08:08');
INSERT INTO `sys_log` VALUES ('17', '1', 'admin', '请求访问主页', '193', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 17:08:09');
INSERT INTO `sys_log` VALUES ('18', '1', 'admin', '登录', '9', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 17:10:14');
INSERT INTO `sys_log` VALUES ('19', '1', 'admin', '请求访问主页', '9', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 17:10:14');
INSERT INTO `sys_log` VALUES ('20', '1', 'admin', '登录', '83', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 17:24:06');
INSERT INTO `sys_log` VALUES ('21', '1', 'admin', '请求访问主页', '25', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 17:24:07');
INSERT INTO `sys_log` VALUES ('22', '1', 'admin', '登录', '93', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 17:34:46');
INSERT INTO `sys_log` VALUES ('23', '1', 'admin', '请求访问主页', '27', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 17:34:47');
INSERT INTO `sys_log` VALUES ('24', '1', 'admin', 'error', null, 'http://localhost/common/file/list', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'\r\n### The error may exist in file [E:\\Intellij ideaWorkSpace\\bootdo\\bootdo\\target\\classes\\mybatis\\common\\FileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select `id`,`type`,`url`,`create_date` from sys_file                                      order by id desc             limit ?, ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'', null, '2018-09-08 17:34:53');
INSERT INTO `sys_log` VALUES ('25', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 17:35:32');
INSERT INTO `sys_log` VALUES ('26', '1', 'admin', '请求访问主页', '7', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 17:35:32');
INSERT INTO `sys_log` VALUES ('27', '1', 'admin', 'error', null, 'http://localhost/common/file/list', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'\r\n### The error may exist in file [E:\\Intellij ideaWorkSpace\\bootdo\\bootdo\\target\\classes\\mybatis\\common\\FileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select `id`,`type`,`url`,`create_date` from sys_file                                      order by id desc             limit ?, ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'', null, '2018-09-08 17:35:45');
INSERT INTO `sys_log` VALUES ('28', '1', 'admin', '登录', '187', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 18:02:38');
INSERT INTO `sys_log` VALUES ('29', '1', 'admin', '请求访问主页', '37', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 18:02:38');
INSERT INTO `sys_log` VALUES ('30', '1', 'admin', '登录', '56', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 18:11:03');
INSERT INTO `sys_log` VALUES ('31', '1', 'admin', '请求访问主页', '26', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 18:11:04');
INSERT INTO `sys_log` VALUES ('32', '1', 'admin', '登录', '66', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-08 18:31:09');
INSERT INTO `sys_log` VALUES ('33', '1', 'admin', '请求访问主页', '40', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-08 18:31:09');
INSERT INTO `sys_log` VALUES ('34', null, null, 'error', null, 'http://localhost/verifyCode', 'com.google.code.kaptcha.util.ConfigException: Invalid value \'FishEyeGimpy\' for config parameter \'kaptcha.obscurificator.impl\'.', null, '2018-09-09 00:21:52');
INSERT INTO `sys_log` VALUES ('35', '1', 'admin', '登录', '12584', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 17:54:24');
INSERT INTO `sys_log` VALUES ('36', '1', 'admin', '请求访问主页', '304', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 17:54:25');
INSERT INTO `sys_log` VALUES ('37', '1', 'admin', '登录', '78', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 18:16:42');
INSERT INTO `sys_log` VALUES ('38', '1', 'admin', '请求访问主页', '23', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 18:16:42');
INSERT INTO `sys_log` VALUES ('39', '1', 'admin', '登录', '58', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 18:18:23');
INSERT INTO `sys_log` VALUES ('40', '1', 'admin', '请求访问主页', '22', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 18:18:23');
INSERT INTO `sys_log` VALUES ('41', null, null, 'error', null, 'http://localhost/index', 'java.lang.NullPointerException', null, '2018-09-09 18:19:40');
INSERT INTO `sys_log` VALUES ('42', '1', 'admin', '登录', '36', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 18:20:14');
INSERT INTO `sys_log` VALUES ('43', '1', 'admin', '请求访问主页', '23', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 18:20:46');
INSERT INTO `sys_log` VALUES ('44', '1', 'admin', '登录', '4', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 18:21:30');
INSERT INTO `sys_log` VALUES ('45', '1', 'admin', '请求访问主页', '9', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 18:21:36');
INSERT INTO `sys_log` VALUES ('46', '1', 'admin', '登录', '54', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 18:30:12');
INSERT INTO `sys_log` VALUES ('47', '1', 'admin', '请求访问主页', '26', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 18:30:12');
INSERT INTO `sys_log` VALUES ('48', '1', 'admin', '登录', '53', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 18:31:45');
INSERT INTO `sys_log` VALUES ('49', '1', 'admin', '请求访问主页', '24', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 18:31:45');
INSERT INTO `sys_log` VALUES ('50', '1', 'admin', '登录', '86', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 20:42:05');
INSERT INTO `sys_log` VALUES ('51', '1', 'admin', '请求访问主页', '26', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 20:42:05');
INSERT INTO `sys_log` VALUES ('52', '1', 'admin', '登录', '4', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 20:42:19');
INSERT INTO `sys_log` VALUES ('53', '1', 'admin', '请求访问主页', '10', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 20:42:19');
INSERT INTO `sys_log` VALUES ('54', '1', 'admin', '登录', '53', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 20:45:41');
INSERT INTO `sys_log` VALUES ('55', '1', 'admin', '请求访问主页', '24', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 20:45:42');
INSERT INTO `sys_log` VALUES ('56', '1', 'admin', '登录', '43', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 20:47:29');
INSERT INTO `sys_log` VALUES ('57', '1', 'admin', '请求访问主页', '21', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 20:47:29');
INSERT INTO `sys_log` VALUES ('58', '1', 'admin', '登录', '51', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 20:53:53');
INSERT INTO `sys_log` VALUES ('59', '1', 'admin', '请求访问主页', '24', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 20:53:53');
INSERT INTO `sys_log` VALUES ('60', '1', 'admin', '登录', '52', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 20:55:25');
INSERT INTO `sys_log` VALUES ('61', '1', 'admin', '请求访问主页', '22', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 20:55:25');
INSERT INTO `sys_log` VALUES ('62', '1', 'admin', '登录', '47', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 20:58:17');
INSERT INTO `sys_log` VALUES ('63', '1', 'admin', '请求访问主页', '36', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 20:58:18');
INSERT INTO `sys_log` VALUES ('64', null, null, 'error', null, 'http://localhost/;JSESSIONID=262ed326-38f4-4648-818c-2ed267ad86e7login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-09 21:00:55');
INSERT INTO `sys_log` VALUES ('65', '1', 'admin', '登录', '18745', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:01:38');
INSERT INTO `sys_log` VALUES ('66', '1', 'admin', '请求访问主页', '16', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:01:39');
INSERT INTO `sys_log` VALUES ('67', null, null, 'error', null, 'http://localhost/;JSESSIONID=95fbd4d1-4db9-4caa-8ac8-da5c417a5420login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-09 21:01:48');
INSERT INTO `sys_log` VALUES ('68', null, null, 'error', null, 'http://localhost/;JSESSIONID=95fbd4d1-4db9-4caa-8ac8-da5c417a5420login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-09 21:02:03');
INSERT INTO `sys_log` VALUES ('69', null, null, 'error', null, 'http://localhost/;JSESSIONID=95fbd4d1-4db9-4caa-8ac8-da5c417a5420login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-09 21:03:13');
INSERT INTO `sys_log` VALUES ('70', '1', 'admin', '登录', '13296', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:03:45');
INSERT INTO `sys_log` VALUES ('71', '1', 'admin', '登录', '3338', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:05:00');
INSERT INTO `sys_log` VALUES ('72', '1', 'admin', '登录', '75546', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:06:57');
INSERT INTO `sys_log` VALUES ('73', '-1', '获取用户信息为空', '登录', '29309', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:11:11');
INSERT INTO `sys_log` VALUES ('74', '1', 'admin', '登录', '2695', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:12:16');
INSERT INTO `sys_log` VALUES ('75', '1', 'admin', '请求访问主页', '23', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:12:16');
INSERT INTO `sys_log` VALUES ('76', '-1', '获取用户信息为空', '登录', '191', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:48:37');
INSERT INTO `sys_log` VALUES ('77', '1', 'admin', '登录', '17', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:48:56');
INSERT INTO `sys_log` VALUES ('78', '1', 'admin', '请求访问主页', '68', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:48:56');
INSERT INTO `sys_log` VALUES ('79', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:49:29');
INSERT INTO `sys_log` VALUES ('80', '1', 'admin', '请求访问主页', '11', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:49:29');
INSERT INTO `sys_log` VALUES ('81', '1', 'admin', '请求访问主页', '15', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:49:40');
INSERT INTO `sys_log` VALUES ('82', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:49:45');
INSERT INTO `sys_log` VALUES ('83', '1', 'admin', '请求访问主页', '8', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:49:45');
INSERT INTO `sys_log` VALUES ('84', '1', 'admin', '登录', '54', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:50:33');
INSERT INTO `sys_log` VALUES ('85', '1', 'admin', '请求访问主页', '23', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:50:33');
INSERT INTO `sys_log` VALUES ('86', '-1', '获取用户信息为空', '登录', '5', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:50:42');
INSERT INTO `sys_log` VALUES ('87', '1', 'admin', '登录', '8771', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:51:35');
INSERT INTO `sys_log` VALUES ('88', '1', 'admin', '请求访问主页', '16', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:52:47');
INSERT INTO `sys_log` VALUES ('89', '-1', '获取用户信息为空', '登录', '7', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:54:17');
INSERT INTO `sys_log` VALUES ('90', '1', 'admin', '登录', '54', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 21:54:26');
INSERT INTO `sys_log` VALUES ('91', '1', 'admin', '请求访问主页', '34370', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 21:55:01');
INSERT INTO `sys_log` VALUES ('92', null, null, 'error', null, 'http://localhost/index', 'java.lang.NullPointerException', null, '2018-09-09 21:56:54');
INSERT INTO `sys_log` VALUES ('93', '1', 'admin', '登录', '112', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:05:26');
INSERT INTO `sys_log` VALUES ('94', '1', 'admin', '请求访问主页', '27', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:05:26');
INSERT INTO `sys_log` VALUES ('95', '-1', '获取用户信息为空', '登录', '2399', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:05:58');
INSERT INTO `sys_log` VALUES ('96', '1', 'admin', '登录', '18568', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:06:32');
INSERT INTO `sys_log` VALUES ('97', '1', 'admin', '请求访问主页', '11', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:06:33');
INSERT INTO `sys_log` VALUES ('98', '1', 'admin', '登录', '57', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:07:02');
INSERT INTO `sys_log` VALUES ('99', '1', 'admin', '请求访问主页', '26', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:07:02');
INSERT INTO `sys_log` VALUES ('100', '-1', '获取用户信息为空', '登录', '5', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:07:18');
INSERT INTO `sys_log` VALUES ('101', '1', 'admin', '登录', '4', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:07:22');
INSERT INTO `sys_log` VALUES ('102', '1', 'admin', '请求访问主页', '12', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:07:22');
INSERT INTO `sys_log` VALUES ('103', '1', 'admin', '登录', '55', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:08:10');
INSERT INTO `sys_log` VALUES ('104', '1', 'admin', '请求访问主页', '22', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:08:10');
INSERT INTO `sys_log` VALUES ('105', '1', 'admin', '登录', '4', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:08:19');
INSERT INTO `sys_log` VALUES ('106', '1', 'admin', '请求访问主页', '10', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:08:20');
INSERT INTO `sys_log` VALUES ('107', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:09:03');
INSERT INTO `sys_log` VALUES ('108', '1', 'admin', '请求访问主页', '9', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:09:03');
INSERT INTO `sys_log` VALUES ('109', '1', 'admin', '登录', '64', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:10:07');
INSERT INTO `sys_log` VALUES ('110', '1', 'admin', '请求访问主页', '23', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:10:08');
INSERT INTO `sys_log` VALUES ('111', '1', 'admin', '登录', '47', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:12:11');
INSERT INTO `sys_log` VALUES ('112', '1', 'admin', '请求访问主页', '29', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:12:11');
INSERT INTO `sys_log` VALUES ('113', '1', 'admin', '请求访问主页', '14', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:13:19');
INSERT INTO `sys_log` VALUES ('114', null, null, 'error', null, 'http://localhost/;JSESSIONID=522aa945-a605-4294-b8d4-f35dee07c228login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-09 22:13:28');
INSERT INTO `sys_log` VALUES ('115', '1', 'admin', '登录', '16', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:14:01');
INSERT INTO `sys_log` VALUES ('116', '1', 'admin', '请求访问主页', '0', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:14:08');
INSERT INTO `sys_log` VALUES ('117', '1', 'admin', '登录', '7395', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-09 22:16:38');
INSERT INTO `sys_log` VALUES ('118', '1', 'admin', '请求访问主页', '32', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-09 22:16:39');
INSERT INTO `sys_log` VALUES ('119', '-1', '获取用户信息为空', '登录', '201', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:10:31');
INSERT INTO `sys_log` VALUES ('120', '-1', '获取用户信息为空', '登录', '5', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:10:40');
INSERT INTO `sys_log` VALUES ('121', '-1', '获取用户信息为空', '登录', '11402', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:11:05');
INSERT INTO `sys_log` VALUES ('122', '1', 'admin', '登录', '10902', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:19:14');
INSERT INTO `sys_log` VALUES ('123', '1', 'admin', '请求访问主页', '256', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-10 21:19:14');
INSERT INTO `sys_log` VALUES ('124', '1', 'admin', '登录', '12425', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:19:45');
INSERT INTO `sys_log` VALUES ('125', '1', 'admin', '请求访问主页', '13', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-10 21:19:45');
INSERT INTO `sys_log` VALUES ('126', '1', 'admin', '登录', '25750', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:20:40');
INSERT INTO `sys_log` VALUES ('127', '1', 'admin', '请求访问主页', '9', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-10 21:20:40');
INSERT INTO `sys_log` VALUES ('128', '-1', '获取用户信息为空', '登录', '16249', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:30:14');
INSERT INTO `sys_log` VALUES ('129', '-1', '获取用户信息为空', '登录', '5448', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:30:35');
INSERT INTO `sys_log` VALUES ('130', '1', 'admin', '登录', '5642', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:36:20');
INSERT INTO `sys_log` VALUES ('131', '1', 'admin', '请求访问主页', '129', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-10 21:36:21');
INSERT INTO `sys_log` VALUES ('132', '1', 'admin', '登录', '66675', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:37:49');
INSERT INTO `sys_log` VALUES ('133', '1', 'admin', '请求访问主页', '11', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-10 21:37:50');
INSERT INTO `sys_log` VALUES ('134', '1', 'admin', '登录', '11667', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 21:38:13');
INSERT INTO `sys_log` VALUES ('135', '1', 'admin', '请求访问主页', '9', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-10 21:38:13');
INSERT INTO `sys_log` VALUES ('136', '1', 'admin', '登录', '29406', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 23:40:12');
INSERT INTO `sys_log` VALUES ('137', '1', 'admin', '请求访问主页', '21', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-10 23:40:12');
INSERT INTO `sys_log` VALUES ('138', '1', 'admin', '登录', '27897', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 23:41:51');
INSERT INTO `sys_log` VALUES ('139', '1', 'admin', '请求访问主页', '13', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-10 23:41:51');
INSERT INTO `sys_log` VALUES ('140', '-1', '获取用户信息为空', '登录', '55247', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 23:51:11');
INSERT INTO `sys_log` VALUES ('141', '-1', '获取用户信息为空', '登录', '3593', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-10 23:51:37');
INSERT INTO `sys_log` VALUES ('142', '-1', '获取用户信息为空', '登录', '18399', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 00:06:39');
INSERT INTO `sys_log` VALUES ('143', '-1', '获取用户信息为空', '登录', '34942', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 00:07:20');
INSERT INTO `sys_log` VALUES ('144', '1', 'admin', '登录', '11376', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 00:09:02');
INSERT INTO `sys_log` VALUES ('145', '1', 'admin', '请求访问主页', '61', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 00:09:02');
INSERT INTO `sys_log` VALUES ('146', '-1', '获取用户信息为空', '登录', '4870', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 21:56:52');
INSERT INTO `sys_log` VALUES ('147', '-1', '获取用户信息为空', '登录', '4', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 21:57:31');
INSERT INTO `sys_log` VALUES ('148', '-1', '获取用户信息为空', '登录', '95', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:04:32');
INSERT INTO `sys_log` VALUES ('149', '-1', '获取用户信息为空', '登录', '4', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:04:41');
INSERT INTO `sys_log` VALUES ('150', '-1', '获取用户信息为空', '登录', '116', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:10:27');
INSERT INTO `sys_log` VALUES ('151', null, null, 'error', null, 'http://localhost/;JSESSIONID=3da4894a-6b1c-4951-9dc1-1ece19465a3alogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-11 22:10:52');
INSERT INTO `sys_log` VALUES ('152', '-1', '获取用户信息为空', '登录', '4', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:11:26');
INSERT INTO `sys_log` VALUES ('153', '-1', '获取用户信息为空', '登录', '6', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:14:26');
INSERT INTO `sys_log` VALUES ('154', '-1', '获取用户信息为空', '登录', '41212', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:15:24');
INSERT INTO `sys_log` VALUES ('155', '-1', '获取用户信息为空', '登录', '779', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:15:33');
INSERT INTO `sys_log` VALUES ('156', '-1', '获取用户信息为空', '登录', '8217', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:16:12');
INSERT INTO `sys_log` VALUES ('157', null, null, 'error', null, 'http://localhost/;JSESSIONID=87f1b7ce-bd25-4cf4-b585-60174fedb3b7login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-11 22:17:05');
INSERT INTO `sys_log` VALUES ('158', '-1', '获取用户信息为空', '登录', '8280', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:17:39');
INSERT INTO `sys_log` VALUES ('159', '-1', '获取用户信息为空', '登录', '3369', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:18:03');
INSERT INTO `sys_log` VALUES ('160', '-1', '获取用户信息为空', '登录', '29258', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:19:10');
INSERT INTO `sys_log` VALUES ('161', null, null, 'error', null, 'http://localhost/;JSESSIONID=97b5e3f1-55a0-4432-a232-16b86e1b78cblogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-11 22:22:17');
INSERT INTO `sys_log` VALUES ('162', '-1', '获取用户信息为空', '登录', '9749', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:22:36');
INSERT INTO `sys_log` VALUES ('163', null, null, 'error', null, 'http://localhost/;JSESSIONID=c9db7378-ad67-4481-abf2-6192a6d339e6login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-11 22:27:22');
INSERT INTO `sys_log` VALUES ('164', '-1', '获取用户信息为空', '登录', '3531', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:27:35');
INSERT INTO `sys_log` VALUES ('165', '1', 'admin', '登录', '7992', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:27:55');
INSERT INTO `sys_log` VALUES ('166', '1', 'admin', '请求访问主页', '1440', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:27:56');
INSERT INTO `sys_log` VALUES ('167', null, null, 'error', null, 'http://localhost/;JSESSIONID=e0137298-fd57-44f9-b238-533d8415bceelogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-11 22:28:09');
INSERT INTO `sys_log` VALUES ('168', '-1', '获取用户信息为空', '登录', '6633', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:28:24');
INSERT INTO `sys_log` VALUES ('169', '1', 'admin', '登录', '17054', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:29:01');
INSERT INTO `sys_log` VALUES ('170', '1', 'admin', '请求访问主页', '11', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:29:01');
INSERT INTO `sys_log` VALUES ('171', '-1', '获取用户信息为空', '登录', '3310', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:29:16');
INSERT INTO `sys_log` VALUES ('172', '1', 'admin', '登录', '2903', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:29:43');
INSERT INTO `sys_log` VALUES ('173', '1', 'admin', '请求访问主页', '7', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:29:43');
INSERT INTO `sys_log` VALUES ('174', null, null, 'error', null, 'http://localhost/;JSESSIONID=df95798a-432f-4845-b0b8-ad15096c6e4blogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-11 22:29:54');
INSERT INTO `sys_log` VALUES ('175', null, null, 'error', null, 'http://localhost/;JSESSIONID=df95798a-432f-4845-b0b8-ad15096c6e4blogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-11 22:30:40');
INSERT INTO `sys_log` VALUES ('176', '-1', '获取用户信息为空', '登录', '1290', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:31:12');
INSERT INTO `sys_log` VALUES ('177', '1', 'admin', '登录', '8564', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:31:55');
INSERT INTO `sys_log` VALUES ('178', '1', 'admin', '请求访问主页', '9', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:31:55');
INSERT INTO `sys_log` VALUES ('179', null, null, 'error', null, 'http://localhost/;JSESSIONID=977dcde7-86aa-4c3d-abc2-740154842f79login', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported', null, '2018-09-11 22:32:15');
INSERT INTO `sys_log` VALUES ('180', '-1', '获取用户信息为空', '登录', '2680', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:34:40');
INSERT INTO `sys_log` VALUES ('181', '1', 'admin', '登录', '6880', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:35:12');
INSERT INTO `sys_log` VALUES ('182', '1', 'admin', '请求访问主页', '10', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:35:12');
INSERT INTO `sys_log` VALUES ('183', '1', 'admin', '请求访问主页', '9', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:35:40');
INSERT INTO `sys_log` VALUES ('184', '1', 'admin', '登录', '1472', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:35:49');
INSERT INTO `sys_log` VALUES ('185', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:35:49');
INSERT INTO `sys_log` VALUES ('186', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:36:02');
INSERT INTO `sys_log` VALUES ('187', '1', 'admin', '登录', '7957', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:40:58');
INSERT INTO `sys_log` VALUES ('188', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:40:58');
INSERT INTO `sys_log` VALUES ('189', '-1', '获取用户信息为空', '登录', '3705', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:41:20');
INSERT INTO `sys_log` VALUES ('190', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:41:29');
INSERT INTO `sys_log` VALUES ('191', '1', 'admin', '登录', '26576', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:42:04');
INSERT INTO `sys_log` VALUES ('192', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:42:05');
INSERT INTO `sys_log` VALUES ('193', '1', 'admin', '登录', '5592', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:43:42');
INSERT INTO `sys_log` VALUES ('194', '1', 'admin', '请求访问主页', '8', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:43:42');
INSERT INTO `sys_log` VALUES ('195', '-1', '获取用户信息为空', '登录', '1214', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:44:08');
INSERT INTO `sys_log` VALUES ('196', '1', 'admin', '请求访问主页', '5', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:44:19');
INSERT INTO `sys_log` VALUES ('197', '1', 'admin', '登录', '4833', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:44:36');
INSERT INTO `sys_log` VALUES ('198', '1', 'admin', '请求访问主页', '5', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:44:36');
INSERT INTO `sys_log` VALUES ('199', '-1', '获取用户信息为空', '登录', '3577', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:45:23');
INSERT INTO `sys_log` VALUES ('200', '1', 'admin', '登录', '16133', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:45:56');
INSERT INTO `sys_log` VALUES ('201', '1', 'admin', '请求访问主页', '5', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:45:56');
INSERT INTO `sys_log` VALUES ('202', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:47:17');
INSERT INTO `sys_log` VALUES ('203', '1', 'admin', '登录', '9707', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:47:39');
INSERT INTO `sys_log` VALUES ('204', '1', 'admin', '请求访问主页', '5', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:47:39');
INSERT INTO `sys_log` VALUES ('205', '1', 'admin', '登录', '4935', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-11 22:50:06');
INSERT INTO `sys_log` VALUES ('206', '1', 'admin', '请求访问主页', '7', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-11 22:50:06');
INSERT INTO `sys_log` VALUES ('207', '1', 'admin', '请求访问主页', '210', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 22:11:25');
INSERT INTO `sys_log` VALUES ('208', '1', 'admin', '登录', '10230', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:11:45');
INSERT INTO `sys_log` VALUES ('209', '1', 'admin', '请求访问主页', '15', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 22:11:45');
INSERT INTO `sys_log` VALUES ('210', '-1', '获取用户信息为空', '登录', '33178', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:41:35');
INSERT INTO `sys_log` VALUES ('211', '-1', '获取用户信息为空', '登录', '7277', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:41:52');
INSERT INTO `sys_log` VALUES ('212', '-1', '获取用户信息为空', '登录', '2645', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:42:36');
INSERT INTO `sys_log` VALUES ('213', '-1', '获取用户信息为空', '登录', '734', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:42:45');
INSERT INTO `sys_log` VALUES ('214', '-1', '获取用户信息为空', '登录', '21082', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:43:37');
INSERT INTO `sys_log` VALUES ('215', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:45:53');
INSERT INTO `sys_log` VALUES ('216', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:45:54');
INSERT INTO `sys_log` VALUES ('217', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:45:57');
INSERT INTO `sys_log` VALUES ('218', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:45:57');
INSERT INTO `sys_log` VALUES ('219', '-1', '获取用户信息为空', '登录', '1', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:49:36');
INSERT INTO `sys_log` VALUES ('220', '-1', '获取用户信息为空', '登录', '4725', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:49:50');
INSERT INTO `sys_log` VALUES ('221', '-1', '获取用户信息为空', '登录', '3143', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:49:59');
INSERT INTO `sys_log` VALUES ('222', '-1', '获取用户信息为空', '登录', '3144', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:50:22');
INSERT INTO `sys_log` VALUES ('223', '-1', '获取用户信息为空', '登录', '34834', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:54:47');
INSERT INTO `sys_log` VALUES ('224', '1', 'admin', '登录', '6459', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:58:19');
INSERT INTO `sys_log` VALUES ('225', '1', 'admin', '请求访问主页', '84', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 22:58:20');
INSERT INTO `sys_log` VALUES ('226', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:58:36');
INSERT INTO `sys_log` VALUES ('227', '-1', '获取用户信息为空', '登录', '1', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:58:37');
INSERT INTO `sys_log` VALUES ('228', '-1', '获取用户信息为空', '登录', '3628', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:58:46');
INSERT INTO `sys_log` VALUES ('229', '-1', '获取用户信息为空', '登录', '1037', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:58:53');
INSERT INTO `sys_log` VALUES ('230', '-1', '获取用户信息为空', '登录', '517', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:59:01');
INSERT INTO `sys_log` VALUES ('231', '1', 'admin', '登录', '5857', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:59:37');
INSERT INTO `sys_log` VALUES ('232', '1', 'admin', '请求访问主页', '14', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 22:59:37');
INSERT INTO `sys_log` VALUES ('233', '-1', '获取用户信息为空', '登录', '5061', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 22:59:55');
INSERT INTO `sys_log` VALUES ('234', '-1', '获取用户信息为空', '登录', '12183', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:00:28');
INSERT INTO `sys_log` VALUES ('235', '-1', '获取用户信息为空', '登录', '1232', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:00:41');
INSERT INTO `sys_log` VALUES ('236', '1', 'admin', '请求访问主页', '5', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:00:48');
INSERT INTO `sys_log` VALUES ('237', '1', 'admin', '登录', '2410', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:00:58');
INSERT INTO `sys_log` VALUES ('238', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:00:58');
INSERT INTO `sys_log` VALUES ('239', '1', 'admin', '请求访问主页', '5', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:01:08');
INSERT INTO `sys_log` VALUES ('240', '1', 'admin', '登录', '3711', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:01:23');
INSERT INTO `sys_log` VALUES ('241', '1', 'admin', '请求访问主页', '9', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:01:23');
INSERT INTO `sys_log` VALUES ('242', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:01:34');
INSERT INTO `sys_log` VALUES ('243', '1', 'admin', '登录', '2662', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:02:04');
INSERT INTO `sys_log` VALUES ('244', '1', 'admin', '请求访问主页', '8', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:02:04');
INSERT INTO `sys_log` VALUES ('245', '-1', '获取用户信息为空', '登录', '2858', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:02:35');
INSERT INTO `sys_log` VALUES ('246', '1', 'admin', '请求访问主页', '6', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:02:50');
INSERT INTO `sys_log` VALUES ('247', '1', 'admin', '登录', '14190', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:05:45');
INSERT INTO `sys_log` VALUES ('248', '1', 'admin', '请求访问主页', '8', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:05:45');
INSERT INTO `sys_log` VALUES ('249', '1', 'admin', '请求访问主页', '58', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:06:11');
INSERT INTO `sys_log` VALUES ('250', '1', 'admin', '登录', '1646', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:06:21');
INSERT INTO `sys_log` VALUES ('251', '1', 'admin', '登录', '1513', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:06:25');
INSERT INTO `sys_log` VALUES ('252', '1', 'admin', '登录', '3200', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:10:49');
INSERT INTO `sys_log` VALUES ('253', '1', 'admin', '登录', '1537', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:10:54');
INSERT INTO `sys_log` VALUES ('254', '1', 'admin', '登录', '1494', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:10:59');
INSERT INTO `sys_log` VALUES ('255', '1', 'admin', '登录', '4076', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:11:10');
INSERT INTO `sys_log` VALUES ('256', '1', 'admin', '请求访问主页', '17', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:11:10');
INSERT INTO `sys_log` VALUES ('257', '-1', '获取用户信息为空', '登录', '1', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:11:30');
INSERT INTO `sys_log` VALUES ('258', '1', 'admin', '请求访问主页', '5', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:11:40');
INSERT INTO `sys_log` VALUES ('259', '1', 'admin', '登录', '1315', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:11:56');
INSERT INTO `sys_log` VALUES ('260', '1', 'admin', '登录', '2462', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:12:04');
INSERT INTO `sys_log` VALUES ('261', '1', 'admin', '请求访问主页', '22', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:12:04');
INSERT INTO `sys_log` VALUES ('262', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:16:29');
INSERT INTO `sys_log` VALUES ('263', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:16:34');
INSERT INTO `sys_log` VALUES ('264', '-1', '获取用户信息为空', '登录', '887', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:16:45');
INSERT INTO `sys_log` VALUES ('265', '-1', '获取用户信息为空', '登录', '439', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:16:51');
INSERT INTO `sys_log` VALUES ('266', '1', 'admin', '请求访问主页', '24', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:17:00');
INSERT INTO `sys_log` VALUES ('267', '1', 'admin', '登录', '1485', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:17:41');
INSERT INTO `sys_log` VALUES ('268', '1', 'admin', '登录', '2354', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:17:49');
INSERT INTO `sys_log` VALUES ('269', '1', 'admin', '请求访问主页', '11', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:17:49');
INSERT INTO `sys_log` VALUES ('270', '1', 'admin', '请求访问主页', '7', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:18:01');
INSERT INTO `sys_log` VALUES ('271', '-1', '获取用户信息为空', '登录', '26152', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:22:32');
INSERT INTO `sys_log` VALUES ('272', '-1', '获取用户信息为空', '登录', '3990', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:22:47');
INSERT INTO `sys_log` VALUES ('273', '-1', '获取用户信息为空', '登录', '2804', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:24:17');
INSERT INTO `sys_log` VALUES ('274', '-1', '获取用户信息为空', '登录', '1773', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:24:28');
INSERT INTO `sys_log` VALUES ('275', '-1', '获取用户信息为空', '登录', '261', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:30:46');
INSERT INTO `sys_log` VALUES ('276', '-1', '获取用户信息为空', '登录', '1892', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:30:57');
INSERT INTO `sys_log` VALUES ('277', '1', 'admin', '登录', '2515', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:31:16');
INSERT INTO `sys_log` VALUES ('278', '1', 'admin', '请求访问主页', '20', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:31:16');
INSERT INTO `sys_log` VALUES ('279', '-1', '获取用户信息为空', '登录', '150', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:35:20');
INSERT INTO `sys_log` VALUES ('280', '-1', '获取用户信息为空', '登录', '2230', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:35:49');
INSERT INTO `sys_log` VALUES ('281', '-1', '获取用户信息为空', '登录', '2217', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:36:04');
INSERT INTO `sys_log` VALUES ('282', '-1', '获取用户信息为空', '登录', '2760', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:36:18');
INSERT INTO `sys_log` VALUES ('283', '1', 'admin', '登录', '2248', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:36:27');
INSERT INTO `sys_log` VALUES ('284', '1', 'admin', '请求访问主页', '19', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:36:27');
INSERT INTO `sys_log` VALUES ('285', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:36:53');
INSERT INTO `sys_log` VALUES ('286', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:36:54');
INSERT INTO `sys_log` VALUES ('287', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:36:55');
INSERT INTO `sys_log` VALUES ('288', '-1', '获取用户信息为空', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:37:01');
INSERT INTO `sys_log` VALUES ('289', '-1', '获取用户信息为空', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:37:02');
INSERT INTO `sys_log` VALUES ('290', '-1', '获取用户信息为空', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:37:03');
INSERT INTO `sys_log` VALUES ('291', '-1', '获取用户信息为空', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:37:03');
INSERT INTO `sys_log` VALUES ('292', '-1', '获取用户信息为空', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:37:04');
INSERT INTO `sys_log` VALUES ('293', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:37:07');
INSERT INTO `sys_log` VALUES ('294', '1', 'admin', '请求访问主页', '11', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:37:07');
INSERT INTO `sys_log` VALUES ('295', null, null, 'error', null, 'http://localhost/userLogin;JSESSIONID=22fc7508-240d-4b23-b837-cec138f6b3fb', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', null, '2018-09-12 23:38:04');
INSERT INTO `sys_log` VALUES ('296', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:38:11');
INSERT INTO `sys_log` VALUES ('297', '-1', '获取用户信息为空', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:38:15');
INSERT INTO `sys_log` VALUES ('298', '1', 'admin', '请求访问主页', '22', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:38:19');
INSERT INTO `sys_log` VALUES ('299', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:38:35');
INSERT INTO `sys_log` VALUES ('300', '1', 'admin', '请求访问主页', '10', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:38:35');
INSERT INTO `sys_log` VALUES ('301', '1', 'admin', '请求访问主页', '8', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:38:48');
INSERT INTO `sys_log` VALUES ('302', '1', 'admin', '登录', '8', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-12 23:40:02');
INSERT INTO `sys_log` VALUES ('303', '1', 'admin', '请求访问主页', '7', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:40:02');
INSERT INTO `sys_log` VALUES ('304', '1', 'admin', '请求访问主页', '7', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-12 23:40:20');
INSERT INTO `sys_log` VALUES ('305', null, null, 'error', null, 'http://localhost/userLogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', null, '2018-09-12 23:40:27');
INSERT INTO `sys_log` VALUES ('306', null, null, 'error', null, 'http://localhost/userLogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', null, '2018-09-12 23:41:02');
INSERT INTO `sys_log` VALUES ('307', null, null, 'error', null, 'http://localhost/userLogin', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', null, '2018-09-12 23:41:51');
INSERT INTO `sys_log` VALUES ('308', '-1', '获取用户信息为空', '登录', '263', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:13:09');
INSERT INTO `sys_log` VALUES ('309', '-1', '获取用户信息为空', '登录', '5', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:13:12');
INSERT INTO `sys_log` VALUES ('310', '-1', '获取用户信息为空', '登录', '1', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:13:15');
INSERT INTO `sys_log` VALUES ('311', '-1', '获取用户信息为空', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:13:17');
INSERT INTO `sys_log` VALUES ('312', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:13:22');
INSERT INTO `sys_log` VALUES ('313', '1', 'admin', '请求访问主页', '934', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-13 00:13:23');
INSERT INTO `sys_log` VALUES ('314', '1', 'admin', 'error', null, 'http://localhost/common/file/list', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'\r\n### The error may exist in file [E:\\Intellij ideaWorkSpace\\bootdo\\bootdo\\target\\classes\\mybatis\\common\\FileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select `id`,`type`,`url`,`create_date` from sys_file                                      order by id desc             limit ?, ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'create_date\' in \'field list\'', null, '2018-09-13 00:13:31');
INSERT INTO `sys_log` VALUES ('315', '1', 'admin', '请求访问主页', '10', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-13 00:13:46');
INSERT INTO `sys_log` VALUES ('316', '-1', '获取用户信息为空', '登录', '1', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:13:59');
INSERT INTO `sys_log` VALUES ('317', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:14:04');
INSERT INTO `sys_log` VALUES ('318', '-1', '获取用户信息为空', '登录', '2', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:28:37');
INSERT INTO `sys_log` VALUES ('319', '-1', '获取用户信息为空', '登录', '5', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:28:45');
INSERT INTO `sys_log` VALUES ('320', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:28:49');
INSERT INTO `sys_log` VALUES ('321', '1', 'admin', '请求访问主页', '11', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-13 00:28:49');
INSERT INTO `sys_log` VALUES ('322', '1', 'admin', '请求访问主页', '7', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-13 00:28:58');
INSERT INTO `sys_log` VALUES ('323', '1', 'admin', '请求访问主页', '16', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-13 00:29:11');
INSERT INTO `sys_log` VALUES ('324', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:29:18');
INSERT INTO `sys_log` VALUES ('325', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:30:31');
INSERT INTO `sys_log` VALUES ('326', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:30:58');
INSERT INTO `sys_log` VALUES ('327', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:31:06');
INSERT INTO `sys_log` VALUES ('328', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:32:42');
INSERT INTO `sys_log` VALUES ('329', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:33:20');
INSERT INTO `sys_log` VALUES ('330', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:33:24');
INSERT INTO `sys_log` VALUES ('331', '-1', '获取用户信息为空', '登录', '0', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:33:28');
INSERT INTO `sys_log` VALUES ('332', '-1', '获取用户信息为空', '登录', '2953', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:33:36');
INSERT INTO `sys_log` VALUES ('333', '1', 'admin', '登录', '3', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:33:40');
INSERT INTO `sys_log` VALUES ('334', '1', 'admin', '请求访问主页', '5218', 'com.sf.system.controller.LoginController.index()', null, '127.0.0.1', '2018-09-13 00:33:46');
INSERT INTO `sys_log` VALUES ('335', '-1', '获取用户信息为空', '登录', '16', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:33:53');
INSERT INTO `sys_log` VALUES ('336', '-1', '获取用户信息为空', '登录', '15', 'com.sf.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2018-09-13 00:34:40');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('6', '3', '用户管理', 'sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', 'sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('20', '2', '新增', '', 'sys:menu:add', '2', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('21', '2', '编辑', '', 'sys:menu:edit', '2', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('22', '2', '删除', '', 'sys:menu:remove', '2', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('27', '91', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('48', '77', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('57', '91', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('61', '2', '批量删除', '', 'sys:menu:batchRemove', '2', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('71', '1', '文件管理', '/common/file', 'common:sysFile:sysFile', '1', 'fa fa-folder-open', '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('72', '77', '计划任务', 'common/task', 'common:taskScheduleJob', '1', 'fa fa-hourglass-1', '4', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('73', '3', '部门管理', '/sys/dept', 'sys:dept:dept', '1', 'fa fa-users', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('74', '73', '增加', '/sys/dept/add', 'sys:dept:add', '2', null, '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('75', '73', '刪除', 'sys/dept/remove', 'sys:dept:remove', '2', null, '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('76', '73', '编辑', '/sys/dept/edit', 'sys:dept:edit', '2', null, '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('77', '0', '系统工具', '', '', '0', 'fa fa-gear', '4', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('78', '1', '数据字典', '/common/dict', 'common:dict:dict', '1', 'fa fa-book', '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('79', '78', '增加', '/common/dict/add', 'common:dict:add', '2', null, '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('80', '78', '编辑', '/common/dict/edit', 'common:dict:edit', '2', null, '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('81', '78', '删除', '/common/dict/remove', 'common:dict:remove', '2', '', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('83', '78', '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', '2', '', '4', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('91', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '5', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('92', '91', '在线用户', 'sys/online', '', '1', 'fa fa-user', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('104', '77', 'swagger', '/swagger-ui.html', '', '1', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'admin', '拥有最高权限', null, null, null, null);
INSERT INTO `sys_role` VALUES ('59', '普通用户', null, '基本用户权限', null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3493 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1064', '54', '53', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1095', '55', '2', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1096', '55', '6', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1097', '55', '7', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1098', '55', '3', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1099', '55', '50', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1100', '55', '49', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1101', '55', '1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1856', '53', '28', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1857', '53', '29', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1858', '53', '30', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1859', '53', '27', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1860', '53', '57', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1861', '53', '71', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1862', '53', '48', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1863', '53', '72', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1864', '53', '1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1865', '53', '7', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1866', '53', '55', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1867', '53', '56', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1868', '53', '62', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1869', '53', '15', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1870', '53', '2', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1871', '53', '61', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1872', '53', '20', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1873', '53', '21', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('1874', '53', '22', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2084', '56', '68', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2085', '56', '60', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2086', '56', '59', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2087', '56', '58', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2088', '56', '51', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2089', '56', '50', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2090', '56', '49', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2243', '48', '72', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2247', '63', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2248', '63', '84', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2249', '63', '85', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2250', '63', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2251', '63', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2252', '64', '84', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2253', '64', '89', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2254', '64', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2255', '64', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2256', '64', '86', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2257', '64', '85', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2258', '65', '89', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2259', '65', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2260', '65', '86', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2262', '67', '48', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2263', '68', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2264', '68', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2265', '69', '89', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2266', '69', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2267', '69', '86', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2268', '69', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2269', '69', '85', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2270', '69', '84', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2271', '70', '85', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2272', '70', '89', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2273', '70', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2274', '70', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2275', '70', '86', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2276', '70', '84', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2277', '71', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2278', '72', '59', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2279', '73', '48', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2280', '74', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2281', '74', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2282', '75', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2283', '75', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2284', '76', '85', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2285', '76', '89', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2286', '76', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2287', '76', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2288', '76', '86', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2289', '76', '84', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2292', '78', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2293', '78', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2294', '78', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2295', '78', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2296', '78', null, null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2308', '80', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2309', '80', '86', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2310', '80', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2311', '80', '84', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2312', '80', '85', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2328', '79', '72', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2329', '79', '48', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2330', '79', '77', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2331', '79', '84', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2332', '79', '89', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2333', '79', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2334', '79', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2335', '79', '86', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2336', '79', '85', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2337', '79', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2338', '77', '89', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2339', '77', '88', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2340', '77', '87', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2341', '77', '86', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2342', '77', '85', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2343', '77', '84', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2344', '77', '72', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2345', '77', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2346', '77', '77', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2974', '57', '93', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2975', '57', '99', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2976', '57', '95', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2977', '57', '101', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2978', '57', '96', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2979', '57', '94', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2980', '57', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2981', '58', '93', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2982', '58', '99', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2983', '58', '95', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2984', '58', '101', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2985', '58', '96', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2986', '58', '94', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('2987', '58', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3314', '59', '76', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3315', '59', '75', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3316', '59', '74', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3317', '59', '62', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3318', '59', '56', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3319', '59', '55', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3320', '59', '15', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3321', '59', '26', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3322', '59', '25', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3323', '59', '24', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3324', '59', '14', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3325', '59', '13', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3326', '59', '12', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3327', '59', '61', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3328', '59', '22', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3329', '59', '21', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3330', '59', '20', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3331', '59', '83', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3332', '59', '81', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3333', '59', '80', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3334', '59', '79', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3335', '59', '71', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3336', '59', '73', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3337', '59', '7', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3338', '59', '6', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3339', '59', '2', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3340', '59', '3', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3341', '59', '78', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3342', '59', '1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3343', '59', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3381', '1', '92', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3382', '1', '57', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3383', '1', '104', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3384', '1', '72', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3385', '1', '48', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3386', '1', '76', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3387', '1', '75', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3388', '1', '74', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3389', '1', '62', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3390', '1', '56', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3391', '1', '55', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3392', '1', '15', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3393', '1', '26', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3394', '1', '25', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3395', '1', '24', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3396', '1', '14', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3397', '1', '13', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3398', '1', '12', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3399', '1', '61', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3400', '1', '22', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3401', '1', '21', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3402', '1', '20', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3403', '1', '83', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3404', '1', '81', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3405', '1', '80', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3406', '1', '79', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3407', '1', '71', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3408', '1', '77', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3409', '1', '73', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3410', '1', '7', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3411', '1', '6', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3412', '1', '2', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3413', '1', '3', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3414', '1', '78', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3415', '1', '1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3416', '1', '27', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3417', '1', '30', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3418', '1', '29', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3419', '1', '28', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3420', '1', '91', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3421', '1', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3452', '61', '-1', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3453', '61', '30', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3454', '61', '29', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3455', '61', '28', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3456', '61', '92', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3457', '61', '57', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3458', '61', '27', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3459', '61', '104', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3460', '61', '72', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3461', '61', '48', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3462', '61', '76', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3463', '61', '75', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3464', '61', '74', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3465', '61', '62', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3466', '61', '56', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3467', '61', '55', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3468', '61', '15', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3469', '61', '26', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3470', '61', '25', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3471', '61', '24', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3472', '61', '14', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3473', '61', '13', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3474', '61', '12', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3475', '61', '61', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3476', '61', '22', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3477', '61', '21', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3478', '61', '20', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3479', '61', '73', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3480', '61', '7', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3481', '61', '6', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3482', '61', '2', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3483', '61', '83', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3484', '61', '81', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3485', '61', '80', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3486', '61', '79', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3487', '61', '78', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3488', '61', '71', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3489', '61', '91', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3490', '61', '77', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3491', '61', '3', null, null, null, null);
INSERT INTO `sys_role_menu` VALUES ('3492', '61', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('2', '0/10 * * * * ?', 'run1', '1', '', 'com.sf.common.task.WelcomeJob', '0', 'group1', '', 'welcomJob', null, null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '所在地区',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', 'bcaddb3dee53fd4ded9079ab8a989d55', 'nixseVGAnm/6Sj63CP4X', '6', 'admin@example.com', '17699999999', '1', '1', '96', '2017-12-14 00:00:00', '138', 'ccc', '122;121;', '北京市', '北京市市辖区', '东城区', null, null, null, null);
INSERT INTO `sys_user` VALUES ('2', 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', null, '6', 'test@sf.com', null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('36', 'ldh', '刘德华', 'bfd9394475754fbe45866eba97738c36', null, '7', 'ldh@sf.com', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('123', 'zxy', '张学友', '35174ba93f5fe7267f1fb3c1bf903781', null, '6', 'zxy@sf', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('124', 'wyf', '吴亦凡', 'e179e6f687bbd57b9d7efc4746c8090a', null, '6', 'wyf@sf.com', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('130', 'lh', '鹿晗', '7924710cd673f68967cde70e188bb097', null, '9', 'lh@sf.com', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('131', 'lhc', '令狐冲', 'd515538e17ecb570ba40344b5618f5d4', null, '6', 'lhc@sf.com', null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('132', 'lyf', '刘亦菲', '7fdb1d9008f45950c1620ba0864e5fbd', null, '13', 'lyf@sf.com', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('134', 'lyh', '李彦宏', 'dc26092b3244d9d432863f2738180e19', null, '8', 'lyh@sf.com', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('135', 'wjl', '王健林', '3967697dfced162cf6a34080259b83aa', null, '6', 'wjl@bootod.com', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('136', 'gdg', '郭德纲', '3bb1bda86bc02bf6478cd91e42135d2f', null, '9', 'gdg@sf.com', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('153', '231312', '测试4', '26aaee37862830d5feacd0e679f51347', null, '6', '281485853@qq.com', null, '1', null, null, null, null, null, null, null, null, null, '1', '2018-09-08 16:50:42', '1', '2018-09-08 16:51:06');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `create_by` bigint(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('73', '30', '48', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('74', '30', '49', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('75', '30', '50', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('76', '31', '48', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('77', '31', '49', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('78', '31', '52', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('79', '32', '48', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('80', '32', '49', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('81', '32', '50', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('82', '32', '51', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('83', '32', '52', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('84', '33', '38', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('85', '33', '49', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('86', '33', '52', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('87', '34', '50', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('88', '34', '51', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('89', '34', '52', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('106', '124', '1', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('110', '1', '1', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('111', '2', '1', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('113', '131', '48', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('117', '135', '1', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('120', '134', '1', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('121', '134', '48', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('123', '130', '1', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('124', null, '48', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('125', '132', '52', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('126', '132', '49', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('127', '123', '48', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('132', '36', '48', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('144', '148', '1', null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('153', '153', '1', null, null, null, null);
