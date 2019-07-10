/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-07-10 14:32:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for session_detail
-- ----------------------------
DROP TABLE IF EXISTS `session_detail`;
CREATE TABLE `session_detail` (
  `task_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `action_time` varchar(255) DEFAULT NULL,
  `search_keyword` varchar(255) DEFAULT NULL,
  `click_category_id` int(11) DEFAULT NULL,
  `click_product_id` int(11) DEFAULT NULL,
  `order_category_ids` varchar(255) DEFAULT NULL,
  `order_product_ids` varchar(255) DEFAULT NULL,
  `pay_category_ids` varchar(255) DEFAULT NULL,
  `pay_product_ids` varchar(255) DEFAULT NULL,
  KEY `idx_task_id` (`task_id`),
  KEY `idx_session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session_detail
-- ----------------------------
INSERT INTO `session_detail` VALUES ('2', '79', '31984461526142cdaaa1604bece90e35', '6', '2019-07-10 1:01:23', null, '0', '0', '68', '8', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '31984461526142cdaaa1604bece90e35', '0', '2019-07-10 1:29:33', null, '0', '0', '84', '80', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '31984461526142cdaaa1604bece90e35', '4', '2019-07-10 1:22:00', '呷哺呷哺', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '31984461526142cdaaa1604bece90e35', '0', '2019-07-10 1:43:01', null, '0', '0', null, null, '42', '38');
INSERT INTO `session_detail` VALUES ('2', '79', '31984461526142cdaaa1604bece90e35', '4', '2019-07-10 1:00:00', '新辣道鱼火锅', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '31984461526142cdaaa1604bece90e35', '7', '2019-07-10 1:30:31', null, '0', '0', '69', '76', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '31984461526142cdaaa1604bece90e35', '0', '2019-07-10 1:46:54', null, '0', '0', '16', '61', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'dc94d16740454186abb109291c979621', '9', '2019-07-10 20:24:23', '火锅', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'dc94d16740454186abb109291c979621', '9', '2019-07-10 20:27:06', null, '0', '0', '39', '32', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '9', '2019-07-10 15:36:19', null, '39', '93', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '0', '2019-07-10 15:51:34', null, '2', '40', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '2', '2019-07-10 15:55:21', null, '0', '0', null, null, '98', '92');
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '1', '2019-07-10 15:29:09', null, '0', '0', null, null, '34', '2');
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '4', '2019-07-10 15:22:05', null, '0', '0', null, null, '4', '31');
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '6', '2019-07-10 15:42:19', null, '0', '0', null, null, '55', '15');
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '6', '2019-07-10 15:16:57', '国贸大厦', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '4', '2019-07-10 15:06:56', '新辣道鱼火锅', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '1', '2019-07-10 15:04:07', null, '0', '0', null, null, '41', '30');
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '6', '2019-07-10 15:43:17', null, '46', '23', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '8', '2019-07-10 15:10:45', null, '0', '0', null, null, '28', '51');
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '2', '2019-07-10 15:03:06', null, '0', '0', null, null, '90', '92');
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '1', '2019-07-10 15:26:54', null, '0', '0', null, null, '82', '70');
INSERT INTO `session_detail` VALUES ('2', '79', 'c8ac2d850fee49ba9e60aba134c2fdd6', '9', '2019-07-10 15:58:18', '呷哺呷哺', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '019bf9de4fb34c6b93cd35e6f6dbcb4f', '3', '2019-07-10 16:26:33', null, '0', '0', '30', '89', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '019bf9de4fb34c6b93cd35e6f6dbcb4f', '4', '2019-07-10 16:28:15', null, '0', '0', null, null, '35', '50');
INSERT INTO `session_detail` VALUES ('2', '79', '019bf9de4fb34c6b93cd35e6f6dbcb4f', '5', '2019-07-10 16:29:28', null, '0', '0', '24', '16', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '019bf9de4fb34c6b93cd35e6f6dbcb4f', '9', '2019-07-10 16:53:53', null, '0', '0', '83', '27', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1426d8254ae241ff9cc3bfd33594b725', '8', '2019-07-10 4:28:08', null, '0', '0', '13', '50', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1426d8254ae241ff9cc3bfd33594b725', '6', '2019-07-10 4:08:19', null, '0', '0', null, null, '89', '6');
INSERT INTO `session_detail` VALUES ('2', '79', '1426d8254ae241ff9cc3bfd33594b725', '2', '2019-07-10 4:43:33', null, '48', '34', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1426d8254ae241ff9cc3bfd33594b725', '6', '2019-07-10 4:56:02', '日本料理', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1426d8254ae241ff9cc3bfd33594b725', '8', '2019-07-10 4:55:31', null, '0', '0', null, null, '42', '83');
INSERT INTO `session_detail` VALUES ('2', '79', '1426d8254ae241ff9cc3bfd33594b725', '4', '2019-07-10 4:49:19', null, '3', '69', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1426d8254ae241ff9cc3bfd33594b725', '2', '2019-07-10 4:10:49', null, '7', '90', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1e9a162a98484f71a20d32cbef7871fb', '8', '2019-07-10 17:55:02', null, '0', '0', '99', '90', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1e9a162a98484f71a20d32cbef7871fb', '9', '2019-07-10 17:21:17', null, '6', '17', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1e9a162a98484f71a20d32cbef7871fb', '4', '2019-07-10 17:13:40', '太古商场', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '1e9a162a98484f71a20d32cbef7871fb', '9', '2019-07-10 17:47:13', '温泉', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '4', '2019-07-10 2:21:08', null, '0', '0', null, null, '67', '4');
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '1', '2019-07-10 2:53:13', null, '0', '0', null, null, '14', '74');
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '0', '2019-07-10 2:56:03', '蛋糕', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '0', '2019-07-10 2:05:08', null, '0', '0', null, null, '26', '11');
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '6', '2019-07-10 2:20:28', null, '10', '46', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '3', '2019-07-10 2:43:09', null, '0', '0', '76', '51', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '6', '2019-07-10 2:50:22', '日本料理', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '1', '2019-07-10 2:12:56', '蛋糕', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '9', '2019-07-10 2:13:53', '国贸大厦', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '8', '2019-07-10 2:55:32', null, '0', '0', '32', '71', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '0', '2019-07-10 2:02:26', null, '0', '0', null, null, '64', '99');
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '7', '2019-07-10 2:52:42', null, '33', '23', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '4', '2019-07-10 2:41:32', null, '0', '0', null, null, '47', '96');
INSERT INTO `session_detail` VALUES ('2', '79', 'ae3508bb85e34d73978d8b07368dc2cc', '7', '2019-07-10 2:09:33', '火锅', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'b7f807b77c88410f82c4b4bf1e5fbc2b', '1', '2019-07-10 8:03:42', null, '34', '93', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'b7f807b77c88410f82c4b4bf1e5fbc2b', '1', '2019-07-10 8:23:07', null, '55', '26', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'b7f807b77c88410f82c4b4bf1e5fbc2b', '7', '2019-07-10 8:12:30', null, '0', '0', null, null, '44', '51');
INSERT INTO `session_detail` VALUES ('2', '79', 'b7f807b77c88410f82c4b4bf1e5fbc2b', '4', '2019-07-10 8:29:46', null, '69', '55', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', 'b7f807b77c88410f82c4b4bf1e5fbc2b', '5', '2019-07-10 8:44:43', null, '0', '0', '43', '37', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '149957de942146338015c78303ef816e', '2', '2019-07-10 21:25:18', '重庆小面', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '149957de942146338015c78303ef816e', '3', '2019-07-10 21:00:25', null, '0', '0', null, null, '36', '27');
INSERT INTO `session_detail` VALUES ('2', '79', '149957de942146338015c78303ef816e', '9', '2019-07-10 21:50:17', null, '0', '0', '0', '15', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '119768ad6e534e169176a4890bcb5f79', '1', '2019-07-10 12:18:08', null, '0', '0', null, null, '83', '3');
INSERT INTO `session_detail` VALUES ('2', '79', '119768ad6e534e169176a4890bcb5f79', '1', '2019-07-10 12:10:11', null, '0', '0', '63', '12', null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '119768ad6e534e169176a4890bcb5f79', '2', '2019-07-10 12:16:31', null, '56', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '119768ad6e534e169176a4890bcb5f79', '2', '2019-07-10 12:41:46', null, '0', '0', null, null, '80', '47');
INSERT INTO `session_detail` VALUES ('2', '79', '119768ad6e534e169176a4890bcb5f79', '9', '2019-07-10 12:28:31', '温泉', '0', '0', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '119768ad6e534e169176a4890bcb5f79', '3', '2019-07-10 12:45:49', null, '0', '0', null, null, '25', '14');
INSERT INTO `session_detail` VALUES ('2', '79', '119768ad6e534e169176a4890bcb5f79', '0', '2019-07-10 12:28:37', null, '32', '22', null, null, null, null);
INSERT INTO `session_detail` VALUES ('2', '79', '119768ad6e534e169176a4890bcb5f79', '3', '2019-07-10 12:55:14', null, '0', '0', null, null, '17', '21');
