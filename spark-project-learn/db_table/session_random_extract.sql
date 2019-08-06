/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-08-06 09:22:24
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
INSERT INTO `session_random_extract` VALUES ('2', '63cbf0b4a99c4fe9a5c2b2c24574703f', '2019-08-06 07:03:22', '呷哺呷哺,太古商场,重庆小面,蛋糕,日本料理', '69,0,41,88,10');
INSERT INTO `session_random_extract` VALUES ('2', '8f70fffdf895414d949bae688568ab46', '2019-08-06 07:02:15', '日本料理,新辣道鱼火锅,蛋糕,温泉', '71,94,0,70,91');
INSERT INTO `session_random_extract` VALUES ('2', 'bbcae0083350480ba4dc69bc6680c5cc', '2019-08-06 07:11:49', '太古商场', '0,87,11,64');
INSERT INTO `session_random_extract` VALUES ('2', '2f7b3e4a935a4013b36827f7936f8370', '2019-08-06 19:01:51', '重庆小面,呷哺呷哺,火锅,太古商场,国贸大厦', '0,57,67,40,32');
INSERT INTO `session_random_extract` VALUES ('2', '01c9ad575c274d12930d70b1fb3d2fd4', '2019-08-06 19:09:16', '太古商场,呷哺呷哺', '0,87,29,46');
INSERT INTO `session_random_extract` VALUES ('2', '901cb5920e394cdd841dc764bc4fb1e8', '2019-08-06 19:03:48', '温泉,火锅,呷哺呷哺', '78,0,12,59,97,50,64,26');
INSERT INTO `session_random_extract` VALUES ('2', '2ededfcb82ca4ba6af5a00f37dfa41e4', '2019-08-06 19:07:15', '新辣道鱼火锅', '9,86,0');
INSERT INTO `session_random_extract` VALUES ('2', '8cef186b3dd5461187b99139e5350448', '2019-08-06 19:03:36', '火锅,重庆小面', '0,9');
INSERT INTO `session_random_extract` VALUES ('2', '44ec11f4afe2475e8237b9cd434e2abd', '2019-08-06 17:50:22', '重庆小面', '0');
INSERT INTO `session_random_extract` VALUES ('2', '2c942f549b93432b88346781f9b9cf90', '2019-08-06 17:09:16', '呷哺呷哺,太古商场,蛋糕', '0,2');
INSERT INTO `session_random_extract` VALUES ('2', '1fd8c3fed71f46a0a678901e45143daa', '2019-08-06 17:01:11', '太古商场,呷哺呷哺', '0,87');
INSERT INTO `session_random_extract` VALUES ('2', '863bbcfcfc35458baf60f40995804fc3', '2019-08-06 01:05:49', null, '93,72');
INSERT INTO `session_random_extract` VALUES ('2', '4e938d620b954a07b01ac57b51d89acc', '2019-08-06 01:01:44', '国贸大厦,新辣道鱼火锅', '0,13,98,51,11');
INSERT INTO `session_random_extract` VALUES ('2', '512c15648ef0481b8d225df4d3ac1b3d', '2019-08-06 01:00:02', '呷哺呷哺,国贸大厦,太古商场', '0,5,70,92,93,43,30,21');
INSERT INTO `session_random_extract` VALUES ('2', '199499fe5ae04e248697d57f67938213', '2019-08-06 01:01:10', '太古商场,新辣道鱼火锅,重庆辣子鸡,日本料理', '70,52,91,71,37,45');
INSERT INTO `session_random_extract` VALUES ('2', '4fbe61a917024544aa97ab7011719a78', '2019-08-06 01:00:33', '国贸大厦,新辣道鱼火锅,蛋糕', '0,60,19,18,75');
INSERT INTO `session_random_extract` VALUES ('2', '7155011bb19748db9c390f2d9ddc085d', '2019-08-06 05:05:23', '太古商场,国贸大厦,呷哺呷哺', '0,29,64');
INSERT INTO `session_random_extract` VALUES ('2', 'd24046a62e8b4c938784aa892206ebe0', '2019-08-06 05:04:18', '重庆小面,重庆辣子鸡,日本料理,呷哺呷哺,温泉', '0,6,43,48,79,32,1');
INSERT INTO `session_random_extract` VALUES ('2', 'a2e0b29a30d647d792ac09ef9e0989e4', '2019-08-06 05:04:13', '重庆辣子鸡', '52,77,49,0,16');
INSERT INTO `session_random_extract` VALUES ('2', 'ac0d8f2815d54048a71cd169c6474bf2', '2019-08-06 05:03:50', '火锅', '0,5,71,53');
INSERT INTO `session_random_extract` VALUES ('2', 'bfdf8b2e454d42528ab09b071c87fdd0', '2019-08-06 10:02:01', '新辣道鱼火锅,国贸大厦,温泉', '0,40,82,27');
INSERT INTO `session_random_extract` VALUES ('2', 'bdb91f6db2b84c969ba4c8fdd3a6b343', '2019-08-06 10:00:55', '重庆辣子鸡,太古商场', '0,4,91,54');
INSERT INTO `session_random_extract` VALUES ('2', '11b6a2ba1ded4e679231a985362de2f5', '2019-08-06 10:12:22', '太古商场', '97,0,89,88');
INSERT INTO `session_random_extract` VALUES ('2', '45a96bd0c7464e678fd1a764f4a8cce1', '2019-08-06 00:08:01', '新辣道鱼火锅,重庆小面,蛋糕,日本料理', '0,15,38,2,67,55');
INSERT INTO `session_random_extract` VALUES ('2', '29fdf7178b0341eead7d6e422f744c8e', '2019-08-06 00:06:26', '温泉,国贸大厦', '27,0,22,39,23,91,50,99');
INSERT INTO `session_random_extract` VALUES ('2', '5e9f2d5001dc49d0b392823c7291dd2b', '2019-08-06 00:04:37', '蛋糕,国贸大厦,呷哺呷哺', '0,92,42');
INSERT INTO `session_random_extract` VALUES ('2', '9295b284ea554208933e3c3179923bb2', '2019-08-06 00:09:50', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', 'cec4a111542644188b59e9fba873d1bf', '2019-08-06 21:00:12', '新辣道鱼火锅,国贸大厦', '69,7,0');
INSERT INTO `session_random_extract` VALUES ('2', 'bf453aee1c57473bb3c89631b78348c9', '2019-08-06 21:00:50', '重庆辣子鸡,国贸大厦,太古商场', '0,38,72,43');
INSERT INTO `session_random_extract` VALUES ('2', 'b69446d6b12f43b1b2d342e3a8f91fdb', '2019-08-06 21:01:31', '太古商场,蛋糕,新辣道鱼火锅,日本料理,重庆辣子鸡', '38,0,87,86');
INSERT INTO `session_random_extract` VALUES ('2', '1c90ced2e11a4e74afff46fe183a23c5', '2019-08-06 21:00:03', '温泉,重庆辣子鸡,蛋糕,呷哺呷哺,太古商场', '0,43,76,40,97,35');
INSERT INTO `session_random_extract` VALUES ('2', '55d5f9e9feeb4f819fe731f4b2bdb62f', '2019-08-06 21:36:52', '太古商场', '0,94,71');
INSERT INTO `session_random_extract` VALUES ('2', '0461978e4517417998d7288576258912', '2019-08-06 20:12:44', '日本料理', '0,60');
INSERT INTO `session_random_extract` VALUES ('2', '3dd388616aa44f13ba5b3bc97bd0cefa', '2019-08-06 20:08:06', '国贸大厦,重庆辣子鸡,蛋糕,温泉', '0,53,33,48');
INSERT INTO `session_random_extract` VALUES ('2', '919db3741e394238a00b8e07ec37453b', '2019-08-06 20:10:37', '重庆辣子鸡,火锅,重庆小面,国贸大厦', '0,13,98');
INSERT INTO `session_random_extract` VALUES ('2', 'bb53886685854e11b4c853e221e97f3f', '2019-08-06 03:05:58', '温泉', '31,0,21');
INSERT INTO `session_random_extract` VALUES ('2', '861e8dd9b2e542158a0454c4ecc85649', '2019-08-06 03:03:07', '蛋糕,呷哺呷哺', '22,0,82,50');
INSERT INTO `session_random_extract` VALUES ('2', '7162c9543e2f4e0a812badab0ca4c5e3', '2019-08-06 03:09:11', '日本料理', '0');
INSERT INTO `session_random_extract` VALUES ('2', '6dc0155f2f624728842093d4ffe1b7c9', '2019-08-06 04:03:18', '火锅,温泉,国贸大厦,蛋糕,日本料理', '0,43');
INSERT INTO `session_random_extract` VALUES ('2', '35d86e145e2a497788bb38bc91a3acdc', '2019-08-06 04:03:50', null, '0,53,14,99');
INSERT INTO `session_random_extract` VALUES ('2', '3af640b8ac834bc9a40e6a1f562ad96c', '2019-08-06 04:02:15', '日本料理', '31,0,58,71');
INSERT INTO `session_random_extract` VALUES ('2', '6a83e7278f204ea8a339ddeda2205cec', '2019-08-06 18:00:44', '新辣道鱼火锅', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'c6912cff2b364e7d98f36679ccb35362', '2019-08-06 18:00:30', '温泉,新辣道鱼火锅,日本料理', '0,84,38,41');
INSERT INTO `session_random_extract` VALUES ('2', '7e631e522983428fa1958c1f113049c3', '2019-08-06 18:00:42', '日本料理,新辣道鱼火锅', '0,7,10');
INSERT INTO `session_random_extract` VALUES ('2', 'f1b02cc33406423aa1ad9dc670e3dcc5', '2019-08-06 18:00:56', '重庆小面', '0,30,28,14');
INSERT INTO `session_random_extract` VALUES ('2', '0c6f26ab2bf64832aa9c07833d77118e', '2019-08-06 06:03:00', '温泉,重庆小面', '0,6,75,42,32,66,46');
INSERT INTO `session_random_extract` VALUES ('2', 'b439b5af7e4d43938c832860ee1b1ab4', '2019-08-06 06:03:05', '呷哺呷哺,火锅,温泉,重庆辣子鸡,新辣道鱼火锅,蛋糕,重庆小面', '0,37,12,22,68,58,4');
INSERT INTO `session_random_extract` VALUES ('2', '082cef22ad28464abaefc0b535649b70', '2019-08-06 06:02:17', '国贸大厦,呷哺呷哺,温泉', '0,13,55');
INSERT INTO `session_random_extract` VALUES ('2', 'ba748095018644929ebc879621009b86', '2019-08-06 06:25:47', '温泉,重庆小面', '0,46,68');
INSERT INTO `session_random_extract` VALUES ('2', '399d3d7ce7f4416fac27d9ee13fa7f48', '2019-08-06 08:01:30', '日本料理,重庆辣子鸡,重庆小面', '75,0,64,18,40,15');
INSERT INTO `session_random_extract` VALUES ('2', '8b77ffa87853493e9d0e0cda1245446a', '2019-08-06 08:02:02', '太古商场,重庆小面,重庆辣子鸡,蛋糕', '91,0,35');
INSERT INTO `session_random_extract` VALUES ('2', 'c46de747594c4d4ab1b1495612633d8c', '2019-08-06 08:00:12', '日本料理,重庆辣子鸡,国贸大厦', '99,98,0,31,19,90,2');
INSERT INTO `session_random_extract` VALUES ('2', '84e61c5a1eb94fea85af9e6ca23e805e', '2019-08-06 08:09:30', '温泉,新辣道鱼火锅', '0,22,52');
INSERT INTO `session_random_extract` VALUES ('2', 'fd451de7ae5e43289b38001f2aed80a5', '2019-08-06 02:01:18', '新辣道鱼火锅,太古商场,国贸大厦', '50,86,41');
INSERT INTO `session_random_extract` VALUES ('2', 'c3c49212f01d43eb99a230c4d09da40f', '2019-08-06 02:02:37', '重庆辣子鸡,蛋糕,太古商场', '0,25,49,38,46,74,39');
INSERT INTO `session_random_extract` VALUES ('2', 'dba21b8afec547bd87f6f6bff32440dd', '2019-08-06 02:00:19', '温泉,重庆辣子鸡,呷哺呷哺', '0,96,33,41,88');
INSERT INTO `session_random_extract` VALUES ('2', '8bc79fd1156f4f96b8c3bec13711cacd', '2019-08-06 02:03:35', '温泉,蛋糕,重庆小面,呷哺呷哺', '0,62,41');
INSERT INTO `session_random_extract` VALUES ('2', 'b13be04e6dbb4e0288cd1cd24bf1c511', '2019-08-06 09:00:56', '温泉,呷哺呷哺', '82,13,0,43');
INSERT INTO `session_random_extract` VALUES ('2', '8bde6bd5ffda4f2099e741ec25f2d220', '2019-08-06 09:02:37', '呷哺呷哺,重庆小面,国贸大厦', '0,18,74,48,2,37');
INSERT INTO `session_random_extract` VALUES ('2', 'd6a5f048dd7b4975b7d91b4a73c99087', '2019-08-06 09:13:03', '日本料理,呷哺呷哺,蛋糕,国贸大厦,重庆辣子鸡', '0,31,52,21');
INSERT INTO `session_random_extract` VALUES ('2', '61e9e0fcbd384d749f817cd11d51748c', '2019-08-06 09:01:32', '温泉,蛋糕,呷哺呷哺', '0,16');
INSERT INTO `session_random_extract` VALUES ('2', '5cce1fa6c4844aa0943389f49751041d', '2019-08-06 22:19:14', '国贸大厦,太古商场', '34,0,56,26');
INSERT INTO `session_random_extract` VALUES ('2', '7ae4212a603f46208ab32e242ecead4c', '2019-08-06 22:03:07', '重庆小面,蛋糕', '0,56,26,28,59');
INSERT INTO `session_random_extract` VALUES ('2', '8c1751bf684743728f89ee6f259e7839', '2019-08-06 22:04:16', '重庆小面,重庆辣子鸡,新辣道鱼火锅,蛋糕', '0,45,58,78');
INSERT INTO `session_random_extract` VALUES ('2', '3c31718fc4b342c1b0d9678a7f74302d', '2019-08-06 22:04:07', '重庆辣子鸡,日本料理', '0,70,72');
INSERT INTO `session_random_extract` VALUES ('2', 'f29f1760044c48f097ecfdc1da3c8573', '2019-08-06 14:08:42', '新辣道鱼火锅,太古商场', '0,90,57,67,33,30');
INSERT INTO `session_random_extract` VALUES ('2', 'a3c1cbb6917840c6976b1cdec1be403d', '2019-08-06 14:01:50', '呷哺呷哺,国贸大厦', '0,94,95');
INSERT INTO `session_random_extract` VALUES ('2', '43cd98a5aec0466098928eb95fbdd258', '2019-08-06 14:02:09', '火锅,重庆小面', '0,97,71,34,20,90,14,75,53');
INSERT INTO `session_random_extract` VALUES ('2', 'e01f63a67f124dc4b24f392bb1a54e14', '2019-08-06 14:04:26', '新辣道鱼火锅,日本料理,蛋糕', '0');
INSERT INTO `session_random_extract` VALUES ('2', '4212e690814f4749b12352587e0ec8cd', '2019-08-06 14:05:43', '国贸大厦,呷哺呷哺,重庆辣子鸡', '0,81');
INSERT INTO `session_random_extract` VALUES ('2', '608a32e493da4cb3a2a32b6c452fd310', '2019-08-06 11:01:01', '新辣道鱼火锅,重庆辣子鸡,蛋糕', '0,67,64,17,68');
INSERT INTO `session_random_extract` VALUES ('2', '0157ea95aa8241afbc055e0f6ee32775', '2019-08-06 11:03:53', '日本料理', '0,92,50,16,10,36,18,65');
INSERT INTO `session_random_extract` VALUES ('2', '075977b89c5e4d18a9a341a509acfdd1', '2019-08-06 11:03:10', '国贸大厦,太古商场', '0,63,16,65,89,75');
INSERT INTO `session_random_extract` VALUES ('2', '19eef5fd4e764a319afc1cf111c1bf37', '2019-08-06 11:01:42', '重庆辣子鸡,太古商场', '0');
INSERT INTO `session_random_extract` VALUES ('2', '3a38ea3cd39e46c19946dc7c4b89b227', '2019-08-06 16:05:47', '国贸大厦,重庆辣子鸡,蛋糕', '0,33,97,66,70,87,68,25,73');
INSERT INTO `session_random_extract` VALUES ('2', '011fec1b6f854b1aab3dac9b25424789', '2019-08-06 16:05:26', '太古商场,蛋糕', '0,10,78');
INSERT INTO `session_random_extract` VALUES ('2', '9b6cce394acf4383afa1f3f7f497eb09', '2019-08-06 16:50:13', '新辣道鱼火锅', '0');
INSERT INTO `session_random_extract` VALUES ('2', '0cc2424a942248c09945380043474f81', '2019-08-06 16:08:19', '火锅,蛋糕', '0,38,46');
INSERT INTO `session_random_extract` VALUES ('2', '11de566b012443999d9bea90a50ea10c', '2019-08-06 16:04:14', '火锅,温泉,蛋糕,重庆辣子鸡', '0,83');
INSERT INTO `session_random_extract` VALUES ('2', '7bf84ebe907d448e87bea9ce4c735043', '2019-08-06 12:04:14', '国贸大厦', '64,90,68,27,5');
INSERT INTO `session_random_extract` VALUES ('2', 'af11931646f941a4af4a1db4f5909093', '2019-08-06 12:04:14', '重庆辣子鸡', '0,12,3,54');
INSERT INTO `session_random_extract` VALUES ('2', 'd0f5b72f97f7492abfc0ac7f7e2b2429', '2019-08-06 12:02:42', '火锅,新辣道鱼火锅', '0,34');
INSERT INTO `session_random_extract` VALUES ('2', '79230a44847c451696f3274d9f51e60e', '2019-08-06 12:01:12', '蛋糕,重庆小面,温泉,重庆辣子鸡,太古商场', '0,86,26,67,43');
INSERT INTO `session_random_extract` VALUES ('2', '64c12750b6224c339e422e9d2e55a9a5', '2019-08-06 13:05:38', '太古商场,新辣道鱼火锅', '0,90,18');
INSERT INTO `session_random_extract` VALUES ('2', 'b926bdd49d324724ac146df90ef2792b', '2019-08-06 13:06:00', '温泉,新辣道鱼火锅,蛋糕', '0,33,37');
INSERT INTO `session_random_extract` VALUES ('2', 'c9d75e8154284a5e81b0ce6774c13bb1', '2019-08-06 13:02:32', '新辣道鱼火锅,温泉,太古商场,蛋糕,日本料理', '0,37,41,98,87');
INSERT INTO `session_random_extract` VALUES ('2', '9c1eb18155f84bb0a07a8a3302b0e764', '2019-08-06 13:00:28', '新辣道鱼火锅,重庆辣子鸡,太古商场,日本料理,呷哺呷哺,温泉,蛋糕,重庆小面', '0,52,91,66,64');
INSERT INTO `session_random_extract` VALUES ('2', '1b1120704fcc430c8b6fbd8c1f101f77', '2019-08-06 15:05:30', '蛋糕,呷哺呷哺,重庆小面', '0,66,10,79');
INSERT INTO `session_random_extract` VALUES ('2', 'e2c80aa3f9fb44db9b45d3bc74f17158', '2019-08-06 15:01:51', '新辣道鱼火锅,呷哺呷哺,重庆小面', '55,68,0');
INSERT INTO `session_random_extract` VALUES ('2', 'fcb9b84a0e85484c9f0ea0652f6f0652', '2019-08-06 15:00:44', null, '0,45');
INSERT INTO `session_random_extract` VALUES ('2', '505f9e7548b94a0ead9edc2692a2cc39', '2019-08-06 15:02:21', '温泉', '35,0,88,15');
