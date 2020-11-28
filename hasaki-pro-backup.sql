/*
 Navicat Premium Data Transfer

 Source Server         : hasaki-pro
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 114.67.108.251:10001
 Source Schema         : hasaki

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 18/12/2019 15:12:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `ip` varchar(38) COLLATE utf8_bin NOT NULL COMMENT 'ip地址',
  `device` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '设备信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of login_log
-- ----------------------------
BEGIN;
INSERT INTO `login_log` VALUES (1, 1, '2019-12-10 03:34:29', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (2, 1, '2019-12-10 06:00:11', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (3, 1, '2019-12-10 06:11:13', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (4, 1, '2019-12-10 06:16:08', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (5, 1, '2019-12-10 06:19:23', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (6, 1, '2019-12-10 06:19:23', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (7, 1, '2019-12-10 06:30:12', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (8, 1, '2019-12-10 06:37:29', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (9, 1, '2019-12-10 06:46:59', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (10, 1, '2019-12-10 08:36:03', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (11, 1, '2019-12-10 08:44:53', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (12, 1, '2019-12-10 08:47:07', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (13, 1, '2019-12-10 08:53:12', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (14, 1, '2019-12-10 11:30:19', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (15, 1, '2019-12-10 11:54:58', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (16, 1, '2019-12-10 12:54:43', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (17, 1, '2019-12-10 13:01:43', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (18, 1, '2019-12-10 15:34:55', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (19, 1, '2019-12-10 15:52:56', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (20, 1, '2019-12-11 00:52:58', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (21, 1, '2019-12-11 00:55:15', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (22, 1, '2019-12-11 00:57:19', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (23, 1, '2019-12-11 00:57:33', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (24, 1, '2019-12-11 01:57:55', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (25, 1, '2019-12-11 02:15:16', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (26, 1, '2019-12-11 02:41:42', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (27, 1, '2019-12-11 02:51:44', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (28, 1, '2019-12-11 02:57:45', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (29, 1, '2019-12-11 02:59:09', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (30, 1, '2019-12-11 03:02:25', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (31, 1, '2019-12-11 03:19:56', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (32, 1, '2019-12-11 03:22:52', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (33, 1, '2019-12-11 03:27:29', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (34, 1, '2019-12-11 05:36:19', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (35, 1, '2019-12-11 05:59:09', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (36, 1, '2019-12-11 06:01:44', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (37, 1, '2019-12-11 06:04:23', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (38, 1, '2019-12-11 06:06:37', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (39, 1, '2019-12-11 06:14:20', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (40, 1, '2019-12-11 06:17:51', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (41, 1, '2019-12-11 07:37:21', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (42, 1, '2019-12-11 08:12:22', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (43, 1, '2019-12-11 08:41:29', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (44, 1, '2019-12-11 08:44:30', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (45, 1, '2019-12-11 08:50:19', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (46, 1, '2019-12-11 09:07:52', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (47, 1, '2019-12-11 09:12:41', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (48, 1, '2019-12-11 09:15:33', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (49, 1, '2019-12-11 09:46:02', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (50, 2, '2019-12-11 10:01:02', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (51, 2, '2019-12-11 10:05:37', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (52, 2, '2019-12-11 10:10:55', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (53, 2, '2019-12-11 10:13:36', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (54, 2, '2019-12-11 10:14:54', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (55, 2, '2019-12-11 10:16:45', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (56, 2, '2019-12-11 10:18:47', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (57, 1, '2019-12-11 10:24:47', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (58, 3, '2019-12-11 11:04:33', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (59, 1, '2019-12-11 11:05:03', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (60, 2, '2019-12-11 11:07:35', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (61, 2, '2019-12-11 11:14:13', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (62, 1, '2019-12-11 13:41:41', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (63, 1, '2019-12-11 15:00:27', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (64, 1, '2019-12-11 15:06:43', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (65, 1, '2019-12-11 15:12:28', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (66, 1, '2019-12-11 15:14:51', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (67, 1, '2019-12-11 15:44:13', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (68, 1, '2019-12-12 01:59:43', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (69, 1, '2019-12-12 02:12:19', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (70, 1, '2019-12-12 02:19:30', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (71, 1, '2019-12-12 03:03:04', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (72, 1, '2019-12-12 05:13:41', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (73, 1, '2019-12-12 05:15:59', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (74, 1, '2019-12-12 05:31:04', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (75, 1, '2019-12-12 05:32:46', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (76, 2, '2019-12-12 05:37:09', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (77, 2, '2019-12-12 05:38:08', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (78, 1, '2019-12-12 05:43:34', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (79, 2, '2019-12-12 05:59:01', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (80, 2, '2019-12-12 06:02:16', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (81, 1, '2019-12-12 06:07:48', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (82, 2, '2019-12-12 06:17:46', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (83, 2, '2019-12-12 06:24:01', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (84, 2, '2019-12-12 06:27:22', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (85, 1, '2019-12-12 06:30:49', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (86, 2, '2019-12-12 06:50:48', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (87, 1, '2019-12-12 07:19:26', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (88, 2, '2019-12-12 11:52:09', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (89, 1, '2019-12-12 12:06:58', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (90, 1, '2019-12-12 12:20:09', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (91, 1, '2019-12-12 12:36:02', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (92, 1, '2019-12-12 13:05:51', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (93, 1, '2019-12-12 13:10:35', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (94, 1, '2019-12-12 13:17:26', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (95, 1, '2019-12-12 13:20:35', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (96, 5, '2019-12-12 14:24:18', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (97, 1, '2019-12-12 14:27:10', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (98, 5, '2019-12-12 14:27:59', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (99, 1, '2019-12-12 15:31:26', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (100, 1, '2019-12-13 02:53:48', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (101, 2, '2019-12-13 02:54:26', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (102, 1, '2019-12-13 03:06:37', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (103, 1, '2019-12-13 03:46:28', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (104, 1, '2019-12-13 03:51:20', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (105, 1, '2019-12-13 06:30:17', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (106, 1, '2019-12-13 06:34:05', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (107, 1, '2019-12-13 06:37:05', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (108, 1, '2019-12-13 06:40:19', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (109, 1, '2019-12-13 06:50:53', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (110, 1, '2019-12-13 07:04:10', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (111, 1, '2019-12-15 12:06:50', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (112, 1, '2019-12-15 13:08:40', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (113, 1, '2019-12-15 13:11:08', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (114, 1, '2019-12-15 13:14:41', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (115, 1, '2019-12-15 13:32:01', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (116, 6, '2019-12-15 14:11:36', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (117, 1, '2019-12-15 14:12:15', '0:0:0:0:0:0:0:1', 'FIREFOX7');
INSERT INTO `login_log` VALUES (118, 1, '2019-12-15 14:27:20', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (119, 1, '2019-12-15 15:26:37', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (120, 2, '2019-12-15 15:28:22', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (121, 2, '2019-12-15 15:30:48', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (122, 2, '2019-12-15 15:32:45', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (123, 1, '2019-12-15 15:33:40', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (124, 2, '2019-12-15 15:35:10', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (125, 2, '2019-12-15 15:44:37', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (126, 1, '2019-12-15 15:46:33', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (127, 2, '2019-12-15 15:49:01', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (128, 2, '2019-12-15 17:00:20', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (129, 2, '2019-12-15 17:03:32', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (130, 1, '2019-12-15 17:03:51', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (131, 2, '2019-12-15 17:26:23', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (132, 2, '2019-12-15 17:27:08', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (133, 2, '2019-12-16 01:50:59', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (134, 1, '2019-12-16 12:28:22', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (135, 1, '2019-12-16 12:38:03', '0:0:0:0:0:0:0:1', 'MOBILE_SAFARI');
INSERT INTO `login_log` VALUES (136, 1, '2019-12-18 05:54:07', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (137, 1, '2019-12-18 06:02:49', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (138, 1, '2019-12-18 06:04:34', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (139, 1, '2019-12-18 06:11:16', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (140, 1, '2019-12-18 06:26:46', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (141, 1, '2019-12-18 07:04:46', '0:0:0:0:0:0:0:1', 'SAFARI');
INSERT INTO `login_log` VALUES (142, 1, '2019-12-18 07:08:28', '0:0:0:0:0:0:0:1', 'SAFARI');
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '信息内容',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `user_id` int(11) NOT NULL COMMENT '发送者id',
  `reply_user_id` int(11) NOT NULL COMMENT '接收者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES (1, '哈喽啊', '2019-12-11 15:15:54', 1, 2);
INSERT INTO `message` VALUES (2, 'fuck', '2019-12-11 09:15:46', 1, 2);
INSERT INTO `message` VALUES (4, 'Mikuo?', '2019-12-12 14:27:45', 1, 5);
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '权限',
  `description` text COLLATE utf8_bin COMMENT '权限描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, 'users', '用户管理');
INSERT INTO `permission` VALUES (2, 'topics', '帖子管理');
INSERT INTO `permission` VALUES (3, 'tabs', '板块管理');
INSERT INTO `permission` VALUES (4, 'replies', '回复管理');
INSERT INTO `permission` VALUES (7, 'roles', '身份管理');
COMMIT;

-- ----------------------------
-- Table structure for permission_resource
-- ----------------------------
DROP TABLE IF EXISTS `permission_resource`;
CREATE TABLE `permission_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`),
  KEY `fpr_permission_id` (`permission_id`),
  KEY `fpr_resource_id` (`resource_id`),
  CONSTRAINT `fpr_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fpr_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission_resource
-- ----------------------------
BEGIN;
INSERT INTO `permission_resource` VALUES (1, 1, 1);
INSERT INTO `permission_resource` VALUES (2, 1, 2);
INSERT INTO `permission_resource` VALUES (3, 3, 4);
INSERT INTO `permission_resource` VALUES (4, 2, 5);
COMMIT;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `topic_id` int(11) NOT NULL COMMENT '帖子id',
  `reply_user_id` int(11) NOT NULL COMMENT '用户id',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '回复内容',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `device` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '设备信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of reply
-- ----------------------------
BEGIN;
INSERT INTO `reply` VALUES (1, 1, 1, '自己顶自己', '2019-12-10 08:48:36', '2019-12-10 08:48:36', NULL);
INSERT INTO `reply` VALUES (2, 1, 1, '刘钟涛长大大变样', '2019-12-11 03:01:31', '2019-12-11 03:01:31', NULL);
INSERT INTO `reply` VALUES (3, 6, 2, '哈哈哈，终于开放了！', '2019-12-12 06:51:08', '2019-12-12 06:51:08', NULL);
INSERT INTO `reply` VALUES (4, 7, 2, '神奇的996，哈哈哈哈', '2019-12-12 07:13:39', '2019-12-12 07:13:39', NULL);
COMMIT;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `resource` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '资源url',
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of resource
-- ----------------------------
BEGIN;
INSERT INTO `resource` VALUES (1, '/admin/user/delete', '删除用户');
INSERT INTO `resource` VALUES (2, '/admin/user/add', '添加用户');
INSERT INTO `resource` VALUES (3, '/admin/topic/delete', '删除帖子');
INSERT INTO `resource` VALUES (4, '/admin/tab/add', '添加板块');
INSERT INTO `resource` VALUES (5, '/admin/topic', '帖子列表');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '身份id',
  `role` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '身份',
  `description` text COLLATE utf8_bin COMMENT '身份描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'user', '普通用户');
INSERT INTO `role` VALUES (2, 'admin', '管理员');
INSERT INTO `role` VALUES (3, 'topic', '帖子管理员');
INSERT INTO `role` VALUES (4, 'vice', '副站长');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '身份id\n',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `frp_permission_id` (`permission_id`),
  KEY `frp_role_id` (`role_id`),
  CONSTRAINT `frp_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `frp_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES (1, 2, 1);
INSERT INTO `role_permission` VALUES (2, 2, 2);
INSERT INTO `role_permission` VALUES (3, 3, 2);
INSERT INTO `role_permission` VALUES (4, 4, 1);
INSERT INTO `role_permission` VALUES (5, 4, 2);
INSERT INTO `role_permission` VALUES (6, 4, 3);
COMMIT;

-- ----------------------------
-- Table structure for tab
-- ----------------------------
DROP TABLE IF EXISTS `tab`;
CREATE TABLE `tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `tab_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '板块名称',
  `tab_name_en` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tab
-- ----------------------------
BEGIN;
INSERT INTO `tab` VALUES (1, '默认分类', 'default');
INSERT INTO `tab` VALUES (2, 'Java编程', 'java');
INSERT INTO `tab` VALUES (3, 'PHP编程', 'php');
INSERT INTO `tab` VALUES (4, 'Python编程', 'python');
INSERT INTO `tab` VALUES (5, 'C/C++开发', 'cpp');
COMMIT;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `user_id` int(11) NOT NULL COMMENT '发帖人id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '内容',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `tab_id` int(11) NOT NULL COMMENT '板块id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of topic
-- ----------------------------
BEGIN;
INSERT INTO `topic` VALUES (1, 1, '2019-12-10 06:55:27', '2019-12-18 07:05:40', '测试发言的修改', '### 修改后\n:kissing_closed_eyes::sunglasses:\n就是这么强大\n### lzt\n![哪个逼的收款码](/img/uploads/1576156945596.JPG \"哪个逼的收款码\")\n咱也不知道这是哪个逼的收款码\n:relieved:\n估计是个傻逼:sunglasses:\n```php\n<?php\necho \"HelloWorld\";\n?>\n```\n```cpp\n#include<iostream>\nusing namespace std;\nint main() {\n	cout << \"HelloWorld\" << endl;\n}\n```\n```python\nprint(\"HelloWorld\")\n```', 27, 1);
INSERT INTO `topic` VALUES (2, 2, '2019-12-11 11:09:14', '2019-12-11 11:09:14', 'Java基本语法', '### 基本语法\n```java\npublic static void main(String [] args) {\n	System.out.println(\"HelloWorld\");\n}\n```', 2, 2);
INSERT INTO `topic` VALUES (3, 2, '2019-12-12 06:18:41', '2019-12-12 06:18:41', '测试图片', '### 测试图片 !\n![banner](/img/uploads/1576132054462.png \"banner\")', 1, 1);
INSERT INTO `topic` VALUES (4, 2, '2019-12-12 06:24:24', '2019-12-12 06:24:24', 'TEST', '### 发帖请遵守规范 !\n![](/img/uploads/banner.png)', 1, 1);
INSERT INTO `topic` VALUES (5, 2, '2019-12-12 06:28:25', '2019-12-12 06:28:25', '上传图片成功', '### 发帖请遵守规范 !\n[![](/img/uploads/1576132054462.png)](https://www.liudalao.com)', 3, 1);
INSERT INTO `topic` VALUES (6, 1, '2019-12-12 06:32:01', '2019-12-12 14:04:14', '庆祝Python板块开放', '### 热烈庆祝\nPython板块终于开通，请大家多多支持\n[![庆祝图片](/img/uploads/1576132296201.png  \"庆祝图片\" style=\"width: 200px\")](https://www.liudalao.com \"庆祝图片\")', 26, 4);
INSERT INTO `topic` VALUES (7, 2, '2019-12-12 06:56:41', '2019-12-16 01:52:41', '水贴', '### 水贴\n如题:joy:\n:triumph:\n发几个表情庆祝一下\n![oss](/img/uploads/1576461148447.png \"oss\")\n阿里云OSS\n\n## 大水逼\n2019-12-12 14:55:47 星期四\n:stuck_out_tongue:\n:mask: :mask:\n\n## C艹\n:sos:996警告', 16, 5);
INSERT INTO `topic` VALUES (8, 2, '2019-12-12 11:55:46', '2019-12-13 02:56:12', '本站介绍', '# 站点介绍\n## 开发工具\nIDEA\n## 开发环境\nJDK8\n## 数据库\nMySQL5.7\n## 后端框架\nSpringMVC+MyBatis\n![测试图片](/img/uploads/1576205707050.png)\n![amazon](/img/uploads/1576205747096.png \"amazon\")\n![又拍云](/img/uploads/1576205765897.png \"又拍云\")', 6, 1);
INSERT INTO `topic` VALUES (9, 5, '2019-12-12 14:26:16', '2019-12-12 14:26:16', '刘钟涛', '### 发帖请遵守规范 !\n[![刘钟涛](/img/uploads/1576160751872.png \"刘钟涛\")](http://baidu.com \"刘钟涛\")', 1, 1);
INSERT INTO `topic` VALUES (10, 1, '2019-12-16 12:34:02', '2019-12-16 12:34:02', 'Markdown编辑器', '### Markdown编辑器\n:joy:完美支持emoji\n支持实时预览\n![](/img/uploads/1576499406222.jpg)', 2, 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱地址',
  `phone_num` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `credit` int(11) NOT NULL COMMENT '积分',
  `avatar` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '头像url',
  `role_id` int(11) NOT NULL COMMENT '身份id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_num` (`phone_num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'archer9812', 'D720A1250A28B91859755464476AD1AF', '13341221231@126.com', '13341221231', '2019-12-10 03:14:11', '2019-12-11 02:16:56', 2, '/img/avatar/1576033392002-1.PNG', 2);
INSERT INTO `user` VALUES (2, 'admin', 'D720A1250A28B91859755464476AD1AF', 'chengqiliu@126.com', '13305327393', '2019-12-11 07:15:27', '2019-12-11 07:15:27', 2, '/img/avatar.png', 3);
INSERT INTO `user` VALUES (5, 'Mikuo', 'D0CD2693B3506677E4C55E91D6365BFF', '840871354@qq.com', '15622013045', '2019-12-12 14:23:51', '2019-12-12 14:25:18', 0, '/img/avatar/1576160812724-5.png', 1);
INSERT INTO `user` VALUES (6, 'archer', 'D720A1250A28B91859755464476AD1AF', '73609275@qq.com', '13969780729', '2019-12-15 14:11:20', '2019-12-15 14:11:20', 0, '/img/avatar.png', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
