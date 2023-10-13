# ************************************************************
# Mysqldoc SQL dump
#
# 主机: 39.105.50.248 (5.6.41-log)
# 数据库: newenglish_develop
# 生成时间: 2023-10-10 16:50:53
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent`;

CREATE TABLE `agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '代理商名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-正常;3-禁用',
  `manager` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别：1-男；2-女',
  `id_number` varchar(32) NOT NULL DEFAULT '' COMMENT '身份证号',
  `channel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源渠道：0-其他;1-内部渠道；2-线上；3-线下；4-转介绍；',
  `product_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '产品类型：1-1v1;2-班组；3-1对1+班组',
  `introducer` varchar(20) NOT NULL DEFAULT '0' COMMENT '转介绍人姓名',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '区域级别：1-总部；2-全国；3-省级；4-市级；5-区县级；6-校级;',
  `subagent_ownership` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否允许发展下级代理：0-不允许；1-允许',
  `subagent_level` varchar(20) NOT NULL DEFAULT '' COMMENT '发展下级代理商的级别：数字同level，数字之间用“,”分隔',
  `auth_limit` int(10) NOT NULL DEFAULT '0' COMMENT '授权额度（分）',
  `total_in_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计授权额度（分）',
  `total_out_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计消耗额度（分）',
  `total_in_join_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计收加盟费（分）',
  `total_out_join_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计交加盟费（分）',
  `total_in_prepay_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计收预付款（分）',
  `total_out_prepay_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计交预付款（分）',
  `auth_password` varchar(40) NOT NULL DEFAULT '' COMMENT '授权密码md5(加密)',
  `auth_salt` varchar(16) NOT NULL DEFAULT '' COMMENT '授权密码盐',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `supagent_id` int(10) NOT NULL DEFAULT '0' COMMENT '上级代理上id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '父级链只是当前结点的父级，父级之间用“-”链接 -1-2-3-',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '校级代理类型：1-单店；2-多店',
  `join_type` varchar(20) NOT NULL DEFAULT '' COMMENT '加盟方式:1-加盟机构;2-学习机体验店;3-学校;逗号分隔',
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作方式：1-正式；2-试用；3-课程植入',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `join_start_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟开始时间',
  `protect_end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '保护期结束时间',
  `join_end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '',
  `is_open` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否正式开通：（目前只用来发短信）',
  `price_category_id` int(10) NOT NULL DEFAULT '0' COMMENT '价格单id',
  `discount` int(10) NOT NULL DEFAULT '100' COMMENT '折扣百分比:56%存56',
  `ic_store_fee` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否能为校区充值、扣减：1-是；0-否',
  `boot_pid` varchar(50) NOT NULL DEFAULT '' COMMENT 'app启动图id',
  `ic_see_fee` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否能查看代理商账户等信息：1-是；0-否',
  `whale_balance` bigint(10) NOT NULL DEFAULT '0' COMMENT '外教：余额（分）',
  `join_whale_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '外教：是否加盟外教 1-是；0-否',
  `only_join_whale` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否只加盟了外教：1-是；0-否',
  `sales_name` varchar(32) NOT NULL DEFAULT '' COMMENT '销售',
  `sign_channel` varchar(200) NOT NULL DEFAULT '' COMMENT '签约渠道',
  `sign_company` tinyint(4) NOT NULL DEFAULT '0' COMMENT '签约公司：1-北京智牛闪学教育科技有限公司；2-光速智学（北京）科技有限公司',
  `sign_info` varchar(800) NOT NULL DEFAULT '' COMMENT '签约信息',
  `agreement` varchar(800) NOT NULL DEFAULT '' COMMENT '补充协议',
  `brand_policy` varchar(800) NOT NULL DEFAULT '' COMMENT '品牌服务费政策',
  `check_requirement` varchar(1000) NOT NULL DEFAULT '' COMMENT '考核标准',
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `manager_id` int(10) NOT NULL DEFAULT '0' COMMENT '负责人id',
  `join_regions` varchar(600) NOT NULL DEFAULT '' COMMENT '加盟的区域列表',
  `join_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加盟状态：1-加盟中；2-到期延期中；3-到期并延期结束六个月内；4-到期并已停用',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_in_school` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否进校：1-是;0-否',
  `school_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学校类型：1-公里校;2-私立校',
  `price_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '价格单类型：1-按课程价格单定价;2-按年定价(内置价格/价格单);3-按学习机定价;',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_discount`;

CREATE TABLE `agent_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：1-代理商;2-门店',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-生效中;2-已失效',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商',
  `discount` int(10) NOT NULL DEFAULT '0' COMMENT '折扣百分比:56%存56',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` datetime NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '失效时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `agent` (`agent_id`,`type`,`status`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商课程折扣记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_finance`;

CREATE TABLE `agent_finance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `other_agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '当发起收款的行为时，此处是agent_id下级代理商的id，当发起交款的行为时，此处是agent_id的上级代理商的id',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '链接id，当type是1，21的时候此处存agent_league表的id，当type=2，22的时候此处存agent_payment表的id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-交加盟费，2-交预付费,21-收加盟费，22-收预付款',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '本次交易金额：分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT ' 表示的是nickname字段，可修改',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销商收支记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_join`;

CREATE TABLE `agent_join` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟日期',
  `end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期',
  `duration` varchar(50) NOT NULL DEFAULT '' COMMENT '加盟期限：文本',
  `join_fee` int(10) NOT NULL DEFAULT '0' COMMENT '加盟费用（分）',
  `auth_limit` int(10) NOT NULL DEFAULT '0' COMMENT '授权额度（分）',
  `prepay_fee` int(10) NOT NULL DEFAULT '0' COMMENT '下级预付款（分）',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '交款代理商id',
  `supagent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '父级链只是当前结点的父级，父级之间用“-”链接 -1-2-3-',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT ' 表示的是nickname字段，可修改',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加盟记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_limit_bill`;

CREATE TABLE `agent_limit_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `other_agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '上级代理商或者下级代理商的id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '分校ID',
  `sub_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '子类型：1-代理商；2-分校',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-给下级授权额度扣减；2-给下级加盟扣减；3-直营校发行课程卡扣减；4-直接扣减下级代理商额度；5-直接被上级代理商扣减额度；6-后台激活课程卡扣减；7-升级1v1扣减；21-上级增加授权额度；22-给下级赠送额度扣减；23-上级赠送额度；24-取消激活课程卡退还',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '额度：如果type是1，2，3则次字段是减，如果是type是21则次字段是增',
  `surplus` int(10) NOT NULL DEFAULT '0' COMMENT '剩余额度',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '链接id，当type是1,21,9的时候此处存agent_prepay的id；是2,8的时候此处存agent_join的id；3,6,24的时候此处存的是card_publish表的id；7的时候是card_word表id;4,5,22,23为0',
  `reason` int(10) NOT NULL DEFAULT '0' COMMENT '原因：1-违规运营；2-其他；3-业务奖励（字段废弃）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '对应nickname字段',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户额度流水表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_prepay`;

CREATE TABLE `agent_prepay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '交款代理商id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '父级链只是当前结点的父级，父级之间用“-”链接 -1-2-3-',
  `supagent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `prepay_fee` int(10) NOT NULL DEFAULT '0' COMMENT '代理预付款',
  `auth_limit` int(10) NOT NULL DEFAULT '0' COMMENT '授权额度（分）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预付款记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_price`;

CREATE TABLE `agent_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：1-代理商;2-门店',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-生效中;2-已失效',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商或门店',
  `price_category_id` int(10) NOT NULL DEFAULT '0' COMMENT '价格单',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` datetime NOT NULL DEFAULT '9999-12-31 00:00:00' COMMENT '失效时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `agent` (`agent_id`,`type`,`status`) USING BTREE,
  KEY `price_category_id` (`price_category_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='代理商课程价格记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_region`;

CREATE TABLE `agent_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supagent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '父级链',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `is_exclusion` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是独家：1-是；0-不是',
  `is_expire` tinyint(4) NOT NULL DEFAULT '0' COMMENT '地区是否过期：1-是；0-否',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '代理区域的省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '代理区域的市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '代理区域的县',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商代理范围';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_remark`;

CREATE TABLE `agent_remark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '代理商ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联表的id，1-agent表;2-agent_join表；3-agent_prepay表；4-agent_limit_bill表；5-agent_limit_bill表；6-agent表；7-agent表',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '类型:1-创建代理商；2-加盟续费；3-添加预付款；4-赠送额度；5-扣减额度；6-禁用；7-启用',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `reason` tinyint(4) NOT NULL DEFAULT '0' COMMENT '原因：1-其他；2-违规运营；3-业务奖励；4-恢复运营；5-主动退出；6-代理商加盟时间过期',
  `operated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人（对应nickname字段）',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商备注表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_role`;

CREATE TABLE `agent_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `description` varchar(300) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类：1-代理商角色；2-门店（分校）角色',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-内置角色，0-非内置',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账号状态：0-正常；1-已下线（代理商不可分配此角色，不影响已有的，变相删除）',
  `actions` text NOT NULL COMMENT '角色权限,uri集合,多个uri用,分隔',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商角色表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_upgrade_log`;

CREATE TABLE `agent_upgrade_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '升级信息类型：1-代理商；2-门店',
  `version_no` varchar(25) NOT NULL DEFAULT '' COMMENT '版本号：eg：v1.2.1',
  `publish_time` varchar(50) NOT NULL DEFAULT '' COMMENT '发布时间：预期9月20日',
  `publish_info` text NOT NULL COMMENT '发布内容',
  `link` varchar(100) NOT NULL DEFAULT '' COMMENT '详情链接',
  `is_publish` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否发布：0-不发布，1-发布',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '主标题',
  `note` text NOT NULL COMMENT '重要提示',
  `is_force_remind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否强制提醒：0-不强制，1-强制',
  `remind_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '提醒时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商升级信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_user`;

CREATE TABLE `agent_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '登录用户名',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-正常;1-密码锁定;2-删除;3-禁用',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别：1-男；2-女',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '出生日期',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(16) NOT NULL DEFAULT '' COMMENT '密码盐',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '只有代理商负责人有值',
  `privilege` tinyint(2) NOT NULL DEFAULT '0' COMMENT '特权：0-普通；1-上线验证期间可使用；2-系统维护中可以使用',
  `is_changed_password` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否重置过密码：0-没有；1-重置过',
  `support_store_ids` text NOT NULL COMMENT ' 运营负责的校区IDs,逗号分隔',
  `last_login_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `sessionid` varchar(40) NOT NULL DEFAULT '' COMMENT '上次登录的session id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `dimission_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '离职日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_user_role`;

CREATE TABLE `agent_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT 'agent_user的id',
  `agent_id` int(10) NOT NULL COMMENT '隶属代理商id',
  `store_id` int(10) NOT NULL COMMENT '隶属门店id',
  `role_ids` text NOT NULL COMMENT '角色id,多个id用,号分隔',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账号类型（冗余字段）：1-负责人；2-员工;3-教师',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`user_id`,`agent_id`,`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员角色对应关系表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_active`;

CREATE TABLE `app_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '产品id号',
  `platform` varchar(16) NOT NULL DEFAULT '' COMMENT '平台:ios,android',
  `cid` varchar(64) NOT NULL DEFAULT '' COMMENT '激活id,App唯一',
  `version_no` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  `device_id` varchar(64) NOT NULL DEFAULT '' COMMENT '设备id,设备唯一',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装渠道号',
  `ua` varchar(512) NOT NULL DEFAULT '' COMMENT 'UA信息',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '激活ip地址',
  `push_id` varchar(100) NOT NULL DEFAULT '' COMMENT '消息推送id',
  `ugs_id` varchar(100) NOT NULL DEFAULT '' COMMENT '光速设备唯一id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='App 激活信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_feedback`;

CREATE TABLE `app_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '产品id号',
  `cid` varchar(64) NOT NULL DEFAULT '' COMMENT '激活id,App唯一',
  `version_no` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  `device_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备id,设备唯一',
  `device_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '设备sn',
  `ua` varchar(512) NOT NULL DEFAULT '' COMMENT 'UA信息',
  `ugs_id` varchar(100) NOT NULL DEFAULT '' COMMENT '光速设备唯一id',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `feedback` text NOT NULL COMMENT '定位问题需要的数据',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-h5；2-客户端',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='App反馈记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_log`;

CREATE TABLE `app_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '产品id号',
  `platform` varchar(16) NOT NULL DEFAULT '' COMMENT '平台:ios,android',
  `cid` varchar(64) NOT NULL DEFAULT '' COMMENT '激活id,App唯一',
  `version_no` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '版本号',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL COMMENT 'crash记录',
  `log_path` text NOT NULL COMMENT 'log存储路径',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='App日志记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_patch_version`;

CREATE TABLE `app_patch_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_version_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'app版本id',
  `description` text NOT NULL COMMENT '升级信息,用|||表示换行符',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号',
  `status` tinyint(10) NOT NULL DEFAULT '0' COMMENT '状态：0-未发布，1-已发布',
  `publish_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='热更新补丁版本表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_publish`;

CREATE TABLE `app_publish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '产品id号',
  `platform` varchar(16) NOT NULL DEFAULT '' COMMENT '平台:ios,android',
  `package_url` varchar(255) NOT NULL DEFAULT '' COMMENT '软件下载地址',
  `page_url` varchar(255) NOT NULL DEFAULT '' COMMENT '下载页面地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`pid`,`platform`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='App发布信息';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_suggest`;

CREATE TABLE `app_suggest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '登陆用户id',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '反馈用户手机号',
  `content` varchar(500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '反馈内容',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '反馈类型',
  `image_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '反馈图片pid，多张用英文逗号分隔',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '产品id号',
  `phone_model` varchar(28) NOT NULL DEFAULT '' COMMENT '手机型号',
  `os_version` varchar(16) NOT NULL DEFAULT '' COMMENT '操作系统版本',
  `network` varchar(10) NOT NULL DEFAULT '' COMMENT '网络类型',
  `platform` varchar(16) NOT NULL DEFAULT '' COMMENT '平台:ios,android',
  `cid` varchar(64) NOT NULL DEFAULT '' COMMENT 'App 激活id',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT 'App 版本号',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '反馈者ip',
  `sign` varchar(32) NOT NULL DEFAULT '' COMMENT '数据签名,防止重复提交',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`) USING BTREE,
  KEY `app` (`pid`,`platform`,`version_no`) USING BTREE,
  KEY `sign` (`sign`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='App 意见反馈表';

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `application_id` varchar(100) NOT NULL DEFAULT '' COMMENT '应用id',
  `forbid_agent_id` varchar(2000) NOT NULL DEFAULT '' COMMENT '禁止升级的agent_id',
  `allow_ugs_id` varchar(2000) NOT NULL DEFAULT '' COMMENT 'ugs_id允许升级白名单',
  PRIMARY KEY (`id`),
  KEY `version` (`pid`,`platform`,`no`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='App 版本信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `origin_content` text NOT NULL COMMENT '原始文章内容',
  `content` text NOT NULL COMMENT '格式化的文章',
  `do_content` text NOT NULL COMMENT '规整后的content，单词用 #分割，段落用 @@分割',
  `question` text NOT NULL COMMENT '题目：[{"question":"题干" ,"no":"题号","options":[{"option":"A","content":"选项内容"}], "answer":"正确答案","analyses":"解析"}]',
  `correct_info` text NOT NULL COMMENT '纠错反馈信息',
  `status` tinyint(11) NOT NULL DEFAULT '0' COMMENT '状态:0-未审核;1-审核通过;2-不通过;3-已发布;5-通过但无精读句型;7-反馈错误;9-重复;',
  `audit_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态:1-待分配;2-待审核;3待二审;4-一审弃用;5-二审通过;6-二审弃用;7一审发布',
  `difficulty` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '修改的文章难度\r\nDale–Chall readability formula\r\n    https://en.wikipedia.org/wiki/Dale%E2%80%93Chall_readability_formula\r\n    修改 alpha=15.79，beta=0.0496\r\n    score=alpha * \\sigma word_level_difficult /total_words + beata * words / sentences\r\n    后一半去掉小于2的句子',
  `word_count` int(255) NOT NULL DEFAULT '0' COMMENT '文章长度，单词数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  `expect_duration` int(10) NOT NULL DEFAULT '0' COMMENT '文章限时，秒',
  `new_word_ids` text NOT NULL COMMENT '生词，对应word表中的id, 多个用逗号分隔',
  `title` varchar(300) NOT NULL DEFAULT '' COMMENT '文章标题',
  `category` varchar(50) NOT NULL DEFAULT '' COMMENT '体裁',
  `abstract` varchar(300) NOT NULL DEFAULT '' COMMENT '摘要',
  `words_info` text NOT NULL COMMENT 'do_content里面单词（存在于word表中）信息[{"文中的形态":["搜索词","原型", "原型id", "原型级别","原型通用词意"]},...]',
  `phrases_info` text NOT NULL COMMENT '词组信息eq[{"phrase":"pick up", "type":"类型:0-不确定;1-人名；2-地名；3-需要学习的国家地名 4-其它等"}..，9-学习短语.","mean":"通用词意"]',
  `sentences_info` text NOT NULL COMMENT '句子题型信息["type":["出题方式:1-翻译题,"2-造句题"],"en":"英文句子","tip":"出题说明"]',
  `sign` varchar(32) NOT NULL DEFAULT '' COMMENT '文章的md5值',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '文章等级',
  `level_info` text NOT NULL COMMENT '计算level的辅助值',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题目类型：1-阅读理解；2-完型填空；3-七选五',
  `remark` text NOT NULL COMMENT '分级数据\r\n页面直接显示\r\n\\n换行',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '源数据标识',
  `reference` varchar(255) NOT NULL DEFAULT '' COMMENT '文章出处，如：2004年北京高考试题',
  `score` float(10,2) NOT NULL COMMENT '人工评分',
  `word_count_cut` int(10) NOT NULL,
  `sentence_count_cut` int(10) NOT NULL,
  `syllable_count` int(10) NOT NULL,
  `avg_word_difficulty` float(10,4) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `source_grade` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源年级',
  `read_score` int(10) NOT NULL DEFAULT '0' COMMENT '首次平均正确率(一天跑一次)',
  `read_student_num` int(10) NOT NULL DEFAULT '0' COMMENT '完成的阅读人数(一天跑一次)',
  `has_elaborate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有精讲:0、1',
  `has_analysis` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有解析:0、1',
  `simhash` varchar(16) DEFAULT NULL,
  `check_status` tinyint(4) NOT NULL,
  `quality` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核质量：1-弃用；2-可用；3-精选；4-特选',
  `auditor_id` int(10) NOT NULL DEFAULT '0' COMMENT '审核人ID',
  `audit_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `topic` varchar(50) NOT NULL DEFAULT '' COMMENT '话题范围',
  `hss_level` varchar(50) NOT NULL DEFAULT '' COMMENT '红杉树等级',
  `hss_stage` varchar(50) NOT NULL DEFAULT '' COMMENT '红杉树学段',
  `audit_duration` int(10) NOT NULL DEFAULT '0' COMMENT '审核时长：单位秒',
  `reject_remark` varchar(50) NOT NULL DEFAULT '' COMMENT '话题范围',
  `reject_reason` tinyint(4) NOT NULL DEFAULT '0' COMMENT '拒绝原因：1-文章过时;2-文章错误太多;3-要求加划线或题干要求中出现第几行等字眼;4-出题不好',
  `difficulty_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '难度:1-容易;2-较易;3-一般;4-较;5-难;6-困难',
  `term` varchar(10) NOT NULL DEFAULT '' COMMENT '学期',
  `theme` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题材',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`) USING BTREE,
  UNIQUE KEY `source` (`source`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='阅读理解题';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_answer`;

CREATE TABLE `article_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `student_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章id',
  `article_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生阅读课程表id',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '耗时：秒',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总题数',
  `correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '答对题数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '获得分数',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `question` text NOT NULL COMMENT '题目：[{"no":"题号","options":"B,C,D,A","answer":"学生答案","is_right":"0-错误；1-正确"}]',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `st_time` (`start_at`,`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='阅读理解答案表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_audit`;

CREATE TABLE `article_audit` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) NOT NULL DEFAULT '0' COMMENT '文章id',
  `abstract` varchar(300) NOT NULL DEFAULT '' COMMENT '摘要',
  `title` varchar(300) NOT NULL DEFAULT '' COMMENT '标题',
  `primary_auditor_id` int(10) NOT NULL DEFAULT '0' COMMENT '一审老师id',
  `primary_auditor_name` varchar(100) NOT NULL DEFAULT '' COMMENT '一审老师姓名',
  `secondary_auditor_id` int(10) NOT NULL DEFAULT '0' COMMENT '二审老师id',
  `secondary_auditor_name` varchar(100) NOT NULL DEFAULT '' COMMENT '二审老师姓名',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-待发布;2一已发布',
  `audit_status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核状态:2-待一审;3待二审;4-一审弃用;5-二审通过;6-二审弃用;7一审发布',
  `question_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题目类型:1-阅读理解:2-完型填空:3-七选五',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '文章等级',
  `term` varchar(10) NOT NULL DEFAULT '' COMMENT '学期',
  `category` varchar(10) NOT NULL DEFAULT '0' COMMENT '体裁',
  `difficulty_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '难度:1-容易;2-较易;3-一般;4-较;5-难;6-困难',
  `quality` tinyint(4) NOT NULL DEFAULT '0' COMMENT '质量:',
  `theme` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题材',
  `topic` varchar(50) NOT NULL DEFAULT '' COMMENT '话题范围',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '源数据标识',
  `grade` varchar(10) NOT NULL DEFAULT '' COMMENT '来源年级',
  `source_grade` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源年级',
  `word_count` int(10) NOT NULL DEFAULT '0' COMMENT '单词数',
  `refuse_reason` tinyint(4) NOT NULL DEFAULT '0' COMMENT '拒绝原因:1-文章过时;2-文章错误太多;3-要求加划线或题干要求中出现第几行等字眼;4-出题不好',
  `refuse_remark` varchar(50) NOT NULL DEFAULT '' COMMENT '拒绝备注',
  `primary_duration` int(10) NOT NULL DEFAULT '0' COMMENT '一审时长',
  `secondary_duration` int(10) NOT NULL DEFAULT '0' COMMENT '二审时长',
  `primary_audit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '一审时间',
  `secondary_audit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '二审时间',
  `primary_score` int(10) NOT NULL DEFAULT '0' COMMENT '一审质量评分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `primary_updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '一审更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `primary_auditor_article` (`primary_auditor_id`,`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章审核记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_audit_detail`;

