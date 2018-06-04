/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : recommendsys

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-24 23:36:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add log entry', '5', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('14', 'Can change log entry', '5', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete log entry', '5', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$100000$jN5zqE3VM9GD$aQE/65YDfaqNDcNT13+ANg5TWoQUVQtP1oW2X6GYVTI=', '2018-05-24 04:43:58.009711', '1', 'admin', '', '', 'caijianfang@foxmail.com', '1', '1', '2018-05-23 10:05:09.723373');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-05-23 17:01:10.287548', '20', 'Sys_Para object (20)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2018-05-23 17:29:02.863214', '20', 'Sys_Para object (20)', '2', '[{\"changed\": {\"fields\": [\"fparatype\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-05-23 17:29:07.199462', '20', 'Sys_Para object (20)', '2', '[]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-05-23 17:29:37.200178', '1', 'Sys_Para object (1)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-05-23 17:29:56.929306', '2', 'Sys_Para object (2)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-05-23 17:30:25.543943', '3', 'Sys_Para object (3)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-05-23 17:30:46.926166', '4', 'Sys_Para object (4)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-05-23 17:31:00.424938', '5', 'Sys_Para object (5)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-05-23 17:31:16.268844', '6', 'Sys_Para object (6)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-05-23 17:31:36.775017', '7', 'Sys_Para object (7)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2018-05-23 17:31:57.978230', '8', 'Sys_Para object (8)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2018-05-23 17:32:23.024663', '9', 'Sys_Para object (9)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2018-05-23 17:32:38.739561', '10', 'Sys_Para object (10)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2018-05-23 17:32:53.279393', '11', 'Sys_Para object (11)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2018-05-23 17:33:08.960290', '12', 'Sys_Para object (12)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2018-05-23 17:33:32.860657', '13', 'Sys_Para object (13)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2018-05-23 17:33:53.251823', '14', 'Sys_Para object (14)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2018-05-23 17:34:11.423863', '15', 'Sys_Para object (15)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2018-05-23 17:34:33.323115', '16', 'Sys_Para object (16)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2018-05-23 17:34:58.646564', '17', 'Sys_Para object (17)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2018-05-23 17:35:17.154622', '18', 'Sys_Para object (18)', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2018-05-23 17:36:04.893353', '19', 'Sys_Para object (19)', '2', '[{\"changed\": {\"fields\": [\"fid\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2018-05-23 17:47:05.939162', '20', '20  ，  心跳时间  ，  2018-05-06 18:12:47', '3', '', '7', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('5', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'RecommendSysApp', 'sys_para');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-05-23 10:04:04.524643');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-05-23 10:04:05.568703');
INSERT INTO `django_migrations` VALUES ('3', 'contenttypes', '0002_remove_content_type_name', '2018-05-23 10:04:05.662709');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-05-23 10:04:05.717712');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-05-23 10:04:05.788716');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-05-23 10:04:05.799716');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-05-23 10:04:05.845719');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-05-23 10:04:05.850719');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-05-23 10:04:05.862720');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-05-23 10:04:05.920723');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2018-05-23 10:04:06.129735');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2018-05-23 16:13:40.571554');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2018-05-23 16:13:40.584554');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-05-23 16:14:17.544668');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('9jmr433ywfutcedjgtu95q7iikiff5ph', 'OTAzN2JjNWU1Y2IzOTU5NmRhYjFlMzc4OTA0MmIyMzA4NzRlNTExNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YmE3MTVmMmYwZmI3N2U2N2QxNmFjN2UwNDRjMDA3NjRiMDg1ZjcwIn0=', '2018-06-07 04:43:58.015712');

