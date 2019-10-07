/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : dormitory

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-10-05 16:25:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '计算1611');
INSERT INTO `class` VALUES ('2', '古典2010');
INSERT INTO `class` VALUES ('3', '数学1611');
INSERT INTO `class` VALUES ('4', '财务1818');
INSERT INTO `class` VALUES ('5', '软件1711');
INSERT INTO `class` VALUES ('6', '计算1711');
INSERT INTO `class` VALUES ('7', '计算1814');
INSERT INTO `class` VALUES ('8', '养殖1613');
INSERT INTO `class` VALUES ('9', '音乐1513');
INSERT INTO `class` VALUES ('10', '网络1611');
INSERT INTO `class` VALUES ('11', '信管1811');
INSERT INTO `class` VALUES ('12', '日语1511');
INSERT INTO `class` VALUES ('13', '德语1611');
INSERT INTO `class` VALUES ('14', '英语1711');
INSERT INTO `class` VALUES ('15', '马克1811');
INSERT INTO `class` VALUES ('16', '软件1812');
INSERT INTO `class` VALUES ('17', '古典1812');
INSERT INTO `class` VALUES ('18', '流行1711');
INSERT INTO `class` VALUES ('19', '财务1811');
INSERT INTO `class` VALUES ('20', '会计1911');