CREATE TABLE `article_audit_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `article_audit_id` int(10) NOT NULL DEFAULT '0' COMMENT '文章审核id',
  `article_id` int(10) NOT NULL DEFAULT '0' COMMENT '文章id',
  `primary_auditor_id` int(10) NOT NULL DEFAULT '0' COMMENT '一审老师id',
  `term` varchar(10) NOT NULL DEFAULT '' COMMENT '学期',
  `category` varchar(20) NOT NULL DEFAULT '' COMMENT '体裁',
  `difficulty_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '难度:1-容易;2-较易;3-一般;4-较;5-难;6-困难',
  `quality` tinyint(4) NOT NULL DEFAULT '0' COMMENT '质量:',
  `theme` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题材',
  `topic` varchar(50) NOT NULL DEFAULT '' COMMENT '话题范围',
  `title` varchar(300) NOT NULL DEFAULT '' COMMENT '标题',
  `abstract` varchar(300) NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text NOT NULL COMMENT '审核前的do_content',
  `question` text NOT NULL COMMENT '审核前的question',
  `primary_term` varchar(10) NOT NULL DEFAULT '' COMMENT '一审后学期',
  `primary_category` varchar(20) NOT NULL DEFAULT '' COMMENT '一审后体裁',
  `primary_difficulty` tinyint(4) NOT NULL DEFAULT '0' COMMENT '一审后难度:1-容易;2-较易;3-一般;4-较;5-难;6-困难',
  `primary_quality` tinyint(4) NOT NULL DEFAULT '0' COMMENT '一审后质量:',
  `primary_theme` tinyint(4) NOT NULL DEFAULT '0' COMMENT '一审后题材',
  `primary_topic` varchar(50) NOT NULL DEFAULT '' COMMENT '一审后话题范围',
  `primary_title` varchar(300) NOT NULL DEFAULT '' COMMENT '一审后标题',
  `primary_abstract` varchar(300) NOT NULL DEFAULT '' COMMENT '一审后摘要',
  `primary_content` text NOT NULL COMMENT '一审后的do_content',
  `primary_question` text NOT NULL COMMENT '一审后的question',
  `secondary_term` varchar(10) NOT NULL DEFAULT '' COMMENT '二审后学期',
  `secondary_category` varchar(20) NOT NULL DEFAULT '' COMMENT '二审后体裁',
  `secondary_difficulty` tinyint(4) NOT NULL DEFAULT '0' COMMENT '二审后难度:1-容易;2-较易;3-一般;4-较;5-难;6-困难',
  `secondary_quality` tinyint(4) NOT NULL DEFAULT '0' COMMENT '二审后质量:',
  `secondary_theme` tinyint(4) NOT NULL DEFAULT '0' COMMENT '二审后题材',
  `secondary_topic` varchar(50) NOT NULL DEFAULT '' COMMENT '二审后话题范围',
  `secondary_title` varchar(300) NOT NULL DEFAULT '' COMMENT '二审后标题',
  `secondary_abstract` varchar(300) NOT NULL DEFAULT '' COMMENT '二审后摘要',
  `secondary_content` text NOT NULL COMMENT '二审后的do_content',
  `secondary_question` text NOT NULL COMMENT '二审后的question',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `article_audit_id` (`article_audit_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章审核详情';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_course`;

CREATE TABLE `article_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总篇数',
  `consume_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章消耗数量',
  `study_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学篇数',
  `study_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学单词数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未激活；2-已激活；3-已过期；4-未激活已过期；5-取消激活',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '阅读时长：秒',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_lead_wordset表id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课本类型：1-真题精读',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '年级：1-小学，2-初中，3-高中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `operated_by` varchar(32) NOT NULL DEFAULT '',
  `prolong_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '延期到期时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生文章课程表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_extend`;

CREATE TABLE `article_extend` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `article_id` int(20) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `material` varchar(255) NOT NULL DEFAULT '' COMMENT '教材版本',
  `detail` text NOT NULL COMMENT '单词占比json',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(16) NOT NULL DEFAULT '' COMMENT '添加者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`material`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章扩展表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_level_log`;

CREATE TABLE `article_level_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `pre_level` int(10) NOT NULL DEFAULT '0' COMMENT '原文章等级',
  `after_level` int(10) NOT NULL DEFAULT '0' COMMENT '调整后文章等级',
  `read_num` int(10) NOT NULL DEFAULT '0' COMMENT '调整依赖的阅读次数',
  `accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '正确率',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-升;2-降',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章级别调整记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_price`;

CREATE TABLE `article_price` (
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '文章数量',
  `valid_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '生效时间',
  `invalid_at` date NOT NULL DEFAULT '9999-12-31' COMMENT '失效时间',
  `fee` int(10) NOT NULL DEFAULT '-1' COMMENT '价格（分）',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学段：1-小学，2-初中，3-高中',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `operate_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人，真实姓名',
  KEY `agent_num` (`agent_id`,`num`,`valid_at`) USING BTREE,
  KEY `agent_valid` (`agent_id`,`valid_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商文章定价详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_set`;

CREATE TABLE `article_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '课程名称',
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '篇数',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '类型：1-体验；2-正式',
  `category_no` int(10) NOT NULL DEFAULT '0' COMMENT '0-零基础；1-小学；2-初中；3-高中；4-大学；5-体验；6-其他',
  `introduction` text NOT NULL COMMENT '课程介绍：富文本',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `available_store` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-全部校区;2-指定校区;3-仅锐思可见;4-锐思不可见',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态；1-正常；2-删除；',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='阅读课程表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_source`;

CREATE TABLE `article_source` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `article_id` int(10) NOT NULL DEFAULT '0' COMMENT '文章id',
  `question_type` varchar(10) NOT NULL DEFAULT '' COMMENT '题型：1-单选题；2-句型转换；',
  `difficult` varchar(10) NOT NULL DEFAULT '' COMMENT '难度：1-容易；2-较易；',
  `year` varchar(10) NOT NULL DEFAULT '' COMMENT '年份：如2021',
  `grade` varchar(10) NOT NULL DEFAULT '' COMMENT '年级:如高一',
  `exam_type` varchar(50) NOT NULL DEFAULT '' COMMENT '考试类型：高考真题',
  `question_source` varchar(120) NOT NULL DEFAULT '' COMMENT '题目来源：人教新目标英语七年级上册Unit 8单元测试卷...',
  `province` varchar(30) NOT NULL DEFAULT '' COMMENT '省份',
  `knowledge` varchar(100) NOT NULL DEFAULT '' COMMENT '知识点',
  `source` varchar(100) NOT NULL DEFAULT '' COMMENT '出处代号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章扩展字段表（均为来源数据的字段）';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_subject`;

CREATE TABLE `article_subject` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chinese` varchar(100) NOT NULL DEFAULT '' COMMENT '中文',
  `english` varchar(200) NOT NULL DEFAULT '' COMMENT '英文',
  `tip` varchar(200) NOT NULL DEFAULT '' COMMENT '提示',
  `no` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='阅读文章题材表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `bi_article`;

CREATE TABLE `bi_article` (
  `pk_id` int(10) NOT NULL DEFAULT '0' COMMENT '题型',
  `pk` varchar(80) NOT NULL DEFAULT '' COMMENT 'md5(pk_id@period@start_date)',
  `period` tinyint(2) NOT NULL DEFAULT '1' COMMENT '周期：1-日;2-周;3-月;4-季度;5-半年;6-年',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '周期开始日期',
  `a1_pass_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审通过数量',
  `a1_abandon_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审丢弃数量',
  `a2_pass_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章二审通过数量',
  `a2_abandon_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章二审丢弃数量',
  `a1_score` float NOT NULL DEFAULT '0' COMMENT '一审质量评分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `pk` (`pk`) USING BTREE,
  KEY `pk_sign` (`pk_id`,`period`,`start_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章题型审核统计statistics';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `bi_auditor`;

CREATE TABLE `bi_auditor` (
  `pk_id` int(10) NOT NULL DEFAULT '0' COMMENT '审核人id',
  `pk` varchar(80) NOT NULL DEFAULT '' COMMENT 'md5(pk_id@period@start_date)',
  `period` tinyint(2) NOT NULL DEFAULT '1' COMMENT '周期：1-日;2-周;3-月;4-季度;5-半年;6-年',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '周期开始日期',
  `a1_pass_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审通过数量',
  `a1_abandon_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审丢弃数量',
  `a1a2_pass_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审后被二审通过的数量',
  `a1a2_abandon_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审后被二审丢弃的数量',
  `a1a2_waiting_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审后等待二审的数量',
  `a1_duration` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审总时长',
  `a1_average_duration` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审平均时长',
  `a1a2_duration` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审后被二审的总时长',
  `a1a2_average_duration` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审后被二审的平均时长',
  `a1_score` int(10) NOT NULL DEFAULT '0' COMMENT '一审质量评分',
  `a1_level` int(11) NOT NULL DEFAULT '0' COMMENT '文章一审平均阅读级别',
  `a1_allot_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审已分配数量',
  `a1_audit_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审已审核数量',
  `a1_waiting_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审待审核数量',
  `a1_yesterday_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审昨日审核数量(总计维度上)',
  `a1_week_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章一审本周审核数量(总计维度上)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  UNIQUE KEY `pk` (`pk`) USING BTREE,
  KEY `pk_sign` (`pk_id`,`period`,`start_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审核人员统计statistics';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `bi_store`;

CREATE TABLE `bi_store` (
  `pk_id` int(10) NOT NULL DEFAULT '0' COMMENT '分校id',
  `pk` varchar(80) NOT NULL DEFAULT '' COMMENT 'md5(pk_id@period@start_date)',
  `period` tinyint(2) NOT NULL DEFAULT '1' COMMENT '周期：1-日;2-周;3-月;10-总计',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '周期开始日期',
  `experienced_num` int(10) NOT NULL DEFAULT '0' COMMENT '体验学生数',
  `buy_num` int(10) NOT NULL DEFAULT '0' COMMENT '购买正式课程学生数',
  `course_consume_fee` int(10) NOT NULL DEFAULT '0' COMMENT '课程消耗费用',
  `course_refund_fee` int(10) NOT NULL DEFAULT '0' COMMENT '课程退费',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `follow_num` int(10) NOT NULL DEFAULT '0' COMMENT '跟进次数',
  `multi_buy_num` int(10) NOT NULL DEFAULT '0' COMMENT '非首次购课学生数',
  `sign_up_num` int(10) NOT NULL DEFAULT '0' COMMENT '新报名学生人数',
  `wrt_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词记忆异常数量',
  `whm_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词闯关异常数量',
  `wr_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词复习异常数量',
  `wt_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查异常数量',
  `ssh_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '短语闯关异常数量',
  `lsh_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '句型闯关异常数量',
  `sr_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '句子复习异常数量',
  `grt_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法学习异常数量',
  `gh_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法闯关异常数量',
  `gr_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法复习异常数量',
  `total_unusual_num` int(10) NOT NULL DEFAULT '0' COMMENT '总异常数量',
  `wr_score` int(10) NOT NULL DEFAULT '0' COMMENT '单词复习正确率',
  `sr_score` int(10) NOT NULL DEFAULT '0' COMMENT '句型复习正确率',
  `gr_score` int(10) NOT NULL DEFAULT '0' COMMENT '语法复习正确率',
  `whm_score` int(10) NOT NULL DEFAULT '0' COMMENT '词义闯关正确率',
  `whd_score` int(10) NOT NULL DEFAULT '0' COMMENT '听写闯关正确率',
  `whs_score` int(10) NOT NULL DEFAULT '0' COMMENT '默写闯关正确率',
  `who_score` int(10) NOT NULL DEFAULT '0' COMMENT '口语闯关正确率',
  `wt_score` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查正确率',
  `ssh_score` int(10) NOT NULL DEFAULT '0' COMMENT '短语闯关正确率',
  `lsh_score` int(10) NOT NULL DEFAULT '0' COMMENT '句型闯关正确率',
  `gh_score` int(10) NOT NULL DEFAULT '0' COMMENT '语法闯关正确率',
  `aq_score` int(10) NOT NULL DEFAULT '0' COMMENT '首次阅读正确率',
  `wsrt_duration` int(10) NOT NULL DEFAULT '0' COMMENT '词句识记时长',
  `review_duration` int(10) NOT NULL DEFAULT '0' COMMENT '复习时长',
  `wrt_student` int(10) NOT NULL DEFAULT '0' COMMENT '单词识记学生数',
  `wr_student` int(10) NOT NULL DEFAULT '0' COMMENT '单词复习学生数',
  `srt_student` int(10) NOT NULL DEFAULT '0' COMMENT '短语句型识记学生数',
  `grt_student` int(10) NOT NULL DEFAULT '0' COMMENT '语法识记学生数',
  `a_student` int(10) NOT NULL DEFAULT '0' COMMENT '阅读学生数',
  `grt_score` int(10) NOT NULL DEFAULT '0' COMMENT '语法学习正确率',
  `whm_first_score` int(10) NOT NULL DEFAULT '0' COMMENT '首次词义闯关正确率',
  `wt_first_score` int(10) NOT NULL DEFAULT '0' COMMENT '首次单词检查正确率',
  `gp_score` int(10) NOT NULL DEFAULT '0' COMMENT '语法练习正确率',
  `finish_student_num` int(10) NOT NULL DEFAULT '0' COMMENT '结课学生人数',
  `review_punch_rate` int(10) NOT NULL DEFAULT '0' COMMENT '复习打卡率',
  `read_student_num` int(10) NOT NULL DEFAULT '0' COMMENT '在读学生人数',
  `review_punch_student_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习打卡学生人数',
  UNIQUE KEY `pk` (`pk`) USING BTREE,
  KEY `pk_sign` (`pk_id`,`period`,`start_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店统计statistics';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `bi_student`;

CREATE TABLE `bi_student` (
  `pk` varchar(64) NOT NULL DEFAULT '' COMMENT '同一维度的唯一标识',
  `pk_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `period` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周期：1-日;2-周;3-月;11-最近3天;12-最近7天',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `study_growth` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `review_punch_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '复习打卡状态：0-未打卡;1-手动打卡;2-自动打卡;3-补打卡',
  `w_unreview_num` int(10) NOT NULL DEFAULT '0' COMMENT '周期结束时未复习单词数',
  `s_unreview_num` int(10) NOT NULL DEFAULT '0' COMMENT '周期结束时未复习句子数',
  `g_unreview_num` int(10) NOT NULL DEFAULT '0' COMMENT '周期结束时未复习语法数',
  `w_learned_num` int(10) NOT NULL DEFAULT '0' COMMENT '截止到今日已学,周期过完,由st中刷过去',
  `w_familiar_num` int(10) NOT NULL DEFAULT '0' COMMENT '截止到今日熟词,周期过完,由st中刷过去',
  `wrt_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词记忆总数,去重',
  `wrt_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词记忆错误数,去重',
  `wrt_strange_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词记忆生词数,去重',
  `wrt_familiar_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词记忆熟词数,去重',
  `wrt_rawish_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词记忆夹生词数,去重',
  `wrt_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '单词记忆时长（秒）',
  `wt_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '单词检查时长（秒）',
  `whm_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '词义闯关单词总数,去重',
  `whm_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '词义闯关时长',
  `whm_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '词义闯关答错数,去重',
  `whm_score` int(10) NOT NULL DEFAULT '0' COMMENT '词义闯关平均分',
  `whd_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写闯关单词总数,去重',
  `whd_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写闯关答错数,去重',
  `whd_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '听写闯关时长',
  `whd_score` int(10) NOT NULL DEFAULT '0' COMMENT '听写闯关平均分',
  `whs_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写闯关总数,去重',
  `whs_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写闯关答错数,去重',
  `whs_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '默写闯关时长',
  `whs_score` int(10) NOT NULL DEFAULT '0' COMMENT '默写闯关平均分',
  `who_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '口语闯关总数,去重',
  `who_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '口语闯关时长',
  `who_score` int(10) NOT NULL DEFAULT '0' COMMENT '口语闯关平均分',
  `wr_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习单词总数',
  `wr_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习单词正确总数',
  `wr_unique_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习单词总数(目前等于total,不去重)',
  `wr_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '单词复习时长（秒）',
  `wr_score` int(10) NOT NULL DEFAULT '0' COMMENT '单词复习平均分',
  `wp_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '练习作答的所有单词',
  `wp_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '练习作答对的单词数',
  `wp_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '练习时长',
  `s_learned_num` int(10) NOT NULL DEFAULT '0' COMMENT '截止到今日已学句',
  `s_familiar_num` int(10) NOT NULL DEFAULT '0' COMMENT '截止到今日已熟句',
  `ssrt_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '短句记忆总数,去重',
  `ssrt_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '短句记忆错误总数,去重',
  `ssrt_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '短句记忆时长（秒）',
  `lsrt_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '长句记忆总数,去重',
  `lsrt_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '长句记忆错误总数,去重',
  `lsrt_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '长句记忆时长（秒）',
  `ssh_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '短句闯关句子数,去重',
  `ssh_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '短句闯关错误句子数,去重',
  `ssh_score` int(10) NOT NULL DEFAULT '0' COMMENT '短句闯关平均分',
  `ssh_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '短句闯关时长（秒）',
  `lsh_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '长句闯关句子数,去重',
  `lsh_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '长句闯关错误句子数,去重',
  `lsh_score` int(10) NOT NULL DEFAULT '0' COMMENT '长句闯关平均分',
  `lsh_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '长句闯关时长（秒）',
  `sr_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习句总数',
  `sr_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习句正确总数',
  `sr_unique_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习句总数（目前等于total,不去重）',
  `sr_score` int(10) NOT NULL DEFAULT '0' COMMENT '复习句平均分',
  `sr_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '句复习时长（秒）',
  `a_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '文章阅读时长（秒）',
  `a_read_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读文章数',
  `a_new_read_num` int(10) NOT NULL DEFAULT '0' COMMENT '新阅读文章数',
  `aq_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章做题总数',
  `aq_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章做题错误数',
  `aq_score` int(10) NOT NULL DEFAULT '0' COMMENT '文章题目平均分',
  `grt_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '语法记忆时长（秒）',
  `grt_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法学习单元数',
  `gr_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '语法复习时长（秒）',
  `gr_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法复习总个数',
  `gr_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法复习正确数',
  `gr_unique_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法复习总数(目前等于total,不去重)',
  `gr_score` int(10) NOT NULL DEFAULT '0' COMMENT '语法复习分数',
  `gh_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法闯关错误句子数（去重）',
  `gh_score` int(10) NOT NULL DEFAULT '0' COMMENT '语法闯关平均分',
  `gh_duration` int(10) NOT NULL DEFAULT '0' COMMENT '语法闯关时长（秒）',
  `gp_duration` int(10) NOT NULL DEFAULT '0' COMMENT '语法练习时长（秒）',
  `gh_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法闯关总数（去重）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `wt_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查总数，去重',
  `wt_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查错误数量,去重',
  `ta_read_score` int(10) NOT NULL DEFAULT '0' COMMENT '课文朗读平均分',
  `ta_read_num` int(10) NOT NULL DEFAULT '0' COMMENT '课文朗读已读数，去重',
  `ta_read_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '课文朗读已读时长(秒)',
  `ta_retell_score` int(10) NOT NULL DEFAULT '0' COMMENT '课文复述平均分',
  `ta_retell_num` int(10) NOT NULL DEFAULT '0' COMMENT '课文复述已读数，去重',
  `ta_retell_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '课文复述已读时长(秒)',
  `tas_follow_score` int(10) NOT NULL DEFAULT '0' COMMENT '课文分句跟读平均分',
  `tas_follow_num` int(10) NOT NULL DEFAULT '0' COMMENT '课文分句跟读已读数，去重',
  `tas_follow_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '课文分句跟读已读时长(秒)',
  `wt_score` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查平均分',
  `whm_first_score` int(10) NOT NULL DEFAULT '0' COMMENT '首次词义闯关平均分',
  `wt_first_score` int(10) NOT NULL DEFAULT '0' COMMENT '首次单词检查平均分',
  `gp_score` int(10) NOT NULL DEFAULT '0' COMMENT '语法练习平均分',
  `grt_score` int(10) NOT NULL DEFAULT '0' COMMENT '语法学习(识记)平均分',
  `whm_first_cnt` int(10) NOT NULL DEFAULT '0' COMMENT '首次词义闯关次数',
  `wt_first_cnt` int(10) NOT NULL DEFAULT '0' COMMENT '首次单词检查次数',
  `prt_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '音标记忆时长（秒）',
  `prt_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '音标学习单元数',
  `prt_score` int(10) NOT NULL DEFAULT '0' COMMENT '音标学习(识记)平均分',
  `pp_score` int(10) NOT NULL DEFAULT '0' COMMENT '音标练习平均分',
  `pp_duration` int(10) NOT NULL DEFAULT '0' COMMENT '音标练习时长（秒）',
  `ph_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '音标闯关错误数（去重）',
  `ph_score` int(10) NOT NULL DEFAULT '0' COMMENT '音标闯关平均分',
  `ph_duration` int(10) NOT NULL DEFAULT '0' COMMENT '音标闯关时长（秒）',
  `ph_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '音标闯关总数（去重）',
  `rs_max` int(10) NOT NULL DEFAULT '-1' COMMENT '每天最多复习句子数量',
  `rg_max` int(10) NOT NULL DEFAULT '-1' COMMENT '每天最多复习语法数量',
  `lt_duration` int(4) NOT NULL DEFAULT '0' COMMENT '听力测试时长',
  `lt_num` int(4) NOT NULL DEFAULT '0' COMMENT '听力测试次数',
  `lt_score` int(4) NOT NULL DEFAULT '0' COMMENT '听力测试平均分',
  `lt_listen_duration` int(4) NOT NULL DEFAULT '0' COMMENT '听力测试听力时长',
  `lt_listen_sen` int(4) NOT NULL DEFAULT '0' COMMENT '听力测试听句数',
  `lc_duration` int(4) NOT NULL DEFAULT '0' COMMENT '听力选词组句时长',
  `lc_listen_duration` int(4) NOT NULL DEFAULT '0' COMMENT '听力选词组句听力时长',
  `lc_listen_sen` int(4) NOT NULL DEFAULT '0' COMMENT '听力选词组句听句数',
  `ld_duration` int(4) NOT NULL DEFAULT '0' COMMENT '听力全文听写时长',
  `ld_listen_duration` int(4) NOT NULL DEFAULT '0' COMMENT '听力全文听写听力时长',
  `ld_listen_sen` int(4) NOT NULL DEFAULT '0' COMMENT '听力全文听写听句数',
  `ld_listen_piece` int(4) NOT NULL DEFAULT '0' COMMENT '听力全文听写短文数',
  `lre_duration` int(4) NOT NULL DEFAULT '0' COMMENT '听力跟读复述时长',
  `lre_listen_duration` int(4) NOT NULL DEFAULT '0' COMMENT '听力跟读复述听力时长',
  `lre_listen_sen` int(4) NOT NULL DEFAULT '0' COMMENT '听力跟读复述听句数',
  `rart_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练记忆时长（秒）',
  `rart_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练学习单元数(去重)',
  `rart_score` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练学习平均分',
  `rahq_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练闯关做题总数',
  `rahq_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练闯关做题错误数',
  `rahq_score` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练闯关题目平均分',
  `rah_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练闯关时长（秒）',
  `rah_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读闯关文章数',
  `rapq_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练练习做题总数',
  `rapq_mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练练习做题错误数',
  `rapq_score` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练练习题目平均分',
  `rap_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练练习时长（秒）',
  `rap_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读练习文章数',
  UNIQUE KEY `pk` (`pk`) USING BTREE,
  KEY `pk_date` (`pk_id`,`period`,`start_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生学习bi';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_produce`;

CREATE TABLE `card_produce` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '课程卡名字',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卡类型：1-体验卡；2-同步教材卡；3-综合课程卡',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `product_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '产品类型：1-单词卡，2-句子卡；3-阅读卡',
  `create_num` int(10) NOT NULL DEFAULT '0' COMMENT '生成数量',
  `publish_num` int(10) NOT NULL DEFAULT '0' COMMENT '发行数量',
  `activate_num` int(10) NOT NULL DEFAULT '0' COMMENT '激活数量',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '生成这批卡的发行后的费用（分）',
  `unit_fee` int(10) NOT NULL DEFAULT '0' COMMENT '生成卡的时候的卡的单价（分）',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属上级ID',
  `start_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '课程卡开始编号',
  `end_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '课程卡结束编号',
  `publish_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发行时间（废弃）',
  `scope_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程卡范围类型：1-普通体验卡；2-vip体验卡；3-小学同步教材；4-初中同步教材；5-高中同步教材；6-小学考纲；7-中考考纲；8-高考考纲；9-四级课程；10-六级课程；11-托福课程；12-雅思课程',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '生成人',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课程卡表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_publish`;

CREATE TABLE `card_publish` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '发行消耗的钱',
  `card_word_ids` text NOT NULL COMMENT '本次发行的卡的卡id，英文逗号做分隔',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属上级ID',
  `personnel_id` int(10) NOT NULL DEFAULT '0' COMMENT '发行卡人id',
  `card_name` varchar(500) NOT NULL DEFAULT '' COMMENT '此次发行卡名字,用逗号分隔'',''',
  `card_type` varchar(20) NOT NULL DEFAULT '' COMMENT '此次发行课程卡类型，用'',''分隔',
  `scope_type` varchar(100) NOT NULL DEFAULT '' COMMENT '课程卡范围类型：1-普通体验卡；2-vip体验卡；3-小学同步教材；4-初中同步教材；5-高中同步教材；6-小学考纲；7-中考考纲；8-高考考纲；9-四级课程；10-六级课程；11-托福课程；12-雅思课程，用-1-格式进行存储，方便查询',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课程卡发行记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_word`;

CREATE TABLE `card_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `personnel_id` int(10) NOT NULL DEFAULT '0' COMMENT '发行人id',
  `active_wordset_id` varchar(500) NOT NULL DEFAULT '' COMMENT '词库ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '课程卡激活状态：1-未激活，2-已激活，3-已过期，4-已失效',
  `use_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '使用状态：1-未使用；2-已使用',
  `publish_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发行状态：1-未发行，2-已发行',
  `valid_days` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期天数',
  `experience_num` int(10) NOT NULL DEFAULT '0' COMMENT '体验次数',
  `student_wordset_id` varchar(500) NOT NULL DEFAULT '' COMMENT '学生词库ids(体验卡可以激活多个)，用短线分隔，为了查询-2-3-',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程卡类型：1-单册；2-多册；',
  `scope_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程卡范围类型：1-普通体验卡；2-vip体验卡；3-小学同步教材；4-初中同步教材；5-高中同步教材；6-小学考纲；7-中考考纲；8-高考考纲；9-四级课程；10-六级课程；11-托福课程；12-雅思课程；13-GRE；14-零基础；15-体验课程；16-新概念青少；17-新概念；18-精读体验；19-精读正式',
  `wordset_ids` text NOT NULL COMMENT '所涉及到的课程卡，如果有全部词库，则为''全部''',
  `card_produce_id` int(10) NOT NULL DEFAULT '0' COMMENT '主课程卡表id',
  `sn` varchar(20) NOT NULL DEFAULT '' COMMENT '课程卡编号',
  `plaintext` varchar(255) NOT NULL DEFAULT '' COMMENT '明文密码（体验卡才有）',
  `secret_key` varchar(32) NOT NULL DEFAULT '' COMMENT '卡密（卡号+密码md5加密）',
  `id_equal_value` varchar(10) NOT NULL DEFAULT '' COMMENT 'id对应的34位进制数',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属上级ID',
  `cid` varchar(64) NOT NULL DEFAULT '' COMMENT '激活id,App唯一',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '激活时的省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '激活时的市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '激活时的区县',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '激活时的具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '维度',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '激活课程卡ip地址',
  `active_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '卡的激活时间',
  `expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  `publish_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发行时间',
  `cancel_activated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '取消激活时间',
  `cancel_activated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '取消激活人',
  `reset_identify` int(8) NOT NULL DEFAULT '0' COMMENT '当次重置卡密的时候的标识，用来解决当重置的时候有用户激活课程卡，这个时候存到redis不能有当前激活的卡，8位随机',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '发行需要消耗的钱',
  `cancel_fee` int(10) NOT NULL DEFAULT '0' COMMENT '取消激活退还额度',
  `activate_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '激活类型：1-学生激活；2-老师激活',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `activated_by` varchar(32) NOT NULL DEFAULT '',
  `study_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学习方式：1-1v1；2-班组',
  `card_publish_id` int(10) NOT NULL DEFAULT '0' COMMENT '发行id',
  `old_fee` int(10) NOT NULL DEFAULT '0' COMMENT '旧的费用',
  `old_study_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '旧的学习方式：1-1v1；2-班组',
  `course_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '子课程类型：1-单词，2-句子，3-真题精读，4-语法,5-音标',
  `version_no` tinyint(10) NOT NULL DEFAULT '0' COMMENT '购买课程版本号：1，2，3...',
  `use_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '卡使用时间',
  `article_stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '真题阅读学段：1-小学；2-初中；3-高中',
  `article_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读文章数量',
  `supagent_chain` text NOT NULL COMMENT '代理商父级链只是当前结点的父级，父级之间用“-”链接 1-2-3,包含自己的代理商',
  `supagent_chain_price` text NOT NULL COMMENT '代理商价格链-100-200-300-',
  `card_word_return_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程退费表id',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `operated_by` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`) USING BTREE,
  UNIQUE KEY `id_equal_value` (`id_equal_value`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `card_produce_id` (`card_produce_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='单词课程卡表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `card_word_return`;

CREATE TABLE `card_word_return` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生ID',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `student_wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生词库id；根据course_type不同，表也不同',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `total_fee` int(10) NOT NULL DEFAULT '0' COMMENT '总共金额（分）',
  `return_fee` int(10) NOT NULL DEFAULT '0' COMMENT '退费金额（分）',
  `deduct_fee` int(10) NOT NULL DEFAULT '0' COMMENT '扣除费用（分）',
  `card_word_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '退费相关card_word_id',
  `course_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程类型:1-单词;2-句子;3-真题精读;4-语法',
  `reason_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '取消原因：1-课程开错；2-学生退费；20-其他',
  `reason` text NOT NULL COMMENT '取消具体原因',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(255) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课程退费表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `check_read_answer`;

CREATE TABLE `check_read_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `read_article_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_article id',
  `student_read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_course id',
  `student_read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_unit id',
  `student_check_read_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_practice_read id',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '耗时：秒',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总题数',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '答对题数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '获得分数',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `question` text NOT NULL COMMENT '题目：[{"no":"题号","answer":"学生答案","is_right":"0-错误；1-正确"}]',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `st_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生闯关精读作答表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `chinese_voice`;

CREATE TABLE `chinese_voice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_meaning` varchar(500) NOT NULL DEFAULT '' COMMENT '中文',
  `word_meaning_md5` varchar(40) NOT NULL DEFAULT '' COMMENT '中文md5，方便查询',
  `ch_voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '中文音频',
  PRIMARY KEY (`id`),
  UNIQUE KEY `word_meaning_md5` (`word_meaning_md5`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中文音频表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是默认班级：1-是；0-否',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '班级名字',
  `class_pid` varchar(40) NOT NULL DEFAULT '' COMMENT '班级图标ID',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '班级密码',
  `teacher_user_id` varchar(200) NOT NULL DEFAULT '' COMMENT '教师id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未结课；2-已结课',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `finished_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结课时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `password` (`password`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='班级表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `classes_group`;

CREATE TABLE `classes_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '班级id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名字',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级分组表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `classes_lesson`;

CREATE TABLE `classes_lesson` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '代理商id',
  `class_id` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '班级id',
  `teacher_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '教师id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '上课状态：1-上课，2-下课',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上课时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下课时间',
  `champion_team` text NOT NULL COMMENT '冠军团队，多个用英文逗号分隔',
  `champion_average_credit` int(10) NOT NULL DEFAULT '0' COMMENT '冠军队伍学分',
  `champion_personal_ids` text NOT NULL COMMENT '单词王，多个用英文逗号分隔',
  `champion_person_credit` int(10) NOT NULL DEFAULT '0' COMMENT '个人冠军分数',
  `class_student_num` int(10) NOT NULL DEFAULT '0' COMMENT '当时班级的总数人',
  `student_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '上课总人数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `teacher_user_id` (`teacher_user_id`) USING BTREE,
  KEY `class_id` (`class_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级上课主表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_price`;

CREATE TABLE `course_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `price_category_id` int(10) NOT NULL DEFAULT '0' COMMENT '价格单id',
  `book_sign` varchar(64) NOT NULL DEFAULT '' COMMENT '课本的md5(category_no-material-wrodset_name)',
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别：0-零基础；1-小学；2-初中；3-高中；4-大学；5-体验',
  `material` varchar(40) NOT NULL DEFAULT '' COMMENT '教材版本',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '教材名称',
  `version` varchar(32) NOT NULL DEFAULT '' COMMENT '版本',
  `word_v1_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '1v1单词价格（分）',
  `word_bk_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '班组单词价格（分）',
  `sentence_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '句子价格（分）',
  `grammar_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '语法价格（分）',
  `article30_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '阅读30篇价格（分）',
  `article60_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '阅读60篇价格（分）',
  `article100_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '阅读100篇价格（分）',
  `article200_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '阅读200篇价格（分）',
  `article300_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '阅读300篇价格（分）',
  `article500_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '阅读500篇价格（分）',
  `phonetic_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '音标价格（分）',
  `listen_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '听力课程价格（分）',
  `read_fee` int(10) NOT NULL DEFAULT '-1' COMMENT '阅读精讲精练课程价格（分）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `course` (`price_category_id`,`book_sign`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课程价格单表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_store`;

CREATE TABLE `course_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(10) NOT NULL DEFAULT '0' COMMENT '课程ID(type=1是wordset_id,type=2是article_set_id)',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区ID',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商ID',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型；1-wordset表；2-article_set表',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态；1-正常；2-删除',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sct` (`store_id`,`course_id`,`type`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE,
  KEY `course` (`course_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校区课程表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device`;

CREATE TABLE `device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备id,设备唯一',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-不可用;1-可用;2-暂时可用(后期可能device_id发生变化导致不可用)',
  `device_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '设备sn',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '设备类型：1-新设备，2-旧设备',
  `sys_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'PAD型号',
  `auth_by` varchar(32) NOT NULL DEFAULT '' COMMENT '授权者',
  `device_md5` varchar(40) NOT NULL DEFAULT '' COMMENT 'device_id的md5用于查询',
  `device_auth_code_id` int(10) NOT NULL DEFAULT '0' COMMENT '设备认证表id',
  `cid` varchar(64) NOT NULL DEFAULT '' COMMENT '激活id,App唯一',
  `activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '激活时间',
  `device_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '设备类型：1-pad；2-phone',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `shell_setting` varchar(500) NOT NULL DEFAULT '' COMMENT '壳子设置json:{"is_show_lock_screen":"是否显示锁屏设置:0-不显示:1-显示","is_show_light":"是否显示亮度设置:0-不显示:1-显示","is_change_native_sys":"是否允许切换到原生系统:0-不允许:1-允许"}',
  `bind_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出库绑定的门店id（绑定后不可修改）',
  `bind_agent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出库绑定的代理商id（绑定后不可修改）',
  `unlock_password` varchar(64) NOT NULL DEFAULT '' COMMENT '解锁设备恢复到原生系统密码，默认密码为绑定校区的校区编码',
  `resell_status` tinyint(4) DEFAULT '1' COMMENT '转卖状态：1-允许转卖；2-不允许转卖',
  `login_student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录学生id',
  `custom_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '定制机类型：0-不是定制机；1-内部；2-联想',
  `show_app` varchar(50) NOT NULL DEFAULT '' COMMENT '壳子显示应用列表：默认-全部；1-智牛英语；2-飞鲸外教',
  `first_use_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次激活时间',
  `last_use_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后使用时间',
  `ugs_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备唯一标识',
  PRIMARY KEY (`id`),
  KEY `device_md5` (`device_md5`) USING BTREE,
  KEY `device_id` (`device_id`) USING BTREE,
  KEY `device_sn` (`device_sn`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设备信息表';

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
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_md5` (`code_md5`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备授权码表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_id_extend`;

CREATE TABLE `device_id_extend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备id,设备唯一',
  `extend_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备扩展id',
  `extend_md5` varchar(32) NOT NULL DEFAULT '' COMMENT 'extend_id的md5',
  `ugs_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备唯一标识',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extend_md5` (`extend_md5`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='device扩展id';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_identify`;

CREATE TABLE `device_identify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ugs_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备唯一标识',
  `link_ids` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展标识，用于当设备上ugs_id丢失后再反向查询确定ugs_id,-link_id-',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-pad;2-phone',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ugs_id` (`ugs_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备系统唯一标识表';

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
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '出货数量',
  `gift_num` int(10) NOT NULL DEFAULT '0' COMMENT '赠送数量',
  `buy_num` int(10) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余库存数量',
  `is_consume` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否消耗库存: 1-是 ;0-否',
  `device_sn` varchar(2000) NOT NULL DEFAULT '' COMMENT '设备sn,多个用英文逗号分隔',
  `device_pid` varchar(2000) NOT NULL DEFAULT '' COMMENT '设备pid,多个用英文逗号分隔',
  `express_number` varchar(30) NOT NULL DEFAULT '' COMMENT '邮递编号',
  `express_pid` varchar(50) NOT NULL DEFAULT '' COMMENT '邮递pid',
  `express_fee` int(10) NOT NULL DEFAULT '0' COMMENT '邮递费用',
  `express_name` varchar(30) NOT NULL DEFAULT '' COMMENT '快递厂商',
  `addressee` varchar(10) NOT NULL DEFAULT '' COMMENT '收件人',
  `addressee_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '收件人电话',
  `addressee_address` varchar(100) NOT NULL DEFAULT '' COMMENT '收件人地址',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `device_password` varchar(50) NOT NULL DEFAULT '' COMMENT 'pad密码',
  `material` varchar(200) NOT NULL DEFAULT '' COMMENT '相关物料说明',
  `material_pid` varchar(2000) NOT NULL DEFAULT '' COMMENT '物料pid',
  `deliver_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `deliver_by` varchar(20) NOT NULL DEFAULT '' COMMENT '发货人',
  `apply_by` varchar(20) NOT NULL DEFAULT '' COMMENT '发货申请人',
  `created_by` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `is_custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是定制机：1-是；0-否；',
  `company` tinyint(4) NOT NULL DEFAULT '0' COMMENT '收款公司:1-智牛闪学；2-光速侄智学；10-其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备出货';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `device_stock`;

CREATE TABLE `device_stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余库存数量',
  `available_num` int(10) NOT NULL DEFAULT '0' COMMENT '可发数量',
  `invalid_num` int(10) NOT NULL DEFAULT '0' COMMENT '不可发数量',
  `sys_type` varchar(50) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `color` varchar(20) NOT NULL DEFAULT '' COMMENT '颜色',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `created_by` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '背板型号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备库存表';

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
  `created_by` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `detail` varchar(500) NOT NULL COMMENT '库存信息，json字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备供货表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_message`;

CREATE TABLE `event_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(50) NOT NULL COMMENT '事件',
  `args` longtext NOT NULL COMMENT '事件参数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事件消息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `external_vocabulary_test`;

CREATE TABLE `external_vocabulary_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(48) NOT NULL DEFAULT '' COMMENT '外部测试者唯一编号',
  `grade` varchar(4) NOT NULL DEFAULT '' COMMENT '年级:三年级',
  `read_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '看英文选中文词汇量',
  `listen_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '听力词汇量',
  `en_level` varchar(10) NOT NULL DEFAULT '' COMMENT '英文级别',
  `ch_level` varchar(30) DEFAULT '' COMMENT '中文级别',
  `grade_level` varchar(50) DEFAULT '' COMMENT '年级级别',
  `score` varchar(100) NOT NULL DEFAULT '' COMMENT '英语能力综合评估Json:{"vocabulary":"5","listening":"5","reading":"5","writing":"5"}',
  `sub_score` varchar(150) NOT NULL DEFAULT '' COMMENT '测评其他辅助分数Json:{"voc_abs":"5","voc_rel":"5","listen_abs":"5","listen_rel":"5"...}',
  `unknow_num` int(10) NOT NULL DEFAULT '0' COMMENT '不认识单词数量',
  `unanswer_num` int(10) NOT NULL DEFAULT '0' COMMENT '未作答单词数量',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误单词数量',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确单词数量',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '测试总单词数量',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '测评总时间(秒)',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '测评开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '测评结束时间',
  `vocabulary_result` text NOT NULL COMMENT '算法最后的结果',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `sn` (`sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部单词测评表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `external_vocabulary_test_word`;

CREATE TABLE `external_vocabulary_test_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `external_vocabulary_test_id` int(10) NOT NULL COMMENT '词汇量检测id',
  `word` varchar(200) NOT NULL DEFAULT '' COMMENT '单词',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-正确；2-错误；3-不认识；4-未作答',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '时长（豪秒）',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '答题类型：1-看英文选中文；2-听力',
  `vocabulary_text` text NOT NULL COMMENT '每一个单词的过程中的算法东西的记录',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `external_vocabulary_test_id` (`external_vocabulary_test_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外部词汇量单个单词检测表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `follow_supplement`;

CREATE TABLE `follow_supplement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `follow_id` int(10) NOT NULL DEFAULT '0' COMMENT 'support follow id',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '追加人id',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '跟进信息',
  `pids` text NOT NULL COMMENT '图片objects',
  `vids` text NOT NULL COMMENT '视频objects',
  `fids` text NOT NULL COMMENT '文件objects',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '追加认',
  PRIMARY KEY (`id`),
  KEY `follow_id` (`follow_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运营跟进追加补充';

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
  `created_by` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `type_description` varchar(200) NOT NULL DEFAULT '' COMMENT '型号描述',
  `config_description` varchar(200) NOT NULL DEFAULT '' COMMENT '配置描述',
  `price_description` varchar(200) NOT NULL DEFAULT '' COMMENT '估值描述',
  `pids` varchar(200) NOT NULL DEFAULT '' COMMENT '物品图pid(目前支持2张图)',
  `sn` varchar(20) NOT NULL DEFAULT '' COMMENT '编号',
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
  `created_by` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
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
  `created_by` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政供货表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `grammar_content`;

CREATE TABLE `grammar_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade` varchar(20) NOT NULL COMMENT '年级',
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '标题',
  `content` mediumtext NOT NULL COMMENT '详见：http://ams.gsudev.cn/#/home/project/inside/doc/detail?groupID=1&documentID=27&projectName=bingo-%E6%99%BA%E7%89%9B%E8%8B%B1%E8%AF%AD&projectID=2',
  `content_backup` mediumtext NOT NULL COMMENT 'content的备份，防止代码bug导致content丢失',
  `sign` varchar(40) NOT NULL DEFAULT '' COMMENT 'content做的md5值',
  `knowledge_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '包含的只是点ids,逗号分隔',
  `exercise_question_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '练习题目ids，英文逗号分隔',
  `question_ids_back` varchar(1000) NOT NULL DEFAULT '' COMMENT '练习题目ids备份，英文逗号分隔',
  `check_question_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '闯关题目ids，英文逗号分隔',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-待审核；1-已审核可用；2-已删除弃用',
  `version` tinyint(4) NOT NULL DEFAULT '1' COMMENT '版本，默认是1，版本2是按照知识点结构学习（大版本）',
  `related_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '相关语法id，逗号分割',
  `total_step_num` int(10) NOT NULL DEFAULT '0' COMMENT '单元总步数,即content的一级数组个数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `backuped_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '备份时间(发布时间)',
  PRIMARY KEY (`id`),
  KEY `sign` (`sign`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='语法学习内容表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `grammar_content_history`;

CREATE TABLE `grammar_content_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grammar_content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'grammar_content id',
  `content` mediumtext NOT NULL COMMENT 'grammar_content的备份数据',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '备份时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `grammar_content_id` (`grammar_content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='语法学习内容历史发布表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `grammar_content_item`;

CREATE TABLE `grammar_content_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grammar_content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'grammar_content id',
  `group` int(10) NOT NULL DEFAULT '0' COMMENT '分组号，也是排序号',
  `step` int(10) NOT NULL DEFAULT '0' COMMENT '步骤号，也是排序号',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '步骤内模块排序号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '详见：http://ams.gsudev.cn/#/home/project/inside/doc/detail?groupID=1&documentID=27&projectName=bingo-%E6%99%BA%E7%89%9B%E8%8B%B1%E8%AF%AD&projectID=2',
  `json` text NOT NULL COMMENT '内容',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '题目id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `grammar_content_id` (`grammar_content_id`) USING BTREE,
  KEY `idx` (`group`,`step`,`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='语法学习内容子表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `grammar_course`;

CREATE TABLE `grammar_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `study_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '学完单元数',
  `total_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '总共单元数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未激活；2-已激活；3-已过期；4-未激活已过期；5-取消激活',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_lead_wordset表id',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '当前所用版本号',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `shorthand_duration` int(10) NOT NULL DEFAULT '0' COMMENT '学习语法总时长',
  `check_duration` int(10) NOT NULL DEFAULT '0' COMMENT '语法闯关总时长',
  `exercise_duration` int(10) NOT NULL DEFAULT '0' COMMENT '语法训练总时长',
  `review_duration` int(10) NOT NULL DEFAULT '0' COMMENT '语法复习总时长',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `prolong_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '延期到期时间',
  PRIMARY KEY (`id`),
  KEY `student_course` (`student_id`,`wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生语法课程表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `grammar_study_history`;

CREATE TABLE `grammar_study_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `unit_shorthand_grammar_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'unit_shorthand_grammar表id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'wordset表id',
  `grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'grammar_unit表id',
  `grammar_content_id` int(10) NOT NULL DEFAULT '0' COMMENT 'grammar_content表id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `detail` text NOT NULL COMMENT '学生答题内容',
  `student_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学生类型：1-正式；2-测试',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `intensify_detail` text NOT NULL COMMENT '学习答题强化详情json',
  PRIMARY KEY (`id`),
  KEY `unit_shorthand_grammar_id` (`unit_shorthand_grammar_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学习语法记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `grammar_unit`;

CREATE TABLE `grammar_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `unit_name` varchar(100) NOT NULL DEFAULT '' COMMENT '单元名字',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '单元名字(章节名字)',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '当前所用版本号',
  `sign` varchar(40) NOT NULL DEFAULT '' COMMENT '代表单元的sign值，md5(wordset_id-version_no)',
  `grammar_content_id` int(10) NOT NULL DEFAULT '0' COMMENT '语法内容id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `total_step_num` int(10) NOT NULL DEFAULT '0' COMMENT '总步数',
  PRIMARY KEY (`id`),
  KEY `sign` (`sign`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='语法单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `home_study_apply`;

CREATE TABLE `home_study_apply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区ID',
  `students` text NOT NULL COMMENT '申请的学生信息json:[{"id":"学生id","distance":"距离米"}]',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-待审核;2-已同意;3-已驳回',
  `audit_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `refuse_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '驳回原因',
  `apply_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '申请原因',
  `creator` varchar(50) NOT NULL COMMENT '申请人名称',
  `creator_id` int(10) NOT NULL COMMENT '申请人ID',
  `auditor` varchar(50) NOT NULL COMMENT '审核人员',
  `auditor_id` int(10) NOT NULL COMMENT '审核人员ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `msg_id` varchar(64) NOT NULL DEFAULT '' COMMENT '钉钉messageId',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='在家学开通申请';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `intention_customer`;

CREATE TABLE `intention_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '门店名称',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `contact_people` varchar(100) NOT NULL COMMENT '联系人',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '地图定位地址',
  `detail_address` varchar(200) NOT NULL DEFAULT '' COMMENT '详细地址（手动填入）',
  `longitude` varchar(16) NOT NULL COMMENT '经度',
  `latitude` varchar(16) NOT NULL COMMENT '维度',
  `v_longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '偏移经度',
  `v_latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '偏移维度',
  `radius` int(11) NOT NULL DEFAULT '0' COMMENT '区域保护距离：米',
  `remark` text NOT NULL COMMENT '管理后台备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预登记客户表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `join_filter_region`;

CREATE TABLE `join_filter_region` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-招商电话入口过滤;2-区域过滤;3-区域延时过滤;4-不开放区域',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-已生效;2-已失效',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加盟区域过滤';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `join_sign`;

CREATE TABLE `join_sign` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '联系人',
  `mobile` varchar(20) NOT NULL COMMENT '联系方式',
  `mobile_address` varchar(200) NOT NULL DEFAULT '' COMMENT '电话归属地',
  `region` varchar(20) NOT NULL COMMENT '省份',
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `ip_address` varchar(200) NOT NULL DEFAULT '' COMMENT 'ip归属地',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-待处理;1-已联系;2-无效;3-已签约',
  `source` tinyint(2) NOT NULL DEFAULT '0' COMMENT '平台：1-PC官网；2-移动端官网；3...',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '合作信息',
  `operator_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `channel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源渠道：0-空;1-内部渠道；2-线上；3-线下；4-转介绍；10-其他',
  `info_extend` text NOT NULL COMMENT '填写信息扩展字段：Json{"budget":"预算","other":"其他咨询问题"}',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `page` tinyint(4) NOT NULL DEFAULT '0' COMMENT '页面,2-中基广告页',
  `mobile_text` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号显示',
  `audit_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-待审核;2-对方已经查看；3-已同意；4-已驳回',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品加盟登记';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `join_sign_internal`;

CREATE TABLE `join_sign_internal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '联系人',
  `mobile` varchar(20) NOT NULL COMMENT '联系方式',
  `mobile_address` varchar(200) NOT NULL DEFAULT '' COMMENT '电话归属地',
  `region` varchar(20) NOT NULL COMMENT '省份',
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `ip_address` varchar(200) NOT NULL DEFAULT '' COMMENT 'ip归属地',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-待处理;1-已联系;2-无效;3-已签约',
  `source` tinyint(2) NOT NULL DEFAULT '0' COMMENT '平台：1-PC官网；2-移动端官网；3...',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '合作信息',
  `operator_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `channel` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源渠道：0-空;1-内部渠道；2-线上；3-线下；4-转介绍；10-其他',
  `info_extend` text NOT NULL COMMENT '填写信息扩展字段：Json{"budget":"预算","other":"其他咨询问题"}',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部产品加盟登记';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `join_white`;

CREATE TABLE `join_white` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：1-hq;2-转介绍',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `mobile_secret` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号加密字段',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='join white';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `js_version`;

CREATE TABLE `js_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号:eq:1,2,3',
  `description` text NOT NULL COMMENT '升级信息',
  `js_url` varchar(255) NOT NULL DEFAULT '' COMMENT '资源的wordblockurl',
  `input_file_name` varchar(100) NOT NULL DEFAULT '' COMMENT '输入文件名',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='js资源版本表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `knowledge`;

CREATE TABLE `knowledge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(20) NOT NULL DEFAULT '' COMMENT '学科',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学段：1-小学；2-初中；3-高中',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '知识点名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：1-知识点；2-标签',
  `keyword` varchar(200) NOT NULL DEFAULT '' COMMENT '检索关键词：名词拼音及首字母',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级知识点id',
  `parent_chain` varchar(100) NOT NULL DEFAULT '' COMMENT '父级链(含自身），eq: -1-12-13-',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-正常；2-已删除',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者登陆名',
  `tmp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '源数据的id，临时字段，脚本匹配题库用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`subject`,`stage`,`parent_id`,`name`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `knowledge_other`;

CREATE TABLE `knowledge_other` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(20) NOT NULL DEFAULT '' COMMENT '学科（区分不同知识点体系的名词，不一定是学科名）',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学段：1-小学；2-初中；3-高中',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '知识点名称',
  `keyword` varchar(200) NOT NULL DEFAULT '' COMMENT '检索关键词：名词拼音及首字母',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级知识点id',
  `parent_chain` varchar(100) NOT NULL DEFAULT '' COMMENT '父级链(含自身），eq: -1-12-13-',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-正常；2-已删除',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者登陆名',
  `tmp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '源数据的id，临时字段，脚本匹配题库用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`subject`,`stage`,`parent_id`,`name`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方知识点';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `listen_course`;

CREATE TABLE `listen_course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course_id` int(10) NOT NULL DEFAULT '0' COMMENT '课程wordset id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `supreme_name` varchar(32) NOT NULL DEFAULT '' COMMENT '精听名称',
  `simulation_name` varchar(32) NOT NULL DEFAULT '' COMMENT '模拟训练名称',
  `special_name` varchar(32) NOT NULL DEFAULT '' COMMENT '专项名称',
  `word_name` varchar(32) NOT NULL DEFAULT '' COMMENT '听力词汇',
  `supreme_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '精听简介',
  `simulation_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '模拟训练简介',
  `special_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '专项简介',
  `word_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '听力词汇简介',
  `supreme_ids` text NOT NULL COMMENT '精品试卷ids,按顺序排',
  `simulation_ids` text NOT NULL COMMENT '模拟试卷ids,按顺序排',
  `special_ids` text NOT NULL COMMENT '专项试卷ids,按顺序排',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='听力课程';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `listen_paper`;

CREATE TABLE `listen_paper` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-精听;2-模拟;3-专项',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `city` varchar(32) NOT NULL DEFAULT '' COMMENT '城市',
  `year` int(10) NOT NULL DEFAULT '0' COMMENT '年份',
  `audition_audio` varchar(255) NOT NULL DEFAULT '' COMMENT '试听语音',
  `audition_start` int(10) NOT NULL DEFAULT '0' COMMENT '试听音频起始时间(毫秒)',
  `audition_end` int(10) NOT NULL DEFAULT '0' COMMENT '试听音频结束时间(毫秒)',
  `audition_text` varchar(1000) NOT NULL DEFAULT '' COMMENT '试听文案',
  `audition_questions` text NOT NULL COMMENT '试音题目json',
  `total_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '总分',
  `question_num` int(10) NOT NULL DEFAULT '0' COMMENT '小题数量',
  `part_ids` text NOT NULL COMMENT '包含的part ids,按在paper中的顺序排',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '源数据标识',
  `piece_num` int(10) NOT NULL DEFAULT '0' COMMENT '短文数量',
  `refer` varchar(255) NOT NULL DEFAULT '' COMMENT '参考出处',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-待审核；1-审核通过；2-已发布',
  `resource` varchar(255) NOT NULL DEFAULT '' COMMENT '试卷资源（音频、文本等），备份用',
  `audio_zip` varchar(255) NOT NULL DEFAULT '' COMMENT '试卷音频zip包地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='听力试卷';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `listen_part`;

CREATE TABLE `listen_part` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-短对话;2-长对话或独白;3-听问题选择',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `total_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '总分',
  `score_desc` varchar(100) NOT NULL DEFAULT '' COMMENT '分数描述',
  `command_audio` varchar(255) NOT NULL DEFAULT '' COMMENT '语音指令',
  `command_start` int(10) NOT NULL DEFAULT '0' COMMENT '语音指令起始时间(毫秒)',
  `command_end` int(10) NOT NULL DEFAULT '0' COMMENT '语音指令结束时间(毫秒)',
  `command_text` varchar(255) NOT NULL DEFAULT '' COMMENT '语音文案',
  `piece_ids` text NOT NULL COMMENT '听力材料ids,按顺序排',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='听力试卷part';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `listen_piece`;

CREATE TABLE `listen_piece` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '材料类型：1-对话；2-文章',
  `command_audio` varchar(255) NOT NULL DEFAULT '' COMMENT '语音指令',
  `command_start` int(10) NOT NULL DEFAULT '0' COMMENT '语音指令起始时间(毫秒)',
  `command_end` int(10) NOT NULL DEFAULT '0' COMMENT '语音指令结束时间(毫秒)',
  `command_text` varchar(255) NOT NULL DEFAULT '' COMMENT '语音文案',
  `read_duration` int(10) NOT NULL DEFAULT '0' COMMENT '提示：读题时长(秒）',
  `audio` varchar(255) NOT NULL DEFAULT '' COMMENT '听力语音',
  `audio_start` int(10) NOT NULL DEFAULT '0' COMMENT '听力语音起始时间(毫秒)',
  `audio_end` int(10) NOT NULL DEFAULT '0' COMMENT '听力语音结束时间(毫秒)',
  `play_times` int(10) NOT NULL DEFAULT '1' COMMENT '播放次数',
  `answer_command` varchar(255) NOT NULL DEFAULT '' COMMENT '答题指令',
  `answer_command_start` int(10) NOT NULL DEFAULT '0' COMMENT '答题指令起始时间(毫秒)',
  `answer_command_end` int(10) NOT NULL DEFAULT '0' COMMENT '答题指令结束时间(毫秒)',
  `answer_duration` int(10) NOT NULL DEFAULT '0' COMMENT '提示：答题时长（秒）',
  `questions` text NOT NULL COMMENT '题目json',
  `question_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '小题数量',
  `question_show_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '题目显示格式类型',
  `segment_info` varchar(500) NOT NULL DEFAULT '' COMMENT 'segment json:{"flag":"0","no":"1","name":"","desc":"","audio":"","text":""}',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='听力材料短文';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `listen_piece_sentence`;

CREATE TABLE `listen_piece_sentence` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `piece_id` int(10) NOT NULL DEFAULT '0' COMMENT '听力材料id',
  `en` varchar(300) NOT NULL DEFAULT '' COMMENT '英文',
  `cn` varchar(300) NOT NULL DEFAULT '' COMMENT '中文翻译',
  `audio_start` int(10) NOT NULL DEFAULT '0' COMMENT '句子音频的起始时间，毫秒',
  `audio_end` int(10) NOT NULL DEFAULT '0' COMMENT '句子音频的结束时间，毫秒',
  `speaker` varchar(100) NOT NULL DEFAULT '' COMMENT '说话人，空字符串表示没有说话人',
  `compose_sentence` varchar(2000) NOT NULL DEFAULT '' COMMENT '组句:like apple #答案# too',
  `compose_confuse` varchar(500) NOT NULL DEFAULT '' COMMENT '组句混淆项,|分隔',
  `compose_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '句子选词：1-普通句子；2-选词组句',
  `sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '句子数',
  `word_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-可用；2-已删除',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `piece_id` (`piece_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='听力材料的句子';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `mnemonic`;

CREATE TABLE `mnemonic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '助记内容',
  `format` tinyint(4) NOT NULL DEFAULT '0' COMMENT '助记格式：1--富文本  2--图片url  3--声音url  4--视频url',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '助记类型:0-其它;1-联想;2-谐音;3-词根;4-扩展;5-串记;6-口诀;7-对比;8-语法;9-词源;10-分析;11-合成',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别，1-小学,2-初中，3-高中，4-大学，5-大学以上',
  `solomon_id` int(10) NOT NULL DEFAULT '0' COMMENT 'solomon数据库中的表id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '最后修改者',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源\r\n0 未处理\r\n1 钱磊\r\n2 自编\r\n100 不详',
  `word_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '单词id，逗号分割',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='英语单词助记信息表';

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='朋友圈宣传';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `phonetic_content`;

CREATE TABLE `phonetic_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '标题',
  `type` tinyint(4) NOT NULL COMMENT '类型：1-音标讲堂  2-跟读训练  3-辨音训练',
  `content` mediumtext NOT NULL,
  `content_backup` mediumtext NOT NULL COMMENT 'content的备份，防止代码bug导致content丢失',
  `check_question_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '闯关题目ids，英文逗号分隔',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-待审核；1-已审核可用；2-已删除弃用',
  `version` tinyint(4) NOT NULL DEFAULT '1' COMMENT '版本，默认是1，版本2是三维结构',
  `total_page_num` int(10) NOT NULL DEFAULT '0' COMMENT '单元总页数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `backuped_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '备份时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='音标学习内容表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `phonetic_content_history`;

CREATE TABLE `phonetic_content_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phonetic_content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'phonetic_content_id id',
  `content` mediumtext NOT NULL COMMENT 'grammar_content的备份数据',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '备份时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `phonetic_content_id` (`phonetic_content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='音标学习内容历史发布表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `phonetic_content_item`;

CREATE TABLE `phonetic_content_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phonetic_content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'phonetic_content_id id',
  `group` int(10) NOT NULL DEFAULT '0' COMMENT '分组号，也是排序号',
  `step` int(10) NOT NULL DEFAULT '0' COMMENT '步骤号，也是排序号',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '步骤内模块排序号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '详见：http://ams.gsudev.cn/#/home/project/inside/doc/detail?groupID=1&documentID=27&projectName=bingo-%E6%99%BA%E7%89%9B%E8%8B%B1%E8%AF%AD&projectID=2',
  `json` text NOT NULL COMMENT '内容',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '题目id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `phonetic_content_id` (`phonetic_content_id`) USING BTREE,
  KEY `idx` (`group`,`step`,`sort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='音标学习内容子表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `phonetic_course`;

CREATE TABLE `phonetic_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `study_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '学完单元数',
  `total_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '总共单元数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未激活；2-已激活；3-已过期；4-未激活已过期；5-取消激活',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_lead_wordset表id',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '当前所用版本号',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `shorthand_duration` int(10) NOT NULL DEFAULT '0' COMMENT '学习总时长',
  `check_duration` int(10) NOT NULL DEFAULT '0' COMMENT '闯关总时长',
  `follow_duration` int(10) NOT NULL DEFAULT '0' COMMENT '跟读训练时长',
  `listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '辨音训练时长',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `prolong_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '延期到期时间',
  PRIMARY KEY (`id`),
  KEY `student_wordset` (`student_id`,`wordset_id`) USING BTREE,
  KEY `student_lead_wordset` (`student_lead_wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生音标课程表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `phonetic_question`;

CREATE TABLE `phonetic_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '上方题头',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'http://ams.gsudev.cn/#/home/project/inside/doc/detail?groupID=1&documentID=27&projectName=bingo-%E6%99%BA%E7%89%9B%E8%8B%B1%E8%AF%AD&projectID=2',
  `content` varchar(1000) NOT NULL COMMENT '题目内容',
  `options` varchar(500) NOT NULL DEFAULT '' COMMENT '选择题的选项,eq:{"A":"good", "B":"well"}',
  `answer` varchar(500) NOT NULL DEFAULT '',
  `hint` varchar(200) NOT NULL DEFAULT '' COMMENT '提示',
  `analysis` text NOT NULL COMMENT '题目解析',
  `show_voice` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示发音：0-不显示；1-显示',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-待审核；1-已审核可用；2-已删除弃用',
  `guid` varchar(40) NOT NULL DEFAULT '' COMMENT '唯一id,方便各环境数据同步',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `tmp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid` (`guid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='音标学习内容表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `phonetic_unit`;

CREATE TABLE `phonetic_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号',
  `unit_name` varchar(100) NOT NULL DEFAULT '' COMMENT '单元名字',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '单元名字(章节名字)',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '当前所用版本号',
  `sign` varchar(40) NOT NULL DEFAULT '' COMMENT '代表单元的sign值，md5(wordset_id-version_no)',
  `phonetic_content_id` int(10) NOT NULL DEFAULT '0' COMMENT '音标学习内容id',
  `follow_content_id` int(10) NOT NULL DEFAULT '0' COMMENT '音标跟读内容id',
  `listen_content_id` int(10) NOT NULL DEFAULT '0' COMMENT '音标辨音内容id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `total_page` int(10) NOT NULL DEFAULT '0' COMMENT '总页数',
  PRIMARY KEY (`id`),
  KEY `wordset_unit` (`wordset_id`,`unit_no`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='音标单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `plan_task`;

CREATE TABLE `plan_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `plan_id` int(10) NOT NULL DEFAULT '0' COMMENT '计划id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '任务项类型:1-单词;2-短语;3-句型;4-课文;5-语法;6-分级阅读;7-阅读精讲;8-听力',
  `period` tinyint(4) NOT NULL DEFAULT '0' COMMENT '计划周期:1-日;2-周;3-月',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '开始日期',
  `course_id` int(10) NOT NULL DEFAULT '0' COMMENT '课程',
  `module` int(10) NOT NULL DEFAULT '0' COMMENT '模块',
  `module_name` varchar(64) NOT NULL DEFAULT '' COMMENT '模块名称',
  `unit` int(10) NOT NULL DEFAULT '0' COMMENT '单元',
  `unit_name` varchar(64) NOT NULL DEFAULT '' COMMENT '单元名称',
  `item` int(10) NOT NULL DEFAULT '0' COMMENT '项',
  `item_name` varchar(64) NOT NULL DEFAULT '' COMMENT '模块名称',
  `study_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学习类型',
  `sub_num` int(10) NOT NULL DEFAULT '0' COMMENT 'sub_task_num:如任务中的文章数量',
  `complete_sub_num` int(10) NOT NULL DEFAULT '0' COMMENT 'sub_task_num:如任务中的完成文章数量',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-未完成;2-已完成;3-已删除',
  `times` int(10) NOT NULL DEFAULT '0' COMMENT '任务完成前的学习次数',
  `complete_count` int(10) NOT NULL DEFAULT '0' COMMENT '完成数量',
  `complete_score` int(10) NOT NULL DEFAULT '0' COMMENT '完成分数',
  `complete_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '完成时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `plan_id` (`plan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学习计划任务项';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `practice_read_answer`;

CREATE TABLE `practice_read_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `read_article_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_article id',
  `student_read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_course id',
  `student_read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_unit id',
  `student_practice_read_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_practice_read id',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '耗时：秒',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总题数',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '答对题数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '获得分数',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `question` text NOT NULL COMMENT '题目：[{"no":"题号","answer":"学生答案","is_right":"0-错误；1-正确"}]',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `st_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生练习精读作答表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `price`;

CREATE TABLE `price` (
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商',
  `valid_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '生效时间',
  `invalid_at` date NOT NULL DEFAULT '9999-12-31' COMMENT '失效时间',
  `category_no` tinyint(4) NOT NULL DEFAULT '0' COMMENT '左侧大类：0-零基础；1-小学；2-初中；3-高中；4-大学；5-体验',
  `material` varchar(40) NOT NULL DEFAULT '' COMMENT '教材版本',
  `wordset_name` varchar(40) NOT NULL DEFAULT '' COMMENT '教材名称',
  `book_sign` varchar(32) NOT NULL DEFAULT '' COMMENT '课本的md5(category_no-material-wrodset_name)',
  `fee_1v1` int(10) NOT NULL DEFAULT '-1' COMMENT '1v1价格（分）',
  `fee_class` int(10) NOT NULL DEFAULT '-1' COMMENT '班组价格（分）',
  `fee_sentence` int(10) NOT NULL DEFAULT '-1' COMMENT '句子价格（分）',
  `fee_grammar` int(10) NOT NULL DEFAULT '-1' COMMENT '语法价格（分）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `operate_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人，真实姓名',
  KEY `agent_valid` (`agent_id`,`valid_at`) USING BTREE,
  KEY `agent_book` (`agent_id`,`valid_at`,`invalid_at`,`category_no`,`material`,`wordset_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商定价详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `price_category`;

CREATE TABLE `price_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '价格单名称',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  `discount` int(10) NOT NULL DEFAULT '100' COMMENT '默认折扣百分比:56%存56',
  `valid_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '生效时间',
  `invalid_at` date NOT NULL DEFAULT '9999-12-31',
  `version` varchar(32) NOT NULL COMMENT '版本',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-上线;2-下线;',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='价格单';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `price_difference`;

CREATE TABLE `price_difference` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '代理商id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `card_word_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课程卡id',
  `supagent_chain` text NOT NULL COMMENT '代理商父级链,-1-2-3-',
  `supagent_chain_price` text NOT NULL COMMENT '代理商价格链-100-200-300-',
  `occur_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发生时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-进账，2-出账',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发生类型：1-激活，2-升级1v1，3-续费，4-退费',
  `course_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程类型：1-单词，2-句子，3-阅读，4-语法',
  `return_rate` double NOT NULL DEFAULT '0' COMMENT '退费时候的退还比率',
  `is_settle` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否结算过：0-未结算；1-已结算',
  `settle_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结算日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `operate_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人，真实姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='价格差价表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `price_version`;

CREATE TABLE `price_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `price_category_id` int(10) NOT NULL DEFAULT '0' COMMENT '价格单id',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型: 1-课程价格;2-课程折扣',
  `version` varchar(32) NOT NULL COMMENT '版本',
  `discount` int(10) NOT NULL DEFAULT '100' COMMENT '默认折扣百分比:56%存56',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='价格单版本记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `print_word`;

CREATE TABLE `print_word` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL DEFAULT '0' COMMENT '学生ID',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-待打印;2-已打印',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '课本名称集合',
  `sub_title` text NOT NULL COMMENT '单元名称集合',
  `agent_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `print_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '打印方式：1-只显示英文；2-只显示词义；3-英文+词义;4-背诵版;6-学生答题（无答案）;7-学生答题（答案集中在最后）;8-教学（每道题后有答案）',
  `question_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '句子题型：1-中译英； 2-选词组句；3-缺词填空',
  `fill_rate` varchar(10) NOT NULL DEFAULT '' COMMENT '填词比例',
  `print_purpose` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '打印用途：1-学前检测； 2-学后检测；3-其他',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-单词;2-句子;3-阅读生词;4-阅读文章；5-语法',
  `range` tinyint(4) NOT NULL DEFAULT '0' COMMENT '范围：1-单元全部单词；2-仅错词；3-抽查；4-语法错题',
  `write_style` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '书写纸张样式：1-英文书写格； 2-普通格',
  `is_all` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否打印全部单元',
  `print_num` int(11) NOT NULL DEFAULT '0' COMMENT '打印数量',
  `content` mediumtext NOT NULL COMMENT '单词json结果：语法只存question_id数组',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(255) NOT NULL DEFAULT '' COMMENT '创建者',
  `choose_chinese` tinyint(4) NOT NULL DEFAULT '0' COMMENT '打印中文：1-打印中文；2-不打印中文',
  `print_tag` smallint(11) NOT NULL DEFAULT '0' COMMENT '打印类型：1-单词；2-句型打印；3-单词抽查；4-阅读生词；5-抽查句型；6-文章打印;7-语法错题打印；8-学前已会打印',
  `wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '错误个数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `is_save` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否保存过成绩：1-是；0-否',
  `show_strange_word` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示生词表：1-是；0-否；',
  `select_question` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '文章打印题型：1-全部选择题；2-只包含错题；',
  `train_question` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否打印精选训练题：1-是；0-否；',
  `show_article` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否打印文章正文内容：1-是；0-否；',
  `page_style` tinyint(4) NOT NULL DEFAULT '1' COMMENT '页面版式：1-普通版；2-单元对齐版',
  `has_pos` tinyint(4) NOT NULL DEFAULT '0' COMMENT '有无词性：1-有词性；2-无词性',
  `word_row_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '每行单词数:2-2个；3-3个',
  `print_row_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '打印课本行数',
  `show_student_name` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示学生姓名：1-是；0-否；',
  `updated_by` varchar(255) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `student` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='打印记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `pronounce_register`;

CREATE TABLE `pronounce_register` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(10) NOT NULL DEFAULT '1' COMMENT 'pid：1-pad;3-phone',
  `cid` varchar(100) NOT NULL DEFAULT '1' COMMENT '用户cid',
  `ugs_id` varchar(100) NOT NULL DEFAULT '' COMMENT '设备唯一标识',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='口语测评引擎注册记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `protect_area`;

CREATE TABLE `protect_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-多边形；2-圆型',
  `radius` varchar(255) NOT NULL DEFAULT '' COMMENT '半径：米',
  `point` text NOT NULL COMMENT '存储百度地图点坐标集，json',
  `address` varchar(250) NOT NULL DEFAULT '' COMMENT '详细地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `reserve_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '预留状态：1-内部预留；2-外部独家预留',
  `reason` varchar(50) NOT NULL DEFAULT '' COMMENT '预留原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保护区域表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '参考：http://ams.gsudev.cn/#/home/project/inside/doc/detail?groupID=1&documentID=27&projectName=bingo-%E6%99%BA%E7%89%9B%E8%8B%B1%E8%AF%AD&projectID=2',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学段：1-小学；2-初中；3-高中',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题目等级：1-12 对应K12年级',
  `content` text NOT NULL COMMENT '题干',
  `translate` varchar(500) NOT NULL DEFAULT '' COMMENT '部分语法题资源有题干句子的翻译，存起来备用',
  `options` varchar(500) NOT NULL DEFAULT '' COMMENT '选择题的选项,eq:{"A":"good", "B":"well"}',
  `answer` varchar(500) NOT NULL DEFAULT '' COMMENT '答案，JSON数组，eq：["A", "B"]',
  `analysis` text NOT NULL COMMENT '题目解析',
  `analysis_video` varchar(300) NOT NULL DEFAULT '' COMMENT '视频解析地址，优先于 analysis_audio',
  `analysis_video_cover` varchar(300) NOT NULL DEFAULT '' COMMENT '视频解析的封面图片地址',
  `analysis_audio` varchar(300) NOT NULL DEFAULT '' COMMENT '音频解析地址',
  `hint` varchar(200) NOT NULL DEFAULT '' COMMENT '提示',
  `raw_knowledge` varchar(500) NOT NULL DEFAULT '' COMMENT '临时字段，存放语法知识点信息数据，用于生成knowledge_ids',
  `knowledge_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '题目每个空的知识点，分号";"分隔多个空；同一个空用逗号","分隔多知识点，如：123,223;22（查询用knowledge_ids_query字段）',
  `knowledge_ids_query` varchar(300) NOT NULL DEFAULT '' COMMENT '对应的知识点(含父级知识点）ids,多id用,分隔,前后加,方便知识点查询',
  `tags` varchar(500) NOT NULL DEFAULT '' COMMENT '题目标签，多个标签用|分割，前后加|，方便检索',
  `difficulty` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '难度系数,两位小数',
  `reference` varchar(300) NOT NULL DEFAULT '' COMMENT '题目出处，如：2004年北京高考试题',
  `source` varchar(300) NOT NULL DEFAULT '' COMMENT '题目来源，如：xkw_22004',
  `extra_info` varchar(300) NOT NULL DEFAULT '' COMMENT 'json格式的扩展属性，如选词填空题的select_mode..',
  `is_chinese` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否中文题目',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-待审核；1-已审核可用；2-已删除弃用',
  `guid` varchar(40) NOT NULL DEFAULT '' COMMENT '唯一id,方便各环境数据同步',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  `tmp_content` varchar(500) NOT NULL DEFAULT '' COMMENT '临时字段，content的原始数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid` (`guid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `stage` (`stage`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `source` (`source`(100)) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='题库';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `read_article`;

CREATE TABLE `read_article` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '规整后的content，单词用 #分割，段落用 @@分割',
  `question` text NOT NULL COMMENT '题目：[{"question":"题干" ,"no":"题号","options":[{"option":"A","content":"选项内容"}], "answer":"正确答案","analyses":"解析"}]',
  `word_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章长度，单词数',
  `question_num` int(10) NOT NULL DEFAULT '0' COMMENT '题目数量',
  `status` tinyint(11) NOT NULL DEFAULT '0' COMMENT '状态:0-未审核;3-已发布;',
  `expect_duration` int(10) NOT NULL DEFAULT '0' COMMENT '文章限时，秒',
  `new_word_ids` text NOT NULL COMMENT '生词，对应word表中的id, 多个用逗号分隔',
  `title` varchar(300) NOT NULL DEFAULT '' COMMENT '文章标题',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '文章等级',
  `abstract` varchar(300) NOT NULL DEFAULT '' COMMENT '摘要',
  `words_info` text NOT NULL COMMENT 'do_content里面单词（存在于word表中）信息[{"文中的形态":["搜索词","原型", "原型id", "原型级别","原型通用词意"]},...]',
  `phrases_info` text NOT NULL COMMENT '词组信息eq[{"phrase":"pick up", "type":"类型:0-不确定;1-人名；2-地名；3-需要学习的国家地名 4-其它等"}..，9-学习短语.","mean":"通用词意"]',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-阅读理解；2-完型填空；3-七选五;4-短文选词（填空）；5-短文选词（选择）；6-任务型阅读',
  `difficulty` int(10) NOT NULL DEFAULT '0' COMMENT '难度',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='阅读精练文章';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `read_content`;

CREATE TABLE `read_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `content` mediumtext NOT NULL COMMENT '详见：http://ams.gsudev.cn/#/home/project/inside/doc/detail?groupID=1&documentID=27&projectName=bingo-%E6%99%BA%E7%89%9B%E8%8B%B1%E8%AF%AD&projectID=2',
  `step_num` int(10) NOT NULL DEFAULT '0' COMMENT '学习总步数',
  `practice_article_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '精选训练阅读ids',
  `check_article_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '阅读闯关阅读ids',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='阅读精讲内容';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `read_course`;

CREATE TABLE `read_course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'wordset id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '课程名字',
  `unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '单元总数',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '当前所用版本号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `wordset_id` (`wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='精练阅读课程';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `read_study_history`;

CREATE TABLE `read_study_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'student id',
  `unit_shorthand_read_id` int(10) NOT NULL DEFAULT '0' COMMENT 'unit_shorthand_read id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'wordset id',
  `read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_course id',
  `read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_unit id',
  `read_content_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_content id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `detail` text NOT NULL COMMENT '学生答题内容',
  `student_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学生类型：1-正式；2-测试',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `unit_shorthand_read_id` (`unit_shorthand_read_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='阅读精讲精练学习记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `read_unit`;

CREATE TABLE `read_unit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'wordset id',
  `read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read course id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号',
  `unit_name` varchar(100) NOT NULL DEFAULT '' COMMENT '单元名',
  `subhead` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `read_content_id` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲内容id',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '当前所用版本号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wordset_id` (`wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='精练阅读课程单元';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `region_price`;

CREATE TABLE `region_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区县价格';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `region_price_error`;

CREATE TABLE `region_price_error` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_price_id` int(10) NOT NULL DEFAULT '0' COMMENT 'region_price id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'user id',
  `types` varchar(50) NOT NULL DEFAULT '' COMMENT '错误类型',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '内容',
  `is_handle` tinyint(4) NOT NULL DEFAULT '0' COMMENT '处理状态：0-未处理，1-已处理',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区县价格报错信息';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `resource_feedback`;

CREATE TABLE `resource_feedback` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT 'ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-文章',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-正常；2-删除；',
  `pids` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `remark` varchar(500) NOT NULL COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(16) NOT NULL DEFAULT '' COMMENT '添加者',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源反馈信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `resource_version`;

CREATE TABLE `resource_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号:eq:1,2,3',
  `description` text NOT NULL COMMENT '升级信息',
  `word_block_url` varchar(255) NOT NULL DEFAULT '' COMMENT '资源的wordblockurl',
  `last_txt_url` varchar(255) NOT NULL DEFAULT '' COMMENT '资源最新txt文件的url',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='资源版本表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `sampling_vocabulary_word`;

CREATE TABLE `sampling_vocabulary_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '英文',
  `en_voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '英音发音地址',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词等级1-14',
  `answer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '答案',
  `option` varchar(500) NOT NULL DEFAULT '' COMMENT '选项:[{"option":"6","description":"最喜爱的"},{"option":"1","description":"公平的"}]',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'stage',
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='抽样测评词';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `sentence`;

CREATE TABLE `sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sentence` text NOT NULL COMMENT '句子',
  `voice_url` text NOT NULL COMMENT '发音url',
  `meaning` text NOT NULL COMMENT '中文意思',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT '句子的唯一标识，只读不可修改',
  `dig_all_sentence` text NOT NULL COMMENT '全拆分字段{"sentence":"挖掉单词的句子，每个挖掉的单词用#表示，句子之间用&&表示，空和空之间用空格表示","answer":"挖点单词的答案，用#分隔，顺序就是挖掉的顺序","confuse_split":"拆分混淆项用|分隔"}',
  `is_listen` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许出听力题：0-否，1-允许',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句；2-长句',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `ch_voice_url` varchar(500) NOT NULL DEFAULT '' COMMENT '中文发音url',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sentence_md5` (`guid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='句子基础表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `share_setting`;

CREATE TABLE `share_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区id',
  `review` text NOT NULL COMMENT '复习分享设置',
  `success` varchar(2000) NOT NULL DEFAULT '' COMMENT '分享成功设置',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='分享设置';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `st_student`;

CREATE TABLE `st_student` (
  `pk_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `pk` varchar(64) NOT NULL DEFAULT '' COMMENT '同一维度的唯一标识',
  `period` tinyint(4) NOT NULL DEFAULT '0' COMMENT '周期：10-总计;',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `word_familiar_num` int(10) NOT NULL DEFAULT '0' COMMENT '已熟悉单词数',
  `word_unfamiliar_num` int(10) NOT NULL DEFAULT '0' COMMENT '待熟悉单词数',
  `word_need_review_num` int(10) NOT NULL DEFAULT '0' COMMENT '待复习单词数',
  `word_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词总数,去重',
  `word_learned_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词记忆数,去重',
  `sentence_familiar_num` int(10) NOT NULL DEFAULT '0' COMMENT '已熟悉句子数',
  `sentence_unfamiliar_num` int(10) NOT NULL DEFAULT '0' COMMENT '待熟悉句子数',
  `sentence_need_review_num` int(10) NOT NULL DEFAULT '0' COMMENT '待复习句子数',
  `sentence_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '句子总数,去重',
  `sentence_learned_num` int(10) NOT NULL DEFAULT '0' COMMENT '句子记忆数,去重',
  `sentence_review_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习句子数',
  `article_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章总数',
  `article_read_num` int(10) NOT NULL DEFAULT '0' COMMENT '文章已读总数',
  `duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '总时长,秒',
  `word_review_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习单词数',
  `word_review_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '单词复习总时长,秒',
  `word_recite_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '单词识记总时长,秒',
  `word_practice_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '单词练习总时长,秒',
  `word_test_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '单词检查总时长,秒',
  `word_hurdle_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '（单词各种闯关时长+口语时长）,秒',
  `sentence_recite_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '句子识记总时长,秒',
  `sentence_hurdle_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '句子闯关总时长,秒',
  `sentence_review_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '句子复习总时长,秒',
  `article_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '阅读总时长,秒',
  `grammar_review_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '语法复习时长（秒）',
  `grammar_recite_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '语法识记时长（秒）',
  `grammar_hurdle_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '语法闯关时长（秒）',
  `grammar_practice_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '语法练习时长（秒）',
  `study_growth` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `enrol_vocabulary` int(10) NOT NULL DEFAULT '0' COMMENT '入学词汇量',
  `continuous_review_punch` int(10) NOT NULL DEFAULT '0' COMMENT '复习连续打卡天数',
  `continuous_read_punch` int(10) NOT NULL DEFAULT '0' COMMENT '阅读连续打卡天数',
  `fourteen_punch` int(10) NOT NULL DEFAULT '0' COMMENT '最近14天复习打卡天数',
  `thirty_punch` int(10) NOT NULL DEFAULT '0' COMMENT '最近30天复习打卡天数',
  `first_recite_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '首次识记日期',
  `last_study_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近学习时间',
  `last_review_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近复习时间',
  `yesterday_last_study_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '昨天最后学习时间',
  `yesterday_last_review_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '昨天最后复习时间',
  `preday_last_study_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '前天最后学习时间',
  `preday_last_review_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '前天最后复习时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `last_active_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近活跃时间',
  `phonetic_recite_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '音标识记时长（秒）',
  `phonetic_hurdle_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '音标闯关时长（秒）',
  `phonetic_practice_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '音标练习时长（秒）',
  `grammar_recite_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '语法已读单元数',
  `phonetic_recite_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '音标已读单元数',
  `ta_read_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '课文朗读记时长（秒）',
  `ta_retell_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '课文复述时长（秒）',
  `tas_follow_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '课文跟读时长（秒）',
  `listen_audio_duration` int(10) NOT NULL DEFAULT '0' COMMENT '听语音时长（秒）',
  `listen_sentence` int(10) NOT NULL DEFAULT '0' COMMENT '听句数',
  `listen_dictate_piece` int(10) NOT NULL DEFAULT '0' COMMENT '听力听写短文数',
  `read_recite_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练识记时长（秒）',
  `read_hurdle_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练闯关时长（秒）',
  `read_practice_duration` bigint(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练练习时长（秒）',
  `read_recite_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '阅读精讲精练已学单元数(去重)',
  UNIQUE KEY `pk_id` (`pk_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生学习st';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商父级链只是当前结点的父级，父级之间用“-”链接 1-2-3,包含自己的代理商',
  `sn` varchar(9) NOT NULL DEFAULT '' COMMENT '分校的编号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '校区类型：1-旗舰店；2-标准店；',
  `join_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '加盟方式:1-加盟机构;2-学习机体验店',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '门店名称',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '区县',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '地图定位地址',
  `family_address` varchar(200) NOT NULL DEFAULT '' COMMENT '详细地址（手动填入）',
  `longitude` varchar(16) NOT NULL COMMENT '经度',
  `latitude` varchar(16) NOT NULL COMMENT '维度',
  `v_longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '偏移经度',
  `v_latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '偏移维度',
  `wisdom_distance` int(11) NOT NULL DEFAULT '0' COMMENT '智能模式定位距离：米',
  `phone_wisdom_distance` int(11) NOT NULL DEFAULT '0' COMMENT '手机端智能模式定位距离：米',
  `is_phone_wisdom` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否允许手机端进行班组学习：1-是；0-否',
  `radius` int(11) NOT NULL DEFAULT '0' COMMENT '区域保护距离：米',
  `old_radius` int(11) NOT NULL DEFAULT '0' COMMENT '上一次的区域保护距离：米，只在过期的时候存一下',
  `single_distance` int(11) NOT NULL DEFAULT '0' COMMENT '1v1模式定位距离：米',
  `experience_card_num` int(10) NOT NULL DEFAULT '0' COMMENT '体验卡激活数量',
  `material_card_num` int(10) NOT NULL DEFAULT '0' COMMENT '教材卡激活数量',
  `comprehensive_card_num` int(10) NOT NULL DEFAULT '0' COMMENT '综合卡数量',
  `join_start_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟开始时间',
  `protect_end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '保护期结束时间',
  `join_end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '表示的是nickname字段，可修改',
  `is_change_review_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可以改变复习模式：0-不可以；1-可以',
  `primary_material` text NOT NULL COMMENT '门店小学教材版本，多个用'',''分隔',
  `middle_material` text NOT NULL COMMENT '门店初中教材版本，多个用'',''分隔',
  `high_material` text NOT NULL COMMENT '门店高中教材版本，多个用'',''分隔',
  `show_print_adv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示打印宣传文案',
  `book_adv` varchar(50) NOT NULL DEFAULT '' COMMENT '课本宣传文案',
  `syllabus_adv` varchar(50) NOT NULL DEFAULT '' COMMENT '考纲宣传文案',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `price_category_id` int(10) NOT NULL DEFAULT '0' COMMENT '价格单id',
  `discount` int(10) NOT NULL DEFAULT '100' COMMENT '折扣百分比:56%存56',
  `auth_limit` int(10) NOT NULL DEFAULT '0' COMMENT '余额（分）',
  `total_in_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计进账（分）',
  `total_course_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计消耗（分）',
  `total_deduct_fee` bigint(20) NOT NULL DEFAULT '0' COMMENT '累计扣减（分）',
  `course_fee_rate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程费分配比例',
  `remark` text NOT NULL COMMENT '管理后台备注',
  `is_export` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否导出：0-不导出，1-导出',
  `review_setting` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许校区更改强制复习数量：0-不允许；1-允许',
  `advanced_review_set` tinyint(4) NOT NULL DEFAULT '0' COMMENT '高级复习设置0-关闭；1-开启',
  `last_follow_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '最近跟进日期',
  `next_follow_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '下次跟进日期',
  `last_follow_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近跟进记录id',
  `ic_see_fee` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否能查看校区账户等信息：1-是；0-否',
  `occupy_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '占位状态：0-正常，1-占位；2-删除',
  `default_study_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词学习方式默认值：1-1对1，2-班组；',
  `entrance_test_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '词汇量测评设置：1-词汇量+记忆力+注意力；2-词汇量；',
  `whale_balance` bigint(10) NOT NULL DEFAULT '0' COMMENT '外教：余额（分）',
  `whale_total_recharge_fee` bigint(10) NOT NULL DEFAULT '0' COMMENT '累计充值外教费用：余额（分）',
  `only_join_whale` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否只加盟外教产品：1-是；-否；',
  `ic_region_protect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有区域保护：0-否；1-是',
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '合作方式：1-正式；2-试用；3-课程植入',
  `store_stage` tinyint(2) NOT NULL DEFAULT '0' COMMENT '门店当前所处阶段:1-选址中;2-营建中;3-试运营;4-正常运营;5-停止运营',
  `sales_name` varchar(32) NOT NULL DEFAULT '' COMMENT '销售',
  `sign_channel` varchar(200) NOT NULL DEFAULT '' COMMENT '签约渠道',
  `sign_company` tinyint(4) NOT NULL DEFAULT '0' COMMENT '签约公司：1-北京智牛闪学教育科技有限公司；2-光速智学（北京）科技有限公司',
  `sign_info` varchar(800) NOT NULL DEFAULT '' COMMENT '签约信息',
  `agreement` varchar(800) NOT NULL DEFAULT '' COMMENT '补充协议',
  `brand_policy` varchar(800) NOT NULL DEFAULT '' COMMENT '品牌服务费政策',
  `check_requirement` varchar(1000) NOT NULL DEFAULT '' COMMENT '考核标准',
  `ic_inspect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否适合考察：0、1',
  `phone_experience_wisdom_distance` int(11) NOT NULL DEFAULT '0' COMMENT '手机端体验班组距离：米',
  `is_phone_experience_wisdom` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否允许手机端进行班组体验：1-是；0-否',
  `allow_active_course_num` int(4) NOT NULL DEFAULT '50' COMMENT '允许激活课程数量',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '运营人员ID',
  `supporter` varchar(20) NOT NULL DEFAULT '' COMMENT '运营人员名称',
  `is_v1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是v1.0校区',
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `join_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加盟状态：1-加盟中；2-到期延期中；3-到期并延期结束六个月内；4-到期并已停用',
  `manager` varchar(20) NOT NULL DEFAULT '' COMMENT '负责人',
  `manager_id` int(10) NOT NULL DEFAULT '0' COMMENT '负责人id',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `exp_article` tinyint(4) NOT NULL DEFAULT '0' COMMENT '允许体验阅读文章:1-是；0-否',
  `exp_listen` tinyint(4) NOT NULL DEFAULT '0' COMMENT '允许体验听力课程：1-是；0-否',
  `account_num_10d` int(4) NOT NULL DEFAULT '0' COMMENT '体验店校区能激活10天卡数量',
  `account_num_3m` int(4) NOT NULL DEFAULT '0' COMMENT '体验店校区能激活3个月卡数量',
  `is_in_school` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否进校：1-是;0-否',
  `school_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学校类型：1-公里校;2-私立校',
  `price_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '价格单类型：1-按课程价格单定价;2-按年定价(内置价格/价格单);3-按学习机定价;',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='门店信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_alloc`;

CREATE TABLE `store_alloc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `origin_supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '原来的运营人员id',
  `new_supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '新的运营人员id',
  `allocator_id` int(10) NOT NULL DEFAULT '0' COMMENT '分配人id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运营校区分配';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_join`;

CREATE TABLE `store_join` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '加额度的代理商',
  `supagent_id` int(10) NOT NULL DEFAULT '0' COMMENT '扣额度的代理商',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商父级链',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '多店代理的分校ID',
  `start_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟日期',
  `end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期',
  `duration` varchar(50) NOT NULL DEFAULT '' COMMENT '加盟期限：文本',
  `join_fee` int(10) NOT NULL DEFAULT '0' COMMENT '加盟费用（分）',
  `auth_limit` int(10) NOT NULL DEFAULT '0' COMMENT '授权额度（分）',
  `prepay_fee` int(10) NOT NULL DEFAULT '0' COMMENT '下级预付款（分）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分校加盟记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_material`;

CREATE TABLE `store_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `creator_id` int(10) NOT NULL DEFAULT '0' COMMENT '添加人id',
  `scene` tinyint(4) NOT NULL DEFAULT '0' COMMENT '场景:1-微信聊天;2-微信朋友圈;3-易拉宝;4-单页;5-新媒体;6-线下其他;7-线上其他',
  `top_tag_id` int(10) NOT NULL DEFAULT '0' COMMENT '一级分类标签id',
  `second_tag_id` int(10) NOT NULL DEFAULT '0' COMMENT '二级分类标签id',
  `pids` text NOT NULL COMMENT '图片objects',
  `vids` text NOT NULL COMMENT '视频objects',
  `fids` text NOT NULL COMMENT '文件objects',
  `description` varchar(2000) NOT NULL DEFAULT '' COMMENT '描述',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `activity_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '活动类型',
  `recruit_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '招生类型',
  `score` int(4) NOT NULL DEFAULT '0' COMMENT '打分',
  PRIMARY KEY (`id`),
  KEY `store_tag` (`store_id`,`top_tag_id`,`second_tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校区资料';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_operate_info`;

CREATE TABLE `store_operate_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `version` int(10) NOT NULL DEFAULT '0' COMMENT '版本，0为最新，其余为创建时间戳',
  `operate_project` varchar(100) NOT NULL DEFAULT '' COMMENT '运营项目',
  `other_project` varchar(100) NOT NULL COMMENT '其他运营项目',
  `manager` varchar(20) NOT NULL DEFAULT '' COMMENT '英语项目负责人',
  `mobile` varchar(18) NOT NULL DEFAULT '' COMMENT '负责人联系方式',
  `position` varchar(10) NOT NULL DEFAULT '' COMMENT '负责人校区岗位',
  `organize_description` varchar(100) NOT NULL DEFAULT '' COMMENT '校区组织架构说明',
  `salary_description` varchar(100) NOT NULL DEFAULT '' COMMENT '校区薪酬说明',
  `student_num` int(10) NOT NULL DEFAULT '0' COMMENT '学生人数',
  `area` int(10) NOT NULL DEFAULT '0' COMMENT '校区面积m2',
  `rent` int(10) NOT NULL DEFAULT '0' COMMENT '月租金元',
  `decorate_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '校区装修打分',
  `decorate_pids` text NOT NULL COMMENT '装修图片objects',
  `decorate_vids` text NOT NULL COMMENT '装修视频objects',
  `price_pids` text NOT NULL COMMENT '价格图片objects',
  `price_fids` text NOT NULL COMMENT '价格文件objects',
  `cooperation_fids` text NOT NULL COMMENT '合作文件objects',
  `ic_license` tinyint(4) NOT NULL DEFAULT '0' COMMENT '办学许可证：0、1',
  `ic_inspect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否适合考察：0、1',
  `ic_zhiniu` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否只做智牛：0、1',
  `price_description` varchar(100) NOT NULL DEFAULT '' COMMENT '价格描述',
  `contract_pids` text NOT NULL COMMENT '合同图片objects',
  `license_pids` text NOT NULL COMMENT '营业执照图片objects',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `store` (`store_id`,`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校区运营备案';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_prolong`;

CREATE TABLE `store_prolong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区ID',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `old_store_join_end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '旧的校区加盟到期',
  `new_store_join_end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '新的校区加盟到期',
  `old_agent_join_end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '旧的代理商加盟到期',
  `new_agent_join_end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '新的代理商加盟到期',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校区加盟延期记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_promotion_info`;

CREATE TABLE `store_promotion_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `show_print_copywriting` tinyint(4) NOT NULL DEFAULT '0' COMMENT '显示打印宣传文案：0-不显示，1-显示',
  `book_copywriting` varchar(50) NOT NULL DEFAULT '' COMMENT '课本宣传文案',
  `syllabus_copywriting` varchar(50) NOT NULL DEFAULT '' COMMENT '考纲宣传文案',
  `share_hint_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分享成功提示：1-自定义提示，2-系统通用提示',
  `share_hint_content` varchar(200) NOT NULL DEFAULT '' COMMENT '分享提示内容',
  `share_valid_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '分享提示有效开始日期',
  `share_invalid_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '分享提示截至日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店推广信息配置表 ';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `store_support_watch`;

CREATE TABLE `store_support_watch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `support_material_id` int(10) NOT NULL DEFAULT '0' COMMENT 'support_material id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent user id',
  `sign` varchar(30) NOT NULL DEFAULT '' COMMENT 'user_id-support_material_id',
  `play_duration` int(10) NOT NULL DEFAULT '0' COMMENT '观看时长(秒)',
  `play_num` int(10) NOT NULL DEFAULT '0' COMMENT '观看次数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `current_play_at` int(10) NOT NULL DEFAULT '0' COMMENT '当前视频播放位置(秒)',
  `max_play_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最大观看时长(秒)',
  `proportion` smallint(10) NOT NULL DEFAULT '0' COMMENT '时长占比，最多四位数',
  PRIMARY KEY (`id`),
  KEY `support_material_id` (`support_material_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校区观看培训资料统计';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(15) NOT NULL DEFAULT '' COMMENT '学生的编号',
  `teacher_user_id` varchar(200) NOT NULL DEFAULT '' COMMENT '教师id，-1-,-2-',
  `class_id` int(10) NOT NULL DEFAULT '0' COMMENT '班级id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `pad_mode` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'PAD端学习模式:0-未设置:1-智能学习;2-点读学习',
  `phone_mode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '手机端学习模式:0-未设置;1-智能学习;2-点读学习;3-禁止学习',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商父级链只是当前结点的父级，父级之间用“-”链接 1-2-3,包含自己的代理商',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：0-未激活；1-体验中；2-体验到期；3-在读；4-课程过期；5-取消激活',
  `is_train` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是培训账号，1-是；0-不是',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '学生账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `session_id` varchar(48) NOT NULL DEFAULT '' COMMENT '用户pad端session_id',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '登录密码',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币角:10倍金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `salt` varchar(16) NOT NULL DEFAULT '' COMMENT '密码盐',
  `gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别：1-男；2-女',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学段：1-小学；2-初中；3-高中',
  `grade` varchar(4) NOT NULL DEFAULT '' COMMENT '年级:三年级',
  `school` varchar(50) NOT NULL DEFAULT '' COMMENT '就读学校',
  `sound_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '学生设置发音音标类型：1-美音；2-英音',
  `last_test_level` int(20) NOT NULL DEFAULT '0' COMMENT '上一次词汇量检测等级',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `last_study_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后学习时间',
  `wordset_activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次激活非体验课程卡时间',
  `experience_activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次激活体验课程的时间',
  `experience_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '体验到期日期',
  `wordset_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '课程到期日期',
  `left_experience_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余体验次数',
  `total_experience_days` int(10) NOT NULL DEFAULT '0' COMMENT '总共可以体验的天数',
  `total_experience_num` int(10) NOT NULL DEFAULT '0' COMMENT '总共可以体验次数',
  `experience_num` int(10) NOT NULL DEFAULT '0' COMMENT '体验过次数',
  `print_word_history` varchar(150) NOT NULL DEFAULT '' COMMENT '格式：课程ID|单元序号',
  `print_sentence_history` varchar(150) NOT NULL DEFAULT '' COMMENT '格式：课程ID|单元序号,多个逗号隔开',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源：1-进校；2-到店咨询；3-线上咨询；4-转介绍；5-其他',
  `introducer` varchar(20) NOT NULL DEFAULT '' COMMENT '介绍人姓名',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `condition` varchar(500) NOT NULL DEFAULT '' COMMENT '学员情况',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '首次激活的省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '首次激活的市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT '首次激活的区县',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '首次激活的详细地址',
  `parents` text NOT NULL COMMENT '家长信息：json格式[{"name":"姓名","mobile":"手机号","relationship":"亲属关系"}]',
  `register_province` varchar(16) NOT NULL DEFAULT '' COMMENT '注册省',
  `register_city` varchar(20) NOT NULL DEFAULT '' COMMENT '注册市',
  `register_district` varchar(20) NOT NULL DEFAULT '' COMMENT '注册区',
  `register_address` varchar(500) NOT NULL DEFAULT '' COMMENT '注册地址',
  `register_longitude` varchar(16) NOT NULL COMMENT '经度',
  `register_latitude` varchar(16) NOT NULL COMMENT '维度',
  `wisdom_distance` int(11) NOT NULL DEFAULT '0' COMMENT '智能模式定位距离：米',
  `phone_wisdom_distance` int(11) NOT NULL DEFAULT '0' COMMENT '手机端智能模式定位距离：米',
  `is_phone_wisdom` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否允许手机端进行班组学习：1-是；0-否',
  `single_distance` int(11) NOT NULL DEFAULT '0' COMMENT '1v1模式定位距离：米',
  `is_attention` tinyint(4) NOT NULL DEFAULT '0' COMMENT '关注：0-未关注；1-关注',
  `last_student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '最新学生单元id',
  `first_wordset_activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次购课日期',
  `join_store_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入校区的时间',
  `exchange_goods_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近兑换时间',
  `spell_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '拼写设置：1-有拼写；2-无拼写',
  `review_spell_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '复习拼写设置：1-有拼写；2-无拼写',
  `getui_push_id` varchar(32) NOT NULL DEFAULT '' COMMENT '个推用户push_id',
  `review_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '复习设置：1-普通模式；2-答题模式',
  `is_finish` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否结课：0-没有结课;1-结课',
  `last_finish_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次结课时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `account_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '账号类型：1-正常注册，2-后台生成',
  `experience_use_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '体验卡使用时间',
  `combine_exercise` tinyint(4) NOT NULL DEFAULT '2' COMMENT '组合拼写练习设置：1-只练习基础必备拼写词汇；2-练习所有词汇',
  `listen_write_exercise` tinyint(4) NOT NULL DEFAULT '2' COMMENT '听写默写练习设置：1-只练习基础必备拼写词汇；2-练习所有词汇',
  `article_period` tinyint(4) NOT NULL DEFAULT '1' COMMENT '阅读学习周期：1-日，2-周',
  `article_num` int(10) NOT NULL DEFAULT '2' COMMENT '周期内的阅读篇数',
  `article_limit` int(10) NOT NULL DEFAULT '5' COMMENT '每日阅读篇数最大值',
  `read_level` int(10) NOT NULL DEFAULT '0' COMMENT '阅读等级',
  `read_level_increment` int(10) NOT NULL DEFAULT '0' COMMENT '阅读等级人为修正值',
  `ic_entrance` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否进行过入学测评：1-是；0-否',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `plaintext_password` varchar(20) NOT NULL DEFAULT '' COMMENT '体验账号明文密码',
  `last_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后学习student_lead_wordset_id',
  `word_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词状态：0-未激活；1-体验中；2-体验到期；3-在读；4-课程过期；5-取消激活',
  `sentence_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子状态：0-未激活；1-体验中；2-体验到期；3-在读；4-课程过期；5-取消激活',
  `grammar_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '语法状态：0-未激活；1-体验中；2-体验到期；3-在读；4-课程过期；5-取消激活',
  `phonetic_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '音标状态：0-未激活；1-体验中；2-体验到期；3-在读；4-课程过期；5-取消激活',
  `listen_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '音标状态：0-未激活；1-体验中；2-体验到期；3-在读；4-课程过期；5-取消激活',
  `word_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '单词到期日期',
  `sentence_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '句子到期日期',
  `grammar_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '语法到期日期',
  `phonetic_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '音标到期日期',
  `listen_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '音标到期日期',
  `pad_remote` tinyint(4) NOT NULL DEFAULT '0' COMMENT '个人平板电脑远程学:0,1',
  `pad_sn` varchar(128) NOT NULL DEFAULT '' COMMENT '个人平板sn',
  `pad_auth_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '个人平板电脑授权开始时间',
  `pad_auth_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '个人平板电脑授权结束时间',
  `open_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '按年定价开始时间',
  `open_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '按年定价结束时间',
  `is_lock` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁用：1-是；0-否；',
  `last_finish_rate` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次结课正确率',
  `last_lesson_duration` smallint(4) NOT NULL DEFAULT '0' COMMENT '最近一次结课授课时长: 小时',
  `has_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否录入过成绩：1-是；2-否',
  `entrance_grade` varchar(6) NOT NULL DEFAULT '' COMMENT '入学年级:三年级',
  `is_excellent_case` tinyint(4) NOT NULL DEFAULT '0' COMMENT '优秀案例：0-不是；1-是',
  `school_class` varchar(20) NOT NULL DEFAULT '' COMMENT '学校班级',
  `phone_experience_wisdom_distance` int(11) NOT NULL DEFAULT '0' COMMENT '手机端体验班组距离：米',
  `is_phone_experience_wisdom` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否允许手机端进行班组体验：1-是；0-否',
  `headquarters_id` int(10) NOT NULL DEFAULT '0' COMMENT '总部id',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `wechat` varchar(64) NOT NULL DEFAULT '' COMMENT '微信',
  `is_invalid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否失效：0-未失效，1-已失效',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  KEY `class_id` (`class_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_achievement`;

CREATE TABLE `student_achievement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `school` varchar(50) NOT NULL DEFAULT '' COMMENT '学生学校',
  `grade` varchar(4) NOT NULL DEFAULT '' COMMENT '年级:三年级',
  `entrance_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '入学考试类型：1-单元考试；2-月考；3-期中考试；4-期末考试；5-开学考试；6-小升初；7-中考；8-高考；9-模拟考试；10-联考；11-其他',
  `entrance_score` smallint(6) NOT NULL DEFAULT '-1' COMMENT '入学分数',
  `entrance_total_score` varchar(20) NOT NULL DEFAULT '-1' COMMENT '入学试卷总分',
  `entrance_pids` text NOT NULL COMMENT '图片objects',
  `examine_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '本次考试类型：1-单元考试；2-月考；3-期中考试；4-期末考试；5-开学考试；6-小升初；7-中考；8-高考；9-模拟考试；10-联考；11-其他',
  `examine_score` smallint(6) NOT NULL DEFAULT '-1' COMMENT '入学分数',
  `examine_total_score` varchar(20) NOT NULL DEFAULT '-1' COMMENT '试卷总分',
  `examine_pids` text NOT NULL COMMENT '图片objects',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者登陆名',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生入学信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_activate_course`;

CREATE TABLE `student_activate_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` varchar(200) NOT NULL DEFAULT '' COMMENT '学生id',
  `class_id` int(10) NOT NULL DEFAULT '0' COMMENT '班级id',
  `study_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-未开始；1-未学完；2-已学完；',
  `grade` varchar(10) NOT NULL DEFAULT '' COMMENT '年级',
  `entrance_vocabulary` int(10) NOT NULL COMMENT '入学词汇量',
  `memory_level` varchar(10) NOT NULL DEFAULT '' COMMENT '记忆力',
  `attention_level` varchar(10) NOT NULL DEFAULT '' COMMENT '注意力',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商父级链只是当前结点的父级，父级之间用“-”链接 1-2-3,包含自己的代理商',
  `word_course` text NOT NULL COMMENT '单词课程信息，json',
  `sentence_course` text NOT NULL COMMENT '短语句型课程信息，json',
  `article_course` text NOT NULL COMMENT '智能分级阅读课程信息，json',
  `grammar_course` text NOT NULL COMMENT '语法课程信息，json',
  `last_study_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次学习时间',
  `last_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次复习时间',
  `last_buy_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次购课时间',
  `admission_info` varchar(200) NOT NULL DEFAULT '' COMMENT '入学成绩',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `is_train` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是不是培训账号，1-是；0-不是',
  `ic_entrance` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否做过入学测评：1-是；0-否;',
  `study_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学单词数',
  `total_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '总单词数',
  `study_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学句子数',
  `total_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '总句子数',
  `study_grammar_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学语法单元数',
  `total_grammar_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '总语法单元数',
  `study_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学文章数',
  `total_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '总购买文章数',
  `recent_30_wr_score` int(10) NOT NULL DEFAULT '0' COMMENT '近30天单词复习正确率',
  `listen_course` text NOT NULL COMMENT '听力课程信息，json',
  `read_course` text NOT NULL COMMENT '阅读精讲课程信息，json',
  `left_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余单词数',
  `left_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余短语句型数',
  `left_grammar_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余语法单元数',
  `left_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余分级阅读文章数',
  `study_read_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学阅读精讲单元数',
  `total_read_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '总阅读精讲单元数',
  `left_read_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '剩余阅读精讲单元数',
  `is_invalid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学生是否失效：0-未失效；1-已失效',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生已激活课程列表（离线统计）';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_archives`;

CREATE TABLE `student_archives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型',
  `pids` text NOT NULL COMMENT '图片objects',
  `vids` text NOT NULL COMMENT '视频objects',
  `teacher_comment` varchar(1100) NOT NULL DEFAULT '' COMMENT '老师点评',
  `remark` varchar(1100) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生档案';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_article`;

CREATE TABLE `student_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `article_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章课程表id',
  `complete_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次完成时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '耗时：秒，首次',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总题数',
  `correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '答对题数，首次',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数：首次',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未学；2-已完成',
  `question` text NOT NULL COMMENT '题目：[{"no":"题号","options":"B,C,D,A","answer":"学生答案"}]，首次',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间 首次',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间 首次',
  `new_word_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '生词，对应word表中的id, 多个用逗号分隔',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '阅读篇数号',
  `is_choose_word` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否选择过生词：0-未选择；1-选择过',
  `total_duration` int(10) NOT NULL DEFAULT '0' COMMENT '阅读当前文章总共的时长：秒',
  `last_word_shorthand_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '单词最后学习时间',
  `last_score` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次正确率',
  `last_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次答题时长',
  `last_start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间 最后一次',
  `last_end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间 最后一次',
  `click_new_word_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '生词，对应word表中的id, 多个用逗号分隔',
  `article_level` int(10) NOT NULL DEFAULT '0' COMMENT '首次阅读文章等级',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `bind_article_level` int(10) NOT NULL DEFAULT '0' COMMENT '在绑定文章的时候当前文章的level',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_article` (`student_id`,`article_id`) USING BTREE,
  KEY `st_time` (`start_at`,`student_id`) USING BTREE,
  KEY `article_course_id` (`article_course_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生阅读理解表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_award`;

CREATE TABLE `student_award` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '奖励金币数',
  `reason` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-认真学习；2-复习打卡奖励；3-转介绍奖励；4-其他',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人，表示的是nickname字段，可修改',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生奖励表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_bulletin`;

CREATE TABLE `student_bulletin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `detail` text NOT NULL COMMENT '提分海报',
  `qr_code` varchar(100) NOT NULL DEFAULT '' COMMENT '喜报二维码',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者登陆名',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生喜报信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_check_read`;

CREATE TABLE `student_check_read` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `read_article_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_article id',
  `read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_unit id',
  `read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_course id',
  `student_read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_unit id',
  `student_read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_course id',
  `complete_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次完成时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '耗时：秒，首次',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总题数',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '答对题数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数：首次',
  `question` text NOT NULL COMMENT '题目：[{"no":"题号","answer":"学生答案","is_right":"0-错误；1-正确"}]，首次',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间 首次',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间 首次',
  `read_num` int(10) NOT NULL DEFAULT '0' COMMENT '练习次数',
  `total_duration` int(10) NOT NULL DEFAULT '0' COMMENT '阅读当前文章总共的时长：秒',
  `last_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次正确题数',
  `last_score` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次正确率',
  `last_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次答题时长',
  `last_start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间 最后一次',
  `last_end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间 最后一次',
  `last_question` text NOT NULL COMMENT '最后题目：[{"no":"题号","answer":"学生答案","is_right":"0-错误；1-正确"}]，首次',
  `last_coin` int(10) NOT NULL DEFAULT '0' COMMENT '最后获得金币数',
  `new_word_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '生词，对应word表中的id, 多个用逗号分隔',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `st_time` (`student_id`,`created_at`) USING BTREE,
  KEY `sru_id` (`student_read_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生闯关精读文章表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_client_config`;

CREATE TABLE `student_client_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '-9999表示公共配置',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `config` text NOT NULL COMMENT 'json:[{"key": "", "value": ""}],key和值都不确定，多对',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生客户端配置';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_coin_bill`;

CREATE TABLE `student_coin_bill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL DEFAULT '0' COMMENT '学生ID',
  `type` smallint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-智能学习；2-词义闯关；3-听写；4-默写；5-复习；6-点读学习；7-句子学习；8-短语闯关；9-长句闯关；10-句子复习；11-组合拼练习；12-听写练习；13-默写练习；14-连连看练习；15-阅读；16-金币奖励；17-语法学习；18-语法闯关；19-语法训练；20-语法复习；21-兑换扣费；22-练习听音选中文；23-口语练习；24-口语闯关；25-课文朗读；26-课文跟读；27-课文复述；28-音标课堂；29-跟读训练；30-辨音训练；31-音标闯关',
  `study_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '学习时间',
  `link_id` text NOT NULL COMMENT '关联表ID，都是大表，对于复习的话是这次复习的所有ID，1、6-unit_shorthand_word_id,2-unit_check_id,3-unit_dictate_id,4-unit_write_id,5-student_review_word_id',
  `detail` text NOT NULL COMMENT '详细记录，记录一些必要信息',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '本次获得的金币角',
  `add_coin` int(10) NOT NULL DEFAULT '0' COMMENT '增加的金币数（扣减和翻倍前的）',
  `deduct_coin` int(11) NOT NULL DEFAULT '0' COMMENT '本次扣减费用（不翻倍）',
  `total_coin` int(11) NOT NULL DEFAULT '0' COMMENT '总的金币角',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `student` (`student_id`,`study_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='金币对账表';

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
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生金币兑换表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_finish_class`;

CREATE TABLE `student_finish_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生ID',
  `finish_rate` int(10) NOT NULL DEFAULT '0' COMMENT '结课正确率',
  `summarize` text NOT NULL COMMENT '结课总结',
  `finish_pids` text NOT NULL COMMENT '学员照片（可能是多个）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `lesson_duration` smallint(4) NOT NULL DEFAULT '0' COMMENT '授课时长: 小时',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '结课总结',
  `scene_vids` varchar(500) NOT NULL DEFAULT '' COMMENT '结课现场视频ID',
  `scene_pids` varchar(500) NOT NULL DEFAULT '' COMMENT '结课现场图片id,多个用英文逗号分隔',
  `diploma_pids` varchar(500) NOT NULL DEFAULT '' COMMENT '结课毕业证图片id,多个用英文逗号分隔',
  `parent_reflections` varchar(500) NOT NULL DEFAULT '' COMMENT '家长感言',
  `student_reflections` varchar(500) NOT NULL DEFAULT '' COMMENT '学生感言',
  `other` varchar(500) NOT NULL DEFAULT '' COMMENT '其他',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区ID',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生结课表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_grammar_statistics`;

CREATE TABLE `student_grammar_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `grammar_question_id` int(10) NOT NULL DEFAULT '0' COMMENT '语法题id',
  `grammar_difficulty` double NOT NULL DEFAULT '0' COMMENT '句子的记忆难度λ',
  `grammar_review_frequency` double NOT NULL DEFAULT '0' COMMENT '句子的遗忘指数β，如果句子是熟记的话该值是0.1，否则根据算法算出来',
  `highest_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '最高级别词库id',
  `last_unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '最后学习的词库单元号',
  `shorthand_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记次数',
  `shorthand_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记正确次数',
  `shorthand_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记错误次数',
  `review_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习正确次数',
  `review_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习错误次数',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '闯关次数',
  `check_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '检查正确次数',
  `check_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '检查错误次数',
  `last_check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最后一次检查状态：1-正确；2-错误',
  `review_days` int(10) NOT NULL DEFAULT '0' COMMENT '复习的天数，每次重新识记会重置',
  `last_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次复习时间',
  `next_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下一次正常复习时间',
  `last_wrong_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最新错误时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_grammar` (`student_id`,`grammar_question_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生语法题统计表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_grammar_unit`;

CREATE TABLE `student_grammar_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生课程总表id',
  `student_lead_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元父表ID',
  `grammar_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-未学习；2-学习中；3-学完未测；4-已测试未通过；5-已测通过',
  `study_step` int(10) NOT NULL DEFAULT '0' COMMENT '首次学到哪一步',
  `total_step_num` int(10) NOT NULL DEFAULT '0' COMMENT '总共语法数目',
  `last_shorthand_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次学习时间',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '闯关次数',
  `last_unit_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关unit_check的ID',
  `highest_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '本单元闯关最高正确率',
  `first_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次检闯关确率',
  `last_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关正确率',
  `last_check_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次闯关时间',
  `exercise_num` int(10) NOT NULL DEFAULT '0' COMMENT '练习次数',
  `last_unit_exercise_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关unit_exercise的ID',
  `highest_exercise_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '本单元练习最高正确率',
  `first_exercise_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次练习确率',
  `last_exercise_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次练习正确率',
  `last_exercise_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次练习时间',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '课本版本号 1，2，3...',
  `is_remove` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `first_right` varchar(500) NOT NULL DEFAULT '' COMMENT '学习题目首次答对题号，用逗号分隔',
  `study_num` int(10) NOT NULL DEFAULT '0' COMMENT '学习次数',
  `last_study_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次学习正确率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生语法单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_lead_unit`;

CREATE TABLE `student_lead_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库句子主表id',
  `student_word_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_wordset表id',
  `student_sentence_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库句子表id',
  `grammar_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生语法课程id',
  `phonetic_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生音标课程id',
  `student_read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_course id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `last_shorthand_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后识记时间（包括单词和句子）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_lead_wordset_id` (`student_lead_wordset_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生单元总表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_lead_wordset`;

CREATE TABLE `student_lead_wordset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `is_have_word` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有单词课程：0-没有，1-有',
  `is_have_sentence` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有句子课程：0-没有，1-有',
  `is_have_grammar` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有语法课程：0-没有，1-有',
  `is_have_phonetic` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有音标课程：0-没有，1-有',
  `is_have_listen` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有听力：0-没有；1-有',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近激活时间',
  `word_invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '单词到期时间',
  `sentence_invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '句子到期时间',
  `article_invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '文章到期时间',
  `grammar_invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '语法课程到期时间',
  `phonetic_invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '音标课程到期时间',
  `listen_invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '听力过期时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程类型：1-单词/短语句型；2-真题精读；3-听力课程；4-阅读精练',
  `is_have_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有精练阅读：0-没有；1-有',
  `read_invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '阅读精练到期时间',
  `official_first_valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '正式课程首次激活时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `student_wordset` (`student_id`,`wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生课程总表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_learned_word`;

CREATE TABLE `student_learned_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '课本id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单词课本id',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生总课本id',
  `wordset_word_id` int(10) NOT NULL DEFAULT '0' COMMENT '单词id',
  `choose_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '选词时间',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '购买词库版本号，1，2，3...',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '单词id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_hard` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是难词：0-不是；1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生学前已会单词表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_lesson_info`;

CREATE TABLE `student_lesson_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '代理商id',
  `class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '班级id',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `class_lesson_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '班级上课id',
  `team_name` varchar(150) NOT NULL DEFAULT '' COMMENT '团队名字',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `study_new_word` int(10) NOT NULL DEFAULT '0' COMMENT '新学习单词数',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始上课时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下课时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `class_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '班级分组id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_classes_lesson_id` (`student_id`,`class_lesson_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `classes_lesson_id` (`class_lesson_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生上课表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_compose`;

CREATE TABLE `student_listen_compose` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0',
  `sub_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生听力子课程id',
  `student_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生试卷id',
  `student_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student listen piece id',
  `listen_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'listen piece id',
  `score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '得分',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '用时',
  `listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '听听力时长',
  `listen_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '听句数',
  `listen_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '听词数',
  `last_listen_word` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听词数',
  `last_listen_sentence` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听句数',
  `last_listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听听力时长',
  `last_duration` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交用时',
  `compose_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '句子锚点',
  `question_num` int(10) NOT NULL DEFAULT '0' COMMENT '填空数',
  `correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确填空数',
  `mistake_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误填空数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-未完成;2:-已完成',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币角',
  `detail` text NOT NULL COMMENT '结果详情{sentence_id:[[学生答案],duration]}',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `setting` varchar(50) NOT NULL DEFAULT '' COMMENT '单句听写配置:循环次数,间隔,语速设置,自动播放下一句:0-不自动;1-自动',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_piece_id` (`student_piece_id`) USING BTREE,
  KEY `study_time` (`student_id`,`start_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力选词组句表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_course`;

CREATE TABLE `student_listen_course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生ID',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'wordset_id',
  `listen_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'listen_course表ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未激活；2-已激活；3-已过期；4-未激活已过期；5-取消激活',
  `valid_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_lead_wordset表id',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `prolong_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '延期到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力课程表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_dictate`;

CREATE TABLE `student_listen_dictate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0',
  `sub_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生听力子课程id',
  `student_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生试卷id',
  `student_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student listen piece id',
  `listen_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'listen piece id',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '用时',
  `listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '听听力时长',
  `listen_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '听句数',
  `listen_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '听词数',
  `last_listen_word` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听词数',
  `last_listen_sentence` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听句数',
  `last_listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听听力时长',
  `last_duration` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交用时',
  `step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '步骤',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-未完成;2:-已完成',
  `dictate_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '锚点',
  `setting` varchar(50) NOT NULL DEFAULT '' COMMENT '配置:循环次数,间隔,语速设置,自动播放下一句:0-不自动;1-自动',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_piece_id` (`student_piece_id`) USING BTREE,
  KEY `study_time` (`student_id`,`start_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听写全文表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_dictate_pic`;

CREATE TABLE `student_listen_dictate_pic` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0',
  `student_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生试卷id',
  `student_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student listen piece id',
  `listen_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'listen piece id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-未完成;2:-已完成',
  `pids` varchar(600) NOT NULL DEFAULT '' COMMENT '图片地址：多个用逗号分割',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币角',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_piece_id` (`student_piece_id`) USING BTREE,
  KEY `study_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听写全文图片';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_history`;

CREATE TABLE `student_listen_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0',
  `student_paper_id` int(10) NOT NULL DEFAULT '0',
  `student_piece_id` int(10) NOT NULL DEFAULT '0',
  `study_id` int(10) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-测试;2-选词组句;3-听写;4-听写图;5-分句复述;6-全文朗读',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-未完成;2-已完成',
  `anchor` int(10) NOT NULL DEFAULT '0' COMMENT '锚点',
  `score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '得分',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '用时',
  `listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '听听力时长',
  `listen_sentence` int(10) NOT NULL DEFAULT '0' COMMENT '听句数',
  `listen_word` int(10) NOT NULL DEFAULT '0' COMMENT '听词数',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `study_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力学习记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_paper`;

CREATE TABLE `student_listen_paper` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sub_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生听力子课程id',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `listen_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT '听力paper id',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '试卷序号',
  `last_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '听力paper id',
  `question_num` int(10) NOT NULL DEFAULT '0' COMMENT '小题数量',
  `piece_num` int(10) NOT NULL DEFAULT '0' COMMENT '短文数量',
  `total_duration` int(10) NOT NULL DEFAULT '0' COMMENT '累计用时',
  `total_listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '累计听听力时长',
  `total_listen_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '累计听句数',
  `total_listen_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '累计听词数',
  `total_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '总分',
  `first_check_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '首次测试得分',
  `last_check_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '最近测试得分',
  `highest_check_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '最高测试得分',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '测试次数',
  `compose_num` int(10) NOT NULL DEFAULT '0' COMMENT '已组句短文数量',
  `dictate_num` int(10) NOT NULL DEFAULT '0' COMMENT '已全文听写短文数量',
  `retell_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '已分句复述短文数量',
  `retell_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '已短文朗读短文数量',
  `average_calc_data` varchar(500) NOT NULL DEFAULT '' COMMENT '用于计算平均分的中间数据',
  `check_average` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '测试平均分',
  `compose_average` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组句平均分',
  `retell_sentence_average` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分句复述平均分',
  `retell_article_average` tinyint(4) NOT NULL DEFAULT '0' COMMENT '短文朗读平均分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_course_paper` (`sub_course_id`,`listen_paper_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力课程试卷';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_paper_check`;

CREATE TABLE `student_listen_paper_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sub_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生听力子课程id',
  `student_id` int(10) NOT NULL DEFAULT '0',
  `student_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student listen paper id',
  `listen_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT '听力试卷id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-未完成;2-已完成',
  `total_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '总分',
  `score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '得分',
  `question_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '小题数量',
  `correct_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '答对数量',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币角',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `check_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '锚点pieceId',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '用时',
  `listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '听听力时长',
  `listen_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '听句数',
  `listen_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '听词数',
  `last_duration` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交用时',
  `last_listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听听力时长',
  `last_listen_sentence` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听句数',
  `last_listen_word` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听词数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_paper_id` (`student_paper_id`) USING BTREE,
  KEY `study_time` (`student_id`,`start_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力测试结果';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_part_check`;

CREATE TABLE `student_listen_part_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0',
  `check_id` int(10) NOT NULL DEFAULT '0' COMMENT 'paper check',
  `student_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student listen paper id',
  `listen_part_id` int(10) NOT NULL DEFAULT '0',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '序号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:详见listen_part',
  `score_desc` varchar(100) NOT NULL DEFAULT '' COMMENT '分数描述',
  `total_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT 'part总分',
  `score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT 'part得分',
  `question_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '小题数量',
  `correct_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '答对数量',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '用时',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `check_id` (`check_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力测试part结果';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_piece`;

CREATE TABLE `student_listen_piece` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `sub_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生听力子课程id',
  `listen_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT '听力试卷id',
  `student_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生试卷id',
  `listen_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT '听力短文id',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '序号',
  `part_no` int(10) NOT NULL DEFAULT '0' COMMENT 'part序号',
  `paper_no` int(10) NOT NULL DEFAULT '0' COMMENT '试卷序号',
  `name` varchar(32) NOT NULL DEFAULT '0' COMMENT '名称:第6-8小题',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'part类型:详见listen part',
  `total_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '短文总分',
  `check_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '最近一次测试得分',
  `compose_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最近组句得分',
  `retell_sentence_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最近分句复述得分',
  `retell_article_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最近短文朗读得分',
  `first_compose` tinyint(4) NOT NULL DEFAULT '0' COMMENT '首次组句得分',
  `first_retell_sentence` tinyint(4) NOT NULL DEFAULT '0' COMMENT '首次跟读复述得分',
  `first_retell_article` tinyint(4) NOT NULL DEFAULT '0' COMMENT '首次短文朗读得分',
  `highest_compose` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最高组句得分',
  `highest_retell_sentence` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最高跟读复述得分',
  `highest_retell_article` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最高短文朗读得分',
  `compose_num` int(10) NOT NULL DEFAULT '0' COMMENT '组句次数',
  `dictate_num` int(10) NOT NULL DEFAULT '0' COMMENT '全文听写完成次数',
  `dictate1_num` int(10) NOT NULL DEFAULT '0' COMMENT '全文听写1次数',
  `dictate2_num` int(10) NOT NULL DEFAULT '0' COMMENT '全文听写2次数',
  `dictate3_num` int(10) NOT NULL DEFAULT '0' COMMENT '全文听写3次数',
  `retell_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '分句复述次数',
  `retell_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '短文朗读次数',
  `compose_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '组句锚点',
  `dictate1_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '全文听写1锚点',
  `dictate2_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '全文听写2锚点',
  `dictate3_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '全文听写3锚点',
  `retell_sentence_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '分句复述锚点',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_paper_piece` (`student_paper_id`,`listen_piece_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力课程短文';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_piece_check`;

CREATE TABLE `student_listen_piece_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `check_id` int(10) NOT NULL DEFAULT '0',
  `part_check_id` int(10) NOT NULL DEFAULT '0',
  `listen_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'listen piece',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:详见listen_part',
  `total_score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '总分',
  `score` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '得分',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '序号',
  `part_no` int(10) NOT NULL DEFAULT '0' COMMENT 'part no',
  `name` varchar(32) NOT NULL DEFAULT '0' COMMENT '名称:第6-8小题',
  `question_num` tinyint(4) NOT NULL DEFAULT '0' COMMENT '小题数量',
  `answer` text NOT NULL COMMENT '学生回答json',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '用时',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `check_id` (`check_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力测试piece结果';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_retell`;

CREATE TABLE `student_listen_retell` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `sub_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生听力子课程id',
  `student_paper_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生试卷id',
  `student_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student listen piece id',
  `listen_piece_id` int(10) NOT NULL DEFAULT '0' COMMENT 'listen piece id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-未完成;2:-已完成',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-全文朗读;2-分句跟读',
  `score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '得分',
  `pronounce_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发音分数',
  `fluent_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '流利度分数',
  `whole_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '完整度分数',
  `speed_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '语速分数',
  `rhythm_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '韵律度分数',
  `speed` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '语速',
  `detail` text NOT NULL COMMENT '字段内容同student_text_article',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '时长',
  `listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '听听力时长',
  `listen_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '听句数',
  `listen_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '听词数',
  `last_listen_word` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听词数',
  `last_listen_sentence` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听句数',
  `last_listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交听听力时长',
  `last_duration` int(10) NOT NULL DEFAULT '0' COMMENT '当前提交用时',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '成长值',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币角',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `mouth_count` int(10) NOT NULL DEFAULT '0' COMMENT '张嘴次数',
  `retell_sentence_anchor` int(10) NOT NULL DEFAULT '0' COMMENT '句子锚点',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_piece_id` (`student_piece_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力跟读复述全文表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_setting`;

CREATE TABLE `student_listen_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `compose_setting` varchar(32) NOT NULL DEFAULT '' COMMENT '循环次数,每次间隔,语速,是否自动下一句',
  `dictate1_setting` varchar(32) NOT NULL DEFAULT '' COMMENT '循环次数,每次间隔,语速,是否自动下一句',
  `dictate2_setting` varchar(32) NOT NULL DEFAULT '' COMMENT '循环次数,每次间隔,语速,是否自动下一句',
  `dictate3_setting` varchar(32) NOT NULL DEFAULT '' COMMENT '循环次数,每次间隔,语速,是否自动下一句',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力设置表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_listen_sub_course`;

CREATE TABLE `student_listen_sub_course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生ID',
  `course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'wordset id',
  `student_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student lead wordset id',
  `student_listen_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生听力课程id',
  `listen_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '听力课程id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-精听;2-模拟;3-专项',
  `paper_ids` text NOT NULL COMMENT '试卷ids,按顺序排',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未激活；2-已激活；3-已过期；4-未激活已过期；5-取消激活',
  `invalid_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  `total_duration` int(10) NOT NULL DEFAULT '0' COMMENT '累计用时',
  `total_listen_duration` int(10) NOT NULL DEFAULT '0' COMMENT '累计听听力时长',
  `total_listen_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '累计听句数',
  `total_listen_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '累计听词数',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总套数',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '听力测试套数',
  `compose_num` int(10) NOT NULL DEFAULT '0' COMMENT '已组句套数',
  `dictate_num` int(10) NOT NULL DEFAULT '0' COMMENT '已听写全文套数',
  `retell_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '已分句复述套数',
  `retell_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '已朗读全文套数',
  `average_calc_data` varchar(500) NOT NULL DEFAULT '' COMMENT '用于计算平均分的中间数据',
  `check_average` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '测试平均分',
  `compose_average` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组句平均分',
  `dictate_average` tinyint(4) NOT NULL DEFAULT '0' COMMENT '全文听写平均分',
  `retell_sentence_average` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分句复述平均分',
  `retell_article_average` tinyint(4) NOT NULL DEFAULT '0' COMMENT '短文朗读平均分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_course_id` (`student_course_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生听力子课程';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_location`;

CREATE TABLE `student_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `device_id` varchar(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `location_time` varchar(40) NOT NULL DEFAULT '' COMMENT '定位时间',
  `url` varchar(500) NOT NULL DEFAULT '' COMMENT 'url',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生定位表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_login_log`;

CREATE TABLE `student_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_name` varchar(32) NOT NULL DEFAULT '' COMMENT '学生姓名',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '学生账号',
  `student_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '学生手机号',
  `warning_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-正常;2-距离异常；',
  `agent_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-正式总部；2-测试总部；',
  `terminal` tinyint(10) unsigned NOT NULL DEFAULT '0' COMMENT '设备类型：1-PAD；2-手机端',
  `device_id` varchar(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '登录ip地址',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip区县',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `location_time` varchar(40) NOT NULL DEFAULT '' COMMENT '定位时间',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区ID',
  `store_name` varchar(100) NOT NULL DEFAULT '' COMMENT '门店名称',
  `store_province` varchar(16) NOT NULL DEFAULT '' COMMENT '门店省',
  `store_city` varchar(20) NOT NULL DEFAULT '' COMMENT '门店市',
  `store_district` varchar(20) NOT NULL DEFAULT '' COMMENT '门店区县',
  `store_longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '门店经度',
  `store_latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '门店维度',
  `store_address` varchar(200) NOT NULL DEFAULT '' COMMENT '门店具体地址',
  `distance` int(11) NOT NULL DEFAULT '0' COMMENT '距离：米（与门店的距离）',
  `remark` varchar(150) NOT NULL DEFAULT '' COMMENT '备注内容',
  `remark_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '备注时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `login_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '登录日期',
  PRIMARY KEY (`id`),
  KEY `student_ipdate` (`student_id`,`ip`,`login_date`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生登录日志表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_open`;

CREATE TABLE `student_open` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_id',
  `year` int(10) NOT NULL DEFAULT '0' COMMENT '开通年数',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '费用（分）',
  `operate_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生开通学习表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_phonetic_unit`;

CREATE TABLE `student_phonetic_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生课程总表id',
  `student_lead_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元父表ID',
  `phonetic_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `phonetic_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-未学习；2-学习中；3-学完未测；4-已测试未通过；5-已测通过',
  `study_num` int(10) NOT NULL DEFAULT '0' COMMENT '学习次数',
  `study_page` int(10) NOT NULL DEFAULT '0' COMMENT '首次学到哪一步',
  `total_page` int(10) NOT NULL DEFAULT '0' COMMENT '总共页数',
  `last_shorthand_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次学习时间',
  `last_shorthand_id` int(10) NOT NULL DEFAULT '0' COMMENT '最后学习音标单元shorthand_phonetic_id',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '闯关次数',
  `last_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关unit_check的ID',
  `highest_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '本单元闯关最高正确率',
  `first_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次检闯关确率',
  `last_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关正确率',
  `last_check_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次闯关时间',
  `last_follow_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后跟读训练id',
  `follow_num` int(10) NOT NULL DEFAULT '0' COMMENT '跟读训练次数',
  `last_follow_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最新跟读训练分数',
  `highest_follow_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最高跟读训练分数',
  `last_listen_id` int(11) NOT NULL DEFAULT '0' COMMENT '最后辨音训练id',
  `listen_num` int(10) NOT NULL DEFAULT '0' COMMENT '辨音训练次数',
  `last_listen_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最新辨音训练分数',
  `highest_listen_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最高辨音训练分数',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '课本版本号 1，2，3...',
  `is_remove` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `first_listen_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次辨音训练分数',
  `first_follow_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次跟读训练分数',
  `is_last_shorthand_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最有一次音标学习是否完成：0-未完成；1-已完成',
  `is_last_follow_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最有一次音标跟读是否完成：0-未完成；1-已完成',
  `is_last_listen_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最有一次音标辨音是否完成：0-未完成；1-已完成',
  PRIMARY KEY (`id`),
  KEY `phonetic_course` (`phonetic_course_id`) USING BTREE,
  KEY `student_lead_unit` (`student_lead_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生音标单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_practice_read`;

CREATE TABLE `student_practice_read` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `read_article_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_article id',
  `read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_unit id',
  `read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_course id',
  `student_read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_unit id',
  `student_read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_course id',
  `complete_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次完成时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '耗时：秒，首次',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总题数',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '答对题数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数：首次',
  `question` text NOT NULL COMMENT '题目：[{"no":"题号","answer":"学生答案","is_right":"0-错误；1-正确"}]，首次',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间 首次',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间 首次',
  `read_num` int(10) NOT NULL DEFAULT '0' COMMENT '练习次数',
  `total_duration` int(10) NOT NULL DEFAULT '0' COMMENT '阅读当前文章总共的时长：秒',
  `last_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次正确题数',
  `last_score` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次正确率',
  `last_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次答题时长',
  `last_start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间 最后一次',
  `last_end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间 最后一次',
  `last_question` text NOT NULL COMMENT '最后题目：[{"no":"题号","answer":"学生答案","is_right":"0-错误；1-正确"}]，首次',
  `last_coin` int(10) NOT NULL DEFAULT '0' COMMENT '最后获得金币数',
  `new_word_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '生词，对应word表中的id, 多个用逗号分隔',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `st_time` (`student_id`,`created_at`) USING BTREE,
  KEY `sru_id` (`student_read_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生练习精读文章表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_punch`;

CREATE TABLE `student_punch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：1-复习;2-阅读',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-连续中;2-已中断',
  `start_date` date DEFAULT NULL COMMENT '打卡开始日期',
  `end_date` date DEFAULT NULL COMMENT '打卡结束日期',
  `auto_punch_num` int(10) NOT NULL DEFAULT '0' COMMENT '自动打卡次数',
  `repair_punch_num` int(10) NOT NULL DEFAULT '0' COMMENT '补打卡次数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生打卡时间段';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_punch_repair`;

CREATE TABLE `student_punch_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-复习;2-阅读',
  `cost_coin` int(10) NOT NULL DEFAULT '0' COMMENT '花费金币',
  `repair_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `student_typedate` (`student_id`,`type`,`repair_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='补卡记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_read_course`;

CREATE TABLE `student_read_course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'student id',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_lead_wordset id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'wordset id',
  `read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_course id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未激活；2-已激活；3-已过期；4-未激活已过期；5-取消激活',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  `study_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学习单元数',
  `total_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '总单元数',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '当前所用版本号',
  `prolong_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '延期到期时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `slw_id` (`student_lead_wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生阅读精练表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_read_unit`;

CREATE TABLE `student_read_unit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'wordset id',
  `read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_course id',
  `read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_unit id',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_lead_wordset id',
  `student_lead_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_lead_unit id',
  `student_read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_course id',
  `read_content_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_content id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-未学习；2-学习中；3-学完未测；4-已测试未通过；5-已测通过',
  `study_step` int(10) NOT NULL DEFAULT '0' COMMENT '学习到的步数',
  `total_step` int(10) NOT NULL DEFAULT '0' COMMENT '总步数',
  `study_num` int(10) NOT NULL DEFAULT '0' COMMENT '学习几次',
  `last_shorthand_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后学习时间',
  `practice_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '精选训练已完成作答文章篇数',
  `total_practice_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '精选训练文章总篇数',
  `practice_score` int(10) NOT NULL DEFAULT '0' COMMENT '首次练习平均分',
  `check_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '闯关已完成作答文章篇数',
  `total_check_article_num` int(10) NOT NULL DEFAULT '0' COMMENT '闯关文章总篇数',
  `check_score` int(10) NOT NULL DEFAULT '0' COMMENT '首次闯关平均分',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_check_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次闯关时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `src_id` (`student_read_course_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生精读单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_review_grammar`;

CREATE TABLE `student_review_grammar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `question_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础句子表id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-答对；2-答错；',
  `student_answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '学生回答答案',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '复习时长（毫秒）',
  `current_start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '本次复习的开始时间，代表一次复习的开始时间',
  `should_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '本该复习的时间',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习结束时间',
  `question_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题目类型：12-语法选择题；13-多选题；14-填空题；15-选词填空题；16-选词组句；23-下拉选择填空；24-短文改错；25-短句改错；26单词组合拼',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `answer_status` varchar(500) NOT NULL DEFAULT '',
  `is_guess` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是懵的，0-不是；1-是',
  `intensify_review_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '强化阶段正确次数',
  `intensify_review_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '强化阶段错误次数',
  PRIMARY KEY (`id`),
  KEY `studentid_currentstartat` (`student_id`,`current_start_at`) USING BTREE,
  KEY `studentid_createdat` (`student_id`,`created_at`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生语法复习表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_review_sentence`;

CREATE TABLE `student_review_sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `sentence_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础句子表id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-答对；2-答错;',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '复习时长（毫秒）',
  `intensify_review_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '强化阶段正确次数',
  `intensify_review_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '强化阶段错误次数',
  `current_start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '本次复习的开始时间，代表一次复习的开始时间',
  `should_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '本该复习的时间',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习结束时间',
  `question_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '首次题型；10-看中文组句，11-听音组句',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `studentid_currentstartat` (`student_id`,`current_start_at`) USING BTREE,
  KEY `studentid_createdat` (`student_id`,`created_at`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生句子复习表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_review_word`;

CREATE TABLE `student_review_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-答对；2-答错;',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '复习时长（毫秒）',
  `intensify_review_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '强化阶段正确次数',
  `intensify_review_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '强化阶段错误次数',
  `composite_spell_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '组合拼写错误次数',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL COMMENT '经度',
  `latitude` varchar(16) NOT NULL COMMENT '维度',
  `current_start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '本次复习的开始时间，代表一次复习的开始时间',
  `should_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '单词本该复习的时间',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习结束时间',
  `know_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '复习前认识不认识：1-认识；2-不认识',
  `actual_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '复习实际的状态：1-正确；2-错误；3-不认识；4-超时未作答',
  `review_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '复习模式：1-默认模式；2-答题模式',
  `know_duration` int(10) NOT NULL DEFAULT '0' COMMENT '从进入复习单词页面到点击认识不认识按钮中间的时间间隔(毫秒)',
  `question_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '首次题型；1-看英文选中文，2-听力选中文，3-组合拼，4-全拼，5-听力全拼，6-学习复习认识不认识，7-连连看，8-看中文选英文，9句子填词',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id_current_start_at` (`student_id`,`current_start_at`) USING BTREE,
  KEY `studentid_createdat` (`student_id`,`created_at`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生已复习表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_review_word_bk1`;

CREATE TABLE `student_review_word_bk1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-答对；2-答错;',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '复习时长（毫秒）',
  `intensify_review_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '强化阶段正确次数',
  `intensify_review_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '强化阶段错误次数',
  `composite_spell_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '组合拼写错误次数',
  `device_id` varchar(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL COMMENT '经度',
  `latitude` varchar(16) NOT NULL COMMENT '维度',
  `current_start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '本次复习的开始时间，代表一次复习的开始时间',
  `should_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '单词本该复习的时间',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习结束时间',
  `know_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '复习前认识不认识：1-认识；2-不认识',
  `actual_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '复习实际的状态：1-正确；2-错误；3-不认识；4-超时未作答',
  `review_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '复习模式：1-默认模式；2-答题模式',
  `know_duration` int(10) NOT NULL DEFAULT '0' COMMENT '从进入复习单词页面到点击认识不认识按钮中间的时间间隔(毫秒)',
  `question_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '首次题型；1-看英文选中文，2-听力选中文，3-组合拼，4-全拼，5-听力全拼，6-学习复习认识不认识，7-连连看，8-看中文选英文，9句子填词',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生已复习表（备份一）';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_review_word_bk2`;

CREATE TABLE `student_review_word_bk2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-答对；2-答错;',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '复习时长（毫秒）',
  `intensify_review_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '强化阶段正确次数',
  `intensify_review_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '强化阶段错误次数',
  `composite_spell_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '组合拼写错误次数',
  `device_id` varchar(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL COMMENT '经度',
  `latitude` varchar(16) NOT NULL COMMENT '维度',
  `current_start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '本次复习的开始时间，代表一次复习的开始时间',
  `should_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '单词本该复习的时间',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '复习结束时间',
  `know_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '复习前认识不认识：1-认识；2-不认识',
  `actual_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '复习实际的状态：1-正确；2-错误；3-不认识；4-超时未作答',
  `review_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '复习模式：1-默认模式；2-答题模式',
  `know_duration` int(10) NOT NULL DEFAULT '0' COMMENT '从进入复习单词页面到点击认识不认识按钮中间的时间间隔(毫秒)',
  `question_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '首次题型；1-看英文选中文，2-听力选中文，3-组合拼，4-全拼，5-听力全拼，6-学习复习认识不认识，7-连连看，8-看中文选英文，9句子填词',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生已复习表（备份二）';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_score`;

CREATE TABLE `student_score` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `grade` varchar(4) NOT NULL DEFAULT '' COMMENT '年级:三年级',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '考试类型',
  `enrol_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '入学情况:1-入学前;2-入学后',
  `full_score` int(10) NOT NULL DEFAULT '0' COMMENT '满分',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '成绩',
  `convert_score` int(11) NOT NULL DEFAULT '0' COMMENT '折算成绩',
  `convert_base` int(11) NOT NULL DEFAULT '0' COMMENT '折算基准',
  `class_ranking` int(10) NOT NULL DEFAULT '0' COMMENT '年级排名',
  `customer_satisfaction` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客户满意度',
  `store_satisfaction` tinyint(2) NOT NULL DEFAULT '0' COMMENT '校区满意度',
  `paper_pids` varchar(500) NOT NULL DEFAULT '' COMMENT '试卷照片',
  `paper_vids` varchar(500) NOT NULL DEFAULT '' COMMENT '试卷视频',
  `honor_pids` varchar(500) NOT NULL DEFAULT '' COMMENT '奖状荣誉照片',
  `honor_vids` varchar(500) NOT NULL DEFAULT '' COMMENT '奖状荣誉视频',
  `communicate_pids` varchar(500) NOT NULL DEFAULT '' COMMENT '成绩沟通照片',
  `communicate_vids` varchar(500) NOT NULL DEFAULT '' COMMENT '成绩沟通视频',
  `entrance_pids` varchar(500) NOT NULL COMMENT '入学资料',
  `teacher_comment` varchar(1100) NOT NULL DEFAULT '' COMMENT '老师点评',
  `remark` varchar(1100) NOT NULL DEFAULT '' COMMENT '备注',
  `good_news_detail` text NOT NULL COMMENT '喜报模板数据',
  `good_news_qrcode` text NOT NULL COMMENT '喜报二维码',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `increment` int(11) NOT NULL DEFAULT '0' COMMENT '比上次成绩上升或下降，负数表示下降，正数表示上升，0表示不变',
  `cumulative` int(11) NOT NULL DEFAULT '0' COMMENT '累计提升，最后一次成绩与入学成绩相比',
  `is_new` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否最新记录：1-是；0-否',
  `grade_ranking` int(10) NOT NULL DEFAULT '0' COMMENT '年级排名',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生成绩记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_sentence_statistics`;

CREATE TABLE `student_sentence_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `sentence_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础句子id',
  `sentence_difficulty` double NOT NULL DEFAULT '0' COMMENT '句子的记忆难度λ',
  `sentence_review_frequency` double NOT NULL DEFAULT '0' COMMENT '句子的遗忘指数β，如果句子是熟记的话该值是0.1，否则根据算法算出来',
  `highest_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '最高级别词库id',
  `last_unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '最后学习的词库单元号',
  `wordset_sentence_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库表句子id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `review_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习正确次数',
  `review_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习错误次数',
  `shorthand_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记次数',
  `shorthand_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记正确次数',
  `shorthand_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记错误次数',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '检查次数',
  `check_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '检查正确次数',
  `check_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '检查错误次数',
  `last_check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最后一次检查状态：1-正确；2-错误',
  `review_days` int(10) NOT NULL DEFAULT '0' COMMENT '复习的天数，每次重新识记会重置',
  `last_shorthand_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次识记时间',
  `last_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次复习时间',
  `next_review_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下一次正常复习时间',
  `last_wrong_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最新错误时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_sentence` (`student_id`,`sentence_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生句子统计表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_sentence_unit`;

CREATE TABLE `student_sentence_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生课程总表id',
  `student_sentence_wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生词库句子表id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `student_lead_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生单元总表id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-未学习；2-学习中；3-学完未测；4-已测试未通过；5-已测通过',
  `total_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '短句子总数',
  `study_sentence_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '学习短句子正确数',
  `study_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '短句子已学总数',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '课本版本号 1，2，3...',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '闯关次数',
  `last_shorthand_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次学习时间',
  `last_unit_sentence_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关sentence_unit_check的ID',
  `last_check_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关正确句子数',
  `highest_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '本单元正确率最高历史纪录',
  `first_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次闯关正确率',
  `last_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关正确率',
  `last_check_accuracy_increment` int(10) NOT NULL DEFAULT '0' COMMENT '正确率增量(-5表示下降5%,5表示上升5%,0表示无增量)',
  `last_check_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关时长（秒）',
  `last_check_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次闯关时间',
  `is_remove` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  `last_retell_accuracy` int(10) NOT NULL DEFAULT '-1' COMMENT '最新课文复述分数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_sentence_wordset_id` (`student_sentence_wordset_id`) USING BTREE,
  KEY `student_lead_unit_type` (`student_lead_unit_id`,`type`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_sentence_unit_attachment`;

CREATE TABLE `student_sentence_unit_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_sentence_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库句子表id',
  `student_sentence_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元句子表id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `student_lead_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生总单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `retell_info` text NOT NULL COMMENT '复述最新详情,[sentence_id =>[pr_url,score,pronounce_score,fluent_score,whole_score,speed_score,rhythm_score,[word_score],speed]]',
  `last_retell_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最后复述时长（秒）',
  `retell_num` int(10) NOT NULL DEFAULT '0' COMMENT '复述次数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_sentence_unit_id` (`student_sentence_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生句子单元附属表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_sentence_wordset`;

CREATE TABLE `student_sentence_wordset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '门店id',
  `student_lead_wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生课程总表id',
  `course_card_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定最新课程卡记录id（card_word表的id）',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未激活；2-已激活；3-激活已过期；4-未激活已过期(课程未激活的过期);5-取消激活',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  `cancel_activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '取消激活时间',
  `study_unit_lnum` int(10) NOT NULL DEFAULT '0' COMMENT '已学习长句单元数',
  `total_unit_lnum` int(10) NOT NULL DEFAULT '0' COMMENT '长句单元总数',
  `study_unit_snum` int(10) NOT NULL DEFAULT '0' COMMENT '已学习短句单元数',
  `total_unit_snum` int(10) NOT NULL DEFAULT '0' COMMENT '短句单元总数',
  `study_sentence_lnum` int(10) NOT NULL DEFAULT '0' COMMENT '已学习长句数',
  `total_sentence_lnum` int(10) NOT NULL DEFAULT '0' COMMENT '课程长句总数',
  `study_sentence_snum` int(10) NOT NULL DEFAULT '0' COMMENT '已学习短句数',
  `total_sentence_snum` int(10) NOT NULL DEFAULT '0' COMMENT '课程短句总数',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '购买词库版本号，1，2，3...',
  `shorthand_sduration` int(10) NOT NULL DEFAULT '0' COMMENT '短语识记时长（秒）',
  `shorthand_lduration` int(10) NOT NULL DEFAULT '0' COMMENT '识记长句时长（秒）',
  `check_sduration` int(10) NOT NULL DEFAULT '0' COMMENT '短语闯关时长',
  `check_lduration` int(10) NOT NULL DEFAULT '0' COMMENT '长句闯关时长',
  `review_sduration` int(10) NOT NULL DEFAULT '0' COMMENT '短句复习时长',
  `review_lduration` int(10) NOT NULL DEFAULT '0' COMMENT '长句复习时长',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '',
  `prolong_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '延期到期时间',
  `unique_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '课本句子去重总数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_wordset` (`student_id`,`wordset_id`) USING BTREE COMMENT '学生课程句子类型联合索引',
  KEY `student_lead_wordset_id` (`student_lead_wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生句子课程表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_setting`;

CREATE TABLE `student_setting` (
  `id` int(10) unsigned NOT NULL COMMENT '学生id',
  `study_seq` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '学习顺序，1-乱序，2-正序',
  `client_log_config` text NOT NULL COMMENT '客户端上传日志配置 json {"is_upload":"0-不上传，1-上传","type":"1-传到阿里云，2-传到第三方","count":"条数"}',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `review_limit_max` int(10) NOT NULL DEFAULT '-1' COMMENT '每日最大复习量',
  `class_group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '班级分组id',
  `oral_exec_auto_original` tinyint(4) NOT NULL DEFAULT '1' COMMENT '口语训练评测前原音自动发音：0-不发；1-发',
  `oral_exec_auto_person` tinyint(4) NOT NULL DEFAULT '1' COMMENT '口语训练录音后自动播放我的声音：0-不发；1-发',
  `oral_check_auto_original` tinyint(4) NOT NULL DEFAULT '0' COMMENT '口语闯关评测前原音自动发音：0-不发；1-发',
  `oral_check_auto_person` tinyint(4) NOT NULL DEFAULT '0' COMMENT '口语闯关录音后自动播放我的声音：0-不发；1-发',
  `entrance_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '入学考试类型：1-单元考试；2-月考；3-期中考试；4-期末考试；5-开学考试；6-小升初；7-中考；8-高考；9-模拟考试；10-联考；11-其他',
  `entrance_score` smallint(6) NOT NULL DEFAULT '-1' COMMENT '入学分数',
  `entrance_total_score` varchar(20) NOT NULL DEFAULT '-1' COMMENT '入学试卷总分',
  `entrance_pids` text NOT NULL COMMENT '图片objects',
  `is_hard_relearn` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启难词重学：0-不开通，1-开通',
  `is_phone_article` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启手机阅读：0-不开启；1-开启',
  `is_h5_handle_grammar` tinyint(4) NOT NULL DEFAULT '1' COMMENT '语法复习是否给h5处理',
  `is_sentence_oral` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启句子学习时测评：0-不开启；1-开启',
  `flash_config` varchar(200) NOT NULL DEFAULT '' COMMENT '闪卡配置{"type":"题目类型：18-快闪-听写模式听英文;19-快闪-听写模式听中文;20-快闪-听写模式听英文+中文;21-快闪-记忆模式看英文说中文;22-快闪-记忆模式看中文说英文","loop_count":"循环次数","speed":"速率间隔（秒）","is_auto_next":"是否自动播放下一个：0-否，1-是","is_auto_voice":"是否自动发音：0-否，1-是"}',
  `study_range` tinyint(4) NOT NULL DEFAULT '1' COMMENT '在家学状态：1-不允许在家学；2-区县内学；3-全国内学',
  `rw_multiple` double NOT NULL DEFAULT '0' COMMENT '单词下次复习时间拉长倍数',
  `rs_multiple` double NOT NULL DEFAULT '0' COMMENT '句子下次复习时间拉长倍数',
  `rg_multiple` double NOT NULL DEFAULT '0' COMMENT '语法下次复习时间拉长倍数',
  `rs_max` int(10) NOT NULL DEFAULT '-1' COMMENT '每天最多复习句子数量',
  `rg_max` int(10) NOT NULL DEFAULT '-1' COMMENT '每天最多复习语法数量',
  `advanced_review_set` tinyint(4) NOT NULL DEFAULT '0' COMMENT '高级复习设置0-收起；1-展开',
  `exp_article` tinyint(4) NOT NULL DEFAULT '0' COMMENT '允许体验阅读文章:1-是；0-否',
  `exp_listen` tinyint(4) NOT NULL DEFAULT '0' COMMENT '允许体验听力课程：1-是；0-否',
  `phone_listen_supreme` tinyint(4) NOT NULL DEFAULT '0' COMMENT '精听课程-允许手机端学习：1-是；0-否',
  `phone_listen_sim` tinyint(4) NOT NULL DEFAULT '0' COMMENT '训练课程-允许手机端学习：1-是；0-否',
  `phone_listen_special` tinyint(4) NOT NULL DEFAULT '0' COMMENT '听力专项-允许手机端学习：1-是；0-否',
  `listen_supreme_must` varchar(32) NOT NULL DEFAULT '1' COMMENT '听力精听必学',
  `listen_sim_must` varchar(32) NOT NULL DEFAULT '1' COMMENT '听力训练必学',
  `listen_special_must` varchar(32) NOT NULL DEFAULT '1' COMMENT '听力专项必听',
  `listen_special_seq` tinyint(4) NOT NULL DEFAULT '2' COMMENT '听力专项学习顺序:1-乱序;2-正序',
  `listen_supreme_seq` tinyint(4) NOT NULL DEFAULT '2' COMMENT '听力精听学习顺序:1-乱序;2-正序',
  `listen_sim_seq` tinyint(4) NOT NULL DEFAULT '2' COMMENT '听力训练学习顺序:1-乱序;2-正序',
  `phone_read_study` tinyint(4) NOT NULL DEFAULT '0' COMMENT '阅读精讲-允许手机端学习：1-是；0-否',
  `phone_read_practice` tinyint(4) NOT NULL DEFAULT '0' COMMENT '阅读训练-允许手机端学习：1-是；0-否',
  `phone_read_check` tinyint(4) NOT NULL DEFAULT '0' COMMENT '阅读闯关-允许手机端学习：1-是；0-否',
  UNIQUE KEY `pk_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生设置表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_study_history`;

CREATE TABLE `student_study_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `study_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '学习时间',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '课程id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生课程id(对应student_lead_wordset表的ID)',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-智能单词记忆；2-单词闯关测试；3-单词听写；4-单词默写；5-单词复习；6-点读学习；7-学后检查；8-组合拼练习；9-听写练习；10-默写练习；11-连连看练习；12-短语学习；13-句型学习;14-短语闯关;15-长句闯关;16-句子复习;17-阅读单词(班组);18-阅读单词(1v1);19-阅读单词检查；20-真题阅读；21-语法学习；22-语法闯关；23-语法练习；24-语法复习；25-听音辩义；26-口语训练；27-口语闯关；28-课文朗读；29-分句跟读；30-课文复述；31-音标课堂；32-跟读训练；33-辨音训练；34-音标闯关；35-短语复述；36-句子复述',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '本次学习情况：json，{"total":单词总数,"strange":生词,"familiar":熟词,"rawish":夹生词,"wrong":未掌握/错误,"right":"正确数","answer_total":"回答单词数","finish_status":"完成状态：1-未完成","no":"第几次"}',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '有效时长：秒',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '每次获得的学分',
  `link_id` text NOT NULL COMMENT '每次获取学分的途径，多个用’,‘分隔，1、6-unit_shorthand_word_id,2-unit_check_id,3-unit_dictate_id,4-unit_write_id,5-student_review_word_id,7-unit_examine_id,8,9,10,11-unit_exercise_id',
  `detail` text NOT NULL COMMENT '详细记录，记录一些必要信息',
  `add_credit` int(10) NOT NULL DEFAULT '0' COMMENT '本地增加的学分（扣减和翻倍前的）',
  `deduct_credit` int(10) NOT NULL DEFAULT '0' COMMENT '扣减的学分（不翻倍）',
  `total_credit` int(10) NOT NULL DEFAULT '0' COMMENT '总共的学分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `unusual_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '异常等级：0-正常；1-一级；2-二级',
  `device_id` varchar(500) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(500) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(30) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(30) NOT NULL DEFAULT '' COMMENT '纬度',
  `cid` varchar(100) NOT NULL DEFAULT '' COMMENT '激活id,App唯一',
  `device_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '设备sn',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE,
  KEY `student_studytime` (`student_id`,`study_at`) USING BTREE,
  KEY `student_unusual` (`student_id`,`unusual_level`) USING BTREE,
  KEY `idx_student_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学习日志表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_study_unusual`;

CREATE TABLE `student_study_unusual` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `study_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '学习时间',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '课程id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生课程id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-智能单词记忆；2-单词闯关测试；3-单词听写；4-单词默写；5-单词复习；6-点读学习；7-学后检查；8-组合拼练习；9-听写练习；10-默写练习；11-连连看练习；12-短语学习；13-句型学习;14-短语闯关;15-长句闯关;16-句子复习;17-阅读单词(班组);18-阅读单词(1v1);19-阅读单词检查；20-真题阅读；21-语法学习；22-语法闯关；23-语法练习；24-语法复习；25-听音辩义；26-口语训练；27-口语闯关；28-课文朗读；29-分句跟读；30-课文复述；31-音标课堂；32-跟读训练；33-辨音训练；34-音标闯关',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '本次学习情况：json，{"total":单词总数,"strange":生词,"familiar":熟词,"rawish":夹生词,"wrong":未掌握/错误,"right":"正确数","answer_total":"回答单词数","finish_status":"完成状态：1-未完成","no":"第几次"}',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '有效时长：秒',
  `link_id` text NOT NULL COMMENT '每次获取学分的途径，多个用’,‘分隔,1、6-unit_shorthand_word_id,2-unit_check_id,3-unit_dictate_id,4-unit_write_id,5-student_review_word_id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `unusual_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '异常等级:1-一级；2-二级',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE,
  KEY `student_studytime` (`student_id`,`study_at`) USING BTREE,
  KEY `student_unusual` (`student_id`,`unusual_level`) USING BTREE,
  KEY `idx_student_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学习日志异常表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_testing`;

CREATE TABLE `student_testing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '测评时的学段：1-小学；2-初中；3-高中',
  `cid` varchar(64) NOT NULL DEFAULT '' COMMENT 'cid',
  `type` tinyint(10) NOT NULL DEFAULT '0' COMMENT ' 测评类型:0-看图知心里;1-天赋领域 测评;2-情商测评;3-学习动机;4-意志力;5-成就动机;6-环境评价;7-观察力测评;8-记忆力测评;9-思维力评测;10-想象力评测;11-注意力评测;12-个性倾向评测;13-感知模式测评;14色彩性格测评;15考试焦虑测评;16家长PEM测评;17-未来成功人士;18-未来学历;19-文理科;20-未来职业;21-学习压力指数;22-自信心;23-人际关系困扰指数;',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '总耗时（秒）',
  `answer` text NOT NULL COMMENT '答案，多个答案用英文逗号分隔',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生学习测评表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_text_article`;

CREATE TABLE `student_text_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课本id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `student_lead_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生总单元id',
  `student_text_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生课本单元id',
  `text_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课文id',
  `text_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单元课文id',
  `last_read_score` int(10) NOT NULL DEFAULT '-1' COMMENT '最新课本朗读分数',
  `last_follow_score` int(10) NOT NULL DEFAULT '-1' COMMENT '最新分局跟读分数',
  `last_retell_score` int(10) NOT NULL DEFAULT '-1' COMMENT '最新课文复述分数',
  `read_info` text NOT NULL COMMENT '课文朗读详情,[pr_url,score,pronounce_score,fluent_score,whole_score,speed_score,rhythm_score,[text_sentence_id =>word_score]]',
  `follow_info` text NOT NULL COMMENT '分句跟读最新详情,[text_sentence_id =>[pr_url,score,pronounce_score,fluent_score,whole_score,speed_score,rhythm_score,[word_score]]]',
  `retell_info` text NOT NULL COMMENT '课文复述最新详情,[text_sentence_id =>[pr_url,score,pronounce_score,fluent_score,whole_score,speed_score,rhythm_score,[word_score]]]',
  `last_study_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后学习时间',
  `last_read_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最后朗读时间（秒）',
  `last_follow_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最后跟读时长（秒）',
  `last_retell_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最后复述时长（秒）',
  `read_num` int(10) NOT NULL DEFAULT '0' COMMENT '朗读次数',
  `follow_num` int(10) NOT NULL DEFAULT '0' COMMENT '跟读次数',
  `retell_num` int(10) NOT NULL DEFAULT '0' COMMENT '复述次数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_text_unit` (`student_text_unit_id`) USING BTREE,
  KEY `student_lead_unit` (`student_lead_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生课文表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_text_unit`;

CREATE TABLE `student_text_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课本id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `student_lead_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生总单元id',
  `text_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课文id',
  `read_num` int(10) NOT NULL DEFAULT '0' COMMENT '朗读文章数',
  `follow_num` int(10) NOT NULL DEFAULT '0' COMMENT '跟读文章数',
  `retell_num` int(10) NOT NULL DEFAULT '0' COMMENT '复述文章数',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总文章数',
  `total_read_score` int(10) NOT NULL DEFAULT '0' COMMENT '累计朗读分数',
  `total_retell_score` int(10) NOT NULL DEFAULT '0' COMMENT '累计复述分数',
  `total_follow_score` int(10) NOT NULL DEFAULT '0' COMMENT '累计跟读分数',
  `total_read_num` int(10) NOT NULL DEFAULT '0' COMMENT '朗读次数（不去重）',
  `total_retell_num` int(10) NOT NULL DEFAULT '0' COMMENT '复述次数（不去重）',
  `total_follow_num` int(10) NOT NULL DEFAULT '0' COMMENT '跟读次数（不去重）',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号：1，2，3...',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_lead_unit` (`student_lead_unit_id`) USING BTREE,
  KEY `student_wordset` (`student_id`,`wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生课文单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_unit`;

CREATE TABLE `student_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_lead_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元父表ID',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-未学习；2-学习中；3-学完未测；4-已测试未通过；5-已测通过',
  `total_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '总单词数',
  `shorthand_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记次数',
  `study_num` int(10) NOT NULL DEFAULT '0' COMMENT '学习次数',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '检查次数',
  `dictate_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写次数',
  `write_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写次数',
  `last_unit_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关unit_check的ID',
  `last_check_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次检查正确单词数',
  `highest_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '本单元正确率最高历史纪录',
  `first_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次检查正确率',
  `last_check_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次检查正确率',
  `last_check_accuracy_increment` int(10) NOT NULL DEFAULT '0' COMMENT '正确率增量(-5表示下降5%,5表示上升5%,0表示无增量)',
  `last_check_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次检查时长（秒）',
  `last_check_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次检查时间',
  `last_unit_dictate_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关unit_dictate的ID',
  `last_dictate_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次听写闯关正确单词数',
  `highest_dictate_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '本单元听写闯关正确率最高纪录',
  `first_dictate_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次听写闯关正确率',
  `last_dictate_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次听写闯关正确率',
  `last_dictate_accuracy_increment` int(10) NOT NULL DEFAULT '0' COMMENT '听写闯关正确率增量(-5表示下降5%,5表示上升5%,0表示无增量)',
  `last_dictate_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次听写闯关检查时长（秒）',
  `last_dictate_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次听写闯关时间',
  `last_unit_memory_write_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关unit_memory_write的ID',
  `last_write_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次默写闯关正确单词数',
  `highest_write_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '默写最高分数',
  `first_write_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次默写闯关正确率',
  `last_write_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次默写闯关正确率',
  `last_write_accuracy_increment` int(10) NOT NULL DEFAULT '0' COMMENT '默写闯关正确率增量(-5表示下降5%,5表示上升5%,0表示无增量)',
  `last_write_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次默写闯关检查时长（秒）',
  `last_write_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次默写时间',
  `last_shorthand_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次学习时间',
  `last_examine_accuracy` int(10) NOT NULL DEFAULT '-1' COMMENT '最后一次学后检查分数',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生课程总表id',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '购买词库版本号，1，2，3...',
  `is_remove` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  `experience_wordset_word_id` varchar(500) NOT NULL DEFAULT '' COMMENT '体验单词，多个单词用逗号分隔',
  `study_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学单词总数',
  `is_need_choose_word` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否需要选择单词',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `oral_num` int(10) NOT NULL DEFAULT '0' COMMENT '口语闯关次数',
  `last_unit_oral_id` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次闯关unit_check的ID',
  `highest_oral_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '本单元口语闯关正确率最高历史纪录',
  `first_oral_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '首次口语闯关正确率',
  `last_oral_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次口语闯关正确率',
  `last_oral_duration` int(10) NOT NULL DEFAULT '0' COMMENT '最近一次口语闯关时长（秒）',
  `last_oral_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次检查时间',
  `oral_exer_info` text NOT NULL COMMENT '口语测评结果页信息{"duration":"这一单元最新的所有口语练习时长","credit":"这一单元最新口语练习所获得金币","is_completed":"这一单元最新的完成状态","words":{"word_id":["score","url"]}}',
  `choose_familiar_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '选择熟词的时间',
  `examine_num` int(10) NOT NULL DEFAULT '0' COMMENT '学后检查次数',
  `fe_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查首次得分',
  `he_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查最高得分',
  `fel_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '单词消消乐首次得分',
  `hel_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '单词消消乐最高得分',
  `el_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词消消乐次数',
  `fec_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '组合拼首次得分',
  `hec_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '组合拼最高分数',
  `ec_num` int(10) NOT NULL DEFAULT '0' COMMENT '组合拼次数',
  `fels_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '听音选义首次得分',
  `hels_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '听音选义最高得分',
  `els_num` int(10) NOT NULL DEFAULT '0' COMMENT '听音选义次数',
  `few_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '默写练习首次得分',
  `hew_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '默写练习最高得分',
  `ew_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写练习次数',
  `felw_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '听写练习首次得分',
  `helw_accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '听写练习最高得分',
  `elw_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写练习次数',
  `ef_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词闪卡次数',
  PRIMARY KEY (`id`),
  KEY `student_wordset_id` (`student_wordset_id`) USING BTREE,
  KEY `lead_unit` (`student_lead_unit_id`) USING BTREE,
  KEY `student_wordset` (`student_id`,`wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_unit_choose_word`;

CREATE TABLE `student_unit_choose_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '课本id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单词课本id',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生总课本id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单词单元id',
  `student_lead_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生总单元id',
  `vague_wordset_word_ids` varchar(300) NOT NULL DEFAULT '' COMMENT '模糊单词ids,用逗号分隔',
  `unknown_wordset_word_ids` varchar(300) NOT NULL DEFAULT '' COMMENT '不会的单词ids,用逗号分隔',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '购买词库版本号，1，2，3...',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生选择单元单词表';

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
  `created_by` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生升年级表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_visit`;

CREATE TABLE `student_visit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '回访日期',
  `communication` varchar(1100) NOT NULL DEFAULT '' COMMENT '沟通记录',
  `communicate_pids` varchar(400) NOT NULL DEFAULT '' COMMENT '沟通记录',
  `summary` varchar(1100) NOT NULL DEFAULT '' COMMENT '重点总结',
  `remark` varchar(1100) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生回访';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_word`;

CREATE TABLE `student_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元表id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '单词id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `wordset_word_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库表单词id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `group_no` int(10) NOT NULL DEFAULT '0' COMMENT '组号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生已购单词表(一个单元一个单元的插入)';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_word_statistics`;

CREATE TABLE `student_word_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础单词id',
  `word_difficulty` double NOT NULL DEFAULT '0' COMMENT '单词的记忆难度λ',
  `word_review_frequency` double NOT NULL DEFAULT '0' COMMENT '单词的遗忘指数β，如果单词是熟记的话该值是0.1，否则根据算法算出来',
  `highest_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '最高级别词库id',
  `last_unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '最后学习的词库单元号',
  `wordset_word_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库表单词id',
  `wordset_stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最高级别词库学段：1-小学；2-初中；3-高中；4-大学',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词类型：1-生词；2-熟词；3-夹生词',
  `review_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习次数',
  `review_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习正确次数',
  `review_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '复习错误次数',
  `shorthand_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记次数',
  `shorthand_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记正确次数',
  `shorthand_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '识记错误次数',
  `check_num` int(10) NOT NULL DEFAULT '0' COMMENT '词义闯关次数',
  `check_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '词义闯关正确次数',
  `check_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '词义闯关错误次数',
  `last_check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '最后一次词义闯关状态：1-正确；2-错误',
  `dictate_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写正确次数',
  `dictate_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写错误次数',
  `memory_write_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写错误次数',
  `memory_write_correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写正确次数',
  `correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '总正确次数',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '总错误次数',
  `review_days` int(10) NOT NULL DEFAULT '0' COMMENT '复习的天数，每次重新识记会重置',
  `last_shorthand_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次识记时间',
  `last_review_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最近一次复习时间',
  `next_review_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下一次正常复习时间',
  `check_pure_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '检查纯错误次数：错误次数-正确次数',
  `last_wrong_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最新错误时间',
  `examine_correct_num` int(11) NOT NULL DEFAULT '0' COMMENT '单词检测正确数',
  `examine_wrong_num` int(11) NOT NULL DEFAULT '0' COMMENT '单词检测错误数',
  `examine_num` int(11) NOT NULL DEFAULT '0' COMMENT '单词检测数',
  `exp` int(10) NOT NULL DEFAULT '0' COMMENT '经验值',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单词来源：1-课本；2-文章',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_word` (`student_id`,`word_id`) USING BTREE,
  KEY `stu_nrvat` (`student_id`,`next_review_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生单词统计表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_wordset`;

CREATE TABLE `student_wordset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `course_card_id` int(10) NOT NULL DEFAULT '0' COMMENT '绑定最新课程卡记录id（card_word表的id）',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1-未激活；2-已激活；3-激活已过期；4-未激活已过期(课程未激活的过期);5-取消激活',
  `valid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '生效时间',
  `invalid_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '失效时间',
  `cancel_activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '取消激活时间',
  `study_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学习单元数',
  `study_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '已学习单词数',
  `dictate_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写单元数',
  `dictate_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写单词数',
  `write_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写单元数',
  `write_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写单词数',
  `total_unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '单元总数',
  `total_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '课程总单词数',
  `study_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学习方式：1-1v1；2-班组;3-1对1+班组',
  `student_lead_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库总表',
  `shorthand_duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词识记时长（秒）',
  `check_duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词词义闯关时长（秒）',
  `dictate_duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词听写闯关时长（秒）',
  `write_duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词默写闯关时长（秒）',
  `examine_duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查时长（秒）',
  `exercise_duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词练习时长（秒）',
  `review_duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词复习时长（秒）',
  `oral_duration` int(10) NOT NULL DEFAULT '0' COMMENT '口语闯关时长（秒）',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '购买词库版本号，1，2，3...',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `operated_by` varchar(32) NOT NULL DEFAULT '',
  `prolong_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '延期到期时间',
  `word_study_model` tinyint(4) NOT NULL DEFAULT '1' COMMENT '学习模式：1-正常模式；2-选词模式',
  `study_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '学习状态：1-未学完，2-已学完',
  `learned_num` int(10) NOT NULL DEFAULT '0' COMMENT '学前已会单词数',
  `unique_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '课本单词去重总数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_wordset` (`student_id`,`wordset_id`) USING BTREE COMMENT '学生词库联合索引',
  KEY `student_lead_wordset_id` (`student_lead_wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生词库表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `study_history_detail`;

CREATE TABLE `study_history_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：同student_study_history表',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `detail` text NOT NULL COMMENT '详情',
  `student_study_history_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_study_history表id',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同student_study_history中的link_id',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '时长（秒）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `student_sh_id` (`student_study_history_id`) USING BTREE,
  KEY `link_id_type` (`link_id`,`type`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学习记录完成详情';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `study_media`;

CREATE TABLE `study_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '标题',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `cover` varchar(300) NOT NULL DEFAULT '' COMMENT '视频封面url',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '音视频地址',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-视频(mp4)；2-音频(mp3)',
  `course_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '所属课程：1-语法；2-音标',
  `knowledge_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '题目每个空的知识点，用逗号","如：123,223（查询用knowledge_ids_query字段）',
  `knowledge_ids_query` varchar(300) NOT NULL DEFAULT '' COMMENT '对应的知识点(含父级知识点）ids,多id用,分隔,前后加,方便知识点查询',
  `guid` varchar(40) NOT NULL DEFAULT '' COMMENT '唯一id, md5(url)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习多媒体数据';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `study_plan`;

CREATE TABLE `study_plan` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区id',
  `period` tinyint(4) NOT NULL DEFAULT '0' COMMENT '计划周期:1-日;2-周;3-月',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '开始日期',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结束日期',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-未完成;2-已完成;3-已删除',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总学习单位',
  `complete_num` int(10) NOT NULL DEFAULT '0' COMMENT '已完成的学习单位',
  `complete_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '完成时间',
  `creator` varchar(8) NOT NULL DEFAULT '' COMMENT '创建者',
  `updater` varchar(8) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `data_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  KEY `student_period` (`student_id`,`period`,`start_date`),
  KEY `store_period` (`store_id`,`period`,`start_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学习计划';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `study_type_history`;

CREATE TABLE `study_type_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生ID',
  `student_wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `card_word_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卡id',
  `old_fee` int(10) NOT NULL DEFAULT '0' COMMENT '变价前的价格（只有该卡第一次变更的时候有值）',
  `new_fee` int(10) NOT NULL DEFAULT '0' COMMENT '变价后的价格（只有该卡第一次变更的时候有值）',
  `old_study_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '变更前的学习类型：1-1v1, 2-班组',
  `new_study_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '变更后的学习类型：1-1v1, 2-班组',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(255) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `card_word_id` (`card_word_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='更改学习方式表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `support_follow`;

CREATE TABLE `support_follow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `supporter_id` int(10) NOT NULL DEFAULT '0' COMMENT '运营人员id',
  `store_stage` tinyint(2) NOT NULL DEFAULT '0' COMMENT '门店当前所处阶段:1-选址中;2-营建中;3-试运营;4-正常运营;5-停止运营',
  `store_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '门店当前状态:1-很棒;2-良好;3-一般;4-较差',
  `way` tinyint(2) NOT NULL DEFAULT '0' COMMENT '跟进方式:1-微信聊天;2-电话/语音呼入;3-电话/语音呼出;4-到校支持;10-其他',
  `follow_level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '跟进等级:1-轻度;2-中度;3-深度',
  `follow_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '跟进日期',
  `next_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '下次跟进日期',
  `delay_days` int(10) NOT NULL DEFAULT '0' COMMENT '跟进延时天数',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '跟进信息',
  `pids` text NOT NULL COMMENT '图片objects',
  `vids` text NOT NULL COMMENT '视频objects',
  `fids` text NOT NULL COMMENT '文件objects',
  `problem` varchar(1000) NOT NULL DEFAULT '' COMMENT '问题',
  `solution` varchar(1000) NOT NULL DEFAULT '' COMMENT '解决方案',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `follow_scope` varchar(50) NOT NULL DEFAULT '' COMMENT '跟进范围：1-市场推广;2-咨询招生;3-教学操作;4-教务管理;5-系统帮助;6-运营支持;7-筹备营建;8-综合管理；（逗号分隔，可查询）',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运营跟进';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `support_material`;

CREATE TABLE `support_material` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态:1-待发布;2-已发布;3-已下架',
  `image_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图文状态:0-未上传;1-已上传',
  `vid` varchar(50) NOT NULL DEFAULT '' COMMENT '视频id',
  `pids` varchar(5000) NOT NULL DEFAULT '' COMMENT '图片id,多个用英文逗号分隔',
  `fids` varchar(2000) NOT NULL DEFAULT '' COMMENT '文件id,多个用英文逗号分隔',
  `category_1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '一级分类',
  `category_2` tinyint(4) NOT NULL DEFAULT '0' COMMENT '二级分类',
  `keyword` varchar(500) NOT NULL DEFAULT '' COMMENT '关键词,多个用|分隔',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `cover_pid` varchar(50) NOT NULL DEFAULT '' COMMENT '视频封面图片id',
  `video_duration` int(10) NOT NULL DEFAULT '0' COMMENT '视频时长(秒)',
  `duration_show` varchar(10) NOT NULL DEFAULT '' COMMENT '时长显示:00:32',
  `play_num` int(10) NOT NULL DEFAULT '0' COMMENT '观看次数',
  `play_duration` int(10) NOT NULL DEFAULT '0' COMMENT '观看时长(秒)',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `no` int(11) NOT NULL DEFAULT '9999999' COMMENT '排序号,越小越靠前',
  `release_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `recommend_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '推荐时间',
  `cancel_recommend_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '取消推荐时间',
  `watch_store_num` int(10) NOT NULL DEFAULT '0' COMMENT '观看校区数量（去重）',
  `inner_fids` varchar(2000) NOT NULL DEFAULT '' COMMENT '培训ppt文件id,多个用英文逗号分隔',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运营资料';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `support_watch`;

CREATE TABLE `support_watch` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `support_material_id` int(10) NOT NULL DEFAULT '0' COMMENT 'support_material id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent user id',
  `play_duration` int(10) NOT NULL DEFAULT '0' COMMENT '观看时长(秒)',
  `play_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '观看时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `play_id` varchar(64) NOT NULL DEFAULT '' COMMENT '播放唯一标识',
  `proportion` smallint(10) NOT NULL DEFAULT '0' COMMENT '时长占比，最多四位数',
  PRIMARY KEY (`id`),
  KEY `video_user` (`support_material_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校区培训资料观看记录';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_admin`;

CREATE TABLE `sys_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(16) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-正常;1-锁定;2-删除',
  `privilege` tinyint(2) NOT NULL DEFAULT '0' COMMENT '特权：0-普通；1-上线验证期间可使用；2-系统维护中可以使用',
  `role_ids` text NOT NULL COMMENT '角色id,多个id用,号分隔',
  `salt` varchar(16) NOT NULL DEFAULT '' COMMENT '密码盐',
  `sessionid` varchar(40) NOT NULL DEFAULT '' COMMENT '上次登录的session id',
  `last_login_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统管理员用户表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作uri',
  `body` text NOT NULL COMMENT '请求参数',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT '操作者IP',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uname` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户操作日志表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名',
  `description` varchar(300) NOT NULL DEFAULT '',
  `actions` text NOT NULL COMMENT '角色权限,uri集合,多个uri用,分隔',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(20) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT 'agent_user的id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-全职；2-兼职',
  `school` varchar(50) NOT NULL DEFAULT '' COMMENT '院校',
  `en_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '英语等级：1-高中； 2- 四级； 3-六级； 4-专四以上',
  `is_certificate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有教师资格证：0-无，1-有',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `education` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学历：1-高中及以下、2-专科、3-本科、4-研究生、5-博士',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `text_article`;

CREATE TABLE `text_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '文章音频url',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '排序序号',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文章类型：1-对话，2-文章',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-待审核；1-已审核可用；2-已删除弃用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课文文章表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `text_error`;

CREATE TABLE `text_error` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '错误类型：1-发音错位；2-中文翻译不好；',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备ID',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库ID',
  `text_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '课文单元id',
  `text_article_id` int(10) NOT NULL DEFAULT '0' COMMENT '课文文章id',
  `text_sentence_id` int(10) NOT NULL DEFAULT '0' COMMENT '课文句子ID',
  `app_ts_sentence` varchar(500) NOT NULL DEFAULT '' COMMENT 'APP英文',
  `app_ts_meaning` varchar(500) NOT NULL DEFAULT '' COMMENT 'APP中文意思',
  `app_voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'APP发音地址',
  `description` varchar(255) NOT NULL COMMENT '问题描述',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:0-未修复;1-无效;2-修复；',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课文句子纠错表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `text_sentence`;

CREATE TABLE `text_sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text_article_id` int(10) NOT NULL DEFAULT '0' COMMENT '文章id',
  `sentence` text NOT NULL COMMENT '句子',
  `meaning` text NOT NULL COMMENT '中文意思',
  `speaker_en` varchar(100) NOT NULL DEFAULT '' COMMENT '说话人，英文，空字符串表示没有说话人',
  `speaker_zh` varchar(100) NOT NULL DEFAULT '' COMMENT '说话人，中文，空字符串表示没有说话人',
  `start_time` int(10) NOT NULL COMMENT '开始时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '时长 (冗余一个时间字段，方便校验，审核)毫秒',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：0-待审核；1-已审核可用；2-已删除弃用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `tmp_source` varchar(255) NOT NULL COMMENT '临时字段,维护资源用,刷数据用',
  PRIMARY KEY (`id`),
  KEY `text_article_id` (`text_article_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课文句子基础表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `text_unit`;

CREATE TABLE `text_unit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `unit_name` varchar(100) NOT NULL DEFAULT '' COMMENT '单元名字',
  `text_article_ids` varchar(1000) NOT NULL COMMENT '课文文章表id',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号：1，2，3...',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总句子数',
  PRIMARY KEY (`id`),
  KEY `wordset_unit` (`wordset_id`,`unit_no`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课文单元';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `timing_task`;

CREATE TABLE `timing_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(50) NOT NULL COMMENT '事件',
  `args` text NOT NULL COMMENT '定时任务参数',
  `execute_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_check`;

CREATE TABLE `unit_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-完成',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币角',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `actual_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际出题数',
  `total_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '总单词数',
  `correct_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确单词数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '维度',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检查时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `wrong_word_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '错误单词ids,用逗号分隔',
  `is_first_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否第一次完成：0-不是；1-是',
  PRIMARY KEY (`id`),
  KEY `student_wordset_id` (`student_wordset_id`) USING BTREE,
  KEY `student_time` (`student_id`,`created_at`) USING BTREE,
  KEY `student_unit_id` (`student_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='词义闯关表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_check_word`;

CREATE TABLE `unit_check_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-答对；2-答错；3-不认识此单词',
  `is_answer_overtime` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答是否超时：0-没有超时；1-超时',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '检测方式：1-看英文选中文；2-听力选择；3-组合拼；4-全拼;8-看中文选英文；',
  `device_id` varchar(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_unit_id` (`student_unit_id`) USING BTREE,
  KEY `idx_studentwordsetid_studentid_duration` (`student_wordset_id`,`student_id`,`duration`) USING BTREE,
  KEY `unit_check_id` (`unit_check_id`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE,
  KEY `student_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='词义闯关详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_check_word_bk1`;

CREATE TABLE `unit_check_word_bk1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-答对；2-答错；3-不认识此单词',
  `is_answer_overtime` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答是否超时：0-没有超时；1-超时',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '检测方式：1-看英文选中文；2-听力选择；3-组合拼；4-全拼',
  `device_id` varchar(64) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_unit_id` (`student_unit_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `idx_studentid_createdat` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='词义闯关详情备份表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_dictate`;

CREATE TABLE `unit_dictate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币角',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写答对正确的单词数',
  `actual_num` int(11) NOT NULL DEFAULT '0' COMMENT '实际闯关单词数',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '听写错误的单词数',
  `total_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词总数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词听写时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_unit_id` (`student_unit_id`) USING BTREE,
  KEY `student_wordset_id` (`student_wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='听写闯关表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_dictate_word`;

CREATE TABLE `unit_dictate_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_dictate_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测单元id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-首次答对；2-错误',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误次数',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '听写开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '听写结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_unit_id` (`student_unit_id`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE,
  KEY `student_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='听写闯关详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_examine`;

CREATE TABLE `unit_examine` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '学习总时长(秒)',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总共检测单词数',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确单词数',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误单词数',
  `accuracy` int(10) NOT NULL DEFAULT '0' COMMENT '正确率',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `student_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章学习表id',
  `article_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章课程表id',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单词来源：1-课本；2-文章',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `study_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学习方式：1-1v1；2-班组',
  `is_first_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是第一次完成：0-不是；1-是',
  PRIMARY KEY (`id`),
  KEY `student_unit_id` (`student_unit_id`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生单词检查表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_examine_word`;

CREATE TABLE `unit_examine_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_examine_id` int(10) NOT NULL DEFAULT '0' COMMENT '单词检查单元id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误次数',
  `right_num` int(11) NOT NULL DEFAULT '0' COMMENT '正确次数',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `student_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章学习表id',
  `article_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章课程表id',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单词来源：1-课本；2-文章',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `unit_examine_id` (`unit_examine_id`) USING BTREE,
  KEY `idx_studentid_createdat_wrongnum_wordid` (`student_id`,`created_at`,`wrong_num`,`word_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生单词检查详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_exercise`;

CREATE TABLE `unit_exercise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '答题类型：1-组合拼;2-听写练习;3-默写练习;4-连连看;5-听英文选中文;6-口语;7-单词快闪',
  `actual_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际出题数',
  `answer_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际作答数',
  `correct_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确单词数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检查时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `keyboard_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '键盘类型：0-无类型，1-经典，2-提示',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `wrong_word_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '错误单词ids,用逗号分隔',
  `mouth_count` int(10) NOT NULL DEFAULT '0' COMMENT '张口次数',
  PRIMARY KEY (`id`),
  KEY `student_id_end_at` (`student_id`,`end_at`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE,
  KEY `student_unit_id` (`student_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='练习表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_exercise_word`;

CREATE TABLE `unit_exercise_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_exercise_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-答对；2-答错',
  `exercise_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '练习类型：1-组合拼;2-听写练习;3-默写练习;4-连连看;5-听英文选中文;6-口语;7-单词快闪',
  `question_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题目类型：3-组合拼；5-听力；4-全拼；9-句子；7-连连看;2-听英文选中文;17-口语;18-快闪-听写模式听英文;19-快闪-听写模式听中文;20-快闪-听写模式听英文+中文;21-快闪-记忆模式看英文说中文;22-快闪-记忆模式看中文说英文',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `intensify_num` int(10) NOT NULL DEFAULT '0' COMMENT '强化次数',
  `is_complete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-1未完成，1-完成',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `chisheng_score` int(10) NOT NULL DEFAULT '0' COMMENT '驰声分数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '智牛分数',
  `voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '学生发音音频地址',
  `extend` text NOT NULL COMMENT '扩展字段，针对不同题型可能有的不同字段，当exercise_type=7时包含{"is_unknow":"是否不认识：0-认识；1-不认识","is_look":"是否看答案，0-没有看答案；1-看答案","loop_count":"循环次数","speed":"间隔时长（秒）"}',
  PRIMARY KEY (`id`),
  KEY `exercise` (`unit_exercise_id`,`answer_type`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生单元练习详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_exercise_word_bk1`;

CREATE TABLE `unit_exercise_word_bk1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_exercise_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-答对；2-答错',
  `exercise_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '练习类型：1-组合拼;2-听写练习;3-默写练习;4-连连看;5-听英文选中文;6-口语;7-单词快闪',
  `question_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '题目类型：3-组合拼；5-听力；4-全拼；9-句子；7-连连看;2-听英文选中文;17-口语;18-快闪-听写模式听英文;19-快闪-听写模式听中文;20-快闪-听写模式听英文+中文;21-快闪-记忆模式看英文说中文;22-快闪-记忆模式看中文说英文',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `intensify_num` int(10) NOT NULL DEFAULT '0' COMMENT '强化次数',
  `is_complete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-1未完成，1-完成',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `chisheng_score` int(10) NOT NULL DEFAULT '0' COMMENT '驰声分数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '智牛分数',
  `voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '学生发音音频地址',
  PRIMARY KEY (`id`),
  KEY `exercise` (`unit_exercise_id`,`answer_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生单元练习详情备份表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_grammar_check`;

CREATE TABLE `unit_grammar_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `grammar_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `student_grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-完成',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '总题数',
  `actual_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际出题数',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确数',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误数',
  `guess_num` int(10) NOT NULL DEFAULT '0' COMMENT '猜数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检查时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='语法闯关单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_grammar_check_question`;

CREATE TABLE `unit_grammar_check_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `grammar_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `student_grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法题库id',
  `unit_grammar_check_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法闯关练习id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-答对；2-答错；',
  `student_answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '学生回答答案',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题目类型：12-语法选择题；13-多选题；14-填空题；15-选词填空题；16-选词组句；23-下拉选择填空；24-短文改错；25-短句改错；26单词组合拼',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `is_guess` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是懵的，0-不是；1-是',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '闯关开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '闯关结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `answer_status` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `st_time` (`created_at`,`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='语法闯关单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_grammar_exercise`;

CREATE TABLE `unit_grammar_exercise` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `grammar_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `student_grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-完成',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际出题数',
  `actual_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际出题数',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确单词数',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误数',
  `guess_num` int(10) NOT NULL DEFAULT '0' COMMENT '猜数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检查时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='语法练习单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_grammar_exercise_question`;

CREATE TABLE `unit_grammar_exercise_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `grammar_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `student_grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法题库id',
  `unit_grammar_exercise_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法闯关练习id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-答对；2-答错',
  `student_answer` varchar(5000) NOT NULL DEFAULT '' COMMENT '学生回答答案',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '题目类型：12-语法选择题；13-多选题；14-填空题；15-选词填空题；16-选词组句；23-下拉选择填空；24-短文改错；25-短句改错；26单词组合拼',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `is_guess` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是懵的，0-不是；1-是',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '闯关开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '闯关结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `answer_status` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `st_time` (`created_at`,`student_id`) USING BTREE,
  KEY `idx_student_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='语法练习单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_memory_write`;

CREATE TABLE `unit_memory_write` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币角',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写正确的单词数',
  `actual_num` int(11) NOT NULL DEFAULT '0' COMMENT '实际闯关单词数',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '默写错误的单词数',
  `total_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '单词总数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词默写时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_unit_id` (`student_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='默写闯关表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_memory_write_word`;

CREATE TABLE `unit_memory_write_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '单词ID',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_memory_write_id` int(10) NOT NULL DEFAULT '0' COMMENT '单元智能默写记录表id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-首次答对；2-答错',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题目类型：4-默写全拼；9-句子填词',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误次数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '单词默写时长（毫秒）',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_unit_id` (`student_unit_id`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE,
  KEY `unit_memory_write_id` (`unit_memory_write_id`) USING BTREE,
  KEY `student_time` (`student_id`,`created_at`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='默写闯关详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_oral`;

CREATE TABLE `unit_oral` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-完成',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `actual_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际出题数',
  `total_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '总单词数',
  `correct_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确单词数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `mouth_count` int(10) NOT NULL DEFAULT '0' COMMENT '张口次数',
  PRIMARY KEY (`id`),
  KEY `student_wordset_id` (`student_wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='口语闯关表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_oral_word`;

CREATE TABLE `unit_oral_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_oral_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-答对；2-答错；3-不认识此单词',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记结束时间',
  `chisheng_score` int(10) NOT NULL DEFAULT '0' COMMENT '驰声分数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '智牛分数',
  `voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '学生发音音频地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_unit_id` (`student_unit_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `idx_studentid_createdat` (`student_id`,`created_at`) USING BTREE,
  KEY `unit_oral_id` (`unit_oral_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='口语闯关详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_phonetic_check`;

CREATE TABLE `unit_phonetic_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `phonetic_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `phonetic_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '音标单元id',
  `student_phonetic_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生音标单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `actual_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际出题数',
  `answer_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际作答数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检查时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `question_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '本次题目信息[{"1":["100","A"]}]',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='音标闯关表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_phonetic_check_question`;

CREATE TABLE `unit_phonetic_check_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `phonetic_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `phonetic_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_phonetic_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `phonetic_question_id` int(10) NOT NULL DEFAULT '0' COMMENT '音标题库表id',
  `student_phonetic_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生音标单元id',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '智牛分数',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '题目类型',
  `answer` varchar(255) NOT NULL DEFAULT '' COMMENT '学生答案',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `phonetic_unit_id` (`phonetic_unit_id`) USING BTREE,
  KEY `unit_phonetic_check_id` (`unit_phonetic_check_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='音标闯关问题表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_sentence_check`;

CREATE TABLE `unit_sentence_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_sentence_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生句子课程id',
  `student_sentence_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生句子单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '课本id',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-完成',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `actual_num` int(10) NOT NULL DEFAULT '0' COMMENT '实际出题数',
  `right_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确句子数',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检查时长（秒）',
  `type` tinyint(10) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句；2-长句',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `studentsentencewordsetid` (`student_sentence_wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='句子闯关表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_sentence_check_sentence`;

CREATE TABLE `unit_sentence_check_sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_sentence_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生句子课本id',
  `student_sentence_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生句子单元id',
  `unit_sentence_check_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测句子单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '课本id',
  `sentence_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础句子表id',
  `answer_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答类型：1-答对；2-答错',
  `is_answer_overtime` tinyint(4) NOT NULL DEFAULT '0' COMMENT '回答是否超时：0-没有超时；1-超时',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '检测方式：10-看中文组句；11-听音组句；',
  `sentence_type` tinyint(10) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句；2-长句',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检测时长（毫秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '闯关开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '闯关结束时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `studentsentenceunitid` (`student_sentence_unit_id`) USING BTREE,
  KEY `studentwordsetidstudentid` (`student_sentence_wordset_id`,`student_id`) USING BTREE,
  KEY `st_time` (`created_at`,`student_id`) USING BTREE,
  KEY `check` (`unit_sentence_check_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='句子闯关详情表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_sentence_retell`;

CREATE TABLE `unit_sentence_retell` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_sentence_wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生词库句子表id',
  `student_sentence_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生单元句子表id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `student_lead_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生总单元id',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `pronounce_score` int(10) NOT NULL DEFAULT '0' COMMENT '发音分数',
  `fluent_score` int(10) NOT NULL DEFAULT '0' COMMENT '流利度分数',
  `whole_score` int(10) NOT NULL DEFAULT '0' COMMENT '完整度分数',
  `speed_score` int(10) NOT NULL DEFAULT '0' COMMENT '语速分数',
  `rhythm_score` int(10) NOT NULL DEFAULT '0' COMMENT '韵律度分数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检查时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `mouth_count` int(10) NOT NULL DEFAULT '0' COMMENT '张口次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生短语句子复述表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_sentence_retell_sentence`;

CREATE TABLE `unit_sentence_retell_sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_sentence_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库句子表id',
  `student_sentence_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元句子表id',
  `unit_sentence_retell_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生短语句子复述表id',
  `sentence_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础句子id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `student_lead_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生总单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '时长（毫秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '驰声分数',
  `pronounce_score` int(10) NOT NULL DEFAULT '0' COMMENT '发音分数',
  `fluent_score` int(10) NOT NULL DEFAULT '0' COMMENT '流利度分数',
  `whole_score` int(10) NOT NULL DEFAULT '0' COMMENT '完整度分数',
  `speed_score` int(10) NOT NULL DEFAULT '0' COMMENT '语速分数',
  `rhythm_score` int(10) NOT NULL DEFAULT '0' COMMENT '韵律度分数',
  `word_score` text NOT NULL COMMENT '每个单词分数',
  `voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '学生发音音频地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生短语句子复述句子表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_sentence_shorthand`;

CREATE TABLE `unit_sentence_shorthand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_sentence_wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生词库句子表id',
  `student_sentence_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生单元句子表id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '学习总时长(秒)',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记结束时间',
  `is_study_repeat` int(10) NOT NULL DEFAULT '0' COMMENT '是否是重学：0-不是，1-是(当单元全部完成，再学算重学)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生学习句子记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_sentence_shorthand_sentence`;

CREATE TABLE `unit_sentence_shorthand_sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_sentence_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库句子表id',
  `student_sentence_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元句子表id',
  `unit_sentence_shorthand_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生句子学习记录表id',
  `sentence_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础句子id',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `chinese_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '看英文组句总数',
  `chinese_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '看英文组句正确数',
  `chinese_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '看英文组句错误数',
  `listen_total_num` int(10) NOT NULL DEFAULT '0' COMMENT '听音组句总数',
  `listen_right_num` int(10) NOT NULL DEFAULT '0' COMMENT '听音组句正确数',
  `listen_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '听音组句错误数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '识记时长(毫秒)',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记结束时间',
  `intensify_num` int(10) NOT NULL DEFAULT '0' COMMENT '强化次数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `unit_sentecne_shorthand_id` (`unit_sentence_shorthand_id`) USING BTREE,
  KEY `st_time` (`end_at`,`student_id`) USING BTREE,
  KEY `student_sentence` (`student_sentence_wordset_id`) USING BTREE,
  KEY `study_time` (`student_id`,`end_at`) USING BTREE,
  KEY `student_sentence_unit_id` (`student_sentence_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生学习句子表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_shorthand`;

CREATE TABLE `unit_shorthand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `study_group_no` int(10) NOT NULL DEFAULT '0' COMMENT '学习进度：学习中途退出则插入当前组数，学习完成则置0',
  `click_study_group_no` int(10) NOT NULL DEFAULT '0' COMMENT '点读学习到哪组，学完置成0',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '学习总时长(秒)',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记结束时间',
  `is_click_choose` tinyint(4) NOT NULL DEFAULT '0' COMMENT '点读模式是否选择生词熟词：0-没选过；1-选过',
  `is_study_repeat` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是重学：0-不是，1-是',
  `student_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章学习表id',
  `article_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章课程表id',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单词来源：1-课本；2-文章',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_wordset_id` (`student_wordset_id`) USING BTREE,
  KEY `student_unit_id` (`student_unit_id`) USING BTREE,
  KEY `student_article_id` (`student_article_id`) USING BTREE,
  KEY `student_and_wordset_id` (`student_id`,`wordset_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生识记记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_shorthand_grammar`;

CREATE TABLE `unit_shorthand_grammar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `grammar_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法单元id',
  `grammar_content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语法内容id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `student_grammar_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生语法单元id',
  `is_study_repeat` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是重学：0-不是，1-是',
  `answer_status` text NOT NULL COMMENT '回答状态：[{"step":"1","question_id":"","status":"0|1|1","content":"a|b|c"}]用|分隔，每个代表一个空，0-错误，1-正确',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `study_step` int(10) NOT NULL DEFAULT '0' COMMENT '学习到哪一步',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '学习时长（毫秒）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `show_duration` int(10) NOT NULL DEFAULT '0' COMMENT '对用户显示的duration',
  `wrong_answer` text NOT NULL COMMENT '回答错误题的学生回答：json ["id":{"answer_status","answer_content"}]',
  `intensify_wrong_answer` text NOT NULL COMMENT '强化答案json ["id":{"answer_status","answer_content"}]',
  `current_content` text NOT NULL COMMENT '当前步需要的内容（供h5使用）',
  PRIMARY KEY (`id`),
  KEY `st_time` (`end_at`,`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='语法学习内容表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_shorthand_phonetic`;

CREATE TABLE `unit_shorthand_phonetic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '词库id',
  `phonetic_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生音标单元id',
  `phonetic_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '音标单元id',
  `phonetic_content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '音标内容id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `student_phonetic_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生音标单元id',
  `is_study_repeat` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是重学：0-不是，1-是',
  `answer_status` text NOT NULL COMMENT '回答状态：{page_step:[分数，回答]}',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `study_page` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学习到哪一页',
  `study_step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学习到哪一步',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '学习时长（毫秒）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：1-音标学习；2-跟读训练；3-辨音训练',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='音标学习内容表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_shorthand_read`;

CREATE TABLE `unit_shorthand_read` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_course id',
  `read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_unit id',
  `student_read_course_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_course id',
  `student_read_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT 'student_read_unit id',
  `read_content_id` int(10) NOT NULL DEFAULT '0' COMMENT 'read_content id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元号对应hss的章节',
  `is_study_repeat` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是重学：0-不是，1-是',
  `answer_status` text NOT NULL COMMENT '回答状态：[{"step":"1","question_id":"","status":"0|1|1","content":"a|b|c"}]用|分隔，每个代表一个空，0-错误，1-正确',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `study_step` int(10) NOT NULL DEFAULT '0' COMMENT '学习到哪一步',
  `start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '学习时长（毫秒）',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `show_duration` int(10) NOT NULL DEFAULT '0' COMMENT '对用户显示的duration',
  `current_content` text NOT NULL COMMENT '当前步需要的内容（供h5使用）',
  `first_right` varchar(500) NOT NULL DEFAULT '' COMMENT '学习题目首次答对题号，用逗号分隔',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `st_time` (`student_id`,`end_at`) USING BTREE,
  KEY `sru_id` (`student_read_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生精读单元表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_shorthand_word`;

CREATE TABLE `unit_shorthand_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '识记单元id',
  `unit_shorthand_id` int(10) NOT NULL DEFAULT '0' COMMENT '识记id',
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词类型：1-生词；2-熟词；3-夹生词',
  `is_completed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否完成：0-未完成；1-已完成',
  `group_no` int(10) NOT NULL DEFAULT '0' COMMENT '组号',
  `read_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '拼读错误次数',
  `read_right_num` int(11) NOT NULL DEFAULT '0' COMMENT '拼读正确次数',
  `composite_spell_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '组合拼写错误次数',
  `composite_spell_right_num` int(11) NOT NULL DEFAULT '0' COMMENT '组合拼写正确次数',
  `whole_spell_wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '全部拼写错误次数',
  `whole_spell_right_num` int(11) NOT NULL DEFAULT '0' COMMENT '全部拼写正确次数',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备id',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '识记时长(毫秒)',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '识记结束时间',
  `know_duration` int(10) NOT NULL DEFAULT '0' COMMENT '从进入学习单词页面到点击认识不认识按钮中间的时间间隔(毫秒)',
  `current_start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '本次学习的开始时间，代表一次学习的开始时间',
  `click_group_no` int(10) NOT NULL DEFAULT '0' COMMENT '点读组号',
  `is_given` tinyint(4) NOT NULL DEFAULT '0' COMMENT '该单词是被用来计算学分学币：0-没用过；1-用过；2-不参与计算',
  `click_num` int(10) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `student_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章学习表id',
  `article_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章课程表id',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单词来源：1-课本；2-文章',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `stu_iscp_edt` (`student_id`,`is_completed`,`end_at`) USING BTREE,
  KEY `stu_iscp` (`student_wordset_id`,`is_completed`) USING BTREE,
  KEY `ust_iscp_stu_cgn` (`unit_shorthand_id`,`is_completed`,`student_unit_id`,`click_group_no`) USING BTREE,
  KEY `art_iscp` (`article_course_id`,`is_completed`) USING BTREE,
  KEY `st_time` (`end_at`,`student_id`) USING BTREE,
  KEY `student_unit_id` (`student_unit_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生速记单词表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_text_article`;

CREATE TABLE `unit_text_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课本id',
  `student_lead_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生总单元id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `text_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课文id',
  `text_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课本文章id',
  `student_text_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生课本文章id',
  `student_text_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生课本单元id',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '分数',
  `pronounce_score` int(10) NOT NULL DEFAULT '0' COMMENT '发音分数',
  `fluent_score` int(10) NOT NULL DEFAULT '0' COMMENT '流利度分数',
  `whole_score` int(10) NOT NULL DEFAULT '0' COMMENT '完整度分数',
  `speed_score` int(10) NOT NULL DEFAULT '0' COMMENT '语速分数',
  `rhythm_score` int(10) NOT NULL DEFAULT '0' COMMENT '韵律度分数',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '检查时长（秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '金币数',
  `credit` int(10) NOT NULL DEFAULT '0' COMMENT '学分',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-课文朗读；2-分句跟读；3-课文复述',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `mouth_count` int(10) NOT NULL DEFAULT '0' COMMENT '张口次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生课文同步练习表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit_text_article_sentence`;

CREATE TABLE `unit_text_article_sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_lead_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生总单元id',
  `unit_text_article_id` int(10) NOT NULL DEFAULT '0' COMMENT '检测单元id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `text_sentence_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '课文句子表id,多个句子用逗号分隔',
  `text_article_id` int(10) NOT NULL DEFAULT '0' COMMENT '课本文章id',
  `student_text_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生课本文章id',
  `student_text_unit_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生课本单元id',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-课文朗读；2-分句跟读；3-课文复述',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '时长（毫秒）',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '驰声分数',
  `pronounce_score` int(10) NOT NULL DEFAULT '0' COMMENT '发音分数',
  `fluent_score` int(10) NOT NULL DEFAULT '0' COMMENT '流利度分数',
  `whole_score` int(10) NOT NULL DEFAULT '0' COMMENT '完整度分数',
  `speed_score` int(10) NOT NULL DEFAULT '0' COMMENT '语速分数',
  `rhythm_score` int(10) NOT NULL DEFAULT '0' COMMENT '韵律度分数',
  `word_score` text NOT NULL COMMENT '每个单词分数',
  `voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '学生发音音频地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生课文列表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_ding`;

CREATE TABLE `user_ding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(32) NOT NULL DEFAULT '' COMMENT '钉钉员工唯一标识ID（不可修改）',
  `dingid` varchar(64) NOT NULL DEFAULT '' COMMENT '钉钉ID（不可修改）',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT '表示人员在此部门中的排序，列表是按order的倒序排列输出的，即从大到小排列输出的（OA后台里面调整了顺序的话order才有值）',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '分机号',
  `work_place` varchar(100) NOT NULL DEFAULT '' COMMENT '办公地点',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是企业的管理员, 1-表示是, 0-表示不是',
  `is_boss` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为企业的老板,1-表示是, 0-表示不是',
  `is_hide` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否隐藏号码,1-表示是, 0-表示不是',
  `is_leader` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是部门的主管, 1-表示是, 0-表示不是',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '员工名称',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT '表示该用户是否激活了钉钉, 1-表示激活, 0-表示没有',
  `department_ids` varchar(64) NOT NULL DEFAULT '' COMMENT '成员所属部门id列表,多个用逗号隔开',
  `position` varchar(64) NOT NULL DEFAULT '' COMMENT '职位信息',
  `email` varchar(40) NOT NULL DEFAULT '' COMMENT '员工邮箱',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '头像url',
  `jobnumber` varchar(64) NOT NULL DEFAULT '' COMMENT '员工工号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='钉钉员工信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '账号',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `role_ids` text NOT NULL COMMENT '角色id,多个id用,号分隔;,1,2,等等',
  `warning_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '预警类型：1-正常；2-跨城市登录；',
  `agent_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-正式总部；2-测试总部；',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '登录ip地址',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip省',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip市',
  `district` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip区县',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT 'ip维度',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商ID',
  `agent_name` varchar(100) NOT NULL COMMENT '代理商名称',
  `store_name` varchar(1000) NOT NULL DEFAULT '' COMMENT '门店名称',
  `store_region` varchar(1000) NOT NULL DEFAULT '' COMMENT '门店省市区',
  `store_address` varchar(2000) NOT NULL DEFAULT '' COMMENT '门店具体地址',
  `distance` int(11) NOT NULL DEFAULT '0' COMMENT '距离：米',
  `remark` varchar(150) NOT NULL DEFAULT '' COMMENT '备注内容',
  `remark_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '备注时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `store_ids` varchar(500) NOT NULL DEFAULT '0' COMMENT '校区ID',
  `login_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '登录日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理商后台用户登录日志';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_offer_phrase`;

CREATE TABLE `user_offer_phrase` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_offer_resource_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'user_offer_resource',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent user id',
  `material` varchar(40) NOT NULL DEFAULT '' COMMENT '教材版本',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `textbook` varchar(40) NOT NULL DEFAULT '' COMMENT '课本',
  `unit_no` smallint(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `unit_name` varchar(40) NOT NULL DEFAULT '' COMMENT '单元名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态:1-待审核;2-通过;3-驳回',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `tip` varchar(500) NOT NULL DEFAULT '' COMMENT '审核提示',
  `phrase` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '英文',
  `translation` varchar(100) NOT NULL DEFAULT '' COMMENT '翻译',
  `auditor` varchar(20) NOT NULL DEFAULT '' COMMENT '审核人',
  `audit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_offer_resource_id` (`user_offer_resource_id`) USING BTREE,
  KEY `material_textbook` (`material`,`textbook`,`unit_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UGC_phrase';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_offer_resource`;

CREATE TABLE `user_offer_resource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent user id',
  `material` varchar(40) NOT NULL DEFAULT '' COMMENT '教材版本',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `textbook` varchar(40) NOT NULL DEFAULT '' COMMENT '课本',
  `unit_no` smallint(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `unit_name` varchar(40) NOT NULL DEFAULT '' COMMENT '单元名称',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型:1-单词;2-短语;3-句子',
  `total_num` smallint(10) NOT NULL DEFAULT '0' COMMENT '提供总数量',
  `pass_num` smallint(10) NOT NULL DEFAULT '0' COMMENT '通过数量',
  `refuse_num` smallint(10) NOT NULL DEFAULT '0' COMMENT '拒绝数量',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `store` (`store_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UGC';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_offer_sentence`;

CREATE TABLE `user_offer_sentence` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_offer_resource_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'user_offer_resource',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent user id',
  `material` varchar(40) NOT NULL DEFAULT '' COMMENT '教材版本',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `textbook` varchar(40) NOT NULL DEFAULT '' COMMENT '课本',
  `unit_no` smallint(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `unit_name` varchar(40) NOT NULL DEFAULT '' COMMENT '单元名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态:1-待审核;2-通过;3-驳回',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `tip` varchar(500) NOT NULL DEFAULT '' COMMENT '审核提示',
  `sentence` varchar(500) NOT NULL DEFAULT '' COMMENT '首句',
  `translation` varchar(500) NOT NULL DEFAULT '' COMMENT '首句翻译',
  `next_sentence` varchar(500) NOT NULL DEFAULT '' COMMENT '下句',
  `next_translation` varchar(500) NOT NULL DEFAULT '' COMMENT '下句翻译',
  `auditor` varchar(20) NOT NULL DEFAULT '' COMMENT '审核人',
  `audit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_offer_resource_id` (`user_offer_resource_id`) USING BTREE,
  KEY `material_textbook` (`material`,`textbook`,`unit_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UGC_sentence';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_offer_word`;

CREATE TABLE `user_offer_word` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_offer_resource_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'user_offer_resource',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT 'store id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT 'agent user id',
  `material` varchar(40) NOT NULL DEFAULT '' COMMENT '教材版本',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `textbook` varchar(40) NOT NULL DEFAULT '' COMMENT '课本',
  `unit_no` smallint(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `unit_name` varchar(40) NOT NULL DEFAULT '' COMMENT '单元名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态:1-待审核;2-通过;3-驳回',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `tip` varchar(500) NOT NULL DEFAULT '' COMMENT '审核提示',
  `word` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '单词',
  `translation` varchar(100) NOT NULL DEFAULT '' COMMENT '翻译',
  `example` varchar(500) NOT NULL DEFAULT '' COMMENT '例句',
  `example_translation` varchar(500) NOT NULL DEFAULT '' COMMENT '例句翻译',
  `requirement` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-要求拼写 0-不要求',
  `auditor` varchar(20) NOT NULL DEFAULT '' COMMENT '审核人',
  `audit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_offer_resource_id` (`user_offer_resource_id`) USING BTREE,
  KEY `material_textbook` (`material`,`textbook`,`unit_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='UGC_word';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_wx`;

CREATE TABLE `user_wx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户user表的id',
  `user_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户类型（user_id来源）1-sys_admin用户;2-agent_user用户;3-student用户',
  `wx_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '微信应用类型，1-公众号，2-小程序',
  `wx_appid` varchar(32) NOT NULL DEFAULT '' COMMENT '访问的微信应用appid',
  `wx_openid` varchar(40) NOT NULL DEFAULT '' COMMENT '微信的openid',
  `wx_unionid` varchar(40) NOT NULL DEFAULT '' COMMENT '微信的unionid',
  `session_id` varchar(40) NOT NULL DEFAULT '' COMMENT '上次登录的session id',
  `last_login_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user_id`,`user_type`,`wx_appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户微信账户信息表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `vocabulary_test`;

CREATE TABLE `vocabulary_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `read_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '看英文选中文词汇量',
  `listen_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '听力词汇量',
  `en_level` varchar(10) NOT NULL DEFAULT '' COMMENT '英文级别',
  `ch_level` varchar(30) DEFAULT '' COMMENT '中文级别',
  `grade_level` varchar(50) DEFAULT '' COMMENT '年级级别',
  `score` varchar(100) NOT NULL DEFAULT '' COMMENT '英语能力综合评估Json:{"vocabulary":"5","listening":"5","reading":"5","writing":"5"}',
  `sub_score` varchar(150) NOT NULL DEFAULT '' COMMENT '测评其他辅助分数Json:{"voc_abs":"5","voc_rel":"5","listen_abs":"5","listen_rel":"5"...}',
  `unknow_num` int(10) NOT NULL DEFAULT '0' COMMENT '不认识单词数量',
  `unanswer_num` int(10) NOT NULL DEFAULT '0' COMMENT '未作答单词数量',
  `wrong_num` int(10) NOT NULL DEFAULT '0' COMMENT '错误单词数量',
  `right_num` int(10) NOT NULL DEFAULT '0' COMMENT '正确单词数量',
  `total_num` int(10) NOT NULL DEFAULT '0' COMMENT '测试总单词数量',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '测评总时间(秒)',
  `start_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '测评开始时间',
  `end_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '测评结束时间',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '测评类型：1-入学测评，2-普通测评',
  `way` tinyint(4) NOT NULL DEFAULT '1' COMMENT '测评方式:1-智能测评;2-抽样测评',
  `vocabulary_result` text NOT NULL COMMENT '算法最后的结果',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `memory_result` text NOT NULL COMMENT '记忆力测评结果JSON:{"type":"8","duration":"10(秒)","test_at":"2018-06-15 20:20:20"}',
  `attention_result` text NOT NULL COMMENT '注意力测评结果JSON:{"type":"11","duration":"10(秒)","test_at":"2018-06-15 20:20:20"}',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='单词测评表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `vocabulary_test_word`;

CREATE TABLE `vocabulary_test_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `vocabulary_test_id` int(10) NOT NULL COMMENT '词汇量检测id',
  `word` varchar(200) NOT NULL DEFAULT '' COMMENT '单词',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-正确；2-错误；3-不认识；4-未作答',
  `duration` int(10) NOT NULL DEFAULT '0' COMMENT '时长（豪秒）',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '答题类型：1-看英文选中文；2-听力',
  `vocabulary_text` text NOT NULL COMMENT '每一个单词的过程中的算法东西的记录',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `vocabulary_test_id` (`vocabulary_test_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='词汇量单个单词检测表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `whale_account`;

CREATE TABLE `whale_account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '登录密码',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账号状态：1-正常；2-禁止',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商父级链只是当前结点的父级，父级之间用“-”链接 1-2-3,包含自己的代理商',
  `activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开通时间',
  `activate_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飞鲸账号表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `whale_activate_course`;

CREATE TABLE `whale_activate_course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT 'whale学生id',
  `type` smallint(4) NOT NULL DEFAULT '0' COMMENT '激活类型：1-level1,101-level1~4,102-level1~12',
  `activate_level_nos` varchar(60) NOT NULL DEFAULT '' COMMENT '激活课程，逗号分隔',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商父级链只是当前结点的父级，父级之间用“-”链接 1-2-3,包含自己的代理商',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飞鲸激活课程记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `whale_bill`;

CREATE TABLE `whale_bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pk_id` int(10) NOT NULL DEFAULT '0' COMMENT '流水主体（代理商或校区）id',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '校区id',
  `link_agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '上级代理商或者下级代理商的id',
  `sub_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '子类型：1-代理商；2-校区',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型：看PDO',
  `fee` int(10) NOT NULL DEFAULT '0' COMMENT '费用',
  `surplus` int(10) NOT NULL DEFAULT '0' COMMENT '剩余额度',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `description` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '当type=11时，link_id为whale_activate_course的id',
  PRIMARY KEY (`id`),
  KEY `pk_id` (`pk_id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外教流水表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `whale_join`;

CREATE TABLE `whale_join` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '代理商id',
  `start_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟日期',
  `end_at` date NOT NULL DEFAULT '0000-00-00' COMMENT '加盟到期',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外教加盟记录表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `whale_student`;

CREATE TABLE `whale_student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `grade` varchar(4) NOT NULL DEFAULT '' COMMENT '年级',
  `school` varchar(50) NOT NULL DEFAULT '' COMMENT '学校',
  `store_id` int(10) NOT NULL DEFAULT '0' COMMENT '门店id',
  `agent_id` int(10) NOT NULL DEFAULT '0' COMMENT '直属代理商id',
  `supagent_chain` varchar(50) NOT NULL DEFAULT '' COMMENT '代理商父级链只是当前结点的父级，父级之间用“-”链接 1-2-3,包含自己的代理商',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-体验；2-正式',
  `account_id` int(10) NOT NULL DEFAULT '0' COMMENT '账号id',
  `first_activate_course_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '首次激活课程时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飞鲸学生表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `whale_student_course`;

CREATE TABLE `whale_student_course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT 'whale学生id',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '课程名字',
  `level_no` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课程级别',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-已开课；2-已退课',
  `activate_course_id` int(10) NOT NULL DEFAULT '0' COMMENT '激活记录id',
  `activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '激活时间',
  `cancle_activate_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '取消激活时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_by` varchar(32) NOT NULL DEFAULT '' COMMENT '创建者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='飞鲸学生课程表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `word`;

CREATE TABLE `word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '英文',
  `study_word_id` int(10) NOT NULL DEFAULT '0' COMMENT '对应的学习词word_id',
  `phonetic_am` varchar(100) NOT NULL DEFAULT '' COMMENT '音标:美',
  `phonetic_en` varchar(100) NOT NULL DEFAULT '' COMMENT '音标:英',
  `syllable` varchar(100) NOT NULL DEFAULT '' COMMENT '音节划分',
  `split` varchar(100) NOT NULL DEFAULT '' COMMENT '单词划分',
  `common_mean` varchar(100) NOT NULL DEFAULT '' COMMENT '常见词意',
  `common_mean_pos` varchar(100) NOT NULL DEFAULT '' COMMENT '常见词意带词性',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词状态；1-待审核；2-已通过；3-已删除',
  `attribute` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词属性：1-单词；2-词组；3-单词变形词；4-词组变形词',
  `requirement_stage1` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-小学考纲要求拼写 0-不要求',
  `requirement_stage2` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-初中考纲要求拼写 0-不要求',
  `requirement_stage3` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-高中考纲要求拼写;0-不要求',
  `en_voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT '英音发音地址',
  `en_updated_at` datetime NOT NULL COMMENT '英音资源最后更新时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `confuse_split` varchar(100) NOT NULL DEFAULT '' COMMENT '拆分混淆项',
  `hint` varchar(100) NOT NULL DEFAULT '' COMMENT '客户端提示',
  `mnemonic_id` int(10) NOT NULL DEFAULT '0' COMMENT '默认助记id',
  `syllable_bak` varchar(128) DEFAULT NULL,
  `difficult` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词难易程度',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词等级1-16\r\n越小越简单',
  `variant` text NOT NULL COMMENT '单词的变形，多个用|分隔',
  `prototype` varchar(255) NOT NULL COMMENT '单词原型，包含自身，竖线|分割',
  `level_sort` int(10) NOT NULL DEFAULT '0' COMMENT '阅读用单词难度  越小越简单，越大越难，0未定义难度',
  `voice_m` varchar(255) NOT NULL DEFAULT '' COMMENT '男音',
  `voice_f` varchar(255) NOT NULL DEFAULT '' COMMENT '女音',
  `tmp_sentence_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '临时绑定的word_sentence表的id，逗号分隔',
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`) USING BTREE,
  KEY `attribute` (`attribute`) USING BTREE,
  KEY `level_frequent` (`level`,`level_sort`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='基础词表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `word_confuse`;

CREATE TABLE `word_confuse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `confuse_pk` int(10) NOT NULL DEFAULT '0' COMMENT 'word_id',
  `words` varchar(5000) NOT NULL COMMENT '英文混淆项',
  `meaning` varchar(5000) NOT NULL COMMENT '中文混淆项',
  `meaning_pos` varchar(5000) NOT NULL COMMENT '中文词性混淆项',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `exclude_words` varchar(5000) NOT NULL COMMENT '排除英文单词',
  `exclude_link_words` varchar(500) NOT NULL COMMENT '排除英文连连看单词',
  PRIMARY KEY (`id`),
  UNIQUE KEY `confuse_pk` (`confuse_pk`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='单词强混淆项池子';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `word_dict`;

CREATE TABLE `word_dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '英文',
  `common_mean` varchar(100) NOT NULL DEFAULT '' COMMENT '常见词意',
  `detail` text NOT NULL COMMENT 'json格式的词典详情数据,eq:{"word":"may","phonetic":{"en":"音标:英","en_voice":"","am":"音标:美","am_voice":""},"means":[{"attr":"词性","mean":"词意"}],"variants":{"pl":["复数"],"third":["第三人称单数"],"past":["过去式"],"done":["过去分词"],"ing":["现在分词"],"er":["比较级"],"est":["最高级"],"prep":["介词"],"adv":["副词 "],"verb":["动词"],"noun":["名词"],"adj":["形容词"],"conn":["连词"]},"sentences":[{"en":"例句英文","cn":"例句中文","voice":"例句音频地址",}]}',
  `variant` text NOT NULL COMMENT '单词的变形，多个用|分隔(同word表)',
  `source` varchar(32) NOT NULL DEFAULT '' COMMENT '来源：金山词霸 ; ...',
  `level` tinyint(4) NOT NULL COMMENT '同word表值',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='单词词典数据表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `word_error`;

CREATE TABLE `word_error` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '错误类型：1-单词拼写错误；2-中文词义错误；3-发音有问题；4-音标错误；5-单词拆分不好；6-助记不好(多个逗号分隔)',
  `student_id` int(10) NOT NULL DEFAULT '0' COMMENT '学生id',
  `device_id` varchar(32) NOT NULL DEFAULT '' COMMENT '设备ID',
  `student_wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '学生词库id',
  `wordset_id` int(11) NOT NULL DEFAULT '0' COMMENT '词库ID',
  `student_unit_id` int(10) NOT NULL DEFAULT '0' COMMENT '单元id',
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT '单词英文',
  `unit_name` varchar(50) NOT NULL DEFAULT '' COMMENT '单元名称',
  `word_meaning` varchar(500) NOT NULL DEFAULT '' COMMENT '中文意思',
  `word_meaning_pos` varchar(500) NOT NULL DEFAULT '' COMMENT '带词性的中文意思',
  `app_word_meaning` varchar(500) NOT NULL DEFAULT '' COMMENT 'APP中文意思',
  `app_en_voice_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'APP发音地址',
  `description` varchar(255) NOT NULL COMMENT '问题描述',
  `detail` text NOT NULL COMMENT '页面数据,json格式',
  `resource_version` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '资源包更新时间',
  `source` tinyint(11) NOT NULL DEFAULT '0' COMMENT '来源：1-学习；2-复习',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:0-未修复;1-无效;2-修复；',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单词纠错表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `word_meaning`;

CREATE TABLE `word_meaning` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `mean_cn` varchar(100) NOT NULL DEFAULT '' COMMENT '中文释义',
  `mean_en` varchar(100) NOT NULL DEFAULT '' COMMENT '英文释义',
  `sentence_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '例句ids，英文逗号分隔',
  `question_ids` varchar(1000) NOT NULL DEFAULT '' COMMENT '练习题目ids，英文逗号分隔',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `word_id` (`word_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='单词词意表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `word_review`;

CREATE TABLE `word_review` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '排序号',
  `word` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '英文',
  `phonetic_am` varchar(100) NOT NULL DEFAULT '' COMMENT '音标:美',
  `phonetic_en` varchar(100) NOT NULL DEFAULT '' COMMENT '音标:英',
  `phonetic_en_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态；0-正确；1-错误；',
  `voice_en` varchar(300) NOT NULL DEFAULT '' COMMENT '正在使用的音频:英',
  `voice_tmp` varchar(300) NOT NULL DEFAULT '' COMMENT '临时字段，用于增量刷新用',
  `voice_cdn` varchar(300) NOT NULL DEFAULT '' COMMENT '正在使用的音频cdn地址',
  `voice_en_choose` varchar(300) NOT NULL DEFAULT '' COMMENT '选择的音频:英，空表示都不好',
  `voice_en_source` text NOT NULL COMMENT '音频:英，多个来源|分割',
  `syllable` varchar(100) NOT NULL DEFAULT '' COMMENT '音节划分',
  `split` varchar(100) NOT NULL DEFAULT '' COMMENT '单词划分',
  `split_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评分；1-不好；2一般；3-好',
  `common_mean` varchar(100) NOT NULL DEFAULT '' COMMENT '常见词意',
  `common_mean_pos` varchar(100) NOT NULL DEFAULT '' COMMENT '常见词意带词性',
  `mean_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态；0-正确；1-错误；',
  `mnemonic_id` int(10) NOT NULL DEFAULT '0' COMMENT '默认助记id',
  `mnemonic` varchar(500) NOT NULL DEFAULT '' COMMENT '默认助记',
  `mnemonic_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '打分：1-5；',
  `sample` text NOT NULL COMMENT 'json数组格式的例句：[{"text":"hello word","trans":"您好，世界", "voice":"...", "score":"0"}]',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词状态；0-待审核；1-已审核；2-已验证；99-有新候选音频加入',
  `attribute` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词属性：1-单词；2-词组',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '处理时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '处理人',
  `syllable_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态；0-正确；1-错误；',
  `confuse_split` varchar(100) NOT NULL DEFAULT '' COMMENT '组合拼写混淆项，不含正确拆分项目',
  `confuse_split_score` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评分；1-不好；2一般；3-好',
  `word_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '拼写；0-正确；1-错误；',
  `mnemonic_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '格式；0-正确；1-错误；',
  `confuse_words` mediumtext NOT NULL COMMENT 'json数据格式混淆单词：[{"text":"hello","trans":"你好"}]',
  `source` varchar(255) NOT NULL COMMENT '音频来源',
  `tmp_new_voice` tinyint(4) NOT NULL COMMENT '1：新增单词音频',
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='基础词表审核表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `word_sentence`;

CREATE TABLE `word_sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sentence` varchar(300) NOT NULL COMMENT '句子',
  `meaning` varchar(300) NOT NULL COMMENT '中文意思',
  `voice_url` varchar(300) NOT NULL COMMENT '发音url',
  `stage` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学段：1-小学；2-初中；3-高中',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句；2-长句',
  `reference` varchar(300) NOT NULL DEFAULT '' COMMENT '题目出处，如：2004年北京高考试题',
  `source` varchar(300) NOT NULL DEFAULT '' COMMENT '题目来源，如：xkw_22004',
  `guid` varchar(40) NOT NULL DEFAULT '' COMMENT '唯一id,方便各环境数据同步',
  `sign` varchar(40) NOT NULL DEFAULT '' COMMENT 'md5(sentence)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(16) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  KEY `stage` (`stage`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='单词例句';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `wordset`;

CREATE TABLE `wordset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '名称',
  `material` varchar(40) NOT NULL DEFAULT '' COMMENT '教材版本',
  `no` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '词库排序号',
  `stage` tinyint(4) NOT NULL DEFAULT '1' COMMENT '学段：1-小学；2-初中；3-高中；4-大学；5-大学以上',
  `grade` varchar(40) NOT NULL DEFAULT '' COMMENT '年级',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词状态；1-待审核；2-已通过；3-已删除',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '''词库等级：1000,1001,2002,2003第一个1代表学段，第二位代表年级，后三位数字代表在这个学段中的等级'',',
  `total_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '总单词数',
  `unique_word_num` int(10) NOT NULL DEFAULT '0' COMMENT '去重单词数',
  `unit_num` int(10) NOT NULL DEFAULT '0' COMMENT '单元总数',
  `unit_name` text NOT NULL COMMENT '单元名[{"unit_name": "单元名", "subhead": "副标题", "unit_no": "单元号"}]',
  `children_no` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '子词库排序号',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '词库类型：1-课本；2-考纲；3-体验课程；10-其他',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '修改词库备注',
  `card_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卡类型：2同步教材；3-综合课程',
  `scope_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '卡适用范围：1-普通体验卡；2-vip体验卡；3-小学同步教材；4-初中同步教材；5-高中同步教材；6-小学考纲；7-中考考纲；8-高考考纲；9-四级课程；10-六级课程；11-托福课程；12-雅思课程；13-GRE；14-零基础；15-体验课程；16-新概念青少；17-新概念;18-精读体验；19-精读正式;25-阅读精讲精练体验；26-阅读精讲精练正式',
  `category_no` tinyint(4) NOT NULL DEFAULT '0' COMMENT '左侧大类：0-零基础；1-小学；2-初中；3-高中；4-大学；5-体验；6-其他',
  `is_word` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否包含单词：0-不包含，1-包含',
  `is_sentence` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否包含句子：0-不包含，1-包含',
  `is_grammar` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有语法：0-没有，1-有',
  `sentence_max_version` tinyint(4) NOT NULL DEFAULT '0' COMMENT '句子使用最大版本号',
  `word_max_version` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词使用最大版本号',
  `grammar_max_version` tinyint(4) NOT NULL DEFAULT '0' COMMENT '语法使用最大版本号',
  `unique_sentence_num` int(10) NOT NULL DEFAULT '0' COMMENT '去重句子数',
  `total_sentence_snum` int(10) NOT NULL DEFAULT '0' COMMENT '课本短句子总数',
  `unit_sentence_snum` int(10) NOT NULL DEFAULT '0' COMMENT '课本包含短句子单元总数',
  `total_sentence_lnum` int(10) NOT NULL DEFAULT '0' COMMENT '课本长句子总数',
  `unit_sentence_lnum` int(10) NOT NULL DEFAULT '0' COMMENT '课本包含长句子单元总数',
  `unit_grammar_num` int(10) NOT NULL DEFAULT '0' COMMENT '课本包含语法单元总数',
  `book_sign` varchar(32) NOT NULL DEFAULT '' COMMENT '课本的md5(category_no-material-wordset_name)',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `introduction` text NOT NULL COMMENT '课程介绍：富文本',
  `valid_days` int(10) NOT NULL COMMENT '激活课程的有效时长，所有子课程都一样,单位是天',
  `is_phonetic` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否包含音标：0-不包含，1-包含',
  `phonetic_max_version` tinyint(4) NOT NULL DEFAULT '0' COMMENT '音标使用最大版本号',
  `unit_phonetic_num` int(10) NOT NULL DEFAULT '0' COMMENT '课本包含音标单元总数',
  `is_text` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否包含课文：0-不包含，1-包含',
  `text_max_version` tinyint(4) NOT NULL DEFAULT '0' COMMENT '课文使用最大版本号',
  `unit_text_num` int(10) NOT NULL DEFAULT '0' COMMENT '课本包含课文单元总数',
  `cover_url` varchar(100) NOT NULL DEFAULT '' COMMENT '课文封面图url',
  `word_study_model` tinyint(4) NOT NULL DEFAULT '1' COMMENT '学习模式：1-正常模式；2-选词模式',
  `available_store` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-全部校区;2-指定校区;3-仅锐思可见;4-锐思不可见',
  `print_row_num` tinyint(4) NOT NULL DEFAULT '25' COMMENT '打印行数',
  `is_listen` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有听力：0-没有；1-有',
  `is_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有阅读精讲精练：0-没有；1-有',
  PRIMARY KEY (`id`),
  KEY `material` (`material`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='词库表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `wordset_sentence`;

CREATE TABLE `wordset_sentence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sentence_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '基础句子表id',
  `wordset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '课本id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '排序序号',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号：1，2，3...',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '句子类型：1-短句，2-长句',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`wordset_id`,`version_no`,`unit_no`,`sentence_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='词库句子表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `wordset_word`;

CREATE TABLE `wordset_word` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_id` int(10) NOT NULL DEFAULT '0' COMMENT '基础词表id',
  `word_meaning_ids` varchar(20) NOT NULL DEFAULT '' COMMENT '词义id',
  `word_meaning` varchar(500) NOT NULL DEFAULT '' COMMENT '单词用'';''分割,去重',
  `word_meaning_pos` varchar(500) NOT NULL DEFAULT '' COMMENT '不同类别用''|''分割（展示时替换成'';''), 不同词性 用'';''分割,同类(词性）内用'',''分割',
  `wordset_id` int(10) NOT NULL DEFAULT '0' COMMENT '词库id',
  `mnemonic_id` int(10) NOT NULL DEFAULT '0' COMMENT '助记表id',
  `unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '单元序号',
  `old_unit_no` int(10) NOT NULL DEFAULT '0' COMMENT '拆单元前的单元号',
  `group_no` int(10) NOT NULL DEFAULT '1' COMMENT '单词在本单元中的分组',
  `no` int(10) NOT NULL DEFAULT '0' COMMENT '排序序号',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '单词状态；1-待审核；2-已通过；3-已删除;',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '修改词库备注',
  `requirement` varchar(50) NOT NULL DEFAULT '' COMMENT '考纲要求：1-写作高频词；2-要求拼写；3-不要求拼写；4-超纲（高考）；5-听力，以逗号分隔',
  `syllable` varchar(100) NOT NULL DEFAULT '' COMMENT '音节划分',
  `hint` varchar(100) NOT NULL DEFAULT '' COMMENT '客户端提示',
  `split` varchar(100) NOT NULL DEFAULT '' COMMENT '单词划分',
  `confuse_split` varchar(100) NOT NULL DEFAULT '' COMMENT '单词划分',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  `syllable_bak` varchar(128) DEFAULT NULL,
  `sentence_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '单词关联的句子id，多个用逗号分隔',
  `sentence_ids_query` varchar(500) NOT NULL DEFAULT '' COMMENT '单词关联的句子id，多个用逗号分隔(每个id用短横线关联，用于查询)',
  `hollow_sentences` text NOT NULL COMMENT '挖出的句子JSON，{"sentence_id":"sentence":"I am #!","answer":"am#good|fine","word_mean":"好#n.好",hint:"提示"},对应多个句子，answer里的顺序是挖掉词的顺序#是槽位|是多选项，|前是最佳答案',
  `version_no` int(10) NOT NULL DEFAULT '0' COMMENT '版本号：1，2，3...',
  `chinese_voice_id` int(10) NOT NULL DEFAULT '0' COMMENT '中文发音表id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`wordset_id`,`version_no`,`unit_no`,`word_id`) USING BTREE,
  KEY `wordset_id` (`wordset_id`) USING BTREE,
  KEY `word_id` (`word_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='词库单词表';

# ------------------------------------------------------------

DROP TABLE IF EXISTS `wordset_word_confuse`;

CREATE TABLE `wordset_word_confuse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `confuse_pk` varchar(50) NOT NULL DEFAULT '' COMMENT 'wordset_id-unit_no',
  `word_ids` varchar(5000) NOT NULL DEFAULT '' COMMENT '单元单词id',
  `words` varchar(5000) NOT NULL DEFAULT '' COMMENT '英文混淆项',
  `meaning` varchar(5000) NOT NULL DEFAULT '' COMMENT '中文混淆项',
  `meaning_pos` varchar(5000) NOT NULL DEFAULT '' COMMENT '中文词性混淆项',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `confuse_pk` (`confuse_pk`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课本单词混淆项池子';

\n\n\n\n\n\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
		/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
		/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
		/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
		/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
		/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
