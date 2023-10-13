/*
 Navicat Premium Data Transfer

 Source Server         : 192.168
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : learneasy_media1

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/09/2023 13:40:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for media_files
-- ----------------------------
DROP TABLE IF EXISTS `media_files`;
CREATE TABLE `media_files`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件id,md5值',
  `company_id` bigint NULL DEFAULT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `file_type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型（图片、文档，视频）',
  `tags` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `bucket` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储目录',
  `file_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `file_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件id',
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒资文件访问地址',
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人',
  `create_date` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态,1:正常，0:不展示',
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `audit_status` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `audit_mind` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_fileid`(`file_id` ASC) USING BTREE COMMENT '文件id唯一索引 '
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '媒资信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_files
-- ----------------------------
INSERT INTO `media_files` VALUES ('05b7f9022b3b4e6d2580b9071c07ebea', 1232141425, NULL, 'test_mp4.mp4', '001002', '视频文件', 'video', '0/5/05b7f9022b3b4e6d2580b9071c07ebea/05b7f9022b3b4e6d2580b9071c07ebea.mp4', '05b7f9022b3b4e6d2580b9071c07ebea', '/video/0/5/05b7f9022b3b4e6d2580b9071c07ebea/05b7f9022b3b4e6d2580b9071c07ebea.mp4', NULL, '2023-08-25 08:30:08', NULL, '1', NULL, '002003', NULL, 4757613);
INSERT INTO `media_files` VALUES ('09694bd86132e788e26beee7f7a9c22d', 1232141425, NULL, 't01da326341117f63ea.jpg', '001001', NULL, 'mediafiles', '2023/08/18/09694bd86132e788e26beee7f7a9c22d.jpg', '09694bd86132e788e26beee7f7a9c22d', '/mediafiles/2023/08/18/09694bd86132e788e26beee7f7a9c22d.jpg', NULL, '2023-08-18 15:34:40', NULL, '1', NULL, '002003', NULL, 63405);
INSERT INTO `media_files` VALUES ('0c492e132265b6c324f80415c6d915bf', 1232141425, NULL, '04 程序的内存模型-内存四区-堆区.mp4', '001002', '视频文件', 'video', '0/c/0c492e132265b6c324f80415c6d915bf/0c492e132265b6c324f80415c6d915bf.mp4', '0c492e132265b6c324f80415c6d915bf', '/video/0/c/0c492e132265b6c324f80415c6d915bf/0c492e132265b6c324f80415c6d915bf.mp4', NULL, '2023-08-16 15:12:15', NULL, '1', NULL, '002003', NULL, 19346579);
INSERT INTO `media_files` VALUES ('0e45e04171f8b7ba13d47738a40ab858', 1232141425, NULL, 'OIP-C (2).jpg', '001001', NULL, 'mediafiles', '2023/08/31/0e45e04171f8b7ba13d47738a40ab858.jpg', '0e45e04171f8b7ba13d47738a40ab858', '/mediafiles/2023/08/31/0e45e04171f8b7ba13d47738a40ab858.jpg', NULL, '2023-08-31 16:25:56', NULL, '1', NULL, '002003', NULL, 33835);
INSERT INTO `media_files` VALUES ('0fae7e74c084eab6b8198477b2457b11', 1232141425, NULL, 't01023b00e5225a9e5f.jpg', '001001', NULL, 'mediafiles', '2023/08/18/0fae7e74c084eab6b8198477b2457b11.jpg', '0fae7e74c084eab6b8198477b2457b11', '/mediafiles/2023/08/18/0fae7e74c084eab6b8198477b2457b11.jpg', NULL, '2023-08-18 15:35:10', NULL, '1', NULL, '002003', NULL, 26589);
INSERT INTO `media_files` VALUES ('101e5719a21b1ef808dc03e12a58e8d7', 1232141425, NULL, 'coursepublish295229467802738990.html', '001001', NULL, 'mediafiles', '2023/08/31/101e5719a21b1ef808dc03e12a58e8d7.html', '101e5719a21b1ef808dc03e12a58e8d7', '/mediafiles/2023/08/31/101e5719a21b1ef808dc03e12a58e8d7.html', NULL, '2023-08-31 16:22:58', NULL, '1', NULL, '002003', NULL, 34333);
INSERT INTO `media_files` VALUES ('10b4d1cd592662bf9c7f3bd760f355d1', 1232141425, NULL, '谷粒学苑和尚医通项微信不能登录解决.txt', '001002', '视频文件', 'video', '1/0/10b4d1cd592662bf9c7f3bd760f355d1/10b4d1cd592662bf9c7f3bd760f355d1.txt', '10b4d1cd592662bf9c7f3bd760f355d1', '/video/1/0/10b4d1cd592662bf9c7f3bd760f355d1/10b4d1cd592662bf9c7f3bd760f355d1.txt', NULL, '2023-09-06 09:15:25', NULL, '1', NULL, '002003', NULL, 979);
INSERT INTO `media_files` VALUES ('112fcf8e929dfb10e7bb2875f18226ec', 1232141425, NULL, '10 C中的引用-引用的本质.mp4', '001002', '视频文件', 'video', '1/1/112fcf8e929dfb10e7bb2875f18226ec/112fcf8e929dfb10e7bb2875f18226ec.mp4', '112fcf8e929dfb10e7bb2875f18226ec', '/video/1/1/112fcf8e929dfb10e7bb2875f18226ec/112fcf8e929dfb10e7bb2875f18226ec.mp4', NULL, '2023-08-16 15:12:41', NULL, '1', NULL, '002003', NULL, 13175478);
INSERT INTO `media_files` VALUES ('12ec4738cf8f77a324452f044c006706', 1232141425, NULL, 'coursepublish6994554768140456084.html', '001001', NULL, 'mediafiles', '2023/08/18/12ec4738cf8f77a324452f044c006706.html', '12ec4738cf8f77a324452f044c006706', '/mediafiles/2023/08/18/12ec4738cf8f77a324452f044c006706.html', NULL, '2023-08-18 15:06:58', NULL, '1', NULL, '002003', NULL, 34725);
INSERT INTO `media_files` VALUES ('12f0381947a630e19346e8c23d038133', 1232141425, NULL, '10 数据类型-实型.mp4', '001002', '视频文件', 'video', '1/2/12f0381947a630e19346e8c23d038133/12f0381947a630e19346e8c23d038133.mp4', '12f0381947a630e19346e8c23d038133', '/video/1/2/12f0381947a630e19346e8c23d038133/12f0381947a630e19346e8c23d038133.mp4', NULL, '2023-08-16 15:11:32', NULL, '1', NULL, '002003', NULL, 22289090);
INSERT INTO `media_files` VALUES ('1697af17ca6a781f8e2ba6c7005cee77', 1232141425, NULL, '07 标识符命名规则.mp4', '001002', '视频文件', 'video', '1/6/1697af17ca6a781f8e2ba6c7005cee77/1697af17ca6a781f8e2ba6c7005cee77.mp4', '1697af17ca6a781f8e2ba6c7005cee77', '/video/1/6/1697af17ca6a781f8e2ba6c7005cee77/1697af17ca6a781f8e2ba6c7005cee77.mp4', NULL, '2023-08-16 15:11:21', NULL, '1', NULL, '002003', NULL, 24474880);
INSERT INTO `media_files` VALUES ('189ce9625954594c700e3bb5b3342d3b', 1232141425, NULL, '20 机房预约系统-查看账号功能实现.mp4', '001002', '视频文件', 'video', '1/8/189ce9625954594c700e3bb5b3342d3b/189ce9625954594c700e3bb5b3342d3b.mp4', '189ce9625954594c700e3bb5b3342d3b', '/video/1/8/189ce9625954594c700e3bb5b3342d3b/189ce9625954594c700e3bb5b3342d3b.mp4', NULL, '2023-08-15 14:14:05', NULL, '1', NULL, '002003', NULL, 22045997);
INSERT INTO `media_files` VALUES ('207f425c227ea20b0b893a3c37ecaab2', 1232141425, NULL, 'coursepublish5166714784826714580.html', '001001', NULL, 'mediafiles', '2023/09/01/207f425c227ea20b0b893a3c37ecaab2.html', '207f425c227ea20b0b893a3c37ecaab2', '/mediafiles/2023/09/01/207f425c227ea20b0b893a3c37ecaab2.html', NULL, '2023-09-01 14:18:54', NULL, '1', NULL, '002003', NULL, 34329);
INSERT INTO `media_files` VALUES ('287cdd91c5d444e0752b626cbd95b41c', 1232141425, NULL, 'nacos01.mp4', '001002', '课程视频', 'video', '2/8/287cdd91c5d444e0752b626cbd95b41c/287cdd91c5d444e0752b626cbd95b41c.mp4', '287cdd91c5d444e0752b626cbd95b41c', '/video/2/8/287cdd91c5d444e0752b626cbd95b41c/287cdd91c5d444e0752b626cbd95b41c.mp4', NULL, '2022-09-14 18:28:43', NULL, '1', '', '002003', NULL, 25953447);
INSERT INTO `media_files` VALUES ('2f6a1733bad84a390509078f5e974eff', 1232141425, NULL, '44 STL案例1-评委打分.avi', '001002', '视频文件', 'video', '2/f/2f6a1733bad84a390509078f5e974eff/2f6a1733bad84a390509078f5e974eff.avi', '2f6a1733bad84a390509078f5e974eff', '/video/2/f/2f6a1733bad84a390509078f5e974eff/2f6a1733bad84a390509078f5e974eff.avi', NULL, '2023-09-04 09:18:54', NULL, '1', NULL, '002003', NULL, 117130240);
INSERT INTO `media_files` VALUES ('36380e4c904799cb72225e2982151314', 1232141425, NULL, 'coursepublish258866524253317584.html', '001001', NULL, 'mediafiles', '2023/08/31/36380e4c904799cb72225e2982151314.html', '36380e4c904799cb72225e2982151314', '/mediafiles/2023/08/31/36380e4c904799cb72225e2982151314.html', NULL, '2023-08-31 13:36:27', NULL, '1', NULL, '002003', NULL, 34811);
INSERT INTO `media_files` VALUES ('3998f7b3da377417ad612b53bc5d449c', 1232141425, NULL, 'R-C (1).jpg', '001001', NULL, 'mediafiles', '2023/08/18/3998f7b3da377417ad612b53bc5d449c.jpg', '3998f7b3da377417ad612b53bc5d449c', '/mediafiles/2023/08/18/3998f7b3da377417ad612b53bc5d449c.jpg', NULL, '2023-08-18 15:34:04', NULL, '1', NULL, '002003', NULL, 1411503);
INSERT INTO `media_files` VALUES ('400a88ebabe5ce247696574b6e75bc9c', 1232141425, NULL, '01 职工管理系统-需求分析以及案例展示.mp4', '001002', '视频文件', 'video', '4/0/400a88ebabe5ce247696574b6e75bc9c/400a88ebabe5ce247696574b6e75bc9c.mp4', '400a88ebabe5ce247696574b6e75bc9c', '/video/4/0/400a88ebabe5ce247696574b6e75bc9c/400a88ebabe5ce247696574b6e75bc9c.mp4', NULL, '2023-08-21 16:11:56', NULL, '1', NULL, '002003', NULL, 19892206);
INSERT INTO `media_files` VALUES ('48341cd7cc155e47da1dac470fd7d2ee', 1232141425, NULL, '175.html', '001001', NULL, 'mediafiles', '2023/09/01/48341cd7cc155e47da1dac470fd7d2ee.html', '48341cd7cc155e47da1dac470fd7d2ee', '/mediafiles/2023/09/01/48341cd7cc155e47da1dac470fd7d2ee.html', NULL, '2023-09-01 09:58:25', NULL, '1', NULL, '002003', NULL, 216805);
INSERT INTO `media_files` VALUES ('49d21db3fc31d5c05dd2e585d5eeed78', 1232141425, NULL, '09 数据类型-sizeof关键字.mp4', '001002', '视频文件', 'video', '4/9/49d21db3fc31d5c05dd2e585d5eeed78/49d21db3fc31d5c05dd2e585d5eeed78.mp4', '49d21db3fc31d5c05dd2e585d5eeed78', '/video/4/9/49d21db3fc31d5c05dd2e585d5eeed78/49d21db3fc31d5c05dd2e585d5eeed78.mp4', NULL, '2023-08-16 15:11:27', NULL, '1', NULL, '002003', NULL, 19717312);
INSERT INTO `media_files` VALUES ('4aa249d04cbd2218d496e9246f7d8cb7', 1232141425, NULL, '02 程序的内存模型-内存四区-全局区.mp4', '001002', '视频文件', 'video', '4/a/4aa249d04cbd2218d496e9246f7d8cb7/4aa249d04cbd2218d496e9246f7d8cb7.mp4', '4aa249d04cbd2218d496e9246f7d8cb7', '/video/4/a/4aa249d04cbd2218d496e9246f7d8cb7/4aa249d04cbd2218d496e9246f7d8cb7.mp4', NULL, '2023-08-16 15:12:15', NULL, '1', NULL, '002003', NULL, 48176806);
INSERT INTO `media_files` VALUES ('4c784b7b29ab90753df508d32ed87320', 1232141425, NULL, 'coursepublish3234210255423524458.html', '001001', NULL, 'mediafiles', '2023/08/18/4c784b7b29ab90753df508d32ed87320.html', '4c784b7b29ab90753df508d32ed87320', '/mediafiles/2023/08/18/4c784b7b29ab90753df508d32ed87320.html', NULL, '2023-08-18 16:20:58', NULL, '1', NULL, '002003', NULL, 34254);
INSERT INTO `media_files` VALUES ('4cd114c16928a28ddce1b3325f33f023', 1232141425, NULL, '990884114-1-192.mp4', '001002', '视频文件', 'video', '4/c/4cd114c16928a28ddce1b3325f33f023/4cd114c16928a28ddce1b3325f33f023.mp4', '4cd114c16928a28ddce1b3325f33f023', '/video/4/c/4cd114c16928a28ddce1b3325f33f023/4cd114c16928a28ddce1b3325f33f023.mp4', NULL, '2023-08-29 09:51:53', NULL, '1', NULL, '002003', NULL, 193916595);
INSERT INTO `media_files` VALUES ('52ac388f85c2330b94c7c4824c694869', 1232141425, NULL, 'coursepublish4521244061210300693.html', '001001', NULL, 'mediafiles', '2023/08/18/52ac388f85c2330b94c7c4824c694869.html', '52ac388f85c2330b94c7c4824c694869', '/mediafiles/2023/08/18/52ac388f85c2330b94c7c4824c694869.html', NULL, '2023-08-18 08:35:44', NULL, '1', NULL, '002003', NULL, 34204);
INSERT INTO `media_files` VALUES ('5667fcff0269e16e131223e2d26e211d', 1232141425, NULL, '05 程序的内存模型-new运算符.mp4', '001002', '视频文件', 'video', '5/6/5667fcff0269e16e131223e2d26e211d/5667fcff0269e16e131223e2d26e211d.mp4', '5667fcff0269e16e131223e2d26e211d', '/video/5/6/5667fcff0269e16e131223e2d26e211d/5667fcff0269e16e131223e2d26e211d.mp4', NULL, '2023-08-16 15:12:19', NULL, '1', NULL, '002003', NULL, 31402802);
INSERT INTO `media_files` VALUES ('5a3ebb73b906cfb1189ac0323d75f09e', 1232141425, NULL, 't01c1dd5e59d534b6d1.jpg', '001001', NULL, 'mediafiles', '2023/08/29/5a3ebb73b906cfb1189ac0323d75f09e.jpg', '5a3ebb73b906cfb1189ac0323d75f09e', '/mediafiles/2023/08/29/5a3ebb73b906cfb1189ac0323d75f09e.jpg', NULL, '2023-08-29 08:40:17', NULL, '1', NULL, '002003', NULL, 20684);
INSERT INTO `media_files` VALUES ('60eef818f693ce3cd1627f25be57543f', 1232141425, NULL, 'fab31cb375d7997b3f2663ebf9dade49600fd965.png', '001001', NULL, 'mediafiles', '2023/09/01/60eef818f693ce3cd1627f25be57543f.png', '60eef818f693ce3cd1627f25be57543f', '/mediafiles/2023/09/01/60eef818f693ce3cd1627f25be57543f.png', NULL, '2023-09-01 14:16:35', NULL, '1', NULL, '002003', NULL, 330651);
INSERT INTO `media_files` VALUES ('619e84c6fa2fee6a7cb3ce1efb86746f', 1232141425, NULL, 'coursepublish1920865250315019771.html', '001001', NULL, 'mediafiles', '2023/08/21/619e84c6fa2fee6a7cb3ce1efb86746f.html', '619e84c6fa2fee6a7cb3ce1efb86746f', '/mediafiles/2023/08/21/619e84c6fa2fee6a7cb3ce1efb86746f.html', NULL, '2023-08-21 08:21:48', NULL, '1', NULL, '002003', NULL, 34216);
INSERT INTO `media_files` VALUES ('64bba374d9ea2110fa29eff30d161f1f', 1232141425, NULL, 'C++开发环境搭建.avi', '001002', '视频文件', 'video', '6/4/64bba374d9ea2110fa29eff30d161f1f/64bba374d9ea2110fa29eff30d161f1f.avi', '64bba374d9ea2110fa29eff30d161f1f', '/video/6/4/64bba374d9ea2110fa29eff30d161f1f/64bba374d9ea2110fa29eff30d161f1f.mp4', NULL, '2023-08-17 14:26:49', NULL, '1', NULL, '002003', NULL, 77022664);
INSERT INTO `media_files` VALUES ('67cfdf90213190222e4413f501110c10', 1232141425, NULL, '01 程序的内存模型-内存四区-代码区..mp4', '001002', '视频文件', 'video', '6/7/67cfdf90213190222e4413f501110c10/67cfdf90213190222e4413f501110c10.mp4', '67cfdf90213190222e4413f501110c10', '/video/6/7/67cfdf90213190222e4413f501110c10/67cfdf90213190222e4413f501110c10.mp4', NULL, '2023-08-16 15:11:59', NULL, '1', NULL, '002003', NULL, 13316190);
INSERT INTO `media_files` VALUES ('6c003a3f0ed95130ff4eccc704bd7ce1', 1232141425, NULL, '05 职工管理系统-退出系统功能实现.mp4', '001002', '视频文件', 'video', '6/c/6c003a3f0ed95130ff4eccc704bd7ce1/6c003a3f0ed95130ff4eccc704bd7ce1.mp4', '6c003a3f0ed95130ff4eccc704bd7ce1', '/video/6/c/6c003a3f0ed95130ff4eccc704bd7ce1/6c003a3f0ed95130ff4eccc704bd7ce1.mp4', NULL, '2023-08-21 16:12:00', NULL, '1', NULL, '002003', NULL, 26163390);
INSERT INTO `media_files` VALUES ('6f6605553f809fc0442246dd8d7754ec', 1232141425, NULL, '08 C++中的引用-引用做函数参数.mp4', '001002', '视频文件', 'video', '6/f/6f6605553f809fc0442246dd8d7754ec/6f6605553f809fc0442246dd8d7754ec.mp4', '6f6605553f809fc0442246dd8d7754ec', '/video/6/f/6f6605553f809fc0442246dd8d7754ec/6f6605553f809fc0442246dd8d7754ec.mp4', NULL, '2023-08-16 15:12:44', NULL, '1', NULL, '002003', NULL, 29307563);
INSERT INTO `media_files` VALUES ('7754e8a6d5a2d86461f774b49f0a7ea8', 1232141425, NULL, '24 类和对象-对象特性-函数的分类以及调用.avi', '001002', '视频文件', 'video', '7/7/7754e8a6d5a2d86461f774b49f0a7ea8/7754e8a6d5a2d86461f774b49f0a7ea8.avi', '7754e8a6d5a2d86461f774b49f0a7ea8', '/video/7/7/7754e8a6d5a2d86461f774b49f0a7ea8/7754e8a6d5a2d86461f774b49f0a7ea8.mp4', NULL, '2023-08-29 09:08:42', NULL, '1', NULL, '002003', NULL, 116862464);
INSERT INTO `media_files` VALUES ('79597d82caa0c865e8dc4f429b946690', 1232141425, NULL, '5.docx', '001002', '视频文件', 'video', '7/9/79597d82caa0c865e8dc4f429b946690/79597d82caa0c865e8dc4f429b946690.docx', '79597d82caa0c865e8dc4f429b946690', '/video/7/9/79597d82caa0c865e8dc4f429b946690/79597d82caa0c865e8dc4f429b946690.docx', NULL, '2023-09-06 10:31:39', NULL, '1', NULL, '002003', NULL, 4140587);
INSERT INTO `media_files` VALUES ('7a7dee1a52f52f6a129a3a746428b21f', 1232141425, NULL, '30 程序流程结构-选择结构-switch语句.mp4', '001002', '视频文件', 'video', '7/a/7a7dee1a52f52f6a129a3a746428b21f/7a7dee1a52f52f6a129a3a746428b21f.mp4', '7a7dee1a52f52f6a129a3a746428b21f', '/video/7/a/7a7dee1a52f52f6a129a3a746428b21f/7a7dee1a52f52f6a129a3a746428b21f.mp4', NULL, '2023-08-16 10:42:52', NULL, '1', NULL, '002003', NULL, 33843408);
INSERT INTO `media_files` VALUES ('7af6c3646b0e12486a6d585350eaec46', 1232141425, NULL, '60 类和对象-多态-案例3-电脑组装具体实现.mp4', '001002', '视频文件', 'video', '7/a/7af6c3646b0e12486a6d585350eaec46/7af6c3646b0e12486a6d585350eaec46.mp4', '7af6c3646b0e12486a6d585350eaec46', '/video/7/a/7af6c3646b0e12486a6d585350eaec46/7af6c3646b0e12486a6d585350eaec46.mp4', NULL, '2023-09-06 13:24:56', NULL, '1', NULL, '002003', NULL, 45215374);
INSERT INTO `media_files` VALUES ('8223e7e484ec228cbd5769e83a53d13f', 1232141425, NULL, '测试.ppt', '001002', '视频文件', 'video', '8/2/8223e7e484ec228cbd5769e83a53d13f/8223e7e484ec228cbd5769e83a53d13f.ppt', '8223e7e484ec228cbd5769e83a53d13f', '/video/8/2/8223e7e484ec228cbd5769e83a53d13f/8223e7e484ec228cbd5769e83a53d13f.ppt', NULL, '2023-09-06 10:58:11', NULL, '1', NULL, '002003', NULL, 20992);
INSERT INTO `media_files` VALUES ('86950d4cf0b7aa1e1af9754f835da840', 1232141425, NULL, 't011b1614b238491672.jpg', '001001', NULL, 'mediafiles', '2023/08/18/86950d4cf0b7aa1e1af9754f835da840.jpg', '86950d4cf0b7aa1e1af9754f835da840', '/mediafiles/2023/08/18/86950d4cf0b7aa1e1af9754f835da840.jpg', NULL, '2023-08-18 15:34:49', NULL, '1', NULL, '002003', NULL, 15321);
INSERT INTO `media_files` VALUES ('86c6c0021dd2d1a5c26cdbdc54459a32', 1232141425, NULL, 'C++1.0.mp4', '001002', '视频文件', 'video', '8/6/86c6c0021dd2d1a5c26cdbdc54459a32/86c6c0021dd2d1a5c26cdbdc54459a32.mp4', '86c6c0021dd2d1a5c26cdbdc54459a32', '/video/8/6/86c6c0021dd2d1a5c26cdbdc54459a32/86c6c0021dd2d1a5c26cdbdc54459a32.mp4', NULL, '2023-08-28 16:55:23', NULL, '1', NULL, '002003', NULL, 1973084);
INSERT INTO `media_files` VALUES ('87584d27865fcac9e4c49d10cc36e5d5', 1232141425, NULL, 'coursepublish8184601919423797635.html', '001001', NULL, 'mediafiles', '2023/08/31/87584d27865fcac9e4c49d10cc36e5d5.html', '87584d27865fcac9e4c49d10cc36e5d5', '/mediafiles/2023/08/31/87584d27865fcac9e4c49d10cc36e5d5.html', NULL, '2023-08-31 16:18:57', NULL, '1', NULL, '002003', NULL, 34333);
INSERT INTO `media_files` VALUES ('87bf3b5fc130e8a6602f8fff3f51a056', 1232141425, NULL, 'OIP-1C.jpg', '001001', NULL, 'mediafiles', '2023/09/01/87bf3b5fc130e8a6602f8fff3f51a056.jpg', '87bf3b5fc130e8a6602f8fff3f51a056', '/mediafiles/2023/09/01/87bf3b5fc130e8a6602f8fff3f51a056.jpg', NULL, '2023-09-01 10:09:27', NULL, '1', NULL, '002003', NULL, 4839);
INSERT INTO `media_files` VALUES ('88ee0c88cf6c92cfa0250b8cbbc9991d', 1232141425, NULL, '45 类和对象-继承-基本语法.avi', '001002', '视频文件', 'video', '8/8/88ee0c88cf6c92cfa0250b8cbbc9991d/88ee0c88cf6c92cfa0250b8cbbc9991d.avi', '88ee0c88cf6c92cfa0250b8cbbc9991d', '/video/8/8/88ee0c88cf6c92cfa0250b8cbbc9991d/88ee0c88cf6c92cfa0250b8cbbc9991d.mp4', NULL, '2023-08-29 09:10:05', NULL, '1', NULL, '002003', NULL, 179026944);
INSERT INTO `media_files` VALUES ('90291c89550ea4b5f7a9ca69a4e0832a', 1232141425, NULL, 'coursepublish7706992571204181589.html', '001001', NULL, 'mediafiles', '2023/08/31/90291c89550ea4b5f7a9ca69a4e0832a.html', '90291c89550ea4b5f7a9ca69a4e0832a', '/mediafiles/2023/08/31/90291c89550ea4b5f7a9ca69a4e0832a.html', NULL, '2023-08-31 13:42:07', NULL, '1', NULL, '002003', NULL, 34173);
INSERT INTO `media_files` VALUES ('92d9496a2ea427fa3909af9d18bac7c8', 1232141425, NULL, 'coursepublish9204897059773032605.html', '001001', NULL, 'mediafiles', '2023/09/01/92d9496a2ea427fa3909af9d18bac7c8.html', '92d9496a2ea427fa3909af9d18bac7c8', '/mediafiles/2023/09/01/92d9496a2ea427fa3909af9d18bac7c8.html', NULL, '2023-09-01 16:12:08', NULL, '1', NULL, '002003', NULL, 33942);
INSERT INTO `media_files` VALUES ('93efb1779bfb7902ed56cf21b8270acb', 1232141425, NULL, 'OIP-C.jpg', '001001', NULL, 'mediafiles', '2023/08/18/93efb1779bfb7902ed56cf21b8270acb.jpg', '93efb1779bfb7902ed56cf21b8270acb', '/mediafiles/2023/08/18/93efb1779bfb7902ed56cf21b8270acb.jpg', NULL, '2023-08-18 08:34:41', NULL, '1', NULL, '002003', NULL, 18354);
INSERT INTO `media_files` VALUES ('97dc77cf3360751bd53b1f5f592a75ac', 1232141425, NULL, 't018e0c51f228edcf34.jpg', '001001', NULL, 'mediafiles', '2023/08/18/97dc77cf3360751bd53b1f5f592a75ac.jpg', '97dc77cf3360751bd53b1f5f592a75ac', '/mediafiles/2023/08/18/97dc77cf3360751bd53b1f5f592a75ac.jpg', NULL, '2023-08-18 15:35:02', NULL, '1', NULL, '002003', NULL, 11718);
INSERT INTO `media_files` VALUES ('a022f8e41958756f25306e020ea77a16', 1232141425, NULL, '18  演讲比赛流程管理系统-清空记录功能实现.mp4', '001002', '视频文件', 'video', 'a/0/a022f8e41958756f25306e020ea77a16/a022f8e41958756f25306e020ea77a16.mp4', 'a022f8e41958756f25306e020ea77a16', '/video/a/0/a022f8e41958756f25306e020ea77a16/a022f8e41958756f25306e020ea77a16.mp4', NULL, '2023-09-04 09:17:49', NULL, '1', NULL, '002003', NULL, 22942526);
INSERT INTO `media_files` VALUES ('a09b74038b96650d2185f8e947abd210', 1232141425, NULL, '测试.pdf', '001002', '视频文件', 'video', 'a/0/a09b74038b96650d2185f8e947abd210/a09b74038b96650d2185f8e947abd210.pdf', 'a09b74038b96650d2185f8e947abd210', '/video/a/0/a09b74038b96650d2185f8e947abd210/a09b74038b96650d2185f8e947abd210.pdf', NULL, '2023-09-06 10:57:54', NULL, '1', NULL, '002003', NULL, 967);
INSERT INTO `media_files` VALUES ('a1996295a9338ef654169a05ed03e680', 1232141425, NULL, 'coursepublish1763731334620147493.html', '001001', NULL, 'mediafiles', '2023/09/01/a1996295a9338ef654169a05ed03e680.html', 'a1996295a9338ef654169a05ed03e680', '/mediafiles/2023/09/01/a1996295a9338ef654169a05ed03e680.html', NULL, '2023-09-01 10:22:53', NULL, '1', NULL, '002003', NULL, 34464);
INSERT INTO `media_files` VALUES ('a4731e23e44a233690a66489bfb4a0c1', 1232141425, NULL, 'R-C.jpg', '001001', NULL, 'mediafiles', '2023/08/18/a4731e23e44a233690a66489bfb4a0c1.jpg', 'a4731e23e44a233690a66489bfb4a0c1', '/mediafiles/2023/08/18/a4731e23e44a233690a66489bfb4a0c1.jpg', NULL, '2023-08-18 15:34:32', NULL, '1', NULL, '002003', NULL, 50958);
INSERT INTO `media_files` VALUES ('a6fb4fc7faf1d3d0831819969529b888', 1232141425, NULL, '1.项目背景.mp4', '001002', '课程视频', 'video', NULL, 'a6fb4fc7faf1d3d0831819969529b888', '/video/a/6/a6fb4fc7faf1d3d0831819969529b888/a6fb4fc7faf1d3d0831819969529b888.mp4', NULL, '2022-10-13 21:30:17', NULL, '1', '', '002003', NULL, NULL);
INSERT INTO `media_files` VALUES ('a83976f2a808aa543c4da53b70497aae', 1232141425, NULL, '3.mp4', '001002', '视频文件', 'video', 'a/8/a83976f2a808aa543c4da53b70497aae/a83976f2a808aa543c4da53b70497aae.mp4', 'a83976f2a808aa543c4da53b70497aae', '/video/a/8/a83976f2a808aa543c4da53b70497aae/a83976f2a808aa543c4da53b70497aae.mp4', NULL, '2023-08-28 16:55:29', NULL, '1', NULL, '002003', NULL, 97752373);
INSERT INTO `media_files` VALUES ('aae2370590e6e9226767aa32191d7215', 1232141425, NULL, '939c2d40b6f391876dce207324fce186252fef65.png', '001001', NULL, 'mediafiles', '2023/09/07/aae2370590e6e9226767aa32191d7215.png', 'aae2370590e6e9226767aa32191d7215', '/mediafiles/2023/09/07/aae2370590e6e9226767aa32191d7215.png', NULL, '2023-09-07 08:16:46', NULL, '1', NULL, '002003', NULL, 103635);
INSERT INTO `media_files` VALUES ('af52b24f9c75bce3f49e9956d22fdebb', 1232141425, NULL, '01 课程安排.mp4', '001002', '视频文件', 'video', 'a/f/af52b24f9c75bce3f49e9956d22fdebb/af52b24f9c75bce3f49e9956d22fdebb.mp4', 'af52b24f9c75bce3f49e9956d22fdebb', '/video/a/f/af52b24f9c75bce3f49e9956d22fdebb/af52b24f9c75bce3f49e9956d22fdebb.mp4', NULL, '2023-08-16 15:06:54', NULL, '1', NULL, '002003', NULL, 3932175);
INSERT INTO `media_files` VALUES ('b33374fc21f8ce98ec3460bc894d16de', 1232141425, NULL, '05 常量-常量与变量的区别-常量的使用.mp4', '001002', '视频文件', 'video', 'b/3/b33374fc21f8ce98ec3460bc894d16de/b33374fc21f8ce98ec3460bc894d16de.mp4', 'b33374fc21f8ce98ec3460bc894d16de', '/video/b/3/b33374fc21f8ce98ec3460bc894d16de/b33374fc21f8ce98ec3460bc894d16de.mp4', NULL, '2023-08-16 15:07:18', NULL, '1', NULL, '002003', NULL, 20135540);
INSERT INTO `media_files` VALUES ('b5054ec82da3a307cdd33237f099be52', 1232141425, NULL, '06 C++中的引用-引用的基本语法.mp4', '001002', '视频文件', 'video', 'b/5/b5054ec82da3a307cdd33237f099be52/b5054ec82da3a307cdd33237f099be52.mp4', 'b5054ec82da3a307cdd33237f099be52', '/video/b/5/b5054ec82da3a307cdd33237f099be52/b5054ec82da3a307cdd33237f099be52.mp4', NULL, '2023-08-16 15:12:21', NULL, '1', NULL, '002003', NULL, 13636542);
INSERT INTO `media_files` VALUES ('b50839a3012540e8691d15d9f129448f', 1232141425, NULL, '202105212154047099.jpg', '001001', NULL, 'mediafiles', '2023/09/01/b50839a3012540e8691d15d9f129448f.jpg', 'b50839a3012540e8691d15d9f129448f', '/mediafiles/2023/09/01/b50839a3012540e8691d15d9f129448f.jpg', NULL, '2023-09-01 16:10:56', NULL, '1', NULL, '002003', NULL, 33771);
INSERT INTO `media_files` VALUES ('b871bef826b173167b462faee97f9832', 1232141425, NULL, 't0135aaeb3bbaec2c86.jpg', '001001', NULL, 'mediafiles', '2023/08/18/b871bef826b173167b462faee97f9832.jpg', 'b871bef826b173167b462faee97f9832', '/mediafiles/2023/08/18/b871bef826b173167b462faee97f9832.jpg', NULL, '2023-08-18 16:20:09', NULL, '1', NULL, '002003', NULL, 5458);
INSERT INTO `media_files` VALUES ('bd9214ee5e6f12cbe934ed9d3a82d21b', 1232141425, NULL, 'test.avi', '001002', '视频文件', 'video', 'b/d/bd9214ee5e6f12cbe934ed9d3a82d21b/bd9214ee5e6f12cbe934ed9d3a82d21b.avi', 'bd9214ee5e6f12cbe934ed9d3a82d21b', '/video/b/d/bd9214ee5e6f12cbe934ed9d3a82d21b/bd9214ee5e6f12cbe934ed9d3a82d21b.mp4', NULL, '2023-08-28 17:02:27', NULL, '1', NULL, '002003', NULL, 11082532);
INSERT INTO `media_files` VALUES ('c27cda0816055f3ec4dc50ad4bb71a91', 1232141425, NULL, '03 程序的内存模型-内存四区-栈区.mp4', '001002', '视频文件', 'video', 'c/2/c27cda0816055f3ec4dc50ad4bb71a91/c27cda0816055f3ec4dc50ad4bb71a91.mp4', 'c27cda0816055f3ec4dc50ad4bb71a91', '/video/c/2/c27cda0816055f3ec4dc50ad4bb71a91/c27cda0816055f3ec4dc50ad4bb71a91.mp4', NULL, '2023-08-16 15:12:11', NULL, '1', NULL, '002003', NULL, 21380475);
INSERT INTO `media_files` VALUES ('c4269c552a8b2dc92450e54ae6dd4673', 1232141425, NULL, '1.png', '001001', NULL, 'mediafiles', '2023/08/16/c4269c552a8b2dc92450e54ae6dd4673.png', 'c4269c552a8b2dc92450e54ae6dd4673', '/mediafiles/2023/08/16/c4269c552a8b2dc92450e54ae6dd4673.png', NULL, '2023-08-16 15:23:37', NULL, '1', NULL, '002003', NULL, 250059);
INSERT INTO `media_files` VALUES ('cd49cb4cba571b36a08c69e3a2bf0cbb', 1232141425, NULL, '在线学习平台的设计与实现-大学生.docx', '001002', '视频文件', 'video', 'c/d/cd49cb4cba571b36a08c69e3a2bf0cbb/cd49cb4cba571b36a08c69e3a2bf0cbb.docx', 'cd49cb4cba571b36a08c69e3a2bf0cbb', '/video/c/d/cd49cb4cba571b36a08c69e3a2bf0cbb/cd49cb4cba571b36a08c69e3a2bf0cbb.docx', NULL, '2023-09-06 10:58:20', NULL, '1', NULL, '002003', NULL, 19029);
INSERT INTO `media_files` VALUES ('ceb085f3cd104c4676d32bf96cd6bb35', 1232141425, NULL, 'coursepublish6235705294937953147.html', '001001', NULL, 'mediafiles', '2023/08/31/ceb085f3cd104c4676d32bf96cd6bb35.html', 'ceb085f3cd104c4676d32bf96cd6bb35', '/mediafiles/2023/08/31/ceb085f3cd104c4676d32bf96cd6bb35.html', NULL, '2023-08-31 14:06:57', NULL, '1', NULL, '002003', NULL, 34172);
INSERT INTO `media_files` VALUES ('d11fd4792f5a74dc39e5db906077de06', 1232141425, NULL, '09 C++中的引用-引用做函数返回值.mp4', '001002', '视频文件', 'video', 'd/1/d11fd4792f5a74dc39e5db906077de06/d11fd4792f5a74dc39e5db906077de06.mp4', 'd11fd4792f5a74dc39e5db906077de06', '/video/d/1/d11fd4792f5a74dc39e5db906077de06/d11fd4792f5a74dc39e5db906077de06.mp4', NULL, '2023-08-16 15:12:45', NULL, '1', NULL, '002003', NULL, 33256098);
INSERT INTO `media_files` VALUES ('d38392eb9100d53ddd9aa1e43c3d6f8e', 1232141425, NULL, 'coursepublish3162548141674687901.html', '001001', NULL, 'mediafiles', '2023/08/31/d38392eb9100d53ddd9aa1e43c3d6f8e.html', 'd38392eb9100d53ddd9aa1e43c3d6f8e', '/mediafiles/2023/08/31/d38392eb9100d53ddd9aa1e43c3d6f8e.html', NULL, '2023-08-31 16:27:27', NULL, '1', NULL, '002003', NULL, 34333);
INSERT INTO `media_files` VALUES ('d96026442db7476aaadd44e3263d72e3', 1232141425, NULL, 't01781b1258713c05f2.jpg', '001001', NULL, 'mediafiles', '2023/08/18/d96026442db7476aaadd44e3263d72e3.jpg', 'd96026442db7476aaadd44e3263d72e3', '/mediafiles/2023/08/18/d96026442db7476aaadd44e3263d72e3.jpg', NULL, '2023-08-18 15:35:19', NULL, '1', NULL, '002003', NULL, 124028);
INSERT INTO `media_files` VALUES ('df74645cf23757ad6492d4fa47172f61', 1232141425, NULL, '2.mp4', '001002', '视频文件', 'video', 'd/f/df74645cf23757ad6492d4fa47172f61/df74645cf23757ad6492d4fa47172f61.mp4', 'df74645cf23757ad6492d4fa47172f61', '/video/d/f/df74645cf23757ad6492d4fa47172f61/df74645cf23757ad6492d4fa47172f61.mp4', NULL, '2023-08-29 08:26:57', NULL, '1', NULL, '002003', NULL, 66019340);
INSERT INTO `media_files` VALUES ('e2e0261d750b7dd397462fea3c3c7c1d', 1232141425, NULL, '02 职工管理系统-创建项目.mp4', '001002', '视频文件', 'video', 'e/2/e2e0261d750b7dd397462fea3c3c7c1d/e2e0261d750b7dd397462fea3c3c7c1d.mp4', 'e2e0261d750b7dd397462fea3c3c7c1d', '/video/e/2/e2e0261d750b7dd397462fea3c3c7c1d/e2e0261d750b7dd397462fea3c3c7c1d.mp4', NULL, '2023-08-21 16:11:55', NULL, '1', NULL, '002003', NULL, 12355045);
INSERT INTO `media_files` VALUES ('e3e958bb8674a0c66b37fb8162733ce5', 1232141425, NULL, '07 C++中的引用-引用的注意事项.mp4', '001002', '视频文件', 'video', 'e/3/e3e958bb8674a0c66b37fb8162733ce5/e3e958bb8674a0c66b37fb8162733ce5.mp4', 'e3e958bb8674a0c66b37fb8162733ce5', '/video/e/3/e3e958bb8674a0c66b37fb8162733ce5/e3e958bb8674a0c66b37fb8162733ce5.mp4', NULL, '2023-08-16 15:12:39', NULL, '1', NULL, '002003', NULL, 18274748);
INSERT INTO `media_files` VALUES ('e89215f74d7fd1d53401b4431fdadae8', 1232141425, NULL, 'OIP-C.jpg', '001001', NULL, 'mediafiles', '2023/08/18/e89215f74d7fd1d53401b4431fdadae8.jpg', 'e89215f74d7fd1d53401b4431fdadae8', '/mediafiles/2023/08/18/e89215f74d7fd1d53401b4431fdadae8.jpg', NULL, '2023-08-18 15:33:55', NULL, '1', NULL, '002003', NULL, 17409);
INSERT INTO `media_files` VALUES ('ec1ee3f54e5f6e7e6f055943fab9341f', 1232141425, NULL, 'coursepublish4020142843931581830.html', '001001', NULL, 'mediafiles', '2023/08/31/ec1ee3f54e5f6e7e6f055943fab9341f.html', 'ec1ee3f54e5f6e7e6f055943fab9341f', '/mediafiles/2023/08/31/ec1ee3f54e5f6e7e6f055943fab9341f.html', NULL, '2023-08-31 16:04:17', NULL, '1', NULL, '002003', NULL, 34254);
INSERT INTO `media_files` VALUES ('eec02839e87517eb8216dda3d29e7003', 1232141425, NULL, '20 职工管理系统-清空文件实现.mp4', '001002', '视频文件', 'video', 'e/e/eec02839e87517eb8216dda3d29e7003/eec02839e87517eb8216dda3d29e7003.mp4', 'eec02839e87517eb8216dda3d29e7003', '/video/e/e/eec02839e87517eb8216dda3d29e7003/eec02839e87517eb8216dda3d29e7003.mp4', NULL, '2023-08-29 13:29:35', NULL, '1', NULL, '002003', NULL, 18021672);
INSERT INTO `media_files` VALUES ('f1227238add4c6a7289ac5dabacfcd3f', 1232141425, NULL, '03 程序的注释-单行注释和多行注释.mp4', '001002', '视频文件', 'video', 'f/1/f1227238add4c6a7289ac5dabacfcd3f/f1227238add4c6a7289ac5dabacfcd3f.mp4', 'f1227238add4c6a7289ac5dabacfcd3f', '/video/f/1/f1227238add4c6a7289ac5dabacfcd3f/f1227238add4c6a7289ac5dabacfcd3f.mp4', NULL, '2023-08-16 15:07:04', NULL, '1', NULL, '002003', NULL, 13781508);
INSERT INTO `media_files` VALUES ('f134f9cadb1ed267384133611d5bb59b', 1232141425, NULL, '02 第一个C++程序-C++书写HelloWorld.mp4', '001002', '视频文件', 'video', 'f/1/f134f9cadb1ed267384133611d5bb59b/f134f9cadb1ed267384133611d5bb59b.mp4', 'f134f9cadb1ed267384133611d5bb59b', '/video/f/1/f134f9cadb1ed267384133611d5bb59b/f134f9cadb1ed267384133611d5bb59b.mp4', NULL, '2023-08-16 15:07:03', NULL, '1', NULL, '002003', NULL, 24976801);
INSERT INTO `media_files` VALUES ('f1e2e83dec98082f877138d28a1cfb6e', 1232141425, NULL, '22 类和对象-封装-设计案例2-点和圆关系.avi', '001002', '视频文件', 'video', 'f/1/f1e2e83dec98082f877138d28a1cfb6e/f1e2e83dec98082f877138d28a1cfb6e.avi', 'f1e2e83dec98082f877138d28a1cfb6e', '/video/f/1/f1e2e83dec98082f877138d28a1cfb6e/f1e2e83dec98082f877138d28a1cfb6e.mp4', NULL, '2023-08-29 09:08:10', NULL, '1', NULL, '002003', NULL, 108184576);
INSERT INTO `media_files` VALUES ('f22f84625705da5d6a8957c3bb9112c2', 1232141425, NULL, '04 变量-变量的使用-变量的意义.mp4', '001002', '视频文件', 'video', 'f/2/f22f84625705da5d6a8957c3bb9112c2/f22f84625705da5d6a8957c3bb9112c2.mp4', 'f22f84625705da5d6a8957c3bb9112c2', '/video/f/2/f22f84625705da5d6a8957c3bb9112c2/f22f84625705da5d6a8957c3bb9112c2.mp4', NULL, '2023-08-16 15:07:16', NULL, '1', NULL, '002003', NULL, 11434167);
INSERT INTO `media_files` VALUES ('f3f7293b81ce0ed91d1f65363f028f53', 1232141425, NULL, '20 运算符-比较运算符.mp4', '001002', '视频文件', 'video', 'f/3/f3f7293b81ce0ed91d1f65363f028f53/f3f7293b81ce0ed91d1f65363f028f53.mp4', 'f3f7293b81ce0ed91d1f65363f028f53', '/video/f/3/f3f7293b81ce0ed91d1f65363f028f53/f3f7293b81ce0ed91d1f65363f028f53.mp4', NULL, '2023-08-16 10:20:50', NULL, '1', NULL, '002003', NULL, 10755581);
INSERT INTO `media_files` VALUES ('f7de10f1368452605790ab9c05e15aab', 1232141425, NULL, '08 数据类型-整型.mp4', '001002', '视频文件', 'video', 'f/7/f7de10f1368452605790ab9c05e15aab/f7de10f1368452605790ab9c05e15aab.mp4', 'f7de10f1368452605790ab9c05e15aab', '/video/f/7/f7de10f1368452605790ab9c05e15aab/f7de10f1368452605790ab9c05e15aab.mp4', NULL, '2023-08-16 15:11:25', NULL, '1', NULL, '002003', NULL, 26516344);
INSERT INTO `media_files` VALUES ('f86952e6552fd245a21b76b79031a101', 1232141425, NULL, 'coursepublish6733403348352539192.html', '001001', NULL, 'mediafiles', '2023/08/28/f86952e6552fd245a21b76b79031a101.html', 'f86952e6552fd245a21b76b79031a101', '/mediafiles/2023/08/28/f86952e6552fd245a21b76b79031a101.html', NULL, '2023-08-28 13:13:28', NULL, '1', NULL, '002003', NULL, 34761);
INSERT INTO `media_files` VALUES ('f96ca22bf80947a75c19c69aaee26bb6', 1232141425, NULL, 'OIP-C (1).jpg', '001001', NULL, 'mediafiles', '2023/09/01/f96ca22bf80947a75c19c69aaee26bb6.jpg', 'f96ca22bf80947a75c19c69aaee26bb6', '/mediafiles/2023/09/01/f96ca22bf80947a75c19c69aaee26bb6.jpg', NULL, '2023-09-01 16:04:56', NULL, '1', NULL, '002003', NULL, 21873);
INSERT INTO `media_files` VALUES ('fd241a0cd4fc898994ace2b3d1f44978', 1232141425, NULL, '06 关键字-C++常用的编程关键字.mp4', '001002', '视频文件', 'video', 'f/d/fd241a0cd4fc898994ace2b3d1f44978/fd241a0cd4fc898994ace2b3d1f44978.mp4', 'fd241a0cd4fc898994ace2b3d1f44978', '/video/f/d/fd241a0cd4fc898994ace2b3d1f44978/fd241a0cd4fc898994ace2b3d1f44978.mp4', NULL, '2023-08-16 15:11:13', NULL, '1', NULL, '002003', NULL, 9051801);

-- ----------------------------
-- Table structure for media_process
-- ----------------------------
DROP TABLE IF EXISTS `media_process`;
CREATE TABLE `media_process`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件标识',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `bucket` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存储桶',
  `file_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态,1:未处理，2：处理成功  3处理失败',
  `create_date` datetime NOT NULL COMMENT '上传时间',
  `finish_date` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `fail_count` int NULL DEFAULT 0 COMMENT '失败次数',
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒资文件访问地址',
  `errormsg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_fileid`(`file_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_process
-- ----------------------------
INSERT INTO `media_process` VALUES (1, 'ceb305369d51fc73b3e119afea3a3a44', '62 指针-指针和函数.avi', 'video', 'c/e/ceb305369d51fc73b3e119afea3a3a44/ceb305369d51fc73b3e119afea3a3a44.avi', '3', '2023-08-15 08:52:01', NULL, 3, NULL, '');
INSERT INTO `media_process` VALUES (2, '75d0bfd5b0fc34599f003655bc4b39ef', '11 机房预约系统-登录函数接口封装.avi', 'video', '7/5/75d0bfd5b0fc34599f003655bc4b39ef/75d0bfd5b0fc34599f003655bc4b39ef.avi', '3', '2023-08-15 10:20:18', NULL, 3, NULL, '下载待处理文件失败');
INSERT INTO `media_process` VALUES (3, 'd044eaaca9cb7ebb4ad5c0025889363e', '17 类和对象-封装-案例-设计学生类.avi', 'video', 'd/0/d044eaaca9cb7ebb4ad5c0025889363e/d044eaaca9cb7ebb4ad5c0025889363e.avi', '4', '2023-08-15 10:20:36', NULL, 0, NULL, NULL);
INSERT INTO `media_process` VALUES (4, 'fd15f3d8aa087160e2ac7f2c753a6724', '19 类和对象-封装-c++中class和struct的区别.avi', 'video', 'f/d/fd15f3d8aa087160e2ac7f2c753a6724/fd15f3d8aa087160e2ac7f2c753a6724.avi', '3', '2023-08-15 10:20:39', NULL, 3, NULL, '下载待处理文件失败');
INSERT INTO `media_process` VALUES (5, '64bba374d9ea2110fa29eff30d161f1f', 'C++开发环境搭建.avi', 'video', '6/4/64bba374d9ea2110fa29eff30d161f1f/64bba374d9ea2110fa29eff30d161f1f.avi', '3', '2023-08-17 14:26:49', '2023-08-17 14:29:25', 3, NULL, '处理后视频上传或入库失败');
INSERT INTO `media_process` VALUES (6, 'bd9214ee5e6f12cbe934ed9d3a82d21b', 'test.avi', 'video', 'b/d/bd9214ee5e6f12cbe934ed9d3a82d21b/bd9214ee5e6f12cbe934ed9d3a82d21b.avi', '3', '2023-08-28 17:02:27', '2023-08-28 17:03:27', 3, NULL, '处理后视频上传或入库失败');
INSERT INTO `media_process` VALUES (7, 'f1e2e83dec98082f877138d28a1cfb6e', '22 类和对象-封装-设计案例2-点和圆关系.avi', 'video', 'f/1/f1e2e83dec98082f877138d28a1cfb6e/f1e2e83dec98082f877138d28a1cfb6e.avi', '4', '2023-08-29 09:08:10', '2023-08-29 09:17:11', 2, NULL, '处理后视频上传或入库失败');
INSERT INTO `media_process` VALUES (8, '7754e8a6d5a2d86461f774b49f0a7ea8', '24 类和对象-对象特性-函数的分类以及调用.avi', 'video', '7/7/7754e8a6d5a2d86461f774b49f0a7ea8/7754e8a6d5a2d86461f774b49f0a7ea8.avi', '4', '2023-08-29 09:08:42', '2023-08-29 09:17:19', 1, NULL, '处理后视频上传或入库失败');
INSERT INTO `media_process` VALUES (9, '88ee0c88cf6c92cfa0250b8cbbc9991d', '45 类和对象-继承-基本语法.avi', 'video', '8/8/88ee0c88cf6c92cfa0250b8cbbc9991d/88ee0c88cf6c92cfa0250b8cbbc9991d.avi', '4', '2023-08-29 09:10:05', '2023-08-29 09:16:09', 1, NULL, '处理后视频上传或入库失败');
INSERT INTO `media_process` VALUES (10, '2f6a1733bad84a390509078f5e974eff', '44 STL案例1-评委打分.avi', 'video', '2/f/2f6a1733bad84a390509078f5e974eff/2f6a1733bad84a390509078f5e974eff.avi', '4', '2023-09-04 09:18:54', NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for media_process_history
-- ----------------------------
DROP TABLE IF EXISTS `media_process_history`;
CREATE TABLE `media_process_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件标识',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `bucket` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存储源',
  `status` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态,1:未处理，2：处理成功  3处理失败',
  `create_date` datetime NOT NULL COMMENT '上传时间',
  `finish_date` datetime NOT NULL COMMENT '完成时间',
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '媒资文件访问地址',
  `fail_count` int NULL DEFAULT 0 COMMENT '失败次数',
  `file_path` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `errormsg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_process_history
-- ----------------------------
INSERT INTO `media_process_history` VALUES (1, '81d7ed5153316f5774885d3b4c07d8bc', 'Spring Security快速上手-创建工程.avi', 'video', '2', '2022-12-15 09:41:50', '2022-12-15 10:30:26', '/video/8/1/81d7ed5153316f5774885d3b4c07d8bc/81d7ed5153316f5774885d3b4c07d8bc.mp4', 0, '8/1/81d7ed5153316f5774885d3b4c07d8bc/81d7ed5153316f5774885d3b4c07d8bc.avi', NULL);
INSERT INTO `media_process_history` VALUES (2, '18f919e23bedab97a78762c4875addc4', '垂直分库-插入和查询测试.avi', 'video', '2', '2022-12-15 09:45:18', '2022-12-15 10:30:11', '/video/1/8/18f919e23bedab97a78762c4875addc4/18f919e23bedab97a78762c4875addc4.mp4', 0, '1/8/18f919e23bedab97a78762c4875addc4/18f919e23bedab97a78762c4875addc4.avi', NULL);
INSERT INTO `media_process_history` VALUES (3, 'efd2eacc4485946fc27feb0caef7506c', '读写分离-理解读写分离.avi', 'video', '2', '2022-12-15 09:45:19', '2022-12-15 10:31:04', '/video/e/f/efd2eacc4485946fc27feb0caef7506c/efd2eacc4485946fc27feb0caef7506c.mp4', 0, 'e/f/efd2eacc4485946fc27feb0caef7506c/efd2eacc4485946fc27feb0caef7506c.avi', NULL);

-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `mq_host` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息队列主机',
  `mq_port` int NOT NULL COMMENT '消息队列端口',
  `mq_virtualhost` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息队列虚拟主机',
  `mq_queue` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列名称',
  `inform_num` int UNSIGNED NOT NULL COMMENT '通知次数',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理状态，0:初始，1:成功',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `inform_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段1处理状态, 0:初始，1:成功',
  `stage_state2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段2处理状态, 0:初始，1:成功',
  `stage_state3` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段3处理状态, 0:初始，1:成功',
  `stage_state4` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段4处理状态, 0:初始，1:成功',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message
-- ----------------------------
INSERT INTO `mq_message` VALUES ('f29a3149-7429-40be-8a4e-9909f32003b0', 'xc.mq.msgsync.coursepub', '111', NULL, NULL, '127.0.0.1', 5607, '/', 'xc.course.publish.queue', 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mq_message_history
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_history`;
CREATE TABLE `mq_message_history`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `mq_host` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息队列主机',
  `mq_port` int NOT NULL COMMENT '消息队列端口',
  `mq_virtualhost` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息队列虚拟主机',
  `mq_queue` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队列名称',
  `inform_num` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '通知次数',
  `state` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '处理状态，0:初始，1:成功，2:失败',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `inform_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state3` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state4` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message_history
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
