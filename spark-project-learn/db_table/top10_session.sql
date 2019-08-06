/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-08-06 09:22:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for top10_session
-- ----------------------------
DROP TABLE IF EXISTS `top10_session`;
CREATE TABLE `top10_session` (
  `task_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `click_count` int(11) DEFAULT NULL,
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of top10_session
-- ----------------------------
INSERT INTO `top10_session` VALUES ('2', '41', '8e977189a7f84eedab672865d3f50494', '2');
INSERT INTO `top10_session` VALUES ('2', '41', '7f195e05aeb74da8b2594351aef00503', '1');
INSERT INTO `top10_session` VALUES ('2', '41', '50770f8a79d34c9b8c57de4362a64982', '1');
INSERT INTO `top10_session` VALUES ('2', '41', '650b4bfd69d9495d8f0517e063ff5287', '1');
INSERT INTO `top10_session` VALUES ('2', '41', 'c9d75e8154284a5e81b0ce6774c13bb1', '1');
INSERT INTO `top10_session` VALUES ('2', '41', 'b1b84a29b9144e6faf333cb83596b428', '1');
INSERT INTO `top10_session` VALUES ('2', '41', 'dba21b8afec547bd87f6f6bff32440dd', '1');
INSERT INTO `top10_session` VALUES ('2', '41', '63cbf0b4a99c4fe9a5c2b2c24574703f', '1');
INSERT INTO `top10_session` VALUES ('2', '41', '4c72cdff09044011856eb4fb53c8bb7e', '1');
INSERT INTO `top10_session` VALUES ('2', '41', 'b95cc080e35c4dcda4b5d5ff099e6afb', '1');
INSERT INTO `top10_session` VALUES ('2', '53', '3dd388616aa44f13ba5b3bc97bd0cefa', '1');
INSERT INTO `top10_session` VALUES ('2', '53', 'ac0d8f2815d54048a71cd169c6474bf2', '1');
INSERT INTO `top10_session` VALUES ('2', '53', '2ecfcdde85dc4c208be068ce383c7ab4', '1');
INSERT INTO `top10_session` VALUES ('2', '53', 'af20ce4703e5477798bcf382cc022606', '1');
INSERT INTO `top10_session` VALUES ('2', '53', 'e645f198c80b42d89277a738528b5ac3', '1');
INSERT INTO `top10_session` VALUES ('2', '53', '35d86e145e2a497788bb38bc91a3acdc', '1');
INSERT INTO `top10_session` VALUES ('2', '53', 'b95cc080e35c4dcda4b5d5ff099e6afb', '1');
INSERT INTO `top10_session` VALUES ('2', '53', '1b11f1782fad402382cd1029ce60c70a', '1');
INSERT INTO `top10_session` VALUES ('2', '53', '10dc8357db244e07af98db6c894930a2', '1');
INSERT INTO `top10_session` VALUES ('2', '53', '38294d063b954fc98aa26f62833dbcb6', '1');
INSERT INTO `top10_session` VALUES ('2', '98', 'bf646693801b4668880515ee76beeb16', '2');
INSERT INTO `top10_session` VALUES ('2', '98', '91cb90fc123b4951ad8d6706b83ef6bd', '1');
INSERT INTO `top10_session` VALUES ('2', '98', 'c9d75e8154284a5e81b0ce6774c13bb1', '1');
INSERT INTO `top10_session` VALUES ('2', '98', '3270d030294642e78c0a7f517fd607a1', '1');
INSERT INTO `top10_session` VALUES ('2', '98', '121b62763414437989cac7f349fb27f5', '1');
INSERT INTO `top10_session` VALUES ('2', '98', '003ece38a9fa451fb87bc398113e6f30', '1');
INSERT INTO `top10_session` VALUES ('2', '98', 'd1a343c9b8c74a7ab9942c8b67d9d22d', '1');
INSERT INTO `top10_session` VALUES ('2', '98', '260693657b1145dbbeeed65cc841c519', '1');
INSERT INTO `top10_session` VALUES ('2', '98', '2fefa25d9b7c4e508fbf4a036f167ea7', '1');
INSERT INTO `top10_session` VALUES ('2', '98', '4e938d620b954a07b01ac57b51d89acc', '1');
INSERT INTO `top10_session` VALUES ('2', '75', '399d3d7ce7f4416fac27d9ee13fa7f48', '1');
INSERT INTO `top10_session` VALUES ('2', '75', '075977b89c5e4d18a9a341a509acfdd1', '1');
INSERT INTO `top10_session` VALUES ('2', '75', '87584198e9484ce586a831aaa9ca4969', '1');
INSERT INTO `top10_session` VALUES ('2', '75', 'b1b84a29b9144e6faf333cb83596b428', '1');
INSERT INTO `top10_session` VALUES ('2', '75', '8f0ca5d645c64e8495ef381cc6837281', '1');
INSERT INTO `top10_session` VALUES ('2', '75', 'd1b7c3da556a4027b7926dd027f54ae7', '1');
INSERT INTO `top10_session` VALUES ('2', '75', '101a1e20e3d14e55ad2762fed3c1825a', '1');
INSERT INTO `top10_session` VALUES ('2', '75', 'c89eff42d0b84103892bbe5cfcc3e6b7', '1');
INSERT INTO `top10_session` VALUES ('2', '75', 'e032a113f82a4e03981ce376e396ce47', '1');
INSERT INTO `top10_session` VALUES ('2', '75', '4cb52edf908e4ec2a4a4d0eca9a7d28b', '1');
INSERT INTO `top10_session` VALUES ('2', '89', 'acc34ef7ddfe49c59fabb2a4e46ebde7', '1');
INSERT INTO `top10_session` VALUES ('2', '89', '075977b89c5e4d18a9a341a509acfdd1', '1');
INSERT INTO `top10_session` VALUES ('2', '89', 'e3be1259a9f340039543068c064738e9', '1');
INSERT INTO `top10_session` VALUES ('2', '89', 'ddbb23bcb6e042748a1f696a20882974', '1');
INSERT INTO `top10_session` VALUES ('2', '89', 'e1ee0384b63847efb82b06675f0d6000', '1');
INSERT INTO `top10_session` VALUES ('2', '89', '9b7f635d301848a380b4471601a38a79', '1');
INSERT INTO `top10_session` VALUES ('2', '89', 'ff3d2f0698f5437e9effcc6b52fe7fc8', '1');
INSERT INTO `top10_session` VALUES ('2', '89', '48bab349f96e4230b5c76e54047ae8a0', '1');
INSERT INTO `top10_session` VALUES ('2', '89', '7136a8c4f54a4a80b9b81f3780f09006', '1');
INSERT INTO `top10_session` VALUES ('2', '89', '8e8fe09c9e2440a68e96cd461449f18e', '1');
INSERT INTO `top10_session` VALUES ('2', '20', 'a128fc7cf6e047da880216fb9f4c3335', '1');
INSERT INTO `top10_session` VALUES ('2', '20', '2aea8e228406465b8bfa001c6ba004a0', '1');
INSERT INTO `top10_session` VALUES ('2', '20', 'b0491c87fab245e4b58620a363ce3c2b', '1');
INSERT INTO `top10_session` VALUES ('2', '20', 'adc924aeab464391a06d8d45a2437929', '1');
INSERT INTO `top10_session` VALUES ('2', '20', 'd21774af8e774a4baf07ea8e28f6d921', '1');
INSERT INTO `top10_session` VALUES ('2', '20', '8126332b6e01426b835427e386f0479c', '1');
INSERT INTO `top10_session` VALUES ('2', '20', '4c11b63f19254fb6bfe8119df24a80e1', '1');
INSERT INTO `top10_session` VALUES ('2', '20', '1b11f1782fad402382cd1029ce60c70a', '1');
INSERT INTO `top10_session` VALUES ('2', '20', '65f5b723f4ef48d686237272e16b0e4b', '1');
INSERT INTO `top10_session` VALUES ('2', '20', 'aefc5bae9fd043219cbd8f348b2a4329', '1');
INSERT INTO `top10_session` VALUES ('2', '7', 'd4cbf862ebe1494da8871acc61aedcba', '2');
INSERT INTO `top10_session` VALUES ('2', '7', 'cec4a111542644188b59e9fba873d1bf', '1');
INSERT INTO `top10_session` VALUES ('2', '7', '4f236f8d6b174130bb8d068e678c8889', '1');
INSERT INTO `top10_session` VALUES ('2', '7', '8b216abd8b6445bebac7a10d5eb076f2', '1');
INSERT INTO `top10_session` VALUES ('2', '7', '9a7c4068c692473987cf8762ed15e4bf', '1');
INSERT INTO `top10_session` VALUES ('2', '7', '932998b07d9b4862a38baba332d3daa8', '1');
INSERT INTO `top10_session` VALUES ('2', '7', '1b404b661b034be2ad90be1b6c5bf8a2', '1');
INSERT INTO `top10_session` VALUES ('2', '7', '2e1ec683d5334556ac8c29be638ede9a', '1');
INSERT INTO `top10_session` VALUES ('2', '7', '43cd98a5aec0466098928eb95fbdd258', '1');
INSERT INTO `top10_session` VALUES ('2', '7', '7c3be6efd7294ba7aa37b67403db362b', '1');
INSERT INTO `top10_session` VALUES ('2', '88', 'a128fc7cf6e047da880216fb9f4c3335', '1');
INSERT INTO `top10_session` VALUES ('2', '88', '6b02026c163848efa3694e8defd5ee8f', '1');
INSERT INTO `top10_session` VALUES ('2', '88', 'c072f08bad0d4d8f92b3560c2dac6481', '1');
INSERT INTO `top10_session` VALUES ('2', '88', 'dba21b8afec547bd87f6f6bff32440dd', '1');
INSERT INTO `top10_session` VALUES ('2', '88', 'e9fe7b4487c54bceb0a9321ca0a83495', '1');
INSERT INTO `top10_session` VALUES ('2', '88', '63cbf0b4a99c4fe9a5c2b2c24574703f', '1');
INSERT INTO `top10_session` VALUES ('2', '88', '5c68036945ad4b7190ffd44726314387', '1');
INSERT INTO `top10_session` VALUES ('2', '88', '2fefa25d9b7c4e508fbf4a036f167ea7', '1');
INSERT INTO `top10_session` VALUES ('2', '88', '4c72cdff09044011856eb4fb53c8bb7e', '1');
INSERT INTO `top10_session` VALUES ('2', '88', '4c11b63f19254fb6bfe8119df24a80e1', '1');
INSERT INTO `top10_session` VALUES ('2', '94', 'fa9adae0b1304e9789dce69590897a16', '1');
INSERT INTO `top10_session` VALUES ('2', '94', '52fd0c79287d4810b844057aebae7313', '1');
INSERT INTO `top10_session` VALUES ('2', '94', 'b1b84a29b9144e6faf333cb83596b428', '1');
INSERT INTO `top10_session` VALUES ('2', '94', '4f236f8d6b174130bb8d068e678c8889', '1');
INSERT INTO `top10_session` VALUES ('2', '94', '48bab349f96e4230b5c76e54047ae8a0', '1');
INSERT INTO `top10_session` VALUES ('2', '94', '55d5f9e9feeb4f819fe731f4b2bdb62f', '1');
INSERT INTO `top10_session` VALUES ('2', '94', '2494d73edc7843648b40d374b7051ba8', '1');
INSERT INTO `top10_session` VALUES ('2', '94', '2a42f7ce7fa1481199121b00fcd2451b', '1');
INSERT INTO `top10_session` VALUES ('2', '94', '7afe92db242f4215bfb01cd4b3326e43', '1');
INSERT INTO `top10_session` VALUES ('2', '94', '3b2b6c1cdbec46ff88278ac8ae236385', '1');
INSERT INTO `top10_session` VALUES ('2', '43', '5ad6395d2ef046328fb6a1563213a0df', '1');
INSERT INTO `top10_session` VALUES ('2', '43', '79230a44847c451696f3274d9f51e60e', '1');
INSERT INTO `top10_session` VALUES ('2', '43', 'e032a113f82a4e03981ce376e396ce47', '1');
INSERT INTO `top10_session` VALUES ('2', '43', 'c4624b9139f549129412c85e8b7984f2', '1');
INSERT INTO `top10_session` VALUES ('2', '43', '7ff21c418b984c6c9116a1b4656e6b28', '1');
INSERT INTO `top10_session` VALUES ('2', '43', '3602599ae983422e82559d79b751dafc', '1');
INSERT INTO `top10_session` VALUES ('2', '43', '8b5ba9697f2e408896b2eb506b5ff57f', '1');
INSERT INTO `top10_session` VALUES ('2', '43', '6d7ff58591114d21832682b3953450fb', '1');
INSERT INTO `top10_session` VALUES ('2', '43', '6dc0155f2f624728842093d4ffe1b7c9', '1');
INSERT INTO `top10_session` VALUES ('2', '43', '026cff3f0a9c43ff98f50a50e4689da1', '1');
