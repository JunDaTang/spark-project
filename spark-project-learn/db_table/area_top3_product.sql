/*
Navicat MySQL Data Transfer

Source Server         : Jed
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2020-04-27 21:59:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area_top3_product
-- ----------------------------
DROP TABLE IF EXISTS `area_top3_product`;
CREATE TABLE `area_top3_product` (
  `task_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `area_level` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `city_infos` varchar(255) DEFAULT NULL,
  `click_count` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area_top3_product
-- ----------------------------
INSERT INTO `area_top3_product` VALUES ('10000', '华南', 'A级', '10000', 'CityInfos', '10000', 'ProductName', '0');
INSERT INTO `area_top3_product` VALUES ('10001', '华南', 'A级', '10000', 'CityInfos', '10000', 'ProductName', '0');
INSERT INTO `area_top3_product` VALUES ('10002', '华南', 'A级', '10000', 'CityInfos', '10000', 'ProductName', '0');
INSERT INTO `area_top3_product` VALUES ('10003', '华南', 'A级', '10000', 'CityInfos', '10000', 'ProductName', '0');
