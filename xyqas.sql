/*
Navicat MySQL Data Transfer

Source Server         : call
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : xyqas

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-06-10 15:43:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for analysis
-- ----------------------------
DROP TABLE IF EXISTS `analysis`;
CREATE TABLE `analysis` (
  `analysis_id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`analysis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of analysis
-- ----------------------------
INSERT INTO `analysis` VALUES ('1', '3', '1', '2020-04-03 10:26:42');
INSERT INTO `analysis` VALUES ('2', '2', '2', '2020-04-03 10:26:55');
INSERT INTO `analysis` VALUES ('3', '3', '1', '2020-04-03 14:14:07');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `forum_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '版块id',
  `forum_name` varchar(50) NOT NULL DEFAULT 'default' COMMENT '版块名',
  `forum_isDeleted` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除，0-否，1-逻辑删除',
  `forum_createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `forum_modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`forum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='版块';

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES ('1', '默认', '0', '2020-03-29 11:48:58', '2020-03-29 11:53:13');
INSERT INTO `forum` VALUES ('2', '生活', '0', '2020-03-29 11:48:58', '2020-03-29 11:53:13');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '回复人id',
  `tip_id` int(11) NOT NULL DEFAULT '0' COMMENT '被回复贴id',
  `reply_content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '回复内容',
  `reply_publishTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '回复发表时间',
  `reply_modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '回复修改时间',
  `reply_isDeleted` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除，0-否，1-逻辑删除',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='回复表';

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '6', '1', 0xE6B58BE8AF95E59B9EE5A48D, '2020-03-29 16:09:37', null, '0');
INSERT INTO `reply` VALUES ('2', '1', '1', 0xE9808DE981A5E6B58BE8AF95E59B9EE5A48D, '2020-03-29 17:06:42', null, '0');
INSERT INTO `reply` VALUES ('3', '1', '2', 0xE9808DE981A5E59CA8E6ADA4E8A1A8E7A4BAE6849FE8B0A2E38082, '2020-03-29 23:56:55', null, '0');
INSERT INTO `reply` VALUES ('4', '1', '2', 0xE69CACE8AEBAE59D9BE4BB85E794A8E4BA8EE8BF9BE8A18CE5ADA6E4B9A0E4BAA4E6B581E38082, '2020-03-29 00:08:20', null, '0');
INSERT INTO `reply` VALUES ('5', '2', '3', 0x3C7363726970743E616C65727428E2809848656C6C6F20576F726C64E28099293C2F7363726970743E, '2020-03-29 09:34:54', null, '0');
INSERT INTO `reply` VALUES ('6', '2', '3', 0x3C7363726970743E616C657274282248656C6C6F20576F726C6422293B3C2F7363726970743E, '2020-03-29 09:37:05', null, '0');
INSERT INTO `reply` VALUES ('7', '2', '3', 0xE5BE88E5A5BD, '2020-03-29 09:38:36', null, '0');
INSERT INTO `reply` VALUES ('8', '3', '2', 0x75736572E59B9EE5A48D, '2020-03-29 14:50:29', null, '0');
INSERT INTO `reply` VALUES ('9', '1', '4', 0x3C7363726970743E616C6572742822546573742073637269707422293B3C2F7363726970743E, '2020-03-29 17:52:32', null, '0');
INSERT INTO `reply` VALUES ('10', '1', '4', 0xE4B8BAE4BA86E4B88DE4BFAEE694B9E794A8E688B7E8BE93E585A5E79A84E58E9FE58685E5AEB9EFBC8CE68980E4BBA5E79BB4E68EA5E59CA8E9A1B5E99DA2E4B8ADE698BEE7A4BAE58685E5AEB9E5898DE8BF9BE8A18CE5A484E79086E380820D0AE4BDBFE794A84A53544CE4B8ADE79A843C633A6F75743EE6A087E7ADBEE58FAFE4BBA5E8AEA9E59B9EE5A48DE58685E5AEB9E4B8ADE79A84E8849AE69CACE4B88DE689A7E8A18CE38082, '2020-03-29 18:03:31', null, '0');
INSERT INTO `reply` VALUES ('11', '1', '1', 0xE4BFAEE694B9E59B9EE5A48DE980BBE8BE91EFBC8CE9808DE981A5E6B58BE8AF95E59B9EE5A48DE38082, '2020-03-29 17:39:31', null, '0');
INSERT INTO `reply` VALUES ('12', '1', '1', 0xE9808DE981A5E6B58BE8AF95E59B9EE5A48D2E2E2E, '2020-03-29 17:49:55', null, '0');
INSERT INTO `reply` VALUES ('13', '1', '5', 0x74657374207265706C79, '2020-03-29 14:33:44', '2020-03-29 14:33:44', '0');
INSERT INTO `reply` VALUES ('14', '1', '5', 0x3636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636363636, '2020-03-29 11:48:06', '2020-03-29 11:48:06', '0');
INSERT INTO `reply` VALUES ('15', '1', '5', 0x6F766572666C6F7720E4B880E585B1E69C8935E4B8AAE5B19EE680A7E380820D0A0D0A31E380816F766572666C6F773A6175746FEFBC9BE58685E5AEB9E4BC9AE8A2ABE4BFAEE589AAEFBC8CE8B685E587BAE8AEBEE7BDAEE79A84E5AEBDE9AB98E5908EE4BC9AE587BAE78EB0E6BB9AE58AA8E69DA10D0A0D0A32E380816F766572666C6F773A7363726F6C6C3BE58685E5AEB9E4BC9AE8A2ABE4BFAEE589AAEFBC8CE4B88DE7AEA1E58685E5AEB9E698AFE590A6E8B685E587BAEFBC8CE983BDE4BC9AE587BAE78EB0E6BB9AE58AA8E69DA1E79A84E4BD8DE7BDAE0D0A0D0A33E380816F766572666C6F773A76697369626C653BE8BF99E4B8AAE698AFE9BB98E8AEA4E580BCEFBC8CE58685E5AEB9E4B88DE4BC9AE8A2ABE4BFAEE589AAEFBC8CE4BC9AE587BAE78EB0E59CA8E58583E7B4A0E6A186E5A496E99DA2E380820D0A0D0A34E380816F766572666C6F773A68696464656E3BE58685E5AEB9E8A2ABE4BFAEE589AAEFBC8CE5A49AE4BD99E79A84E58685E5AEB9E8A2ABE99A90E8978F0D0A0D0A35E380816F766572666C6F773A696E68657269743BE4BB8EE788B6E58583E7B4A0E982A3E9878CE7BBA7E689BF6F766572666C6F77E79A84E580BCE38082, '2020-03-29 10:30:15', '2020-03-29 10:30:15', '0');
INSERT INTO `reply` VALUES ('16', '1', '5', 0x6F766572666C6F7720E4B880E585B1E69C8935E4B8AAE5B19EE680A7E380820D0A0D0A31E380816F766572666C6F773A6175746FEFBC9BE58685E5AEB9E4BC9AE8A2ABE4BFAEE589AAEFBC8CE8B685E587BAE8AEBEE7BDAEE79A84E5AEBDE9AB98E5908EE4BC9AE587BAE78EB0E6BB9AE58AA8E69DA10D0A0D0A32E380816F766572666C6F773A7363726F6C6C3BE58685E5AEB9E4BC9AE8A2ABE4BFAEE589AAEFBC8CE4B88DE7AEA1E58685E5AEB9E698AFE590A6E8B685E587BAEFBC8CE983BDE4BC9AE587BAE78EB0E6BB9AE58AA8E69DA1E79A84E4BD8DE7BDAE0D0A0D0A33E380816F766572666C6F773A76697369626C653BE8BF99E4B8AAE698AFE9BB98E8AEA4E580BCEFBC8CE58685E5AEB9E4B88DE4BC9AE8A2ABE4BFAEE589AAEFBC8CE4BC9AE587BAE78EB0E59CA8E58583E7B4A0E6A186E5A496E99DA2E380820D0A0D0A34E380816F766572666C6F773A68696464656E3BE58685E5AEB9E8A2ABE4BFAEE589AAEFBC8CE5A49AE4BD99E79A84E58685E5AEB9E8A2ABE99A90E8978F0D0A0D0A35E380816F766572666C6F773A696E68657269743BE4BB8EE788B6E58583E7B4A0E982A3E9878CE7BBA7E689BF6F766572666C6F77E79A84E580BCE380820D0A0D0A6F766572666C6F7720E4B880E585B1E69C8935E4B8AAE5B19EE680A7E380820D0A0D0A31E380816F766572666C6F773A6175746FEFBC9BE58685E5AEB9E4BC9AE8A2ABE4BFAEE589AAEFBC8CE8B685E587BAE8AEBEE7BDAEE79A84E5AEBDE9AB98E5908EE4BC9AE587BAE78EB0E6BB9AE58AA8E69DA10D0A0D0A32E380816F766572666C6F773A7363726F6C6C3BE58685E5AEB9E4BC9AE8A2ABE4BFAEE589AAEFBC8CE4B88DE7AEA1E58685E5AEB9E698AFE590A6E8B685E587BAEFBC8CE983BDE4BC9AE587BAE78EB0E6BB9AE58AA8E69DA1E79A84E4BD8DE7BDAE0D0A0D0A33E380816F766572666C6F773A76697369626C653BE8BF99E4B8AAE698AFE9BB98E8AEA4E580BCEFBC8CE58685E5AEB9E4B88DE4BC9AE8A2ABE4BFAEE589AAEFBC8CE4BC9AE587BAE78EB0E59CA8E58583E7B4A0E6A186E5A496E99DA2E380820D0A0D0A34E380816F766572666C6F773A68696464656E3BE58685E5AEB9E8A2ABE4BFAEE589AAEFBC8CE5A49AE4BD99E79A84E58685E5AEB9E8A2ABE99A90E8978F0D0A0D0A35E380816F766572666C6F773A696E68657269743BE4BB8EE788B6E58583E7B4A0E982A3E9878CE7BBA7E689BF6F766572666C6F77E79A84E580BCE38082, '2020-03-29 10:30:29', '2020-03-29 10:30:29', '0');
INSERT INTO `reply` VALUES ('17', '1', '5', 0xE6B58BE8AF957465787461726561E79A84E68DA2E8A18C, '2020-03-29 10:44:56', '2020-03-29 10:44:56', '0');
INSERT INTO `reply` VALUES ('18', '1', '5', 0xE6B58BE8AF957465787461726561E79A84E68DA2E8A18C310D0A0D0AE6B58BE8AF957465787461726561E79A84E68DA2E8A18C320D0A0D0AE6B58BE8AF957465787461726561E79A84E68DA2E8A18C33, '2020-03-29 10:45:11', '2020-03-29 10:45:11', '0');
INSERT INTO `reply` VALUES ('19', '2', '3', 0xE681A2E5A48D, '2020-03-29 04:25:11', '2020-03-29 04:25:11', '0');
INSERT INTO `reply` VALUES ('20', '7', '3', 0xE699AEE9809AE794A8E688B7E6B58BE8AF95, '2020-03-29 04:25:37', '2020-03-29 04:25:37', '0');

-- ----------------------------
-- Table structure for tab
-- ----------------------------
DROP TABLE IF EXISTS `tab`;
CREATE TABLE `tab` (
  `tab_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `tab_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'default' COMMENT '分类名',
  `forum_id` int(11) NOT NULL DEFAULT '1' COMMENT '版块id',
  `tab_isDeleted` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除，0-否，1-逻辑删除',
  `tab_createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tab_modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分类';

-- ----------------------------
-- Records of tab
-- ----------------------------
INSERT INTO `tab` VALUES ('1', 'Technology', '1', '0', '2020-03-29 11:49:43', '2020-03-29 11:52:57');
INSERT INTO `tab` VALUES ('2', '其他', '1', '0', '2020-03-29 11:49:43', '2020-03-29 11:52:57');
INSERT INTO `tab` VALUES ('3', 'Life', '2', '0', '2020-03-29 11:49:43', '2020-03-29 11:52:57');

-- ----------------------------
-- Table structure for tip
-- ----------------------------
DROP TABLE IF EXISTS `tip`;
CREATE TABLE `tip` (
  `tip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '贴子id',
  `user_id` int(11) NOT NULL COMMENT '楼主id',
  `tab_id` int(11) NOT NULL COMMENT '分类id',
  `tip_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '标题',
  `tip_content` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '内容',
  `tip_publishTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `tip_modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `tip_click` int(11) NOT NULL DEFAULT '0' COMMENT '贴子点击量',
  `tip_isDeleted` int(2) NOT NULL DEFAULT '0' COMMENT '是否逻辑删除，0否，1是',
  `tip_isKnot` int(2) NOT NULL DEFAULT '0' COMMENT '是否结贴，0否，1结贴',
  `tip_replies` int(11) NOT NULL DEFAULT '0' COMMENT '贴子回复数',
  `tip_isTop` int(2) NOT NULL DEFAULT '0' COMMENT '是否置顶，0-否，1-是',
  `tip_topTime` datetime DEFAULT NULL COMMENT '置顶时间',
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='贴子';

-- ----------------------------
-- Records of tip
-- ----------------------------
INSERT INTO `tip` VALUES ('1', '1', '2', '学院论坛的第一个贴子', 0xE8BF99E698AFE7ACACE4B880E4B8AAE8B4B4E5AD90EFBC8CE6B58BE8AF95E58F91E8B4B4E58A9FE883BDE68890E58A9FEFBC81, '2020-03-29 16:35:17', '2020-03-29 17:49:55', '78', '0', '0', '4', '0', null);
INSERT INTO `tip` VALUES ('2', '2', '2', '官宣：本论坛正式开通', 0xE6ACA2E8BF8EE58F91E8A1A8E9AB98E8B4A8E9878FE8B4B4E5AD900D0A23212F62696E2F626173680D0A6563686F202248656C6C6F20576F726C64202122, '2020-03-29 13:53:49', '2020-03-29 10:35:27', '99', '0', '1', '3', '1', '2020-03-29 11:15:01');
INSERT INTO `tip` VALUES ('3', '1', '1', '发贴时的版块与分类选项联动', 0xE794A8616A6178E8AEBFE997AEE69C8940526573706F6E7365426F6479E6B3A8E8A7A3E79A84436F6E74726F6C6C6572EFBC8CE784B6E5908EE5AFB9E8BF94E59B9EE79A847461624C697374E8BF9BE8A18CE5A484E79086EFBC8CE588B7E696B0E58886E7B1BBE4B88BE68B89E6A08FE79A84E98089E9A1B9E38082, '2020-03-29 23:29:11', '2020-03-29 04:25:37', '67', '0', '0', '5', '1', '2020-03-29 17:44:20');
INSERT INTO `tip` VALUES ('4', '1', '1', '防止贴子内容中弹出用户输入的脚本', 0xE99C80E8A681E5AFB9E794A8E688B7E8BE93E585A5E79A84E58685E5AEB9E8BF9BE8A18CE5A484E79086E38082, '2020-03-29 17:52:15', '2020-03-29 18:03:31', '21', '0', '0', '2', '0', null);
INSERT INTO `tip` VALUES ('5', '3', '2', '贴子测试_191122', 0xE6B58BE8AF950D0AE69BB4E696B0E4BA8E323032302D30322D31382032323A3235, '2020-03-29 11:23:17', '2020-03-29 22:25:53', '79', '0', '0', '6', '1', '2020-03-29 06:23:05');
INSERT INTO `tip` VALUES ('6', '5', '2', '新人报到', 0xE59CA8E4B88BE6B58BE8AF95EFBC8CE696B0E5B9B4E5BFABE4B990EFBC81, '2020-03-28 09:53:46', '2020-03-29 09:53:46', '1', '0', '0', '0', '0', null);
INSERT INTO `tip` VALUES ('7', '5', '2', '测试正文为空', null, '2020-03-29 10:41:34', '2020-03-29 10:41:34', '1', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_nick` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `user_password` varchar(20) NOT NULL DEFAULT '123456' COMMENT '密码',
  `user_college` varchar(255) DEFAULT NULL,
  `user_major` varchar(255) DEFAULT NULL,
  `user_grade` varchar(255) DEFAULT NULL,
  `user_status` int(2) NOT NULL DEFAULT '0' COMMENT '状态，0正常，1禁用，2锁定',
  `user_type` int(2) NOT NULL DEFAULT '2' COMMENT '用户类型，0超级管理员，1，管理员，2普通用户',
  `user_regTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `user_lastLoginTime` datetime DEFAULT NULL COMMENT '最近登录时间',
  `user_modifyTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xy', '学院', '123456', null, null, null, '0', '0', null, '2020-03-29 03:05:35', '2020-03-29 11:52:39');
INSERT INTO `user` VALUES ('2', 'admin', 'admin', '123456', null, null, null, '0', '1', null, '2020-04-03 17:40:02', '2020-03-29 11:52:39');
INSERT INTO `user` VALUES ('3', 'user', 'user', '123456', null, null, null, '0', '2', null, '2020-03-29 03:05:09', '2020-03-29 11:52:39');
INSERT INTO `user` VALUES ('4', 'flyrise', 'FE', 'fe123456', null, null, null, '0', '1', null, '2020-03-29 11:50:49', '2020-03-29 11:52:39');
INSERT INTO `user` VALUES ('5', 'liyang', '测试', '123456', null, null, null, '0', '2', '2020-03-29 12:07:11', '2020-03-29 11:50:49', '2020-03-29 11:52:39');
INSERT INTO `user` VALUES ('6', 'zhangquan', '测试2', '123456', null, null, null, '0', '2', '2020-03-29 12:13:38', '2020-03-29 11:50:49', '2020-03-29 11:52:39');
INSERT INTO `user` VALUES ('7', 'zxc', '123456', '123456', null, null, null, '0', '2', '2020-03-29 12:23:41', '2020-03-29 04:25:26', '2020-03-29 12:23:41');
INSERT INTO `user` VALUES ('8', 'zxccc', '你测', '123456', null, null, null, '0', '2', '2020-03-29 12:50:53', null, '2020-03-29 12:50:53');
INSERT INTO `user` VALUES ('9', 'ccccc', ' 二叉树', '123456`', null, null, null, '0', '2', '2020-03-29 12:54:19', null, '2020-03-29 12:54:19');
INSERT INTO `user` VALUES ('10', 'vvvvvv', 'hdq', '123456', '测试', '1112', '333', '0', '2', '2020-03-29 12:57:20', null, '2020-03-29 12:57:20');
INSERT INTO `user` VALUES ('11', 'zxcvbnm', '测试', '123456', '测试学院', '测试专业', '测试年级', '0', '2', '2020-04-02 21:09:48', '2020-04-02 13:09:58', '2020-04-02 21:09:48');
