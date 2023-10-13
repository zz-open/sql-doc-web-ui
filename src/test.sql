# ************************************************************
# Mysqldoc SQL dump
#
# 主机: 39.105.50.248 (5.6.41-log)
# 数据库: test
# 生成时间: 2023-10-12 17:49:11
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clean_unit_shorthand_word`;

CREATE TABLE `clean_unit_shorthand_word` (
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
  `know_duration` int(10) NOT NULL DEFAULT '0',
  `current_start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `click_group_no` int(10) NOT NULL DEFAULT '0' COMMENT '点读组号',
  `is_given` tinyint(4) NOT NULL DEFAULT '0' COMMENT '该单词是被用来计算学分学币：0-没用过；1-用过；2-不参与计算',
  `click_num` int(10) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `student_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章表id',
  `article_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章课程表id',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单词来源：1-课本；2-文章',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `dnn_voc_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否用来训练dnn-voc：0-不用；1-1v1学习单词；',
  PRIMARY KEY (`id`),
  KEY `stu_iscp_edt` (`student_id`,`is_completed`,`end_at`) USING BTREE,
  KEY `stu_iscp` (`student_wordset_id`,`is_completed`) USING BTREE,
  KEY `ust_iscp_stu_cgn` (`unit_shorthand_id`,`is_completed`,`student_unit_id`,`click_group_no`) USING BTREE,
  KEY `art_iscp` (`article_course_id`,`is_completed`),
  KEY `st_time` (`end_at`,`student_id`),
  KEY `student_unit_id` (`student_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生速记单词表';

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
  `know_duration` int(10) NOT NULL DEFAULT '0',
  `current_start_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `click_group_no` int(10) NOT NULL DEFAULT '0' COMMENT '点读组号',
  `is_given` tinyint(4) NOT NULL DEFAULT '0' COMMENT '该单词是被用来计算学分学币：0-没用过；1-用过；2-不参与计算',
  `click_num` int(10) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `student_article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章表id',
  `article_course_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '学生文章课程表id',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '单词来源：1-课本；2-文章',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `stu_iscp_edt` (`student_id`,`is_completed`,`end_at`) USING BTREE,
  KEY `stu_iscp` (`student_wordset_id`,`is_completed`) USING BTREE,
  KEY `ust_iscp_stu_cgn` (`unit_shorthand_id`,`is_completed`,`student_unit_id`,`click_group_no`) USING BTREE,
  KEY `art_iscp` (`article_course_id`,`is_completed`),
  KEY `st_time` (`end_at`,`student_id`),
  KEY `student_unit_id` (`student_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='学生速记单词表';

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
  `way` tinyint(4) NOT NULL DEFAULT '1',
  `vocabulary_result` text NOT NULL COMMENT '算法最后的结果',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '具体地址',
  `longitude` varchar(16) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(16) NOT NULL DEFAULT '' COMMENT '纬度',
  `memory_result` text NOT NULL COMMENT '记忆力测评结果JSON:{"type":"8","duration":"10(秒)","test_at":"2018-06-15 20:20:20"}',
  `attention_result` text NOT NULL COMMENT '注意力测评结果JSON:{"type":"11","duration":"10(秒)","test_at":"2018-06-15 20:20:20"}',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updated_by` varchar(32) NOT NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
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
  KEY `student_id` (`student_id`),
  KEY `vocabulary_test_id` (`vocabulary_test_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='词汇量单个单词检测表';

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

\n\n\n\n\n\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
		/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
		/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
		/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
		/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
		/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
