/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-07-10 14:32:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for top10_category
-- ----------------------------
DROP TABLE IF EXISTS `top10_category`;
CREATE TABLE `top10_category` (
  `task_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `click_count` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `pay_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of top10_category
-- ----------------------------
