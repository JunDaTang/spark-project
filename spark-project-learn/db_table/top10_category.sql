/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-08-06 09:22:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for top10_category
-- ----------------------------
DROP TABLE IF EXISTS `top10_category`;
CREATE TABLE `top10_category` (
  `task_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `click_count` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `pay_count` int(11) DEFAULT NULL,
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of top10_category
-- ----------------------------
INSERT INTO `top10_category` VALUES ('2', '89', '28', '14', '18');
INSERT INTO `top10_category` VALUES ('2', '43', '27', '17', '22');
INSERT INTO `top10_category` VALUES ('2', '20', '26', '26', '16');
INSERT INTO `top10_category` VALUES ('2', '75', '26', '21', '23');
INSERT INTO `top10_category` VALUES ('2', '41', '26', '17', '17');
INSERT INTO `top10_category` VALUES ('2', '88', '26', '14', '9');
INSERT INTO `top10_category` VALUES ('2', '53', '25', '25', '15');
INSERT INTO `top10_category` VALUES ('2', '94', '25', '13', '21');
INSERT INTO `top10_category` VALUES ('2', '7', '24', '29', '19');
INSERT INTO `top10_category` VALUES ('2', '98', '24', '28', '19');
