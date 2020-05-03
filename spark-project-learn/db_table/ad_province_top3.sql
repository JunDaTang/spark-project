/*
Navicat MySQL Data Transfer

Source Server         : mysql_localhost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2020-05-03 18:07:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ad_province_top3
-- ----------------------------
DROP TABLE IF EXISTS `ad_province_top3`;
CREATE TABLE `ad_province_top3` (
  `date` varchar(30) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `ad_id` int(11) DEFAULT NULL,
  `click_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad_province_top3
-- ----------------------------
