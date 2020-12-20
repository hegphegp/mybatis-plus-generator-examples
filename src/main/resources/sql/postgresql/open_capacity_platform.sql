/*
 Navicat Premium Data Transfer

 Source Server         : localhost-5432
 Source Server Type    : PostgreSQL
 Source Server Version : 110008
 Source Host           : localhost:5432
 Source Catalog        : open_capacity_platform
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110008
 File Encoding         : 65001

 Date: 20/12/2020 13:09:45
*/


-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."file_info";
CREATE TABLE "public"."file_info" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "is_img" int2 NOT NULL,
  "content_type" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "size" int4 NOT NULL,
  "path" varchar(255) COLLATE "pg_catalog"."default",
  "url" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL,
  "source" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."file_info"."id" IS '文件md5';
COMMENT ON COLUMN "public"."file_info"."path" IS '物理路径';

-- ----------------------------
-- Table structure for file_info_extend
-- ----------------------------
DROP TABLE IF EXISTS "public"."file_info_extend";
CREATE TABLE "public"."file_info_extend" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "guid" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "size" int4 NOT NULL,
  "path" varchar(255) COLLATE "pg_catalog"."default",
  "url" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL,
  "source" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "file_id" varchar(32) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."file_info_extend"."id" IS '文件md5';
COMMENT ON COLUMN "public"."file_info_extend"."guid" IS '文件分片id';
COMMENT ON COLUMN "public"."file_info_extend"."path" IS '物理路径';
COMMENT ON TABLE "public"."file_info_extend" IS '文件拓展表';

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_client_details";
CREATE TABLE "public"."oauth_client_details" (
  "id" int4 NOT NULL,
  "client_id" varchar(48) COLLATE "pg_catalog"."default" NOT NULL,
  "resource_ids" varchar(256) COLLATE "pg_catalog"."default",
  "client_secret" varchar(256) COLLATE "pg_catalog"."default",
  "client_secret_str" varchar(256) COLLATE "pg_catalog"."default",
  "scope" varchar(256) COLLATE "pg_catalog"."default",
  "authorized_grant_types" varchar(256) COLLATE "pg_catalog"."default",
  "web_server_redirect_uri" varchar(256) COLLATE "pg_catalog"."default",
  "authorities" varchar(256) COLLATE "pg_catalog"."default",
  "access_token_validity" int4,
  "refresh_token_validity" int4,
  "additional_information" varchar(4096) COLLATE "pg_catalog"."default",
  "autoapprove" varchar(256) COLLATE "pg_catalog"."default",
  "status" int4,
  "if_limit" int4 NOT NULL,
  "limit_count" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."oauth_client_details"."id" IS '主键';
COMMENT ON COLUMN "public"."oauth_client_details"."client_id" IS '应用标识';
COMMENT ON COLUMN "public"."oauth_client_details"."resource_ids" IS '资源限定串(逗号分割)';
COMMENT ON COLUMN "public"."oauth_client_details"."client_secret" IS '应用密钥(bcyt) 加密';
COMMENT ON COLUMN "public"."oauth_client_details"."client_secret_str" IS '应用密钥(明文)';
COMMENT ON COLUMN "public"."oauth_client_details"."scope" IS '范围';
COMMENT ON COLUMN "public"."oauth_client_details"."authorized_grant_types" IS '5种oauth授权方式(authorization_code,password,refresh_token,client_credentials)';
COMMENT ON COLUMN "public"."oauth_client_details"."web_server_redirect_uri" IS '回调地址 ';
COMMENT ON COLUMN "public"."oauth_client_details"."authorities" IS '权限';
COMMENT ON COLUMN "public"."oauth_client_details"."access_token_validity" IS 'access_token有效期';
COMMENT ON COLUMN "public"."oauth_client_details"."refresh_token_validity" IS 'refresh_token有效期';
COMMENT ON COLUMN "public"."oauth_client_details"."additional_information" IS '{}';
COMMENT ON COLUMN "public"."oauth_client_details"."autoapprove" IS '是否自动授权 是-true';
COMMENT ON COLUMN "public"."oauth_client_details"."if_limit" IS '是否应用限流';
COMMENT ON COLUMN "public"."oauth_client_details"."limit_count" IS '限流阈值';

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO "public"."oauth_client_details" VALUES (1, 'app', NULL, '$2a$10$i3F515wEDiB4Gvj9ym9Prui0dasRttEUQ9ink4Wpgb4zEDCAlV8zO', 'app', 'app', 'password,refresh_token', NULL, NULL, 180000, NULL, '{}', 'true', 1, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (2, 'mobile', 'mobile,test', '$2a$10$ULxRssv/4NWOc388lZFbyus3IFfsbcpG/BZOq4TRxDhsx5HHIR7Jm', 'mobile', 'all', 'password,refresh_token', NULL, NULL, 180000, NULL, '{}', 'true', 1, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (4, 'webApp', NULL, '$2a$10$06msMGYRH8nrm4iVnKFNKOoddB8wOwymVhbUzw/d3ZixD7Nq8ot72', 'webApp', 'app', 'authorization_code,password,refresh_token,client_credentials', NULL, NULL, 180000, NULL, '{}', 'true', 1, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (5, 'beck', '', '$2a$10$56LGyH.2wOFNNp3ScUkspOMdyRnenYhnWEnfI0itIFfsXsd5ZhKh.', 'beck', 'all', 'authorization_code,password,refresh_token,client_credentials', 'http://www.baidu.com', '', 180000, NULL, '{}', 'true', 1, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (6, 'owen', NULL, '$2a$10$a1ZEXiZQr604LN.wVxet.etPm6RvDs.HIaXP48J2HKRaEnZORTVwe', 'owen', 'app', 'authorization_code,password,refresh_token,client_credentials', 'http://127.0.0.1:9997/dashboard/login', NULL, 180000, NULL, '{}', 'true', 1, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (8, 'testOne', '', '$2a$10$nI9kx19HHJTkJq0kMRPZ6uu/4uW7J9kPIpZ8YjFmbUlvwJmorc5Qa', 'testOne', 'all', 'authorization_code,password,refresh_token,client_credentials', 'http://bai.com', '', 18000, 18000, '{}', 'true', 0, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (9, 'gwapi', '', '$2a$10$l7plpxQk42cuKbB8tbNe8eAA6v2xA6xkPXsjGEezago239102LRL2', 'gwapi', 'all', 'authorization_code,password,refresh_token,client_credentials', 'https://www.baidu.co', '', 18000, 18000, '{}', 'true', 1, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (10, 'testtwo', '', '$2a$10$49ESIYmzu1n.cGzwMLRgleQMk0.kBTMOYnW4WUBDKwu9V23qOBovG', 'testtwo', 'all', 'authorization_code,password,refresh_token,client_credentials', 'locahost:9090/test', '', 18000, 18000, '{}', 'true', 1, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (11, 'uc-app', '', '$2a$10$8UxEUaT2D2vSTJvTA/7YbODgCbK44bozsNA1kvMFSz8R153Xat7UO', 'uc-app', 'all', 'authorization_code,password,refresh_token,client_credentials', 'www.baidu.com', '', 18000, 18000, '{}', 'true', 1, 0, 10000);
INSERT INTO "public"."oauth_client_details" VALUES (12, 'testtwo4', '', '$2a$10$Q8Qg5RQv1t0NFyL8Epfnj.wB/5NQnNJRMv5yIOVyeZ3ACXvzGwloq', 'testtwo4', 'all', 'implicit,password,refresh_token', 'locahost:9090/test', '', 18000, 18000, '{}', 'true', 1, 1, 10000);

-- ----------------------------
-- Table structure for sys_client_service
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_client_service";
CREATE TABLE "public"."sys_client_service" (
  "id" int4 NOT NULL,
  "client_id" int4 NOT NULL,
  "service_id" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_client_service"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_client_service"."client_id" IS '应用主键ID';
COMMENT ON COLUMN "public"."sys_client_service"."service_id" IS '服务主键ID';

-- ----------------------------
-- Records of sys_client_service
-- ----------------------------
INSERT INTO "public"."sys_client_service" VALUES (1, 4, 1);
INSERT INTO "public"."sys_client_service" VALUES (2, 4, 2);
INSERT INTO "public"."sys_client_service" VALUES (3, 4, 3);
INSERT INTO "public"."sys_client_service" VALUES (4, 4, 4);
INSERT INTO "public"."sys_client_service" VALUES (5, 4, 5);
INSERT INTO "public"."sys_client_service" VALUES (6, 4, 6);
INSERT INTO "public"."sys_client_service" VALUES (7, 4, 7);
INSERT INTO "public"."sys_client_service" VALUES (8, 4, 8);
INSERT INTO "public"."sys_client_service" VALUES (9, 4, 9);
INSERT INTO "public"."sys_client_service" VALUES (10, 4, 10);
INSERT INTO "public"."sys_client_service" VALUES (11, 4, 11);
INSERT INTO "public"."sys_client_service" VALUES (12, 4, 12);
INSERT INTO "public"."sys_client_service" VALUES (13, 4, 13);
INSERT INTO "public"."sys_client_service" VALUES (14, 4, 14);
INSERT INTO "public"."sys_client_service" VALUES (15, 4, 15);
INSERT INTO "public"."sys_client_service" VALUES (16, 4, 16);
INSERT INTO "public"."sys_client_service" VALUES (17, 4, 17);
INSERT INTO "public"."sys_client_service" VALUES (18, 4, 18);

-- ----------------------------
-- Table structure for sys_gateway_routes
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_gateway_routes";
CREATE TABLE "public"."sys_gateway_routes" (
  "id" char(32) COLLATE "pg_catalog"."default" NOT NULL,
  "uri" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "predicates" varchar(1000) COLLATE "pg_catalog"."default",
  "filters" varchar(1000) COLLATE "pg_catalog"."default",
  "order" int4,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "delFlag" int4,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_gateway_routes"."id" IS 'id';
COMMENT ON COLUMN "public"."sys_gateway_routes"."uri" IS 'uri路径';
COMMENT ON COLUMN "public"."sys_gateway_routes"."predicates" IS '判定器';
COMMENT ON COLUMN "public"."sys_gateway_routes"."filters" IS '过滤器';
COMMENT ON COLUMN "public"."sys_gateway_routes"."order" IS '排序';
COMMENT ON COLUMN "public"."sys_gateway_routes"."description" IS '描述';
COMMENT ON COLUMN "public"."sys_gateway_routes"."delFlag" IS '删除标志 0 不删除 1 删除';
COMMENT ON TABLE "public"."sys_gateway_routes" IS '服务网关路由表';

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log";
CREATE TABLE "public"."sys_log" (
  "id" int4 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default",
  "module" varchar(3000) COLLATE "pg_catalog"."default",
  "params" text COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "flag" int2 NOT NULL,
  "create_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_log"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_log"."module" IS '模块名';
COMMENT ON COLUMN "public"."sys_log"."params" IS '方法参数';
COMMENT ON COLUMN "public"."sys_log"."remark" IS '备注';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "id" int8 NOT NULL,
  "parent_id" int4 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "url" varchar(1024) COLLATE "pg_catalog"."default",
  "path" varchar(1024) COLLATE "pg_catalog"."default",
  "css" varchar(32) COLLATE "pg_catalog"."default",
  "sort" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL,
  "is_menu" int4,
  "hidden" int4
)
;
COMMENT ON COLUMN "public"."sys_menu"."is_menu" IS '是否菜单 1 是 2 不是';
COMMENT ON COLUMN "public"."sys_menu"."hidden" IS '是否隐藏,0 false 1 true';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (1, -1, '后台管理', 'javascript:;', '', 'layui-icon-set', 2, '2019-09-05 11:37:02', '2019-09-05 11:37:02', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (2, 1, '用户管理', '#!user', 'system/user.html', 'layui-icon-friends', 2, '2017-11-17 16:56:59', '2019-09-05 11:37:26', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (3, 1, '角色管理', '#!role', 'system/role.html', 'layui-icon-friends', 3, '2017-11-17 16:56:59', '2019-09-05 11:37:38', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (4, 1, '菜单管理', '#!menus', 'system/menus.html', 'layui-icon-menu-fill', 4, '2017-11-17 16:56:59', '2019-09-05 11:37:57', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (5, 1, '权限管理', '#!permissions', 'system/permissions.html', 'layui-icon-password', 5, '2017-11-17 16:56:59', '2019-09-05 11:37:47', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (6, 1, '我的信息', '#!myInfo', 'system/myInfo.html', '', 10, '2017-11-17 16:56:59', '2018-09-02 06:12:24', 1, 1);
INSERT INTO "public"."sys_menu" VALUES (7, -1, '认证中心', 'javascript:;', '', 'layui-icon-set', 1, '2017-11-17 16:56:59', '2019-03-26 06:56:46', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (8, 7, '应用管理', '#!app', 'attestation/app.html', 'layui-icon-app', 9, '2017-11-17 16:56:59', '2018-08-25 10:57:42', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (9, 7, '服务管理', '#!services', 'attestation/services.html', 'layui-icon-website', 8, '2017-11-17 16:56:59', '2018-09-02 09:34:13', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (10, 7, '令牌管理', '#!token', 'attestation/token.html', 'layui-icon-util', 11, '2018-09-08 13:19:56', '2019-05-27 09:28:39', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (11, -1, '系统监控', 'javascript:;', '', 'layui-icon-set', 3, '2018-08-25 10:41:58', '2018-08-25 10:41:58', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (12, 11, '注册中心', '#!register', 'http://127.0.0.1:1111/', 'layui-icon-engine', 2, '2017-11-17 16:56:59', '2019-05-25 20:34:50', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (13, 11, '服务治理', '#!eureka', 'eureka/list.html', 'layui-icon-engine', 1, '2018-08-30 15:30:19', '2019-05-25 20:34:40', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (14, 11, '慢查询', '#!sql', 'system/sql.html', 'layui-icon-util', 11, '2017-11-17 16:56:59', '2019-05-25 20:35:20', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (15, 11, '文件中心', '#!files', 'files/files.html', 'layui-icon-file', 10, '2017-11-17 16:56:59', '2018-08-25 10:43:33', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (16, 11, '文档中心', '#!swagger', 'http://127.0.0.1:9200/swagger-ui.html', 'layui-icon-app', 9, '2017-11-17 16:56:59', '2019-03-26 02:32:46', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (17, 11, '代码生成器', '#!generator', 'generator/list.html', 'layui-icon-app', 999, '2018-09-05 13:43:06', '2019-05-26 17:01:46', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (18, 11, '日志中心', '#!log', 'system/log.html', 'layui-icon-engine', 18, '2019-03-11 06:30:01', '2019-05-25 20:35:35', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (19, 11, 'prometheus监控', '#!prometheus', 'http://127.0.0.1:9090', 'layui-icon-engine', 1111, '2019-03-27 11:23:31', '2019-05-25 21:13:08', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (20, -1, '任务中心', 'javascript:;', '', 'layui-icon-set', 4, '2018-08-28 16:59:44', '2018-08-28 17:00:19', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (21, 20, '任务管理', '#!jobinfo', 'http://127.0.0.1:8888/jobinfo', 'layui-icon-senior', 1, '2018-08-28 17:02:00', '2018-08-28 18:24:23', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (22, 20, '调度日志', '#!joblog', 'http://127.0.0.1:8888/joblog', 'layui-icon-senior', 2, '2018-08-28 18:20:53', '2018-08-28 18:24:32', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (23, 20, '执行器管理', '#!jobgroup', 'http://127.0.0.1:8888/jobgroup', 'layui-icon-senior', 3, '2018-08-28 18:22:04', '2018-09-03 08:05:02', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (24, -1, '用户地图', '#!map', 'baiduMap/userMap.html', 'layui-icon-engine', 111111, '2019-06-14 21:28:54', '2019-06-14 21:28:54', 1, 0);
INSERT INTO "public"."sys_menu" VALUES (25, -1, '路由管理', '#!route', 'route/route.html', 'layui-icon-engine', 111111, '2019-06-14 21:28:54', '2019-06-14 21:28:54', 1, 0);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_permission";
CREATE TABLE "public"."sys_permission" (
  "id" int8 NOT NULL,
  "permission" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO "public"."sys_permission" VALUES (1, 'permission:post/permissions', '保存权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (2, 'permission:put/permissions', '修改权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (3, 'permission:delete/permissions/{id}', '删除权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (4, 'permission:get/permissions', '查询权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (5, '/permissions/{roleId}/permissions', '查看角色权限', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (6, '/permissions/granted', '角色分配权限', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO "public"."sys_permission" VALUES (7, 'role:post/roles', '添加角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (8, 'role:put/roles', '修改角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (9, 'role:delete/roles/{id}', '删除角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (10, 'role:post/roles/{id}/permissions', '给角色分配权限', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (11, 'role:get/roles', '查询角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (12, 'role:get/roles/{id}/permissions', '获取角色的权限', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (13, 'user:post/users/{id}/roles', '给用户分配角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (14, 'user:post/users/{id}/resetPassword', '用户重置密码', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (15, 'user:get/users', '用户查询', '2018-01-18 17:12:00', '2018-01-18 17:12:05');
INSERT INTO "public"."sys_permission" VALUES (16, 'user:put/users/me', '修改用户', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (17, 'user:get/users/{id}/roles', '获取用户的角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (18, 'user:post/users/saveOrUpdate', '新增用户', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (19, 'user:post/users/exportUser', '导出用户', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (20, 'user:get/users/updateEnabled', '用户状态修改', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (21, 'user:put/users/password', '修改密码', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO "public"."sys_permission" VALUES (22, 'menu:get/menus/all', '查询菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (23, 'menu:post/menus/granted', '给角色分配菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (24, 'menu:get/menus/tree', '树形显示', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO "public"."sys_permission" VALUES (25, 'menu:get/menus/{roleId}/menus', '获取角色的菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (26, 'menu:post/menus', '添加菜单', '2018-01-18 17:06:39', '2018-09-04 07:35:29');
INSERT INTO "public"."sys_permission" VALUES (27, 'menu:put/menus', '修改菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (28, 'menu:delete/menus/{id}', '删除菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (29, 'menu:get/menus/current', '当前用户菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (30, 'menu:get/menus/findAlls', '所有菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO "public"."sys_permission" VALUES (31, 'client:post/clients', '保存应用', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO "public"."sys_permission" VALUES (32, 'client:get/clients', '应用列表', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO "public"."sys_permission" VALUES (33, 'client:get/clients/{id}', '根据id获取应用', '2018-01-18 17:06:39', '2018-01-18 17:06:39');
INSERT INTO "public"."sys_permission" VALUES (34, 'client:delete/clients', '删除应用', '2018-01-18 17:06:39', '2018-01-18 17:06:42');
INSERT INTO "public"."sys_permission" VALUES (35, 'service:get/service/findAlls', '查询所有服务', '2018-01-18 17:06:39', '2018-09-03 08:05:09');
INSERT INTO "public"."sys_permission" VALUES (36, 'service:get/service/findOnes', '服务树', '2018-01-18 17:06:39', '2018-09-08 03:23:28');
INSERT INTO "public"."sys_permission" VALUES (37, 'menu:get/menus/findOnes', '获取菜单以及顶层菜单', '2019-05-09 23:48:13', '2019-05-09 23:48:13');
INSERT INTO "public"."sys_permission" VALUES (38, 'permission:get/permissions/{roleId}/permissions', '根据roleId获取权限', '2019-05-10 00:02:23', '2019-05-10 00:02:23');
INSERT INTO "public"."sys_permission" VALUES (39, 'file:query', '获取文件列表', '2019-05-17 21:34:05', '2019-05-17 21:34:08');
INSERT INTO "public"."sys_permission" VALUES (40, 'file:del', '删除文件', '2019-05-17 21:36:46', '2019-05-17 21:36:48');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" int8 NOT NULL,
  "code" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_role"."code" IS '角色code';
COMMENT ON COLUMN "public"."sys_role"."name" IS '角色名';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (1, 'ADMIN', '管理员', '2017-11-17 16:56:59', '2017-11-17 16:56:59');
INSERT INTO "public"."sys_role" VALUES (3, '002', '普通用户', '2019-03-27 02:52:00', '2019-03-27 02:52:00');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO "public"."sys_role_menu" VALUES (1, 1, 1);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1, 2);
INSERT INTO "public"."sys_role_menu" VALUES (3, 1, 3);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1, 4);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1, 5);
INSERT INTO "public"."sys_role_menu" VALUES (6, 1, 6);
INSERT INTO "public"."sys_role_menu" VALUES (7, 1, 7);
INSERT INTO "public"."sys_role_menu" VALUES (8, 1, 8);
INSERT INTO "public"."sys_role_menu" VALUES (9, 1, 9);
INSERT INTO "public"."sys_role_menu" VALUES (10, 1, 10);
INSERT INTO "public"."sys_role_menu" VALUES (11, 1, 11);
INSERT INTO "public"."sys_role_menu" VALUES (12, 1, 12);
INSERT INTO "public"."sys_role_menu" VALUES (13, 1, 13);
INSERT INTO "public"."sys_role_menu" VALUES (14, 1, 14);
INSERT INTO "public"."sys_role_menu" VALUES (15, 1, 15);
INSERT INTO "public"."sys_role_menu" VALUES (16, 1, 16);
INSERT INTO "public"."sys_role_menu" VALUES (17, 1, 17);
INSERT INTO "public"."sys_role_menu" VALUES (18, 1, 18);
INSERT INTO "public"."sys_role_menu" VALUES (19, 1, 19);
INSERT INTO "public"."sys_role_menu" VALUES (20, 1, 20);
INSERT INTO "public"."sys_role_menu" VALUES (21, 1, 21);
INSERT INTO "public"."sys_role_menu" VALUES (22, 1, 22);
INSERT INTO "public"."sys_role_menu" VALUES (23, 1, 23);
INSERT INTO "public"."sys_role_menu" VALUES (24, 1, 24);
INSERT INTO "public"."sys_role_menu" VALUES (25, 1, 25);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_permission";
CREATE TABLE "public"."sys_role_permission" (
  "id" int8 NOT NULL,
  "role_id" int4 NOT NULL,
  "permission_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO "public"."sys_role_permission" VALUES (1, 1, 1);
INSERT INTO "public"."sys_role_permission" VALUES (2, 1, 2);
INSERT INTO "public"."sys_role_permission" VALUES (3, 1, 3);
INSERT INTO "public"."sys_role_permission" VALUES (4, 1, 4);
INSERT INTO "public"."sys_role_permission" VALUES (5, 1, 5);
INSERT INTO "public"."sys_role_permission" VALUES (6, 1, 6);
INSERT INTO "public"."sys_role_permission" VALUES (7, 1, 7);
INSERT INTO "public"."sys_role_permission" VALUES (8, 1, 8);
INSERT INTO "public"."sys_role_permission" VALUES (9, 1, 9);
INSERT INTO "public"."sys_role_permission" VALUES (10, 1, 10);
INSERT INTO "public"."sys_role_permission" VALUES (11, 1, 11);
INSERT INTO "public"."sys_role_permission" VALUES (12, 1, 12);
INSERT INTO "public"."sys_role_permission" VALUES (13, 1, 13);
INSERT INTO "public"."sys_role_permission" VALUES (14, 1, 14);
INSERT INTO "public"."sys_role_permission" VALUES (15, 1, 15);
INSERT INTO "public"."sys_role_permission" VALUES (16, 1, 16);
INSERT INTO "public"."sys_role_permission" VALUES (17, 1, 17);
INSERT INTO "public"."sys_role_permission" VALUES (18, 1, 18);
INSERT INTO "public"."sys_role_permission" VALUES (19, 1, 19);
INSERT INTO "public"."sys_role_permission" VALUES (20, 1, 20);
INSERT INTO "public"."sys_role_permission" VALUES (21, 1, 21);
INSERT INTO "public"."sys_role_permission" VALUES (22, 1, 22);
INSERT INTO "public"."sys_role_permission" VALUES (23, 1, 23);
INSERT INTO "public"."sys_role_permission" VALUES (24, 1, 24);
INSERT INTO "public"."sys_role_permission" VALUES (25, 1, 25);
INSERT INTO "public"."sys_role_permission" VALUES (26, 1, 26);
INSERT INTO "public"."sys_role_permission" VALUES (27, 1, 27);
INSERT INTO "public"."sys_role_permission" VALUES (28, 1, 29);
INSERT INTO "public"."sys_role_permission" VALUES (29, 1, 30);
INSERT INTO "public"."sys_role_permission" VALUES (30, 1, 31);
INSERT INTO "public"."sys_role_permission" VALUES (31, 1, 32);
INSERT INTO "public"."sys_role_permission" VALUES (32, 1, 33);
INSERT INTO "public"."sys_role_permission" VALUES (33, 1, 34);
INSERT INTO "public"."sys_role_permission" VALUES (34, 1, 35);
INSERT INTO "public"."sys_role_permission" VALUES (35, 1, 36);
INSERT INTO "public"."sys_role_permission" VALUES (36, 1, 37);
INSERT INTO "public"."sys_role_permission" VALUES (37, 1, 38);
INSERT INTO "public"."sys_role_permission" VALUES (38, 1, 39);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_user";
CREATE TABLE "public"."sys_role_user" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO "public"."sys_role_user" VALUES (4, 1275397643669949952, 1);
INSERT INTO "public"."sys_role_user" VALUES (3, 1277056689447719936, 1);
INSERT INTO "public"."sys_role_user" VALUES (2, 1277120261867529984, 1);
INSERT INTO "public"."sys_role_user" VALUES (1, 1277137734524300032, 1);

-- ----------------------------
-- Table structure for sys_service
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_service";
CREATE TABLE "public"."sys_service" (
  "id" int4 NOT NULL,
  "parent_id" int4 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "path" varchar(1024) COLLATE "pg_catalog"."default",
  "sort" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL,
  "is_service" int4
)
;
COMMENT ON COLUMN "public"."sys_service"."is_service" IS '是否服务 1 是 2 不是';

-- ----------------------------
-- Records of sys_service
-- ----------------------------
INSERT INTO "public"."sys_service" VALUES (1, -1, '认证中心', '/api-auth', 1, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (2, -1, '用户中心', '/api-user', 2, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (3, -1, '文件中心', '/api-file', 3, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (4, -1, '短信中心', '/api/sms', 4, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (5, -1, '日志中心', '/api-log', 5, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (6, -1, '注册中心', '/api-eureka', 6, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (7, 1, '应用管理', '/api-user/client**/**', 1, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (8, 1, '认证管理', '/api-auth/oauth**/**', 2, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (9, 1, 'redis监控', '/api-auth/redis**/**', 3, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (10, 1, '服务管理', '/api-auth/services**/**', 4, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (11, 2, '用户管理', '/api-user/users**/**', 1, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (12, 2, '角色管理', '/api-user/roles**/**', 2, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (13, 2, '菜单管理', '/api-user/menus**/**', 3, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (14, 2, '权限管理', '/api-user/permissions**/**', 4, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (15, 3, '文件管理', '/api-file/files**/**', 1, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (16, 4, '短信管理', '/api/sms/sms**/**', 1, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (17, 5, '日志管理', '/api-log/sysLog**/**', 1, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);
INSERT INTO "public"."sys_service" VALUES (18, 6, '服务治理', '/api-eureka/eureka**/**', 1, '2018-04-09 12:37:57', '2018-04-09 12:37:57', 1);

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_sms";
CREATE TABLE "public"."sys_sms" (
  "id" int4 NOT NULL,
  "phone" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "sign_name" varchar(128) COLLATE "pg_catalog"."default",
  "template_code" varchar(128) COLLATE "pg_catalog"."default",
  "params" varchar(500) COLLATE "pg_catalog"."default",
  "biz_id" varchar(128) COLLATE "pg_catalog"."default",
  "code" varchar(64) COLLATE "pg_catalog"."default",
  "message" varchar(128) COLLATE "pg_catalog"."default",
  "day" date NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_sms"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_sms"."phone" IS '手机号码';
COMMENT ON COLUMN "public"."sys_sms"."sign_name" IS '短信签名';
COMMENT ON COLUMN "public"."sys_sms"."template_code" IS '短信模板代码';
COMMENT ON COLUMN "public"."sys_sms"."params" IS '参数';
COMMENT ON COLUMN "public"."sys_sms"."biz_id" IS '阿里云返回的';
COMMENT ON COLUMN "public"."sys_sms"."code" IS '阿里云返回的code';
COMMENT ON COLUMN "public"."sys_sms"."message" IS '阿里云返回的';
COMMENT ON COLUMN "public"."sys_sms"."day" IS '日期';
COMMENT ON COLUMN "public"."sys_sms"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_sms"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."sys_sms" IS '发短信记录';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" int8 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(60) COLLATE "pg_catalog"."default" NOT NULL,
  "nick_name" varchar(255) COLLATE "pg_catalog"."default",
  "head_img_url" varchar(1024) COLLATE "pg_catalog"."default",
  "phone" varchar(11) COLLATE "pg_catalog"."default",
  "sex" int2,
  "enabled" int2 NOT NULL,
  "type" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6) NOT NULL
)
;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES (1275397643669949952, 'test', '$2a$10$RD18sHNphJMmcuLuUX/Np.IV/7Ngbjd3Jtj3maFLpwaA6KaHVqPtq', '测试账户', 'http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg', '13851539156', 0, 0, 'APP', '2017-11-17 16:56:59', '2018-09-07 03:27:40');
INSERT INTO "public"."sys_user" VALUES (1277056689447719936, 'user', '$2a$10$fL/AfD4RDS0LxLJS7zpaZ.YUMfjNWKVvUn7oiA75L1K6PXazSTJPi', '体验用户', 'http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg', NULL, 1, 0, 'APP', '2017-11-17 16:56:59', '2018-09-07 13:38:34');
INSERT INTO "public"."sys_user" VALUES (1277120261867529984, 'owen', '$2a$10$4WkpmB1jHncBCrzJ7hJRq.SsiEFiyE/FdgPF26hLs8vzPyoNpZjta', '欧文', 'http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg', '18579068166', 1, 0, 'APP', '2017-11-17 16:56:59', '2018-09-12 06:00:31');
INSERT INTO "public"."sys_user" VALUES (1277137734524300032, 'admin', '$2a$10$Wtw81uu43fGKw9lkOr1RAOTNWxQIZBsB3YDwc/5yDnr/yeG5x92EG', '管理员', 'http://payo7kq4i.bkt.clouddn.com/耳机.jpg', '13106975707', 1, 1, 'BACKEND', '2017-11-17 16:56:59', '2018-09-15 03:12:44');

-- ----------------------------
-- Table structure for t_demo
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_demo";
CREATE TABLE "public"."t_demo" (
  "id" int8 NOT NULL,
  "kid" varchar(45) COLLATE "pg_catalog"."default",
  "demo_field" varchar(255) COLLATE "pg_catalog"."default",
  "group_id" varchar(64) COLLATE "pg_catalog"."default",
  "unit_id" varchar(32) COLLATE "pg_catalog"."default",
  "app_name" varchar(128) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;

-- ----------------------------
-- Table structure for t_logger
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_logger";
CREATE TABLE "public"."t_logger" (
  "id" int8 NOT NULL,
  "group_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "unit_id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "tag" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "content" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "app_name" varchar(128) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for t_tx_exception
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_tx_exception";
CREATE TABLE "public"."t_tx_exception" (
  "id" int8 NOT NULL,
  "group_id" varchar(64) COLLATE "pg_catalog"."default",
  "unit_id" varchar(32) COLLATE "pg_catalog"."default",
  "mod_id" varchar(128) COLLATE "pg_catalog"."default",
  "transaction_state" int2,
  "registrar" int2,
  "remark" varchar(4096) COLLATE "pg_catalog"."default",
  "ex_state" int2,
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."t_tx_exception"."ex_state" IS '0 未解决 1已解决';

-- ----------------------------
-- Indexes structure for table file_info
-- ----------------------------
CREATE INDEX "create_time" ON "public"."file_info" USING btree (
  "create_time" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table file_info
-- ----------------------------
ALTER TABLE "public"."file_info" ADD CONSTRAINT "file_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table file_info_extend
-- ----------------------------
ALTER TABLE "public"."file_info_extend" ADD CONSTRAINT "file_info_extend_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth_client_details
-- ----------------------------
ALTER TABLE "public"."oauth_client_details" ADD CONSTRAINT "oauth_client_details_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_client_service
-- ----------------------------
CREATE INDEX "client_id" ON "public"."sys_client_service" USING btree (
  "client_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "service_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_client_service
-- ----------------------------
ALTER TABLE "public"."sys_client_service" ADD CONSTRAINT "sys_client_service_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_gateway_routes
-- ----------------------------
ALTER TABLE "public"."sys_gateway_routes" ADD CONSTRAINT "sys_gateway_routes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_log
-- ----------------------------
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_permission
-- ----------------------------
CREATE INDEX "permission" ON "public"."sys_permission" USING btree (
  "permission" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_permission
-- ----------------------------
ALTER TABLE "public"."sys_permission" ADD CONSTRAINT "sys_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_role
-- ----------------------------
CREATE INDEX "code" ON "public"."sys_role" USING btree (
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_role_menu
-- ----------------------------
CREATE INDEX "role_id" ON "public"."sys_role_menu" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "menu_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("id");
