/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : mybbs

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 12/05/2018 19:13:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `lable` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '1=置顶 \r\n2=加精 \r\n3=置顶且加精 \r\n0=无',
  `pass` tinyint(1) NULL DEFAULT 0 COMMENT 'pass=0表示未通过，pass=1表示通过',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (22, '123', '<p><img src=\"/MyBBS/resources/upload/390f4c1e-4123-4c93-a970-4190a2b05fa7.jpeg&#10;\" alt=\"1\" style=\"max-width:100%;\"></p><p><br></p>', '2018-04-27 22:40:15', 1, '23', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (23, '照片', '<p>看一看</p><p><img src=\"/MyBBS/resources/upload/e0c9d415-9b22-4ecf-81b4-a8d5844a81d1.jpg&#10;\" alt=\"u=1140234752,3777445573&fm=200&amp;gp=0\" style=\"max-width:100%;\"></p><p><br></p>', '2018-04-27 22:41:06', 1, '', 1, 1, 'schoolNews');
INSERT INTO `article` VALUES (24, '大家好', '我是123', '2018-04-27 22:57:26', 35, '', 2, 1, 'schoolNews');
INSERT INTO `article` VALUES (25, '1', '1', '2018-04-28 00:38:32', 35, '', 2, 1, 'other');
INSERT INTO `article` VALUES (26, '123', '123', '2018-04-30 00:21:21', 35, '23', 1, 1, 'animeMovie');
INSERT INTO `article` VALUES (27, '1', '1', '2018-04-30 04:12:38', 35, '1', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (28, '123', '123', '2018-04-30 04:15:24', 1, '123', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (29, '123', '123', '2018-04-30 04:16:10', 1, '123', 0, 1, 'other');
INSERT INTO `article` VALUES (30, '12', '313', '2018-04-30 04:18:32', 1, '12', 0, 1, 'socialActivity');
INSERT INTO `article` VALUES (31, '123', '12421', '2018-05-02 00:22:56', 35, '', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (32, '12414', '213142', '2018-05-02 00:23:00', 35, '', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (33, '2355', '231', '2018-05-02 00:23:04', 35, '', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (34, '124', '12341', '2018-05-02 00:23:08', 35, '', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (35, '1241', '214142', '2018-05-02 00:23:12', 35, '', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (36, '45g', 'dsff', '2018-05-02 00:23:55', 1, '', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (37, 'erewr', '231', '2018-05-02 00:24:01', 1, '', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (39, '123', '123', '2018-05-02 02:09:22', 40, '231', 1, 1, 'schoolNews');
INSERT INTO `article` VALUES (40, '123', '<p>你好</p><p><img src=\"/MyBBS/resources/upload/46a69226-d963-4421-9366-1634beead2c2.jpeg&#10;\" alt=\"1\" style=\"max-width:100%;\"></p><p>我很好</p>', '2018-05-02 02:28:31', 1, '', 0, 1, 'animeMovie');
INSERT INTO `article` VALUES (41, '视频', '<p><iframe src=\"//player.bilibili.com/player.html?aid=22843825&cid=37946919&amp;page=1\" scrolling=\"no\" border=\"0\" frameborder=\"no\" framespacing=\"0\" allowfullscreen=\"true\" width=\"640\" height=\"498\"></iframe></p><p><br></p>', '2018-05-02 02:34:32', 1, '', 2, 1, 'schoolNews');
INSERT INTO `article` VALUES (42, '颜色', '<p><b style=\"\"><font color=\"#ff00ff\">想去</font></b></p><p><font color=\"#0000ff\"><b>的</b></font></p><p><font color=\"#ff0000\"><b>地方</b></font></p><p><font color=\"#00ff00\"><b>很多</b></font></p><p><font color=\"#ffcc00\"><b>很多</b></font></p><p><br></p>', '2018-05-02 02:39:28', 1, 'test', 2, 1, 'schoolNews');
INSERT INTO `article` VALUES (43, '123', '123', '2018-05-11 15:25:03', 1, '', 0, 0, 'schoolNews');
INSERT INTO `article` VALUES (44, '12312', '12314', '2018-05-11 15:38:25', 1, '', 0, 0, 'schoolNews');
INSERT INTO `article` VALUES (46, '11111111111111111111', '123214', '2018-05-11 17:03:19', 1, '', 3, 1, 'schoolNews');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `aid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `aid` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (7, '123', 24, 35, '2018-04-30 04:06:00');
INSERT INTO `comment` VALUES (8, '123', 25, 1, '2018-04-30 04:21:14');
INSERT INTO `comment` VALUES (9, '123', 29, 1, '2018-04-30 04:55:56');
INSERT INTO `comment` VALUES (10, '123', 27, 1, '2018-04-30 05:23:28');
INSERT INTO `comment` VALUES (11, '123', 26, 37, '2018-04-30 17:23:53');
INSERT INTO `comment` VALUES (12, '12324', 26, 38, '2018-04-30 21:20:42');
INSERT INTO `comment` VALUES (13, '123', 26, 35, '2018-05-01 01:26:53');
INSERT INTO `comment` VALUES (15, '5', 26, 35, '2018-05-01 21:59:56');
INSERT INTO `comment` VALUES (16, '6', 26, 35, '2018-05-01 22:00:00');
INSERT INTO `comment` VALUES (17, '7', 26, 35, '2018-05-01 22:00:03');
INSERT INTO `comment` VALUES (18, '8', 26, 35, '2018-05-01 22:00:07');
INSERT INTO `comment` VALUES (19, '9', 26, 35, '2018-05-01 22:00:11');
INSERT INTO `comment` VALUES (20, '10', 26, 35, '2018-05-01 22:00:19');
INSERT INTO `comment` VALUES (21, '去23', 26, 35, '2018-05-01 22:00:24');
INSERT INTO `comment` VALUES (22, '12414', 26, 35, '2018-05-01 22:00:33');
INSERT INTO `comment` VALUES (23, '1414', 26, 35, '2018-05-01 22:00:39');
INSERT INTO `comment` VALUES (24, '12321', 26, 35, '2018-05-01 22:01:55');
INSERT INTO `comment` VALUES (25, '1214341', 26, 35, '2018-05-02 00:00:11');
INSERT INTO `comment` VALUES (26, '12414', 26, 35, '2018-05-02 00:00:17');
INSERT INTO `comment` VALUES (27, '2355765879', 26, 35, '2018-05-02 00:00:24');
INSERT INTO `comment` VALUES (28, '2324', 26, 35, '2018-05-02 00:00:29');
INSERT INTO `comment` VALUES (29, '325', 26, 35, '2018-05-02 00:00:35');
INSERT INTO `comment` VALUES (30, '325', 26, 35, '2018-05-02 00:00:35');
INSERT INTO `comment` VALUES (31, '345', 26, 35, '2018-05-02 00:00:40');
INSERT INTO `comment` VALUES (32, '12334', 40, 1, '2018-05-02 02:29:01');
INSERT INTO `comment` VALUES (33, '13123', 26, 1, '2018-05-02 02:46:07');
INSERT INTO `comment` VALUES (34, '123', 24, 1, '2018-05-02 02:52:41');
INSERT INTO `comment` VALUES (35, '123', 39, 42, '2018-05-11 14:28:07');
INSERT INTO `comment` VALUES (36, '**功', 40, 1, '2018-05-11 14:33:33');
INSERT INTO `comment` VALUES (37, '<p>法 轮 功</p>', 40, 1, '2018-05-11 14:34:51');

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid_1`(`uid`) USING BTREE,
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `comment` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES (49, 26, 11, 35, '回复  134 :谢谢', '2018-04-30 19:07:06');
INSERT INTO `floor` VALUES (53, 26, 11, 35, '123', '2018-04-30 18:48:50');
INSERT INTO `floor` VALUES (54, 26, 11, 35, '回复  123 :123', '2018-04-30 18:48:55');
INSERT INTO `floor` VALUES (55, 26, 11, 35, '123', '2018-04-30 18:51:35');
INSERT INTO `floor` VALUES (56, 26, 11, 35, '123', '2018-04-30 18:52:00');
INSERT INTO `floor` VALUES (57, 26, 11, 35, '回复  123 :23', '2018-04-30 18:52:10');
INSERT INTO `floor` VALUES (58, 26, 11, 35, '回复  123 :123', '2018-04-30 18:52:18');
INSERT INTO `floor` VALUES (60, 26, 11, 35, '回复  123 :你好', '2018-04-30 18:53:58');
INSERT INTO `floor` VALUES (62, 26, 11, 37, '大家好\n', '2018-04-30 18:56:11');
INSERT INTO `floor` VALUES (63, 26, 11, 37, '回复  123 :大家好', '2018-04-30 18:56:47');
INSERT INTO `floor` VALUES (64, 26, 11, 38, '回复  123 :123', '2018-04-30 21:17:01');
INSERT INTO `floor` VALUES (65, 26, 12, 38, '123', '2018-04-30 21:37:17');
INSERT INTO `floor` VALUES (66, 26, 11, 38, '回复  12345 :100', '2018-04-30 21:39:46');
INSERT INTO `floor` VALUES (67, 26, 12, 38, '123', '2018-04-30 21:57:58');
INSERT INTO `floor` VALUES (68, 26, 12, 38, '123', '2018-04-30 21:58:14');
INSERT INTO `floor` VALUES (69, 26, 12, 38, '23', '2018-04-30 21:58:55');
INSERT INTO `floor` VALUES (70, 26, 12, 38, '123', '2018-04-30 21:59:45');
INSERT INTO `floor` VALUES (79, 26, 12, 35, '回复  123 :55', '2018-04-30 22:20:37');
INSERT INTO `floor` VALUES (81, 29, 9, 35, '123', '2018-04-30 22:56:55');
INSERT INTO `floor` VALUES (82, 29, 9, 35, '回复  123 :123', '2018-04-30 22:56:59');
INSERT INTO `floor` VALUES (83, 29, 9, 35, '回复  123 :12', '2018-04-30 22:58:21');
INSERT INTO `floor` VALUES (84, 29, 9, 35, '回复  123 :123：', '2018-04-30 23:00:12');
INSERT INTO `floor` VALUES (85, 29, 9, 35, '回复  123 :哈哈', '2018-04-30 23:01:04');
INSERT INTO `floor` VALUES (86, 29, 9, 35, '回复  123 :呵呵', '2018-04-30 23:01:27');
INSERT INTO `floor` VALUES (87, 29, 9, 35, '回复  123 :12', '2018-04-30 23:02:19');
INSERT INTO `floor` VALUES (88, 29, 9, 35, '回复  123 :123', '2018-04-30 23:02:51');
INSERT INTO `floor` VALUES (89, 29, 9, 35, '回复  123 :12', '2018-04-30 23:03:27');
INSERT INTO `floor` VALUES (90, 29, 9, 35, '回复  123 :123', '2018-04-30 23:03:32');
INSERT INTO `floor` VALUES (91, 29, 9, 35, '回复  123 :123', '2018-04-30 23:04:13');
INSERT INTO `floor` VALUES (92, 29, 9, 35, '回复  123 :123', '2018-04-30 23:04:39');
INSERT INTO `floor` VALUES (93, 29, 9, 35, '回复  123 :23', '2018-04-30 23:05:20');
INSERT INTO `floor` VALUES (94, 29, 9, 35, '回复  123 :123', '2018-04-30 23:05:36');
INSERT INTO `floor` VALUES (95, 29, 9, 35, '回复  123 :你好', '2018-04-30 23:06:29');
INSERT INTO `floor` VALUES (96, 29, 9, 35, '回复  123 :测试\n', '2018-04-30 23:06:45');
INSERT INTO `floor` VALUES (97, 29, 9, 35, '回复  123 :你们号啊', '2018-04-30 23:07:44');
INSERT INTO `floor` VALUES (98, 29, 9, 35, '回复  123 :123', '2018-04-30 23:08:00');
INSERT INTO `floor` VALUES (99, 29, 9, 35, '12', '2018-04-30 23:22:10');
INSERT INTO `floor` VALUES (100, 29, 9, 35, '回复  123 :123', '2018-04-30 23:30:40');
INSERT INTO `floor` VALUES (101, 26, 12, 35, '123', '2018-05-01 01:42:36');
INSERT INTO `floor` VALUES (107, 26, 11, 35, '12323', '2018-05-01 01:47:28');
INSERT INTO `floor` VALUES (110, 26, 11, 35, '123142', '2018-05-01 01:48:35');
INSERT INTO `floor` VALUES (111, 26, 11, 35, '123', '2018-05-01 01:51:28');
INSERT INTO `floor` VALUES (112, 26, 11, 35, '24114', '2018-05-01 01:51:35');
INSERT INTO `floor` VALUES (113, 26, 11, 35, '124341', '2018-05-01 01:51:45');
INSERT INTO `floor` VALUES (115, 26, 11, 35, '123213', '2018-05-01 01:54:08');
INSERT INTO `floor` VALUES (116, 26, 11, 35, '回复  123 :14124', '2018-05-01 01:54:41');
INSERT INTO `floor` VALUES (119, 26, 11, 35, '1234', '2018-05-01 02:11:47');
INSERT INTO `floor` VALUES (122, 26, 11, 35, '12323', '2018-05-01 02:14:03');
INSERT INTO `floor` VALUES (124, 26, 11, 35, '1234', '2018-05-01 02:44:48');
INSERT INTO `floor` VALUES (125, 26, 13, 35, '12323', '2018-05-01 02:46:17');
INSERT INTO `floor` VALUES (126, 26, 13, 35, '回复  123 :1234', '2018-05-01 02:47:54');
INSERT INTO `floor` VALUES (127, 26, 13, 35, '回复  123 :1314', '2018-05-01 02:48:53');
INSERT INTO `floor` VALUES (128, 26, 13, 35, '14124', '2018-05-01 02:50:22');
INSERT INTO `floor` VALUES (129, 26, 13, 35, '回复  123 :12321', '2018-05-01 02:51:14');
INSERT INTO `floor` VALUES (130, 26, 13, 35, '12312', '2018-05-01 02:51:53');
INSERT INTO `floor` VALUES (131, 26, 11, 35, '1233', '2018-05-01 02:53:34');
INSERT INTO `floor` VALUES (132, 26, 11, 35, '回复  123 :123213', '2018-05-01 02:54:40');
INSERT INTO `floor` VALUES (134, 26, 11, 35, '回复  123 :12414', '2018-05-01 02:56:11');
INSERT INTO `floor` VALUES (137, 26, 11, 35, '123', '2018-05-01 03:02:51');
INSERT INTO `floor` VALUES (138, 26, 11, 35, '123', '2018-05-01 03:17:11');
INSERT INTO `floor` VALUES (139, 26, 11, 35, '回复 123 :', '2018-05-01 03:23:20');
INSERT INTO `floor` VALUES (140, 26, 11, 35, '回复 123 :', '2018-05-01 03:27:12');
INSERT INTO `floor` VALUES (141, 26, 11, 35, '回复 123 :14214', '2018-05-01 03:27:51');
INSERT INTO `floor` VALUES (143, 26, 11, 35, '回复 123 :1314', '2018-05-01 03:31:14');
INSERT INTO `floor` VALUES (145, 26, 31, 1, '123', '2018-05-02 02:46:02');
INSERT INTO `floor` VALUES (146, 39, 35, 42, '1234', '2018-05-11 14:28:18');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `power` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'power为1时表示管理员权限，power为2是表示为普通会员权限',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123456', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', 'http://ousfjjmwl.bkt.clouddn.com/1524838848757.jpg', 1);
INSERT INTO `user` VALUES (35, '123', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', 'http://ousfjjmwl.bkt.clouddn.com/1525081623737.jpg', 2);
INSERT INTO `user` VALUES (36, '1234', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', 'http://ousfjjmwl.bkt.clouddn.com/1525018290771.jpg', 2);
INSERT INTO `user` VALUES (37, '134', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', 'http://ousfjjmwl.bkt.clouddn.com/1525092828285.jpeg', 2);
INSERT INTO `user` VALUES (38, '12345', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (39, '1235', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (40, '哈哈哈哈哈哈哈哈', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (41, '管理员', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (42, '12345789', '-3156df08bed4a25841f30bd4736c8a7', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (43, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (45, '1234567', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (46, '1239', '-1ef523c6b645a65441a91fa80df077c2', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (47, '1237', '-3156df08bed4a25841f30bd4736c8a7', '13343534563', '123@dsa', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (48, '125', '-1ef523c6b645a65441a91fa80df077c2', '13353646364', '123141@12353', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (49, '12356', '-1ef523c6b645a65441a91fa80df077c2', '15545431233', 'haha@qq.com', '/resources/imgs/head.png', 2);

SET FOREIGN_KEY_CHECKS = 1;
