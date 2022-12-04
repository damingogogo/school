/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - 20221113
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`School_work` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `School_work`;

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';

/*Data for the table `qrtz_locks` */

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';

/*Data for the table `qrtz_triggers` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-11-13 20:38:54','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-11-13 20:38:54','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-11-13 20:38:54','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2022-11-13 20:38:54','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-11-13 20:38:54','',NULL,'是否开启注册用户功能（true开启，false关闭）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (100,0,'0','某某大学',0,'邓周明','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:14:56'),(101,100,'0,100','计算机学院',1,'王小二','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:16:15'),(102,100,'0,100','电子信息学院',2,'','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:18:14'),(103,101,'0,100,101','2023届',1,'','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:16:51'),(104,101,'0,100,101','2024届',2,'','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:16:56'),(105,101,'0,100,101','2025届',3,'','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:17:10'),(106,101,'0,100,101','2026届',4,'','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:17:27'),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2022-11-13 20:38:52','',NULL),(108,102,'0,100,102','2024届',1,'','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:18:07'),(109,102,'0,100,102','2025届',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:18:23');

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-11-13 20:38:54','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-11-13 20:38:54','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-11-13 20:38:54','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-11-13 20:38:54','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2022-11-13 20:38:54','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-11-13 20:38:54','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-11-13 20:38:54','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-11-13 20:38:54','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-11-13 20:38:54','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-11-13 20:38:54','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-11-13 20:38:54','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-11-13 20:38:54','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2022-11-13 20:38:54','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2022-11-13 20:38:54','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2022-11-13 20:38:54','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2022-11-13 20:38:54','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2022-11-13 20:38:54','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2022-11-13 20:38:54','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2022-11-13 20:38:54','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2022-11-13 20:38:54','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-11-13 20:38:54','',NULL,'停用状态');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'用户性别','sys_user_sex','0','admin','2022-11-13 20:38:54','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2022-11-13 20:38:54','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2022-11-13 20:38:54','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2022-11-13 20:38:54','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2022-11-13 20:38:54','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2022-11-13 20:38:54','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2022-11-13 20:38:54','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2022-11-13 20:38:54','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2022-11-13 20:38:54','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2022-11-13 20:38:54','',NULL,'登录状态列表');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-11-13 20:38:54','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-11-13 20:38:54','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-11-13 20:38:54','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values (100,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-11-14 01:34:56'),(101,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-11-14 01:40:43'),(102,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-11-14 01:40:54'),(103,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-11-14 22:03:55'),(104,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-11-14 22:54:15'),(105,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','密码输入错误1次','2022-11-14 22:54:34'),(106,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','用户不存在/密码错误','2022-11-14 22:54:34'),(107,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','密码输入错误2次','2022-11-14 22:54:42'),(108,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','用户不存在/密码错误','2022-11-14 22:54:42'),(109,'邓周明的小号','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','登录用户：邓周明的小号 不存在','2022-11-14 22:55:03'),(110,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-11-14 22:55:08'),(111,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-11-14 22:55:22'),(112,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-11-14 22:55:33'),(113,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','密码输入错误1次','2022-11-14 22:55:51'),(114,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','用户不存在/密码错误','2022-11-14 22:55:51'),(115,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','用户不存在/密码错误','2022-11-14 22:56:21'),(116,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','密码输入错误2次','2022-11-14 22:56:21'),(117,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','用户不存在/密码错误','2022-11-14 22:56:57'),(118,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','密码输入错误3次','2022-11-14 22:56:57'),(119,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-11-14 22:57:05'),(120,'admin','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-11-14 22:57:48'),(121,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-11-14 22:59:12'),(122,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-11-14 23:04:27'),(123,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','1','验证码错误','2022-11-14 23:04:55'),(124,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-11-14 23:05:05'),(125,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-11-14 23:06:05'),(126,'王小明','127.0.0.1','内网IP','Chrome Mobile','Android 6.x','0','注册成功','2022-11-14 23:21:33'),(127,'王小明','127.0.0.1','内网IP','Chrome Mobile','Android 6.x','0','登录成功','2022-11-14 23:22:00'),(128,'王小明','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','退出成功','2022-11-14 23:22:28'),(129,'邓周明','127.0.0.1','内网IP','Chrome 10','Mac OS X','0','登录成功','2022-11-14 23:22:44');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2008 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'学校事务管理',0,2,'system',NULL,'',1,0,'M','0','0','','system','admin','2022-11-13 20:38:53','admin','2022-11-14 22:13:38','系统管理目录'),(2,'系统监控',0,9,'monitor',NULL,'',1,0,'M','1','0','','monitor','admin','2022-11-13 20:38:53','admin','2022-11-14 02:09:45','系统监控目录'),(3,'系统工具',0,10,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2022-11-13 20:38:53','admin','2022-11-14 01:59:04','系统工具目录'),(4,'学校官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','1','0','','guide','admin','2022-11-13 20:38:53','admin','2022-11-14 02:07:03','若依官网地址'),(100,'系统用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2022-11-13 20:38:53','邓周明','2022-11-14 23:02:20','用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2022-11-13 20:38:53','',NULL,'角色管理菜单'),(102,'系统菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2022-11-13 20:38:53','邓周明','2022-11-14 23:03:00','菜单管理菜单'),(103,'学校部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2022-11-13 20:38:53','邓周明','2022-11-14 23:03:10','部门管理菜单'),(104,'学校岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2022-11-13 20:38:53','邓周明','2022-11-14 23:03:17','岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2022-11-13 20:38:53','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2022-11-13 20:38:53','',NULL,'参数设置菜单'),(107,'学校公告管理',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2022-11-13 20:38:53','邓周明','2022-11-14 23:25:35','通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2022-11-13 20:38:53','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2022-11-13 20:38:53','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2022-11-13 20:38:53','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2022-11-13 20:38:53','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2022-11-13 20:38:53','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2022-11-13 20:38:53','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2022-11-13 20:38:53','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2022-11-13 20:38:53','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2022-11-13 20:38:53','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2022-11-13 20:38:53','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2022-11-13 20:38:53','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2022-11-13 20:38:53','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2022-11-13 20:38:53','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2022-11-13 20:38:53','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2022-11-13 20:38:53','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2022-11-13 20:38:53','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2022-11-13 20:38:53','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2022-11-13 20:38:53','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2022-11-13 20:38:53','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2022-11-13 20:38:53','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2022-11-13 20:38:53','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2022-11-13 20:38:53','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2022-11-13 20:38:53','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2022-11-13 20:38:53','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2022-11-13 20:38:53','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2022-11-13 20:38:53','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2022-11-13 20:38:53','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2022-11-13 20:38:53','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2022-11-13 20:38:53','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2022-11-13 20:38:53','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2022-11-13 20:38:53','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2022-11-13 20:38:53','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2022-11-13 20:38:53','',NULL,''),(2000,'数据统计',0,1,'/data',NULL,NULL,1,0,'M','0','0','','list','admin','2022-11-14 01:54:49','admin','2022-11-14 02:00:26',''),(2002,'人员管理',0,3,'/user/admin',NULL,NULL,1,0,'M','0','0',NULL,'peoples','admin','2022-11-14 01:58:52','',NULL,''),(2003,'查询管理',0,4,'/sreach',NULL,NULL,1,0,'M','0','0',NULL,'search','admin','2022-11-14 02:01:59','',NULL,''),(2004,'公告管理',0,5,'/gonggao',NULL,NULL,1,0,'M','0','0','','message','admin','2022-11-14 02:02:46','邓周明','2022-11-14 23:01:08',''),(2005,'报名管理',0,6,'/baomin',NULL,NULL,1,0,'M','0','0','','edit','admin','2022-11-14 02:03:59','邓周明','2022-11-14 23:01:29',''),(2006,'填表管理',0,6,'/chart',NULL,NULL,1,0,'M','0','0','','build','admin','2022-11-14 02:04:42','邓周明','2022-11-14 23:01:16','');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'温馨提醒：2018-07-01 学校考试放假通知','2','新版本内容','0','admin','2022-11-13 20:38:54','admin','2022-11-14 22:24:02','管理员'),(2,'通知：2018-09-01 学校开学通知','1','<p>维护内容</p>','0','admin','2022-11-13 20:38:54','admin','2022-11-14 22:24:28','管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`) values (100,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据统计\",\"menuType\":\"M\",\"orderNum\":1,\"parentId\":0,\"path\":\"/datacount\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 01:54:49'),(101,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":9,\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 01:55:38'),(102,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学校事务管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"/school/admin\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 01:56:40'),(103,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 01:56:56'),(104,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"人员管理\",\"menuType\":\"M\",\"orderNum\":3,\"parentId\":0,\"path\":\"/user/admin\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 01:58:52'),(105,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":10,\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 01:59:05'),(106,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-14 01:54:49\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"数据统计\",\"menuType\":\"M\",\"orderNum\":1,\"parentId\":0,\"path\":\"/data\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:00:26'),(107,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:01:03'),(108,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"search\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询管理\",\"menuType\":\"M\",\"orderNum\":4,\"parentId\":0,\"path\":\"/sreach\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:01:59'),(109,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"公告管理\",\"menuType\":\"M\",\"orderNum\":5,\"parentId\":0,\"path\":\"/\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:02:46'),(110,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"报名管理\",\"menuType\":\"M\",\"orderNum\":6,\"parentId\":0,\"path\":\"/\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:03:59'),(111,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"填表管理\",\"menuType\":\"M\",\"orderNum\":6,\"parentId\":0,\"path\":\"/\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:04:42'),(112,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"学校官网\",\"menuType\":\"M\",\"orderNum\":4,\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:07:04'),(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":9,\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:09:45'),(114,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/\",\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"年级管理\",\"menuType\":\"C\",\"orderNum\":1,\"parentId\":2001,\"path\":\"/\",\"perms\":\"/\",\"query\":\"/\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:11:33'),(115,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2022-11-14 02:11:33\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"年级管理\",\"menuType\":\"C\",\"orderNum\":1,\"parentId\":2001,\"path\":\"/school/admin/\",\"perms\":\"/school/admin/\",\"query\":\"/school/admin/\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:13:02'),(116,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-14 01:56:40\",\"icon\":\"tongxunlu\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"学校事务管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"/school/admin\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:26:36'),(117,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-14 01:56:40\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"学校事务管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"/school/admin\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:26:57'),(118,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-14 01:56:40\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"学校事务管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"/school/admin\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 02:27:32'),(119,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2001','127.0.0.1','内网IP','{menuId=2001}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-11-14 22:12:52'),(120,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2007','127.0.0.1','内网IP','{menuId=2007}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:13:00'),(121,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2001','127.0.0.1','内网IP','{menuId=2001}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:13:04'),(122,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"学校事务管理\",\"menuType\":\"M\",\"orderNum\":9,\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:13:29'),(123,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"学校事务管理\",\"menuType\":\"M\",\"orderNum\":2,\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:13:38'),(124,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"某某大学\",\"email\":\"ry@qq.com\",\"leader\":\"邓周明\",\"orderNum\":0,\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:14:57'),(125,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"计算机学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"parentId\":100,\"parentName\":\"某某大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:16:01'),(126,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"计算机学院\",\"email\":\"ry@qq.com\",\"leader\":\"王小二\",\"orderNum\":1,\"parentId\":100,\"parentName\":\"某某大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:16:15'),(127,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"2023届\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":1,\"parentId\":101,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:16:35'),(128,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"2024届\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"parentId\":101,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:16:48'),(129,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"2023届\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":1,\"parentId\":101,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:16:51'),(130,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"2024届\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":2,\"parentId\":101,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:16:56'),(131,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2024届\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\"}','{\"msg\":\"修改部门\'2024届\'失败，部门名称已存在\",\"code\":500}',0,NULL,'2022-11-14 22:17:05'),(132,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:17:10'),(133,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"2025届\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":4,\"parentId\":101,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\"}','{\"msg\":\"修改部门\'2025届\'失败，部门名称已存在\",\"code\":500}',0,NULL,'2022-11-14 22:17:20'),(134,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"2026届\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":4,\"parentId\":101,\"parentName\":\"计算机学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:17:27'),(135,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/107','127.0.0.1','内网IP','{deptId=107}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:17:31'),(136,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"电信信息学院\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":2,\"parentId\":100,\"parentName\":\"某某大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:17:53'),(137,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"2024届\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":1,\"parentId\":102,\"parentName\":\"电信信息学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:18:07'),(138,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"电子信息学院\",\"email\":\"ry@qq.com\",\"leader\":\"\",\"orderNum\":2,\"parentId\":100,\"parentName\":\"某某大学\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:18:14'),(139,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"2025届\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"parentId\":102,\"parentName\":\"电子信息学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:18:23'),(140,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"flag\":false,\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"校长\",\"postSort\":\"1\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:21:27'),(141,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"flag\":false,\"postCode\":\"se\",\"postId\":2,\"postName\":\"院长\",\"postSort\":\"2\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:21:41'),(142,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"flag\":false,\"postCode\":\"hr\",\"postId\":3,\"postName\":\"教师\",\"postSort\":\"3\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:21:51'),(143,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"flag\":false,\"postCode\":\"user\",\"postId\":4,\"postName\":\"学生\",\"postSort\":\"4\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:22:00'),(144,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"flag\":false,\"postCode\":\"student\",\"postId\":4,\"postName\":\"学生\",\"postSort\":\"4\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:22:08'),(145,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"flag\":false,\"postCode\":\"teacher\",\"postId\":3,\"postName\":\"教师\",\"postSort\":\"3\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:22:16'),(146,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"flag\":false,\"postCode\":\"yz\",\"postId\":2,\"postName\":\"院长\",\"postSort\":\"2\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:22:22'),(147,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin',NULL,'/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:54\",\"noticeContent\":\"新版本内容\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 学校考试放假通知\",\"noticeType\":\"2\",\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:24:02'),(148,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin',NULL,'/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:54\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"通知：2018-09-01 学校开学通知\",\"noticeType\":\"1\",\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:24:28'),(149,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"123@qq.com\",\"loginDate\":\"2022-11-13 20:38:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"精神小伙\",\"phonenumber\":\"15666666666\",\"postIds\":[4],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"邓周明\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:32:41'),(150,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"123@qq.com\",\"loginDate\":\"2022-11-13 20:38:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"精神小伙\",\"phonenumber\":\"15666666666\",\"postIds\":[4],\"remark\":\"测试号\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"邓周明\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:32:57'),(151,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"123@qq.com\",\"loginDate\":\"2022-11-13 20:38:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"精神小伙\",\"phonenumber\":\"15666666666\",\"postIds\":[4],\"remark\":\"测试号\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"邓周明\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:33:00'),(152,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2002,4,2003,2004,2005,2006],\"remark\":\"普通管理员\",\"roleId\":100,\"roleKey\":\"root\",\"roleName\":\"系统管理员\",\"roleSort\":\"1\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:35:56'),(153,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2022-11-14 22:35:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2002,4,2003,2004,2005,2006],\"remark\":\"普通管理员\",\"roleId\":100,\"roleKey\":\"root\",\"roleName\":\"系统管理员\",\"roleSort\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:36:35'),(154,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2022-11-14 22:35:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2002,4,2003,2004,2005,2006],\"remark\":\"普通管理员\",\"roleId\":100,\"roleKey\":\"root\",\"roleName\":\"系统管理员\",\"roleSort\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:36:35'),(155,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"123@qq.com\",\"loginDate\":\"2022-11-13 20:38:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"精神小伙\",\"phonenumber\":\"19967561455\",\"postIds\":[4],\"remark\":\"测试号\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"邓周明\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:37:04'),(156,'岗位管理',1,'com.ruoyi.web.controller.system.SysPostController.add()','POST',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"flag\":false,\"postCode\":\"home\",\"postId\":5,\"postName\":\"学生家长\",\"postSort\":\"0\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:40:58'),(157,'岗位管理',2,'com.ruoyi.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-11-14 22:40:58\",\"flag\":false,\"postCode\":\"home\",\"postId\":5,\"postName\":\"学生家长\",\"postSort\":\"5\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:41:09'),(158,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"123@qq.com\",\"loginDate\":\"2022-11-13 20:38:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"精神小伙\",\"phonenumber\":\"19967561455\",\"postIds\":[4],\"remark\":\"测试号\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"邓周明\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:49:36'),(159,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"123@qq.com\",\"loginDate\":\"2022-11-13 20:38:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"精神小伙\",\"phonenumber\":\"19967561455\",\"postIds\":[4],\"remark\":\"测试号\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"邓周明\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:49:36'),(160,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"123@qq.com\",\"loginDate\":\"2022-11-13 20:38:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"精神小伙\",\"phonenumber\":\"19967561455\",\"postIds\":[4],\"remark\":\"测试号\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":100,\"roleKey\":\"root\",\"roleName\":\"系统管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"邓周明\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:49:55'),(161,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"2025届\",\"leader\":\"\",\"orderNum\":3,\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"123@qq.com\",\"loginDate\":\"2022-11-13 20:38:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"邓周明的小号\",\"phonenumber\":\"19967561455\",\"postIds\":[4],\"remark\":\"测试号\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":100,\"roleKey\":\"root\",\"roleName\":\"系统管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"邓周明\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:54:08'),(162,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"2023届\",\"leader\":\"\",\"orderNum\":1,\"parentId\":101,\"status\":\"0\"},\"email\":\"123@163.com\",\"loginDate\":\"2022-11-14 22:03:55\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"校长\",\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:57:42'),(163,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2022-11-13 20:38:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"2023届\",\"leader\":\"\",\"orderNum\":1,\"parentId\":101,\"status\":\"0\"},\"email\":\"123@163.com\",\"loginDate\":\"2022-11-14 22:03:55\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"校长\",\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 22:57:44'),(164,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-14 02:02:46\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"公告管理\",\"menuType\":\"M\",\"orderNum\":5,\"parentId\":0,\"path\":\"/gonggao\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:01:08'),(165,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-14 02:04:42\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"填表管理\",\"menuType\":\"M\",\"orderNum\":6,\"parentId\":0,\"path\":\"/chart\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:01:17'),(166,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-11-14 02:03:59\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"报名管理\",\"menuType\":\"M\",\"orderNum\":6,\"parentId\":0,\"path\":\"/baomin\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:01:29'),(167,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"系统用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:02:20'),(168,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"系统菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:03:00'),(169,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"学校部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:03:10'),(170,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"学校岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:03:18'),(171,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:03:23'),(172,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'邓周明',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2022-11-13 20:38:53\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"学校公告管理\",\"menuType\":\"C\",\"orderNum\":8,\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"邓周明\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-11-14 23:25:35');

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ceo','校长',1,'0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:21:27',''),(2,'yz','院长',2,'0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:22:22',''),(3,'teacher','教师',3,'0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:22:16',''),(4,'student','学生',4,'0','admin','2022-11-13 20:38:52','admin','2022-11-14 22:22:08',''),(5,'home','学生家长',5,'0','admin','2022-11-14 22:40:58','admin','2022-11-14 22:41:08',NULL);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2022-11-13 20:38:53','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2022-11-13 20:38:53','',NULL,'普通角色'),(100,'系统管理员','root',1,'1',1,1,'0','0','admin','2022-11-14 22:35:55','admin','2022-11-14 22:36:34','普通管理员');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,100),(2,101),(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(100,1),(100,4),(100,100),(100,102),(100,103),(100,104),(100,107),(100,1000),(100,1001),(100,1002),(100,1003),(100,1004),(100,1005),(100,1006),(100,1012),(100,1013),(100,1014),(100,1015),(100,1016),(100,1017),(100,1018),(100,1019),(100,1020),(100,1021),(100,1022),(100,1023),(100,1024),(100,1035),(100,1036),(100,1037),(100,1038),(100,2000),(100,2002),(100,2003),(100,2004),(100,2005),(100,2006);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,103,'admin','校长','00','123@163.com','15888888888','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-11-14 22:03:55','admin','2022-11-13 20:38:52','','2022-11-14 22:57:44','管理员'),(2,105,'邓周明','邓周明的小号','00','123@qq.com','19967561455','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-11-14 23:22:45','admin','2022-11-13 20:38:52','admin','2022-11-14 23:22:44','测试号'),(100,NULL,'王小明','王小明','00','','','0','','$2a$10$m/HAVw/SbG5CLEDV5Qch/.IcXR8ZbqXUF/bANsGGVGzEzXvg.TLCi','0','0','127.0.0.1','2022-11-14 23:22:01','','2022-11-14 23:21:33','','2022-11-14 23:22:00',NULL);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values (1,1),(2,4);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,100);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
