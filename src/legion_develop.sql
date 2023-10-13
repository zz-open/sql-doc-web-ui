# ************************************************************
# Mysqldoc SQL dump
#
# 主机: 39.105.50.248 (5.6.41-log)
# 数据库: legion_develop
# 生成时间: 2023-10-12 22:01:44
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_position_role`;

CREATE TABLE `admin_position_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position_id` int(10) NOT NULL DEFAULT '0' COMMENT '岗位id',
  `ps_id` int(10) NOT NULL DEFAULT '0' COMMENT '产品系统id',
  `actions` text NOT NULL COMMENT 'action集合',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `position_role` (`position_id`,`ps_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='管理后台岗位角色';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '企业成员的在workapp中的id',
  `workapp_id` varchar(64) NOT NULL DEFAULT '' COMMENT '企业成员的在workapp中的id',
  `workapp` varchar(32) NOT NULL DEFAULT '' COMMENT '允许使用的app',
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业总部id',
  `dept` int(10) NOT NULL DEFAULT '0' COMMENT '部门',
  `positions` varchar(64) NOT NULL DEFAULT '' COMMENT '岗位',
  `mobile` varchar(12) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(18) NOT NULL DEFAULT '' COMMENT '姓名',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '头像url',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-正常;2-密码锁定;3-临时锁定;',
  `employ_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '雇佣状态：1-在职；2-离职',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别：1-男；2-女',
  `pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '用户密码',
  `pwd_salt` varchar(16) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `entry_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '入职时间',
  `creator` varchar(16) NOT NULL DEFAULT '' COMMENT '添加人',
  `updater` varchar(16) NOT NULL DEFAULT '' COMMENT '修改人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `job_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '员工类型：1-全职；2-兼职',
  `c_high_weight` float(12,8) NOT NULL DEFAULT '1.00000000' COMMENT '高质量客户权重',
  `c_weight` float(12,8) NOT NULL DEFAULT '1.00000000' COMMENT '客户权重',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='企业员工';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent`;

CREATE TABLE `agent` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '加盟机构名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-已启用;2-已禁用',
  `cooperation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作方式:1-正式;2-试用;3-课程植入;',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加盟级别:1-总部;2-全国;3-省级;4-市级;5-区县级;6-校级',
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `supagent_id` int(10) NOT NULL DEFAULT '0' COMMENT '上级代理商',
  `join_type` varchar(20) NOT NULL DEFAULT '' COMMENT '加盟方式:1-加盟机构;2-学习机体验店;3-学校;逗号分隔',
  `agent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商链: -1-2-3-',
  `balance_xk` int(10) NOT NULL DEFAULT '0' COMMENT '学科余额',
  `balance_wj` int(10) NOT NULL DEFAULT '0' COMMENT '外教余额',
  `allow_subagent_level` varchar(20) NOT NULL DEFAULT '' COMMENT '允许发展下级代理的级别,逗号分隔',
  `campus_join_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '校级代理类型:1-单店:2-多店',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '具体地址',
  `manager` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人',
  `manager_id` int(10) NOT NULL DEFAULT '0' COMMENT '负责人id',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `id_number` varchar(32) NOT NULL DEFAULT '' COMMENT '身份证号',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源渠道：1-内部渠道;2-线上;3-线下;4-转介绍',
  `introducer` varchar(20) NOT NULL DEFAULT '0' COMMENT '转介绍人姓名',
  `join_products` varchar(50) NOT NULL DEFAULT '' COMMENT '加盟的产品id',
  `join_regions` varchar(600) NOT NULL DEFAULT '' COMMENT '加盟的区域列表',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟开始时间',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期时间',
  `extend_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '延长日期',
  `oper_version` int(10) NOT NULL DEFAULT '1' COMMENT '操作版本',
  `join_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加盟状态：1-加盟中；2-到期延期中；3-到期并延期结束六个月内；4-到期并已停用',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_in_school` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否进校：1-是;0-否',
  `school_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学校类型：1-公里校;2-私立校',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `agent_chain` (`agent_chain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_bill`;

CREATE TABLE `agent_bill` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `trader_id` int(10) NOT NULL DEFAULT '0' COMMENT '交易方id',
  `trader_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交易方类型:1-代理商;2-校区',
  `trader_to` varchar(64) NOT NULL DEFAULT '' COMMENT '和谁做的交易',
  `trader_to_id` int(10) NOT NULL DEFAULT '0' COMMENT '和谁做的交易',
  `trader_to_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交易方类型:1-代理商;2-校区',
  `account` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账户',
  `product_id` int(10) NOT NULL DEFAULT '0' COMMENT '产品',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交易类型',
  `fee_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '进账类型:1-进账;2-出账',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '交易金额',
  `balance` int(10) NOT NULL DEFAULT '0' COMMENT '交易后交易方的余额',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '详情',
  `ext` varchar(32) NOT NULL DEFAULT '' COMMENT '交易扩展字段,json格式',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `trader` (`trader_id`,`trader_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商账户明细';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_join`;

CREATE TABLE `agent_join` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `agent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '父级链',
  `product_id` int(10) NOT NULL DEFAULT '0' COMMENT '加盟产品id',
  `exclusive_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是独家',
  `expire_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代理是否过期',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '代理省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '代理市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '代理县',
  `region` varchar(64) NOT NULL DEFAULT '' COMMENT '代理区域',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟日期',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期',
  `extend_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '延长到期',
  `join_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加盟状态：1-加盟中；2-到期延期中；3-到期并延期结束六个月内；4-到期并已停用',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_product_region` (`agent_id`,`product_id`,`region`),
  KEY `product_region` (`product_id`,`region`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商加盟表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_position_role`;

CREATE TABLE `agent_position_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position_id` int(10) NOT NULL DEFAULT '0' COMMENT '岗位id',
  `ps_id` int(10) NOT NULL DEFAULT '0' COMMENT '产品系统id',
  `actions` text NOT NULL COMMENT 'action集合',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `position_role` (`position_id`,`ps_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商岗位角色';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_sys_version`;

CREATE TABLE `agent_sys_version` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ps_id` int(10) NOT NULL DEFAULT '0' COMMENT '产品系统id',
  `version` varchar(10) NOT NULL DEFAULT '' COMMENT '版本',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT '重要提示',
  `pids` varchar(500) NOT NULL DEFAULT '图片ids,逗号分隔',
  `fids` varchar(500) NOT NULL DEFAULT '文件ids,逗号分隔',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:1-未发布;2-已发布',
  `publish_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '发布日期',
  `is_force_remind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否强制提醒：0-不强制，1-强制',
  `remind_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '提醒时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `publish_time` varchar(50) NOT NULL DEFAULT '' COMMENT '发布时间：预期9月20日',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商系统版本';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_user`;

CREATE TABLE `agent_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'admin user id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '所属代理商',
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `positions` text NOT NULL COMMENT '岗位id,多个id用,号分隔',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-可用;2-密码锁定;3-禁用;4-删除',
  `employ_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '雇佣状态：1-在职；2-离职',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别：1-男；2-女',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '出生日期',
  `id_number` varchar(32) NOT NULL DEFAULT '' COMMENT '身份证号',
  `pwd` varchar(40) NOT NULL DEFAULT '' COMMENT '密码',
  `pwd_salt` varchar(16) NOT NULL DEFAULT '' COMMENT '密码盐',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商用户';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_user_login`;

CREATE TABLE `agent_user_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '账号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `positions` text NOT NULL COMMENT '岗位ids',
  `warning_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '预警类型：1-正常；2-跨城市登录；',
  `headquarters_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '总部id',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '登录ip地址',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip区县',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip维度',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商ID',
  `agent_name` varchar(100) NOT NULL COMMENT '代理商名称',
  `store_ids` text NOT NULL COMMENT '校区ID',
  `store_name` text NOT NULL COMMENT '门店名称',
  `store_region` text NOT NULL COMMENT '门店省市区',
  `store_address` text NOT NULL COMMENT '门店具体地址',
  `distance` int(11) NOT NULL DEFAULT '0' COMMENT '距离：米',
  `remark` varchar(150) NOT NULL DEFAULT '' COMMENT '备注内容',
  `remark_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '备注时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `login_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '登录日期',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商后台用户登录日志';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_user_position`;

CREATE TABLE `agent_user_position` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商员工',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '所属代理商',
  `organization_id` int(10) NOT NULL DEFAULT '0' COMMENT '组织id',
  `organization_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组织类型:1-代理商;2-校区',
  `position_ids` text NOT NULL COMMENT '岗位id,多个id用,号分隔',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `position` (`user_id`,`organization_type`,`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商员工岗位';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_patch_version`;

CREATE TABLE `app_patch_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_version_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'app版本id',
  `description` text NOT NULL COMMENT '升级信息,用|||表示换行符',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号',
  `status` tinyint(10) NOT NULL DEFAULT '0' COMMENT '状态：0-未发布，1-已发布',
  `publish_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布日期',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='热更新补丁版本表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_version`;

CREATE TABLE `app_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '产品id号',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号',
  `platform` varchar(16) NOT NULL DEFAULT '' COMMENT '平台:ios,android',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '升级提示标题',
  `description` text NOT NULL COMMENT '升级信息,用|||表示换行符',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '软件升级地址',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本信息,eq:v1.0.1',
  `status` varchar(4) NOT NULL DEFAULT '' COMMENT 'N:最新版本;O:不提示升级;A:提示升级;E强制升级;',
  `pkg_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '客户渠道：1-光速智学；2-环球优学；3-飞鲸',
  `part_update_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '部分升级开关：0-关闭，1-开启',
  `part_update_cid` text NOT NULL COMMENT '可以部分升级的列表，用英文逗号'',''分隔',
  `allow_agent_id` varchar(2000) NOT NULL DEFAULT '' COMMENT '允许升级校区',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `application_id` varchar(100) NOT NULL DEFAULT '' COMMENT '应用id',
  `forbid_agent_id` varchar(2000) NOT NULL DEFAULT '' COMMENT '禁止升级的agent_id',
  `allow_ugs_id` varchar(2000) NOT NULL COMMENT '升级device_id白名单',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `version` (`pid`,`platform`,`no`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='App 版本信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `bi_store`;

CREATE TABLE `bi_store` (
  `pk_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区id',
  `pk` varchar(80) NOT NULL DEFAULT '' COMMENT 'md5(pk_id@period@start_date)',
  `period` tinyint(2) NOT NULL DEFAULT '1' COMMENT '周期：1-日;2-周;3-月;10-总计',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '周期开始日期',
  `follow_num` int(10) NOT NULL DEFAULT '0' COMMENT '跟进次数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `pk` (`pk`),
  KEY `pk_sign` (`pk_id`,`period`,`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店统计statistics';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `contract`;

CREATE TABLE `contract` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户id',
  `sn` varchar(64) NOT NULL DEFAULT '' COMMENT '合同编号',
  `sales_id` int(10) NOT NULL DEFAULT '0' COMMENT '销售id',
  `sales_name` varchar(32) NOT NULL DEFAULT '' COMMENT '销售',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `address` varchar(200) NOT NULL DEFAULT '',
  `cooperation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作方式:1-课程合作;2-课程代理;3-单店加盟;4-区域加盟',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合同状态',
  `total_fee` int(10) NOT NULL DEFAULT '0' COMMENT '合同总金额',
  `service_fee` int(10) NOT NULL DEFAULT '0' COMMENT '品牌服务费',
  `buy_course_fee` int(10) NOT NULL DEFAULT '0' COMMENT '购买课程币',
  `gift_course_fee` int(10) NOT NULL DEFAULT '0' COMMENT '赠送课程币',
  `device_cnt` int(10) NOT NULL DEFAULT '0' COMMENT '购买设备数量',
  `device_fee` int(10) NOT NULL DEFAULT '0' COMMENT '购买设备费用',
  `paid_fee` int(10) NOT NULL DEFAULT '0' COMMENT '已付款',
  `sign_company` tinyint(4) NOT NULL DEFAULT '0',
  `sign_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '签订日期',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '合同起始日期',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '合同结束日期',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `agreement` varchar(800) NOT NULL DEFAULT '',
  `fid` varchar(600) NOT NULL DEFAULT '' COMMENT '合同附件,多个用逗号分隔',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='合同记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `contract_fee`;

CREATE TABLE `contract_fee` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `contract_id` int(10) NOT NULL DEFAULT '0' COMMENT '合同id',
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户id',
  `sn` varchar(64) NOT NULL DEFAULT '' COMMENT '合同编号',
  `sales_id` int(10) NOT NULL DEFAULT '0' COMMENT '销售id',
  `sales_name` varchar(32) NOT NULL DEFAULT '' COMMENT '销售',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '回款状态:1-未回款；2-已回款',
  `audit_status` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回款类型：1-常规；2-预收款；3-尾款；4-保证金',
  `pay_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '缴费方式',
  `pay_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '收据编号',
  `plan_fee` int(10) NOT NULL DEFAULT '0' COMMENT '计划收款金额',
  `paid_fee` int(10) NOT NULL DEFAULT '0' COMMENT '实际收款金额',
  `invoice_fee` int(10) NOT NULL DEFAULT '0' COMMENT '开票金额',
  `poundage` int(10) NOT NULL DEFAULT '0' COMMENT '手续费',
  `plan_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '预计回款日期',
  `receive_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '实际回款日期',
  `audit_date` date NOT NULL DEFAULT '0000-00-00',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `fid` varchar(600) NOT NULL DEFAULT '' COMMENT '附件,多个用逗号分隔',
  `invoice_id` int(10) NOT NULL DEFAULT '0',
  `reject_reason` varchar(200) NOT NULL DEFAULT '',
  `oper_version` int(10) NOT NULL DEFAULT '1',
  `sign_company` tinyint(4) NOT NULL DEFAULT '0',
  `next_receive_date` date NOT NULL DEFAULT '0000-00-00',
  `no_paid_reason` varchar(200) NOT NULL DEFAULT '',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='合同回款';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(62) NOT NULL DEFAULT '' COMMENT '客户名称',
  `contact` varchar(62) NOT NULL DEFAULT '' COMMENT '主联系人',
  `mobile` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `wechat` varchar(64) NOT NULL DEFAULT '' COMMENT '主联系人微信',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '主联系人邮箱',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL COMMENT '经度',
  `latitude` varchar(16) NOT NULL COMMENT '维度',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `ip_province` varchar(32) NOT NULL DEFAULT '' COMMENT 'ip归属地',
  `ip_city` varchar(32) NOT NULL DEFAULT '' COMMENT 'ip归属地',
  `ip_district` varchar(32) NOT NULL DEFAULT '' COMMENT 'ip归属地',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '渠道来源',
  `introducer` varchar(200) NOT NULL DEFAULT '' COMMENT '转介绍人json:{"store":"校区","name":"姓名","mobile":"联系"}',
  `conflict_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '冲突状态:1-冲突;2-被冲突',
  `sales_id` int(10) NOT NULL DEFAULT '0' COMMENT '招商',
  `sales_name` varchar(20) NOT NULL DEFAULT '' COMMENT '招商',
  `last_sales_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后归属ID',
  `last_sales_name` varchar(20) NOT NULL DEFAULT '' COMMENT '最后归属人',
  `first_sales_id` int(10) NOT NULL DEFAULT '0' COMMENT '首次归属ID',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '运营id',
  `supporter_name` varchar(20) NOT NULL DEFAULT '' COMMENT '运营姓名',
  `paid_fee` int(10) NOT NULL DEFAULT '0' COMMENT '已付款',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '客户情况说明',
  `follow_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '跟进方式:1-电话呼入;2-电话呼出;3-微信;4-上门;5-客户到访;6-其他',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户类型:1-在职投资人;2-非在职投资人;3-已有机构;4-其他',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '客户状态:1-未跟进;2-跟进中;3-已成交;4-未成交',
  `is_removed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `invite_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '邀约状态:1-已到校区考查;2-已邀约到总部;3-已总部到访',
  `invite_info` varchar(200) NOT NULL DEFAULT '' COMMENT '邀约情况Json:{"store":"校区","date":"日期"}',
  `industry` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户行业:1-教育行业;2-非教育行业',
  `intention` tinyint(4) NOT NULL DEFAULT '0' COMMENT '意向程度',
  `cooperation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作方式:1-课程合作;2-课程代理;3-单店加盟;3-区域加盟',
  `budget` int(10) NOT NULL DEFAULT '0' COMMENT '报价',
  `validation` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户有效性:0-未判定；1-有效客户;2-无效客户',
  `invalidate_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '无效类型:1-联系不上;2-不干教育',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `problem` varchar(128) NOT NULL DEFAULT '' COMMENT '留言咨询问题',
  `resource_id` int(10) NOT NULL DEFAULT '0',
  `allot_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分配时间',
  `first_allot_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次分配时间',
  `follow_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '跟进日期',
  `next_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '下次跟进日期',
  `pubsea` tinyint(4) NOT NULL DEFAULT '0' COMMENT '公海:1-默认公海',
  `pubsea_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '入公海时间',
  `pubsea_times` int(10) NOT NULL DEFAULT '0' COMMENT '入公海次数',
  `oper_version` int(10) NOT NULL DEFAULT '1' COMMENT '操作版本',
  `creator` varchar(16) NOT NULL DEFAULT '' COMMENT '添加人',
  `updater` varchar(16) NOT NULL DEFAULT '' COMMENT '修改人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `corp_mobile` (`corp_id`,`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='客户';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_apply`;

CREATE TABLE `customer_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '联系方式',
  `mobile_province` varchar(32) NOT NULL DEFAULT '' COMMENT '电话归属地',
  `mobile_city` varchar(32) NOT NULL DEFAULT '' COMMENT '电话归属地',
  `mobile_district` varchar(32) NOT NULL DEFAULT '' COMMENT '电话归属地',
  `region` varchar(20) NOT NULL DEFAULT '' COMMENT '加盟地区',
  `budget` varchar(20) NOT NULL DEFAULT '' COMMENT '投资预算',
  `problem` varchar(20) NOT NULL DEFAULT '' COMMENT '咨询问题',
  `source` tinyint(2) NOT NULL DEFAULT '0' COMMENT '来源:1-PC官网;2-移动端官网',
  `page` tinyint(4) NOT NULL DEFAULT '0' COMMENT '页面1-PC Join;2-PC JiaMeng;3-M Join;4-M JiaMeng;5-M2 tuiguang',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `ip_province` varchar(32) NOT NULL DEFAULT '' COMMENT 'ip归属地',
  `ip_city` varchar(32) NOT NULL DEFAULT '' COMMENT 'ip归属地',
  `ip_district` varchar(32) NOT NULL DEFAULT '' COMMENT 'ip归属地',
  `apply_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `corp_mobile` (`corp_id`,`mobile`) USING BTREE,
  KEY `ip` (`ip`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='加盟申请';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_baidu`;

CREATE TABLE `customer_baidu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户id',
  `ucid` varchar(64) NOT NULL DEFAULT '' COMMENT '账户id',
  `clue_id` varchar(64) NOT NULL DEFAULT '' COMMENT '线索id',
  `keyword` varchar(64) NOT NULL DEFAULT '' COMMENT 'keyword',
  `search_word` varchar(64) NOT NULL DEFAULT '' COMMENT '搜索词',
  `page_url` varchar(500) NOT NULL DEFAULT '' COMMENT '投放页面url',
  `page_name` varchar(64) NOT NULL DEFAULT '' COMMENT '基木鱼页面名称',
  `creative` varchar(64) NOT NULL DEFAULT '' COMMENT '所属创意',
  `unit` varchar(64) NOT NULL DEFAULT '' COMMENT '所属单元',
  `plan` varchar(64) NOT NULL DEFAULT '' COMMENT '所属计划',
  `clue_phone` varchar(64) NOT NULL DEFAULT '' COMMENT '线索电话',
  `flow_channel` varchar(64) NOT NULL DEFAULT '' COMMENT '流量渠道',
  `source_type` varchar(64) NOT NULL DEFAULT '' COMMENT '来源类型',
  `area` varchar(64) NOT NULL DEFAULT '' COMMENT '线索地域',
  `human_msg` int(10) NOT NULL DEFAULT '0' COMMENT '人工消息数',
  `user_msg` int(10) NOT NULL DEFAULT '0' COMMENT '用户消息数',
  `ai_msg` int(10) NOT NULL DEFAULT '0' COMMENT '智能应答消息数',
  `site_id` varchar(64) NOT NULL DEFAULT '' COMMENT '站点id',
  `site` varchar(64) NOT NULL DEFAULT '' COMMENT '站点名称',
  `site_url` varchar(500) NOT NULL DEFAULT '' COMMENT '站点url',
  `bd_vid` varchar(64) NOT NULL DEFAULT '' COMMENT '转化追踪id',
  `solution_id` varchar(64) NOT NULL DEFAULT '' COMMENT '组件方案id',
  `solution_name` varchar(64) NOT NULL DEFAULT '' COMMENT '组件方案名称',
  `consult_url` varchar(64) NOT NULL DEFAULT '' COMMENT '咨询页url',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='来源于百度的客户线索';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_contact`;

CREATE TABLE `customer_contact` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型:1-其他联系人;2-主联系人',
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户',
  `name` varchar(62) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `wechat` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人微信',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人邮箱',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(16) NOT NULL DEFAULT '' COMMENT '添加人',
  `updater` varchar(16) NOT NULL DEFAULT '' COMMENT '修改人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='客户联系人';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_follow`;

CREATE TABLE `customer_follow` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户id',
  `follow_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '跟进方式:1-电话呼入;2-电话呼出;3-微信;4-上门;5-客户到访;6-其他',
  `call_fail_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '电话未接通原因：1-无人接听；2-关机；3-空号；4-停机；5-挂断',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户类型:1-在职投资人;2-非在职投资人;3-已有机构;4-其他',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户状态:1-未跟进;2-跟进中;3-已成交;4-未成交',
  `invite_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '邀约状态:1-已到校区考查;2-已邀约到总部;3-已总部到访',
  `invite_info` varchar(200) NOT NULL DEFAULT '' COMMENT '邀约情况Json:{"store":"校区","date":"日期"}',
  `industry` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户行业:1-教育行业;2-非教育行业',
  `intention` tinyint(4) NOT NULL DEFAULT '0' COMMENT '意向程度',
  `cooperation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作方式:1-课程合作;2-课程代理;3-单店加盟;4-区域加盟',
  `budget` int(10) NOT NULL DEFAULT '0' COMMENT '报价',
  `validation` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户有效性:0-未判定；1-有效客户;2-无效客户',
  `invalidate_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '无效类型:1-联系不上;2-不干教育',
  `follow_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '跟进日期',
  `next_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '下次跟进日期',
  `pids` text NOT NULL COMMENT '图片objects',
  `vids` text NOT NULL COMMENT '视频objects',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '跟进情况说明',
  `creator_id` int(10) NOT NULL DEFAULT '0' COMMENT '跟进人',
  `creator` varchar(16) NOT NULL DEFAULT '' COMMENT '跟进人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户跟进';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_log`;

CREATE TABLE `customer_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作类型:1-新建;2-编辑;3-分配;4-移交;5-跟进;6-退回公海;7-公海捞',
  `content` text NOT NULL COMMENT '操作内容json',
  `creator_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人',
  `creator` varchar(16) NOT NULL DEFAULT '' COMMENT '操作人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='客户日志';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_resource`;

CREATE TABLE `customer_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源:1-中国加盟网;2-一路商机网;3-全球加盟网;17-项目网',
  `msgid` int(11) NOT NULL COMMENT '原始msgid',
  `name` varchar(30) NOT NULL COMMENT '客户名称',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `wechat` varchar(30) NOT NULL COMMENT '微信号',
  `qq` varchar(20) NOT NULL COMMENT 'qq号',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `telephone` varchar(20) NOT NULL COMMENT '座机电话',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `_info_html` mediumtext NOT NULL COMMENT '客户信息html格式',
  `message` varchar(500) NOT NULL COMMENT '留言',
  `message_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '留言时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`,`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户原始资源';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_auth_code`;

CREATE TABLE `device_auth_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '授权码',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '授权总次数',
  `auth_num` int(10) NOT NULL DEFAULT '0' COMMENT '授权消耗次数',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `code_md5` varchar(40) NOT NULL DEFAULT '' COMMENT '授权码md5，用于客户端查询校验',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '生效状态：0-不生效，1-生效',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_md5` (`code_md5`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设备授权码表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_identify`;

CREATE TABLE `device_identify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ugs_id` varchar(200) NOT NULL DEFAULT '' COMMENT '设备唯一标识',
  `link_ids` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展标识，用于当设备上ugs_id丢失后再反向查询确定ugs_id,-link_id-',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-pad;2-phone',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ugs_id` (`ugs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设备系统唯一标识表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_shipment`;

CREATE TABLE `device_shipment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store` varchar(80) NOT NULL DEFAULT '' COMMENT '出货门店',
  `bind_store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店ID，不能修改',
  `bind_agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商ID，不能修改',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态: 1-待出货;2-已出货',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型: 1-录入;2-申请',
  `send_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '送达方式: 1-邮寄;2-现场领取',
  `device_stock_id` int(10) NOT NULL DEFAULT '0' COMMENT 'device_stock表ID',
  `device_sn` varchar(2000) NOT NULL DEFAULT '' COMMENT '设备sn,多个用英文逗号分隔',
  `device_pid` varchar(2000) NOT NULL DEFAULT '' COMMENT '设备pid,多个用英文逗号分隔',
  `device_password` varchar(50) NOT NULL DEFAULT '' COMMENT 'pad锁屏密码',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '出货数量',
  `gift_num` int(10) NOT NULL DEFAULT '0' COMMENT '赠送数量',
  `buy_num` int(10) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余库存数量',
  `is_consume` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否消耗库存: 1-是 ;0-否',
  `express_number` varchar(30) NOT NULL DEFAULT '' COMMENT '邮递编号',
  `express_pid` varchar(50) NOT NULL DEFAULT '' COMMENT '邮递pid',
  `express_fee` int(10) NOT NULL DEFAULT '0' COMMENT '邮递费用',
  `express_name` varchar(30) NOT NULL DEFAULT '' COMMENT '快递厂商',
  `addressee` varchar(10) NOT NULL DEFAULT '' COMMENT '收件人',
  `addressee_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '收件人电话',
  `addressee_address` varchar(100) NOT NULL DEFAULT '' COMMENT '收件人地址',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `material` varchar(200) NOT NULL DEFAULT '' COMMENT '相关物料说明',
  `material_pid` varchar(2000) NOT NULL DEFAULT '' COMMENT '物料pid',
  `deliver_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `deliver_by` varchar(20) NOT NULL DEFAULT '' COMMENT '发货人',
  `apply_by` varchar(20) NOT NULL DEFAULT '' COMMENT '发货申请人',
  `is_custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是定制机：1-是；0-否；',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `updater` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `apply_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `company` tinyint(4) NOT NULL DEFAULT '0' COMMENT '收款公司:1-智牛闪学；2-光速侄智学；10-其他',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `bank_deal_sn` varchar(200) NOT NULL DEFAULT '' COMMENT '银行交易号',
  `price` varchar(30) NOT NULL DEFAULT '' COMMENT '成本单价，元',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设备出货';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_stock`;

CREATE TABLE `device_stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余库存数量',
  `available_num` int(10) NOT NULL DEFAULT '0' COMMENT '可发数量',
  `invalid_num` int(10) NOT NULL DEFAULT '0' COMMENT '不可发数量',
  `sys_type` varchar(50) NOT NULL DEFAULT '自定义设备名称',
  `color` varchar(20) NOT NULL DEFAULT '' COMMENT '颜色',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `name` varchar(50) NOT NULL DEFAULT '设备背板型号',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设备库存表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_supply`;

CREATE TABLE `device_supply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_stock_id` int(10) NOT NULL DEFAULT '0' COMMENT 'device_stock表ID',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '本次供货数量',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '供完货的剩余数量',
  `device_sn` varchar(2000) NOT NULL DEFAULT '' COMMENT '设备sn,多个用英文逗号分隔',
  `supply_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '供货日期',
  `supply_by` varchar(20) NOT NULL DEFAULT '' COMMENT '供货人',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `detail` varchar(500) NOT NULL COMMENT '库存信息，json字段',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `updater` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设备供货表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-正常；2-删除',
  `is_consume` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是消耗类型：1-是；0-否',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余库存数量',
  `unit` varchar(10) NOT NULL DEFAULT '' COMMENT '单位',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updater` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `type_description` varchar(200) NOT NULL DEFAULT '' COMMENT '型号描述',
  `config_description` varchar(200) NOT NULL DEFAULT '' COMMENT '配置描述',
  `price_description` varchar(200) NOT NULL DEFAULT '' COMMENT '估值描述',
  `pids` varchar(200) NOT NULL DEFAULT '' COMMENT '物品图pid(目前支持2张图)',
  `sn` varchar(20) NOT NULL DEFAULT '' COMMENT '编号',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政物品表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `goods_shipment`;

CREATE TABLE `goods_shipment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '出货数量',
  `goods_id` int(10) NOT NULL DEFAULT '0' COMMENT '物品ID',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '出货之后剩余库存数量',
  `apply_by` varchar(20) NOT NULL DEFAULT '' COMMENT '领取人',
  `deliver_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '出货时间',
  `deliver_by` varchar(20) NOT NULL DEFAULT '' COMMENT '出货人',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updater` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政出货表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `goods_supply`;

CREATE TABLE `goods_supply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL DEFAULT '0' COMMENT '物品表ID',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '本次供货数量',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '供完货的剩余数量',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '类型：1-进货；2-归还',
  `supply_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '供货日期',
  `supply_by` varchar(20) NOT NULL DEFAULT '' COMMENT '供货人',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updater` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政供货表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `process_instance_id` varchar(50) NOT NULL DEFAULT '' COMMENT '钉钉审批实例id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `contract_id` int(10) NOT NULL DEFAULT '0',
  `contract_fee_id` int(10) NOT NULL DEFAULT '0',
  `sales_id` int(10) NOT NULL DEFAULT '0',
  `sales_name` varchar(32) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-未开票；2-已开票;',
  `target_type` tinyint(4) NOT NULL DEFAULT '0',
  `refuse_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '被驳回原因',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型：1-普通发票;2-增值税票',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '开票金额',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '发票抬头',
  `tax_id_number` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `account` varchar(100) NOT NULL DEFAULT '',
  `bank` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `apply_remark` varchar(200) NOT NULL DEFAULT '' COMMENT '开票申请备注',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '开票备注',
  `invoice_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '开票日期',
  `fid` varchar(200) NOT NULL DEFAULT '',
  `oper_version` int(10) NOT NULL DEFAULT '1' COMMENT '操作版本',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签约客户发票';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `ir_question`;

CREATE TABLE `ir_question` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `question_id` int(10) NOT NULL DEFAULT '0' COMMENT '题目id',
  `module_id` int(10) NOT NULL DEFAULT '0' COMMENT '模块id 1-''jiakao''',
  `memory_factor` float(5,4) NOT NULL DEFAULT '1.0000' COMMENT '记忆等级',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `mq_index` (`module_id`,`question_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='智能复习项目题目表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `ir_student`;

CREATE TABLE `ir_student` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `module_id` int(10) NOT NULL DEFAULT '0' COMMENT '模块id 1-''jiakao''',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '题目id',
  `memory_factor` float(5,4) NOT NULL DEFAULT '1.0000' COMMENT '记忆等级',
  `last_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次复习时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sm_index` (`module_id`,`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='智能复习项目学生表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `ir_student_review_question`;

CREATE TABLE `ir_student_review_question` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `module_id` int(10) NOT NULL DEFAULT '0' COMMENT '模块id 1-''jiakao''',
  `question_id` int(10) NOT NULL DEFAULT '0' COMMENT '题目id',
  `frequency` double NOT NULL DEFAULT '0',
  `decay_factor` double NOT NULL DEFAULT '0',
  `learn_answer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学习回答答案：0-不会；1-不确定；2-熟悉',
  `learn_answer_seq` varchar(100) NOT NULL DEFAULT '' COMMENT '新学时每次遇到该题学生回答对错序列，如：1011，0-错误；1-正确',
  `review_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习正确次数',
  `review_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习次数',
  `review_result_seq` text NOT NULL COMMENT '复习对错序列：如1011，0-错误，1-正确',
  `last_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次复习时间',
  `next_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下次复习时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `smq_index` (`student_id`,`module_id`,`question_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='智能复习项目学生题目统计表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `join_trace`;

CREATE TABLE `join_trace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区ID',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-创建；2-续约；3-延期',
  `old_store_start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '校区旧的加盟开始日期',
  `old_store_end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '校区旧的加盟到期日期',
  `old_store_extend_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '校区旧的延期到期日期',
  `new_store_start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '校区新的加盟开始日期',
  `new_store_end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '校区新的加盟到期日期',
  `new_store_extend_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '校区新的延期到期日期',
  `old_agent_start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '代理商旧的加盟开始日期',
  `old_agent_end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '代理商旧的加盟到期日期',
  `old_agent_extend_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '代理商旧的延期到期日期',
  `new_agent_start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '代理商新的加盟开始日期',
  `new_agent_end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '代理商新的加盟到期日期',
  `new_agent_extend_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '代理商新的延期到期日期',
  `delay_reason` tinyint(4) NOT NULL DEFAULT '0' COMMENT '延期原因：1-特殊申请延期；2-其他；',
  `has_protect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有区域保护：0-否；1-是',
  `radius` int(11) NOT NULL DEFAULT '0' COMMENT '区域保护距离：米',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校区加盟续约延期表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `js_version`;

CREATE TABLE `js_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号:eq:1,2,3',
  `product_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id：20-智牛英语；21-北美外教；22-数学',
  `description` text NOT NULL COMMENT '升级信息',
  `js_url` varchar(255) NOT NULL DEFAULT '' COMMENT '资源的wordblockurl',
  `input_file_name` varchar(100) NOT NULL DEFAULT '' COMMENT '输入文件名',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='js资源版本表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `moments`;

CREATE TABLE `moments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `text` varchar(1000) NOT NULL DEFAULT '' COMMENT '文字',
  `vids` text NOT NULL COMMENT '视频id',
  `pids` text NOT NULL COMMENT '图片id,多个用英文逗号分隔',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源：1-总部制作；2-校区制作；',
  `purpose` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用途：1-校区宣传；2-招商宣传；3-竞品信息；4-每日一签；',
  `top_tag_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '一级标签分类',
  `second_tag_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '二级标签分类',
  `activity_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '活动类型',
  `recruit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '招生类型',
  `rate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评分：1-5',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='朋友圈宣传';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `operating_archives`;

CREATE TABLE `operating_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `store_id` int(10) NOT NULL DEFAULT '0',
  `version` int(10) NOT NULL DEFAULT '0',
  `operate_project` varchar(100) NOT NULL DEFAULT '',
  `other_project` varchar(100) NOT NULL,
  `manager` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(18) NOT NULL DEFAULT '',
  `position` varchar(10) NOT NULL DEFAULT '',
  `organize_description` varchar(100) NOT NULL DEFAULT '',
  `salary_description` varchar(100) NOT NULL DEFAULT '',
  `student_num` int(10) NOT NULL DEFAULT '0',
  `area` int(10) NOT NULL DEFAULT '0',
  `rent` int(10) NOT NULL DEFAULT '0',
  `decorate_score` tinyint(4) NOT NULL DEFAULT '0',
  `decorate_pids` text NOT NULL,
  `decorate_vids` text NOT NULL,
  `price_pids` text NOT NULL,
  `price_fids` text NOT NULL,
  `cooperation_fids` text NOT NULL,
  `ic_license` tinyint(4) NOT NULL DEFAULT '0',
  `ic_inspect` tinyint(4) NOT NULL DEFAULT '0',
  `ic_zhiniu` tinyint(4) NOT NULL DEFAULT '0',
  `price_description` varchar(100) NOT NULL DEFAULT '',
  `contract_pids` text NOT NULL,
  `license_pids` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `contract_fids` text NOT NULL COMMENT '合同文件',
  PRIMARY KEY (`id`),
  KEY `store` (`store_id`,`version`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='运营备案表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `operating_follow`;

CREATE TABLE `operating_follow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '运营人员id',
  `store_stage` tinyint(2) NOT NULL DEFAULT '0' COMMENT '门店当前所处阶段:1-选址中;2-营建中;3-试运营;4-正常运营;5-停止运营',
  `store_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '门店当前状态:1-很棒;2-良好;3-一般;4-较差',
  `way` tinyint(2) NOT NULL DEFAULT '0' COMMENT '跟进方式:1-微信聊天;2-电话/语音呼入;3-电话/语音呼出;4-到校支持;10-其他',
  `follow_level` tinyint(2) NOT NULL DEFAULT '0',
  `follow_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '跟进日期',
  `next_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '下次跟进日期',
  `delay_days` int(10) NOT NULL DEFAULT '0',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '跟进信息',
  `pids` text NOT NULL COMMENT '图片objects',
  `vids` text NOT NULL COMMENT '视频objects',
  `fids` text NOT NULL COMMENT '文件objects',
  `problem` varchar(1000) NOT NULL DEFAULT '' COMMENT '问题',
  `solution` varchar(1000) NOT NULL DEFAULT '' COMMENT '解决方案',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `follow_scope` varchar(50) NOT NULL DEFAULT '',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='运营跟进';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `operating_follow_supplement`;

CREATE TABLE `operating_follow_supplement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `follow_id` int(10) NOT NULL DEFAULT '0' COMMENT 'support follow id',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '追加人id',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '跟进信息',
  `pids` text NOT NULL COMMENT '图片objects',
  `vids` text NOT NULL COMMENT '视频objects',
  `fids` text NOT NULL COMMENT '文件objects',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '追加人',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `follow_id` (`follow_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='运营跟进追加补充';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `operating_material`;

CREATE TABLE `operating_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `creator_id` int(10) NOT NULL DEFAULT '0' COMMENT '添加人id',
  `scene` tinyint(4) NOT NULL DEFAULT '0' COMMENT '场景:1-微信聊天;2-微信朋友圈;3-易拉宝;4-单页;5-新媒体;6-线下其他;7-线上其他',
  `top_tag_id` int(10) NOT NULL DEFAULT '0' COMMENT '一级分类标签id',
  `second_tag_id` int(10) NOT NULL DEFAULT '0' COMMENT '二级分类标签id',
  `pids` text NOT NULL COMMENT '图片objects',
  `vids` text NOT NULL COMMENT '视频objects',
  `fids` text NOT NULL COMMENT '文件objects',
  `file_type` varchar(16) NOT NULL DEFAULT '' COMMENT '文件类型:1-文件;2-视频;3-图片;多个用逗号分隔',
  `description` varchar(2000) NOT NULL DEFAULT '' COMMENT '描述',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `activity_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '活动类型',
  `recruit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '招生类型',
  `score` int(4) NOT NULL DEFAULT '0' COMMENT '打分',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `store_tag` (`store_id`,`top_tag_id`,`second_tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='校区资料';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `operating_train`;

CREATE TABLE `operating_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-待发布;2-已发布;3-已下架',
  `product_id` int(10) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `image_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图文状态:0-未上传;1-已上传',
  `vid` varchar(50) NOT NULL DEFAULT '' COMMENT '视频id',
  `pids` varchar(5000) NOT NULL DEFAULT '' COMMENT '图片id,多个用英文逗号分隔',
  `fids` varchar(2000) NOT NULL DEFAULT '' COMMENT '文件id,多个用英文逗号分隔',
  `category_1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '一级分类',
  `category_2` tinyint(4) NOT NULL DEFAULT '0' COMMENT '二级分类',
  `keyword` varchar(500) NOT NULL DEFAULT '' COMMENT '关键词,多个用|分隔',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `cover_pid` varchar(100) NOT NULL DEFAULT '' COMMENT '视频封面图片id',
  `video_duration` int(10) NOT NULL DEFAULT '0' COMMENT '视频时长(秒)',
  `duration_show` varchar(10) NOT NULL DEFAULT '' COMMENT '时长显示:00:32',
  `play_num` int(10) NOT NULL DEFAULT '0' COMMENT '观看次数',
  `play_duration` int(10) NOT NULL DEFAULT '0' COMMENT '观看时长(秒)',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `no` int(11) NOT NULL DEFAULT '9999999' COMMENT '排序号,越小越靠前',
  `release_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `recommend_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '推荐时间',
  `cancel_recommend_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '取消推荐时间',
  `watch_store_num` int(10) NOT NULL DEFAULT '0' COMMENT '观看校区数量（去重）',
  `inner_fids` varchar(2000) NOT NULL DEFAULT '' COMMENT '培训ppt文件id,多个用英文逗号分隔',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '运营人员ID',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='校区培训资料';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `org_deduction`;

CREATE TABLE `org_deduction` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `org_id` int(10) NOT NULL DEFAULT '0' COMMENT '组织id',
  `org_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组织类型:1-代理商;2-校区',
  `account` tinyint(4) NOT NULL DEFAULT '1' COMMENT '扣费账户:1-智牛币;2-北美外教',
  `reason` tinyint(4) NOT NULL DEFAULT '1' COMMENT '扣费原因:1-违反规则;2-上级转出;3-其他',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '扣费金额分',
  `is_to_superior` tinyint(4) NOT NULL DEFAULT '0' COMMENT '扣费是否返还给上级',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '扣费备注',
  `originator` varchar(8) NOT NULL DEFAULT '' COMMENT '发起人',
  `originator_id` int(10) NOT NULL DEFAULT '0' COMMENT '发起人id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扣费';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `org_recharge`;

CREATE TABLE `org_recharge` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `instance_id` varchar(50) NOT NULL DEFAULT '' COMMENT '审批实例(dingtalk)',
  `org_id` int(10) NOT NULL DEFAULT '0' COMMENT '组织id',
  `org_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组织类型:1-代理商;2-校区',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-待审批;2-已同意;3-已拒绝',
  `account` tinyint(4) NOT NULL DEFAULT '1' COMMENT '充值账户:1-智牛币;2-北美外教',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '充值类型',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '充值金额分',
  `proof` varchar(500) NOT NULL DEFAULT '' COMMENT '充值凭证pid,多个逗号分隔',
  `is_delay_org` tinyint(4) NOT NULL DEFAULT '0' COMMENT '充值后是否对组织进行延期',
  `delay_from` date NOT NULL DEFAULT '0000-00-00' COMMENT '从...日期开始延',
  `delay_to` date NOT NULL DEFAULT '0000-00-00' COMMENT '延到...日期',
  `new_radius` int(10) NOT NULL DEFAULT '0' COMMENT '充值后的新保护半径(米)',
  `refuse_reason` varchar(200) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '充值备注',
  `originator` varchar(8) NOT NULL DEFAULT '' COMMENT '发起人',
  `originator_id` int(10) NOT NULL DEFAULT '0' COMMENT '发起人id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `instance_id` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `pad`;

CREATE TABLE `pad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(128) NOT NULL DEFAULT '' COMMENT '设备id,设备唯一',
  `device_sn` varchar(200) NOT NULL DEFAULT '' COMMENT '设备sn',
  `cid` varchar(64) NOT NULL DEFAULT '' COMMENT '激活id,App唯一',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-不可用;1-可用;2-暂时可用(后期可能device_id发生变化导致不可用)',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '设备类型：1-新设备，2-旧设备',
  `personal_pad_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '个人平板类型:1-学习机;2-体验机',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT 'pad型号',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `agent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商链,包含直属代理商',
  `owner` varchar(64) NOT NULL DEFAULT '' COMMENT '专属学生ID,逗号分隔',
  `current_store_id` int(10) NOT NULL DEFAULT '0' COMMENT '当前校区id',
  `current_student_id` int(10) NOT NULL DEFAULT '0' COMMENT '当前使用pad的学生',
  `activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '激活时间',
  `first_use_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次使用时间',
  `last_use_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后使用时间',
  `resell_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许转卖',
  `is_show_lock_screen` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示锁屏设置',
  `is_show_light` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示亮度设置',
  `is_change_native_sys` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否允许切换到原生系统',
  `unlock_password` varchar(64) NOT NULL DEFAULT '' COMMENT '解锁设备恢复到原生系统密码',
  `custom_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '定制机类型：0-不是定制机；1-内部；2-联想',
  `show_app` varchar(50) NOT NULL DEFAULT '' COMMENT '壳子显示应用列表值为app_version中的pid：默认-全部；1-智牛英语；101-飞鲸外教',
  `link_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '扩展device_id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `ua` varchar(512) NOT NULL DEFAULT '' COMMENT 'UA信息',
  `ugs_id` varchar(200) NOT NULL DEFAULT '' COMMENT '光速设备唯一id',
  `auth_by` varchar(32) NOT NULL DEFAULT '' COMMENT '授权者',
  `device_auth_code_id` int(10) NOT NULL DEFAULT '0' COMMENT '设备认证表id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `ugs_id` (`ugs_id`) USING BTREE,
  KEY `device_id` (`device_id`) USING BTREE,
  KEY `device_sn` (`device_sn`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设备信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `pad_depot`;

CREATE TABLE `pad_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-共享设备;2-学习机',
  `model` varchar(32) NOT NULL DEFAULT '' COMMENT '设备型号',
  `alias` varchar(32) NOT NULL DEFAULT '' COMMENT '平板别名',
  `source` varchar(32) NOT NULL DEFAULT '' COMMENT '设备来源',
  `color` varchar(20) NOT NULL DEFAULT '' COMMENT '颜色',
  `custom_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '定制来源：0-非定制机；1-内部刷机；2-联想刷机',
  `sold_num` int(10) NOT NULL DEFAULT '0' COMMENT '已售卖数量',
  `left_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `saleable_num` int(10) NOT NULL DEFAULT '0' COMMENT '可售卖数量',
  `ic_parse_sn` tinyint(4) NOT NULL DEFAULT '0' COMMENT '程序是否能获取到SN 1-是;0-否',
  `cost_price` varchar(30) NOT NULL COMMENT '成本价，单位元',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='平板仓库';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `pad_in`;

CREATE TABLE `pad_in` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `depot_id` int(10) NOT NULL DEFAULT '0' COMMENT 'pad仓库id',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '本次供货数量',
  `supply_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '供货日期',
  `supply_by` varchar(20) NOT NULL DEFAULT '' COMMENT '供货人',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `updater` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='平板入库记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `pad_out`;

CREATE TABLE `pad_out` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `instance_id` varchar(50) NOT NULL DEFAULT '' COMMENT '审批实例(dingtalk)',
  `customer` varchar(80) NOT NULL DEFAULT '' COMMENT '客户别名',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '出货到代理商id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '出货到门店id',
  `agent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商链,包含直属代理商',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-审批中;2-待发货;3-已发货;4-已收货',
  `audit_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审批状态:1-待运营确认;2-审批中;3-已同意;4-已拒绝',
  `pad_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '设备类型:1-共享平板;2-个人平板',
  `depot_id` int(10) NOT NULL DEFAULT '0' COMMENT 'pad仓库id',
  `sn_list` text NOT NULL,
  `pid_list` varchar(2000) NOT NULL DEFAULT '' COMMENT '设备pid,多个用英文逗号分隔',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '出货数量',
  `buy_num` int(10) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `gift_num` int(10) NOT NULL DEFAULT '0' COMMENT '赠送数量',
  `pad_shell_num` smallint(10) NOT NULL DEFAULT '0' COMMENT '学习机保护壳数量',
  `postage_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '邮费方式:1-寄付;2-到付;3-自提',
  `express_company` tinyint(4) NOT NULL DEFAULT '0' COMMENT '快递公司:1-顺丰;2-京东;3-其他',
  `express_number` varchar(30) NOT NULL DEFAULT '' COMMENT '快递单号',
  `addressee` varchar(10) NOT NULL DEFAULT '' COMMENT '收件人',
  `addressee_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '收件人电话',
  `addressee_address` varchar(100) NOT NULL DEFAULT '' COMMENT '收件人地址',
  `receive_account` varchar(64) NOT NULL DEFAULT '' COMMENT '收款账户',
  `remit_account` varchar(64) NOT NULL DEFAULT '' COMMENT '打款账户',
  `remit_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '打款日期',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '打款金额(分)',
  `remit_pids` varchar(500) NOT NULL DEFAULT '' COMMENT '打款凭证pid,多个逗号分隔',
  `invoice_pids` varchar(200) NOT NULL DEFAULT '' COMMENT '发票pid,多个逗号分隔',
  `refuse_reason` varchar(200) NOT NULL DEFAULT '' COMMENT '拒绝原因',
  `attach_remark` varchar(200) NOT NULL DEFAULT '' COMMENT '附加物料说明',
  `inner_remark` varchar(200) NOT NULL DEFAULT '' COMMENT '内部备注',
  `buyer` varchar(8) NOT NULL DEFAULT '' COMMENT '购买者',
  `buyer_id` int(10) NOT NULL DEFAULT '0' COMMENT '购买人ID',
  `shipper` varchar(8) NOT NULL COMMENT '发货人',
  `shipper_id` int(10) NOT NULL DEFAULT '0' COMMENT '发货人ID',
  `shipper_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '发货时间',
  `originator` varchar(8) NOT NULL DEFAULT '' COMMENT '发起人',
  `originator_id` int(10) NOT NULL DEFAULT '0' COMMENT '发起人id',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '运营人员id',
  `supporter` varchar(20) NOT NULL DEFAULT '' COMMENT '运营人员名称',
  `originator_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发起时间',
  `is_notify_factory` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已通知厂家发货:1-是；0-否',
  `msg_id` varchar(64) NOT NULL DEFAULT '' COMMENT '钉钉messageId',
  `cost_price` varchar(30) NOT NULL DEFAULT '' COMMENT '本次单台设备成本价，单位元',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='平板出库记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `ratify_task`;

CREATE TABLE `ratify_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `instance_id` varchar(50) NOT NULL DEFAULT '' COMMENT '审批实例(dingtalk)',
  `type` tinyint(4) NOT NULL COMMENT '类型：1-学员优惠;2-合同退费；3-班组产品',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT '审批顺序：0-start;1-第一个审批人...',
  `ratifier` varchar(20) NOT NULL DEFAULT '' COMMENT '审批人',
  `ratifier_id` int(10) NOT NULL DEFAULT '0' COMMENT '审批人id',
  `dd_staff_id` varchar(32) NOT NULL DEFAULT '' COMMENT '审批人dingtalk userid',
  `ratifier_position` varchar(20) NOT NULL DEFAULT '' COMMENT '审批人工作岗位',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-待审批；2-审批中；3-已同意；4-已驳回',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '驳回原因',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `instance_id` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='钉钉审批流程记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `region_filter`;

CREATE TABLE `region_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-招商电话显示;2-区域过滤;3-区域延时过滤;4-不开放区域',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-已生效;2-已失效',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='加盟区域管控规则';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `region_policy`;

CREATE TABLE `region_policy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `region_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-地级市;2-区;3-县',
  `district_level` varchar(2) NOT NULL DEFAULT '' COMMENT '区县级别',
  `district_area` varchar(15) NOT NULL DEFAULT '' COMMENT '面积km2',
  `district_rank` varchar(4) NOT NULL DEFAULT '' COMMENT '区排名',
  `rank400` varchar(4) NOT NULL DEFAULT '' COMMENT '400强排名',
  `subordinate` varchar(50) NOT NULL DEFAULT '' COMMENT '下辖地区',
  `city_level` varchar(10) NOT NULL DEFAULT '' COMMENT '城市级别',
  `city_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '城市说明',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-待上线;2-已上线',
  `region_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开放：1-不开放;2-视校区数量而定',
  `gdp` varchar(15) NOT NULL DEFAULT '' COMMENT 'gdp',
  `gdp_year` char(4) NOT NULL DEFAULT '' COMMENT 'gdp年份',
  `population` varchar(15) NOT NULL DEFAULT '' COMMENT '人口',
  `population_year` char(4) NOT NULL DEFAULT '' COMMENT '人口年份',
  `join_fee` int(10) NOT NULL DEFAULT '0' COMMENT '加盟费',
  `gift_fee` int(10) NOT NULL DEFAULT '0' COMMENT '赠送费',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='区县价格';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `region_protect`;

CREATE TABLE `region_protect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-多边形；2-圆型',
  `radius` varchar(255) NOT NULL DEFAULT '' COMMENT '半径：米',
  `point` text NOT NULL COMMENT '存储百度地图点坐标集，json',
  `address` varchar(250) NOT NULL DEFAULT '' COMMENT '详细地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `reserve_status` tinyint(4) NOT NULL DEFAULT '0',
  `reason` varchar(50) NOT NULL DEFAULT '',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='保护区域表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `reported_customer`;

CREATE TABLE `reported_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `corp_id` int(10) NOT NULL DEFAULT '0' COMMENT '企业id',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：1-hq;2-转介绍;10-其他',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `mobile_secret` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号加密字段',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='报备客户';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `agent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商链,包含直属代理商',
  `balance_xk` int(10) NOT NULL DEFAULT '0' COMMENT '学科余额',
  `balance_wj` int(10) NOT NULL DEFAULT '0' COMMENT '外教余额',
  `sn` varchar(12) NOT NULL DEFAULT '' COMMENT '校区编号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-旗舰校区;2-标准校区;',
  `join_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '加盟方式:1-加盟机构;2-学习机体验店;3-学校',
  `cooperation_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作方式:1-正式;2-试用;3-课程植入;',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '校区名称',
  `manager` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人',
  `manager_id` int(10) NOT NULL DEFAULT '0' COMMENT '负责人id',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '所在省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '所在市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '所在区县',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '地图定位地址',
  `contact_address` varchar(200) NOT NULL DEFAULT '' COMMENT '联系地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '维度',
  `v_longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '偏移经度',
  `v_latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '偏移维度',
  `radius` int(11) NOT NULL DEFAULT '0' COMMENT '区域保护距离：米',
  `old_radius` int(11) NOT NULL DEFAULT '0' COMMENT '上一次的区域保护距离：米，只在过期的时候存一下',
  `remark` text NOT NULL COMMENT '备注',
  `join_products` varchar(50) NOT NULL DEFAULT '' COMMENT '加盟的产品id',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟时间',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期时间',
  `extend_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '延长期时间',
  `last_follow_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '最近跟进日期',
  `next_follow_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '下次跟进日期',
  `last_follow_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近跟进记录id',
  `occupy_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '占位状态：0-正常，1-占位；2-删除',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '运营人员ID(admin_user_id)',
  `supporter` varchar(20) NOT NULL DEFAULT '' COMMENT '运营人员名称',
  `oper_version` int(10) NOT NULL DEFAULT '1' COMMENT '操作版本',
  `join_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加盟状态：1-加盟中；2-到期延期中；3-到期并延期结束六个月内；4-到期并已停用',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_v1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是v1.0校区',
  `ic_inspect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否适合考察：0、1',
  `store_stage` tinyint(2) NOT NULL DEFAULT '0' COMMENT '门店当前所处阶段:1-选址中;2-营建中;3-试运营;4-正常运营;5-停止运营',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_in_school` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否进校：1-是;0-否',
  `school_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学校类型：1-公里校;2-私立校',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `agent_id` (`agent_id`),
  KEY `agent_chain` (`agent_chain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='校区';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_join`;

CREATE TABLE `store_join` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区id',
  `agent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '父级链',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `product_id` int(10) NOT NULL DEFAULT '0' COMMENT '加盟产品id',
  `expire_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代理是否过期',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟日期',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期',
  `extend_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '延长到期',
  `join_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加盟状态：1-加盟中；2-到期延期中；3-到期并延期结束六个月内；4-到期并已停用',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_product_region` (`store_id`,`product_id`),
  KEY `agent_chain` (`agent_chain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商加盟表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_supporter`;

CREATE TABLE `store_supporter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'admin_user id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-有效；2-无效',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='运营校区分配记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_exchange_goods`;

CREATE TABLE `student_exchange_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '消耗金币角',
  `goods_name` varchar(500) NOT NULL DEFAULT '0' COMMENT '兑换商品名字',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人，表示的是nickname字段，可修改',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生金币兑换表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_product`;

CREATE TABLE `student_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `product_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '科目:20-英语;21-北美外教;22-数学',
  `is_sign_up` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否授权学习',
  `is_experience` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否授权体验',
  `expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '报名到期时间',
  `exp_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '体验到期时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `student_product` (`student_id`,`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生科目表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_transfer`;

CREATE TABLE `student_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生所属代理商id',
  `from_store_id` int(10) NOT NULL DEFAULT '0' COMMENT '原校区id',
  `to_store_id` int(10) NOT NULL DEFAULT '0' COMMENT '新校区id',
  `creator` varchar(50) NOT NULL COMMENT '操作人名称',
  `creator_id` int(10) NOT NULL COMMENT '操作人ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生转校区记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_up_grade`;

CREATE TABLE `student_up_grade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL DEFAULT '0' COMMENT '学生ID',
  `year_system` tinyint(4) NOT NULL DEFAULT '0' COMMENT '制度：1-54制；2-63制；3-64制',
  `old_grade` varchar(10) NOT NULL DEFAULT '' COMMENT '原来的年级',
  `new_grade` varchar(10) NOT NULL DEFAULT '' COMMENT '新的年级',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生升年级表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_user`;

CREATE TABLE `student_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sn` varchar(15) NOT NULL DEFAULT '' COMMENT '学生的编号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `agent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商机构链',
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-体验账号;2-体验学生;3-报名学生',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:1-未体验;2-体验中;3-体验到期;4-在读;5-已到期;',
  `study_stage` tinyint(4) NOT NULL DEFAULT '1' COMMENT '学习阶段:1-开课中;2-已结课',
  `purpose` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用途:1-学习;2-培训',
  `account_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '账号状态:1-启用;2-停用；3-失效',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别:1-男;2-女',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学段:1-小学;2-初中;3-高中',
  `grade` varchar(4) NOT NULL DEFAULT '' COMMENT '年级:三年级',
  `entrance_grade` varchar(4) NOT NULL DEFAULT '' COMMENT '入学年级',
  `school` varchar(50) NOT NULL DEFAULT '' COMMENT '就读学校',
  `school_class` varchar(50) NOT NULL DEFAULT '' COMMENT '就读学校班级',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `wechat` varchar(64) NOT NULL DEFAULT '' COMMENT '微信',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '注册省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '注册市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '注册区',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '注册地址',
  `longitude` varchar(16) NOT NULL COMMENT '经度',
  `latitude` varchar(16) NOT NULL COMMENT '维度',
  `register_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '注册类型:1-学员注册;2-校区创建',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学员来源:1-进校;2-到店咨询;3-线上咨询;4-转介绍;5-其他',
  `introducer` varchar(20) NOT NULL DEFAULT '' COMMENT '介绍人姓名',
  `join_store_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入校区的时间',
  `push_id` varchar(32) NOT NULL DEFAULT '' COMMENT '个推用户push_id',
  `pwd` varchar(40) NOT NULL DEFAULT '' COMMENT '登录密码',
  `pwd_salt` varchar(16) NOT NULL DEFAULT '' COMMENT '密码盐',
  `exp_pwd` varchar(20) NOT NULL DEFAULT '' COMMENT '体验账号明文密码',
  `opened_products` varchar(64) NOT NULL DEFAULT '' COMMENT '已开通的科目',
  `experienced_products` varchar(64) NOT NULL DEFAULT '' COMMENT '已体验的科目',
  `first_buy_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次购课时间',
  `last_buy_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近购课时间',
  `expire_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '到期时间',
  `exp_expire_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '体验到期时间',
  `pad_remote` tinyint(4) NOT NULL DEFAULT '0' COMMENT '个人平板电脑远程学:0,1',
  `pad_sn` varchar(128) NOT NULL DEFAULT '' COMMENT '个人平板sn',
  `pad_auth_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '个人平板电脑授权开始时间',
  `pad_auth_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '个人平板电脑授权结束时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `description` varchar(1000) NOT NULL DEFAULT '' COMMENT '学生情况',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `base_update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '基本信息更新时间',
  `creator` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `flywhale_username` varchar(255) NOT NULL DEFAULT '' COMMENT '飞鲸用户名',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生用户表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `train_video_play`;

CREATE TABLE `train_video_play` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `video_id` int(10) NOT NULL DEFAULT '0' COMMENT '培训视频id',
  `play_id` varchar(64) NOT NULL DEFAULT '' COMMENT '播放唯一标识',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent user id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent id',
  `play_duration` int(10) NOT NULL DEFAULT '0' COMMENT '观看时长(秒)',
  `proportion` smallint(10) NOT NULL DEFAULT '0' COMMENT '时长占比，最多四位数',
  `play_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '观看时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `video_user` (`video_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='培训视频播放记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `train_video_statistics`;

CREATE TABLE `train_video_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(10) NOT NULL DEFAULT '0' COMMENT '培训视频id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent user id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent id',
  `sign` varchar(30) NOT NULL DEFAULT '' COMMENT 'user_id-video_id',
  `play_duration` int(10) NOT NULL DEFAULT '0' COMMENT '观看时长(秒)',
  `play_num` int(10) NOT NULL DEFAULT '0' COMMENT '观看次数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `current_play_at` int(10) NOT NULL DEFAULT '0' COMMENT '当前视频播放位置(秒)',
  `max_play_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最大观看时长(秒)',
  `proportion` smallint(10) NOT NULL DEFAULT '0' COMMENT '时长占比，最多四位数',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='培训视频播放统计';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `wechat_user`;

CREATE TABLE `wechat_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户user表的id',
  `user_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户类型:1-admin user;2-agent user;3-student user',
  `wx_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '微信应用类型:1-公众号;2-小程序',
  `wx_appid` varchar(32) NOT NULL DEFAULT '' COMMENT '访问的微信应用appid',
  `wx_openid` varchar(40) NOT NULL DEFAULT '' COMMENT '微信的openid',
  `wx_unionid` varchar(40) NOT NULL DEFAULT '' COMMENT '微信的unionid',
  `session_id` varchar(40) NOT NULL DEFAULT '' COMMENT '上次登录的session id',
  `last_login_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user_id`,`user_type`,`wx_appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户微信账户信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `workapp_admin`;

CREATE TABLE `workapp_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '成员姓名',
  `alias` varchar(32) NOT NULL DEFAULT '' COMMENT '别名',
  `userid` varchar(32) NOT NULL DEFAULT '' COMMENT '成员UserID',
  `unionid` varchar(64) NOT NULL DEFAULT '' COMMENT '全局唯一',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '手机号码',
  `department_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '成员所属部门id列表,多个用逗号隔开',
  `order` int(32) NOT NULL DEFAULT '0' COMMENT '部门内的排序值',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '座机',
  `work_place` varchar(100) NOT NULL DEFAULT '' COMMENT '办公地点',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是企业的管理员',
  `is_boss` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为企业的老板',
  `is_hide` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否隐藏号码',
  `is_leader` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是部门的主管',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT '表示该用户是否激活了钉钉',
  `position` varchar(64) NOT NULL DEFAULT '' COMMENT '职位信息',
  `email` varchar(40) NOT NULL DEFAULT '' COMMENT '成员邮箱',
  `org_email` varchar(40) NOT NULL DEFAULT '' COMMENT '成员的企业邮箱',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '头像url',
  `jobnumber` varchar(64) NOT NULL DEFAULT '' COMMENT '成员工号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `unionid` (`unionid`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='workapp企业成员信息表';

\n\n\n\n\n\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
		/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
		/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
		/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
		/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
		/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
