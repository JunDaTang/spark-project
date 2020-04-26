/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2020-04-26 18:03:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `finish_time` varchar(255) DEFAULT NULL,
  `task_type` varchar(255) DEFAULT NULL,
  `task_status` varchar(255) DEFAULT NULL,
  `task_param` text,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', 'test', '2019-07-07', '2019-07-07', '2019-07-10', '', null, null);
INSERT INTO `task` VALUES ('2', 'test_task', '2019-07-07', '2019-07-07', '2019-07-10', null, null, '{\"startAge\":[\"10\"], \"endAge\":[\"50\"],\"startDate\":[\"2019-07-04\"],\"endDate\":[\"2019-08-05\"]}');
INSERT INTO `task` VALUES ('4', 'test_product', '2019-07-07', '2019-07-07', '2019-07-07', null, null, '{\"startAge\":[\"10\"], \"endAge\":[\"50\"],\"startDate\":[\"2020-04-11\"],\"endDate\":[\"2020-04-26\"]}');
