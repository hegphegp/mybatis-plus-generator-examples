/*
 Navicat Premium Data Transfer

 Source Server         : localhost-5432
 Source Server Type    : PostgreSQL
 Source Server Version : 110008
 Source Host           : localhost:5432
 Source Catalog        : spring_boot_plus
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110008
 File Encoding         : 65001

 Date: 20/12/2020 13:16:02
*/


-- ----------------------------
-- Table structure for example_order
-- ----------------------------
DROP TABLE IF EXISTS "public"."example_order";
CREATE TABLE "public"."example_order" (
  "id" int8 NOT NULL,
  "name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "order_no" varchar(100) COLLATE "pg_catalog"."default",
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "state" int4 NOT NULL,
  "version" int4 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."example_order"."id" IS '主键';
COMMENT ON COLUMN "public"."example_order"."name" IS '订单名称';
COMMENT ON COLUMN "public"."example_order"."order_no" IS '订单编号';
COMMENT ON COLUMN "public"."example_order"."remark" IS '备注';
COMMENT ON COLUMN "public"."example_order"."state" IS '状态，0：禁用，1：启用';
COMMENT ON COLUMN "public"."example_order"."version" IS '版本';
COMMENT ON COLUMN "public"."example_order"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."example_order"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."example_order" IS '订单示例';

-- ----------------------------
-- Records of example_order
-- ----------------------------
INSERT INTO "public"."example_order" VALUES (1, 'AAA', NULL, NULL, 1, 0, '2020-03-12 22:25:35', NULL);
INSERT INTO "public"."example_order" VALUES (2, 'BBB', NULL, NULL, 1, 0, '2020-03-12 22:25:35', NULL);
INSERT INTO "public"."example_order" VALUES (3, 'CCC', NULL, NULL, 1, 0, '2020-03-12 22:25:35', NULL);

-- ----------------------------
-- Table structure for foo_bar
-- ----------------------------
DROP TABLE IF EXISTS "public"."foo_bar";
CREATE TABLE "public"."foo_bar" (
  "id" int8 NOT NULL,
  "name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "foo" varchar(20) COLLATE "pg_catalog"."default",
  "bar" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "state" int4 NOT NULL,
  "version" int4 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."foo_bar"."id" IS 'ID';
COMMENT ON COLUMN "public"."foo_bar"."name" IS 'Name';
COMMENT ON COLUMN "public"."foo_bar"."foo" IS 'Foo';
COMMENT ON COLUMN "public"."foo_bar"."bar" IS 'Bar';
COMMENT ON COLUMN "public"."foo_bar"."remark" IS 'Remark';
COMMENT ON COLUMN "public"."foo_bar"."state" IS 'State，0：Disable，1：Enable';
COMMENT ON COLUMN "public"."foo_bar"."version" IS 'Version';
COMMENT ON COLUMN "public"."foo_bar"."create_time" IS 'Create Time';
COMMENT ON COLUMN "public"."foo_bar"."update_time" IS 'Update Time';
COMMENT ON TABLE "public"."foo_bar" IS 'FooBar';

-- ----------------------------
-- Records of foo_bar
-- ----------------------------
INSERT INTO "public"."foo_bar" VALUES (1, 'test add', 'hello', 'world', '备注', 1, 0, '2020-03-20 11:22:35', NULL);

-- ----------------------------
-- Table structure for ip_address
-- ----------------------------
DROP TABLE IF EXISTS "public"."ip_address";
CREATE TABLE "public"."ip_address" (
  "id" int8 NOT NULL,
  "ip_start" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "ip_end" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "area" varchar(45) COLLATE "pg_catalog"."default",
  "operator" varchar(6) COLLATE "pg_catalog"."default",
  "ip_start_num" int8 NOT NULL,
  "ip_end_num" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."ip_address"."area" IS '区域';
COMMENT ON COLUMN "public"."ip_address"."operator" IS '运营商';
COMMENT ON TABLE "public"."ip_address" IS 'IP地址';

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_department";
CREATE TABLE "public"."sys_department" (
  "id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int8,
  "level" int4,
  "state" int4 NOT NULL,
  "sort" int4 NOT NULL,
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "version" int4 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_department"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_department"."name" IS '部门名称';
COMMENT ON COLUMN "public"."sys_department"."parent_id" IS '父id';
COMMENT ON COLUMN "public"."sys_department"."level" IS '部门层级';
COMMENT ON COLUMN "public"."sys_department"."state" IS '状态，0：禁用，1：启用';
COMMENT ON COLUMN "public"."sys_department"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_department"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_department"."version" IS '版本';
COMMENT ON COLUMN "public"."sys_department"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_department"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_department" IS '部门';

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO "public"."sys_department" VALUES (1, '技术部', NULL, 1, 1, 359544077, 'fe8c9cbac0c54395ac411335a31f4888', 15, '2019-10-25 09:46:49', '2019-11-13 19:56:07');
INSERT INTO "public"."sys_department" VALUES (2, '研发部', NULL, 1, 1, 0, NULL, 0, '2019-11-01 20:45:43', NULL);
INSERT INTO "public"."sys_department" VALUES (20, '前端开发部', 2, 2, 1, 0, NULL, 0, '2019-11-01 20:48:38', NULL);
INSERT INTO "public"."sys_department" VALUES (21, '后台开发部', 2, 2, 1, 0, NULL, 0, '2019-11-01 20:48:38', NULL);
INSERT INTO "public"."sys_department" VALUES (22, '测试部', 2, 2, 1, 0, NULL, 0, '2019-11-01 20:48:38', NULL);
INSERT INTO "public"."sys_department" VALUES (201, '前端一组', 20, 3, 1, 0, NULL, 0, '2019-11-01 20:48:38', NULL);
INSERT INTO "public"."sys_department" VALUES (202, '前端二组', 20, 3, 1, 0, NULL, 0, '2019-11-01 20:48:38', NULL);
INSERT INTO "public"."sys_department" VALUES (203, '后台一组', 21, 3, 1, 0, NULL, 0, '2019-11-01 20:48:38', NULL);
INSERT INTO "public"."sys_department" VALUES (204, '后台二组', 21, 3, 1, 0, NULL, 0, '2019-11-01 20:48:38', NULL);
INSERT INTO "public"."sys_department" VALUES (205, '测试一组', 22, 3, 1, 0, NULL, 0, '2019-11-01 20:48:38', NULL);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_login_log";
CREATE TABLE "public"."sys_login_log" (
  "id" int8 NOT NULL,
  "request_id" varchar(32) COLLATE "pg_catalog"."default",
  "username" varchar(32) COLLATE "pg_catalog"."default",
  "ip" varchar(15) COLLATE "pg_catalog"."default",
  "area" varchar(45) COLLATE "pg_catalog"."default",
  "operator" varchar(6) COLLATE "pg_catalog"."default",
  "token" varchar(32) COLLATE "pg_catalog"."default",
  "type" int4,
  "success" int2 NOT NULL,
  "code" int4,
  "exception_message" varchar(300) COLLATE "pg_catalog"."default",
  "user_agent" varchar(300) COLLATE "pg_catalog"."default",
  "browser_name" varchar(100) COLLATE "pg_catalog"."default",
  "browser_version" varchar(100) COLLATE "pg_catalog"."default",
  "engine_name" varchar(100) COLLATE "pg_catalog"."default",
  "engine_version" varchar(100) COLLATE "pg_catalog"."default",
  "os_name" varchar(100) COLLATE "pg_catalog"."default",
  "platform_name" varchar(100) COLLATE "pg_catalog"."default",
  "mobile" int2,
  "device_name" varchar(100) COLLATE "pg_catalog"."default",
  "device_model" varchar(100) COLLATE "pg_catalog"."default",
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_login_log"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_login_log"."request_id" IS '请求ID';
COMMENT ON COLUMN "public"."sys_login_log"."username" IS '用户名称';
COMMENT ON COLUMN "public"."sys_login_log"."ip" IS 'IP';
COMMENT ON COLUMN "public"."sys_login_log"."area" IS '区域';
COMMENT ON COLUMN "public"."sys_login_log"."operator" IS '运营商';
COMMENT ON COLUMN "public"."sys_login_log"."token" IS 'tokenMd5值';
COMMENT ON COLUMN "public"."sys_login_log"."type" IS '1:登录，2：登出';
COMMENT ON COLUMN "public"."sys_login_log"."success" IS '是否成功 true:成功/false:失败';
COMMENT ON COLUMN "public"."sys_login_log"."code" IS '响应码';
COMMENT ON COLUMN "public"."sys_login_log"."exception_message" IS '失败消息记录';
COMMENT ON COLUMN "public"."sys_login_log"."user_agent" IS '浏览器名称';
COMMENT ON COLUMN "public"."sys_login_log"."browser_name" IS '浏览器名称';
COMMENT ON COLUMN "public"."sys_login_log"."browser_version" IS '浏览器版本';
COMMENT ON COLUMN "public"."sys_login_log"."engine_name" IS '浏览器引擎名称';
COMMENT ON COLUMN "public"."sys_login_log"."engine_version" IS '浏览器引擎版本';
COMMENT ON COLUMN "public"."sys_login_log"."os_name" IS '系统名称';
COMMENT ON COLUMN "public"."sys_login_log"."platform_name" IS '平台名称';
COMMENT ON COLUMN "public"."sys_login_log"."mobile" IS '是否是手机,0:否,1:是';
COMMENT ON COLUMN "public"."sys_login_log"."device_name" IS '移动端设备名称';
COMMENT ON COLUMN "public"."sys_login_log"."device_model" IS '移动端设备型号';
COMMENT ON COLUMN "public"."sys_login_log"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_login_log"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_login_log"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_login_log" IS '系统登录日志';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO "public"."sys_login_log" VALUES (1, '1242813712335691777', 'admin', '127.0.0.1', '本机地址', NULL, 'c87aaffa35dadafb066cf18679eab36e', 1, 1, 200, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, NULL, NULL, NULL, '2020-03-25 22:01:11', NULL);
INSERT INTO "public"."sys_login_log" VALUES (2, '1242813887884091393', 'admin', '127.0.0.1', '本机地址', NULL, 'c87aaffa35dadafb066cf18679eab36e', 2, 1, 200, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, NULL, NULL, NULL, '2020-03-25 22:01:48', NULL);
INSERT INTO "public"."sys_login_log" VALUES (3, '1242814069371625474', 'admin', '127.0.0.1', '本机地址', NULL, NULL, 1, 0, NULL, '用户名或密码错误', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, NULL, NULL, NULL, '2020-03-25 22:02:25', NULL);
INSERT INTO "public"."sys_login_log" VALUES (4, '1242814192096960513', NULL, '127.0.0.1', '本机地址', NULL, NULL, 2, 0, NULL, 'token不能为空', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, NULL, NULL, NULL, '2020-03-25 22:02:54', NULL);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_operation_log";
CREATE TABLE "public"."sys_operation_log" (
  "id" int8 NOT NULL,
  "request_id" varchar(32) COLLATE "pg_catalog"."default",
  "user_id" int8,
  "user_name" varchar(32) COLLATE "pg_catalog"."default",
  "name" varchar(200) COLLATE "pg_catalog"."default",
  "ip" varchar(15) COLLATE "pg_catalog"."default",
  "area" varchar(45) COLLATE "pg_catalog"."default",
  "operator" varchar(6) COLLATE "pg_catalog"."default",
  "path" varchar(500) COLLATE "pg_catalog"."default",
  "module" varchar(100) COLLATE "pg_catalog"."default",
  "class_name" varchar(100) COLLATE "pg_catalog"."default",
  "method_name" varchar(100) COLLATE "pg_catalog"."default",
  "request_method" varchar(10) COLLATE "pg_catalog"."default",
  "content_type" varchar(100) COLLATE "pg_catalog"."default",
  "request_body" int2,
  "param" text COLLATE "pg_catalog"."default",
  "token" varchar(32) COLLATE "pg_catalog"."default",
  "type" int4,
  "success" int2,
  "code" int4,
  "message" varchar(100) COLLATE "pg_catalog"."default",
  "exception_name" varchar(200) COLLATE "pg_catalog"."default",
  "exception_message" varchar(300) COLLATE "pg_catalog"."default",
  "browser_name" varchar(100) COLLATE "pg_catalog"."default",
  "browser_version" varchar(100) COLLATE "pg_catalog"."default",
  "engine_name" varchar(100) COLLATE "pg_catalog"."default",
  "engine_version" varchar(100) COLLATE "pg_catalog"."default",
  "os_name" varchar(100) COLLATE "pg_catalog"."default",
  "platform_name" varchar(100) COLLATE "pg_catalog"."default",
  "mobile" int2,
  "device_name" varchar(100) COLLATE "pg_catalog"."default",
  "device_model" varchar(100) COLLATE "pg_catalog"."default",
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_operation_log"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_operation_log"."request_id" IS '请求ID';
COMMENT ON COLUMN "public"."sys_operation_log"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_operation_log"."user_name" IS '用户名称';
COMMENT ON COLUMN "public"."sys_operation_log"."name" IS '日志名称';
COMMENT ON COLUMN "public"."sys_operation_log"."ip" IS 'IP';
COMMENT ON COLUMN "public"."sys_operation_log"."area" IS '区域';
COMMENT ON COLUMN "public"."sys_operation_log"."operator" IS '运营商';
COMMENT ON COLUMN "public"."sys_operation_log"."path" IS '全路径';
COMMENT ON COLUMN "public"."sys_operation_log"."module" IS '模块名称';
COMMENT ON COLUMN "public"."sys_operation_log"."class_name" IS '类名';
COMMENT ON COLUMN "public"."sys_operation_log"."method_name" IS '方法名称';
COMMENT ON COLUMN "public"."sys_operation_log"."request_method" IS '请求方式，GET/POST';
COMMENT ON COLUMN "public"."sys_operation_log"."content_type" IS '内容类型';
COMMENT ON COLUMN "public"."sys_operation_log"."request_body" IS '是否是JSON请求映射参数';
COMMENT ON COLUMN "public"."sys_operation_log"."param" IS '请求参数';
COMMENT ON COLUMN "public"."sys_operation_log"."token" IS 'tokenMd5值';
COMMENT ON COLUMN "public"."sys_operation_log"."type" IS '0:其它,1:新增,2:修改,3:删除,4:详情查询,5:所有列表,6:分页列表,7:其它查询,8:上传文件';
COMMENT ON COLUMN "public"."sys_operation_log"."success" IS '0:失败,1:成功';
COMMENT ON COLUMN "public"."sys_operation_log"."code" IS '响应结果状态码';
COMMENT ON COLUMN "public"."sys_operation_log"."message" IS '响应结果消息';
COMMENT ON COLUMN "public"."sys_operation_log"."exception_name" IS '异常类名称';
COMMENT ON COLUMN "public"."sys_operation_log"."exception_message" IS '异常信息';
COMMENT ON COLUMN "public"."sys_operation_log"."browser_name" IS '浏览器名称';
COMMENT ON COLUMN "public"."sys_operation_log"."browser_version" IS '浏览器版本';
COMMENT ON COLUMN "public"."sys_operation_log"."engine_name" IS '浏览器引擎名称';
COMMENT ON COLUMN "public"."sys_operation_log"."engine_version" IS '浏览器引擎版本';
COMMENT ON COLUMN "public"."sys_operation_log"."os_name" IS '系统名称';
COMMENT ON COLUMN "public"."sys_operation_log"."platform_name" IS '平台名称';
COMMENT ON COLUMN "public"."sys_operation_log"."mobile" IS '是否是手机,0:否,1:是';
COMMENT ON COLUMN "public"."sys_operation_log"."device_name" IS '移动端设备名称';
COMMENT ON COLUMN "public"."sys_operation_log"."device_model" IS '移动端设备型号';
COMMENT ON COLUMN "public"."sys_operation_log"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_operation_log"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_operation_log"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_operation_log" IS '系统操作日志';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO "public"."sys_operation_log" VALUES (1, '1242805276474634241', NULL, NULL, 'helloWorld', '127.0.0.1', '本机地址', NULL, '/api/hello/world', NULL, 'io.geekidea.springbootplus.system.controller.HelloWorldController', 'helloWorld', 'GET', NULL, 0, NULL, NULL, 0, 1, 200, '操作成功', NULL, NULL, 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, NULL, NULL, '', '2020-03-25 21:27:22', NULL);
INSERT INTO "public"."sys_operation_log" VALUES (2, '1242820418688049153', NULL, NULL, 'FooBar分页列表', '127.0.0.1', '本机地址', NULL, '/api/fooBar/getPageList', 'foobar', 'com.example.foobar.controller.FooBarController', 'getFooBarPageList', 'POST', 'application/json', 1, '{"pageIndex":1,"pageSize":10}', NULL, 7, 1, 200, '操作成功', NULL, NULL, 'Chrome', '80.0.3987.149', 'Webkit', '537.36', 'OSX', 'Mac', 0, NULL, NULL, '', '2020-03-25 22:27:33', NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_permission";
CREATE TABLE "public"."sys_permission" (
  "id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default",
  "parent_id" int8,
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "icon" varchar(100) COLLATE "pg_catalog"."default",
  "type" int4 NOT NULL,
  "level" int4 NOT NULL,
  "state" int4 NOT NULL,
  "sort" int4 NOT NULL,
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "version" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_permission"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_permission"."name" IS '权限名称';
COMMENT ON COLUMN "public"."sys_permission"."parent_id" IS '父id';
COMMENT ON COLUMN "public"."sys_permission"."url" IS '路径';
COMMENT ON COLUMN "public"."sys_permission"."code" IS '唯一编码';
COMMENT ON COLUMN "public"."sys_permission"."icon" IS '图标';
COMMENT ON COLUMN "public"."sys_permission"."type" IS '类型，1：菜单，2：按钮';
COMMENT ON COLUMN "public"."sys_permission"."level" IS '层级，1：第一级，2：第二级，N：第N级';
COMMENT ON COLUMN "public"."sys_permission"."state" IS '状态，0：禁用，1：启用';
COMMENT ON COLUMN "public"."sys_permission"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys_permission"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_permission"."version" IS '版本';
COMMENT ON COLUMN "public"."sys_permission"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_permission"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_permission" IS '系统权限';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO "public"."sys_permission" VALUES (1, '系统管理', NULL, NULL, 'system:management', 'el-icon-s-unfold', 1, 1, 1, 0, '1权限备注', 0, '2019-10-26 11:12:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (100, '用户管理', 1, NULL, 'sys:user:management', 'el-icon-s-unfold', 1, 2, 1, 0, '100权限备注', 0, '2019-10-26 11:15:48', NULL);
INSERT INTO "public"."sys_permission" VALUES (200, '角色管理', 1, NULL, 'sys:role:management', 'el-icon-s-unfold', 1, 2, 1, 0, '200权限备注', 0, '2019-10-26 11:15:48', NULL);
INSERT INTO "public"."sys_permission" VALUES (300, '权限管理', 1, NULL, 'sys:permission:management', 'el-icon-s-unfold', 1, 2, 1, 0, '300权限备注', 0, '2019-10-26 11:15:48', NULL);
INSERT INTO "public"."sys_permission" VALUES (400, '部门管理', 1, NULL, 'sys:department:management', 'el-icon-s-unfold', 1, 2, 1, 0, '400权限备注', 0, '2019-10-26 11:15:48', NULL);
INSERT INTO "public"."sys_permission" VALUES (500, '日志管理', 1, NULL, 'sys:log:manager', 'el-icon-s-custom', 1, 2, 1, 0, '500权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (1000, '用户新增', 100, NULL, 'sys:user:add', 'el-icon-s-custom', 2, 3, 1, 0, '1000权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (1001, '用户修改', 100, NULL, 'sys:user:update', 'el-icon-s-custom', 2, 3, 1, 0, '1001权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (1002, '用户删除', 100, NULL, 'sys:user:delete', 'el-icon-s-custom', 2, 3, 1, 0, '1002权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (1003, '用户详情', 100, NULL, 'sys:user:info', 'el-icon-s-custom', 2, 3, 1, 0, '1003权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (1004, '用户分页列表', 100, NULL, 'sys:user:page', 'el-icon-s-custom', 2, 3, 1, 0, '1004权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (1005, '用户修改密码', 100, NULL, 'sys:user:update:password', 'el-icon-s-custom', 2, 3, 1, 0, '1005权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (1006, '用户修改头像', 100, NULL, 'sys:user:update:head', 'el-icon-s-custom', 2, 3, 1, 0, '1006权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (1007, '用户重置密码', 100, NULL, 'sys:user:reset:password', 'el-icon-s-custom', 2, 3, 1, 0, '1007权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (2000, '角色新增', 200, NULL, 'sys:role:add', 'el-icon-s-custom', 2, 3, 1, 0, '2000权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (2001, '角色修改', 200, NULL, 'sys:role:update', 'el-icon-s-custom', 2, 3, 1, 0, '2001权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (2002, '角色删除', 200, NULL, 'sys:role:delete', 'el-icon-s-custom', 2, 3, 1, 0, '2002权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (2003, '角色详情', 200, NULL, 'sys:role:info', 'el-icon-s-custom', 2, 3, 1, 0, '2003权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (2004, '角色分页列表', 200, NULL, 'sys:role:page', 'el-icon-s-custom', 2, 3, 1, 0, '2004权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (2005, '角色列表', 200, NULL, 'sys:role:list', 'el-icon-s-custom', 2, 3, 1, 0, '2005权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (2006, '角色权限ID列表', 200, NULL, 'sys:permission:three-ids-by-role-id', 'el-icon-s-custom', 2, 3, 1, 0, '2006权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3000, '权限新增', 300, NULL, 'sys:permission:add', 'el-icon-s-custom', 2, 3, 1, 0, '3000权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3001, '权限修改', 300, NULL, 'sys:permission:update', 'el-icon-s-custom', 2, 3, 1, 0, '3001权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3002, '权限删除', 300, NULL, 'sys:permission:delete', 'el-icon-s-custom', 2, 3, 1, 0, '3002权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3003, '权限详情', 300, NULL, 'sys:permission:info', 'el-icon-s-custom', 2, 3, 1, 0, '3003权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3004, '权限分页列表', 300, NULL, 'sys:permission:page', 'el-icon-s-custom', 2, 3, 1, 0, '3004权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3005, '权限所有列表', 300, NULL, 'sys:permission:all:menu:list', 'el-icon-s-custom', 2, 3, 1, 0, '3005权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3006, '权限所有树形列表', 300, NULL, 'sys:permission:all:menu:tree', 'el-icon-s-custom', 2, 3, 1, 0, '3006权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3007, '权限用户列表', 300, NULL, 'sys:permission:menu:list', 'el-icon-s-custom', 2, 3, 1, 0, '3007权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3008, '权限用户树形列表', 300, NULL, 'sys:permission:menu:tree', 'el-icon-s-custom', 2, 3, 1, 0, '3008权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3009, '权限用户代码列表', 300, NULL, 'sys:permission:codes', 'el-icon-s-custom', 2, 3, 1, 0, '3009权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3010, '导航菜单', 300, NULL, 'sys:permission:nav-menu', 'el-icon-s-custom', 2, 3, 1, 0, '3010权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (3011, '角色权限修改', 300, NULL, 'sys:role-permission:update', 'el-icon-s-custom', 2, 3, 1, 0, '3011权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (4000, '部门新增', 400, NULL, 'sys:department:add', 'el-icon-s-custom', 2, 3, 1, 0, '4000权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (4001, '部门修改', 400, NULL, 'sys:department:update', 'el-icon-s-custom', 2, 3, 1, 0, '4001权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (4002, '部门删除', 400, NULL, 'sys:department:delete', 'el-icon-s-custom', 2, 3, 1, 0, '4002权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (4003, '部门详情', 400, NULL, 'sys:department:info', 'el-icon-s-custom', 2, 3, 1, 0, '4003权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (4004, '部门分页列表', 400, NULL, 'sys:department:page', 'el-icon-s-custom', 2, 3, 1, 0, '4004权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (4005, '部门列表', 400, NULL, 'sys:department:list', 'el-icon-s-custom', 2, 3, 1, 0, '4005权限备注', 1, '2019-10-26 11:18:40', '2020-03-09 00:50:13');
INSERT INTO "public"."sys_permission" VALUES (4006, '部门树形列表', 400, NULL, 'sys:department:all:tree', 'el-icon-s-custom', 2, 3, 1, 0, '4006权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (5001, '操作日志列表', 500, NULL, 'sys:operation:log:page', 'el-icon-s-custom', 2, 3, 1, 0, '5001权限备注', 0, '2019-10-26 11:18:40', NULL);
INSERT INTO "public"."sys_permission" VALUES (5002, '登录日志列表', 500, NULL, 'sys:login:log:page', 'el-icon-s-custom', 2, 3, 1, 0, '5002权限备注', 0, '2019-10-26 11:18:40', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" int8 NOT NULL,
  "name" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(100) COLLATE "pg_catalog"."default",
  "type" int4,
  "state" int4 NOT NULL,
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "version" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_role"."name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."code" IS '角色唯一编码';
COMMENT ON COLUMN "public"."sys_role"."type" IS '角色类型';
COMMENT ON COLUMN "public"."sys_role"."state" IS '角色状态，0：禁用，1：启用';
COMMENT ON COLUMN "public"."sys_role"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."version" IS '版本';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_role" IS '系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (1, '管理员', 'admin', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (2, 'test', 'test', NULL, 1, '测试人员拥有部分权限', 0, '2019-10-25 09:48:02', NULL);
INSERT INTO "public"."sys_role" VALUES (3, '管理员1', 'admin1', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (4, '管理员2', 'admin2', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (5, '管理员3', 'admin3', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (6, '管理员4', 'admin4', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (7, '管理员5', 'admin5', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (8, '管理员6', 'admin6', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (9, '管理员7', 'admin7', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (10, '管理员8', 'admin8', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (11, '管理员9', 'admin9', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (12, '管理员10', 'admin10', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (13, '管理员11', 'admin11', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (14, '管理员12', 'admin12', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (15, '管理员13', 'admin13', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (16, '管理员14', 'admin14', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (17, '管理员15', 'admin15', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (18, '管理员16', 'admin16', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (19, '管理员17', 'admin17', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (20, '管理员18', 'admin18', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (21, '管理员19', 'admin19', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (22, '管理员20', 'admin20', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);
INSERT INTO "public"."sys_role" VALUES (23, '管理员21', 'admin21', NULL, 1, '管理员拥有所有权限', 0, '2019-10-25 09:47:21', NULL);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_permission";
CREATE TABLE "public"."sys_role_permission" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "permission_id" int8 NOT NULL,
  "state" int4 NOT NULL,
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "version" int4 NOT NULL,
  "create_time" timestamp(6) NOT NULL,
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role_permission"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_role_permission"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."sys_role_permission"."permission_id" IS '权限id';
COMMENT ON COLUMN "public"."sys_role_permission"."state" IS '状态，0：禁用，1：启用';
COMMENT ON COLUMN "public"."sys_role_permission"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_role_permission"."version" IS '版本';
COMMENT ON COLUMN "public"."sys_role_permission"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role_permission"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_role_permission" IS '角色权限关系';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO "public"."sys_role_permission" VALUES (303, 1, 3008, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (304, 1, 1, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (305, 1, 3009, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (306, 1, 3010, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (307, 1, 3011, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (308, 1, 200, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (309, 1, 5001, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (310, 1, 5002, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (311, 1, 2000, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (312, 1, 400, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (313, 1, 2001, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (314, 1, 2002, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (315, 1, 2003, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (316, 1, 2004, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (317, 1, 2005, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (318, 1, 2006, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (319, 1, 4000, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (320, 1, 4001, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (321, 1, 4002, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (322, 1, 4003, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (323, 1, 100, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (324, 1, 4004, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (325, 1, 4005, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (326, 1, 4006, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (327, 1, 1000, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (328, 1, 1001, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (329, 1, 1002, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (330, 1, 1003, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (331, 1, 1004, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (332, 1, 300, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (333, 1, 1005, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (334, 1, 1006, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (335, 1, 1007, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (336, 1, 500, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (337, 1, 3000, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (338, 1, 3001, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (339, 1, 3002, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (340, 1, 3003, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (341, 1, 3004, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (342, 1, 3005, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (343, 1, 3006, 1, NULL, 0, '2020-04-01 00:14:36', NULL);
INSERT INTO "public"."sys_role_permission" VALUES (344, 1, 3007, 1, NULL, 0, '2020-04-01 00:14:36', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" int8 NOT NULL,
  "username" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "nickname" varchar(20) COLLATE "pg_catalog"."default",
  "password" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "salt" varchar(32) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "gender" int4 NOT NULL,
  "head" varchar(200) COLLATE "pg_catalog"."default",
  "remark" varchar(200) COLLATE "pg_catalog"."default",
  "state" int4 NOT NULL,
  "department_id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "deleted" int4 NOT NULL,
  "version" int4 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_user"."id" IS '主键';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_user"."nickname" IS '昵称';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."salt" IS '盐值';
COMMENT ON COLUMN "public"."sys_user"."phone" IS '手机号码';
COMMENT ON COLUMN "public"."sys_user"."gender" IS '性别，0：女，1：男，默认1';
COMMENT ON COLUMN "public"."sys_user"."head" IS '头像';
COMMENT ON COLUMN "public"."sys_user"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_user"."state" IS '状态，0：禁用，1：启用，2：锁定';
COMMENT ON COLUMN "public"."sys_user"."department_id" IS '部门id';
COMMENT ON COLUMN "public"."sys_user"."role_id" IS '角色id';
COMMENT ON COLUMN "public"."sys_user"."deleted" IS '逻辑删除，0：未删除，1：已删除';
COMMENT ON COLUMN "public"."sys_user"."version" IS '版本';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."update_time" IS '修改时间';
COMMENT ON TABLE "public"."sys_user" IS '系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES (1, 'admin', '管理员', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889900', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 00:00:00', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (2, 'test', '测试人员1', '34783fb724b259beb71a1279f7cd93bdcfd92a273d566f926419a37825c500df', '087c2e9857f35f1e243367f3b89b81c1', '15888889901', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Tester Account', 1, 1, 2, 0, 1, '2020-02-26 00:00:01', '2020-02-15 19:31:50');
INSERT INTO "public"."sys_user" VALUES (3, 'admin1', '管理员1', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889902', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 00:09:09', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (4, 'admin2', '管理员2', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889903', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 16:10:06', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (5, 'admin3', '管理员3', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889904', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 16:10:06', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (6, 'admin4', '管理员4', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889905', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 16:10:06', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (7, 'admin5', '管理员5', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889906', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 23:59:59', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (8, 'admin6', '管理员6', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-26 23:59:59', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (9, 'admin7', '管理员7', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-02-20 23:59:59', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (10, 'admin8', '管理员8', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2020-01-30 22:56:55', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (11, 'admin9', '管理员9', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2019-12-30 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (12, 'admin10', '管理员10', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (13, 'admin11', '管理员11', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 1, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (14, 'admin12', '管理员12', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 2, '2019-08-26 00:52:01', '2020-02-27 14:05:40');
INSERT INTO "public"."sys_user" VALUES (15, 'admin13', '管理员13uuu', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 3, '2019-08-26 00:52:01', '2020-02-27 14:05:18');
INSERT INTO "public"."sys_user" VALUES (16, 'admin14', '管理员14', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (17, 'admin15', '管理员15', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (18, 'admin16', '管理员16', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (19, 'admin17', '管理员17', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (20, 'admin18', '管理员18', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (21, 'admin19', '管理员19', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (22, 'admin20', '管理员20', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (23, 'admin21', '管理员21', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (24, 'admin22', '管理员22', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 0, 1, 1, 0, 1, '2019-08-26 00:52:01', '2019-10-27 23:32:29');
INSERT INTO "public"."sys_user" VALUES (25, 'admin23', '管理员23', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '666', '15888889999', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'Administrator Account', 2, 1, 1, 0, 3, '2019-08-26 00:52:01', '2020-02-27 14:42:28');
INSERT INTO "public"."sys_user" VALUES (100, 'dddd', 'ddddd', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', 'aa98a65fa53d198f38d8e3a63f3f5a65', 'ddddddddddd', 1, 'http://localhost:8888/api/resource/201908201013068.png', 'dddddddd', 1, 1, 1, 0, 1, '2020-02-26 14:06:53', '2020-02-27 14:06:52');
INSERT INTO "public"."sys_user" VALUES (101, 'adminx', '111111', '11a254dab80d52bc4a347e030e54d861a9d2cdb2af2185a9ca4a7318e830d04d', '1faf81180b4a4a78c48d7c31479a0622', '11111111111', 1, 'http://localhost:8888/api/resource/201908201013068.png', '1111111111', 1, 1, 1, 1, 6, '2020-02-26 14:19:57', '2020-03-02 17:33:48');

-- ----------------------------
-- Primary Key structure for table example_order
-- ----------------------------
ALTER TABLE "public"."example_order" ADD CONSTRAINT "example_order_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table foo_bar
-- ----------------------------
ALTER TABLE "public"."foo_bar" ADD CONSTRAINT "foo_bar_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table ip_address
-- ----------------------------
CREATE INDEX "ip_address_ip_end_num_index" ON "public"."ip_address" USING btree (
  "ip_end_num" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "ip_address_ip_start_num_index" ON "public"."ip_address" USING btree (
  "ip_start_num" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ip_address
-- ----------------------------
ALTER TABLE "public"."ip_address" ADD CONSTRAINT "ip_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_department
-- ----------------------------
CREATE INDEX "sys_department_name_uindex" ON "public"."sys_department" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_department
-- ----------------------------
ALTER TABLE "public"."sys_department" ADD CONSTRAINT "sys_department_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_login_log
-- ----------------------------
ALTER TABLE "public"."sys_login_log" ADD CONSTRAINT "sys_login_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_operation_log
-- ----------------------------
ALTER TABLE "public"."sys_operation_log" ADD CONSTRAINT "sys_operation_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_permission
-- ----------------------------
CREATE INDEX "sys_permission_code_uindex" ON "public"."sys_permission" USING btree (
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_permission
-- ----------------------------
ALTER TABLE "public"."sys_permission" ADD CONSTRAINT "sys_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_role
-- ----------------------------
CREATE INDEX "sys_role_name_uindex" ON "public"."sys_role" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_role_permission
-- ----------------------------
CREATE INDEX "permission_id" ON "public"."sys_role_permission" USING btree (
  "permission_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "role_id" ON "public"."sys_role_permission" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_role_permission
-- ----------------------------
ALTER TABLE "public"."sys_role_permission" ADD CONSTRAINT "sys_role_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE INDEX "department_id" ON "public"."sys_user" USING btree (
  "department_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "sys_user_username_uindex" ON "public"."sys_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