-- ----------------------------
-- Table structure for raw_item
-- ----------------------------
DROP TABLE IF EXISTS `raw_item`;
CREATE TABLE `raw_item` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fitemname` varchar(255) DEFAULT NULL,
  `fmusician` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of raw_item
-- ----------------------------
INSERT INTO `raw_item` VALUES ('1', '在木星', '朴树');
INSERT INTO `raw_item` VALUES ('2', '画', '赵雷');
INSERT INTO `raw_item` VALUES ('3', '晴天', '周杰伦');
INSERT INTO `raw_item` VALUES ('4', '海阔天空', 'Beyond');
INSERT INTO `raw_item` VALUES ('5', '花房姑娘', '崔健');
INSERT INTO `raw_item` VALUES ('6', '破冬', '王华峰');
INSERT INTO `raw_item` VALUES ('7', '米店', '李志');
INSERT INTO `raw_item` VALUES ('8', '安阳', '痛仰乐队');
INSERT INTO `raw_item` VALUES ('9', 'Young For You', 'GALA');
INSERT INTO `raw_item` VALUES ('10', '觉醒', '汪峰');
INSERT INTO `raw_item` VALUES ('11', '心跳', '王力宏');
INSERT INTO `raw_item` VALUES ('12', '曾经的你', '许巍');
INSERT INTO `raw_item` VALUES ('13', '成都', '赵雷');
INSERT INTO `raw_item` VALUES ('14', 'Try', 'P!NK');
INSERT INTO `raw_item` VALUES ('15', 'Stay the Night', 'Zedd');
INSERT INTO `raw_item` VALUES ('16', 'Let Me Go', 'Estelle');
INSERT INTO `raw_item` VALUES ('17', 'Drive', 'Halsey');
INSERT INTO `raw_item` VALUES ('18', 'Colors', 'Halsey');

-- ----------------------------
-- Table structure for recommendationflow
-- ----------------------------
DROP TABLE IF EXISTS `recommendationflow`;
CREATE TABLE `recommendationflow` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fuser` varchar(255) DEFAULT NULL,
  `fitemname` varchar(255) DEFAULT NULL,
  `factivity` varchar(255) DEFAULT NULL,
  `fmusician` varchar(255) DEFAULT NULL,
  `fcreatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommendationflow
-- ----------------------------
INSERT INTO `recommendationflow` VALUES ('1', '菜豆豆', 'Young For You', null, 'GALA', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('2', '菜豆豆', '觉醒', null, '汪峰', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('3', '菜豆豆', '心跳', null, '王力宏', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('4', '菜豆豆', '米店', null, '李志', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('5', '菜豆豆', '花房姑娘', null, '崔健', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('6', '001', '破冬', null, '王华峰', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('7', '001', 'Young For You', null, 'GALA', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('8', '001', '觉醒', null, '汪峰', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('9', '001', '心跳', null, '王力宏', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('10', '001', '花房姑娘', null, '崔健', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('11', '003', '曾经的你', null, '许巍', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('12', '003', '破冬', null, '王华峰', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('13', '003', '画', null, '赵雷', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('14', '003', '晴天', null, '周杰伦', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('15', '003', '觉醒', null, '汪峰', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('16', '004', '安阳', null, '痛仰乐队', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('17', '004', '米店', null, '李志', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('18', '004', '曾经的你', null, '许巍', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('19', '004', '在木星', null, '朴树', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('20', '004', '心跳', null, '王力宏', '2018-03-29 15:08:59');
INSERT INTO `recommendationflow` VALUES ('21', '菜豆豆', '安阳', null, '痛仰乐队', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('22', '菜豆豆', '曾经的你', null, '许巍', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('23', '菜豆豆', '在木星', null, '朴树', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('24', '菜豆豆', '米店', null, '李志', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('25', '菜豆豆', '觉醒', null, '汪峰', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('26', '001', '觉醒', null, '汪峰', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('27', '001', '画', null, '赵雷', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('28', '001', '海阔天空', null, 'Beyond', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('29', '001', '晴天', null, '周杰伦', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('30', '001', '花房姑娘', null, '崔健', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('31', '003', '安阳', null, '痛仰乐队', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('32', '003', '觉醒', null, '汪峰', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('33', '003', '破冬', null, '王华峰', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('34', '003', '曾经的你', null, '许巍', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('35', '003', '米店', null, '李志', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('36', '004', '觉醒', null, '汪峰', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('37', '004', '花房姑娘', null, '崔健', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('38', '004', '曾经的你', null, '许巍', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('39', '004', '晴天', null, '周杰伦', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('40', '004', '在木星', null, '朴树', '2018-04-03 16:03:55');
INSERT INTO `recommendationflow` VALUES ('41', '菜豆豆', '海阔天空', null, 'Beyond', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('42', '菜豆豆', '在木星', null, '朴树', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('43', '菜豆豆', '花房姑娘', null, '崔健', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('44', '菜豆豆', '破冬', null, '王华峰', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('45', '菜豆豆', '画', null, '赵雷', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('46', '001', '觉醒', null, '汪峰', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('47', '001', '海阔天空', null, 'Beyond', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('48', '001', '破冬', null, '王华峰', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('49', '001', '曾经的你', null, '许巍', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('50', '001', 'Young For You', null, 'GALA', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('51', '003', '海阔天空', null, 'Beyond', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('52', '003', '破冬', null, '王华峰', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('53', '003', '在木星', null, '朴树', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('54', '003', '觉醒', null, '汪峰', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('55', '003', '花房姑娘', null, '崔健', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('56', '004', '在木星', null, '朴树', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('57', '004', '觉醒', null, '汪峰', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('58', '004', '安阳', null, '痛仰乐队', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('59', '004', '心跳', null, '王力宏', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('60', '004', '晴天', null, '周杰伦', '2018-04-17 20:13:04');
INSERT INTO `recommendationflow` VALUES ('61', '3', 'c', null, '', '2018-04-17 20:13:39');
INSERT INTO `recommendationflow` VALUES ('62', '4', 'd', null, '', '2018-04-17 20:13:39');
INSERT INTO `recommendationflow` VALUES ('63', '5', 'g', null, '', '2018-04-17 20:13:39');
INSERT INTO `recommendationflow` VALUES ('64', '6', 'b', null, '', '2018-04-17 20:13:39');
INSERT INTO `recommendationflow` VALUES ('65', '菜豆豆', '晴天', null, '周杰伦', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('66', '菜豆豆', '曾经的你', null, '许巍', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('67', '菜豆豆', '米店', null, '李志', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('68', '菜豆豆', '在木星', null, '朴树', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('69', '菜豆豆', '画', null, '赵雷', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('70', '001', 'Young For You', null, 'GALA', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('71', '001', '安阳', null, '痛仰乐队', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('72', '001', '觉醒', null, '汪峰', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('73', '001', '海阔天空', null, 'Beyond', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('74', '001', '米店', null, '李志', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('75', '003', '画', null, '赵雷', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('76', '003', '心跳', null, '王力宏', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('77', '003', '成都', null, '赵雷', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('78', '003', '破冬', null, '王华峰', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('79', '003', '米店', null, '李志', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('80', '004', '花房姑娘', null, '崔健', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('81', '004', '破冬', null, '王华峰', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('82', '004', '画', null, '赵雷', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('83', '004', '安阳', null, '痛仰乐队', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('84', '004', '心跳', null, '王力宏', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('85', '006', '花房姑娘', null, '崔健', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('86', '006', '成都', null, '赵雷', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('87', '006', '画', null, '赵雷', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('88', '006', '曾经的你', null, '许巍', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('89', '006', '破冬', null, '王华峰', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('90', '007', '心跳', null, '王力宏', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('91', '007', '破冬', null, '王华峰', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('92', '007', '海阔天空', null, 'Beyond', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('93', '007', '花房姑娘', null, '崔健', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('94', '007', 'Young For You', null, 'GALA', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('95', '008', '晴天', null, '周杰伦', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('96', '008', '画', null, '赵雷', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('97', '008', '成都', null, '赵雷', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('98', '008', '米店', null, '李志', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('99', '008', '花房姑娘', null, '崔健', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('100', '009', '花房姑娘', null, '崔健', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('101', '009', '心跳', null, '王力宏', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('102', '009', '破冬', null, '王华峰', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('103', '009', '曾经的你', null, '许巍', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('104', '009', 'Young For You', null, 'GALA', '2018-05-06 18:21:34');
INSERT INTO `recommendationflow` VALUES ('105', '菜豆豆', '曾经的你', '喜欢', '许巍', '2018-05-22 04:52:10');
INSERT INTO `recommendationflow` VALUES ('106', '菜豆豆', '海阔天空', null, 'Beyond', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('107', '菜豆豆', '米店', '喜欢', '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('108', '菜豆豆', '安阳', null, '痛仰乐队', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('109', '菜豆豆', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('110', '菜豆豆', '破冬', null, '王华峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('111', '001', '花房姑娘', null, '崔健', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('112', '001', '晴天', null, '周杰伦', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('113', '001', '觉醒', null, '汪峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('114', '001', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('115', '001', '画', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('116', '003', '海阔天空', null, 'Beyond', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('117', '003', '曾经的你', null, '许巍', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('118', '003', '花房姑娘', null, '崔健', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('119', '003', '成都', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('120', '003', '觉醒', null, '汪峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('121', '004', '安阳', null, '痛仰乐队', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('122', '004', '破冬', null, '王华峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('123', '004', '曾经的你', null, '许巍', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('124', '004', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('125', '004', '米店', null, '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('126', '006', '曾经的你', null, '许巍', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('127', '006', '米店', null, '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('128', '006', '画', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('129', '006', '海阔天空', null, 'Beyond', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('130', '006', '花房姑娘', null, '崔健', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('131', '007', '曾经的你', null, '许巍', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('132', '007', '米店', null, '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('133', '007', '海阔天空', null, 'Beyond', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('134', '007', '画', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('135', '007', '花房姑娘', null, '崔健', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('136', '008', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('137', '008', '破冬', null, '王华峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('138', '008', '米店', null, '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('139', '008', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('140', '008', '安阳', null, '痛仰乐队', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('141', '009', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('142', '009', '画', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('143', '009', '米店', null, '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('144', '009', '晴天', null, '周杰伦', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('145', '009', '花房姑娘', null, '崔健', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('146', '菜豆豆', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('147', '菜豆豆', '晴天', null, '周杰伦', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('148', '菜豆豆', '画', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('149', '菜豆豆', '花房姑娘', null, '崔健', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('150', '菜豆豆', '海阔天空', null, 'Beyond', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('151', '001', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('152', '001', '画', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('153', '001', '觉醒', null, '汪峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('154', '001', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('155', '001', '破冬', null, '王华峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('156', '003', '成都', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('157', '003', 'Young For You', null, 'GALA', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('158', '003', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('159', '003', '花房姑娘', null, '崔健', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('160', '003', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('161', '004', '成都', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('162', '004', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('163', '004', '曾经的你', null, '许巍', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('164', '004', '海阔天空', null, 'Beyond', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('165', '004', '米店', null, '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('166', '006', '花房姑娘', null, '崔健', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('167', '006', '米店', null, '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('168', '006', '成都', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('169', '006', '曾经的你', null, '许巍', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('170', '006', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('171', '007', '觉醒', null, '汪峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('172', '007', 'Young For You', null, 'GALA', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('173', '007', '安阳', null, '痛仰乐队', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('174', '007', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('175', '007', '海阔天空', null, 'Beyond', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('176', '008', 'Young For You', null, 'GALA', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('177', '008', '觉醒', null, '汪峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('178', '008', '米店', null, '李志', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('179', '008', '晴天', null, '周杰伦', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('180', '008', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('181', '009', '觉醒', null, '汪峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('182', '009', 'Young For You', null, 'GALA', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('183', '009', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('184', '009', '安阳', null, '痛仰乐队', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('185', '009', '海阔天空', null, 'Beyond', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('186', '李凤祥', '曾经的你', null, '许巍', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('187', '李凤祥', '晴天', null, '周杰伦', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('188', '李凤祥', '心跳', null, '王力宏', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('189', '李凤祥', 'Young For You', null, 'GALA', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('190', '李凤祥', '画', null, '赵雷', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('191', '高强', '安阳', null, '痛仰乐队', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('192', '高强', '觉醒', null, '汪峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('193', '高强', '在木星', null, '朴树', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('194', '高强', '破冬', null, '王华峰', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('195', '高强', 'Young For You', null, 'GALA', '2018-05-23 10:54:39');
INSERT INTO `recommendationflow` VALUES ('196', '菜豆豆', 'Let Me Go', null, 'Estelle', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('197', '菜豆豆', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('198', '菜豆豆', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('199', '菜豆豆', 'Try', null, 'P!NK', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('200', '菜豆豆', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('201', '001', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('202', '001', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('203', '001', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('204', '001', '心跳', null, '王力宏', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('205', '001', '成都', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('206', '003', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('207', '003', 'Let Me Go', null, 'Estelle', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('208', '003', 'Try', null, 'P!NK', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('209', '003', 'Colors', null, 'Halsey', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('210', '003', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('211', '004', 'Try', null, 'P!NK', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('212', '004', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('213', '004', '曾经的你', null, '许巍', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('214', '004', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('215', '004', 'Let Me Go', null, 'Estelle', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('216', '006', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('217', '006', '曾经的你', null, '许巍', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('218', '006', 'Let Me Go', null, 'Estelle', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('219', '006', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('220', '006', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('221', '007', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('222', '007', '心跳', null, '王力宏', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('223', '007', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('224', '007', '觉醒', null, '汪峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('225', '007', 'Young For You', null, 'GALA', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('226', '008', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('227', '008', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('228', '008', 'Let Me Go', null, 'Estelle', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('229', '008', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('230', '008', 'Young For You', null, 'GALA', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('231', '009', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('232', '009', '心跳', null, '王力宏', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('233', '009', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('234', '009', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('235', '009', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('236', '李凤祥', 'Colors', null, 'Halsey', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('237', '李凤祥', 'Stay the Night', null, 'Zedd', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('238', '李凤祥', 'Young For You', null, 'GALA', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('239', '李凤祥', 'Try', null, 'P!NK', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('240', '李凤祥', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('241', '高强', 'Let Me Go', null, 'Estelle', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('242', '高强', 'Young For You', null, 'GALA', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('243', '高强', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('244', '高强', 'Drive', null, 'Halsey', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('245', '高强', '觉醒', null, '汪峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('246', '菜豆豆', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('247', '菜豆豆', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('248', '菜豆豆', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('249', '菜豆豆', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('250', '菜豆豆', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('251', '001', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('252', '001', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('253', '001', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('254', '001', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('255', '001', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('256', '003', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('257', '003', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('258', '003', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('259', '003', '心跳', null, '王力宏', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('260', '003', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('261', '004', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('262', '004', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('263', '004', '觉醒', null, '汪峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('264', '004', '心跳', null, '王力宏', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('265', '004', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('266', '006', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('267', '006', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('268', '006', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('269', '006', '心跳', null, '王力宏', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('270', '006', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('271', '007', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('272', '007', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('273', '007', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('274', '007', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('275', '007', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('276', '008', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('277', '008', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('278', '008', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('279', '008', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('280', '008', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('281', '009', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('282', '009', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('283', '009', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('284', '009', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('285', '009', 'Young For You', null, 'GALA', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('286', '李凤祥', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('287', '李凤祥', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('288', '李凤祥', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('289', '李凤祥', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('290', '李凤祥', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('291', '高强', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('292', '高强', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('293', '高强', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('294', '高强', '觉醒', null, '汪峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('295', '高强', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('296', '菜豆豆', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('297', '菜豆豆', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('298', '菜豆豆', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('299', '菜豆豆', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('300', '菜豆豆', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('301', '001', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('302', '001', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('303', '001', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('304', '001', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('305', '001', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('306', '003', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('307', '003', '觉醒', null, '汪峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('308', '003', 'Young For You', null, 'GALA', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('309', '003', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('310', '003', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('311', '004', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('312', '004', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('313', '004', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('314', '004', 'Young For You', null, 'GALA', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('315', '004', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('316', '006', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('317', '006', '觉醒', null, '汪峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('318', '006', 'Young For You', null, 'GALA', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('319', '006', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('320', '006', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('321', '007', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('322', '007', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('323', '007', '觉醒', null, '汪峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('324', '007', '心跳', null, '王力宏', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('325', '007', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('326', '008', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('327', '008', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('328', '008', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('329', '008', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('330', '008', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('331', '009', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('332', '009', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('333', '009', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('334', '009', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('335', '009', '心跳', null, '王力宏', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('336', '李凤祥', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('337', '李凤祥', '画', null, '赵雷', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('338', '李凤祥', '晴天', null, '周杰伦', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('339', '李凤祥', '海阔天空', null, 'Beyond', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('340', '李凤祥', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('341', '高强', '破冬', null, '王华峰', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('342', '高强', '在木星', null, '朴树', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('343', '高强', '米店', null, '李志', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('344', '高强', '安阳', null, '痛仰乐队', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('345', '高强', '花房姑娘', null, '崔健', '2018-05-23 13:13:29');
INSERT INTO `recommendationflow` VALUES ('346', '菜豆豆', '在木星', null, '朴树', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('347', '菜豆豆', '画', null, '赵雷', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('348', '菜豆豆', '晴天', null, '周杰伦', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('349', '菜豆豆', '海阔天空', null, 'Beyond', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('350', '菜豆豆', '花房姑娘', null, '崔健', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('351', '001', '海阔天空', null, 'Beyond', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('352', '001', '画', null, '赵雷', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('353', '001', '在木星', null, '朴树', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('354', '001', '米店', null, '李志', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('355', '001', '觉醒', null, '汪峰', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('356', '003', '晴天', null, '周杰伦', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('357', '003', '花房姑娘', null, '崔健', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('358', '003', '米店', null, '李志', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('359', '003', '心跳', null, '王力宏', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('360', '003', '在木星', null, '朴树', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('361', '004', '海阔天空', null, 'Beyond', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('362', '004', '花房姑娘', null, '崔健', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('363', '004', '米店', null, '李志', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('364', '004', '觉醒', null, '汪峰', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('365', '004', '在木星', null, '朴树', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('366', '006', '海阔天空', null, 'Beyond', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('367', '006', '花房姑娘', null, '崔健', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('368', '006', '米店', null, '李志', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('369', '006', '觉醒', null, '汪峰', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('370', '006', '安阳', null, '痛仰乐队', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('371', '007', '海阔天空', null, 'Beyond', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('372', '007', '晴天', null, '周杰伦', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('373', '007', '花房姑娘', null, '崔健', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('374', '007', '在木星', null, '朴树', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('375', '007', '画', null, '赵雷', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('376', '008', '在木星', null, '朴树', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('377', '008', '画', null, '赵雷', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('378', '008', '晴天', null, '周杰伦', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('379', '008', '海阔天空', null, 'Beyond', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('380', '008', '花房姑娘', null, '崔健', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('381', '009', '花房姑娘', null, '崔健', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('382', '009', '米店', null, '李志', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('383', '009', '心跳', null, '王力宏', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('384', '009', '海阔天空', null, 'Beyond', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('385', '009', '觉醒', null, '汪峰', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('386', '李凤祥', '在木星', '喜欢', '朴树', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('387', '李凤祥', '画', null, '赵雷', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('388', '李凤祥', '晴天', null, '周杰伦', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('389', '李凤祥', '海阔天空', null, 'Beyond', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('390', '李凤祥', '花房姑娘', null, '崔健', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('391', '高强', '破冬', null, '王华峰', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('392', '高强', '米店', null, '李志', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('393', '高强', 'Young For You', null, 'GALA', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('394', '高强', '觉醒', null, '汪峰', '2018-05-24 18:57:10');
INSERT INTO `recommendationflow` VALUES ('395', '高强', '心跳', null, '王力宏', '2018-05-24 18:57:10');

-- ----------------------------
-- Table structure for recommendsysapp_raw_item
-- ----------------------------
DROP TABLE IF EXISTS `recommendsysapp_raw_item`;
CREATE TABLE `recommendsysapp_raw_item` (
  `fid` int(11) NOT NULL,
  `fitemname` varchar(255) NOT NULL,
  `fmusician` varchar(100) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommendsysapp_raw_item
-- ----------------------------

-- ----------------------------
-- Table structure for recommendsysapp_recommendation_flow
-- ----------------------------
DROP TABLE IF EXISTS `recommendsysapp_recommendation_flow`;
CREATE TABLE `recommendsysapp_recommendation_flow` (
  `fid` int(11) NOT NULL,
  `fuserid` varchar(15) NOT NULL,
  `fitemname` varchar(255) NOT NULL,
  `fmusician` varchar(100) NOT NULL,
  `fcreatetime` datetime(6) NOT NULL,
  `factivity` varchar(20) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommendsysapp_recommendation_flow
-- ----------------------------

-- ----------------------------
-- Table structure for recommendsysapp_sys_para
-- ----------------------------
DROP TABLE IF EXISTS `recommendsysapp_sys_para`;
CREATE TABLE `recommendsysapp_sys_para` (
  `fid` int(11) NOT NULL,
  `fparatype` varchar(255) NOT NULL,
  `fparaname` varchar(255) NOT NULL,
  `fparaorder` varchar(4) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommendsysapp_sys_para
-- ----------------------------
INSERT INTO `recommendsysapp_sys_para` VALUES ('1', '行为权值', '单曲循环', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('2', '行为权值', '收藏', '2');
INSERT INTO `recommendsysapp_sys_para` VALUES ('3', '行为权值', '喜欢', '3');
INSERT INTO `recommendsysapp_sys_para` VALUES ('4', '行为权值', '听过', '4');
INSERT INTO `recommendsysapp_sys_para` VALUES ('5', '行为权值', '跳过', '5');
INSERT INTO `recommendsysapp_sys_para` VALUES ('6', '行为权值', '不喜欢', '6');
INSERT INTO `recommendsysapp_sys_para` VALUES ('7', '单曲循环', '5', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('8', '收藏', '3', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('9', '喜欢', '4', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('10', '听过', '1', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('11', '跳过', '-2', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('12', '不喜欢', '-5', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('13', '系统参数', '推荐歌单曲目数', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('14', '推荐歌单曲目数', '5', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('15', '管理员账号', '管理员账号|admin', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('16', '管理员账号|admin', '123456', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('17', '行为权值', '评论', '7');
INSERT INTO `recommendsysapp_sys_para` VALUES ('18', '评论', '2', '1');
INSERT INTO `recommendsysapp_sys_para` VALUES ('19', '心跳时间', '2018-05-24 19:10:56', '01');

-- ----------------------------
-- Table structure for sys_para
-- ----------------------------
DROP TABLE IF EXISTS `sys_para`;
CREATE TABLE `sys_para` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fparatype` varchar(255) DEFAULT NULL,
  `fparaname` varchar(255) DEFAULT NULL,
  `fparaorder` int(4) DEFAULT '1',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_para
