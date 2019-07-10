/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-07-10 14:32:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for session_random_extract
-- ----------------------------
DROP TABLE IF EXISTS `session_random_extract`;
CREATE TABLE `session_random_extract` (
  `task_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `search_keywords` varchar(255) DEFAULT NULL,
  `click_category_idx` varchar(255) DEFAULT NULL,
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session_random_extract
-- ----------------------------
INSERT INTO `session_random_extract` VALUES ('2', '1e9a162a98484f71a20d32cbef7871fb', '2019-07-10 17:13:40', '太古商场,温泉', '0,6');
INSERT INTO `session_random_extract` VALUES ('2', '1426d8254ae241ff9cc3bfd33594b725', '2019-07-10 04:08:19', '日本料理', '0,48,3,7');
INSERT INTO `session_random_extract` VALUES ('2', '019bf9de4fb34c6b93cd35e6f6dbcb4f', '2019-07-10 16:26:33', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', 'dc94d16740454186abb109291c979621', '2019-07-10 20:24:23', '火锅', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'b7f807b77c88410f82c4b4bf1e5fbc2b', '2019-07-10 08:03:42', null, '34,55,0,69');
INSERT INTO `session_random_extract` VALUES ('2', '149957de942146338015c78303ef816e', '2019-07-10 21:00:25', '重庆小面', '0');
INSERT INTO `session_random_extract` VALUES ('2', '119768ad6e534e169176a4890bcb5f79', '2019-07-10 12:10:11', '温泉', '0,56,32');
INSERT INTO `session_random_extract` VALUES ('2', 'ae3508bb85e34d73978d8b07368dc2cc', '2019-07-10 02:02:26', '蛋糕,日本料理,国贸大厦,火锅', '0,10,33');
INSERT INTO `session_random_extract` VALUES ('2', 'c8ac2d850fee49ba9e60aba134c2fdd6', '2019-07-10 15:03:06', '国贸大厦,新辣道鱼火锅,呷哺呷哺', '39,2,0,46');
INSERT INTO `session_random_extract` VALUES ('2', '31984461526142cdaaa1604bece90e35', '2019-07-10 01:00:00', '呷哺呷哺,新辣道鱼火锅', '0');
