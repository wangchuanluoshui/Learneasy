/*
 Navicat Premium Data Transfer

 Source Server         : 192.168
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : learneasy_learning1

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/09/2023 13:40:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for le_choose_course
-- ----------------------------
DROP TABLE IF EXISTS `le_choose_course`;
CREATE TABLE `le_choose_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `course_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `company_id` bigint NOT NULL COMMENT '机构id',
  `order_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '选课类型',
  `create_date` datetime NOT NULL COMMENT '添加时间',
  `course_price` float(10, 2) NOT NULL COMMENT '课程价格',
  `valid_days` int NOT NULL COMMENT '课程有效期(天)',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '选课状态',
  `validtime_start` datetime NOT NULL COMMENT '开始服务时间',
  `validtime_end` datetime NOT NULL COMMENT '结束服务时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of le_choose_course
-- ----------------------------
INSERT INTO `le_choose_course` VALUES (16, 121, 'Spring Cloud 开发实战', '52', 1232141425, '700002', '2023-02-09 11:43:32', 1.00, 365, '701001', '2023-02-09 11:43:32', '2024-02-09 11:43:32', NULL);
INSERT INTO `le_choose_course` VALUES (17, 121, 'Spring Cloud 开发实战', '52', 1232141425, '700002', '2023-02-09 11:49:06', 1.00, 365, '701002', '2023-02-09 11:49:06', '2024-02-09 11:49:06', NULL);
INSERT INTO `le_choose_course` VALUES (32, 161, 'Python快速入门', '52', 1232141425, '700002', '2023-03-17 17:32:16', 0.10, 365, '701002', '2023-03-17 17:32:16', '2024-03-16 17:32:16', NULL);
INSERT INTO `le_choose_course` VALUES (33, 159, 'tmp', '52', 1232141425, '700001', '2023-03-17 17:32:41', 0.00, 365, '701001', '2023-03-17 17:32:41', '2024-03-16 17:32:41', NULL);
INSERT INTO `le_choose_course` VALUES (34, 163, 'Matlab', '52', 1232141425, '700002', '2023-03-18 19:35:45', 9999.00, 365, '701002', '2023-03-18 19:35:45', '2024-03-17 19:35:45', NULL);
INSERT INTO `le_choose_course` VALUES (35, 165, '机器学习', '52', 1232141425, '700002', '2023-03-19 17:47:23', 1888.00, 365, '701001', '2023-03-19 17:47:23', '2024-03-18 17:47:23', NULL);
INSERT INTO `le_choose_course` VALUES (36, 165, '机器学习', '52', 1232141425, '700002', '2023-03-20 21:08:35', 1888.00, 365, '701002', '2023-03-20 21:08:35', '2024-03-19 21:08:35', NULL);
INSERT INTO `le_choose_course` VALUES (37, 166, 'asd', '52', 1232141425, '700002', '2023-04-02 23:21:00', 0.10, 365, '701002', '2023-04-02 23:21:00', '2024-04-01 23:21:00', NULL);
INSERT INTO `le_choose_course` VALUES (38, 175, 'C++入门', '46', 1232141425, '700001', '2023-09-04 16:09:46', 0.00, 365, '701001', '2023-09-04 16:09:46', '2024-09-03 16:09:46', NULL);
INSERT INTO `le_choose_course` VALUES (39, 176, 'C++中级编程', '46', 1232141425, '700002', '2023-09-07 14:16:49', 118.00, 365, '701002', '2023-09-07 14:16:49', '2024-09-06 14:16:49', NULL);
INSERT INTO `le_choose_course` VALUES (40, 177, 'C++高级编程', '46', 1232141425, '700002', '2023-09-07 14:48:56', 128.00, 365, '701002', '2023-09-07 14:48:56', '2024-09-06 14:48:56', NULL);

-- ----------------------------
-- Table structure for le_course_tables
-- ----------------------------
DROP TABLE IF EXISTS `le_course_tables`;
CREATE TABLE `le_course_tables`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choose_course_id` bigint NOT NULL COMMENT '选课记录id',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `company_id` bigint NOT NULL COMMENT '机构id',
  `course_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `course_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `create_date` datetime NOT NULL COMMENT '添加时间',
  `validtime_start` datetime NULL DEFAULT NULL COMMENT '开始服务时间',
  `validtime_end` datetime NOT NULL COMMENT '到期时间',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `course_tables_unique`(`user_id` ASC, `course_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of le_course_tables
-- ----------------------------
INSERT INTO `le_course_tables` VALUES (11, 16, '52', 121, 1232141425, 'Spring Cloud 开发实战', '700002', '2023-02-09 11:44:48', '2023-02-09 11:43:32', '2024-02-09 11:43:32', NULL, NULL);
INSERT INTO `le_course_tables` VALUES (30, 33, '52', 159, 1232141425, 'tmp', '700001', '2023-03-17 17:32:41', '2023-03-17 17:32:41', '2024-03-16 17:32:41', '2023-03-17 17:32:41', NULL);
INSERT INTO `le_course_tables` VALUES (31, 35, '52', 165, 1232141425, '机器学习', '700002', '2023-03-19 17:47:23', '2023-03-19 17:47:23', '2024-03-18 17:47:23', '2023-03-19 17:57:00', NULL);
INSERT INTO `le_course_tables` VALUES (32, 38, '46', 175, 1232141425, 'C++入门', '700001', '2023-09-04 16:09:46', '2023-09-04 16:09:46', '2024-09-03 16:09:46', '2023-09-04 16:09:46', NULL);

-- ----------------------------
-- Table structure for le_learn_record
-- ----------------------------
DROP TABLE IF EXISTS `le_learn_record`;
CREATE TABLE `le_learn_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL COMMENT '课程id',
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `learn_date` datetime NULL DEFAULT NULL COMMENT '最近学习时间',
  `learn_length` bigint NULL DEFAULT NULL COMMENT '学习时长',
  `teachplan_id` bigint NULL DEFAULT NULL COMMENT '章节id',
  `teachplan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `learn_record_unique`(`course_id` ASC, `user_id` ASC, `teachplan_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of le_learn_record
-- ----------------------------
INSERT INTO `le_learn_record` VALUES (1, 123, 'SpringBoot实战', '52', '2022-10-06 11:31:19', 22, 222, '入门程序');
INSERT INTO `le_learn_record` VALUES (2, 121, 'Java编程思想', '52', '2022-10-06 11:31:57', 10, 333, 'Java学习路径');
INSERT INTO `le_learn_record` VALUES (7, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:24', 0, 269, '1.1 什么是配置中心');
INSERT INTO `le_learn_record` VALUES (8, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:23', 0, 270, '1.2Nacos简介');
INSERT INTO `le_learn_record` VALUES (9, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:25', 0, 271, '1.3安装Nacos Server');
INSERT INTO `le_learn_record` VALUES (10, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:27', 0, 272, '1.4Nacos配置入门');
INSERT INTO `le_learn_record` VALUES (11, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:41:08', 0, 275, '2.1什么是服务发现');
INSERT INTO `le_learn_record` VALUES (12, 117, 'Nacos微服务开发实战', '52', '2022-10-06 13:18:46', 0, 276, '2.2服务发现快速入门');

SET FOREIGN_KEY_CHECKS = 1;
