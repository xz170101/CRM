/*
 Navicat Premium Data Transfer

 Source Server         : CRM
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 16/05/2019 09:24:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for askers
-- ----------------------------
DROP TABLE IF EXISTS `askers`;
CREATE TABLE `askers`  (
  `askers_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `askers_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核名称（发文者姓名）',
  `checkState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到状态',
  `checkInTime` date NULL DEFAULT NULL COMMENT '规定签到时间',
  `changeState` date NULL DEFAULT NULL COMMENT '规定签退时间',
  `weight` int(11) NULL DEFAULT NULL COMMENT '分量权重',
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `bakContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对咨询师的介绍',
  `aexit1Int` int(11) NULL DEFAULT NULL COMMENT '预留字段',
  `aexit2String` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`askers_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of askers
-- ----------------------------
INSERT INTO `askers` VALUES (1, '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for modules
-- ----------------------------
DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules`  (
  `modules_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `modules_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `parentId` int(11) NULL DEFAULT NULL COMMENT '父模块编号',
  `modules_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块路径',
  `modules_weight` int(11) NULL DEFAULT NULL COMMENT '模块权重',
  `mexit1int` int(255) NULL DEFAULT NULL COMMENT '预留字段',
  `mexit2String` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`modules_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modules
-- ----------------------------
INSERT INTO `modules` VALUES (1, '系统管理', 0, '', 10, NULL, NULL);
INSERT INTO `modules` VALUES (2, '角色管理', 1, 'rolejsp', 8, NULL, NULL);
INSERT INTO `modules` VALUES (3, '模块管理', 1, 'modulejsp', 8, NULL, NULL);
INSERT INTO `modules` VALUES (4, '用户管理', 1, 'userjsp', 8, NULL, NULL);
INSERT INTO `modules` VALUES (5, '网络跟踪', 1, 'followsjsp', 8, NULL, NULL);
INSERT INTO `modules` VALUES (6, '网络学生', 1, 'studentjsp', 8, NULL, NULL);
INSERT INTO `modules` VALUES (7, '员工签到', 1, 'askersjsp', 7, NULL, NULL);

-- ----------------------------
-- Table structure for netfollows
-- ----------------------------
DROP TABLE IF EXISTS `netfollows`;
CREATE TABLE `netfollows`  (
  `follows_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `stu_Id` int(11) NULL DEFAULT NULL COMMENT '客户id（外键）',
  `studentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `followTime` date NULL DEFAULT NULL COMMENT '追踪时间',
  `nextFollowTime` date NULL DEFAULT NULL COMMENT '下次追踪时间',
  `user_Id` int(11) NULL DEFAULT NULL COMMENT '用户id（外键）',
  `followType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '追踪类型',
  `conTent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `createTime` date NULL DEFAULT NULL COMMENT '创建时间',
  `followState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '追踪状态',
  `nexit1int` int(11) NULL DEFAULT NULL COMMENT '预留字段',
  `nexit2String` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`follows_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of netfollows
-- ----------------------------
INSERT INTO `netfollows` VALUES (1, 1, '小红', '2019-05-13', '2019-06-01', 1, '网上', NULL, '2019-05-13', '', NULL, NULL);
INSERT INTO `netfollows` VALUES (2, 1, NULL, '2019-05-13', '2019-05-20', NULL, '上门', '有意向缴费', NULL, '好', NULL, NULL);
INSERT INTO `netfollows` VALUES (3, 2, NULL, '2019-05-13', '2019-05-20', NULL, '上门', '有意向缴费', NULL, '继续跟进', NULL, NULL);
INSERT INTO `netfollows` VALUES (4, 2, NULL, '2019-05-12', '2019-05-20', NULL, '上门', '意向缴费', NULL, '好', NULL, NULL);

-- ----------------------------
-- Table structure for rolemodules
-- ----------------------------
DROP TABLE IF EXISTS `rolemodules`;
CREATE TABLE `rolemodules`  (
  `rm_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `roles_Id` int(11) NULL DEFAULT NULL COMMENT '角色编号',
  `modules_Id` int(11) NULL DEFAULT NULL COMMENT '功能模块编号',
  `rmexit1int` int(255) NULL DEFAULT NULL COMMENT '预留字段',
  `rmexit2String` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`rm_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolemodules
-- ----------------------------
INSERT INTO `rolemodules` VALUES (1, 1, 0, NULL, NULL);
INSERT INTO `rolemodules` VALUES (2, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `roles_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `roles_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `roles_Int` int(11) NULL DEFAULT NULL COMMENT '预留字段',
  `roles_String` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`roles_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '管理员', NULL, NULL);
INSERT INTO `roles` VALUES (2, '项目经理', NULL, NULL);
INSERT INTO `roles` VALUES (3, '网络咨询师', NULL, NULL);
INSERT INTO `roles` VALUES (4, '咨询师', NULL, NULL);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `stu_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `user_Id` int(11) NULL DEFAULT NULL COMMENT '用户编号（外键',
  `stu_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `stu_Age` int(11) NULL DEFAULT NULL COMMENT '客户年龄',
  `stu_Sex` int(11) NULL DEFAULT NULL COMMENT '客户性别',
  `stu_Phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `stu_Status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户状态',
  `stu_PerState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人状态',
  `stu_MsgSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户信息资源',
  `stu_SourceUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户信息资源来源渠道',
  `stu_SourceKeyWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源关键字',
  `stu_Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户所在区域',
  `stu_NetPusherld` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户来源网站',
  `askers_Id` int(11) NULL DEFAULT NULL COMMENT '发文者编号（asker表外键）',
  `stu_qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户qq',
  `stu_WeiXin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户微信',
  `stu_Content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户内容',
  `stu_CreateTime` date NULL DEFAULT NULL COMMENT '创建时间',
  `stu_LearnForward` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户课程方向',
  `stu_isValid` int(255) NULL DEFAULT NULL COMMENT '客户是否有效',
  `stu_Record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户记录',
  `stu_isReturnVist` int(255) NULL DEFAULT NULL COMMENT '是否要回访',
  `stu_isHome` int(255) NULL DEFAULT NULL COMMENT '是否上门',
  `stu_firstVisitTime` date NULL DEFAULT NULL COMMENT '回访时间',
  `stu_HomeTime` date NULL DEFAULT NULL COMMENT '上门时间',
  `stu_LostValid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无效原因',
  `stu_isPay` int(255) NULL DEFAULT NULL COMMENT '是否缴费',
  `stu_PayTime` date NULL DEFAULT NULL COMMENT '缴费时间',
  `stu_Money` double(255, 0) NULL DEFAULT NULL COMMENT '缴费金额',
  `stu_isReturnMoney` int(255) NULL DEFAULT NULL COMMENT '是否退费',
  `stu_isInClass` int(255) NULL DEFAULT NULL COMMENT '是否进班',
  `stu_inClassTime` date NULL DEFAULT NULL COMMENT '进班时间',
  `stu_inClassContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进班备注',
  `stu_AskerContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '咨询内容',
  `stu_isDel` int(255) NULL DEFAULT NULL COMMENT '是否删除',
  `stu_FromPart` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源部门',
  `stu_stuConcern` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学员关注',
  `stu_isBaoBei` int(255) NULL DEFAULT NULL COMMENT '是否报备',
  `stu_ZiXunName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '咨询师备注',
  `stu_CreateUser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `stu_ReturnMoneyReason` date NULL DEFAULT NULL COMMENT '退费时间',
  `stu_preMoney` double(255, 0) NULL DEFAULT NULL COMMENT '定金金额',
  `stu_preMoneyTime` date NULL DEFAULT NULL COMMENT '交定金时间',
  `sexitInte` int(11) NULL DEFAULT NULL COMMENT '预留字段',
  `sexitString` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`stu_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES (1, 1, '小红', 18, 0, '15560205857', NULL, NULL, NULL, '网络', '', '河南新乡', 'www.baidu.com', NULL, '12345678', '12345678', '', '2019-05-11', 'java', 1, '问过一次', 1, 0, '2019-05-12', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'java方向的学费多少', 0, NULL, NULL, 1, '一一', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `students` VALUES (2, NULL, '袁紫一', 15, 0, '15225267253', '研究生', '好', NULL, '206宿舍', '206', NULL, NULL, NULL, '123355', '156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '一一', NULL, NULL, NULL, NULL, 0, '一一', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `students` VALUES (3, NULL, '1', 1, 0, '1', '1', '1', NULL, '1', '1', NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `loginName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `passWord` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `isLockout` int(255) NULL DEFAULT NULL COMMENT '是否锁定',
  `loginTime` date NULL DEFAULT NULL COMMENT '登录时间',
  `createTime` date NULL DEFAULT NULL COMMENT '账户创立时间',
  `psdWrongTime` int(11) NULL DEFAULT NULL COMMENT '密码错误次数',
  `lockTime` date NULL DEFAULT NULL COMMENT '被锁定时间',
  `protectEMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密保邮箱',
  `protectMTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密保手机号',
  `uexit1int` int(11) NULL DEFAULT NULL COMMENT '预留字段1',
  `uexit2String` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段2',
  PRIMARY KEY (`user_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', '123456', 0, NULL, '2019-05-11', 0, NULL, '15225267253@163.com', '15225267253', NULL, NULL);
INSERT INTO `user` VALUES (2, '白丹寒', '123456', 0, NULL, '2019-05-11', 0, NULL, '15225267253@163.com', '15225267253', NULL, NULL);
INSERT INTO `user` VALUES (3, '李小康', '123456', 0, NULL, '2019-05-11', 0, NULL, '15225267253@163.com', '15225267253', NULL, NULL);
INSERT INTO `user` VALUES (4, '朱博杰', '123456', 0, NULL, '2019-05-11', 0, NULL, '15225267253@163.com', '15225267253', NULL, NULL);
INSERT INTO `user` VALUES (5, '李明源', '123456', 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for userchecks
-- ----------------------------
DROP TABLE IF EXISTS `userchecks`;
CREATE TABLE `userchecks`  (
  `checks_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `user_Id` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `checkInTime` date NULL DEFAULT NULL COMMENT '签到时间',
  `checkState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到状态',
  `isCancel` int(255) NULL DEFAULT NULL COMMENT '是否签退',
  `checkOutTime` date NULL DEFAULT NULL COMMENT '签退时间',
  `ucexit1int` int(11) NULL DEFAULT NULL COMMENT '预留字段',
  `ucexit2String` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`checks_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `ur_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `roleId` int(11) NULL DEFAULT NULL COMMENT '角色编号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `urexitInt` int(11) NULL DEFAULT NULL COMMENT '留字段预',
  `urexit2String` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`ur_Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `userrole` VALUES (2, 2, 2, NULL, NULL);
INSERT INTO `userrole` VALUES (3, 3, 4, NULL, NULL);
INSERT INTO `userrole` VALUES (4, 4, 3, NULL, NULL);
INSERT INTO `userrole` VALUES (5, 4, 5, NULL, NULL);

-- ----------------------------
-- Event structure for temp_event
-- ----------------------------
DROP EVENT IF EXISTS `temp_event`;
delimiter ;;
CREATE EVENT `temp_event`
ON SCHEDULE
EVERY '1' DAY STARTS '2019-05-12 19:51:00'
ON COMPLETION PRESERVE
DO update askers set checkState=0 where checkState=1
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
