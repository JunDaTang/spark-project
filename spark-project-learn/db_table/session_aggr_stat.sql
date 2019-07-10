/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-07-10 16:36:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for session_aggr_stat
-- ----------------------------
DROP TABLE IF EXISTS `session_aggr_stat`;
CREATE TABLE `session_aggr_stat` (
  `task_id` int(11) DEFAULT NULL,
  `session_count` int(11) DEFAULT NULL,
  `1s_3s` double DEFAULT NULL,
  `4s_6s` double DEFAULT NULL,
  `7s_9s` double DEFAULT NULL,
  `10s_30s` double DEFAULT NULL,
  `30s_60s` double DEFAULT NULL,
  `1m_3m` double DEFAULT NULL,
  `3m_10m` double DEFAULT NULL,
  `10m_30m` double DEFAULT NULL,
  `30m` double DEFAULT NULL,
  `1_3` double DEFAULT NULL,
  `4_6` double DEFAULT NULL,
  `7_9` double DEFAULT NULL,
  `10_30` double DEFAULT NULL,
  `30_60` double DEFAULT NULL,
  `60` double DEFAULT NULL,
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session_aggr_stat
-- ----------------------------
INSERT INTO `session_aggr_stat` VALUES ('2', '39', '0', '0', '0', '0', '0', '0', '0.03', '0.05', '0.9', '0.08', '0.1', '0.18', '0.62', '0.03', '0');
INSERT INTO `session_aggr_stat` VALUES ('2', '10', '0', '0', '0', '0', '0', '0.1', '0', '0.1', '0.8', '0.2', '0.3', '0.3', '0.2', '0', '0');
INSERT INTO `session_aggr_stat` VALUES ('2', '40', '0', '0', '0', '0', '0', '0', '0', '0.03', '0.95', '0.03', '0.17', '0.23', '0.57', '0', '0');
INSERT INTO `session_aggr_stat` VALUES ('2', '30', '0', '0', '0', '0', '0', '0', '0.03', '0.1', '0.83', '0.13', '0.1', '0.17', '0.6', '0', '0');
INSERT INTO `session_aggr_stat` VALUES ('2', '29', '0', '0', '0', '0', '0', '0', '0', '0', '0.97', '0.07', '0.03', '0.07', '0.79', '0.03', '0');
INSERT INTO `session_aggr_stat` VALUES ('2', '30', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0.2', '0.2', '0.6', '0', '0');
INSERT INTO `session_aggr_stat` VALUES ('2', '20', '0', '0', '0', '0', '0', '0', '0', '0.05', '0.9', '0.1', '0.15', '0.25', '0.5', '0', '0');
INSERT INTO `session_aggr_stat` VALUES ('2', '49', '0', '0', '0', '0', '0', '0', '0', '0.02', '0.96', '0.06', '0.04', '0.16', '0.71', '0.02', '0');
