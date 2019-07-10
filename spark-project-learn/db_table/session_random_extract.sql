/*
Navicat MySQL Data Transfer

Source Server         : my_mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : spark_project

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2019-07-10 16:37:16
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
INSERT INTO `session_random_extract` VALUES ('2', 'ef1fd5418afc46e48c057d61b6c80b21', '2019-07-10 14:07:19', null, '0,60');
INSERT INTO `session_random_extract` VALUES ('2', 'c2b8cfbbea5045eca4d9147754759790', '2019-07-10 14:01:13', '重庆辣子鸡,新辣道鱼火锅', '35,0,9,41,14');
INSERT INTO `session_random_extract` VALUES ('2', '93246153e2994d049c2e68b56656bc13', '2019-07-10 01:01:21', '火锅', '0,37,2');
INSERT INTO `session_random_extract` VALUES ('2', '41a424dd0f2342bf9a57fe2460facf9a', '2019-07-10 13:07:33', '国贸大厦', '26,1,0,60');
INSERT INTO `session_random_extract` VALUES ('2', '1c185133608a48a4aa015aeb7608601f', '2019-07-10 13:11:24', '新辣道鱼火锅', '72,0,11');
INSERT INTO `session_random_extract` VALUES ('2', '27461fdc89614c7ca07326ef8488efe9', '2019-07-10 13:01:22', '火锅', '61,38,0');
INSERT INTO `session_random_extract` VALUES ('2', 'e04245e5e7a74d32a0c18737630d40ea', '2019-07-10 13:07:38', null, '19,0,41');
INSERT INTO `session_random_extract` VALUES ('2', '254721a1607b46509f1b8fa9bac63df8', '2019-07-10 17:00:37', '呷哺呷哺,太古商场,国贸大厦', '47,96,0');
INSERT INTO `session_random_extract` VALUES ('2', '7c74ccb4f79c4891bb3da074d51f53b2', '2019-07-10 03:01:11', '太古商场', '62,0,4');
INSERT INTO `session_random_extract` VALUES ('2', 'bc00a289001f4cddaa794b1c682bf62c', '2019-07-10 03:00:19', '日本料理,温泉,重庆小面,国贸大厦', '0,51,59,17,68,37');
INSERT INTO `session_random_extract` VALUES ('2', 'df4e391d1e114fd7a7aa5689c46d1c83', '2019-07-10 16:42:10', null, '74');
INSERT INTO `session_random_extract` VALUES ('2', '758b2f6df186444bbe1341c346337e89', '2019-07-10 16:02:33', '蛋糕,太古商场', '18,0,24,90,71,16');
INSERT INTO `session_random_extract` VALUES ('2', 'c81ebe4308a440f3a0fd9a95e45e0c3b', '2019-07-10 10:16:49', null, '59,0,91,11');
INSERT INTO `session_random_extract` VALUES ('2', 'e75597a41b2c402bb30a3f90190c5c6d', '2019-07-10 10:00:57', '重庆小面,新辣道鱼火锅,温泉', '0,4,57,24');
INSERT INTO `session_random_extract` VALUES ('2', '8308d8ca3f20457e9c6fe2fdc9d99863', '2019-07-10 20:01:32', '太古商场', '0,83,61,64,76');
INSERT INTO `session_random_extract` VALUES ('2', 'f98f32f8e44c46ae8984efd4470972f9', '2019-07-10 20:02:41', '温泉,火锅', '9,0,34,6');
INSERT INTO `session_random_extract` VALUES ('2', 'c9b914f61b3340a8838947e80972bbb3', '2019-07-10 20:03:38', '国贸大厦,呷哺呷哺,重庆小面,温泉', '0,56,57,22,98,95,49');
INSERT INTO `session_random_extract` VALUES ('2', '71053091b7de4a04bae1090f7aeed361', '2019-07-10 08:24:16', '重庆辣子鸡', '97,0,39');
INSERT INTO `session_random_extract` VALUES ('2', 'f309bc62c3e24f71a9cea74dc2de55d3', '2019-07-10 08:05:06', '日本料理,火锅', '64,0,40,22');
INSERT INTO `session_random_extract` VALUES ('2', '0b72a51ec0254c9a94b1844105fb3322', '2019-07-10 08:02:12', '呷哺呷哺,火锅,国贸大厦,日本料理,蛋糕', '32,0,25,67,97,98,61,20,73,72,60,48');
INSERT INTO `session_random_extract` VALUES ('2', '17fe541f3ac6444c9464dcf524a3a8a1', '2019-07-10 08:16:24', '呷哺呷哺,国贸大厦,蛋糕', '38,0,50');
INSERT INTO `session_random_extract` VALUES ('2', '1d19cd3231ec44b981d0a5840e909463', '2019-07-10 08:03:40', '国贸大厦,温泉', '98,0,75');
INSERT INTO `session_random_extract` VALUES ('2', 'eeeb47e5434846cda0de6ca913526aaf', '2019-07-10 19:04:57', '重庆辣子鸡,火锅,日本料理', '75,0,65,59,11,66');
INSERT INTO `session_random_extract` VALUES ('2', 'f9a8f62587cd483192edb884a4fdcb38', '2019-07-10 19:01:11', '蛋糕,日本料理,新辣道鱼火锅', '0,1,61,77,93');
INSERT INTO `session_random_extract` VALUES ('2', '61a6197daa944ac8b55fc6d63f3745bc', '2019-07-10 19:13:48', '呷哺呷哺', '0,88,34');
INSERT INTO `session_random_extract` VALUES ('2', '628959682ada4915830406a0fcd0f48c', '2019-07-10 21:12:02', '日本料理,蛋糕,国贸大厦', '0,45,8,95,63,44');
INSERT INTO `session_random_extract` VALUES ('2', 'dfc7724812464728bd7393032ed7a474', '2019-07-10 12:04:11', '日本料理,蛋糕,太古商场,重庆辣子鸡', '0');
INSERT INTO `session_random_extract` VALUES ('2', '718ba1ee24134fb68e78fa99dc278588', '2019-07-10 18:09:06', '新辣道鱼火锅,日本料理,太古商场', '55,77,0,25,30,97,53,96');
INSERT INTO `session_random_extract` VALUES ('2', 'bb2614087fd444eb803defc5b49072ac', '2019-07-10 22:03:19', '蛋糕,日本料理', '0,24,41,54');
INSERT INTO `session_random_extract` VALUES ('2', '436214d1bfdf4547a4b46fc231a8bd8d', '2019-07-10 02:01:27', '蛋糕,温泉,太古商场', '34,0,12,99,17,32,27,82,53,68');
INSERT INTO `session_random_extract` VALUES ('2', '76c7792612a44ba8bb3d163856151c02', '2019-07-10 02:03:19', '火锅,重庆辣子鸡,呷哺呷哺,日本料理', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'f68f82531f8e42038e81454ec337d78e', '2019-07-10 09:00:45', '火锅,日本料理,新辣道鱼火锅,国贸大厦', '0,27');
INSERT INTO `session_random_extract` VALUES ('2', '4b77e6874c5946c697d42eda2b1a6979', '2019-07-10 00:01:23', '火锅,重庆辣子鸡', '0,9,99,7');
INSERT INTO `session_random_extract` VALUES ('2', 'b53eebfbedd247848ea1c0134484c940', '2019-07-10 00:01:40', '日本料理,蛋糕', '0,48');
INSERT INTO `session_random_extract` VALUES ('2', '36337c75727c48b7bc51bda572c21d08', '2019-07-10 05:01:45', '日本料理,温泉,太古商场', '0,21,53');
INSERT INTO `session_random_extract` VALUES ('2', 'fd2e997c7f4f4c4bbde00c8174c6baf3', '2019-07-10 05:01:29', '蛋糕,国贸大厦', '93,0,82,81,23,42');
INSERT INTO `session_random_extract` VALUES ('2', '40dec35634414d6a8abc34c021c9d762', '2019-07-10 07:00:56', '重庆小面', '0,24,60,57,30');
INSERT INTO `session_random_extract` VALUES ('2', '41dbd6ff5e124ba69bcd4a14599b817c', '2019-07-10 06:03:34', '日本料理,温泉,重庆辣子鸡,重庆小面,太古商场', '0,67,22,47,29');
INSERT INTO `session_random_extract` VALUES ('2', 'ad7d3318ecfe4cd38e8765f74b7881e4', '2019-07-10 06:04:18', '呷哺呷哺,重庆辣子鸡,新辣道鱼火锅,温泉,国贸大厦', '0,29,84,39,18,98');
INSERT INTO `session_random_extract` VALUES ('2', '5d1957ebe27942d9a4b5733dea8cf966', '2019-07-10 06:03:48', '蛋糕,日本料理,重庆辣子鸡,火锅', '0,20,13');
INSERT INTO `session_random_extract` VALUES ('2', '7d4fbf62178e425cb27dd18933735ab8', '2019-07-10 11:17:27', '蛋糕', '0,37');
INSERT INTO `session_random_extract` VALUES ('2', '3a428c6da1e0485eb27fbac603d58485', '2019-07-10 11:05:57', '国贸大厦,日本料理,蛋糕,重庆辣子鸡', '0,6,94');
INSERT INTO `session_random_extract` VALUES ('2', '8a0b32d632674855b47f9abbc0d7f495', '2019-07-10 06:03:01', '温泉,火锅', '0,39,55,58,25');
INSERT INTO `session_random_extract` VALUES ('2', '897611db6efa4527b15afc0be80acd55', '2019-07-10 06:09:56', '火锅', '0,73');
INSERT INTO `session_random_extract` VALUES ('2', '59ee44c67cf64daf8617ce57b3dec848', '2019-07-10 17:06:15', '国贸大厦,温泉,新辣道鱼火锅,重庆辣子鸡,重庆小面', '0,36,77,59,81');
INSERT INTO `session_random_extract` VALUES ('2', 'e58e8dfbd83c414fbb948610b688a783', '2019-07-10 17:01:08', '新辣道鱼火锅,重庆小面,国贸大厦', '0,5,17,80');
INSERT INTO `session_random_extract` VALUES ('2', '256fe64c0033439c97fcd6c5e760d73d', '2019-07-10 17:02:49', '重庆小面,日本料理', '55,0,32,17,19');
INSERT INTO `session_random_extract` VALUES ('2', '068ff03dc3fd4b74a921ee6225980a01', '2019-07-10 04:09:48', '温泉,新辣道鱼火锅', '0,64,19,91');
INSERT INTO `session_random_extract` VALUES ('2', 'd24f69ea2eb24c78a8b15d17f76291dc', '2019-07-10 04:01:28', '新辣道鱼火锅,太古商场,重庆辣子鸡,日本料理', '7,26,0,50,52,39,67,85,64');
INSERT INTO `session_random_extract` VALUES ('2', 'aeca1489282f4db196ad4a24d8bf5faa', '2019-07-10 10:02:14', '呷哺呷哺,温泉,国贸大厦', '17,0,82');
INSERT INTO `session_random_extract` VALUES ('2', 'bd78b86b7550495683bac9fc45d1eef7', '2019-07-10 10:28:33', null, '85,0');
INSERT INTO `session_random_extract` VALUES ('2', 'cfe9ec46ca4140ddbd33fef2d8b450d3', '2019-07-10 10:02:04', '重庆小面,重庆辣子鸡,新辣道鱼火锅,国贸大厦', '0,60,85,7,93,44');
INSERT INTO `session_random_extract` VALUES ('2', 'e7afe0df11384f3198df114849e87800', '2019-07-10 19:01:22', '重庆小面,国贸大厦,蛋糕,太古商场', '0,20,88,24');
INSERT INTO `session_random_extract` VALUES ('2', '10dcdd1a1e2e4434b757e057648db2b5', '2019-07-10 19:05:27', '新辣道鱼火锅,蛋糕,呷哺呷哺', '0,31,47,79,93,49');
INSERT INTO `session_random_extract` VALUES ('2', '6a0c2349bd4749919c1bc3c3ac620ddd', '2019-07-10 21:10:23', '国贸大厦,重庆小面', '0,56');
INSERT INTO `session_random_extract` VALUES ('2', 'e01bdd3c9d5247ad815c388818939a80', '2019-07-10 21:26:00', '呷哺呷哺', '0,50,3');
INSERT INTO `session_random_extract` VALUES ('2', '626169dd26f6407dbd64e423461da349', '2019-07-10 12:03:36', '重庆辣子鸡,呷哺呷哺,温泉,蛋糕', '53,0');
INSERT INTO `session_random_extract` VALUES ('2', 'a1a6d9fd3af340948126a3ec5b9ecdb3', '2019-07-10 12:01:14', '火锅,国贸大厦,重庆辣子鸡,日本料理', '0,63,13,49,26,86');
INSERT INTO `session_random_extract` VALUES ('2', '8af9ff24db8c4b10a9b1f374a7e53a29', '2019-07-10 18:28:49', null, '44');
INSERT INTO `session_random_extract` VALUES ('2', 'e76c40e19af74d4cbbf7c5cda59e2c0a', '2019-07-10 18:03:04', '蛋糕', '0,75,86');
INSERT INTO `session_random_extract` VALUES ('2', '0f834bca1f7c43a588335e1284c3b560', '2019-07-10 22:02:30', '火锅', '0,52,63');
INSERT INTO `session_random_extract` VALUES ('2', 'edad283331284c629989037aa5bfeba1', '2019-07-10 02:01:53', '重庆小面,重庆辣子鸡', '30,23,71,62,27,45,46');
INSERT INTO `session_random_extract` VALUES ('2', 'b79bb7f20dc64bb9bbbb6b488ee6ced2', '2019-07-10 00:01:07', null, '0,57,89,22');
INSERT INTO `session_random_extract` VALUES ('2', 'e2dbc2ea10364fe896ddab42094d8c8a', '2019-07-10 00:02:17', '重庆小面,呷哺呷哺', '0,2');
INSERT INTO `session_random_extract` VALUES ('2', '27690ae7bbd442aaaa9e4a1a55dc21a7', '2019-07-10 00:01:41', '国贸大厦', '0,71,2,95');
INSERT INTO `session_random_extract` VALUES ('2', 'f3defea9ed0d40ab9011df7799289590', '2019-07-10 00:27:22', null, '45,50');
INSERT INTO `session_random_extract` VALUES ('2', '8bad470978fe4b4e83a7e4f3aad5bc3e', '2019-07-10 15:12:09', '太古商场,新辣道鱼火锅,重庆辣子鸡', '0,21,42,55,22');
INSERT INTO `session_random_extract` VALUES ('2', '61a42acf08a1422186932cc32cfff3eb', '2019-07-10 01:02:07', '新辣道鱼火锅,国贸大厦,重庆辣子鸡', '0,91,57,11,98');
INSERT INTO `session_random_extract` VALUES ('2', 'ea6ba83924cf4c61b234ee07f8d5e7f7', '2019-07-10 13:00:03', '蛋糕', '0,15');
INSERT INTO `session_random_extract` VALUES ('2', '405086c73fc04c7faae11058e5348a6b', '2019-07-10 13:02:05', '温泉,蛋糕,国贸大厦', '0,94,17');
INSERT INTO `session_random_extract` VALUES ('2', '611608d4acc145e1837652e8878f40b6', '2019-07-10 06:02:17', '温泉,火锅,日本料理', '0,28,57,78,26,35');
INSERT INTO `session_random_extract` VALUES ('2', 'be61993d2c634248a915c3d6c5c8539d', '2019-07-10 06:05:43', '呷哺呷哺,温泉,国贸大厦,火锅,重庆辣子鸡,新辣道鱼火锅', '0,11,48,76');
INSERT INTO `session_random_extract` VALUES ('2', 'd8990266d30d47f7a00030aab316ca66', '2019-07-10 04:01:07', '日本料理,蛋糕,国贸大厦,火锅,重庆辣子鸡', '77,0');
INSERT INTO `session_random_extract` VALUES ('2', '8f9046b15c8048a8b3fbac227455af0e', '2019-07-10 04:02:16', '蛋糕,重庆小面,温泉', '12,37,92,0,58,88,42');
INSERT INTO `session_random_extract` VALUES ('2', 'bdfb7d97c01b427a8e68f7ed73964789', '2019-07-10 04:07:10', '国贸大厦,重庆小面,温泉,蛋糕,太古商场', '0,23,75,79');
INSERT INTO `session_random_extract` VALUES ('2', 'f3f2799688974c0b9ef3668005c73dd6', '2019-07-10 04:05:17', '火锅,呷哺呷哺,重庆辣子鸡,日本料理,太古商场,温泉', '0,21,36');
INSERT INTO `session_random_extract` VALUES ('2', 'd6aeb907b5d74d8cbe26c70d966d24f9', '2019-07-10 03:02:26', '新辣道鱼火锅,重庆小面,国贸大厦,太古商场', '0,90,45,21,60,39,48');
INSERT INTO `session_random_extract` VALUES ('2', '52e03a26b8fa45549ac11777b5be6530', '2019-07-10 03:10:07', '蛋糕,温泉,呷哺呷哺,重庆辣子鸡', '0,72');
INSERT INTO `session_random_extract` VALUES ('2', 'aea6163e744d4306bad4e56cd29bfcc1', '2019-07-10 03:02:44', '温泉,日本料理,重庆辣子鸡', '0,84,44,1');
INSERT INTO `session_random_extract` VALUES ('2', '590ce2ab454548b9ba9e4fe67e1e67b6', '2019-07-10 16:11:21', '新辣道鱼火锅,呷哺呷哺', '0,1,3,7,66');
INSERT INTO `session_random_extract` VALUES ('2', '94b0bd047a5348dbae834c8ee3422195', '2019-07-10 16:03:29', '呷哺呷哺,蛋糕,重庆辣子鸡,新辣道鱼火锅', '0,79');
INSERT INTO `session_random_extract` VALUES ('2', 'e1803fd2275147bd89d8e87a734cd2b5', '2019-07-10 16:00:13', '国贸大厦,新辣道鱼火锅,日本料理', '0,79,65');
INSERT INTO `session_random_extract` VALUES ('2', '30f16688a6464d17907999a1bfb478a5', '2019-07-10 10:04:05', '新辣道鱼火锅,呷哺呷哺,温泉', '69,0,44');
INSERT INTO `session_random_extract` VALUES ('2', '08cddf4dda8d4927b52fce85eb5a581c', '2019-07-10 08:01:09', '重庆辣子鸡,重庆小面,新辣道鱼火锅', '0,32,96,36,45,13,16');
INSERT INTO `session_random_extract` VALUES ('2', 'f18c6540ffb041c8b9eb6a2c381b8a87', '2019-07-10 08:02:35', '日本料理,温泉', '0,6,34');
INSERT INTO `session_random_extract` VALUES ('2', '4ca046d782b1462fa600b82f46664729', '2019-07-10 19:02:16', null, '0,73,43,71');
INSERT INTO `session_random_extract` VALUES ('2', 'f0369ede95f44251be1a561ae72e1f6c', '2019-07-10 21:02:38', '火锅,温泉,太古商场,蛋糕,日本料理', '0');
INSERT INTO `session_random_extract` VALUES ('2', '6850338a72994710a03a1e57b4001b0b', '2019-07-10 12:13:07', '重庆辣子鸡,重庆小面', '31,0,30,33');
INSERT INTO `session_random_extract` VALUES ('2', '203b20ce30ba4e6bbdd534c45f82ad67', '2019-07-10 12:08:02', '温泉,呷哺呷哺', '0,47,16');
INSERT INTO `session_random_extract` VALUES ('2', '2762e4aa842f4ac9a9dc1fdd6562d300', '2019-07-10 18:08:15', '国贸大厦,新辣道鱼火锅', '0,43,62,26');
INSERT INTO `session_random_extract` VALUES ('2', 'b8fe98fe89784e2189e98d020cc987a9', '2019-07-10 02:07:54', '火锅,日本料理', '0,69');
INSERT INTO `session_random_extract` VALUES ('2', '9dda261ea50a4a64b5cbdb278f5e4832', '2019-07-10 00:02:54', '温泉,重庆辣子鸡,火锅', '0,58,71,70');
INSERT INTO `session_random_extract` VALUES ('2', '8bda70d6b9574ed68bccef70837e85c0', '2019-07-10 00:08:27', '蛋糕,重庆辣子鸡', '0,47,60,67');
INSERT INTO `session_random_extract` VALUES ('2', '6376c1a3390a44739cbcafbc2ed957d4', '2019-07-10 15:31:42', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', '8acfda51182f44c98af319032da6e3e7', '2019-07-10 05:01:18', '日本料理,新辣道鱼火锅,国贸大厦,温泉', '0,38,2,63,77,49,28,97,17');
INSERT INTO `session_random_extract` VALUES ('2', '4821c1e369a645d1b201d64cfcf6e096', '2019-07-10 01:01:31', '太古商场,新辣道鱼火锅,温泉,重庆小面', '0,95,39,7,23,81,66');
INSERT INTO `session_random_extract` VALUES ('2', 'e70c6862f821475794a3e52dce2f58d5', '2019-07-10 01:12:09', '重庆辣子鸡,温泉', '90,49');
INSERT INTO `session_random_extract` VALUES ('2', '6d862224e3164c6dbc932635604bb6ae', '2019-07-10 13:05:39', '新辣道鱼火锅', '0,37');
INSERT INTO `session_random_extract` VALUES ('2', 'e50c744a289e44d5bcc1d61599db4dce', '2019-07-10 13:03:33', '重庆小面,国贸大厦,呷哺呷哺,新辣道鱼火锅,日本料理,太古商场,温泉', '0,57,22,96,33,28');
INSERT INTO `session_random_extract` VALUES ('2', '7166a30c764b48d9aa56723324071ebc', '2019-07-10 13:00:28', '温泉', '0,77,56');
INSERT INTO `session_random_extract` VALUES ('2', 'ee4a64f8050843eaadf3530ca56e4c0b', '2019-07-10 13:17:46', '呷哺呷哺,日本料理,新辣道鱼火锅,蛋糕', '44,0,17');
INSERT INTO `session_random_extract` VALUES ('2', '319535c1b2af4428bd2c9329cb598b3d', '2019-07-10 07:02:50', '太古商场,重庆小面,温泉', '0,38,62,48,54');
INSERT INTO `session_random_extract` VALUES ('2', '721a3a4f73e44f3f91d3c888f80c7dde', '2019-07-10 07:01:57', '太古商场,新辣道鱼火锅,国贸大厦', '0,50,2,91');
INSERT INTO `session_random_extract` VALUES ('2', '1019ef52bf4043c99b54f8aae908d441', '2019-07-10 14:00:52', '新辣道鱼火锅,重庆小面,太古商场,呷哺呷哺', '35,0');
INSERT INTO `session_random_extract` VALUES ('2', '8bc50e11b6da464f9dc0ef2cddea7f5e', '2019-07-10 17:02:20', '火锅', '57,10,61,8');
INSERT INTO `session_random_extract` VALUES ('2', '0540f6b8576a45f79e9e1a45502f66d8', '2019-07-10 17:10:04', '重庆小面,新辣道鱼火锅,日本料理', '87,68,0,10,54,57');
INSERT INTO `session_random_extract` VALUES ('2', '0a3a46aa90c6417687c3fd2c4aa4e522', '2019-07-10 17:13:49', '火锅,日本料理', '0,41');
INSERT INTO `session_random_extract` VALUES ('2', '07c1acea67a84d79b1a6b54d2b137533', '2019-07-10 03:02:19', '温泉,日本料理,重庆小面', '0,25');
INSERT INTO `session_random_extract` VALUES ('2', 'af81f6a4f511442daefee8068a720ef6', '2019-07-10 16:03:08', '蛋糕,火锅,呷哺呷哺', '0,92,35,89');
INSERT INTO `session_random_extract` VALUES ('2', '09f68b6ad5a44fd0b6f203ecf091ceb9', '2019-07-10 10:05:35', '火锅,太古商场,日本料理', '0,13,49,31');
INSERT INTO `session_random_extract` VALUES ('2', '872a6321540c406089b43e8c343103f1', '2019-07-10 20:00:43', '重庆小面,国贸大厦', '0,39,98,86');
INSERT INTO `session_random_extract` VALUES ('2', 'd74775d8fe6c48f48fe77c40de6aa647', '2019-07-10 20:08:28', '国贸大厦,太古商场', '0,54');
INSERT INTO `session_random_extract` VALUES ('2', '525d8f11e8f2479991a6e98649fea7ee', '2019-07-10 08:24:46', '重庆小面', '0');
INSERT INTO `session_random_extract` VALUES ('2', '98e7f33f5943446b89fe4b2f62fc60a9', '2019-07-10 08:02:54', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', '66bfddb3bd3144a0b62a54a2efa018c9', '2019-07-10 21:00:28', '太古商场', '0,2');
INSERT INTO `session_random_extract` VALUES ('2', '2a1d2245a7af4702becd841965240ac8', '2019-07-10 21:23:03', '新辣道鱼火锅', '0');
INSERT INTO `session_random_extract` VALUES ('2', '2ef5c95719ad4829b6ab5a3ef2670de4', '2019-07-10 12:01:53', '新辣道鱼火锅', '0,2,18,84');
INSERT INTO `session_random_extract` VALUES ('2', '9dae434a78734424b3bb84fafb8dd091', '2019-07-10 22:00:46', '国贸大厦,新辣道鱼火锅,日本料理,蛋糕', '0,68,73,84,43,80,37,15');
INSERT INTO `session_random_extract` VALUES ('2', '013ef0dec54e4718a9a787bf5edf6211', '2019-07-10 22:00:04', '温泉', '42,28,0,34,36,84,90');
INSERT INTO `session_random_extract` VALUES ('2', 'cf97e0765d564415ad51d83f9da1f579', '2019-07-10 00:02:43', '蛋糕,日本料理,太古商场,火锅,温泉,重庆小面', '0,74,36,35,44,28');
INSERT INTO `session_random_extract` VALUES ('2', 'a8c59949c1b44fa48b8b6dc422877082', '2019-07-10 00:02:06', '火锅', '0,49,29,46,52');
INSERT INTO `session_random_extract` VALUES ('2', '638663fc82484484a14ef1c9f7c2db50', '2019-07-10 00:00:35', '蛋糕', '53,0,74,62,75');
INSERT INTO `session_random_extract` VALUES ('2', '1b83c759edea4d288677c71bb23ea41e', '2019-07-10 00:00:07', '日本料理,呷哺呷哺', '29,8,0,41,13,93,68');
INSERT INTO `session_random_extract` VALUES ('2', 'f19eb5b1b83c478bb38dbe242e0ba421', '2019-07-10 15:02:04', '温泉', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'd28529ad4c564cdaa818ae01c0f69c01', '2019-07-10 05:03:02', '国贸大厦,新辣道鱼火锅,日本料理', '9,0,36,96');
INSERT INTO `session_random_extract` VALUES ('2', 'bfca3a1211b14f4fbeaab9b1c75b8da5', '2019-07-10 01:09:01', '国贸大厦,日本料理,火锅', '0,5');
INSERT INTO `session_random_extract` VALUES ('2', '7c37e1cf3787470daf559d39ce1e79d5', '2019-07-10 01:00:33', '国贸大厦', '43,0,78,73,45');
INSERT INTO `session_random_extract` VALUES ('2', '89a2af13aefe45ab9ec605cd2a9105a2', '2019-07-10 01:03:16', '国贸大厦', '0,44,27,83,38');
INSERT INTO `session_random_extract` VALUES ('2', '7a8b1d4123074ee8b1609f412de7f7d6', '2019-07-10 06:00:13', '日本料理,温泉,呷哺呷哺', '0,48,58');
INSERT INTO `session_random_extract` VALUES ('2', 'ba78fb4dd6ab45ecbbc8ad21049d3fd3', '2019-07-10 14:01:18', '日本料理,重庆辣子鸡', '7,0,87');
INSERT INTO `session_random_extract` VALUES ('2', 'f8e42ed805cf41c08d67531f039140f3', '2019-07-10 14:01:32', '重庆辣子鸡', '0,84,59');
INSERT INTO `session_random_extract` VALUES ('2', '7813052017334546b782b68f49103d05', '2019-07-10 14:10:22', '国贸大厦', '0,29,32,5,64');
INSERT INTO `session_random_extract` VALUES ('2', '1904add0f6a2445aae0c4ea60b212b59', '2019-07-10 07:03:20', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', '75e8a1043c3c41269e6e2e4e1494082e', '2019-07-10 17:05:27', '呷哺呷哺', '0,48,7,32,70');
INSERT INTO `session_random_extract` VALUES ('2', '996285b787774bb8a2f41a4a447e85de', '2019-07-10 04:00:58', '日本料理,重庆辣子鸡,国贸大厦', '0,15,8');
INSERT INTO `session_random_extract` VALUES ('2', 'bbb5ff03b71a4210940ff8840cf96e48', '2019-07-10 03:38:02', null, '0');
INSERT INTO `session_random_extract` VALUES ('2', '8081258c12f84e58ab06047071fe5169', '2019-07-10 10:01:46', '火锅', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'c516f1e728954e9bb4dba045a55e4989', '2019-07-10 20:02:04', '新辣道鱼火锅,太古商场', '66,0');
INSERT INTO `session_random_extract` VALUES ('2', 'a203f5e2cdcd45bdbc9470775b9bc943', '2019-07-10 08:02:27', '新辣道鱼火锅,蛋糕', '0');
INSERT INTO `session_random_extract` VALUES ('2', '9de608c906504ae8928a1b0ce589a1a0', '2019-07-10 21:00:37', '新辣道鱼火锅,呷哺呷哺,重庆小面,日本料理', '0,9,65,71,35,92');
INSERT INTO `session_random_extract` VALUES ('2', '5272b83df00c47678a0238af7db8e1a7', '2019-07-10 12:13:47', null, '35,25,81,0');
INSERT INTO `session_random_extract` VALUES ('2', '51e8d57c006a4a19a60630663d937e9c', '2019-07-10 09:06:31', '太古商场', '0,76,10,30');
INSERT INTO `session_random_extract` VALUES ('2', 'e9e6a5a7c01a4a29b3a363f6a07756e7', '2019-07-10 00:07:05', '新辣道鱼火锅', '0,18,87');
INSERT INTO `session_random_extract` VALUES ('2', '6874a0baa5304b3cb0d77c778b5ef5f7', '2019-07-10 00:01:55', '国贸大厦,重庆小面', '0,91');
INSERT INTO `session_random_extract` VALUES ('2', 'e7627b8bf435485ba4e9709492ffe357', '2019-07-10 15:07:05', '日本料理,国贸大厦,太古商场,新辣道鱼火锅', '97,33,0,75,32');
INSERT INTO `session_random_extract` VALUES ('2', '60186c14f9f742e7ba34145b7f1bcc52', '2019-07-10 01:08:16', '新辣道鱼火锅,日本料理', '4,0,67');
INSERT INTO `session_random_extract` VALUES ('2', '94c0a6d68a784c14896513af68bdaaab', '2019-07-10 01:01:11', '新辣道鱼火锅', '0,15,36,19,7,97');
INSERT INTO `session_random_extract` VALUES ('2', '76b3e446e02e40e48d3649a9b6994386', '2019-07-10 06:14:21', null, '0,55,48');
INSERT INTO `session_random_extract` VALUES ('2', 'c7760476ce514a50ad8e7da25ab0e481', '2019-07-10 06:08:48', null, '0,71,94,36');
INSERT INTO `session_random_extract` VALUES ('2', '88b0a215b0944def9864297890ff9751', '2019-07-10 14:02:47', '太古商场,呷哺呷哺,国贸大厦,新辣道鱼火锅', '0,63,19,86');
INSERT INTO `session_random_extract` VALUES ('2', 'e1a21753f86448ff9960e46de22358a7', '2019-07-10 01:04:00', '重庆小面,呷哺呷哺', '0,78');
INSERT INTO `session_random_extract` VALUES ('2', 'cdf1fe6ee1c9473b905294604a57fc2f', '2019-07-10 11:14:42', '温泉', '0,20,51,79,53');
INSERT INTO `session_random_extract` VALUES ('2', 'cd2307bfb94f4ae0adf01ccd7c0250d1', '2019-07-10 17:03:39', '火锅,重庆辣子鸡,温泉,蛋糕', '0,25,20,3');
INSERT INTO `session_random_extract` VALUES ('2', '598fca730cc4410d891b28047297012c', '2019-07-10 17:05:42', '蛋糕,新辣道鱼火锅', '0,26,78');
INSERT INTO `session_random_extract` VALUES ('2', '8869684638514ea39f49e9014bf2f3bd', '2019-07-10 17:08:18', '呷哺呷哺,日本料理,太古商场,温泉,蛋糕', '40,53,41,77,64');
INSERT INTO `session_random_extract` VALUES ('2', '4348759fe142449c8e4a57e4d34ca9ec', '2019-07-10 03:02:30', '国贸大厦,重庆小面,新辣道鱼火锅,太古商场', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'a77f6562a9df4203806f05385b145c13', '2019-07-10 06:06:44', '火锅,国贸大厦', '0,72,93,45,49,29');
INSERT INTO `session_random_extract` VALUES ('2', '8b17b6caf4604ab892330b355049b640', '2019-07-10 06:23:30', '重庆小面', '0');
INSERT INTO `session_random_extract` VALUES ('2', '4817c03df6c54e32811165a8ad87d5d3', '2019-07-10 10:13:50', '呷哺呷哺,重庆小面', '0,40,45,29');
INSERT INTO `session_random_extract` VALUES ('2', 'b00743bf81cd41f682f29209064cf1de', '2019-07-10 10:00:05', '重庆辣子鸡,新辣道鱼火锅,蛋糕,温泉,国贸大厦', '29,0,78,30,51');
INSERT INTO `session_random_extract` VALUES ('2', 'fae107bf598a4ce78cc43b6127460131', '2019-07-10 10:07:05', '国贸大厦,太古商场,温泉,重庆小面', '76,77,49,0');
INSERT INTO `session_random_extract` VALUES ('2', '5a190145e80e4a44aca8023562d4d61a', '2019-07-10 10:03:39', '重庆小面,太古商场', '0,1,33,96,83');
INSERT INTO `session_random_extract` VALUES ('2', 'da04718a64454170949185eb626b6491', '2019-07-10 10:07:31', '国贸大厦,重庆辣子鸡', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'f93e8f349d5f482fbd3c1cdadc492fe8', '2019-07-10 10:04:58', '重庆小面,国贸大厦,火锅,重庆辣子鸡,日本料理', '0,70,38,86,54,45');
INSERT INTO `session_random_extract` VALUES ('2', '6359c7474df64abc9271f55c03e9c157', '2019-07-10 10:02:18', '日本料理,蛋糕,重庆辣子鸡', '0,19,29,86');
INSERT INTO `session_random_extract` VALUES ('2', 'dbbe1c20acb647008a8a9a04a7fbf2f2', '2019-07-10 20:11:08', '呷哺呷哺,火锅', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'a6cf3833793347b08da0c19f5f6f41a9', '2019-07-10 20:04:31', '温泉,重庆小面,新辣道鱼火锅,太古商场', '58,0,2,76');
INSERT INTO `session_random_extract` VALUES ('2', '101e7fbd1a1548079a05c08e32da1eb5', '2019-07-10 20:07:31', '新辣道鱼火锅,日本料理,太古商场,重庆辣子鸡', '0,51');
INSERT INTO `session_random_extract` VALUES ('2', 'c5aa4a234eca46b297315816c07897fd', '2019-07-10 20:00:45', '国贸大厦,重庆小面,温泉', '0,34,67,65,2,50,48,83,56');
INSERT INTO `session_random_extract` VALUES ('2', '5d8180e2810f46ed90f76461aa9caee9', '2019-07-10 19:07:53', '太古商场', '0,94,17,10');
INSERT INTO `session_random_extract` VALUES ('2', 'f2a4e8cc78c44315b8aa4f3ec0778969', '2019-07-10 19:04:58', '温泉,火锅', '80,27');
INSERT INTO `session_random_extract` VALUES ('2', '4185ada37afc4c4383bc7cef9b599437', '2019-07-10 12:01:53', '蛋糕,温泉,新辣道鱼火锅', '0,76,78,64');
INSERT INTO `session_random_extract` VALUES ('2', '63629dc02179483d86f9c6378067414f', '2019-07-10 12:07:02', '重庆小面,蛋糕', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'c11e70abbc0a4744a0c16b727a2bb01e', '2019-07-10 18:13:38', '国贸大厦,温泉,火锅,日本料理', '0,23');
INSERT INTO `session_random_extract` VALUES ('2', 'cbce6ab0f90149b0aaf053c6360f723c', '2019-07-10 18:00:33', '温泉,国贸大厦,蛋糕,日本料理,火锅,重庆小面', '21,85,47,0,17');
INSERT INTO `session_random_extract` VALUES ('2', '643f0067e5cb4a64be60fad1f6f67f48', '2019-07-10 18:00:43', '太古商场,蛋糕,重庆辣子鸡', '0,36');
INSERT INTO `session_random_extract` VALUES ('2', '8cfb0ace7cf549f58a31e42906f73c7c', '2019-07-10 18:00:16', '呷哺呷哺,火锅', '52,0,79,3,30,71,40,78,26');
INSERT INTO `session_random_extract` VALUES ('2', 'bdec492f36e047e587f5eb5ecc31c276', '2019-07-10 18:01:40', '太古商场,温泉,蛋糕,火锅', '0,69,15,39,32');
INSERT INTO `session_random_extract` VALUES ('2', '49afabfacffd4a07b57e43973aa7e762', '2019-07-10 22:00:14', '太古商场,重庆辣子鸡,温泉,重庆小面', '76,0,50,52,91,24,59');
INSERT INTO `session_random_extract` VALUES ('2', '1356d641848443b6bf456aab53870ed3', '2019-07-10 02:04:42', '呷哺呷哺,日本料理,国贸大厦,太古商场,重庆辣子鸡,火锅,温泉', '0,19,88,63,99,25');
INSERT INTO `session_random_extract` VALUES ('2', '2a1e5ca792204df4b4364eaf33b03fb8', '2019-07-10 02:00:16', '国贸大厦', '84,76,0,14');
INSERT INTO `session_random_extract` VALUES ('2', 'fe1e56e1f02f47ba9c6bd6d38e155902', '2019-07-10 02:02:00', '温泉,太古商场', '62,0,79,3,11,90,72');
INSERT INTO `session_random_extract` VALUES ('2', '777514d36524459e89034305f579964b', '2019-07-10 09:00:03', '呷哺呷哺,国贸大厦', '0,93,27');
INSERT INTO `session_random_extract` VALUES ('2', 'f170fa0c2aa548dcb6bac43cb37c7a7c', '2019-07-10 09:00:21', '温泉,太古商场,重庆辣子鸡,火锅', '0,39,98,91,24,28,30,84');
INSERT INTO `session_random_extract` VALUES ('2', 'f468a84f7f7444a0a70a837906d50c85', '2019-07-10 09:07:34', '温泉,新辣道鱼火锅', '0,45,58');
INSERT INTO `session_random_extract` VALUES ('2', '6eb0a218fb234eacb149a2b252309515', '2019-07-10 09:00:56', '火锅,温泉,呷哺呷哺,国贸大厦', '0,44,32,19,75,6');
INSERT INTO `session_random_extract` VALUES ('2', '4fe5bb5117f944fd8b6d2db433605ee5', '2019-07-10 09:09:25', '火锅,国贸大厦,温泉', '0,46,13,15');
INSERT INTO `session_random_extract` VALUES ('2', 'ee703a0c179e4ecea0a9376e30339b91', '2019-07-10 09:09:08', '国贸大厦,蛋糕,火锅,新辣道鱼火锅', '97,0,43,18,6,24');
INSERT INTO `session_random_extract` VALUES ('2', '075a64d3cb7047b4b0acfac6819163d4', '2019-07-10 00:09:11', '呷哺呷哺', '40,22');
INSERT INTO `session_random_extract` VALUES ('2', '9b9a67b6125843318d4e6086602aca2c', '2019-07-10 00:05:09', '温泉,太古商场,重庆小面,呷哺呷哺', '91,0,77');
INSERT INTO `session_random_extract` VALUES ('2', 'bb6eeabdfe8a43ffb557aa9b5b2ee307', '2019-07-10 15:05:31', '重庆辣子鸡,太古商场,国贸大厦,火锅,重庆小面,新辣道鱼火锅,温泉', '0,20,9,60,75');
INSERT INTO `session_random_extract` VALUES ('2', '29b2778b9682454098e548224c1884bf', '2019-07-10 15:10:19', '国贸大厦', '0,79,14');
INSERT INTO `session_random_extract` VALUES ('2', '6c7fc0786a3c4ca4a8a8e9881c79c5e7', '2019-07-10 05:02:33', '火锅', '0,85');
INSERT INTO `session_random_extract` VALUES ('2', '78a396123c9f410f8aca945347928fec', '2019-07-10 05:01:12', '重庆辣子鸡,新辣道鱼火锅,国贸大厦,太古商场', '31,0,2,78');
INSERT INTO `session_random_extract` VALUES ('2', '10cc80fcf8634c39b2ccb430d63a58ed', '2019-07-10 07:06:51', '火锅', '0,94,70');
INSERT INTO `session_random_extract` VALUES ('2', '302e1f9b73fa4bc281390db3891115be', '2019-07-10 07:04:06', '火锅', '0');
INSERT INTO `session_random_extract` VALUES ('2', 'a5507e4a7890463c8aa5287899fa8d56', '2019-07-10 13:00:10', '新辣道鱼火锅,国贸大厦,呷哺呷哺', '0,85,21,10,41,96');
INSERT INTO `session_random_extract` VALUES ('2', 'cc85894a6d024dc9871be5e55fe240bf', '2019-07-10 13:01:45', '重庆辣子鸡,呷哺呷哺', '99,0,77');