-- ----------------------------
-- Table structure for drom
-- ----------------------------
DROP TABLE IF EXISTS `drom`;
CREATE TABLE `drom` (
  `drom_id` varchar(6) NOT NULL COMMENT '宿舍楼编号',
  `drom_sex` varchar(2) NOT NULL COMMENT '男女宿舍',
  `drom_administ` varchar(10) NOT NULL COMMENT '宿舍楼管理员',
  `administ_id` varchar(10) DEFAULT NULL COMMENT '管理员id',
  PRIMARY KEY (`drom_id`),
  KEY `administ_id` (`administ_id`),
  CONSTRAINT `drom_ibfk_1` FOREIGN KEY (`administ_id`) REFERENCES `manager` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drom
-- ----------------------------
INSERT INTO `drom` VALUES ('一号楼', '女', '周阿姨', '1006');
INSERT INTO `drom` VALUES ('三号楼', '男', '李阿姨', '1004');
INSERT INTO `drom` VALUES ('二号楼', '男', '王阿姨', '1005');
INSERT INTO `drom` VALUES ('五号楼', '男', '张阿姨', '1003');
INSERT INTO `drom` VALUES ('四号楼', '男', '刘阿姨', '1002');

-- ----------------------------
-- Table structure for exchange
-- ----------------------------
DROP TABLE IF EXISTS `exchange`;
CREATE TABLE `exchange` (
  `exc_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '宿舍调换请求编号',
  `stu_id` varchar(20) DEFAULT NULL COMMENT '学生编号',
  `reason` varchar(255) DEFAULT NULL COMMENT '调换理由',
  `target_drom` varchar(6) DEFAULT NULL COMMENT '目标宿舍楼',
  `target_room` varchar(6) DEFAULT NULL COMMENT '目标宿舍',
  `state` tinyint(1) NOT NULL COMMENT '审批状态',
  `handle_id` varchar(10) DEFAULT NULL COMMENT '审批人编号',
  PRIMARY KEY (`exc_id`),
  KEY `stu_id` (`stu_id`),
  KEY `handle_id` (`handle_id`),
  CONSTRAINT `exchange_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `exchange_ibfk_2` FOREIGN KEY (`handle_id`) REFERENCES `manager` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exchange
-- ----------------------------
INSERT INTO `exchange` VALUES ('1', '201601', '无1', null, null, '0', '1006');
INSERT INTO `exchange` VALUES ('2', '201602', '无2', null, null, '0', '1006');
INSERT INTO `exchange` VALUES ('3', '201603', '无3', null, null, '1', '1002');
INSERT INTO `exchange` VALUES ('4', '201604', '无4', null, null, '1', '1001');
INSERT INTO `exchange` VALUES ('5', '201605', '无5', null, null, '1', '1002');
INSERT INTO `exchange` VALUES ('6', '201606', '无6', null, null, '1', '1003');
INSERT INTO `exchange` VALUES ('7', '201607', '无7', null, null, '0', '1001');
INSERT INTO `exchange` VALUES ('8', '201608', '无8', null, null, '1', '1005');
INSERT INTO `exchange` VALUES ('9', '201609', '无9', null, null, '0', '1004');
INSERT INTO `exchange` VALUES ('10', '201610', '无10', null, null, '1', '1005');
INSERT INTO `exchange` VALUES ('11', '201611', '无11', null, null, '0', '1006');
INSERT INTO `exchange` VALUES ('12', '201612', '无12', null, null, '1', '1005');
INSERT INTO `exchange` VALUES ('13', '201613', '无13', null, null, '1', '1002');
INSERT INTO `exchange` VALUES ('14', '201614', '无14', null, null, '1', '1004');
INSERT INTO `exchange` VALUES ('15', '201615', '无15', null, null, '0', '1003');
INSERT INTO `exchange` VALUES ('16', '201616', '无16', null, null, '1', '1005');
INSERT INTO `exchange` VALUES ('17', '201617', '无17', null, null, '0', '1004');
INSERT INTO `exchange` VALUES ('18', '201618', '无18', null, null, '1', '1003');
INSERT INTO `exchange` VALUES ('19', '201619', '无19', null, null, '1', '1004');
INSERT INTO `exchange` VALUES ('20', '201620', '无20', null, null, '0', '1003');

-- ----------------------------
-- Table structure for leave_info
-- ----------------------------
DROP TABLE IF EXISTS `leave_info`;
CREATE TABLE `leave_info` (
  `leave_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '请假信息编号',
  `stu_id` varchar(20) DEFAULT NULL COMMENT '学生学号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `leave_date` datetime NOT NULL COMMENT '离校时间',
  `back_date` datetime NOT NULL COMMENT '返校时间',
  `state` tinyint(1) NOT NULL COMMENT '审批状态',
  PRIMARY KEY (`leave_id`),
  KEY `stu_id` (`stu_id`),
  CONSTRAINT `leave_info_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_info
-- ----------------------------
INSERT INTO `leave_info` VALUES ('1', '201601', '2019-09-28 15:39:43', '2019-09-27 15:39:28', '2019-09-29 15:39:32', '1');
INSERT INTO `leave_info` VALUES ('2', '201602', '2019-09-28 15:39:55', '2019-09-11 15:39:49', '2019-09-29 15:39:52', '1');
INSERT INTO `leave_info` VALUES ('3', '201603', '2019-09-28 15:40:26', '2019-09-16 15:40:17', '2019-09-20 15:40:21', '1');
INSERT INTO `leave_info` VALUES ('4', '201604', '2019-09-28 15:43:23', '2019-10-31 15:43:13', '2019-09-29 15:43:19', '1');
INSERT INTO `leave_info` VALUES ('5', '201605', '2019-09-28 15:43:40', '2019-09-26 15:43:32', '2019-09-15 15:43:36', '1');
INSERT INTO `leave_info` VALUES ('6', '201606', '2019-09-28 15:43:56', '2019-09-23 15:43:47', '2019-10-12 15:43:50', '1');
INSERT INTO `leave_info` VALUES ('7', '201607', '2019-09-28 15:44:26', '2019-09-23 15:44:19', '2019-09-26 15:44:22', '1');
INSERT INTO `leave_info` VALUES ('8', '201608', '2019-09-28 15:45:47', '2019-09-29 15:45:38', '2019-10-04 15:45:41', '1');
INSERT INTO `leave_info` VALUES ('9', '201609', '2019-09-28 15:47:46', '2020-01-30 15:47:34', '2019-11-22 15:47:41', '1');
INSERT INTO `leave_info` VALUES ('10', '201610', '2019-09-28 15:48:01', '2019-11-15 15:47:54', '2019-11-30 15:47:57', '1');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `manager_id` varchar(10) NOT NULL COMMENT '工作人员编号',
  `manager_name` varchar(10) NOT NULL COMMENT '姓名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `phone` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `role_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1001', '周导', '1234', '123456', '2');
INSERT INTO `manager` VALUES ('1002', '刘阿姨', '1234', '123456', '3');
INSERT INTO `manager` VALUES ('1003', '张阿姨', '123456', '123456', '3');
INSERT INTO `manager` VALUES ('1004', '李阿姨', '123456', '123456', '3');
INSERT INTO `manager` VALUES ('1005', '王阿姨', '1234', '123456', '3');
INSERT INTO `manager` VALUES ('1006', '周阿姨', '1234', '123456', '3');
INSERT INTO `manager` VALUES ('1007', '刘导', '123456', '123456', '2');
INSERT INTO `manager` VALUES ('admin', 'admin', 'admin', '123456', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `message_title` varchar(20) NOT NULL COMMENT '标题',
  `detail` varchar(255) DEFAULT NULL COMMENT '详细内容',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_id` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'hello', 'wolrd', '2019-09-16 16:07:19');
INSERT INTO `message` VALUES ('2', 'fine', 'thanks', '2019-09-28 15:49:20');
INSERT INTO `message` VALUES ('3', 'ni', 'hao', '2019-09-28 15:49:28');
INSERT INTO `message` VALUES ('4', 'wo', 'wowowo', '2019-09-28 15:49:34');
INSERT INTO `message` VALUES ('5', 'qqq', '111', '2019-09-28 15:49:39');
INSERT INTO `message` VALUES ('6', 'mother', 'fuck', '2019-09-28 15:50:07');
INSERT INTO `message` VALUES ('7', 'hi', 'hello', '2019-09-28 15:50:28');
INSERT INTO `message` VALUES ('8', 'family', 'good', '2019-09-28 15:50:42');
INSERT INTO `message` VALUES ('9', 'ambition', 'xiongxin', '2019-09-28 15:50:54');
INSERT INTO `message` VALUES ('10', 'haha', 'lolo', '2019-09-28 15:51:04');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `pname` varchar(50) NOT NULL COMMENT '权限名称',
  `href` varchar(50) NOT NULL COMMENT '资源路径',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '学籍信息', 'student:index');
INSERT INTO `permission` VALUES ('2', '宿舍信息', 'dorm:index');
INSERT INTO `permission` VALUES ('3', '管理人员', 'manager:index');
INSERT INTO `permission` VALUES ('4', '报修处理', 'repaire:index');
INSERT INTO `permission` VALUES ('5', '考勤管理', 'score:index');
INSERT INTO `permission` VALUES ('6', '请假审批', 'leaveInfo:index');
INSERT INTO `permission` VALUES ('7', '宿舍调整', 'exchange:index');
INSERT INTO `permission` VALUES ('8', '公告', 'message:index');

-- ----------------------------
-- Table structure for repaires
-- ----------------------------
DROP TABLE IF EXISTS `repaires`;
CREATE TABLE `repaires` (
  `repairs_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '报修编号',
  `drom_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宿舍楼编号',
  `room_id` varchar(6) NOT NULL COMMENT '宿舍编号',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '损坏秒速',
  `gettime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '保修提交时间',
  `fixtime` datetime DEFAULT NULL COMMENT '解决时间',
  `isfixed` tinyint(1) NOT NULL COMMENT '是否已维修',
  PRIMARY KEY (`repairs_id`),
  KEY `dorm_id` (`drom_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `repaires_ibfk_1` FOREIGN KEY (`drom_id`) REFERENCES `drom` (`drom_id`),
  CONSTRAINT `repaires_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repaires
-- ----------------------------
INSERT INTO `repaires` VALUES ('3', '二号楼', '103', '凳子损坏', '2019-09-28 13:56:20', '2019-09-29 13:56:07', '1');
INSERT INTO `repaires` VALUES ('4', '五号楼', '301', '没有热水', '2019-09-28 16:09:32', '2019-09-28 09:02:17', '1');
INSERT INTO `repaires` VALUES ('5', '三号楼', '204', '桌子坏了', '2019-09-28 16:09:47', null, '0');
INSERT INTO `repaires` VALUES ('6', '四号楼', '102', '地板塌了', '2019-09-28 16:10:11', null, '0');
INSERT INTO `repaires` VALUES ('7', '二号楼', '204', '床板坏了', '2019-09-28 16:12:32', '2019-10-03 09:19:21', '1');
INSERT INTO `repaires` VALUES ('8', '二号楼', '102', '没水', '2019-09-28 16:12:59', null, '0');
INSERT INTO `repaires` VALUES ('9', '三号楼', '301', '空调坏了', '2019-09-28 16:13:29', null, '0');
INSERT INTO `repaires` VALUES ('10', '三号楼', '102', '空调坏了', '2019-09-28 16:13:58', null, '0');
INSERT INTO `repaires` VALUES ('11', '一号楼', '103', '饮水机', '2019-09-28 16:14:39', null, '0');
INSERT INTO `repaires` VALUES ('12', '三号楼', '103', '水龙头没水', '2019-09-28 16:15:42', null, '0');
INSERT INTO `repaires` VALUES ('13', '四号楼', '204', '水龙头没水', '2019-09-28 16:15:53', '2019-09-29 16:53:10', '1');
INSERT INTO `repaires` VALUES ('14', '二号楼', '204', '水龙头没水', '2019-09-28 16:16:03', null, '0');
INSERT INTO `repaires` VALUES ('15', '四号楼', '103', '水龙头没水', '2019-09-28 16:16:13', null, '0');
INSERT INTO `repaires` VALUES ('16', '五号楼', '301', '水龙头没水', '2019-09-28 16:16:23', '2019-09-28 09:03:26', '1');
INSERT INTO `repaires` VALUES ('17', '五号楼', '301', '水龙头没水', '2019-09-28 16:29:59', null, '0');
INSERT INTO `repaires` VALUES ('18', '三号楼', '103', '水龙头没水', '2019-09-28 16:30:12', null, '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '超级管理员，拥有所有权限');
INSERT INTO `role` VALUES ('2', '辅导员', '对学生信息的增删改查，分配宿舍，请假审批，发布通告');
INSERT INTO `role` VALUES ('3', '舍管阿姨', '保修处理，宿舍信息查看，晚归登记，离校登记,考勤管理');

-- ----------------------------
-- Table structure for role_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_rel`;
CREATE TABLE `role_permission_rel` (
  `pid` bigint(20) NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`pid`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_permission_rel_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `permission` (`pid`),
  CONSTRAINT `role_permission_rel_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission_rel
-- ----------------------------
INSERT INTO `role_permission_rel` VALUES ('1', '1');
INSERT INTO `role_permission_rel` VALUES ('2', '1');
INSERT INTO `role_permission_rel` VALUES ('3', '1');
INSERT INTO `role_permission_rel` VALUES ('4', '1');
INSERT INTO `role_permission_rel` VALUES ('5', '1');
INSERT INTO `role_permission_rel` VALUES ('6', '1');
INSERT INTO `role_permission_rel` VALUES ('7', '1');
INSERT INTO `role_permission_rel` VALUES ('8', '1');
INSERT INTO `role_permission_rel` VALUES ('1', '2');
INSERT INTO `role_permission_rel` VALUES ('2', '2');
INSERT INTO `role_permission_rel` VALUES ('6', '2');
INSERT INTO `role_permission_rel` VALUES ('7', '2');
INSERT INTO `role_permission_rel` VALUES ('8', '2');
INSERT INTO `role_permission_rel` VALUES ('2', '3');
INSERT INTO `role_permission_rel` VALUES ('4', '3');
INSERT INTO `role_permission_rel` VALUES ('5', '3');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` varchar(6) NOT NULL COMMENT '宿舍编号',
  `drom_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '宿舍楼编号',
  `room_sum` int(6) NOT NULL COMMENT '宿舍可住人数',
  `room_use` int(6) DEFAULT NULL COMMENT '已住人数',
  PRIMARY KEY (`room_id`),
  KEY `drom_id` (`drom_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`drom_id`) REFERENCES `drom` (`drom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('101', '五号楼', '6', '1');
INSERT INTO `room` VALUES ('102', '四号楼', '6', '1');
INSERT INTO `room` VALUES ('103', '三号楼', '6', '1');
INSERT INTO `room` VALUES ('204', '二号楼', '6', '1');
INSERT INTO `room` VALUES ('301', '一号楼', '6', '1');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分数记录编号',
  `score_point` int(2) NOT NULL COMMENT '得分',
  `record_time` datetime NOT NULL COMMENT '记录时间',
  `drom_id` varchar(6) NOT NULL COMMENT '宿舍楼编号',
  `room_id` varchar(6) NOT NULL COMMENT '宿舍号',
  PRIMARY KEY (`score_id`),
  KEY `drom_id` (`drom_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`drom_id`) REFERENCES `drom` (`drom_id`),
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '1', '2019-09-28 16:30:34', '一号楼', '102');
INSERT INTO `score` VALUES ('2', '2', '2019-09-19 16:30:44', '一号楼', '102');
INSERT INTO `score` VALUES ('3', '5', '2019-09-18 16:31:03', '一号楼', '103');
INSERT INTO `score` VALUES ('4', '4', '2019-09-12 16:31:08', '一号楼', '204');
INSERT INTO `score` VALUES ('5', '5', '2019-09-17 16:31:17', '一号楼', '301');
INSERT INTO `score` VALUES ('6', '3', '2019-09-18 16:31:28', '三号楼', '101');
INSERT INTO `score` VALUES ('7', '3', '2019-09-29 16:31:38', '三号楼', '102');
INSERT INTO `score` VALUES ('8', '3', '2019-09-18 16:31:46', '五号楼', '204');
INSERT INTO `score` VALUES ('9', '3', '2019-08-08 16:31:58', '三号楼', '103');
INSERT INTO `score` VALUES ('10', '5', '2019-09-13 16:32:10', '三号楼', '204');
INSERT INTO `score` VALUES ('11', '2', '2019-09-22 16:32:23', '三号楼', '301');
INSERT INTO `score` VALUES ('12', '3', '2019-09-28 16:32:32', '四号楼', '204');
INSERT INTO `score` VALUES ('13', '4', '2019-10-03 16:32:41', '五号楼', '101');
INSERT INTO `score` VALUES ('14', '3', '2019-09-18 16:32:51', '五号楼', '204');
INSERT INTO `score` VALUES ('15', '3', '2019-09-11 16:33:05', '五号楼', '301');
INSERT INTO `score` VALUES ('16', '3', '2019-09-12 16:33:20', '二号楼', '103');
INSERT INTO `score` VALUES ('17', '4', '2019-09-17 16:33:32', '三号楼', '301');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` varchar(20) NOT NULL COMMENT '学号',
  `stu_name` varchar(10) NOT NULL COMMENT '学生姓名',
  `password` varchar(50) NOT NULL,
  `stu_sex` varchar(2) DEFAULT '男',
  `stu_from` varchar(20) NOT NULL COMMENT '生源地',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `stu_date` datetime NOT NULL COMMENT '出生日期',
  `stu_college` varchar(20) NOT NULL COMMENT '所在学院',
  `stu_major` varchar(20) NOT NULL COMMENT '所学专业',
  `class_id` int(20) DEFAULT NULL COMMENT '班级号',
  `drom_id` varchar(6) DEFAULT NULL COMMENT '宿舍楼号',
  `room_id` varchar(6) DEFAULT NULL COMMENT '宿舍号',
  PRIMARY KEY (`stu_id`),
  KEY `drom_id` (`drom_id`),
  KEY `room_id` (`room_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`drom_id`) REFERENCES `drom` (`drom_id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201601', '王祖蓝', '1234', '男', '中国香港', '2212111', '2019-08-01 16:00:00', '师范学院', '数学', '3', '三号楼', '103');
INSERT INTO `student` VALUES ('201602', '陈赫', '1234', '男', '中国福建', '121212', '2019-09-09 10:20:21', '师范学院', '数学', '3', '三号楼', '103');
INSERT INTO `student` VALUES ('201603', '刘德华', '1234', '男', '中国香港', '123456', '2019-09-13 18:20:30', '师范学院', '数学', '3', '三号楼', '103');
INSERT INTO `student` VALUES ('201604', '吴彦祖', '1234', '男', '中国香港', '123456', '2019-09-09 10:20:21', '师范学院', '数学', '3', '三号楼', '103');
INSERT INTO `student` VALUES ('201605', '庾澄庆', '1234', '男', '中国台湾', '212121', '2019-01-02 17:20:30', '音乐学院', '流行乐', '2', '五号楼', '101');
INSERT INTO `student` VALUES ('201606', '周杰伦', '1234', '男', '中国台湾', '123456', '2019-09-12 17:12:25', '音乐学院', '流行乐', '2', '五号楼', '101');
INSERT INTO `student` VALUES ('201607', '鹿晗', '1234', '男', '英国', '121212', '2019-04-03 19:21:21', '音乐学院', '流行乐', '2', '五号楼', '101');
INSERT INTO `student` VALUES ('201608', '蔡徐坤', '1234', '男', '美国', '123456', '2019-03-20 19:20:21', '音乐学院', '流行乐', '2', '五号楼', '101');
INSERT INTO `student` VALUES ('201609', '韩红', '1234', '女', '中国浙江', '212121', '2019-09-04 19:20:30', '财经学院', '财务管理', '4', '一号楼', '301');
INSERT INTO `student` VALUES ('201610', '杨幂', '1234', '女', '中国新疆', '123456', '2019-09-21 15:20:20', '财经学院', '财务管理', '4', '一号楼', '301');
INSERT INTO `student` VALUES ('201611', '范冰冰', '1234', '女', '中国江苏', '123456', '2019-09-21 14:20:30', '财经学院', '财务管理', '4', '一号楼', '301');
INSERT INTO `student` VALUES ('201612', '王祖贤', '1234', '女', '中国香港', '1234', '2019-09-21 13:23:30', '财经学院', '财务管理', '4', '一号楼', '301');
INSERT INTO `student` VALUES ('201613', '周华健', '1234', '男', '中国台湾', '123456', '2019-09-21 07:20:30', '计算机学院', '软件工程', '5', '四号楼', '102');
INSERT INTO `student` VALUES ('201614', '周星驰', '1234', '男', '中国山东', '123456', '2019-09-21 18:20:30', '计算机学院', '软件工程', '5', '四号楼', '102');
INSERT INTO `student` VALUES ('201615', '胡歌', '1234', '男', '中国天津', '123456', '2019-09-02 18:30:20', '计算机学院', '软件工程', '5', '四号楼', '102');
INSERT INTO `student` VALUES ('201616', '郑伊健', '1234', '男', '中国广东', '123456', '2019-09-23 16:29:30', '计算机学院', '软件工程', '5', '四号楼', '102');
INSERT INTO `student` VALUES ('201617', '张卫健', '1234', '男', '中国福建', '121212', '2019-09-09 12:20:30', '计算机学院', '计算机科学', '1', '二号楼', '204');
INSERT INTO `student` VALUES ('201618', '古天乐', '1234', '男', '中国香港', '123456', '2019-09-10 17:20:30', '计算机学院', '计算机科学', '1', '二号楼', '204');
INSERT INTO `student` VALUES ('201619', '李晨', '1234', '男', '中国北京', '123456', '2019-09-12 10:20:20', '计算机学院', '计算机科学', '1', '二号楼', '204');
INSERT INTO `student` VALUES ('201620', '陈小春', '1234', '男', '中国香港', '123456', '2019-09-20 19:11:11', '计算机学院', '计算机科学', '1', '二号楼', '204');
