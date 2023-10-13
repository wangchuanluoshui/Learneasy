/*
 Navicat Premium Data Transfer

 Source Server         : 192.168
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : learneasy_content1

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/09/2023 13:39:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course_audit
-- ----------------------------
DROP TABLE IF EXISTS `course_audit`;
CREATE TABLE `course_audit`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL COMMENT '课程id',
  `audit_mind` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `audit_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核状态',
  `audit_people` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_audit
-- ----------------------------

-- ----------------------------
-- Table structure for course_base
-- ----------------------------
DROP TABLE IF EXISTS `course_base`;
CREATE TABLE `course_base`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用人群',
  `tags` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程标签',
  `mt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类',
  `st` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教育模式(common普通，record 录播，live直播等）',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程介绍',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程图片',
  `jiangyi` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲义',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_people` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `change_people` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `audit_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '课程发布状态 未发布  已发布 下线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_base
-- ----------------------------
INSERT INTO `course_base` VALUES (176, 1232141425, NULL, 'C++中级编程', 'C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程', 'C++中级编程', '1-3', '1-3-1', '204002', '200002', 'C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程', '/mediafiles/2023/09/01/87bf3b5fc130e8a6602f8fff3f51a056.jpg', NULL, '2023-09-01 10:11:00', '2023-09-01 10:21:06', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (177, 1232141425, NULL, 'C++高级编程', 'C++高级编程C++高级编程C++高级编程', 'C++高级编程C++高级编程', '1-3', '1-3-1', '204003', '200002', 'C++高级编程C++高级编程C++高级编程C++高级编程', '/mediafiles/2023/09/01/60eef818f693ce3cd1627f25be57543f.png', NULL, '2023-09-01 14:16:47', NULL, NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (179, 1232141425, NULL, 'c++', 'c++c++c++', 'c++c++c++', '1-10', '1-10-2', '204001', '200002', 'c++c++c++', '/mediafiles/2023/09/01/b50839a3012540e8691d15d9f129448f.jpg', NULL, '2023-09-01 16:10:59', '2023-09-04 10:45:38', NULL, NULL, '202004', '203001');
INSERT INTO `course_base` VALUES (180, 1232141425, NULL, 'C++游戏设计', 'C++游戏设计', 'C++游戏设计', '1-8', '1-8-6', '204001', '200002', 'C++游戏设计', '/mediafiles/2023/09/07/aae2370590e6e9226767aa32191d7215.png', NULL, '2023-09-06 09:20:07', '2023-09-12 10:14:45', NULL, NULL, '202002', '203001');

-- ----------------------------
-- Table structure for course_category
-- ----------------------------
DROP TABLE IF EXISTS `course_category`;
CREATE TABLE `course_category`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `label` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类标签默认和名称一样',
  `parentid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '父结点id（第一级的父节点是0，自关联字段id）',
  `is_show` tinyint NULL DEFAULT NULL COMMENT '是否显示',
  `orderby` int NULL DEFAULT NULL COMMENT '排序字段',
  `is_leaf` tinyint NULL DEFAULT NULL COMMENT '是否叶子',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_category
-- ----------------------------
INSERT INTO `course_category` VALUES ('1', '根结点', '根结点', '0', 1, 1, 0);
INSERT INTO `course_category` VALUES ('1-1', '前端开发', '前端开发', '1', 1, 1, 0);
INSERT INTO `course_category` VALUES ('1-1-1', 'HTML/CSS', 'HTML/CSS', '1-1', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-1-10', '其它', '其它', '1-1', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-1-2', 'JavaScript', 'JavaScript', '1-1', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-1-3', 'jQuery', 'jQuery', '1-1', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-1-4', 'ExtJS', 'ExtJS', '1-1', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-1-5', 'AngularJS', 'AngularJS', '1-1', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-1-6', 'ReactJS', 'ReactJS', '1-1', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-1-7', 'Bootstrap', 'Bootstrap', '1-1', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-1-8', 'Node.js', 'Node.js', '1-1', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-1-9', 'Vue', 'Vue', '1-1', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-10', '研发管理', '研发管理', '1', 1, 10, 0);
INSERT INTO `course_category` VALUES ('1-10-1', '敏捷开发', '敏捷开发', '1-10', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-10-2', '软件设计', '软件设计', '1-10', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-10-3', '软件测试', '软件测试', '1-10', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-10-4', '研发管理', '研发管理', '1-10', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-10-5', '其它', '其它', '1-10', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-11', '系统运维', '系统运维', '1', 1, 11, 0);
INSERT INTO `course_category` VALUES ('1-11-1', 'Linux', 'Linux', '1-11', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-11-10', '其它', '其它', '1-11', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-11-2', 'Windows', 'Windows', '1-11', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-11-3', 'UNIX', 'UNIX', '1-11', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-11-4', 'Mac OS', 'Mac OS', '1-11', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-11-5', '网络技术', '网络技术', '1-11', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-11-6', '路由协议', '路由协议', '1-11', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-11-7', '无线网络', '无线网络', '1-11', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-11-8', 'Ngnix', 'Ngnix', '1-11', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-11-9', '邮件服务器', '邮件服务器', '1-11', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-12', '产品经理', '产品经理', '1', 1, 12, 0);
INSERT INTO `course_category` VALUES ('1-12-1', '交互设计', '交互设计', '1-12', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-12-2', '产品设计', '产品设计', '1-12', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-12-3', '原型设计', '原型设计', '1-12', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-12-4', '用户体验', '用户体验', '1-12', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-12-5', '需求分析', '需求分析', '1-12', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-12-6', '其它', '其它', '1-12', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-13', '企业/办公/职场', '企业/办公/职场', '1', 1, 13, 0);
INSERT INTO `course_category` VALUES ('1-13-1', '运营管理', '运营管理', '1-13', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-13-2', '企业信息化', '企业信息化', '1-13', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-13-3', '网络营销', '网络营销', '1-13', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-13-4', 'Office/WPS', 'Office/WPS', '1-13', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-13-5', '招聘/面试', '招聘/面试', '1-13', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-13-6', '电子商务', '电子商务', '1-13', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-13-7', 'CRM', 'CRM', '1-13', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-13-8', 'ERP', 'ERP', '1-13', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-13-9', '其它', '其它', '1-13', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-14', '信息安全', '信息安全', '1', 1, 14, 0);
INSERT INTO `course_category` VALUES ('1-14-1', '密码学/加密/破解', '密码学/加密/破解', '1-14', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-14-10', '其它', '其它', '1-14', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-14-2', '渗透测试', '渗透测试', '1-14', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-14-3', '社会工程', '社会工程', '1-14', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-14-4', '漏洞挖掘与利用', '漏洞挖掘与利用', '1-14', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-14-5', '云安全', '云安全', '1-14', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-14-6', '防护加固', '防护加固', '1-14', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-14-7', '代码审计', '代码审计', '1-14', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-14-8', '移动安全', '移动安全', '1-14', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-14-9', '病毒木马', '病毒木马', '1-14', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-15', '测试目录', '测试目录', '1', 1, 15, 0);
INSERT INTO `course_category` VALUES ('1-15-1', '测试目录01', '测试目录01', '1-15', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-2', '移动开发', '移动开发', '1', 1, 2, 0);
INSERT INTO `course_category` VALUES ('1-2-1', '微信开发', '微信开发', '1-2', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-2-2', 'iOS', 'iOS', '1-2', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-2-3', '手游开发', '手游开发', '1-2', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-2-4', 'Swift', 'Swift', '1-2', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-2-5', 'Android', 'Android', '1-2', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-2-6', 'ReactNative', 'ReactNative', '1-2', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-2-7', 'Cordova', 'Cordova', '1-2', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-2-8', '其它', '其它', '1-2', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-3', '编程开发', '编程开发', '1', 1, 3, 0);
INSERT INTO `course_category` VALUES ('1-3-1', 'C/C++', 'C/C++', '1-3', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-3-2', 'Java', 'Java', '1-3', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-3-3', '.NET', '.NET', '1-3', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-3-4', 'Objective-C', 'Objective-C', '1-3', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-3-5', 'Go语言', 'Go语言', '1-3', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-3-6', 'Python', 'Python', '1-3', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-3-7', 'Ruby/Rails', 'Ruby/Rails', '1-3', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-3-8', '其它', '其它', '1-3', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-4', '数据库', '数据库', '1', 1, 4, 0);
INSERT INTO `course_category` VALUES ('1-4-1', 'Oracle', 'Oracle', '1-4', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-4-2', 'MySQL', 'MySQL', '1-4', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-4-3', 'SQL Server', 'SQL Server', '1-4', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-4-4', 'DB2', 'DB2', '1-4', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-4-5', 'NoSQL', 'NoSQL', '1-4', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-4-6', 'Mongo DB', 'Mongo DB', '1-4', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-4-7', 'Hbase', 'Hbase', '1-4', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-4-8', '数据仓库', '数据仓库', '1-4', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-4-9', '其它', '其它', '1-4', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-5', '人工智能', '人工智能', '1', 1, 5, 0);
INSERT INTO `course_category` VALUES ('1-5-1', '机器学习', '机器学习', '1-5', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-5-2', '深度学习', '深度学习', '1-5', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-5-3', '语音识别', '语音识别', '1-5', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-5-4', '计算机视觉', '计算机视觉', '1-5', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-5-5', 'NLP', 'NLP', '1-5', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-5-6', '强化学习', '强化学习', '1-5', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-5-7', '其它', '其它', '1-5', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-6', '云计算/大数据', '云计算/大数据', '1', 1, 6, 0);
INSERT INTO `course_category` VALUES ('1-6-1', 'Spark', 'Spark', '1-6', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-6-2', 'Hadoop', 'Hadoop', '1-6', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-6-3', 'OpenStack', 'OpenStack', '1-6', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-6-4', 'Docker/K8S', 'Docker/K8S', '1-6', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-6-5', '云计算基础架构', '云计算基础架构', '1-6', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-6-6', '虚拟化技术', '虚拟化技术', '1-6', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-6-7', '云平台', '云平台', '1-6', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-6-8', 'ELK', 'ELK', '1-6', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-6-9', '其它', '其它', '1-6', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-7', 'UI设计', 'UI设计', '1', 1, 7, 0);
INSERT INTO `course_category` VALUES ('1-7-1', 'Photoshop', 'Photoshop', '1-7', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-7-10', 'InDesign', 'InDesign', '1-7', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-7-11', 'Pro/Engineer', 'Pro/Engineer', '1-7', 1, 11, 1);
INSERT INTO `course_category` VALUES ('1-7-12', 'Cinema 4D', 'Cinema 4D', '1-7', 1, 12, 1);
INSERT INTO `course_category` VALUES ('1-7-13', '3D Studio', '3D Studio', '1-7', 1, 13, 1);
INSERT INTO `course_category` VALUES ('1-7-14', 'After Effects（AE）', 'After Effects（AE）', '1-7', 1, 14, 1);
INSERT INTO `course_category` VALUES ('1-7-15', '原画设计', '原画设计', '1-7', 1, 15, 1);
INSERT INTO `course_category` VALUES ('1-7-16', '动画制作', '动画制作', '1-7', 1, 16, 1);
INSERT INTO `course_category` VALUES ('1-7-17', 'Dreamweaver', 'Dreamweaver', '1-7', 1, 17, 1);
INSERT INTO `course_category` VALUES ('1-7-18', 'Axure', 'Axure', '1-7', 1, 18, 1);
INSERT INTO `course_category` VALUES ('1-7-19', '其它', '其它', '1-7', 1, 19, 1);
INSERT INTO `course_category` VALUES ('1-7-2', '3Dmax', '3Dmax', '1-7', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-7-3', 'Illustrator', 'Illustrator', '1-7', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-7-4', 'Flash', 'Flash', '1-7', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-7-5', 'Maya', 'Maya', '1-7', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-7-6', 'AUTOCAD', 'AUTOCAD', '1-7', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-7-7', 'UG', 'UG', '1-7', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-7-8', 'SolidWorks', 'SolidWorks', '1-7', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-7-9', 'CorelDraw', 'CorelDraw', '1-7', 1, 9, 1);
INSERT INTO `course_category` VALUES ('1-8', '游戏开发', '游戏开发', '1', 1, 8, 0);
INSERT INTO `course_category` VALUES ('1-8-1', 'Cocos', 'Cocos', '1-8', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-8-2', 'Unity3D', 'Unity3D', '1-8', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-8-3', 'Flash', 'Flash', '1-8', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-8-4', 'SpriteKit 2D', 'SpriteKit 2D', '1-8', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-8-5', 'Unreal', 'Unreal', '1-8', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-8-6', '其它', '其它', '1-8', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-9', '智能硬件/物联网', '智能硬件/物联网', '1', 1, 9, 0);
INSERT INTO `course_category` VALUES ('1-9-1', '无线通信', '无线通信', '1-9', 1, 1, 1);
INSERT INTO `course_category` VALUES ('1-9-10', '物联网技术', '物联网技术', '1-9', 1, 10, 1);
INSERT INTO `course_category` VALUES ('1-9-11', '其它', '其它', '1-9', 1, 11, 1);
INSERT INTO `course_category` VALUES ('1-9-2', '电子工程', '电子工程', '1-9', 1, 2, 1);
INSERT INTO `course_category` VALUES ('1-9-3', 'Arduino', 'Arduino', '1-9', 1, 3, 1);
INSERT INTO `course_category` VALUES ('1-9-4', '体感技术', '体感技术', '1-9', 1, 4, 1);
INSERT INTO `course_category` VALUES ('1-9-5', '智能硬件', '智能硬件', '1-9', 1, 5, 1);
INSERT INTO `course_category` VALUES ('1-9-6', '驱动/内核开发', '驱动/内核开发', '1-9', 1, 6, 1);
INSERT INTO `course_category` VALUES ('1-9-7', '单片机/工控', '单片机/工控', '1-9', 1, 7, 1);
INSERT INTO `course_category` VALUES ('1-9-8', 'WinCE', 'WinCE', '1-9', 1, 8, 1);
INSERT INTO `course_category` VALUES ('1-9-9', '嵌入式', '嵌入式', '1-9', 1, 9, 1);

-- ----------------------------
-- Table structure for course_market
-- ----------------------------
DROP TABLE IF EXISTS `course_market`;
CREATE TABLE `course_market`  (
  `id` bigint NOT NULL COMMENT '主键，课程id',
  `charge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费规则，对应数据字典',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `qq` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '咨询qq',
  `wechat` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `valid_days` int NULL DEFAULT NULL COMMENT '有效期天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程营销信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_market
-- ----------------------------
INSERT INTO `course_market` VALUES (175, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (176, '201001', 118.00, 198.00, '1242345', '45242545', '13542452452', 365);
INSERT INTO `course_market` VALUES (177, '201001', 128.00, 198.00, '3546564', '4564564', '45234545', 365);
INSERT INTO `course_market` VALUES (179, '201000', 0.00, NULL, '', '', '', 365);
INSERT INTO `course_market` VALUES (180, '201000', 0.00, NULL, '', '', '', 365);

-- ----------------------------
-- Table structure for course_publish
-- ----------------------------
DROP TABLE IF EXISTS `course_publish`;
CREATE TABLE `course_publish`  (
  `id` bigint NOT NULL COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '适用人群',
  `tags` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `mt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类',
  `mt_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类名称',
  `st` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类',
  `st_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类名称',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教育模式',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程图片',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程介绍',
  `market` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程营销信息，json格式',
  `teachplan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有课程计划，json格式',
  `teachers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '教师信息，json格式',
  `create_date` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `online_date` datetime NULL DEFAULT NULL COMMENT '上架时间',
  `offline_date` datetime NULL DEFAULT NULL COMMENT '下架时间',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '发布状态',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `charge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费规则，对应数据字典--203',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `valid_days` int NULL DEFAULT NULL COMMENT '课程有效期天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程发布' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_publish
-- ----------------------------
INSERT INTO `course_publish` VALUES (175, 1232141425, NULL, 'C++入门', 'C++入门C++入门C++入门', 'C++入门C++入门C++入门C++入门', NULL, '1-3', '编程开发', '1-3-1', 'C/C++', '204001', '200002', '/mediafiles/2023/08/31/0e45e04171f8b7ba13d47738a40ab858.jpg', 'C++入门C++入门C++入门', '{\"charge\":\"201000\",\"id\":175,\"phone\":\"\",\"price\":0.0,\"qq\":\"\",\"validDays\":365,\"wechat\":\"\"}', '[{\"courseId\":175,\"grade\":1,\"id\":383,\"orderby\":1,\"parentid\":0,\"pname\":\"第一章\",\"teachPlanTreeNodes\":[{\"courseId\":175,\"grade\":2,\"id\":384,\"orderby\":1,\"parentid\":383,\"pname\":\"第一节\",\"teachplanMedia\":{\"courseId\":175,\"id\":99,\"mediaFilename\":\"10 C中的引用-引用的本质.mp4\",\"mediaId\":\"112fcf8e929dfb10e7bb2875f18226ec\",\"teachplanId\":384}},{\"courseId\":175,\"grade\":2,\"id\":385,\"orderby\":2,\"parentid\":383,\"pname\":\"第二节\",\"teachplanMedia\":{\"courseId\":175,\"id\":100,\"mediaFilename\":\"20 机房预约系统-查看账号功能实现.mp4\",\"mediaId\":\"189ce9625954594c700e3bb5b3342d3b\",\"teachplanId\":385}},{\"courseId\":175,\"grade\":2,\"id\":386,\"orderby\":3,\"parentid\":383,\"pname\":\"第三节\",\"teachplanMedia\":{\"courseId\":175,\"id\":101,\"mediaFilename\":\"09 数据类型-sizeof关键字.mp4\",\"mediaId\":\"49d21db3fc31d5c05dd2e585d5eeed78\",\"teachplanId\":386}}]}]', NULL, '2023-09-01 16:49:08', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);
INSERT INTO `course_publish` VALUES (176, 1232141425, NULL, 'C++中级编程', 'C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程', 'C++中级编程', NULL, '1-3', '编程开发', '1-3-1', 'C/C++', '204002', '200002', '/mediafiles/2023/09/01/87bf3b5fc130e8a6602f8fff3f51a056.jpg', 'C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程C++中级编程', '{\"charge\":\"201001\",\"id\":176,\"originalPrice\":198.0,\"phone\":\"13542452452\",\"price\":118.0,\"qq\":\"1242345\",\"validDays\":365,\"wechat\":\"45242545\"}', '[{\"courseId\":176,\"grade\":1,\"id\":388,\"orderby\":1,\"parentid\":0,\"pname\":\"第一章\",\"teachPlanTreeNodes\":[{\"courseId\":176,\"grade\":2,\"id\":392,\"orderby\":2,\"parentid\":388,\"pname\":\"第一节\",\"teachplanMedia\":{\"courseId\":176,\"id\":105,\"mediaFilename\":\"20 机房预约系统-查看账号功能实现.mp4\",\"mediaId\":\"189ce9625954594c700e3bb5b3342d3b\",\"teachplanId\":392}},{\"courseId\":176,\"grade\":2,\"id\":391,\"orderby\":2,\"parentid\":388,\"pname\":\"第二节\",\"teachplanMedia\":{\"courseId\":176,\"id\":107,\"mediaFilename\":\"10 C中的引用-引用的本质.mp4\",\"mediaId\":\"112fcf8e929dfb10e7bb2875f18226ec\",\"teachplanId\":391}}]}]', NULL, '2023-09-01 16:57:30', NULL, NULL, '202004', NULL, '201001', 118.00, 198.00, 365);
INSERT INTO `course_publish` VALUES (177, 1232141425, NULL, 'C++高级编程', 'C++高级编程C++高级编程C++高级编程', 'C++高级编程C++高级编程', NULL, '1-3', '编程开发', '1-3-1', 'C/C++', '204003', '200002', '/mediafiles/2023/09/01/60eef818f693ce3cd1627f25be57543f.png', 'C++高级编程C++高级编程C++高级编程C++高级编程', '{\"charge\":\"201001\",\"id\":177,\"originalPrice\":198.0,\"phone\":\"45234545\",\"price\":128.0,\"qq\":\"3546564\",\"validDays\":365,\"wechat\":\"4564564\"}', '[{\"courseId\":177,\"grade\":1,\"id\":393,\"orderby\":1,\"parentid\":0,\"pname\":\"第一章\",\"teachPlanTreeNodes\":[{\"courseId\":177,\"grade\":2,\"id\":394,\"orderby\":1,\"parentid\":393,\"pname\":\"第一节\",\"teachplanMedia\":{\"courseId\":177,\"id\":108,\"mediaFilename\":\"20 机房预约系统-查看账号功能实现.mp4\",\"mediaId\":\"189ce9625954594c700e3bb5b3342d3b\",\"teachplanId\":394}},{\"courseId\":177,\"grade\":2,\"id\":395,\"orderby\":2,\"parentid\":393,\"pname\":\"第二节\",\"teachplanMedia\":{\"courseId\":177,\"id\":109,\"mediaFilename\":\"09 数据类型-sizeof关键字.mp4\",\"mediaId\":\"49d21db3fc31d5c05dd2e585d5eeed78\",\"teachplanId\":395}}]}]', NULL, '2023-09-01 16:57:36', NULL, NULL, '202004', NULL, '201001', 128.00, 198.00, 365);
INSERT INTO `course_publish` VALUES (179, 1232141425, NULL, 'c++', 'c++c++c++', 'c++c++c++', NULL, '1-10', '研发管理', '1-10-2', '软件设计', '204001', '200002', '/mediafiles/2023/09/01/b50839a3012540e8691d15d9f129448f.jpg', 'c++c++c++', '{\"charge\":\"201000\",\"id\":179,\"phone\":\"\",\"price\":0.0,\"qq\":\"\",\"validDays\":365,\"wechat\":\"\"}', '[{\"courseId\":179,\"grade\":1,\"id\":398,\"orderby\":1,\"parentid\":0,\"pname\":\"第一章\",\"teachPlanTreeNodes\":[{\"courseId\":179,\"grade\":2,\"id\":399,\"orderby\":1,\"parentid\":398,\"pname\":\"第一节\",\"teachplanMedia\":{\"courseId\":179,\"id\":111,\"mediaFilename\":\"20 机房预约系统-查看账号功能实现.mp4\",\"mediaId\":\"189ce9625954594c700e3bb5b3342d3b\",\"teachplanId\":399}}]}]', NULL, '2023-09-01 16:57:38', NULL, NULL, '202004', NULL, '201000', 0.00, NULL, 365);

-- ----------------------------
-- Table structure for course_publish_pre
-- ----------------------------
DROP TABLE IF EXISTS `course_publish_pre`;
CREATE TABLE `course_publish_pre`  (
  `id` bigint NOT NULL COMMENT '主键',
  `company_id` bigint NOT NULL COMMENT '机构ID',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `users` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '适用人群',
  `tags` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `mt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类',
  `mt_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大分类名称',
  `st` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类',
  `st_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小分类名称',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程等级',
  `teachmode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教育模式（common普通，record录播，live直播）',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程图片',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程介绍',
  `market` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程营销信息，json格式',
  `teachplan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有课程计划，json格式',
  `teachers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '教师信息，json格式',
  `create_date` datetime NULL DEFAULT NULL COMMENT '提交时间',
  `audit_date` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态（已提交，审核通过，审核未通过）',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `charge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费规则，对应数据字典--203',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `valid_days` int NULL DEFAULT NULL COMMENT '课程有效期天数',
  PRIMARY KEY (`id`, `pic`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程发布' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_publish_pre
-- ----------------------------

-- ----------------------------
-- Table structure for course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程标识',
  `teacher_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师标识',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师职位',
  `introduction` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师简介',
  `photograph` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照片',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `courseid_teacherId_unique`(`course_id` ASC, `teacher_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程-教师关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------
INSERT INTO `course_teacher` VALUES (1, 72, 'wangxu', 'java高级讲师', '1111', 'http://r3zc5rung.hd-bkt.clouddn.com/2424e25d-b3ff-4ea2-92a5-249af918a42dGDSzBXIgWuwMCiZ4', '2023-03-18 17:44:07');
INSERT INTO `course_teacher` VALUES (3, 79, '博文', '教师', '帅哥', 'http://r3zc5rung.hd-bkt.clouddn.com/5fc0c47f-a3b4-4d93-b618-bb1cce8271f065L1s0qQjE1eLUAS', '2023-03-18 10:35:49');
INSERT INTO `course_teacher` VALUES (4, 80, '小王吧', 'SaaS', 'ASAD', 'http://r3zc5rung.hd-bkt.clouddn.com/bbdca546-524e-4938-abda-41b221642e7b4KtfBnPKutsdcqwI', '2023-03-18 11:09:43');
INSERT INTO `course_teacher` VALUES (5, 82, '驱蚊器', '为', '去', NULL, '2023-03-18 11:29:16');
INSERT INTO `course_teacher` VALUES (6, 83, '111', '111', '111', 'http://r3zc5rung.hd-bkt.clouddn.com/e169c906-a32a-4d0d-8262-e050de0f5f78obzlSd955zLAdeqv', '2023-03-18 12:24:01');
INSERT INTO `course_teacher` VALUES (7, 84, '123', '123', '123', 'http://r3zc5rung.hd-bkt.clouddn.com/6f6ac157-fc87-4bcc-a0ea-6c1e7c802fa6Igv8qAA9vwVYuNEv', '2023-03-17 13:44:01');
INSERT INTO `course_teacher` VALUES (8, 85, '黄哥', '大牛', 'nb', 'http://r3zc5rung.hd-bkt.clouddn.com/0ac34fcb-009c-40d3-9a67-9615d2d2e079ZR3JLyZNbcpdhdZF', '2023-03-18 16:11:30');
INSERT INTO `course_teacher` VALUES (9, 86, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/625f7d6b-eeb8-4b24-aa9c-d2dd7fc0a3f2FXkxFmophiqhz5au', '2023-03-18 20:03:21');
INSERT INTO `course_teacher` VALUES (10, 88, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/4fd7bfaa-f374-44c9-a4db-aa8ef23a76ddhvlJXSn6zcGKQS1u', '2023-03-18 20:15:19');
INSERT INTO `course_teacher` VALUES (11, 89, 'q', 'qq', '去', 'http://r3zc5rung.hd-bkt.clouddn.com/5e7a6877-39e2-4269-a656-c6c56c4ee259DVa7QIBQHs0OQ3yI', '2023-03-18 20:22:40');
INSERT INTO `course_teacher` VALUES (12, 90, '1', '11', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/b3aeddb4-b4a4-4707-a4dc-16b9a9b04ddbATTiKwht7R3UFem6', '2023-03-18 20:27:43');
INSERT INTO `course_teacher` VALUES (13, 91, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/28535bad-5186-4b93-b949-85af1f9698157U9V9ybKbD6eMIym', '2023-03-18 20:35:55');
INSERT INTO `course_teacher` VALUES (14, 92, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/347a1e0d-793c-4b7f-8c26-2f3b1d2509aardGNVuaR19aV9EYW', '2023-03-18 20:54:23');
INSERT INTO `course_teacher` VALUES (15, 93, '小公牛', '欢喜', '欢喜', 'http://r3zc5rung.hd-bkt.clouddn.com/7b60fbeb-1857-4881-b4f1-1752e7c897ecQJGFVRhfevzXqVIU', '2023-03-18 23:24:27');
INSERT INTO `course_teacher` VALUES (16, 94, '最最最最最最最最最最终测试', '最最最最最最最最最最终测试', '最最最最最最最最最最终测试', NULL, '2023-03-18 23:48:59');
INSERT INTO `course_teacher` VALUES (17, 95, '1', '1', '1', 'http://r3zc5rung.hd-bkt.clouddn.com/490587bd-21df-4739-bcfb-dd0dbcad9a58OW3cttni1nlacpmZ', '2023-03-18 02:08:54');
INSERT INTO `course_teacher` VALUES (18, 96, '究极测试', '究极测试', '究极测试', 'http://r3zc5rung.hd-bkt.clouddn.com/8bc6a8be-df5c-4456-82c0-edc4c51731f1gkuxrGC7Jwlj7RKT', '2023-03-18 03:11:24');
INSERT INTO `course_teacher` VALUES (19, 22, '王老师', '高级讲师', '2222', NULL, '2023-03-18 21:17:53');
INSERT INTO `course_teacher` VALUES (20, 74, '张老师', 'java老师', '讲课生动。', '/bucket-pic/2022/08/25/a0950c47-ed28-4dec-8a87-76ff108448d7.jpg', '2023-08-23 15:46:27');
INSERT INTO `course_teacher` VALUES (21, 117, 'Lucy', 'Java 讲师', 'Java Instructor', NULL, '2023-02-07 16:57:28');
INSERT INTO `course_teacher` VALUES (22, 117, 'Kyle', 'Java僵尸', 'Java Zombie', NULL, '2023-02-07 17:06:57');
INSERT INTO `course_teacher` VALUES (26, 163, 'Matlab', 'MatlabMatlab', 'MatlabMatlab', NULL, '2023-03-18 19:33:31');
INSERT INTO `course_teacher` VALUES (27, 168, '张昌龄', '初级', '', NULL, '2023-08-16 14:53:15');
INSERT INTO `course_teacher` VALUES (29, 175, '张三', '初级', '张三老师多年以来致力于c++课程的教学', '/mediafiles/2023/08/16/c4269c552a8b2dc92450e54ae6dd4673.png', '2023-08-31 16:22:19');
INSERT INTO `course_teacher` VALUES (30, 180, '张三', '初级', '张三老师多年以来致力于c++课程的教学', '/mediafiles/2023/08/16/c4269c552a8b2dc92450e54ae6dd4673.png', '2023-09-06 13:19:38');

-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型代码: course_publish ,  media_test',
  `business_key1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `execute_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '通知次数',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '处理状态，0:初始，1:成功',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `execute_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '阶段1处理状态, 0:初始，1:成功',
  `stage_state2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '阶段2处理状态, 0:初始，1:成功',
  `stage_state3` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '阶段3处理状态, 0:初始，1:成功',
  `stage_state4` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '阶段4处理状态, 0:初始，1:成功',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message
-- ----------------------------

-- ----------------------------
-- Table structure for mq_message_history
-- ----------------------------
DROP TABLE IF EXISTS `mq_message_history`;
CREATE TABLE `mq_message_history`  (
  `id` bigint NOT NULL COMMENT '消息id',
  `message_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息类型代码',
  `business_key1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `business_key3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联业务信息',
  `execute_num` int UNSIGNED NULL DEFAULT NULL COMMENT '通知次数',
  `state` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '处理状态，0:初始，1:成功，2:失败',
  `returnfailure_date` datetime NULL DEFAULT NULL COMMENT '回复失败时间',
  `returnsuccess_date` datetime NULL DEFAULT NULL COMMENT '回复成功时间',
  `returnfailure_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复失败内容',
  `execute_date` datetime NULL DEFAULT NULL COMMENT '最近通知时间',
  `stage_state1` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state2` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state3` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage_state4` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mq_message_history
-- ----------------------------
INSERT INTO `mq_message_history` VALUES (62, 'course_publish', '174', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (63, 'course_publish', '170', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (64, 'course_publish', '170', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (65, 'course_publish', '175', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (66, 'course_publish', '175', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (67, 'course_publish', '175', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (68, 'course_publish', '176', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (69, 'course_publish', '175', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (70, 'course_publish', '176', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (71, 'course_publish', '177', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (72, 'course_publish', '175', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (73, 'course_publish', '176', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (74, 'course_publish', '177', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (75, 'course_publish', '175', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (76, 'course_publish', '177', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (77, 'course_publish', '179', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (78, 'course_publish', '175', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (79, 'course_publish', '176', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (80, 'course_publish', '177', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');
INSERT INTO `mq_message_history` VALUES (81, 'course_publish', '179', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1', '1', '0', '0');

-- ----------------------------
-- Table structure for teachplan
-- ----------------------------
DROP TABLE IF EXISTS `teachplan`;
CREATE TABLE `teachplan`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程计划名称',
  `parentid` bigint NOT NULL COMMENT '课程计划父级Id',
  `grade` smallint NOT NULL COMMENT '层级，分为1、2、3级',
  `media_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程类型:1视频、2文档',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始直播时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '直播结束时间',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '章节及课程时介绍',
  `timelength` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时长，单位时:分:秒',
  `orderby` int NULL DEFAULT 0 COMMENT '排序字段',
  `course_id` bigint NOT NULL COMMENT '课程标识',
  `course_pub_id` bigint NULL DEFAULT NULL COMMENT '课程发布标识',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态（1正常  0删除）',
  `is_preview` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否支持试学或预览（试看）',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `change_date` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 420 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程计划' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachplan
-- ----------------------------
INSERT INTO `teachplan` VALUES (379, '第一章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 174, NULL, 1, '0', '2023-08-31 14:04:16', '2023-08-31 14:04:22');
INSERT INTO `teachplan` VALUES (380, '第一节', 379, 2, NULL, NULL, NULL, NULL, NULL, 1, 174, NULL, 1, '1', '2023-08-31 14:04:22', '2023-08-31 14:15:15');
INSERT INTO `teachplan` VALUES (381, '新小节名称 [点击修改]', 379, 2, NULL, NULL, NULL, NULL, NULL, 2, 174, NULL, 1, '1', '2023-08-31 14:08:14', '2023-08-31 14:08:29');
INSERT INTO `teachplan` VALUES (382, '第一节', 363, 2, NULL, NULL, NULL, NULL, NULL, 1, 169, NULL, 1, '0', '2023-08-31 14:13:13', '2023-08-31 14:13:23');
INSERT INTO `teachplan` VALUES (383, '第一章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 175, NULL, 1, '0', '2023-08-31 16:16:09', '2023-08-31 16:16:14');
INSERT INTO `teachplan` VALUES (384, '第一节', 383, 2, NULL, NULL, NULL, NULL, NULL, 1, 175, NULL, 1, '0', '2023-08-31 16:16:15', '2023-08-31 16:16:20');
INSERT INTO `teachplan` VALUES (385, '第二节', 383, 2, NULL, NULL, NULL, NULL, NULL, 2, 175, NULL, 1, '0', '2023-08-31 16:16:21', '2023-08-31 16:16:35');
INSERT INTO `teachplan` VALUES (386, '第三节', 383, 2, NULL, NULL, NULL, NULL, NULL, 3, 175, NULL, 1, '0', '2023-08-31 16:16:21', '2023-08-31 16:16:30');
INSERT INTO `teachplan` VALUES (388, '第一章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 176, NULL, 1, '0', '2023-09-01 10:11:02', '2023-09-01 10:11:51');
INSERT INTO `teachplan` VALUES (391, '第二节', 388, 2, NULL, NULL, NULL, NULL, NULL, 2, 176, NULL, 1, '0', '2023-09-01 10:13:31', '2023-09-01 10:19:39');
INSERT INTO `teachplan` VALUES (392, '第一节', 388, 2, NULL, NULL, NULL, NULL, NULL, 2, 176, NULL, 1, '0', '2023-09-01 10:19:21', '2023-09-01 10:19:34');
INSERT INTO `teachplan` VALUES (393, '第一章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 177, NULL, 1, '0', '2023-09-01 14:16:48', '2023-09-01 14:16:55');
INSERT INTO `teachplan` VALUES (394, '第一节', 393, 2, NULL, NULL, NULL, NULL, NULL, 1, 177, NULL, 1, '0', '2023-09-01 14:16:55', '2023-09-01 14:17:01');
INSERT INTO `teachplan` VALUES (395, '第二节', 393, 2, NULL, NULL, NULL, NULL, NULL, 2, 177, NULL, 1, '0', '2023-09-01 14:17:01', '2023-09-01 14:17:10');
INSERT INTO `teachplan` VALUES (398, '第一章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 179, NULL, 1, '0', '2023-09-01 16:11:00', '2023-09-01 16:11:10');
INSERT INTO `teachplan` VALUES (399, '第一节', 398, 2, NULL, NULL, NULL, NULL, NULL, 1, 179, NULL, 1, '0', '2023-09-01 16:11:10', '2023-09-01 16:11:18');
INSERT INTO `teachplan` VALUES (400, '第一章', 0, 1, NULL, NULL, NULL, NULL, NULL, 1, 180, NULL, 1, '0', '2023-09-06 09:20:09', '2023-09-06 09:20:22');
INSERT INTO `teachplan` VALUES (402, '第一节', 400, 2, NULL, NULL, NULL, NULL, NULL, 1, 180, NULL, 1, '0', '2023-09-06 09:23:41', '2023-09-11 15:11:44');
INSERT INTO `teachplan` VALUES (404, '第二章', 0, 1, NULL, NULL, NULL, NULL, NULL, 2, 180, NULL, 1, '0', '2023-09-06 15:13:56', '2023-09-06 15:14:03');
INSERT INTO `teachplan` VALUES (405, '第一节', 404, 2, NULL, NULL, NULL, NULL, NULL, 1, 180, NULL, 1, '0', '2023-09-06 15:14:04', '2023-09-06 15:14:09');
INSERT INTO `teachplan` VALUES (406, '第二节', 404, 2, NULL, NULL, NULL, NULL, NULL, 2, 180, NULL, 1, '0', '2023-09-06 15:14:13', '2023-09-06 15:14:19');
INSERT INTO `teachplan` VALUES (407, '第三章', 0, 1, NULL, NULL, NULL, NULL, NULL, 3, 180, NULL, 1, '0', '2023-09-06 15:14:50', '2023-09-06 15:14:56');
INSERT INTO `teachplan` VALUES (417, '第一节', 407, 2, NULL, NULL, NULL, NULL, NULL, 1, 180, NULL, 1, '0', '2023-09-06 16:48:52', '2023-09-06 16:49:01');
INSERT INTO `teachplan` VALUES (419, '第二节', 407, 2, NULL, NULL, NULL, NULL, NULL, 2, 180, NULL, 1, '0', '2023-09-12 08:30:25', '2023-09-12 08:30:36');

-- ----------------------------
-- Table structure for teachplan_media
-- ----------------------------
DROP TABLE IF EXISTS `teachplan_media`;
CREATE TABLE `teachplan_media`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `media_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '媒资文件id',
  `teachplan_id` bigint NOT NULL COMMENT '课程计划标识',
  `course_id` bigint NOT NULL COMMENT '课程标识',
  `media_fileName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '媒资文件原始名称',
  `create_date` datetime NULL DEFAULT NULL,
  `create_people` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `change_people` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachplan_media
-- ----------------------------
INSERT INTO `teachplan_media` VALUES (35, '23f83ae728bd1269eee7ea2236e79644', 149, 82, '16-Nacos配置管理-课程总结.avi', '2022-09-15 08:02:26', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (38, '3a5a861d1c745d05166132c47b44f9e4', 147, 82, '01-Nacos配置管理-内容介绍.avi', '2022-09-15 08:02:55', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (40, '3a5a861d1c745d05166132c47b44f9e4', 269, 117, '01-Nacos配置管理-内容介绍.avi', '2022-10-04 19:04:45', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (41, '23f83ae728bd1269eee7ea2236e79644', 270, 117, '16-Nacos配置管理-课程总结.avi', '2022-10-04 19:04:55', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (42, '3a5a861d1c745d05166132c47b44f9e4', 271, 117, '01-Nacos配置管理-内容介绍.avi', '2022-10-04 19:05:03', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (43, '3a5a861d1c745d05166132c47b44f9e4', 272, 117, '01-Nacos配置管理-内容介绍.avi', '2022-10-04 19:05:10', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (44, '23f83ae728bd1269eee7ea2236e79644', 273, 117, '16-Nacos配置管理-课程总结.avi', '2022-10-04 19:05:14', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (45, '1f229319d6fed3431d2f9d06193a433b', 275, 117, '01-分布式事务专题课程介绍.avi', '2022-10-04 19:05:22', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (46, '6ad24a762f67c18f61966c1b8c55abe6', 276, 117, '07-分布式事务基础理论-BASE理论.avi', '2022-10-04 19:05:27', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (47, '1f229319d6fed3431d2f9d06193a433b', 277, 117, '01-分布式事务专题课程介绍.avi', '2022-10-04 19:05:31', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (57, '2324914c0a065a583f6bfba7080faef3', 325, 160, '胶水01.mp4', '2023-03-02 17:17:47', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (58, 'c00c815ab0e77e4da33309cc2d8ab77c', 324, 160, '胶水02.mp4', '2023-03-02 17:17:55', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (60, 'f56582224553598bfbaf529f9e5d140b', 326, 160, '胶水04.mp4', '2023-03-02 17:18:15', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (61, 'd8849c8a7b55c64d38a7b565ef01b9f3', 323, 160, '胶水03.mp4', '2023-03-03 11:38:16', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (63, 'ff73b385ba975356f2ec7405ac70e4ea', 331, 162, '胶水06.mp4', '2023-03-18 19:30:22', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (64, '2324914c0a065a583f6bfba7080faef3', 335, 163, '胶水01.mp4', '2023-03-18 19:38:18', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (65, 'c00c815ab0e77e4da33309cc2d8ab77c', 336, 163, '胶水02.mp4', '2023-03-18 19:38:30', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (66, 'd8849c8a7b55c64d38a7b565ef01b9f3', 337, 163, '胶水03.mp4', '2023-03-18 19:38:36', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (67, '2324914c0a065a583f6bfba7080faef3', 344, 165, '胶水01.mp4', '2023-03-19 17:42:16', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (69, '2324914c0a065a583f6bfba7080faef3', 348, 166, '胶水01.mp4', '2023-04-02 23:17:16', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (70, '2324914c0a065a583f6bfba7080faef3', 349, 166, '胶水01.mp4', '2023-04-02 23:17:23', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (77, '189ce9625954594c700e3bb5b3342d3b', 267, 2, '20 机房预约系统-查看账号功能实现.mp4', '2023-08-16 10:22:58', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (78, '7a7dee1a52f52f6a129a3a746428b21f', 355, 2, '30 程序流程结构-选择结构-switch语句.mp4', '2023-08-16 10:43:53', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (81, '7a7dee1a52f52f6a129a3a746428b21f', 358, 1, '30 程序流程结构-选择结构-switch语句.mp4', '2023-08-16 11:28:05', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (82, '189ce9625954594c700e3bb5b3342d3b', 360, 168, '20 机房预约系统-查看账号功能实现.mp4', '2023-08-16 14:52:36', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (84, '0c492e132265b6c324f80415c6d915bf', 361, 1, '04 程序的内存模型-内存四区-堆区.mp4', '2023-08-16 15:13:13', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (86, '112fcf8e929dfb10e7bb2875f18226ec', 366, 169, '10 C中的引用-引用的本质.mp4', '2023-08-17 13:14:28', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (87, '1697af17ca6a781f8e2ba6c7005cee77', 367, 169, '07 标识符命名规则.mp4', '2023-08-17 13:14:34', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (90, '49d21db3fc31d5c05dd2e585d5eeed78', 369, 170, '09 数据类型-sizeof关键字.mp4', '2023-08-21 08:33:50', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (91, '67cfdf90213190222e4413f501110c10', 370, 170, '01 程序的内存模型-内存四区-代码区..mp4', '2023-08-21 08:34:02', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (92, '05b7f9022b3b4e6d2580b9071c07ebea', 372, 171, 'test_mp4.mp4', '2023-08-29 08:41:27', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (93, '0c492e132265b6c324f80415c6d915bf', 373, 171, '04 程序的内存模型-内存四区-堆区.mp4', '2023-08-29 08:41:34', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (94, '12f0381947a630e19346e8c23d038133', 375, 171, '10 数据类型-实型.mp4', '2023-08-29 08:41:39', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (95, '0c492e132265b6c324f80415c6d915bf', 377, 173, '04 程序的内存模型-内存四区-堆区.mp4', '2023-08-31 13:40:58', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (96, '12f0381947a630e19346e8c23d038133', 378, 173, '10 数据类型-实型.mp4', '2023-08-31 13:41:18', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (97, '05b7f9022b3b4e6d2580b9071c07ebea', 380, 174, 'test_mp4.mp4', '2023-08-31 14:04:32', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (98, '86c6c0021dd2d1a5c26cdbdc54459a32', 381, 174, 'C++1.0.mp4', '2023-08-31 14:08:27', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (99, '112fcf8e929dfb10e7bb2875f18226ec', 384, 175, '10 C中的引用-引用的本质.mp4', '2023-08-31 16:16:42', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (100, '189ce9625954594c700e3bb5b3342d3b', 385, 175, '20 机房预约系统-查看账号功能实现.mp4', '2023-08-31 16:16:49', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (101, '49d21db3fc31d5c05dd2e585d5eeed78', 386, 175, '09 数据类型-sizeof关键字.mp4', '2023-08-31 16:16:57', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (105, '189ce9625954594c700e3bb5b3342d3b', 392, 176, '20 机房预约系统-查看账号功能实现.mp4', '2023-09-01 10:20:08', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (107, '112fcf8e929dfb10e7bb2875f18226ec', 391, 176, '10 C中的引用-引用的本质.mp4', '2023-09-01 10:21:15', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (108, '189ce9625954594c700e3bb5b3342d3b', 394, 177, '20 机房预约系统-查看账号功能实现.mp4', '2023-09-01 14:17:20', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (109, '49d21db3fc31d5c05dd2e585d5eeed78', 395, 177, '09 数据类型-sizeof关键字.mp4', '2023-09-01 14:17:27', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (110, '189ce9625954594c700e3bb5b3342d3b', 397, 178, '20 机房预约系统-查看账号功能实现.mp4', '2023-09-01 16:05:41', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (111, '189ce9625954594c700e3bb5b3342d3b', 399, 179, '20 机房预约系统-查看账号功能实现.mp4', '2023-09-01 16:11:22', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (118, '1697af17ca6a781f8e2ba6c7005cee77', 405, 180, '07 标识符命名规则.mp4', '2023-09-06 15:14:39', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (119, '189ce9625954594c700e3bb5b3342d3b', 406, 180, '20 机房预约系统-查看账号功能实现.mp4', '2023-09-06 15:14:45', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (124, '189ce9625954594c700e3bb5b3342d3b', 402, 180, '20 机房预约系统-查看账号功能实现.mp4', '2023-09-06 16:53:01', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (131, '189ce9625954594c700e3bb5b3342d3b', 400, 180, '20 机房预约系统-查看账号功能实现.mp4', '2023-09-12 09:02:09', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (136, '79597d82caa0c865e8dc4f429b946690', 417, 180, '5.docx', '2023-09-12 09:27:05', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (138, '1697af17ca6a781f8e2ba6c7005cee77', 419, 180, '07 标识符命名规则.mp4', '2023-09-12 10:23:50', NULL, NULL);
INSERT INTO `teachplan_media` VALUES (139, '79597d82caa0c865e8dc4f429b946690', 407, 180, '5.docx', '2023-09-12 10:24:07', NULL, NULL);

-- ----------------------------
-- Table structure for teachplan_work
-- ----------------------------
DROP TABLE IF EXISTS `teachplan_work`;
CREATE TABLE `teachplan_work`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `work_id` bigint NOT NULL COMMENT '作业信息标识',
  `work_title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '作业标题',
  `teachplan_id` bigint NOT NULL COMMENT '课程计划标识',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程标识',
  `create_date` datetime NULL DEFAULT NULL,
  `course_pub_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachplan_work
-- ----------------------------
INSERT INTO `teachplan_work` VALUES (12, 8, '测试作业1', 138, 79, '2021-12-27 10:35:15', NULL);
INSERT INTO `teachplan_work` VALUES (13, 8, '测试作业1', 144, 80, '2021-12-27 11:09:20', NULL);
INSERT INTO `teachplan_work` VALUES (14, 8, '测试作业1', 129, 78, '2021-12-27 11:15:04', NULL);
INSERT INTO `teachplan_work` VALUES (15, 8, '测试作业1', 147, 82, '2021-12-27 11:28:28', NULL);
INSERT INTO `teachplan_work` VALUES (17, 8, '测试作业1', 155, 83, '2021-12-27 12:22:55', NULL);
INSERT INTO `teachplan_work` VALUES (18, 8, '测试作业1', 160, 84, '2021-12-27 13:43:42', NULL);
INSERT INTO `teachplan_work` VALUES (19, 24, '最终测试', 165, 85, '2021-12-27 15:55:17', NULL);
INSERT INTO `teachplan_work` VALUES (21, 8, '测试作业1', 135, 76, '2021-12-27 16:06:23', NULL);
INSERT INTO `teachplan_work` VALUES (22, 24, '最终测试', 166, 85, '2021-12-27 16:09:17', NULL);
INSERT INTO `teachplan_work` VALUES (23, 24, '最终测试', 173, 86, '2021-12-27 20:02:03', NULL);
INSERT INTO `teachplan_work` VALUES (24, 8, '测试作业1', 174, 86, '2021-12-27 20:02:34', NULL);
INSERT INTO `teachplan_work` VALUES (25, 8, '测试作业1', 177, 86, '2021-12-27 20:03:03', NULL);
INSERT INTO `teachplan_work` VALUES (26, 8, '测试作业1', 180, 87, '2021-12-27 20:14:25', NULL);
INSERT INTO `teachplan_work` VALUES (27, 20, '测试作业', 181, 87, '2021-12-27 20:14:36', NULL);
INSERT INTO `teachplan_work` VALUES (28, 8, '测试作业1', 184, 88, '2021-12-27 20:15:05', NULL);
INSERT INTO `teachplan_work` VALUES (29, 8, '测试作业1', 192, 90, '2021-12-27 20:27:33', NULL);
INSERT INTO `teachplan_work` VALUES (30, 8, '测试作业1', 196, 91, '2021-12-27 20:35:41', NULL);
INSERT INTO `teachplan_work` VALUES (31, 24, '最终测试', 200, 92, '2021-12-27 20:53:50', NULL);
INSERT INTO `teachplan_work` VALUES (32, 24, '最终测试', 201, 92, '2021-12-27 20:54:06', NULL);
INSERT INTO `teachplan_work` VALUES (33, 25, '小母猪', 207, 93, '2021-12-27 23:23:38', NULL);
INSERT INTO `teachplan_work` VALUES (34, 26, '小母牛', 208, 93, '2021-12-27 23:23:48', NULL);
INSERT INTO `teachplan_work` VALUES (35, 24, '最终测试', 214, 94, '2021-12-27 23:48:28', NULL);
INSERT INTO `teachplan_work` VALUES (36, 25, '小母猪', 215, 94, '2021-12-27 23:48:36', NULL);
INSERT INTO `teachplan_work` VALUES (37, 26, '小母牛', 216, 94, '2021-12-27 23:48:44', NULL);
INSERT INTO `teachplan_work` VALUES (39, 29, '真最终测试', 222, 95, '2021-12-28 02:08:28', NULL);
INSERT INTO `teachplan_work` VALUES (40, 8, '测试作业1', 221, 95, '2021-12-28 02:08:36', NULL);
INSERT INTO `teachplan_work` VALUES (41, 8, '测试作业1', 226, 96, '2021-12-28 03:11:04', NULL);
INSERT INTO `teachplan_work` VALUES (42, 32, '项目展示', 233, 97, '2021-12-28 03:37:11', NULL);
INSERT INTO `teachplan_work` VALUES (43, 20, '测试作业', 235, 97, '2021-12-28 03:39:08', NULL);
INSERT INTO `teachplan_work` VALUES (44, 32, '项目展示', 236, 97, '2021-12-28 03:40:56', NULL);

SET FOREIGN_KEY_CHECKS = 1;
