

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
INSERT INTO `_sys_sidebar` VALUES (25, 0, 'Aktifitas User', '#', ' flaticon2-poll-symbol', 98, '0');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kota_asal` int(11) NULL DEFAULT NULL,
  `id_kota_tujuan` int(11) NULL DEFAULT NULL,
  `jarak` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_kota_asal`(`id_kota_asal`) USING BTREE,
  INDEX `id_kota_tujuan`(`id_kota_tujuan`) USING BTREE,
  CONSTRAINT `graph_ibfk_1` FOREIGN KEY (`id_kota_asal`) REFERENCES `jalan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `graph_ibfk_2` FOREIGN KEY (`id_kota_tujuan`) REFERENCES `jalan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of graph
-- ----------------------------
INSERT INTO `graph` VALUES (1, 33, 34, 2500);
INSERT INTO `graph` VALUES (2, 33, 35, 500);
INSERT INTO `graph` VALUES (3, 33, 36, 1000);
INSERT INTO `graph` VALUES (5, 35, 36, 900);

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
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jalan
-- ----------------------------
INSERT INTO `jalan` VALUES (33, 'BLT', 'Blitar', 1);
INSERT INTO `jalan` VALUES (34, 'MLG', 'Malang', 1);
INSERT INTO `jalan` VALUES (35, 'KDR', 'Kediri', 1);
INSERT INTO `jalan` VALUES (36, 'TLG', 'Tulungagung', 1);

-- ----------------------------
-- View structure for v_rute
-- ----------------------------
DROP VIEW IF EXISTS `v_rute`;
CREATE VIEW `v_rute` AS SELECT
	a.id,
	( SELECT b.nama_jalan FROM jalan b WHERE b.id = a.id_kota_asal ) AS asal,
	( SELECT c.nama_jalan FROM jalan c WHERE c.id = a.id_kota_tujuan ) AS tujuan,
	a.jarak 
FROM
	graph a ;

-- ----------------------------
-- View structure for _v_sys_navbar
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_navbar`;
CREATE VIEW `_v_sys_navbar` AS select `_sys_navbar`.`navbar_id` AS `navbar_id`,`_sys_navbar`.`navbar_parent` AS `navbar_parent`,(select if((`_sys_navbar`.`navbar_parent` = 0),'Parent',(select `nvbar`.`navbar_label` from `_sys_navbar` `nvbar` where (`nvbar`.`navbar_id` = `_sys_navbar`.`navbar_parent`)))) AS `navbar_parent_label`,(select `nvbar`.`navbar_label` from `_sys_navbar` `nvbar` where (`nvbar`.`navbar_id` = `_sys_navbar`.`navbar_parent`)) AS `navbar_child_parent_label`,`_sys_navbar`.`navbar_label` AS `navbar_label`,`_sys_navbar`.`navbar_href` AS `navbar_href`,`_sys_navbar`.`navbar_icon` AS `navbar_icon`,`_sys_navbar`.`navbar_index` AS `navbar_index`,`_sys_navbar`.`navbar_status` AS `navbar_status`,`_sys_status`.`status_id` AS `status_id`,`_sys_status`.`status_label` AS `status_label` from (`_sys_navbar` join `_sys_status` on((`_sys_status`.`status_id` = `_sys_navbar`.`navbar_status`))) ; ;

-- ----------------------------
-- View structure for _v_sys_page_access
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_page_access`;
CREATE VIEW `_v_sys_page_access` AS select `_sys_sidebar_access`.`sidebar_access_group_id` AS `group_id`,`_sys_sidebar`.`sidebar_label` AS `label`,`_sys_sidebar`.`sidebar_icon` AS `icon`,`_sys_sidebar`.`sidebar_href` AS `href`,`_sys_sidebar_access`.`sidebar_access_create` AS `create`,`_sys_sidebar_access`.`sidebar_access_read` AS `read`,`_sys_sidebar_access`.`sidebar_access_update` AS `update`,`_sys_sidebar_access`.`sidebar_access_delete` AS `delete` from (`_sys_sidebar_access` join `_sys_sidebar` on((`_sys_sidebar_access`.`sidebar_access_sidebar_id` = `_sys_sidebar`.`sidebar_id`))) union select `_sys_navbar_access`.`navbar_access_group_id` AS `group_id`,`_sys_navbar`.`navbar_label` AS `label`,`_sys_navbar`.`navbar_icon` AS `icon`,`_sys_navbar`.`navbar_href` AS `href`,`_sys_navbar_access`.`navbar_access_create` AS `create`,`_sys_navbar_access`.`navbar_access_read` AS `read`,`_sys_navbar_access`.`navbar_access_update` AS `update`,`_sys_navbar_access`.`navbar_access_delete` AS `delete` from (`_sys_navbar_access` join `_sys_navbar` on((`_sys_navbar_access`.`navbar_access_navbar_id` = `_sys_navbar`.`navbar_id`))) order by `group_id` ; ;

