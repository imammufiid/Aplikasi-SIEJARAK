/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100408
 Source Host           : localhost:3306
 Source Schema         : uas_dijkstra

 Target Server Type    : MySQL
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 26/01/2020 10:51:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _sys_group
-- ----------------------------
DROP TABLE IF EXISTS `_sys_group`;
CREATE TABLE `_sys_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_group
-- ----------------------------
INSERT INTO `_sys_group` VALUES (1, 'Administrator');
INSERT INTO `_sys_group` VALUES (2, 'Pengguna');
INSERT INTO `_sys_group` VALUES (3, 'Admin Ujian');

-- ----------------------------
-- Table structure for _sys_navbar
-- ----------------------------
DROP TABLE IF EXISTS `_sys_navbar`;
CREATE TABLE `_sys_navbar`  (
  `navbar_id` int(11) NOT NULL AUTO_INCREMENT,
  `navbar_parent` int(11) NULL DEFAULT 0,
  `navbar_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `navbar_href` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `navbar_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'fa fa-angle-right',
  `navbar_index` int(5) NULL DEFAULT NULL,
  `navbar_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`navbar_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _sys_navbar_access
-- ----------------------------
DROP TABLE IF EXISTS `_sys_navbar_access`;
CREATE TABLE `_sys_navbar_access`  (
  `navbar_access_group_id` int(11) NULL DEFAULT NULL,
  `navbar_access_navbar_id` int(11) NULL DEFAULT NULL,
  `navbar_access_create` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `navbar_access_read` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `navbar_access_update` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `navbar_access_delete` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  INDEX `access_sidebar_id`(`navbar_access_navbar_id`) USING BTREE,
  INDEX `access_group_id`(`navbar_access_group_id`) USING BTREE,
  CONSTRAINT `_sys_navbar_access_ibfk_1` FOREIGN KEY (`navbar_access_navbar_id`) REFERENCES `_sys_navbar` (`navbar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_sys_navbar_access_ibfk_2` FOREIGN KEY (`navbar_access_group_id`) REFERENCES `_sys_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for _sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `_sys_setting`;