-- ----------------------------
INSERT INTO `sys_para` VALUES ('1', '行为权值', '单曲循环', '1');
INSERT INTO `sys_para` VALUES ('2', '行为权值', '收藏', '2');
INSERT INTO `sys_para` VALUES ('3', '行为权值', '喜欢', '3');
INSERT INTO `sys_para` VALUES ('4', '行为权值', '听过', '4');
INSERT INTO `sys_para` VALUES ('5', '行为权值', '跳过', '5');
INSERT INTO `sys_para` VALUES ('6', '行为权值', '不喜欢', '6');
INSERT INTO `sys_para` VALUES ('7', '单曲循环', '5', '1');
INSERT INTO `sys_para` VALUES ('8', '收藏', '3', '1');
INSERT INTO `sys_para` VALUES ('9', '喜欢', '4', '1');
INSERT INTO `sys_para` VALUES ('10', '听过', '1', '1');
INSERT INTO `sys_para` VALUES ('11', '跳过', '-2', '1');
INSERT INTO `sys_para` VALUES ('12', '不喜欢', '-5', '1');
INSERT INTO `sys_para` VALUES ('13', '系统参数', '推荐歌单曲目数', '1');
INSERT INTO `sys_para` VALUES ('14', '推荐歌单曲目数', '5', '1');
INSERT INTO `sys_para` VALUES ('15', '管理员账号', '管理员账号|admin', '1');
INSERT INTO `sys_para` VALUES ('16', '管理员账号|admin', '123456', '1');
INSERT INTO `sys_para` VALUES ('17', '行为权值', '评论', '1');
INSERT INTO `sys_para` VALUES ('18', '评论', '2', '1');
INSERT INTO `sys_para` VALUES ('19', '心跳时间', '2018-05-06 18:12:47', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `fpassword` varchar(18) DEFAULT '0',
  `fuserid` int(15) DEFAULT NULL,
  `fcreatetime` datetime DEFAULT NULL,
  `fstatus` varchar(1) DEFAULT '0',
  `fdate` datetime DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '菜豆豆', '0', '1', '2018-03-26 15:49:14', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('2', '001', '0', '2', '2018-03-26 15:49:14', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('3', '003', '0', '3', '2018-03-26 15:49:14', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('4', '004', '0', '4', '2018-03-26 15:49:14', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('5', '006', '0', null, '2018-05-05 13:24:07', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('6', '007', '0', null, '2018-05-05 13:25:07', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('7', '008', '0', null, '2018-05-05 13:25:42', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('8', '009', '0', null, '2018-05-05 13:26:25', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('9', '李凤祥', '0', null, '2018-05-24 12:51:21', '1', '2018-05-24 18:57:10');
INSERT INTO `user` VALUES ('10', '高强', '0', null, '2018-05-24 12:51:24', '1', '2018-05-24 18:57:10');

-- ----------------------------
-- Table structure for user_activity
-- ----------------------------
DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE `user_activity` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fuser` varchar(255) DEFAULT NULL,
  `fitemname` varchar(255) DEFAULT NULL,
  `factivity` varchar(20) DEFAULT NULL,
  `factivitytime` datetime DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_activity
-- ----------------------------
INSERT INTO `user_activity` VALUES ('1', '菜豆豆', '成都|赵雷', '评论', '2018-05-05 13:57:19');
INSERT INTO `user_activity` VALUES ('2', '菜豆豆', '曾经的你|许巍', '喜欢', '2018-05-22 05:47:25');
INSERT INTO `user_activity` VALUES ('3', '菜豆豆', '米店|李志', '喜欢', '2018-05-24 12:46:53');
INSERT INTO `user_activity` VALUES ('4', '李凤祥', '米店|李志', '不喜欢', '2018-05-24 12:52:07');
INSERT INTO `user_activity` VALUES ('5', '李凤祥', 'Drive|Halsey', '喜欢', '2018-05-24 12:59:02');
INSERT INTO `user_activity` VALUES ('6', '008', 'Drive|Halsey', '喜欢', '2018-05-24 12:59:56');
INSERT INTO `user_activity` VALUES ('7', '008', 'Colors|Halsey', '喜欢', '2018-05-24 13:00:41');
INSERT INTO `user_activity` VALUES ('8', '008', 'Stay the Night|Zedd', '喜欢', '2018-05-24 13:01:15');
INSERT INTO `user_activity` VALUES ('9', '008', 'Try|P!NK', '喜欢', '2018-05-24 13:01:53');
INSERT INTO `user_activity` VALUES ('10', '李凤祥', '在木星|朴树', '喜欢', '2018-05-24 18:57:52');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fusername` varchar(255) DEFAULT NULL,
  `fsex` varchar(2) DEFAULT NULL,
  `fuserid` int(18) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '005', null, null);
INSERT INTO `user_info` VALUES ('2', '006', null, null);
INSERT INTO `user_info` VALUES ('3', '007', null, null);
INSERT INTO `user_info` VALUES ('4', '008', null, null);
INSERT INTO `user_info` VALUES ('5', '009', null, null);
