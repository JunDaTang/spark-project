/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-08-06 08:53:49
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
INSERT INTO `session_random_extract` VALUES ('2', '6b870b3eb1664742bcdfc3fa2b863f22', '2019-08-06 19:02:27', '新辣道鱼火锅,温泉,国贸大厦', '0,36,18,51');
INSERT INTO `session_random_extract` VALUES ('2', 'd6f157c0402347358ef4799bc66a0778', '2019-08-06 19:47:52', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', '2e233cd7aa704d848c106dbf664e02c2', '2019-08-06 19:04:53', '火锅,蛋糕,新辣道鱼火锅', '0,7,89,40,81');
INSERT INTO `session_random_extract` VALUES ('2', '97e3e0c3ed2f44bc8feea743e17eb5d1', '2019-08-06 19:02:11', '重庆小面,温泉,呷哺呷哺,蛋糕', '0,96,91');
INSERT INTO `session_random_extract` VALUES ('2', '5d75f3d52ea64d44b3cd6a959285b609', '2019-08-06 07:16:28', null, '56,0');
INSERT INTO `session_random_extract` VALUES ('2', 'e8c41462b3074aa4a668b7daed375023', '2019-08-06 07:11:23', '日本料理,蛋糕,太古商场', '52,0,27,42,44');
INSERT INTO `session_random_extract` VALUES ('2', '94867701ba1240bb8edb0c629c57b48d', '2019-08-06 07:01:01', '国贸大厦,太古商场', '0,38,45,94,56');
INSERT INTO `session_random_extract` VALUES ('2', 'bdb348737ec9456f97ab687b115e7e03', '2019-08-06 17:08:02', '火锅', '0,56,12,23');
INSERT INTO `session_random_extract` VALUES ('2', 'f28069dae20644f485ae882a01d3bcb1', '2019-08-06 17:03:40', '火锅,日本料理,温泉,重庆小面,新辣道鱼火锅,蛋糕', '0,60,57,88,19');
INSERT INTO `session_random_extract` VALUES ('2', 'f858da9eaebd4e439023b9ef8bd8fd9d', '2019-08-06 17:05:43', '呷哺呷哺,温泉,重庆辣子鸡,蛋糕,火锅', '0,32,80');
INSERT INTO `session_random_extract` VALUES ('2', '5f686f8ac7e049c2a8e48697c1bfd54b', '2019-08-06 01:13:06', '太古商场,重庆小面', '0,1');
INSERT INTO `session_random_extract` VALUES ('2', '1432374a78c844cea7726ab107d721a3', '2019-08-06 01:07:55', '太古商场,重庆辣子鸡,日本料理,呷哺呷哺', '0,88,79,76,90,51,62,91');
INSERT INTO `session_random_extract` VALUES ('2', 'ae7edb6124ab4b4b82a7498419aaeabe', '2019-08-06 01:03:09', '新辣道鱼火锅,太古商场,重庆辣子鸡', '0,13,27,17');
INSERT INTO `session_random_extract` VALUES ('2', 'ef60f7256f87426aa12fb4cc2ab73ca6', '2019-08-06 01:10:55', '日本料理', '0,44,72,51,46');
INSERT INTO `session_random_extract` VALUES ('2', '4fefc0e015c349a99dc450f513ded59f', '2019-08-06 05:01:53', '重庆小面,呷哺呷哺', '0,45,35,34');
INSERT INTO `session_random_extract` VALUES ('2', '60e76d7f9e7543fdbf6c6b7549f181ad', '2019-08-06 05:01:46', '新辣道鱼火锅,蛋糕,重庆小面,呷哺呷哺,日本料理', '69,0,32,78,72,55,63');
INSERT INTO `session_random_extract` VALUES ('2', '7e0866e2406341edb5e69e3a420a0ad7', '2019-08-06 05:05:42', '国贸大厦,蛋糕,温泉', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'f1452d07dfa8421d9033c0cf6fbb36f1', '2019-08-06 05:05:01', '太古商场,日本料理', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'b0dbe42efa754085bb2fc481f3711b54', '2019-08-06 10:15:37', '蛋糕,新辣道鱼火锅', '0,93');
INSERT INTO `session_random_extract` VALUES ('2', '060603351d4445618d7a5f202f7d3d9f', '2019-08-06 10:02:00', '新辣道鱼火锅,日本料理,蛋糕,太古商场', '0,62,45,66,39,28');
INSERT INTO `session_random_extract` VALUES ('2', '111ca32cdb9149aa8c3d69e98aff8b4c', '2019-08-06 10:04:51', '日本料理', '0,5,51,64,61');
INSERT INTO `session_random_extract` VALUES ('2', 'd5ce059bcfea4b0bac205b52731f8334', '2019-08-06 10:22:12', '太古商场,日本料理,温泉', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'f878a309fafa4714aaa378645cb5f30f', '2019-08-06 00:11:26', '重庆辣子鸡', '0,53');
INSERT INTO `session_random_extract` VALUES ('2', 'b3c755358a5a48dd8c4e0b27c7e0ad5a', '2019-08-06 00:05:34', '新辣道鱼火锅,重庆小面,国贸大厦,重庆辣子鸡', '0,96,11');
INSERT INTO `session_random_extract` VALUES ('2', '31ff44d229674b3c9f0dfd8915f56533', '2019-08-06 00:03:24', '火锅,重庆辣子鸡', '0,29,45');
INSERT INTO `session_random_extract` VALUES ('2', '07517bb0bb1647aea7bb05ab7de0199d', '2019-08-06 21:09:17', '日本料理,新辣道鱼火锅', '70,94,44');
INSERT INTO `session_random_extract` VALUES ('2', '4bc116dbdc65402e90ed929dbbab1bc0', '2019-08-06 21:04:48', '重庆辣子鸡,温泉,呷哺呷哺,日本料理', '99,0,48,27,93,34');
INSERT INTO `session_random_extract` VALUES ('2', '89da1a87160b40a3a672e2f3c24999cc', '2019-08-06 21:00:46', '重庆小面,蛋糕,国贸大厦,火锅,重庆辣子鸡', '0,22,93,38');
INSERT INTO `session_random_extract` VALUES ('2', '32e4d6d86f094256acec31ac85274ccd', '2019-08-06 21:05:04', '温泉', '81,0,38,88,74,34,43');
INSERT INTO `session_random_extract` VALUES ('2', 'b2d944a823ae4699a0e077d8967dc6da', '2019-08-06 20:12:36', '重庆辣子鸡,火锅', '50,43,94,83');
INSERT INTO `session_random_extract` VALUES ('2', '6828af07ac1e4fa492b944f3b2c7efdb', '2019-08-06 20:01:05', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', 'd45100a50efe4e249f242ed90176c805', '2019-08-06 20:02:48', '重庆小面', '0,18,5');
INSERT INTO `session_random_extract` VALUES ('2', '0c8333ed473e4ab38bbff431bece6edc', '2019-08-06 20:19:40', null, '58');
INSERT INTO `session_random_extract` VALUES ('2', 'fc42f9a7d9c54c4b91dc770f1e80ce4d', '2019-08-06 03:00:15', '火锅,呷哺呷哺', '0,38');
INSERT INTO `session_random_extract` VALUES ('2', '83fc085e93ae42c29d9c427dfc01b34f', '2019-08-06 03:02:33', '太古商场,呷哺呷哺,蛋糕,温泉,日本料理', '0,95,73,43,72,79');
INSERT INTO `session_random_extract` VALUES ('2', 'b2fe7a39c66445ffb917f6e724fc4f21', '2019-08-06 03:17:55', '重庆小面,呷哺呷哺', '0,3,70');
INSERT INTO `session_random_extract` VALUES ('2', 'dd70fbd913b0459a80ea67bdee608d67', '2019-08-06 04:12:32', '重庆小面,蛋糕', '0,86,12');
INSERT INTO `session_random_extract` VALUES ('2', 'cd9f7bc1c8df490db5638a85bbf75c7c', '2019-08-06 04:02:06', '火锅,重庆辣子鸡,重庆小面', '0,55,62,65,33');
INSERT INTO `session_random_extract` VALUES ('2', '3ea04b15d3d1427c811d25c2933f882f', '2019-08-06 04:01:42', '太古商场,重庆辣子鸡', '0,40,50,75,22');
INSERT INTO `session_random_extract` VALUES ('2', 'c9b3b724a7184462ae9840e2cf8431d8', '2019-08-06 04:03:17', '蛋糕,重庆小面,火锅,新辣道鱼火锅,太古商场', '65,0');
INSERT INTO `session_random_extract` VALUES ('2', '6be25804b0cb4674b8818227d2077e45', '2019-08-06 18:01:30', '日本料理,火锅', '0,46,85');
INSERT INTO `session_random_extract` VALUES ('2', 'fc7981166caa461d82fb04f0a6d84d09', '2019-08-06 18:16:25', '重庆辣子鸡,蛋糕,火锅', '0,34,93,68');
INSERT INTO `session_random_extract` VALUES ('2', '9247de92174d497bbe22e91e1cb48378', '2019-08-06 18:08:57', null, '0,24,32,28');
INSERT INTO `session_random_extract` VALUES ('2', 'fa590db40c44433791acd97df8085e83', '2019-08-06 18:03:38', '重庆辣子鸡,日本料理', '0,86,63');
INSERT INTO `session_random_extract` VALUES ('2', '507c897a3b5e4241a3878ab521029a9e', '2019-08-06 22:08:48', '国贸大厦,蛋糕', '0,82,76');
INSERT INTO `session_random_extract` VALUES ('2', '2137a358c3834dec9b6f056e461b2e8c', '2019-08-06 22:02:46', '重庆辣子鸡,新辣道鱼火锅,国贸大厦', '0,14,47,87,56,82,40');
INSERT INTO `session_random_extract` VALUES ('2', '556bb8ffa9754e8dbf08f250a1b5bf96', '2019-08-06 22:02:51', '蛋糕,温泉,重庆辣子鸡', '0,48');
INSERT INTO `session_random_extract` VALUES ('2', '150ae96102dc497ab36abb0e6c71620c', '2019-08-06 22:02:05', '重庆小面,太古商场,日本料理,蛋糕,重庆辣子鸡,新辣道鱼火锅,国贸大厦', '0,72');
INSERT INTO `session_random_extract` VALUES ('2', 'c529b9af54a74234ba2c9f625ee01723', '2019-08-06 08:04:04', '新辣道鱼火锅,温泉,呷哺呷哺,重庆小面', '0,63,93,77,35');
INSERT INTO `session_random_extract` VALUES ('2', 'c24f35aedc0840a385ceae2872051d80', '2019-08-06 08:07:37', null, '0,55,20,61');
INSERT INTO `session_random_extract` VALUES ('2', '1a57d8c50178413e9ff8dc014972006c', '2019-08-06 08:08:55', '温泉,新辣道鱼火锅', '0,85');
INSERT INTO `session_random_extract` VALUES ('2', 'b9853b16fbb4402ab3bf7dcbd2e192a0', '2019-08-06 08:26:54', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', '81b6dc87e51144789dc823a3efd4fcf6', '2019-08-06 02:00:24', '日本料理,新辣道鱼火锅,太古商场', '0,25,89');
INSERT INTO `session_random_extract` VALUES ('2', 'fbf05f27fdd24435888211be12e69f12', '2019-08-06 02:07:56', '日本料理,新辣道鱼火锅', '0,55,90,76,54,72');
INSERT INTO `session_random_extract` VALUES ('2', '97d923de82c048da898d32df8f264d90', '2019-08-06 02:14:39', '重庆小面,新辣道鱼火锅', '0,58');
INSERT INTO `session_random_extract` VALUES ('2', '6f10cc1c38c2484b8378c9ec6f9e7a84', '2019-08-06 02:03:25', '国贸大厦,重庆小面', '0,39');
INSERT INTO `session_random_extract` VALUES ('2', 'f5c75632404941f3933c4279ddba7cbd', '2019-08-06 09:00:07', null, '0,15,10,83,47');
INSERT INTO `session_random_extract` VALUES ('2', '7d42f49ed9124d8a95073f1d9107598a', '2019-08-06 09:01:04', '国贸大厦,呷哺呷哺,重庆辣子鸡,新辣道鱼火锅,太古商场', '0,96,46,39,91');
INSERT INTO `session_random_extract` VALUES ('2', '1bcfd59c1abb4821b747b0beac3b46c2', '2019-08-06 09:00:39', null, '0,38,98,52,25,31,82,29,21');
INSERT INTO `session_random_extract` VALUES ('2', '3c6336215acb43c7951d4b73906bc3b1', '2019-08-06 09:10:54', '重庆小面,国贸大厦', '81,0,31');
INSERT INTO `session_random_extract` VALUES ('2', 'ffba725ce930407ea4bd463134f35524', '2019-08-06 06:00:01', '重庆辣子鸡,蛋糕,新辣道鱼火锅,温泉', '0,42,54,75,72,88,48');
INSERT INTO `session_random_extract` VALUES ('2', '3c62bdbe1bf94acb91edad48cf497973', '2019-08-06 06:00:23', '新辣道鱼火锅', '79,0,93,86,40');
INSERT INTO `session_random_extract` VALUES ('2', '8e5a5c6e5129431fa92390960612860c', '2019-08-06 06:24:26', null, '0,75,76');
INSERT INTO `session_random_extract` VALUES ('2', '65ff2673b46d4b719da8020cf79fb8dd', '2019-08-06 14:13:55', '新辣道鱼火锅,呷哺呷哺,蛋糕', '0,97');
INSERT INTO `session_random_extract` VALUES ('2', '0b16112b01b9482da33a71aa9dec6874', '2019-08-06 14:01:00', '太古商场,新辣道鱼火锅,呷哺呷哺', '44,93,0');
INSERT INTO `session_random_extract` VALUES ('2', '4936920764ab4e84be43648b54e2553a', '2019-08-06 14:00:04', '温泉,新辣道鱼火锅,重庆小面', '0,90,96,45,67');
INSERT INTO `session_random_extract` VALUES ('2', '7dd9fbf46d2141d68205d5e4ab6bdc80', '2019-08-06 11:02:15', '太古商场', '0,58,87,86,15');
INSERT INTO `session_random_extract` VALUES ('2', 'dce62406918a4863a2d5d8ca9406cd43', '2019-08-06 11:05:04', '新辣道鱼火锅,日本料理,重庆辣子鸡', '0,90');
INSERT INTO `session_random_extract` VALUES ('2', '03b859f3348a4e2fba24678313020d11', '2019-08-06 11:16:26', '重庆小面,新辣道鱼火锅', '0');
INSERT INTO `session_random_extract` VALUES ('2', '53cada9d7bcd4da18c4535c449e3790d', '2019-08-06 11:14:40', '呷哺呷哺', '0');
INSERT INTO `session_random_extract` VALUES ('2', '4f24f512e77144948956d57024587cce', '2019-08-06 16:13:34', '蛋糕', '0,52');
INSERT INTO `session_random_extract` VALUES ('2', '9b8ef55786544946a97b0fe47924efd2', '2019-08-06 16:00:55', '呷哺呷哺', '0,41,94,74,8,78,17');
INSERT INTO `session_random_extract` VALUES ('2', '21224db75c024468b2540ce28abb03f6', '2019-08-06 16:03:06', '日本料理,重庆小面,呷哺呷哺,蛋糕', '0,91,13');
INSERT INTO `session_random_extract` VALUES ('2', 'c6fd9d8b3af94db09fea4eedb4bbbb17', '2019-08-06 16:00:37', '新辣道鱼火锅', '0,84,76');
INSERT INTO `session_random_extract` VALUES ('2', '154039deb10b485aa5b8535a771b3501', '2019-08-06 16:07:22', null, '0,83,52,1');
INSERT INTO `session_random_extract` VALUES ('2', '88914c6e22ba497d83783ab1fea85cd9', '2019-08-06 12:02:05', '国贸大厦,日本料理', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'e292f3422a2449ba88a039e02a6783c6', '2019-08-06 12:03:30', '国贸大厦,火锅,新辣道鱼火锅,重庆小面,温泉', '0,47,78,44');
INSERT INTO `session_random_extract` VALUES ('2', '301f886fab784fd2a128173173ecb0aa', '2019-08-06 12:03:52', '日本料理,火锅,国贸大厦,温泉,重庆辣子鸡,重庆小面,新辣道鱼火锅', '89,0,47,87,33,93');
INSERT INTO `session_random_extract` VALUES ('2', '29cc4ae875c347cab7e20c5f217db37d', '2019-08-06 12:05:04', '国贸大厦,蛋糕', '0,3');
INSERT INTO `session_random_extract` VALUES ('2', '4ec28380fb0a471cb7b369632141fd6e', '2019-08-06 12:01:21', '日本料理,火锅,重庆辣子鸡', '0,63,48,26');
INSERT INTO `session_random_extract` VALUES ('2', 'b996de87d2ae488f94f02f648c7d8996', '2019-08-06 13:27:16', '重庆辣子鸡,太古商场,火锅,温泉', '0,42,46,90');
INSERT INTO `session_random_extract` VALUES ('2', 'b40b17a9d828481cb1466271fe07ef6f', '2019-08-06 13:25:01', null, '0,54');
INSERT INTO `session_random_extract` VALUES ('2', 'f534953b40c5428583c98a9b3070de80', '2019-08-06 13:27:49', null, '0,86');
INSERT INTO `session_random_extract` VALUES ('2', '437f1643cf6e49dc900a8064ccf4871c', '2019-08-06 13:21:20', '重庆小面,温泉', '0,95,91,19');
INSERT INTO `session_random_extract` VALUES ('2', '4b62da5d1f65408fbe68620cf8a079c6', '2019-08-06 15:02:52', '重庆小面,呷哺呷哺', '0,78,2');
INSERT INTO `session_random_extract` VALUES ('2', 'f1c5ad0cadf24db29a5702685434dde4', '2019-08-06 15:00:22', '蛋糕', '63,0,42');
INSERT INTO `session_random_extract` VALUES ('2', 'fef01ca957e94e409c460e53c80f7c11', '2019-08-06 15:04:39', '重庆辣子鸡,重庆小面,太古商场,日本料理,温泉', '0');
INSERT INTO `session_random_extract` VALUES ('2', '747ce015b35f4117b0c1fc98775e3ef0', '2019-08-06 15:05:12', '新辣道鱼火锅,日本料理,国贸大厦', '0,61');