CREATE TABLE `_sys_setting`  (
  `setting_web_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setting_web_credit` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setting_web_credit_href` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setting_web_logo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `setting_web_icon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_setting
-- ----------------------------
INSERT INTO `_sys_setting` VALUES ('SIEJARAK', 'siejarak', 'http://google.com', 'assets/media/logos/logo.png', 'assets/media/logos/logo.png');

-- ----------------------------
-- Table structure for _sys_sidebar
-- ----------------------------
DROP TABLE IF EXISTS `_sys_sidebar`;
CREATE TABLE `_sys_sidebar`  (
  `sidebar_id` int(11) NOT NULL AUTO_INCREMENT,
  `sidebar_parent` int(11) NULL DEFAULT 0,
  `sidebar_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sidebar_href` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sidebar_icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'fa fa-angle-right',
  `sidebar_index` int(5) NULL DEFAULT NULL,
  `sidebar_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`sidebar_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_sidebar
-- ----------------------------
INSERT INTO `_sys_sidebar` VALUES (2, 0, 'System', '#', ' flaticon2-gear', 99, '1');
INSERT INTO `_sys_sidebar` VALUES (15, 2, 'Sidebars', 'core/sidebars', 'flaticon2-files-and-folders', 3, '1');
INSERT INTO `_sys_sidebar` VALUES (16, 2, 'Navbars', 'core/navbars', 'flaticon2-ui', 4, '1');
INSERT INTO `_sys_sidebar` VALUES (17, 2, 'Users', 'core/users', 'flaticon2-user-1', 1, '1');
INSERT INTO `_sys_sidebar` VALUES (18, 2, 'Groups', 'core/groups', ' flaticon2-group', 2, '1');
INSERT INTO `_sys_sidebar` VALUES (19, 2, 'Settings', 'core/settings', ' flaticon2-console', 5, '1');
INSERT INTO `_sys_sidebar` VALUES (21, 0, 'Data Kota', 'lokasi', 'flaticon2-pin', 96, '1');
INSERT INTO `_sys_sidebar` VALUES (22, 0, 'Data Rute', 'rute', ' flaticon2-map', 97, '1');
INSERT INTO `_sys_sidebar` VALUES (24, 0, 'Dashboard', 'dashboard', ' flaticon-pie-chart-1', 1, '1');
INSERT INTO `_sys_sidebar` VALUES (25, 0, 'Aktifitas User', '#', ' flaticon2-poll-symbol', 98, '1');

-- ----------------------------
-- Table structure for _sys_sidebar_access
-- ----------------------------
DROP TABLE IF EXISTS `_sys_sidebar_access`;
CREATE TABLE `_sys_sidebar_access`  (
  `sidebar_access_group_id` int(11) NULL DEFAULT NULL,
  `sidebar_access_sidebar_id` int(11) NULL DEFAULT NULL,
  `sidebar_access_create` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `sidebar_access_read` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `sidebar_access_update` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `sidebar_access_delete` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  INDEX `id_sidebar`(`sidebar_access_sidebar_id`) USING BTREE,
  INDEX `id_sidebar_group`(`sidebar_access_group_id`) USING BTREE,
  CONSTRAINT `_sys_sidebar_access_ibfk_1` FOREIGN KEY (`sidebar_access_sidebar_id`) REFERENCES `_sys_sidebar` (`sidebar_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_sys_sidebar_access_ibfk_2` FOREIGN KEY (`sidebar_access_group_id`) REFERENCES `_sys_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_sidebar_access
-- ----------------------------
INSERT INTO `_sys_sidebar_access` VALUES (2, 2, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (2, 15, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (2, 16, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 17, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 18, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (2, 19, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (3, 2, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 15, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 16, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 17, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 18, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 19, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 21, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 22, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (3, 24, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (3, 25, '0', '0', '0', '0');
INSERT INTO `_sys_sidebar_access` VALUES (1, 2, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 15, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 16, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 17, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 18, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 19, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 21, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 22, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 24, '1', '1', '1', '1');
INSERT INTO `_sys_sidebar_access` VALUES (1, 25, '1', '1', '1', '1');

-- ----------------------------
-- Table structure for _sys_status
-- ----------------------------
DROP TABLE IF EXISTS `_sys_status`;
CREATE TABLE `_sys_status`  (
  `status_id` int(2) NOT NULL,
  `status_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_status
-- ----------------------------
INSERT INTO `_sys_status` VALUES (0, 'Non-Aktif');
INSERT INTO `_sys_status` VALUES (1, 'Aktif');

-- ----------------------------
-- Table structure for _sys_user
-- ----------------------------
DROP TABLE IF EXISTS `_sys_user`;
CREATE TABLE `_sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_birth` date NULL DEFAULT NULL,
  `user_phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `user_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_group_id` int(11) NULL DEFAULT NULL,
  `user_status_id` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `group_id`(`user_group_id`) USING BTREE,
  CONSTRAINT `_sys_user_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `_sys_group` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of _sys_user
-- ----------------------------
INSERT INTO `_sys_user` VALUES (1, 'Mas', 'Admin', '1996-03-23', '085655209270', 'admin@admin.com', 'Sumberdiren, Garum, Blitar', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 1, '1');
INSERT INTO `_sys_user` VALUES (2, 'Pengguna', 'Metronic', '1996-05-25', '0857478858585', 'user@user.com', 'Minggirsari, Kanigoro, Blitar', 'user', '', 2, '1');
INSERT INTO `_sys_user` VALUES (3, 'Kasir', 'Kasirun', '1997-11-05', '08574858528', 'kasir@admin.com', 'Sumberjo, Ngadirejo, Blitar', 'kasirun', '5f4dcc3b5aa765d61d8327deb882cf99', 2, '1');
INSERT INTO `_sys_user` VALUES (4, 'adm ptd1', 'adm', '2019-12-18', '123', '123@123', '123', 'admujn1', '5f4dcc3b5aa765d61d8327deb882cf99', 3, '1');

-- ----------------------------
-- Table structure for graph
-- ----------------------------
DROP TABLE IF EXISTS `graph`;
CREATE TABLE `graph`  (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `asal` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tujuan` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jarak` decimal(11, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`no`) USING BTREE,
  INDEX `asal`(`asal`) USING BTREE,
  INDEX `tujuan`(`tujuan`) USING BTREE,
  CONSTRAINT `graph_ibfk_1` FOREIGN KEY (`asal`) REFERENCES `jalan` (`id_jalan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `graph_ibfk_2` FOREIGN KEY (`tujuan`) REFERENCES `jalan` (`id_jalan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of graph
-- ----------------------------
INSERT INTO `graph` VALUES (1, 'tyrj', 'bktm', 950);
INSERT INTO `graph` VALUES (2, 'tyrj', 'irgt', 300);
INSERT INTO `graph` VALUES (3, 'irgt', 'bktm', 650);
INSERT INTO `graph` VALUES (4, 'bktm', 'trwl', 500);
INSERT INTO `graph` VALUES (5, 'bktm', 'krya', 280);
INSERT INTO `graph` VALUES (6, 'bktm', 'kstm', 550);
INSERT INTO `graph` VALUES (7, 'bktm', 'gnjy', 500);
INSERT INTO `graph` VALUES (8, 'bktm', 'imbj', 1300);
INSERT INTO `graph` VALUES (9, 'trwl', 'krya', 800);
INSERT INTO `graph` VALUES (10, 'trwl', 'kstm', 1100);
INSERT INTO `graph` VALUES (11, 'krya', 'kstm', 550);
INSERT INTO `graph` VALUES (12, 'krya', 'prtd', 260);
INSERT INTO `graph` VALUES (13, 'kstm', 'prtd', 290);
INSERT INTO `graph` VALUES (14, 'imbj', 'mjph', 1200);
INSERT INTO `graph` VALUES (15, 'imbj', 'klmt', 1300);
INSERT INTO `graph` VALUES (16, 'imbj', 'ahyn', 1500);
INSERT INTO `graph` VALUES (17, 'mjph', 'klmt', 1900);
INSERT INTO `graph` VALUES (18, 'mjph', 'ahyn', 2300);
INSERT INTO `graph` VALUES (19, 'klmt', 'lgnd', 750);
INSERT INTO `graph` VALUES (20, 'klmt', 'nias', 900);
INSERT INTO `graph` VALUES (21, 'klmt', 'kngn', 700);
INSERT INTO `graph` VALUES (22, 'klmt', 'riau', 550);
INSERT INTO `graph` VALUES (23, 'klmt', 'mdra', 1400);
INSERT INTO `graph` VALUES (24, 'klmt', 'mntw', 450);
INSERT INTO `graph` VALUES (25, 'klmt', 'bntn', 550);
INSERT INTO `graph` VALUES (26, 'klmt', 'trkn', 600);
INSERT INTO `graph` VALUES (27, 'klmt', 'bltn', 850);
INSERT INTO `graph` VALUES (28, 'klmt', 'bton', 750);
INSERT INTO `graph` VALUES (29, 'klmt', 'gprg', 1600);
INSERT INTO `graph` VALUES (30, 'klmt', 'bali', 1200);
INSERT INTO `graph` VALUES (31, 'nias', 'kngn', 800);
INSERT INTO `graph` VALUES (32, 'nias', 'riau', 350);
INSERT INTO `graph` VALUES (33, 'nias', 'mdra', 1600);
INSERT INTO `graph` VALUES (34, 'kngn', 'mdra', 800);
INSERT INTO `graph` VALUES (35, 'kngn', 'riau', 550);
INSERT INTO `graph` VALUES (36, 'riau', 'mdra', 1200);
INSERT INTO `graph` VALUES (37, 'bntn', 'ahyn', 100);
INSERT INTO `graph` VALUES (38, 'bntn', 'bltn', 240);
INSERT INTO `graph` VALUES (39, 'bntn', 'bton', 900);
INSERT INTO `graph` VALUES (40, 'trkn', 'bltn', 650);
INSERT INTO `graph` VALUES (41, 'trkn', 'bton', 600);
INSERT INTO `graph` VALUES (42, 'bton', 'bltn', 650);
INSERT INTO `graph` VALUES (43, 'bktm', 'ptmr', 900);
INSERT INTO `graph` VALUES (44, 'mndt', 'sprt', 750);
INSERT INTO `graph` VALUES (45, 'egno', 'krmt', 950);
INSERT INTO `graph` VALUES (46, 'smba', 'keld', 1000);

-- ----------------------------
-- Table structure for jalan
-- ----------------------------
DROP TABLE IF EXISTS `jalan`;
CREATE TABLE `jalan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jalan` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama_jalan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_jalan`(`id_jalan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jalan
-- ----------------------------
INSERT INTO `jalan` VALUES (1, 'ahyn', 'BLITAR', 0);
INSERT INTO `jalan` VALUES (2, 'bali', 'MALANG', 0);
INSERT INTO `jalan` VALUES (3, 'bktm', 'KEDIRI', 0);
INSERT INTO `jalan` VALUES (4, 'bltn', 'TULUNGAGUNG', 0);
INSERT INTO `jalan` VALUES (5, 'bntn', 'TRENGGALEK', 0);
INSERT INTO `jalan` VALUES (6, 'bton', 'NGANJUK', 0);
INSERT INTO `jalan` VALUES (7, 'egno', 'PROBOLINGGO', 0);
INSERT INTO `jalan` VALUES (8, 'gnjy', 'LUMAJANG', 0);
INSERT INTO `jalan` VALUES (9, 'gprg', 'SURABAYA', 0);
INSERT INTO `jalan` VALUES (10, 'imbj', 'GRESIK', 0);
INSERT INTO `jalan` VALUES (11, 'irgt', 'BANYUWANGI', 0);
INSERT INTO `jalan` VALUES (12, 'keld', 'JEMBER', 0);
INSERT INTO `jalan` VALUES (13, 'klmt', 'BATU', 0);
INSERT INTO `jalan` VALUES (14, 'kngn', 'MADIUN', 0);
INSERT INTO `jalan` VALUES (15, 'krmt', 'PASURUAN', 0);
INSERT INTO `jalan` VALUES (16, 'krya', 'MOJOKERTO', 0);
INSERT INTO `jalan` VALUES (17, 'kstm', 'JOMBANG', 0);
INSERT INTO `jalan` VALUES (18, 'lgnd', 'SUMENEP', 0);
INSERT INTO `jalan` VALUES (19, 'mdra', 'BOJONEGORO', 0);
INSERT INTO `jalan` VALUES (20, 'mjph', 'BONDOWOSO', 0);
INSERT INTO `jalan` VALUES (21, 'mndt', 'PAMEKASAN', 0);
INSERT INTO `jalan` VALUES (22, 'mntw', 'BANGKALAN', 0);
INSERT INTO `jalan` VALUES (23, 'nias', 'LAMONGAN', 0);
INSERT INTO `jalan` VALUES (24, 'prtd', 'MAGETAN', 0);
INSERT INTO `jalan` VALUES (25, 'ptmr', 'PACITAN', 0);
INSERT INTO `jalan` VALUES (26, 'riau', 'NGAWI', 0);
INSERT INTO `jalan` VALUES (27, 'smba', 'PAMEKASAN', 0);
INSERT INTO `jalan` VALUES (28, 'sprt', 'SAMPANG', 0);
INSERT INTO `jalan` VALUES (29, 'trkn', 'SIDOARJO', 0);
INSERT INTO `jalan` VALUES (30, 'trwl', 'TUBAN', 0);
INSERT INTO `jalan` VALUES (31, 'tyrj', 'SITUBONDO', 0);

-- ----------------------------
-- View structure for v_rute
-- ----------------------------
DROP VIEW IF EXISTS `v_rute`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_rute` AS select a.no,
(select b.nama_jalan from jalan b where b.id_jalan = a.asal) as asal,
(select c.nama_jalan from jalan c where c.id_jalan = a.tujuan) as tujuan,
a.jarak
 from graph a ; ;

-- ----------------------------
-- View structure for _v_sys_navbar
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_navbar`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `_v_sys_navbar` AS select `_sys_navbar`.`navbar_id` AS `navbar_id`,`_sys_navbar`.`navbar_parent` AS `navbar_parent`,(select if((`_sys_navbar`.`navbar_parent` = 0),'Parent',(select `nvbar`.`navbar_label` from `_sys_navbar` `nvbar` where (`nvbar`.`navbar_id` = `_sys_navbar`.`navbar_parent`)))) AS `navbar_parent_label`,(select `nvbar`.`navbar_label` from `_sys_navbar` `nvbar` where (`nvbar`.`navbar_id` = `_sys_navbar`.`navbar_parent`)) AS `navbar_child_parent_label`,`_sys_navbar`.`navbar_label` AS `navbar_label`,`_sys_navbar`.`navbar_href` AS `navbar_href`,`_sys_navbar`.`navbar_icon` AS `navbar_icon`,`_sys_navbar`.`navbar_index` AS `navbar_index`,`_sys_navbar`.`navbar_status` AS `navbar_status`,`_sys_status`.`status_id` AS `status_id`,`_sys_status`.`status_label` AS `status_label` from (`_sys_navbar` join `_sys_status` on((`_sys_status`.`status_id` = `_sys_navbar`.`navbar_status`))) ; ;

-- ----------------------------
-- View structure for _v_sys_page_access
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_page_access`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `_v_sys_page_access` AS select `_sys_sidebar_access`.`sidebar_access_group_id` AS `group_id`,`_sys_sidebar`.`sidebar_label` AS `label`,`_sys_sidebar`.`sidebar_icon` AS `icon`,`_sys_sidebar`.`sidebar_href` AS `href`,`_sys_sidebar_access`.`sidebar_access_create` AS `create`,`_sys_sidebar_access`.`sidebar_access_read` AS `read`,`_sys_sidebar_access`.`sidebar_access_update` AS `update`,`_sys_sidebar_access`.`sidebar_access_delete` AS `delete` from (`_sys_sidebar_access` join `_sys_sidebar` on((`_sys_sidebar_access`.`sidebar_access_sidebar_id` = `_sys_sidebar`.`sidebar_id`))) union select `_sys_navbar_access`.`navbar_access_group_id` AS `group_id`,`_sys_navbar`.`navbar_label` AS `label`,`_sys_navbar`.`navbar_icon` AS `icon`,`_sys_navbar`.`navbar_href` AS `href`,`_sys_navbar_access`.`navbar_access_create` AS `create`,`_sys_navbar_access`.`navbar_access_read` AS `read`,`_sys_navbar_access`.`navbar_access_update` AS `update`,`_sys_navbar_access`.`navbar_access_delete` AS `delete` from (`_sys_navbar_access` join `_sys_navbar` on((`_sys_navbar_access`.`navbar_access_navbar_id` = `_sys_navbar`.`navbar_id`))) order by `group_id` ; ;

-- ----------------------------
-- View structure for _v_sys_sidebar
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_sidebar`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `_v_sys_sidebar` AS select `_sys_sidebar`.`sidebar_id` AS `sidebar_id`,`_sys_sidebar`.`sidebar_parent` AS `sidebar_parent`,(select if((`_sys_sidebar`.`sidebar_parent` = 0),'Parent',(select `sdbar`.`sidebar_label` from `_sys_sidebar` `sdbar` where (`sdbar`.`sidebar_id` = `_sys_sidebar`.`sidebar_parent`)))) AS `sidebar_parent_label`,(select `sdbar`.`sidebar_label` from `_sys_sidebar` `sdbar` where (`sdbar`.`sidebar_id` = `_sys_sidebar`.`sidebar_parent`)) AS `sidebar_child_parent_label`,`_sys_sidebar`.`sidebar_label` AS `sidebar_label`,`_sys_sidebar`.`sidebar_href` AS `sidebar_href`,`_sys_sidebar`.`sidebar_icon` AS `sidebar_icon`,`_sys_sidebar`.`sidebar_index` AS `sidebar_index`,`_sys_sidebar`.`sidebar_status` AS `sidebar_status`,`_sys_status`.`status_id` AS `status_id`,`_sys_status`.`status_label` AS `status_label` from (`_sys_sidebar` join `_sys_status` on((`_sys_status`.`status_id` = `_sys_sidebar`.`sidebar_status`))) ; ;

-- ----------------------------
-- View structure for _v_sys_user
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `_v_sys_user` AS select `_sys_user`.`user_id` AS `user_id`,`_sys_user`.`user_firstname` AS `user_firstname`,`_sys_user`.`user_lastname` AS `user_lastname`,`_sys_user`.`user_birth` AS `user_birth`,`_sys_user`.`user_phone` AS `user_phone`,`_sys_user`.`user_email` AS `user_email`,`_sys_user`.`user_address` AS `user_address`,`_sys_user`.`user_username` AS `user_username`,`_sys_user`.`user_password` AS `user_password`,`_sys_user`.`user_group_id` AS `user_group_id`,`_sys_user`.`user_status_id` AS `user_status_id`,`_sys_group`.`group_id` AS `group_id`,`_sys_group`.`group_label` AS `group_label`,`_sys_status`.`status_id` AS `status_id`,`_sys_status`.`status_label` AS `status_label` from ((`_sys_user` join `_sys_group` on((`_sys_group`.`group_id` = `_sys_user`.`user_group_id`))) join `_sys_status` on((`_sys_status`.`status_id` = `_sys_user`.`user_status_id`))) ; ;

SET FOREIGN_KEY_CHECKS = 1;
