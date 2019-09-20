/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : localhost
 Source Database       : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : utf-8

 Date: 03/31/2019 10:45:57 AM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_CRON_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'), ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_JOB_DETAILS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c770800000010000000017400135f5f5441534b5f50524f504552544945535f5f73720028636f6d2e72756f79692e70726f6a6563742e6d6f6e69746f722e6a6f622e646f6d61696e2e4a6f6200000000000000010200084c000e63726f6e45787072657373696f6e7400124c6a6176612f6c616e672f537472696e673b4c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000a6d6574686f644e616d6571007e00094c000c6d6574686f64506172616d7371007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720029636f6d2e72756f79692e6672616d65776f726b2e7765622e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e0787074000070707074000e302f3130202a202a202a202a203f740018e7b3bbe7bb9fe9bb98e8aea4efbc88e697a0e58f82efbc897372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000174000672795461736b74000a72794e6f506172616d7374000074000130740001317800), ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c770800000010000000017400135f5f5441534b5f50524f504552544945535f5f73720028636f6d2e72756f79692e70726f6a6563742e6d6f6e69746f722e6a6f622e646f6d61696e2e4a6f6200000000000000010200084c000e63726f6e45787072657373696f6e7400124c6a6176612f6c616e672f537472696e673b4c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000a6d6574686f644e616d6571007e00094c000c6d6574686f64506172616d7371007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720029636f6d2e72756f79692e6672616d65776f726b2e7765622e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e0787074000070707074000e302f3230202a202a202a202a203f740018e7b3bbe7bb9fe9bb98e8aea4efbc88e69c89e58f82efbc897372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000274000672795461736b7400087279506172616d73740002727974000130740001317800);
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_LOCKS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS'), ('RuoyiScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_SCHEDULER_STATE`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'zhouwenyangdeMacBook-Air.local1553999417933', '1554000292041', '15000');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1553387560000', '-1', '5', 'PAUSED', 'CRON', '1553387554000', '0', null, '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c770800000010000000017400135f5f5441534b5f50524f504552544945535f5f73720028636f6d2e72756f79692e70726f6a6563742e6d6f6e69746f722e6a6f622e646f6d61696e2e4a6f6200000000000000010200084c000e63726f6e45787072657373696f6e7400124c6a6176612f6c616e672f537472696e673b4c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000a6d6574686f644e616d6571007e00094c000c6d6574686f64506172616d7371007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720029636f6d2e72756f79692e6672616d65776f726b2e7765622e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e0787074000070707074000e302f3130202a202a202a202a203f740018e7b3bbe7bb9fe9bb98e8aea4efbc88e697a0e58f82efbc897372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000174000672795461736b74000a72794e6f506172616d7374000074000130740001317800), ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', null, '1553387560000', '-1', '5', 'PAUSED', 'CRON', '1553387554000', '0', null, '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c770800000010000000017400135f5f5441534b5f50524f504552544945535f5f73720028636f6d2e72756f79692e70726f6a6563742e6d6f6e69746f722e6a6f622e646f6d61696e2e4a6f6200000000000000010200084c000e63726f6e45787072657373696f6e7400124c6a6176612f6c616e672f537472696e673b4c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000a6d6574686f644e616d6571007e00094c000c6d6574686f64506172616d7371007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720029636f6d2e72756f79692e6672616d65776f726b2e7765622e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e0787074000070707074000e302f3230202a202a202a202a203f740018e7b3bbe7bb9fe9bb98e8aea4efbc88e69c89e58f82efbc897372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000274000672795461736b7400087279506172616d73740002727974000130740001317800);
COMMIT;

-- ----------------------------
--  Table structure for `sys_activity`
-- ----------------------------
DROP TABLE IF EXISTS `sys_activity`;
CREATE TABLE `sys_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `operate_time` datetime DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `host_deptment` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `score` float(255,0) DEFAULT NULL,
  `money` float(255,0) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_activity`
-- ----------------------------
BEGIN;
INSERT INTO `sys_activity` VALUES ('2', null, null, null, null, null, null, null, null, null, null, '2019-03-26 23:08:30', null, null, null), ('3', null, null, null, null, null, null, null, null, null, null, '2019-03-26 23:08:50', null, null, null), ('4', '102', 'aa', 'aa', '2018-04-20 00:00:00', 'aa', 'aa', '1', '10', '2000', null, '2019-03-27 22:36:53', null, '2019-03-27 22:56:00', null), ('5', '102', 'zz', 'cc', '2018-04-20 00:00:00', 'aa', 'aa', '1', '11', '22', null, '2019-03-27 22:39:49', null, '2019-03-27 22:58:07', null), ('7', '102', 'aa', 'zz', '2018-04-20 00:00:00', 'ss', 'asd', null, '11', '11', null, '2019-03-27 22:44:57', null, null, null), ('8', '103', 'zz', 'as', '2018-04-20 00:00:00', 'asda', 'sd', null, '11', '11', null, '2019-03-27 22:48:56', null, null, null), ('9', '103', 'aa', 'asda', '2018-04-20 00:00:00', 'sd', 'asd', null, '11', '22', null, '2019-03-27 22:50:32', null, null, null), ('10', '103', 'ads', 'asd', '2018-04-20 00:00:00', 'aa', 'asd', null, '11', '1111', null, '2019-03-27 22:51:54', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_comment`
-- ----------------------------
DROP TABLE IF EXISTS `sys_comment`;
CREATE TABLE `sys_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` char(50) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_comment`
-- ----------------------------
BEGIN;
INSERT INTO `sys_comment` VALUES ('6', null, '1', '<p>哈哈哈asdasd</p>', '0', 'admin', '2019-03-31 10:27:18', 'admin', '2019-03-31 10:30:46', null), ('7', null, '100', '<p>你好</p>', '0', 'zwy', '2019-03-31 10:42:29', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
--  Records of `sys_config`
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow'), ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '徐州工程学院', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('101', '100', '0,100', '信电学院', '1', '朱淼', '15888888888', '123@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:11:55'), ('102', '100', '0,100', '化工学院', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:12:47'), ('103', '101', '0,100,101', '学习部', '1', '若依', '15888888888', '123@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:12:12'), ('104', '101', '0,100,101', '体育部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:12:23'), ('105', '101', '0,100,101', '跆拳道部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:12:33'), ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('108', '102', '0,100,102', '散打', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:13:10'), ('109', '102', '0,100,102', '歌唱', '2', '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:13:21');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(500) DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(500) DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
--  Records of `sys_dict_data`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男'), ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女'), ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知'), ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单'), ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单'), ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'), ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'), ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'), ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'), ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是'), ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否'), ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知'), ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告'), ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'), ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态'), ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('24', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'), ('25', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
--  Records of `sys_dict_type`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表'), ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表'), ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表'), ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表'), ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表'), ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表'), ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表'), ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表'), ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
COMMIT;

-- ----------------------------
--  Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '0' COMMENT '计划执行错误策略（0默认 1继续 2等待 3放弃）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
--  Records of `sys_job`
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
--  Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
--  Records of `sys_logininfor`
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 08:34:30'), ('101', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 08:36:43'), ('102', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-24 08:41:47'), ('103', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-24 08:41:53'), ('104', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 08:41:59'), ('105', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 09:16:16'), ('106', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 09:16:46'), ('107', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 09:17:55'), ('108', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 09:18:05'), ('109', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 09:18:47'), ('110', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 09:18:54'), ('111', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 09:20:39'), ('112', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 09:20:52'), ('113', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:32:14'), ('114', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 16:36:20'), ('115', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:36:33'), ('116', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 16:37:07'), ('117', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:37:11'), ('118', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 16:37:16'), ('119', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:37:23'), ('120', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 16:37:26'), ('121', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-24 16:37:37'), ('122', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:37:42'), ('123', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 16:38:57'), ('124', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:39:05'), ('125', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 16:39:52'), ('126', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:39:57'), ('127', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 16:46:36'), ('128', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:46:47'), ('129', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 16:47:14'), ('130', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 16:47:18'), ('131', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 17:02:37'), ('132', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 17:02:47'), ('133', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 17:03:22'), ('134', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-24 17:03:26'), ('135', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 17:03:32'), ('136', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-24 19:05:05'), ('137', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 19:05:08'), ('138', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 19:16:00'), ('139', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 19:29:59'), ('140', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 19:46:58'), ('141', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 19:52:23'), ('142', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 19:52:32'), ('143', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 19:54:36'), ('144', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-24 19:54:40'), ('145', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 19:54:44'), ('146', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 19:59:07'), ('147', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 20:50:33'), ('148', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 20:52:50'), ('149', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 21:17:33'), ('150', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 21:20:03'), ('151', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-24 21:20:15'), ('152', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-24 21:20:23'), ('153', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 21:20:30'), ('154', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 21:30:44'), ('155', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 21:32:55'), ('156', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-24 22:09:09'), ('157', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 08:00:45'), ('158', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 08:01:24'), ('159', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 08:01:33'), ('160', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 08:01:38'), ('161', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 08:01:43'), ('162', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 08:02:35'), ('163', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 08:02:44'), ('164', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 08:03:00'), ('165', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 08:03:04'), ('166', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:25:10'), ('167', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 22:25:19'), ('168', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:25:26'), ('169', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:30:04'), ('170', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 22:30:16'), ('171', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '用户不存在/密码错误', '2019-03-26 22:30:26'), ('172', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-26 22:30:30'), ('173', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:30:33'), ('174', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '用户不存在/密码错误', '2019-03-26 22:35:30'), ('175', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-26 22:35:34'), ('176', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:35:39'), ('177', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:37:45'), ('178', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 22:37:58'), ('179', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-26 22:38:03'), ('180', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:38:07'), ('181', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 22:39:13'), ('182', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:39:24'), ('183', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-26 22:48:39'), ('184', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-26 22:48:44'), ('185', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:48:47'), ('186', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 22:56:36'), ('187', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 23:14:24'), ('188', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-26 23:59:31'), ('189', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-26 23:59:35'), ('190', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 00:02:24'), ('191', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 00:07:12'), ('192', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 22:35:42'), ('193', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 22:39:22'), ('194', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-27 22:42:52'), ('195', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 22:42:55'), ('196', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-27 22:48:33'), ('197', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 22:48:39'), ('198', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 22:50:12'), ('199', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-27 22:51:28'), ('200', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 22:51:35'), ('201', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 22:55:54'), ('202', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-27 23:07:52'), ('203', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 23:07:57'), ('204', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 23:18:37'), ('205', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-27 23:22:47'), ('206', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 23:22:51'), ('207', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-27 23:23:47'), ('208', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 23:23:50'), ('209', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-27 23:35:10'), ('210', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-27 23:35:24'), ('211', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 15:54:40'), ('212', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-30 16:01:36'), ('213', 'xdxxbz', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 16:01:47'), ('214', 'xdxxbz', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-30 16:07:39'), ('215', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-30 16:07:43'), ('216', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 16:07:50'), ('217', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-30 16:10:23'), ('218', 'xdxxtybz', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 16:10:34'), ('219', 'xdxxtybz', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-30 16:11:36'), ('220', 'xdxxbz', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 16:12:12'), ('221', 'xdxxbz', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-30 16:12:52'), ('222', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 16:12:58'), ('223', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 16:53:30'), ('224', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-30 16:57:13'), ('225', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 16:57:17'), ('226', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 20:30:56'), ('227', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 20:37:40'), ('228', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-30 20:42:20'), ('229', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 20:42:24'), ('230', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 20:52:00'), ('231', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 21:00:09'), ('232', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 21:03:15'), ('233', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 21:07:07'), ('234', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-30 21:42:58'), ('235', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 21:43:02'), ('236', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-30 22:03:48'), ('237', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 22:03:52'), ('238', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-30 22:43:35'), ('239', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 22:43:38'), ('240', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 22:46:56'), ('241', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-30 22:52:16'), ('242', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 09:22:40'), ('243', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 09:39:10'), ('244', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 09:42:58'), ('245', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 09:46:29'), ('246', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 09:48:51'), ('247', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 09:53:32'), ('248', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 09:55:16'), ('249', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:07:14'), ('250', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:11:27'), ('251', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-31 10:13:14'), ('252', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:13:18'), ('253', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:18:52'), ('254', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:23:19'), ('255', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:26:18'), ('256', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-03-31 10:30:31'), ('257', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:30:35'), ('258', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-31 10:42:05'), ('259', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:42:18'), ('260', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-31 10:42:41'), ('261', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:42:46'), ('262', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-31 10:43:13'), ('263', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:43:26'), ('264', 'zwy', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-03-31 10:44:00'), ('265', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-03-31 10:44:05');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2017 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录'), ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录'), ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录'), ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单'), ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单'), ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单'), ('103', '学院社团管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 16:53:01', '部门管理菜单'), ('104', '职位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:07:33', '岗位管理菜单'), ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单'), ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单'), ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单'), ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单'), ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单'), ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单'), ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单'), ('112', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单'), ('113', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单'), ('114', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单'), ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单'), ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单'), ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1005', '重置密码', '100', '5', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1006', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1007', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1008', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1009', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1010', '角色导出', '101', '4', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1011', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1012', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1013', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1014', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1015', '社团查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 16:53:20', ''), ('1016', '社团新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 16:53:41', ''), ('1017', '社团修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 16:53:58', ''), ('1018', '社团删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 16:54:13', ''), ('1019', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1020', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1021', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1022', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1023', '岗位导出', '104', '4', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1024', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1025', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1026', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1027', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1028', '字典导出', '105', '4', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1029', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1030', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1031', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1032', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1033', '参数导出', '106', '4', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1034', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1035', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1036', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1037', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1038', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1039', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1040', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1041', '日志导出', '500', '3', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1042', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1043', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1044', '日志导出', '501', '2', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1045', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1046', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1047', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1048', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1049', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1050', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1051', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1052', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1053', '任务导出', '110', '5', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1054', '生成查询', '113', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1055', '生成代码', '113', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('2000', '活动管理', '1', '10', '/system/activity', 'C', '0', 'system:activity:view', '#', 'admin', '2019-03-24 17:06:18', 'admin', '2019-03-24 17:06:38', ''), ('2002', '留言管理', '1', '12', '/system/comment', 'C', '0', 'system:comment:view', '#', 'admin', '2019-03-24 17:09:57', 'admin', '2019-03-31 09:23:16', ''), ('2003', '添加活动', '2000', '1', '#', 'F', '0', 'system:activity:add', '#', 'admin', '2019-03-24 22:19:35', '', null, ''), ('2004', '删除活动', '2000', '2', '#', 'F', '0', 'system:activity:delete', '#', 'admin', '2019-03-24 22:20:17', 'admin', '2019-03-24 22:21:24', ''), ('2005', '审核通过', '2000', '3', '#', 'F', '0', 'system:activity:pass', '#', 'admin', '2019-03-24 22:22:17', '', null, ''), ('2006', '活动查询', '2000', '4', '#', 'F', '0', 'system:activity:view', '#', 'admin', '2019-03-26 08:04:33', 'admin', '2019-03-26 08:05:27', ''), ('2007', '新闻管理', '1', '11', '/system/news', 'C', '0', 'system:news:view', '#', 'admin', '2019-03-30 20:32:58', 'admin', '2019-03-30 20:33:18', ''), ('2008', '个人留言管理', '2002', '1', '/system/comment/my', 'C', '0', 'system:comment:my', '#', 'admin', '2019-03-31 10:09:32', '', null, ''), ('2009', '所有留言', '2002', '2', '/system/comment', 'C', '0', 'system:comment:view', '#', 'admin', '2019-03-31 10:14:20', '', null, ''), ('2010', '新增留言', '2008', '1', '#', 'F', '0', 'system:comment:add', '#', 'admin', '2019-03-31 10:35:20', '', null, ''), ('2011', '编辑个人留言', '2008', '2', '#', 'F', '0', 'system:comment:editMy', '#', 'admin', '2019-03-31 10:35:58', '', null, ''), ('2012', '删除个人留言', '2008', '3', '#', 'F', '0', 'system:comment:removeMy', '#', 'admin', '2019-03-31 10:36:46', '', null, ''), ('2013', '新增留言', '2009', '1', '#', 'F', '0', 'system:comment:add', '#', 'admin', '2019-03-31 10:37:18', '', null, ''), ('2014', '编辑留言', '2009', '2', '#', 'F', '0', 'system:comment:edit', '#', 'admin', '2019-03-31 10:37:47', '', null, ''), ('2015', '删除留言', '2009', '3', '#', 'F', '0', 'system:comment:remove', '#', 'admin', '2019-03-31 10:38:36', '', null, ''), ('2016', '查询留言', '2009', '4', '#', 'F', '0', 'system:comment:list', '#', 'admin', '2019-03-31 10:39:10', '', null, '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_news`
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_news`
-- ----------------------------
BEGIN;
INSERT INTO `sys_news` VALUES ('4', '103', '你好', '<p>你好啊</p>', '0', 'admin', '2019-03-30 22:53:11', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(2) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) NOT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
--  Records of `sys_notice`
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES ('10', '测试', '1', '<p>测试qqqq</p>', '0', 'admin', '2019-03-24 16:34:29', 'admin', '2019-03-24 16:40:27', ''), ('11', '测试2', '2', '测试2', '0', 'admin', '2019-03-24 16:34:46', '', null, ''), ('12', '你好，我是体育部长', '1', '<p><br></p>', '0', 'xdxxtybz', '2019-03-30 16:11:05', '', null, ''), ('13', '大家好，我是体育部长', '2', '<p><br></p>', '0', 'xdxxtybz', '2019-03-30 16:11:18', '', null, '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
--  Records of `sys_oper_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"社团管理\"],\"url\":[\"/system/dept\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 09:06:27'), ('101', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"职位管理\"],\"url\":[\"/system/post\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 09:07:33'), ('102', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"徐州工程学院\"],\"deptName\":[\"学习部\"],\"orderNum\":[\"1\"],\"leader\":[\"校书记1\"],\"phone\":[\"15888888888\"],\"email\":[\"123@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 09:11:12'), ('103', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"徐州工程学院\"],\"deptName\":[\"信电学院\"],\"orderNum\":[\"1\"],\"leader\":[\"朱淼\"],\"phone\":[\"15888888888\"],\"email\":[\"123@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 09:11:55'), ('104', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"信电学院\"],\"deptName\":[\"学习部\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"123@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 09:12:12'), ('105', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\"deptId\":[\"104\"],\"parentId\":[\"101\"],\"parentName\":[\"信电学院\"],\"deptName\":[\"体育部门\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 09:12:23'), ('106', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\"deptId\":[\"105\"],\"parentId\":[\"101\"],\"parentName\":[\"信电学院\"],\"deptName\":[\"跆拳道部门\"],\"orderNum\":[\"3\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 09:12:34'), ('107', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"徐州工程学院\"],\"deptName\":[\"化工学院\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 09:12:47'), ('108', '部门管理', '3', 'com.ruoyi.project.system.dept.controller.DeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-24 09:12:55'), ('109', '部门管理', '3', 'com.ruoyi.project.system.dept.controller.DeptController.remove()', '1', 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-24 09:12:57'), ('110', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\"deptId\":[\"108\"],\"parentId\":[\"102\"],\"parentName\":[\"化工学院\"],\"deptName\":[\"散打\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 09:13:10'), ('111', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\"deptId\":[\"109\"],\"parentId\":[\"102\"],\"parentName\":[\"化工学院\"],\"deptName\":[\"歌唱\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 09:13:21'), ('112', '岗位管理', '2', 'com.ruoyi.project.system.post.controller.PostController.editSave()', '1', 'admin', '研发部门', '/system/post/edit', '127.0.0.1', 'XX XX', '{\"postId\":[\"1\"],\"postName\":[\"校书记\"],\"postCode\":[\"ceo\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-03-24 09:13:52'), ('113', '岗位管理', '2', 'com.ruoyi.project.system.post.controller.PostController.editSave()', '1', 'admin', '研发部门', '/system/post/edit', '127.0.0.1', 'XX XX', '{\"postId\":[\"2\"],\"postName\":[\"校部长\"],\"postCode\":[\"xbz\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-03-24 09:14:13'), ('114', '岗位管理', '2', 'com.ruoyi.project.system.post.controller.PostController.editSave()', '1', 'admin', '研发部门', '/system/post/edit', '127.0.0.1', 'XX XX', '{\"postId\":[\"3\"],\"postName\":[\"社团主席\"],\"postCode\":[\"stzx\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-03-24 09:14:30'), ('115', '岗位管理', '2', 'com.ruoyi.project.system.post.controller.PostController.editSave()', '1', 'admin', '研发部门', '/system/post/edit', '127.0.0.1', 'XX XX', '{\"postId\":[\"4\"],\"postName\":[\"普通团员\"],\"postCode\":[\"user\"],\"postSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-03-24 09:14:46'), ('116', '通知公告', '3', 'com.ruoyi.project.system.notice.controller.NoticeController.remove()', '1', 'admin', '研发部门', '/system/notice/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"1\"]}', '0', null, '2019-03-24 09:15:00'), ('117', '通知公告', '3', 'com.ruoyi.project.system.notice.controller.NoticeController.remove()', '1', 'admin', '研发部门', '/system/notice/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2019-03-24 09:15:03'), ('118', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '学习部', '/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"loginName\":[\"zwy\"],\"userName\":[\"zwy\"],\"password\":[\"12345\"],\"email\":[\"123@qq.com\"],\"phonenumber\":[\"18796221234\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2019-03-24 09:17:50'), ('119', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1005,104,1019,107,1034,2,109,1045,3,113,1054,1055\"]}', '0', null, '2019-03-24 09:20:35'), ('120', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'admin', '学习部', '/system/notice/add', '127.0.0.1', 'XX XX', '{\"noticeTitle\":[\"测试\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>测试</p>\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 16:34:29'), ('121', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'admin', '学习部', '/system/notice/add', '127.0.0.1', 'XX XX', '{\"noticeTitle\":[\"测试2\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"测试2\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 16:34:46'), ('122', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1005,104,1019,107,1034,2,109,1045\"]}', '0', null, '2019-03-24 16:36:13'), ('123', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '学习部', '/system/user/resetPwd/2', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-24 16:38:26'), ('124', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1005,104,1019,107,1034,2,109,1045\"]}', '0', null, '2019-03-24 16:38:54'), ('125', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'zwy', '学习部', '/system/user/resetPwd/2', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-24 16:39:10'), ('126', '通知公告', '2', 'com.ruoyi.project.system.notice.controller.NoticeController.editSave()', '1', 'admin', '学习部', '/system/notice/edit', '127.0.0.1', 'XX XX', '{\"noticeId\":[\"10\"],\"noticeTitle\":[\"测试\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>测试qqqq</p>\"],\"status\":[\"0\"]}', '0', null, '2019-03-24 16:40:27'), ('127', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"学院社团管理\"],\"url\":[\"/system/dept\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 16:53:01'), ('128', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"1015\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"社团查询\"],\"url\":[\"#\"],\"perms\":[\"system:dept:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 16:53:20'), ('129', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"1016\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"社团新增\"],\"url\":[\"#\"],\"perms\":[\"system:dept:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 16:53:41'), ('130', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"1017\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"社团修改\"],\"url\":[\"#\"],\"perms\":[\"system:dept:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 16:53:58'), ('131', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"1018\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"社团删除\"],\"url\":[\"#\"],\"perms\":[\"system:dept:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 16:54:13'), ('132', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"活动管理\"],\"url\":[\"/system/activity\"],\"perms\":[\"system:activity:view\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 17:06:18'), ('133', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2000\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"活动管理\"],\"url\":[\"/system/activity\"],\"perms\":[\"system:activity:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 17:06:38'), ('134', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"成员管理\"],\"url\":[\"/system/member\"],\"perms\":[\"system:member:view\"],\"orderNum\":[\"11\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 17:08:48'), ('135', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"留言管理\"],\"url\":[\"/system/reply\"],\"perms\":[\"system:reply:view\"],\"orderNum\":[\"12\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 17:09:57'), ('136', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '学习部', '/system/menu/remove/2001', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-24 17:11:19'), ('137', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,102,1011,1012,1013,1014\"]}', '0', null, '2019-03-24 19:48:55'), ('138', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"\"]}', '0', null, '2019-03-24 19:49:21'), ('139', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1003,1004,1005,101,1006,1007,1008,1009,1010\"]}', '0', null, '2019-03-24 19:50:21'), ('140', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"\"]}', '0', null, '2019-03-24 19:50:49'), ('141', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"添加活动\"],\"url\":[\"\"],\"perms\":[\"system:activity:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 22:19:35'), ('142', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"perms\":[\"system:activity:delete\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 22:20:17'), ('143', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2004\"],\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"删除活动\"],\"url\":[\"#\"],\"perms\":[\"system:activity:delete\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 22:21:24'), ('144', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"审核通过\"],\"url\":[\"\"],\"perms\":[\"system:activity:pass\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-24 22:22:17'), ('145', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1005,104,1019,107,1034,2000,2003,2,109,1045\"]}', '0', null, '2019-03-26 08:02:32'), ('146', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1005,104,1019,107,1034,2,109,1045\"]}', '0', null, '2019-03-26 08:03:31'), ('147', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"活动查询\"],\"url\":[\"\"],\"perms\":[\"system:activity:list\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-26 08:04:33'), ('148', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1005,104,1019,107,1034,2000,2006,2,109,1045\"]}', '0', null, '2019-03-26 08:04:52'), ('149', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2006\"],\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"活动查询\"],\"url\":[\"#\"],\"perms\":[\"system:activity:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-26 08:05:27'), ('150', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1005,101,1006,104,1019,107,1034,2000,2006,2,109,1045\"]}', '0', null, '2019-03-26 22:39:10'), ('151', '部门管理', '3', 'com.ruoyi.project.system.dept.controller.DeptController.remove()', '1', 'admin', '学习部', '/system/dept/remove/109', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-27 22:56:46'), ('152', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', null, '/system/user/edit', '127.0.0.1', 'XX XX', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"若依\"],\"email\":[\"ry@163.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"1\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', '0', null, '2019-03-27 23:07:22'), ('153', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '学习部', '/system/user/edit', '127.0.0.1', 'XX XX', '{\"userId\":[\"100\"],\"deptId\":[\"106\"],\"userName\":[\"zwy\"],\"email\":[\"123@qq.com\"],\"phonenumber\":[\"18796221234\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"],\"score\":[\"5\"]}', '0', null, '2019-03-27 23:26:54'), ('154', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '学习部', '/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"108\"],\"loginName\":[\"haha\"],\"userName\":[\"haha\"],\"password\":[\"11111\"],\"email\":[\"aaa@qq\"],\"phonenumber\":[\"18796221111\"],\"sex\":[\"0\"],\"score\":[\"2\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2019-03-27 23:30:54'), ('155', '角色管理', '1', 'com.ruoyi.project.system.role.controller.RoleController.addSave()', '1', 'admin', '学习部', '/system/role/add', '127.0.0.1', 'XX XX', '{\"roleName\":[\"信电学院学习部长\"],\"roleKey\":[\"xdxxbz\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,103,1015,1017,107,1034,1035,1036,1037,2000,2003,2004,2006\"]}', '0', null, '2019-03-30 15:59:45'), ('156', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.ruleSave()', '1', 'admin', '学习部', '/system/role/rule', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"信电学院学习部长\"],\"roleKey\":[\"xdxxbz\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,103\"]}', '0', null, '2019-03-30 16:00:02'), ('157', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '学习部', '/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"loginName\":[\"xdxxbz\"],\"userName\":[\"xdxxbz\"],\"password\":[\"12345\"],\"email\":[\"11@q\"],\"phonenumber\":[\"18796222222\"],\"sex\":[\"0\"],\"score\":[\"5\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"4\"]}', '0', null, '2019-03-30 16:01:14'), ('158', '角色管理', '1', 'com.ruoyi.project.system.role.controller.RoleController.addSave()', '1', 'admin', '学习部', '/system/role/add', '127.0.0.1', 'XX XX', '{\"roleName\":[\"信电学院体育部长\"],\"roleKey\":[\"xdxxtybz\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1015,107,1034,1035,1036,1037,2000,2003,2005,2006\"]}', '0', null, '2019-03-30 16:09:03'), ('159', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.ruleSave()', '1', 'admin', '学习部', '/system/role/rule', '127.0.0.1', 'XX XX', '{\"roleId\":[\"101\"],\"roleName\":[\"信电学院体育部长\"],\"roleKey\":[\"xdxxtybz\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,104\"]}', '0', null, '2019-03-30 16:09:13'), ('160', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '学习部', '/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"104\"],\"loginName\":[\"xdxxtybz\"],\"userName\":[\"xdxxtybz\"],\"password\":[\"12345\"],\"email\":[\"aa@q\"],\"phonenumber\":[\"18796220000\"],\"sex\":[\"0\"],\"score\":[\"5\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"4\"]}', '0', null, '2019-03-30 16:10:16'), ('161', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'xdxxtybz', '体育部门', '/system/notice/add', '127.0.0.1', 'XX XX', '{\"noticeTitle\":[\"你好，我是体育部长\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p><br></p>\"],\"status\":[\"0\"]}', '0', null, '2019-03-30 16:11:05'), ('162', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', '1', 'xdxxtybz', '体育部门', '/system/notice/add', '127.0.0.1', 'XX XX', '{\"noticeTitle\":[\"大家好，我是体育部长\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p><br></p>\"],\"status\":[\"0\"]}', '0', null, '2019-03-30 16:11:18'), ('163', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"新闻管理\"],\"url\":[\"system/news\"],\"perms\":[\"system:news:view\"],\"orderNum\":[\"11\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-30 20:32:58'), ('164', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2007\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"新闻管理\"],\"url\":[\"/system/news\"],\"perms\":[\"system:news:view\"],\"orderNum\":[\"11\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-30 20:33:19'), ('165', '用户管理', '1', 'com.ruoyi.project.system.news.controller.NewsController.addSave()', '1', 'admin', '学习部', '/system/news/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"title\":[\"你好\"],\"content\":[\"你好，这是第一个新闻\"],\"status\":[\"0\"]}', '0', null, '2019-03-30 21:01:26'), ('166', '用户管理', '3', 'com.ruoyi.project.system.news.controller.NewsController.remove()', '1', 'admin', '学习部', '/system/news/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"undefined\"]}', '0', null, '2019-03-30 21:09:12'), ('167', '用户管理', '3', 'com.ruoyi.project.system.news.controller.NewsController.remove()', '1', 'admin', '学习部', '/system/news/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"1\"]}', '0', null, '2019-03-30 21:10:00'), ('168', '用户管理', '1', 'com.ruoyi.project.system.news.controller.NewsController.addSave()', '1', 'admin', '学习部', '/system/news/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"title\":[\"你好，这是第二个测试\"],\"content\":[\"你好\"],\"status\":[\"0\"]}', '0', null, '2019-03-30 21:10:18'), ('169', '用户管理', '1', 'com.ruoyi.project.system.news.controller.NewsController.addSave()', '1', 'admin', '学习部', '/system/news/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"title\":[\"测试\"],\"content\":[\"<p>你好</p>\"],\"status\":[\"0\"]}', '0', null, '2019-03-30 21:46:42'), ('170', '新闻管理', '2', 'com.ruoyi.project.system.news.controller.NewsController.editSave()', '1', 'admin', '学习部', '/system/news/edit', '127.0.0.1', 'XX XX', '{\"status\":[\"0\"],\"newsId\":[\"3\"],\"title\":[\"测试\"],\"content\":[\"<p>你好修改</p>\"]}', '0', null, '2019-03-30 22:14:56'), ('171', '用户管理', '3', 'com.ruoyi.project.system.news.controller.NewsController.remove()', '1', 'admin', '学习部', '/system/news/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"3,2\"]}', '0', null, '2019-03-30 22:17:20'), ('172', '用户管理', '1', 'com.ruoyi.project.system.news.controller.NewsController.addSave()', '1', 'admin', '学习部', '/system/news/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"title\":[\"你好\"],\"content\":[\"<p>你好啊</p>\"],\"status\":[\"0\"]}', '0', null, '2019-03-30 22:53:11'), ('173', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '学习部', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2002\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"留言管理\"],\"url\":[\"/system/comment\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"12\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 09:23:16'), ('174', '评论管理管理', '1', 'com.ruoyi.project.system.comment.controller.CommentController.addSave()', '1', 'admin', '学习部', '/system/comment/add', '127.0.0.1', 'XX XX', '{\"content\":[\"<p>你好啊</p>\"]}', '0', null, '2019-03-31 09:39:31'), ('175', '评论管理管理', '1', 'com.ruoyi.project.system.comment.controller.CommentController.addSave()', '1', 'admin', '学习部', '/system/comment/add', '127.0.0.1', 'XX XX', '{\"content\":[\"<p>你好啊啊啊啊</p>\"]}', '0', null, '2019-03-31 09:43:59'), ('176', '评论管理', '3', 'com.ruoyi.project.system.comment.controller.CommentController.remove()', '1', 'admin', '学习部', '/system/comment/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2019-03-31 09:44:16'), ('177', '评论管理', '3', 'com.ruoyi.project.system.comment.controller.CommentController.remove()', '1', 'admin', '学习部', '/system/comment/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2019-03-31 09:45:23'), ('178', '评论管理', '3', 'com.ruoyi.project.system.comment.controller.CommentController.remove()', '1', 'admin', '学习部', '/system/comment/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2019-03-31 09:46:39'), ('179', '评论管理', '3', 'com.ruoyi.project.system.comment.controller.CommentController.remove()', '1', 'admin', '学习部', '/system/comment/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2,1\"]}', '0', null, '2019-03-31 09:47:09'), ('180', '评论管理', '3', 'com.ruoyi.project.system.comment.controller.CommentController.remove()', '1', 'admin', '学习部', '/system/comment/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2019-03-31 09:49:01'), ('181', '评论管理', '2', 'com.ruoyi.project.system.comment.controller.CommentController.editSave()', '1', 'admin', '学习部', '/system/comment/edit', '127.0.0.1', 'XX XX', '{\"status\":[\"0\"],\"commentId\":[\"1\"],\"content\":[\"<p>你好啊aaa</p>\"]}', '1', 'Invalid bound statement (not found): com.ruoyi.project.system.comment.mapper.CommentMapper.updateComment', '2019-03-31 09:52:13'), ('182', '评论管理', '2', 'com.ruoyi.project.system.comment.controller.CommentController.editSave()', '1', 'admin', '学习部', '/system/comment/edit', '127.0.0.1', 'XX XX', '{\"status\":[\"0\"],\"commentId\":[\"1\"],\"content\":[\"<p>你好啊aa</p>\"]}', '1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'commendId\' in \'class com.ruoyi.project.system.comment.domain.Comment\'', '2019-03-31 09:53:43'), ('183', '评论管理', '2', 'com.ruoyi.project.system.comment.controller.CommentController.editSave()', '1', 'admin', '学习部', '/system/comment/edit', '127.0.0.1', 'XX XX', '{\"status\":[\"0\"],\"commentId\":[\"1\"],\"content\":[\"<p>你好啊aaaa</p>\"]}', '0', null, '2019-03-31 09:55:25'), ('184', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"个人留言管理\"],\"url\":[\"/system/comment/my\"],\"perms\":[\"system:comment:my\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:09:32'), ('185', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2002\"],\"menuType\":[\"C\"],\"menuName\":[\"所有留言\"],\"url\":[\"/system/comment\"],\"perms\":[\"system:comment:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:14:20'), ('186', '评论管理管理', '1', 'com.ruoyi.project.system.comment.controller.CommentController.addSave()', '1', 'admin', '学习部', '/system/comment/add', '127.0.0.1', 'XX XX', '{\"content\":[\"<p>aaaaa</p>\"]}', '0', null, '2019-03-31 10:14:40'), ('187', '评论管理管理', '1', 'com.ruoyi.project.system.comment.controller.CommentController.addSave()', '1', 'admin', '学习部', '/system/comment/add', '127.0.0.1', 'XX XX', '{\"content\":[\"<p>asadas</p>\"]}', '0', null, '2019-03-31 10:15:50'), ('188', '评论管理', '3', 'com.ruoyi.project.system.comment.controller.CommentController.remove()', '1', 'admin', '学习部', '/system/comment/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"4,3,1\"]}', '0', null, '2019-03-31 10:26:32'), ('189', '评论管理管理', '1', 'com.ruoyi.project.system.comment.controller.CommentController.addSave()', '1', 'admin', '学习部', '/system/comment/add', '127.0.0.1', 'XX XX', '{\"content\":[\"<p>你好</p>\"]}', '0', null, '2019-03-31 10:26:38'), ('190', '评论管理', '3', 'com.ruoyi.project.system.comment.controller.CommentController.removeMy()', '1', 'admin', '学习部', '/system/comment/removeMy', '127.0.0.1', 'XX XX', '{\"ids\":[\"5\"]}', '0', null, '2019-03-31 10:26:51'), ('191', '评论管理管理', '1', 'com.ruoyi.project.system.comment.controller.CommentController.addSave()', '1', 'admin', '学习部', '/system/comment/add', '127.0.0.1', 'XX XX', '{\"content\":[\"<p>哈哈哈</p>\"]}', '0', null, '2019-03-31 10:27:18'), ('192', '评论管理', '2', 'com.ruoyi.project.system.comment.controller.CommentController.editSave()', '1', 'admin', '学习部', '/system/comment/edit', '127.0.0.1', 'XX XX', '{\"status\":[\"0\"],\"commentId\":[\"6\"],\"content\":[\"<p>哈哈哈asdasd</p>\"]}', '0', null, '2019-03-31 10:30:46'), ('193', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"新增留言\"],\"url\":[\"\"],\"perms\":[\"system:comment:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:35:20'), ('194', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑个人留言\"],\"url\":[\"\"],\"perms\":[\"system:comment:editMy\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:35:58'), ('195', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"删除个人留言\"],\"url\":[\"\"],\"perms\":[\"system:comment:removeMy\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:36:46'), ('196', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"新增留言\"],\"url\":[\"\"],\"perms\":[\"system:comment:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:37:18'), ('197', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"编辑留言\"],\"url\":[\"\"],\"perms\":[\"system:comment:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:37:47'), ('198', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"删除留言\"],\"url\":[\"\"],\"perms\":[\"system:comment:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:38:36'), ('199', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '学习部', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"查询留言\"],\"url\":[\"\"],\"perms\":[\"system:comment:list\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-03-31 10:39:10'), ('200', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1005,101,1006,104,1019,107,1034,2000,2006,2002,2008,2010,2011,2012,2009,2016,2,109,1045\"]}', '0', null, '2019-03-31 10:39:36'), ('201', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"跆拳道干事\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1005,101,1006,104,1019,107,1034,2000,2006,2002,2008,2010,2011,2012,2009,2016,2,109,1045\"]}', '0', null, '2019-03-31 10:40:11'), ('202', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"信电学院学习部长\"],\"roleKey\":[\"xdxxbz\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,103,1015,1017,107,1034,1035,1036,1037,2000,2003,2004,2006,2002,2008,2010,2011,2012,2009,2013,2014,2015,2016,2007\"]}', '0', null, '2019-03-31 10:40:25'), ('203', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"101\"],\"roleName\":[\"信电学院体育部长\"],\"roleKey\":[\"xdxxtybz\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,103,1015,107,1034,1035,1036,1037,2000,2003,2005,2006,2002,2008,2010,2011,2012,2009,2013,2014,2015,2016,2007\"]}', '0', null, '2019-03-31 10:40:38'), ('204', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.ruleSave()', '1', 'admin', '学习部', '/system/role/rule', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"跆拳道干事\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,103\"]}', '0', null, '2019-03-31 10:41:48'), ('205', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '学习部', '/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"学习部干事\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1005,101,1006,104,1019,107,1034,2000,2006,2002,2008,2010,2011,2012,2009,2016,2,109,1045\"]}', '0', null, '2019-03-31 10:41:58'), ('206', '评论管理管理', '1', 'com.ruoyi.project.system.comment.controller.CommentController.addSave()', '1', 'zwy', '财务部门', '/system/comment/add', '127.0.0.1', 'XX XX', '{\"content\":[\"<p>你好</p>\"]}', '0', null, '2019-03-31 10:42:29');
COMMIT;

-- ----------------------------
--  Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
--  Records of `sys_post`
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES ('1', 'ceo', '校书记', '1', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:13:52', ''), ('2', 'xbz', '校部长', '2', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:14:13', ''), ('3', 'stzx', '社团主席', '3', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:14:30', ''), ('4', 'user', '普通团员', '4', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 09:14:46', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 19:50:49', '管理员'), ('2', '学习部干事', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-31 10:41:58', '普通角色'), ('100', '信电学院学习部长', 'xdxxbz', '3', '2', '0', '0', 'admin', '2019-03-30 15:59:45', 'admin', '2019-03-31 10:40:25', ''), ('101', '信电学院体育部长', 'xdxxtybz', '4', '2', '0', '0', 'admin', '2019-03-30 16:09:03', 'admin', '2019-03-31 10:40:37', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
--  Records of `sys_role_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES ('2', '100'), ('2', '101'), ('2', '103'), ('100', '100'), ('100', '101'), ('100', '103'), ('101', '100'), ('101', '101'), ('101', '104');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('2', '1'), ('2', '2'), ('2', '100'), ('2', '101'), ('2', '104'), ('2', '107'), ('2', '109'), ('2', '1000'), ('2', '1005'), ('2', '1006'), ('2', '1019'), ('2', '1034'), ('2', '1045'), ('2', '2000'), ('2', '2002'), ('2', '2006'), ('2', '2008'), ('2', '2009'), ('2', '2010'), ('2', '2011'), ('2', '2012'), ('2', '2016'), ('100', '1'), ('100', '100'), ('100', '103'), ('100', '107'), ('100', '1000'), ('100', '1015'), ('100', '1017'), ('100', '1034'), ('100', '1035'), ('100', '1036'), ('100', '1037'), ('100', '2000'), ('100', '2002'), ('100', '2003'), ('100', '2004'), ('100', '2006'), ('100', '2007'), ('100', '2008'), ('100', '2009'), ('100', '2010'), ('100', '2011'), ('100', '2012'), ('100', '2013'), ('100', '2014'), ('100', '2015'), ('100', '2016'), ('101', '1'), ('101', '103'), ('101', '107'), ('101', '1015'), ('101', '1034'), ('101', '1035'), ('101', '1036'), ('101', '1037'), ('101', '2000'), ('101', '2002'), ('101', '2003'), ('101', '2005'), ('101', '2006'), ('101', '2007'), ('101', '2008'), ('101', '2009'), ('101', '2010'), ('101', '2011'), ('101', '2012'), ('101', '2013'), ('101', '2014'), ('101', '2015'), ('101', '2016');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(20) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-03-31 10:44:06', 'admin', '2018-03-16 11:33:00', 'ry', '2019-03-31 10:44:05', '管理员', '10'), ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员', null), ('100', '106', 'zwy', 'zwy', '00', '123@qq.com', '18796221234', '0', '', 'd0dc278c93d0df41a36ef98a95764d7d', '7168d6', '0', '0', '127.0.0.1', '2019-03-31 10:43:27', 'admin', '2019-03-24 09:17:50', 'admin', '2019-03-31 10:43:26', '', '5'), ('101', '108', 'haha', 'haha', '00', 'aaa@qq', '18796221111', '0', '', 'ebdd08dac8e0363205d60a51d8a32290', 'b7af03', '0', '0', '', null, 'admin', '2019-03-27 23:30:54', '', null, '', '0'), ('102', '103', 'xdxxbz', 'xdxxbz', '00', '11@q', '18796222222', '0', '', '481a54627e449b43c599fefd72d40306', '73a450', '0', '0', '127.0.0.1', '2019-03-30 16:12:12', 'admin', '2019-03-30 16:01:14', '', '2019-03-30 16:12:11', '', '0'), ('103', '104', 'xdxxtybz', 'xdxxtybz', '00', 'aa@q', '18796220000', '0', '', 'daabbb41100e23276c97bd006e1e795e', '9df150', '0', '0', '127.0.0.1', '2019-03-30 16:10:34', 'admin', '2019-03-30 16:10:16', '', '2019-03-30 16:10:34', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
--  Records of `sys_user_online`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_online` VALUES ('cd91ed64-1983-4ef8-b12f-0687145197f3', 'admin', '学习部', '127.0.0.1', 'XX XX', 'Chrome', 'Mac OS X', 'on_line', '2019-03-31 10:44:00', '2019-03-31 10:44:06', '1800000');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
--  Records of `sys_user_post`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES ('1', '1'), ('100', '4'), ('101', '4'), ('102', '4'), ('103', '4'), ('2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1'), ('2', '2'), ('100', '2'), ('101', '2'), ('102', '100'), ('103', '101');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
