/*
 Navicat Premium Data Transfer

 Source Server         : localhost-5432
 Source Server Type    : PostgreSQL
 Source Server Version : 110008
 Source Host           : localhost:5432
 Source Catalog        : bootshiro
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110008
 File Encoding         : 65001

 Date: 20/12/2020 13:08:10
*/


-- ----------------------------
-- Table structure for api_example
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_example";
CREATE TABLE "public"."api_example" (
  "id" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "api_info_id" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "method" varchar(45) COLLATE "pg_catalog"."default",
  "url" text COLLATE "pg_catalog"."default",
  "request_header" text COLLATE "pg_catalog"."default",
  "request_body" text COLLATE "pg_catalog"."default",
  "response_header" text COLLATE "pg_catalog"."default",
  "response_body" text COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default",
  "time" int4,
  "options" text COLLATE "pg_catalog"."default",
  "editor" varchar(45) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;
COMMENT ON TABLE "public"."api_example" IS '模拟数据';

-- ----------------------------
-- Table structure for api_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_info";
CREATE TABLE "public"."api_info" (
  "id" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "method" varchar(45) COLLATE "pg_catalog"."default",
  "path" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(5) COLLATE "pg_catalog"."default",
  "service" varchar(45) COLLATE "pg_catalog"."default",
  "group" varchar(45) COLLATE "pg_catalog"."default",
  "editor" varchar(45) COLLATE "pg_catalog"."default",
  "comment" varchar(200) COLLATE "pg_catalog"."default",
  "datasource" varchar(45) COLLATE "pg_catalog"."default",
  "script" text COLLATE "pg_catalog"."default",
  "options" text COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."api_info"."type" IS '类型：CODE,SQL';
COMMENT ON TABLE "public"."api_info" IS '路径明细';

-- ----------------------------
-- Table structure for api_info_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_info_history";
CREATE TABLE "public"."api_info_history" (
  "id" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "api_info_id" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "method" varchar(45) COLLATE "pg_catalog"."default",
  "path" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(5) COLLATE "pg_catalog"."default",
  "service" varchar(45) COLLATE "pg_catalog"."default",
  "group" varchar(45) COLLATE "pg_catalog"."default",
  "editor" varchar(45) COLLATE "pg_catalog"."default",
  "comment" varchar(200) COLLATE "pg_catalog"."default",
  "datasource" varchar(45) COLLATE "pg_catalog"."default",
  "script" text COLLATE "pg_catalog"."default",
  "options" text COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."api_info_history"."type" IS '类型：CODE,SQL';
COMMENT ON TABLE "public"."api_info_history" IS '路径明细历史';

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."schedule_job";
CREATE TABLE "public"."schedule_job" (
  "job_id" int8 NOT NULL,
  "bean_name" varchar(200) COLLATE "pg_catalog"."default",
  "params" varchar(2000) COLLATE "pg_catalog"."default",
  "cron_expression" varchar(100) COLLATE "pg_catalog"."default",
  "status" int2,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."schedule_job"."job_id" IS '任务id';
COMMENT ON COLUMN "public"."schedule_job"."bean_name" IS 'spring bean名称';
COMMENT ON COLUMN "public"."schedule_job"."params" IS '参数';
COMMENT ON COLUMN "public"."schedule_job"."cron_expression" IS 'cron表达式';
COMMENT ON COLUMN "public"."schedule_job"."status" IS '任务状态  0：正常  1：暂停';
COMMENT ON COLUMN "public"."schedule_job"."remark" IS '备注';
COMMENT ON COLUMN "public"."schedule_job"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."schedule_job" IS '定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO "public"."schedule_job" VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2020-12-19 23:55:18');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."schedule_job_log";
CREATE TABLE "public"."schedule_job_log" (
  "log_id" int8 NOT NULL,
  "job_id" int8 NOT NULL,
  "bean_name" varchar(200) COLLATE "pg_catalog"."default",
  "params" varchar(2000) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "error" varchar(2000) COLLATE "pg_catalog"."default",
  "times" int4 NOT NULL,
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."schedule_job_log"."log_id" IS '任务日志id';
COMMENT ON COLUMN "public"."schedule_job_log"."job_id" IS '任务id';
COMMENT ON COLUMN "public"."schedule_job_log"."bean_name" IS 'spring bean名称';
COMMENT ON COLUMN "public"."schedule_job_log"."params" IS '参数';
COMMENT ON COLUMN "public"."schedule_job_log"."status" IS '任务状态    0：成功    1：失败';
COMMENT ON COLUMN "public"."schedule_job_log"."error" IS '失败信息';
COMMENT ON COLUMN "public"."schedule_job_log"."times" IS '耗时(单位：毫秒)';
COMMENT ON COLUMN "public"."schedule_job_log"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."schedule_job_log" IS '定时任务日志';

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_config";
CREATE TABLE "public"."sys_config" (
  "id" int8 NOT NULL,
  "param_key" varchar(50) COLLATE "pg_catalog"."default",
  "param_value" varchar(2000) COLLATE "pg_catalog"."default",
  "status" int2,
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_config"."param_key" IS 'key';
COMMENT ON COLUMN "public"."sys_config"."param_value" IS 'value';
COMMENT ON COLUMN "public"."sys_config"."status" IS '状态   0：隐藏   1：显示';
COMMENT ON COLUMN "public"."sys_config"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_config" IS '系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO "public"."sys_config" VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{"aliyunAccessKeyId":"","aliyunAccessKeySecret":"","aliyunBucketName":"","aliyunDomain":"","aliyunEndPoint":"","aliyunPrefix":"","qcloudBucketName":"","qcloudDomain":"","qcloudPrefix":"","qcloudSecretId":"","qcloudSecretKey":"","qiniuAccessKey":"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ","qiniuBucketName":"ios-app","qiniuDomain":"http://7xqbwh.dl1.z0.glb.clouddn.com","qiniuPrefix":"upload","qiniuSecretKey":"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV","type":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "dept_id" int8 NOT NULL,
  "parent_id" int8,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "order_num" int4,
  "del_flag" int2
)
;
COMMENT ON COLUMN "public"."sys_dept"."parent_id" IS '上级部门ID，一级部门为0';
COMMENT ON COLUMN "public"."sys_dept"."name" IS '部门名称';
COMMENT ON COLUMN "public"."sys_dept"."order_num" IS '排序';
COMMENT ON COLUMN "public"."sys_dept"."del_flag" IS '是否删除  -1：已删除  0：正常';
COMMENT ON TABLE "public"."sys_dept" IS '部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" VALUES (1, 0, '人人开源集团', 0, 0);
INSERT INTO "public"."sys_dept" VALUES (2, 1, '长沙分公司', 1, 0);
INSERT INTO "public"."sys_dept" VALUES (3, 1, '上海分公司', 2, 0);
INSERT INTO "public"."sys_dept" VALUES (4, 3, '技术部', 0, 0);
INSERT INTO "public"."sys_dept" VALUES (5, 3, '销售部', 1, 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict";
CREATE TABLE "public"."sys_dict" (
  "id" int8 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "order_num" int4,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "del_flag" int2
)
;
COMMENT ON COLUMN "public"."sys_dict"."name" IS '字典名称';
COMMENT ON COLUMN "public"."sys_dict"."type" IS '字典类型';
COMMENT ON COLUMN "public"."sys_dict"."code" IS '字典码';
COMMENT ON COLUMN "public"."sys_dict"."value" IS '字典值';
COMMENT ON COLUMN "public"."sys_dict"."order_num" IS '排序';
COMMENT ON COLUMN "public"."sys_dict"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict"."del_flag" IS '删除标记  -1：已删除  0：正常';
COMMENT ON TABLE "public"."sys_dict" IS '数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO "public"."sys_dict" VALUES (1, '性别', 'sex', '0', '女', 0, NULL, 0);
INSERT INTO "public"."sys_dict" VALUES (2, '性别', 'sex', '1', '男', 1, NULL, 0);
INSERT INTO "public"."sys_dict" VALUES (3, '性别', 'sex', '2', '未知', 3, NULL, 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log";
CREATE TABLE "public"."sys_log" (
  "id" int8 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default",
  "operation" varchar(50) COLLATE "pg_catalog"."default",
  "method" varchar(200) COLLATE "pg_catalog"."default",
  "params" varchar(5000) COLLATE "pg_catalog"."default",
  "time" int8 NOT NULL,
  "ip" varchar(64) COLLATE "pg_catalog"."default",
  "create_date" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_log"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_log"."operation" IS '用户操作';
COMMENT ON COLUMN "public"."sys_log"."method" IS '请求方法';
COMMENT ON COLUMN "public"."sys_log"."params" IS '请求参数';
COMMENT ON COLUMN "public"."sys_log"."time" IS '执行时长(毫秒)';
COMMENT ON COLUMN "public"."sys_log"."ip" IS 'IP地址';
COMMENT ON COLUMN "public"."sys_log"."create_date" IS '创建时间';
COMMENT ON TABLE "public"."sys_log" IS '系统日志';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "menu_id" int8 NOT NULL,
  "parent_id" int8,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "perms" varchar(500) COLLATE "pg_catalog"."default",
  "type" int4,
  "icon" varchar(50) COLLATE "pg_catalog"."default",
  "order_num" int4
)
;
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '父菜单ID，一级菜单为0';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '菜单名称';
COMMENT ON COLUMN "public"."sys_menu"."url" IS '菜单URL';
COMMENT ON COLUMN "public"."sys_menu"."perms" IS '授权(多个用逗号分隔，如：user:list,user:create)';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '类型   0：目录   1：菜单   2：按钮';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."sys_menu"."order_num" IS '排序';
COMMENT ON TABLE "public"."sys_menu" IS '菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO "public"."sys_menu" VALUES (2, 1, '管理员管理', 'modules/sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO "public"."sys_menu" VALUES (3, 1, '角色管理', 'modules/sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO "public"."sys_menu" VALUES (4, 1, '菜单管理', 'modules/sys/menu.html', NULL, 1, 'fa fa-th-list', 3);
INSERT INTO "public"."sys_menu" VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO "public"."sys_menu" VALUES (6, 1, '定时任务', 'modules/job/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO "public"."sys_menu" VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO "public"."sys_menu" VALUES (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7);
INSERT INTO "public"."sys_menu" VALUES (30, 1, '文件上传', 'modules/oss/oss.html', 'sys:oss:all', 1, 'fa fa-file-image-o', 6);
INSERT INTO "public"."sys_menu" VALUES (31, 1, '部门管理', 'modules/sys/dept.html', NULL, 1, 'fa fa-file-code-o', 1);
INSERT INTO "public"."sys_menu" VALUES (32, 31, '查看', NULL, 'sys:dept:list,sys:dept:info', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (33, 31, '新增', NULL, 'sys:dept:save,sys:dept:select', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (34, 31, '修改', NULL, 'sys:dept:update,sys:dept:select', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (35, 31, '删除', NULL, 'sys:dept:delete', 2, NULL, 0);
INSERT INTO "public"."sys_menu" VALUES (36, 1, '字典管理', 'modules/sys/dict.html', NULL, 1, 'fa fa-bookmark-o', 6);
INSERT INTO "public"."sys_menu" VALUES (37, 36, '查看', NULL, 'sys:dict:list,sys:dict:info', 2, NULL, 6);
INSERT INTO "public"."sys_menu" VALUES (38, 36, '新增', NULL, 'sys:dict:save', 2, NULL, 6);
INSERT INTO "public"."sys_menu" VALUES (39, 36, '修改', NULL, 'sys:dict:update', 2, NULL, 6);
INSERT INTO "public"."sys_menu" VALUES (40, 36, '删除', NULL, 'sys:dict:delete', 2, NULL, 6);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_oss";
CREATE TABLE "public"."sys_oss" (
  "id" int8 NOT NULL,
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "create_date" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_oss"."url" IS 'URL地址';
COMMENT ON COLUMN "public"."sys_oss"."create_date" IS '创建时间';
COMMENT ON TABLE "public"."sys_oss" IS '文件上传';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "role_id" int8 NOT NULL,
  "role_name" varchar(100) COLLATE "pg_catalog"."default",
  "remark" varchar(100) COLLATE "pg_catalog"."default",
  "dept_id" int8,
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."dept_id" IS '部门ID';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."sys_role" IS '角色';

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_dept";
CREATE TABLE "public"."sys_role_dept" (
  "id" int8 NOT NULL,
  "role_id" int8,
  "dept_id" int8
)
;
COMMENT ON COLUMN "public"."sys_role_dept"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_dept"."dept_id" IS '部门ID';
COMMENT ON TABLE "public"."sys_role_dept" IS '角色与部门对应关系';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "id" int8 NOT NULL,
  "role_id" int8,
  "menu_id" int8
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '菜单ID';
COMMENT ON TABLE "public"."sys_role_menu" IS '角色与菜单对应关系';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "user_id" int8 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "salt" varchar(20) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "mobile" varchar(100) COLLATE "pg_catalog"."default",
  "status" int2,
  "dept_id" int8,
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."salt" IS '盐';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."mobile" IS '手机号';
COMMENT ON COLUMN "public"."sys_user"."status" IS '状态  0：禁用   1：正常';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '部门ID';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."sys_user" IS '系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES (1, 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "id" int8 NOT NULL,
  "user_id" int8,
  "role_id" int8
)
;
COMMENT ON COLUMN "public"."sys_user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user_role"."role_id" IS '角色ID';
COMMENT ON TABLE "public"."sys_user_role" IS '用户与角色对应关系';

-- ----------------------------
-- Indexes structure for table api_example
-- ----------------------------
CREATE INDEX "index_api_id" ON "public"."api_example" USING btree (
  "api_info_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table api_example
-- ----------------------------
ALTER TABLE "public"."api_example" ADD CONSTRAINT "api_example_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table api_info
-- ----------------------------
CREATE INDEX "unique_path_method" ON "public"."api_info" USING btree (
  "service" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "path" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "method" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table api_info
-- ----------------------------
ALTER TABLE "public"."api_info" ADD CONSTRAINT "api_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table api_info_history
-- ----------------------------
ALTER TABLE "public"."api_info_history" ADD CONSTRAINT "api_info_history_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table schedule_job
-- ----------------------------
ALTER TABLE "public"."schedule_job" ADD CONSTRAINT "schedule_job_pkey" PRIMARY KEY ("job_id");

-- ----------------------------
-- Indexes structure for table schedule_job_log
-- ----------------------------
CREATE INDEX "job_id" ON "public"."schedule_job_log" USING btree (
  "job_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table schedule_job_log
-- ----------------------------
ALTER TABLE "public"."schedule_job_log" ADD CONSTRAINT "schedule_job_log_pkey" PRIMARY KEY ("log_id");

-- ----------------------------
-- Indexes structure for table sys_config
-- ----------------------------
CREATE INDEX "param_key" ON "public"."sys_config" USING btree (
  "param_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE "public"."sys_config" ADD CONSTRAINT "sys_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("dept_id");

-- ----------------------------
-- Indexes structure for table sys_dict
-- ----------------------------
CREATE INDEX "type" ON "public"."sys_dict" USING btree (
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict
-- ----------------------------
ALTER TABLE "public"."sys_dict" ADD CONSTRAINT "sys_dict_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_log
-- ----------------------------
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("menu_id");

-- ----------------------------
-- Primary Key structure for table sys_oss
-- ----------------------------
ALTER TABLE "public"."sys_oss" ADD CONSTRAINT "sys_oss_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table sys_role_dept
-- ----------------------------
ALTER TABLE "public"."sys_role_dept" ADD CONSTRAINT "sys_role_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE INDEX "username" ON "public"."sys_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_pkey" PRIMARY KEY ("id");
