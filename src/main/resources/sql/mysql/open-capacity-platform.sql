/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 100211
 Source Host           : localhost:3306
 Source Schema         : open_capacity_platform

 Target Server Type    : MySQL
 Target Server Version : 100211
 File Encoding         : 65001
utf8mb4_general_ci
 Date: 14/05/2018 17:20:42
*/

DROP DATABASE IF EXISTS open_capacity_platform;
CREATE DATABASE open_capacity_platform DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE open_capacity_platform;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `css` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_menu` int(11) DEFAULT NULL COMMENT '是否菜单 1 是 2 不是',
  `hidden` int(11) DEFAULT NULL COMMENT '是否隐藏,0 false 1 true',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;

INSERT INTO `sys_menu` VALUES 
(1,-1,'后台管理','javascript:;','','layui-icon-set',2,'2019-09-05 11:37:02','2019-09-05 11:37:02',1,0),
(2,1,'用户管理','#!user','system/user.html','layui-icon-friends',2,'2017-11-17 16:56:59','2019-09-05 11:37:26',1,0),
(3,1,'角色管理','#!role','system/role.html','layui-icon-friends',3,'2017-11-17 16:56:59','2019-09-05 11:37:38',1,0),
(4,1,'菜单管理','#!menus','system/menus.html','layui-icon-menu-fill',4,'2017-11-17 16:56:59','2019-09-05 11:37:57',1,0),
(5,1,'权限管理','#!permissions','system/permissions.html','layui-icon-password',5,'2017-11-17 16:56:59','2019-09-05 11:37:47',1,0),
(6,1,'我的信息','#!myInfo','system/myInfo.html','',10,'2017-11-17 16:56:59','2018-09-02 06:12:24',1,1),
(7,-1,'认证中心','javascript:;','','layui-icon-set',1,'2017-11-17 16:56:59','2019-03-26 06:56:46',1,0),
(8,7,'应用管理','#!app','attestation/app.html','layui-icon-app',9,'2017-11-17 16:56:59','2018-08-25 10:57:42',1,0),
(9,7,'服务管理','#!services','attestation/services.html','layui-icon-website',8,'2017-11-17 16:56:59','2018-09-02 09:34:13',1,0),
(10,7,'令牌管理','#!token','attestation/token.html','layui-icon-util',11,'2018-09-08 13:19:56','2019-05-27 09:28:39',1,0),
(11,-1,'系统监控','javascript:;','','layui-icon-set',3,'2018-08-25 10:41:58','2018-08-25 10:41:58',1,0),
(12,11,'注册中心','#!register','http://127.0.0.1:1111/','layui-icon-engine',2,'2017-11-17 16:56:59','2019-05-25 20:34:50',1,0),
(13,11,'服务治理','#!eureka','eureka/list.html','layui-icon-engine',1,'2018-08-30 15:30:19','2019-05-25 20:34:40',1,0),
(14,11,'慢查询','#!sql','system/sql.html','layui-icon-util',11,'2017-11-17 16:56:59','2019-05-25 20:35:20',1,0),
(15,11,'文件中心','#!files','files/files.html','layui-icon-file',10,'2017-11-17 16:56:59','2018-08-25 10:43:33',1,0),
(16,11,'文档中心','#!swagger','http://127.0.0.1:9200/swagger-ui.html','layui-icon-app',9,'2017-11-17 16:56:59','2019-03-26 02:32:46',1,0),
(17,11,'代码生成器','#!generator','generator/list.html','layui-icon-app',999,'2018-09-05 13:43:06','2019-05-26 17:01:46',1,0),
(18,11,'日志中心','#!log','system/log.html','layui-icon-engine',18,'2019-03-11 06:30:01','2019-05-25 20:35:35',1,0),
(19,11,'prometheus监控','#!prometheus','http://127.0.0.1:9090','layui-icon-engine',1111,'2019-03-27 11:23:31','2019-05-25 21:13:08',1,0),
(20,-1,'任务中心','javascript:;','','layui-icon-set',4,'2018-08-28 16:59:44','2018-08-28 17:00:19',1,0),
(21,20,'任务管理','#!jobinfo','http://127.0.0.1:8888/jobinfo','layui-icon-senior',1,'2018-08-28 17:02:00','2018-08-28 18:24:23',1,0),
(22,20,'调度日志','#!joblog','http://127.0.0.1:8888/joblog','layui-icon-senior',2,'2018-08-28 18:20:53','2018-08-28 18:24:32',1,0),
(23,20,'执行器管理','#!jobgroup','http://127.0.0.1:8888/jobgroup','layui-icon-senior',3,'2018-08-28 18:22:04','2018-09-03 08:05:02',1,0),
(24,-1,'用户地图','#!map','baiduMap/userMap.html','layui-icon-engine',111111,'2019-06-14 21:28:54','2019-06-14 21:28:54',1,0),
(25,-1,'路由管理','#!route','route/route.html','layui-icon-engine',111111,'2019-06-14 21:28:54','2019-06-14 21:28:54',1,0);


DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission` (`permission`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

INSERT INTO `sys_permission` VALUES (1, 'permission:post/permissions', '保存权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (2, 'permission:put/permissions', '修改权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (3, 'permission:delete/permissions/{id}', '删除权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (4, 'permission:get/permissions', '查询权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (5,'/permissions/{roleId}/permissions','查看角色权限','2018-01-18 17:06:39','2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (6,'/permissions/granted','角色分配权限','2018-01-18 17:06:39','2018-01-18 17:06:39');
INSERT INTO `sys_permission` VALUES (7, 'role:post/roles', '添加角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (8, 'role:put/roles', '修改角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (9, 'role:delete/roles/{id}', '删除角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (10, 'role:post/roles/{id}/permissions', '给角色分配权限', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (11, 'role:get/roles', '查询角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (12, 'role:get/roles/{id}/permissions', '获取角色的权限', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (13, 'user:post/users/{id}/roles', '给用户分配角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (14, 'user:post/users/{id}/resetPassword', '用户重置密码', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (15, 'user:get/users', '用户查询', '2018-01-18 17:12:00', '2018-01-18 17:12:05');
INSERT INTO `sys_permission` VALUES (16, 'user:put/users/me', '修改用户', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (17, 'user:get/users/{id}/roles', '获取用户的角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (18, 'user:post/users/saveOrUpdate', '新增用户', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (19, 'user:post/users/exportUser', '导出用户', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (20, 'user:get/users/updateEnabled', '用户状态修改', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (21, 'user:put/users/password', '修改密码', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO `sys_permission` VALUES (22, 'menu:get/menus/all', '查询菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (23, 'menu:post/menus/granted', '给角色分配菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (24, 'menu:get/menus/tree', '树形显示', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO `sys_permission` VALUES (25, 'menu:get/menus/{roleId}/menus', '获取角色的菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (26, 'menu:post/menus', '添加菜单', '2018-01-18 17:06:39', '2018-09-04 07:35:29');
INSERT INTO `sys_permission` VALUES (27, 'menu:put/menus', '修改菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (28, 'menu:delete/menus/{id}', '删除菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (29, 'menu:get/menus/current', '当前用户菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (30, 'menu:get/menus/findAlls', '所有菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO `sys_permission` VALUES (31, 'client:post/clients', '保存应用', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO `sys_permission` VALUES (32, 'client:get/clients', '应用列表', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO `sys_permission` VALUES (33, 'client:get/clients/{id}', '根据id获取应用', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO `sys_permission` VALUES (34, 'client:delete/clients', '删除应用', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO `sys_permission` VALUES (35, 'service:get/service/findAlls', '查询所有服务', '2018-01-18 17:06:39', '2018-09-03 08:05:09');
INSERT INTO `sys_permission` VALUES (36, 'service:get/service/findOnes', '服务树', '2018-01-18 17:06:39', '2018-09-08 03:23:28');
INSERT INTO `sys_permission` VALUES (37, 'menu:get/menus/findOnes', '获取菜单以及顶层菜单', '2019-05-09 23:48:13', '2019-05-09 23:48:13');
INSERT INTO `sys_permission` VALUES (38, 'permission:get/permissions/{roleId}/permissions', '根据roleId获取权限', '2019-05-10 00:02:23', '2019-05-10 00:02:23');
INSERT INTO `sys_permission` VALUES (39, 'file:query', '获取文件列表', '2019-05-17 21:34:05', '2019-05-17 21:34:08');
INSERT INTO `sys_permission` VALUES (40, 'file:del', '删除文件', '2019-05-17 21:36:46', '2019-05-17 21:36:48');

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL COMMENT '角色code',
  `name` varchar(50) NOT NULL COMMENT '角色名',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `sys_role` VALUES (1,'ADMIN','管理员','2017-11-17 16:56:59','2017-11-17 16:56:59'),(3,'002','普通用户','2019-03-27 02:52:00','2019-03-27 02:52:00');


DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `sys_role_menu`  (`role_id`,`menu_id`)  VALUES 
(1,1),(1,2),(1,3),(1,4),(1,5),
(1,6),(1,7),(1,8),(1,9),(1,10),
(1,11),(1,12),(1,13),(1,14),(1,15),
(1,16),(1,17),(1,18),(1,19),(1,20),
(1,21),(1,22),(1,23),(1,24),(1,25);


DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `sys_role_permission` (`role_id`,`permission_id`) VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39);


DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
INSERT INTO `sys_role_user` VALUES (1,1277137734524300032,1),(2,1277120261867529984,1),(3,1277056689447719936,1),(4,1275397643669949952,1);


DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `head_img_url` varchar(1024) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(16) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
INSERT INTO `sys_user` VALUES (1277137734524300032,'admin','$2a$10$Wtw81uu43fGKw9lkOr1RAOTNWxQIZBsB3YDwc/5yDnr/yeG5x92EG','管理员','http://payo7kq4i.bkt.clouddn.com/耳机.jpg','13106975707',1,1,'BACKEND','2017-11-17 16:56:59','2018-09-15 03:12:44'),(1275397643669949952,'test','$2a$10$RD18sHNphJMmcuLuUX/Np.IV/7Ngbjd3Jtj3maFLpwaA6KaHVqPtq','测试账户','http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg','13851539156',0,0,'APP','2017-11-17 16:56:59','2018-09-07 03:27:40'),(1277056689447719936,'user','$2a$10$fL/AfD4RDS0LxLJS7zpaZ.YUMfjNWKVvUn7oiA75L1K6PXazSTJPi','体验用户','http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg',NULL,1,0,'APP','2017-11-17 16:56:59','2018-09-07 13:38:34'),(1277120261867529984,'owen','$2a$10$4WkpmB1jHncBCrzJ7hJRq.SsiEFiyE/FdgPF26hLs8vzPyoNpZjta','欧文','http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg','18579068166',1,0,'APP','2017-11-17 16:56:59','2018-09-12 06:00:31');


DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` varchar(48) NOT NULL COMMENT '应用标识',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源限定串(逗号分割)',
  `client_secret` varchar(256) DEFAULT NULL COMMENT '应用密钥(bcyt) 加密',
  `client_secret_str` varchar(256) DEFAULT NULL COMMENT '应用密钥(明文)',
  `scope` varchar(256) DEFAULT NULL COMMENT '范围',
  `authorized_grant_types` varchar(256) DEFAULT NULL COMMENT '5种oauth授权方式(authorization_code,password,refresh_token,client_credentials)',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '回调地址 ',
  `authorities` varchar(256) DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) DEFAULT NULL COMMENT 'access_token有效期',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT 'refresh_token有效期',
  `additional_information` varchar(4096) DEFAULT '{}' COMMENT '{}',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '是否自动授权 是-true',
  `status` int(1) DEFAULT NULL,
  `if_limit` int(11) NOT NULL DEFAULT '0' COMMENT '是否应用限流',
  `limit_count` int(11) NOT NULL DEFAULT '10000' COMMENT '限流阈值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
INSERT INTO `oauth_client_details` VALUES (1,'app',NULL,'$2a$10$i3F515wEDiB4Gvj9ym9Prui0dasRttEUQ9ink4Wpgb4zEDCAlV8zO','app','app','password,refresh_token',NULL,NULL,180000,NULL,'{}','true',1,0,10000),(2,'mobile','mobile,test','$2a$10$ULxRssv/4NWOc388lZFbyus3IFfsbcpG/BZOq4TRxDhsx5HHIR7Jm','mobile','all','password,refresh_token',NULL,NULL,180000,NULL,'{}','true',1,0,10000),(4,'webApp',NULL,'$2a$10$06msMGYRH8nrm4iVnKFNKOoddB8wOwymVhbUzw/d3ZixD7Nq8ot72','webApp','app','authorization_code,password,refresh_token,client_credentials',NULL,NULL,180000,NULL,'{}','true',1,0,10000),(5,'beck','','$2a$10$56LGyH.2wOFNNp3ScUkspOMdyRnenYhnWEnfI0itIFfsXsd5ZhKh.','beck','all','authorization_code,password,refresh_token,client_credentials','http://www.baidu.com','',180000,NULL,'{}','true',1,0,10000),(6,'owen',NULL,'$2a$10$a1ZEXiZQr604LN.wVxet.etPm6RvDs.HIaXP48J2HKRaEnZORTVwe','owen','app','authorization_code,password,refresh_token,client_credentials','http://127.0.0.1:9997/dashboard/login',NULL,180000,NULL,'{}','true',1,0,10000),(8,'testOne','','$2a$10$nI9kx19HHJTkJq0kMRPZ6uu/4uW7J9kPIpZ8YjFmbUlvwJmorc5Qa','testOne','all','authorization_code,password,refresh_token,client_credentials','http://bai.com','',18000,18000,'{}','true',0,0,10000),(9,'gwapi','','$2a$10$l7plpxQk42cuKbB8tbNe8eAA6v2xA6xkPXsjGEezago239102LRL2','gwapi','all','authorization_code,password,refresh_token,client_credentials','https://www.baidu.co','',18000,18000,'{}','true',1,0,10000),(10,'testtwo','','$2a$10$49ESIYmzu1n.cGzwMLRgleQMk0.kBTMOYnW4WUBDKwu9V23qOBovG','testtwo','all','authorization_code,password,refresh_token,client_credentials','locahost:9090/test','',18000,18000,'{}','true',1,0,10000),(11,'uc-app','','$2a$10$8UxEUaT2D2vSTJvTA/7YbODgCbK44bozsNA1kvMFSz8R153Xat7UO','uc-app','all','authorization_code,password,refresh_token,client_credentials','www.baidu.com','',18000,18000,'{}','true',1,0,10000),(12,'testtwo4','','$2a$10$Q8Qg5RQv1t0NFyL8Epfnj.wB/5NQnNJRMv5yIOVyeZ3ACXvzGwloq','testtwo4','all','implicit,password,refresh_token','locahost:9090/test','',18000,18000,'{}','true',1,1,10000);

DROP TABLE IF EXISTS `sys_client_service`;
CREATE TABLE `sys_client_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` int(11) NOT NULL COMMENT '应用主键ID',
  `service_id` int(11) NOT NULL COMMENT '服务主键ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`,`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
INSERT INTO `sys_client_service` VALUES (1,4,1),(2,4,2),(3,4,3),(4,4,4),(5,4,5),(6,4,6),(7,4,7),(8,4,8),(9,4,9),(10,4,10),(11,4,11),(12,4,12),(13,4,13),(14,4,14),(15,4,15),(16,4,16),(17,4,17),(18,4,18);

DROP TABLE IF EXISTS `sys_gateway_routes`;
CREATE TABLE `sys_gateway_routes` (
  `id` char(32) NOT NULL COMMENT 'id',
  `uri` varchar(100) NOT NULL COMMENT 'uri路径',
  `predicates` varchar(1000) DEFAULT NULL COMMENT '判定器',
  `filters` varchar(1000) DEFAULT NULL COMMENT '过滤器',
  `order` int(11) DEFAULT NULL COMMENT '排序',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `delFlag` int(11) DEFAULT '0' COMMENT '删除标志 0 不删除 1 删除',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务网关路由表';


DROP TABLE IF EXISTS `sys_service`;
CREATE TABLE `sys_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_service` int(11) DEFAULT NULL COMMENT '是否服务 1 是 2 不是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;
INSERT INTO `sys_service` VALUES (1,-1,'认证中心','/api-auth',1,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(2,-1,'用户中心','/api-user',2,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(3,-1,'文件中心','/api-file',3,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(4,-1,'短信中心','/api/sms',4,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(5,-1,'日志中心','/api-log',5,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(6,-1,'注册中心','/api-eureka',6,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(7,1,'应用管理','/api-user/client**/**',1,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(8,1,'认证管理','/api-auth/oauth**/**',2,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(9,1,'redis监控','/api-auth/redis**/**',3,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(10,1,'服务管理','/api-auth/services**/**',4,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(11,2,'用户管理','/api-user/users**/**',1,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(12,2,'角色管理','/api-user/roles**/**',2,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(13,2,'菜单管理','/api-user/menus**/**',3,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(14,2,'权限管理','/api-user/permissions**/**',4,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(15,3,'文件管理','/api-file/files**/**',1,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(16,4,'短信管理','/api/sms/sms**/**',1,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(17,5,'日志管理','/api-log/sysLog**/**',1,'2018-04-09 12:37:57','2018-04-09 12:37:57',1),(18,6,'服务治理','/api-eureka/eureka**/**',1,'2018-04-09 12:37:57','2018-04-09 12:37:57',1);

DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `id` varchar(32) NOT NULL COMMENT '文件md5',
  `name` varchar(128) NOT NULL,
  `is_img` tinyint(1) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '物理路径',
  `url` varchar(1024) NOT NULL,
  `source` varchar(32) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `file_info_extend`;
CREATE TABLE `file_info_extend` (
  `id` varchar(32) NOT NULL COMMENT '文件md5',
  `guid` varchar(32) NOT NULL COMMENT '文件分片id',
  `name` varchar(128) NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '物理路径',
  `url` varchar(1024) NOT NULL,
  `source` varchar(32) NOT NULL,
  `file_id` varchar(32) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件拓展表';



DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(16) NOT NULL COMMENT '手机号码',
  `sign_name` varchar(128) DEFAULT NULL COMMENT '短信签名',
  `template_code` varchar(128) DEFAULT NULL COMMENT '短信模板代码',
  `params` varchar(500) DEFAULT NULL COMMENT '参数',
  `biz_id` varchar(128) DEFAULT NULL COMMENT '阿里云返回的',
  `code` varchar(64) DEFAULT NULL COMMENT '阿里云返回的code',
  `message` varchar(128) DEFAULT NULL COMMENT '阿里云返回的',
  `day` date NOT NULL COMMENT '日期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`),
  KEY `day` (`day`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='发短信记录';



DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COMMENT '用户名',
  `module` varchar(3000)  COMMENT '模块名',
  `params` text COMMENT '方法参数',
  `remark` text COMMENT '备注',
  `flag` tinyint(1) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=archive DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `t_tx_exception`;
CREATE TABLE `t_tx_exception`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mod_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `transaction_state` tinyint(4) NULL DEFAULT NULL,
  `registrar` tinyint(4) NULL DEFAULT NULL,
  `remark` varchar(4096) NULL DEFAULT  NULL,
  `ex_state` tinyint(4) NULL DEFAULT NULL COMMENT '0 未解决 1已解决',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
CREATE DATABASE IF NOT EXISTS `tx_logger` DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `t_logger`;
CREATE TABLE `t_logger`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
CREATE DATABASE IF NOT EXISTS  `txlcn-demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `t_demo`;
CREATE TABLE `t_demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kid` varchar(45) DEFAULT NULL,
  `demo_field` varchar(255) DEFAULT NULL,
  `group_id` varchar(64) DEFAULT NULL,
  `unit_id` varchar(32) DEFAULT NULL,
  `app_name` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;