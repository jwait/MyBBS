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

 Date: 30/04/2018 00:52:05
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
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (22, '123', '<p><img src=\"/MyBBS/resources/upload/390f4c1e-4123-4c93-a970-4190a2b05fa7.jpeg&#10;\" alt=\"1\" style=\"max-width:100%;\"></p><p><br></p>', '2018-04-27 22:40:15', 1, '23', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (23, '照片', '<p>看一看</p><p><img src=\"/MyBBS/resources/upload/e0c9d415-9b22-4ecf-81b4-a8d5844a81d1.jpg&#10;\" alt=\"u=1140234752,3777445573&fm=200&amp;gp=0\" style=\"max-width:100%;\"></p><p><br></p>', '2018-04-27 22:41:06', 1, '', 0, 1, 'schoolNews');
INSERT INTO `article` VALUES (24, '大家好', '我是123', '2018-04-27 22:57:26', 35, '', 3, 1, 'schoolNews');
INSERT INTO `article` VALUES (25, '1', '1', '2018-04-28 00:38:32', 35, '', 3, 1, 'other');
INSERT INTO `article` VALUES (26, '123', '123', '2018-04-30 00:21:21', 35, '23', 0, 0, 'animeMovie');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123456', '-1ef523c6b645a65441a91fa80df077c2', 'http://ousfjjmwl.bkt.clouddn.com/1524838848757.jpg', 1);
INSERT INTO `user` VALUES (35, '123', '-1ef523c6b645a65441a91fa80df077c2', '/resources/imgs/head.png', 2);
INSERT INTO `user` VALUES (36, '1234', '-1ef523c6b645a65441a91fa80df077c2', 'http://ousfjjmwl.bkt.clouddn.com/1525018290771.jpg', 2);

SET FOREIGN_KEY_CHECKS = 1;