-- ----------------------------
-- View structure for _v_sys_sidebar
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_sidebar`;
CREATE VIEW `_v_sys_sidebar` AS select `_sys_sidebar`.`sidebar_id` AS `sidebar_id`,`_sys_sidebar`.`sidebar_parent` AS `sidebar_parent`,(select if((`_sys_sidebar`.`sidebar_parent` = 0),'Parent',(select `sdbar`.`sidebar_label` from `_sys_sidebar` `sdbar` where (`sdbar`.`sidebar_id` = `_sys_sidebar`.`sidebar_parent`)))) AS `sidebar_parent_label`,(select `sdbar`.`sidebar_label` from `_sys_sidebar` `sdbar` where (`sdbar`.`sidebar_id` = `_sys_sidebar`.`sidebar_parent`)) AS `sidebar_child_parent_label`,`_sys_sidebar`.`sidebar_label` AS `sidebar_label`,`_sys_sidebar`.`sidebar_href` AS `sidebar_href`,`_sys_sidebar`.`sidebar_icon` AS `sidebar_icon`,`_sys_sidebar`.`sidebar_index` AS `sidebar_index`,`_sys_sidebar`.`sidebar_status` AS `sidebar_status`,`_sys_status`.`status_id` AS `status_id`,`_sys_status`.`status_label` AS `status_label` from (`_sys_sidebar` join `_sys_status` on((`_sys_status`.`status_id` = `_sys_sidebar`.`sidebar_status`))) ; ;

-- ----------------------------
-- View structure for _v_sys_user
-- ----------------------------
DROP VIEW IF EXISTS `_v_sys_user`;
CREATE VIEW `_v_sys_user` AS select `_sys_user`.`user_id` AS `user_id`,`_sys_user`.`user_firstname` AS `user_firstname`,`_sys_user`.`user_lastname` AS `user_lastname`,`_sys_user`.`user_birth` AS `user_birth`,`_sys_user`.`user_phone` AS `user_phone`,`_sys_user`.`user_email` AS `user_email`,`_sys_user`.`user_address` AS `user_address`,`_sys_user`.`user_username` AS `user_username`,`_sys_user`.`user_password` AS `user_password`,`_sys_user`.`user_group_id` AS `user_group_id`,`_sys_user`.`user_status_id` AS `user_status_id`,`_sys_group`.`group_id` AS `group_id`,`_sys_group`.`group_label` AS `group_label`,`_sys_status`.`status_id` AS `status_id`,`_sys_status`.`status_label` AS `status_label` from ((`_sys_user` join `_sys_group` on((`_sys_group`.`group_id` = `_sys_user`.`user_group_id`))) join `_sys_status` on((`_sys_status`.`status_id` = `_sys_user`.`user_status_id`))) ; ;

SET FOREIGN_KEY_CHECKS = 1;
