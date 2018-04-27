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

 Date: 26/04/2018 16:31:47
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
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '1', '2', '2018-04-20 14:43:41', 17, '3', 0, 1, 'music');
INSERT INTO `article` VALUES (2, '234', '123', '2018-04-20 16:37:53', 20, '23', 0, 1, 'studyLife');
INSERT INTO `article` VALUES (3, '2424', '<p>1232</p><p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/tootha_thumb.gif\"></p><p><br></p>', '2018-04-20 16:38:12', 20, '23', 0, 1, 'socialActivity');
INSERT INTO `article` VALUES (4, '我是管理员', '哈哈哈哈哈', '2018-04-20 19:50:27', 1, '2', 0, 1, 'fleaMarket');
INSERT INTO `article` VALUES (5, '照片', '<p><img src=\"/MyBBS/resources/upload/03c1229e-e78b-402e-aa63-252177b27f3b.jpeg&#10;\" alt=\"1\" style=\"max-width:100%;\"></p><p><br></p>', '2018-04-24 20:26:31', 1, '测试', 1, 1, 'datingZone');
INSERT INTO `article` VALUES (6, '23', '23', '2018-04-25 02:06:42', 1, '32', 0, 1, 'studyLife');
INSERT INTO `article` VALUES (7, '214124', '<p>1231</p>', '2018-04-25 02:45:03', 17, '2', 0, 1, 'studyLife');
INSERT INTO `article` VALUES (8, '56', '2314', '2018-04-25 02:45:16', 17, '5235', 0, 1, 'studyLife');
INSERT INTO `article` VALUES (9, '325246', '123', '2018-04-25 02:45:24', 17, '2', 2, 1, 'studyLife');
INSERT INTO `article` VALUES (11, '2424', '231', '2018-04-25 02:46:10', 1, '', 0, 1, 'studyLife');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '你好啊', 5, 1, '2018-04-25 03:18:25');
INSERT INTO `comment` VALUES (2, '2楼', 5, 1, '2018-04-25 03:19:42');

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
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `comment` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES (1, 5, 1, 1, '你也好');
INSERT INTO `floor` VALUES (2, 5, 1, 1, '回复123 : 你也是');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `power` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'power为1时表示管理员权限，power为2是表示为普通会员权限',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '202cb962ac59075b964b07152d234b70', 'http://ousfjjmwl.bkt.clouddn.com/1524225757176.jpeg', 1);
INSERT INTO `user` VALUES (17, '1', '-37e18d7262b3d09c90f9807633eb79d4', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (18, '2', '-3b35bdc75f46dc7df233af65908a7b65', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (20, '12', '-3df52b28901688a655d85f36640098f0', '/resources/imgs/head.png', 2);

SET FOREIGN_KEY_CHECKS = 1;
