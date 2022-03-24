/*
 Navicat Premium Data Transfer

 Source Server         : localPostgreSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 140001
 Source Host           : localhost:5432
 Source Catalog        : pisces-cloud
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140001
 File Encoding         : 65001

 Date: 24/03/2022 19:54:35
*/


-- ----------------------------
-- Sequence structure for pisces_auth_depart_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_depart_id_seq";
CREATE SEQUENCE "public"."pisces_auth_depart_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_menu_id_seq";
CREATE SEQUENCE "public"."pisces_auth_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_resource_category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_resource_category_id_seq";
CREATE SEQUENCE "public"."pisces_auth_resource_category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_resource_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_resource_id_seq";
CREATE SEQUENCE "public"."pisces_auth_resource_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_role_id_seq";
CREATE SEQUENCE "public"."pisces_auth_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_role_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_role_menu_id_seq";
CREATE SEQUENCE "public"."pisces_auth_role_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_role_resource_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_role_resource_id_seq";
CREATE SEQUENCE "public"."pisces_auth_role_resource_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_user_depart_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_user_depart_id_seq";
CREATE SEQUENCE "public"."pisces_auth_user_depart_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_user_id_seq";
CREATE SEQUENCE "public"."pisces_auth_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_auth_user_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_auth_user_role_id_seq";
CREATE SEQUENCE "public"."pisces_auth_user_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for pisces_sys_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pisces_sys_log_id_seq";
CREATE SEQUENCE "public"."pisces_sys_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for pisces_auth_depart
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_depart";
CREATE TABLE "public"."pisces_auth_depart" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_depart_id_seq'::regclass),
  "parent_id" int8,
  "name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "description" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sort" int4 DEFAULT 0,
  "creator" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "updater" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "del" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 1
)
;
COMMENT ON COLUMN "public"."pisces_auth_depart"."parent_id" IS '上级ID';
COMMENT ON COLUMN "public"."pisces_auth_depart"."name" IS '部门名称';
COMMENT ON COLUMN "public"."pisces_auth_depart"."description" IS '部门描述';
COMMENT ON COLUMN "public"."pisces_auth_depart"."sort" IS '排序';
COMMENT ON COLUMN "public"."pisces_auth_depart"."creator" IS '创建者';
COMMENT ON COLUMN "public"."pisces_auth_depart"."updater" IS '更新者';
COMMENT ON COLUMN "public"."pisces_auth_depart"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."pisces_auth_depart"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."pisces_auth_depart"."del" IS '逻辑删除：0->删除状态；1->可用状态';
COMMENT ON TABLE "public"."pisces_auth_depart" IS '组织机构表';

-- ----------------------------
-- Records of pisces_auth_depart
-- ----------------------------
INSERT INTO "public"."pisces_auth_depart" VALUES (1, 0, 'Pisces Item', 'Pisces 开源组织', 1, 'admin', 'admin', '2022-03-24 18:16:17', '2022-03-24 18:16:19', '1');
INSERT INTO "public"."pisces_auth_depart" VALUES (2, 1, '研发部', '研发部门', 2, 'admin', 'admin', '2022-03-24 18:16:39', '2022-03-24 18:16:41', '1');
INSERT INTO "public"."pisces_auth_depart" VALUES (3, 1, '设计部', '设计部门', 3, 'admin', 'admin', '2022-03-24 18:17:01', '2022-03-24 18:17:02', '1');

-- ----------------------------
-- Table structure for pisces_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_menu";
CREATE TABLE "public"."pisces_auth_menu" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_menu_id_seq'::regclass),
  "parent_id" int8,
  "title" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "parent_title" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "level" int4,
  "component" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "path" varchar(200) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "icon" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sort" int4 DEFAULT 0,
  "creator" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "updater" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "hidden" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "del" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 1
)
;
COMMENT ON COLUMN "public"."pisces_auth_menu"."parent_id" IS '父级ID';
COMMENT ON COLUMN "public"."pisces_auth_menu"."title" IS '菜单名称';
COMMENT ON COLUMN "public"."pisces_auth_menu"."name" IS '前端名称';
COMMENT ON COLUMN "public"."pisces_auth_menu"."parent_title" IS '父菜单名称';
COMMENT ON COLUMN "public"."pisces_auth_menu"."level" IS '菜单级数';
COMMENT ON COLUMN "public"."pisces_auth_menu"."component" IS '组件路径';
COMMENT ON COLUMN "public"."pisces_auth_menu"."path" IS '路由地址';
COMMENT ON COLUMN "public"."pisces_auth_menu"."icon" IS '菜单图标名称';
COMMENT ON COLUMN "public"."pisces_auth_menu"."sort" IS '排序';
COMMENT ON COLUMN "public"."pisces_auth_menu"."creator" IS '创建者';
COMMENT ON COLUMN "public"."pisces_auth_menu"."updater" IS '更新者';
COMMENT ON COLUMN "public"."pisces_auth_menu"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."pisces_auth_menu"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."pisces_auth_menu"."hidden" IS '菜单显示状态：0->禁用；1->启用';
COMMENT ON COLUMN "public"."pisces_auth_menu"."del" IS '逻辑删除：0->删除状态；1->可用状态';
COMMENT ON TABLE "public"."pisces_auth_menu" IS '菜单表';

-- ----------------------------
-- Records of pisces_auth_menu
-- ----------------------------
INSERT INTO "public"."pisces_auth_menu" VALUES (8, 1, '资源管理', 'resource', '资源管理', 2, '/auth/resource/index', 'resource', NULL, 6, 'admin', 'admin', '2022-03-20 18:45:47', '2022-03-20 18:45:49', '1', '1');
INSERT INTO "public"."pisces_auth_menu" VALUES (9, 1, '部门管理', 'depart', '部门管理', 2, '/auth/depart/index', 'depart', NULL, 7, 'admin', 'admin', '2022-03-20 18:46:20', '2022-03-24 17:02:12', '1', '1');
INSERT INTO "public"."pisces_auth_menu" VALUES (5, 1, '角色管理', 'role', '角色管理', 2, '/auth/role/index', 'role', '', 3, 'admin', 'admin', '2022-03-20 18:43:01', '2022-03-20 18:43:03', '1', '1');
INSERT INTO "public"."pisces_auth_menu" VALUES (7, 1, '资源类别管理', 'resourceCategory', '资源类别管理', 2, '/auth/resourceCategory/index', 'resourceCategory', NULL, 5, 'admin', 'admin', '2022-03-20 18:45:09', '2022-03-24 17:11:57', '1', '1');
INSERT INTO "public"."pisces_auth_menu" VALUES (4, 2, '日志管理', 'log', '系统管理', 2, '/system/log/index', 'log', '', 2, 'admin', 'admin', '2022-03-06 12:33:45', '2022-03-06 12:33:48', '1', '1');
INSERT INTO "public"."pisces_auth_menu" VALUES (3, 1, '用户管理', 'authUser', '权限管理', 2, '/auth/user/index', 'user', '', 2, 'admin', 'admin', '2022-03-04 20:56:48', '2022-03-04 20:56:48', '1', '1');
INSERT INTO "public"."pisces_auth_menu" VALUES (2, 0, '系统管理', 'system', NULL, 1, 'Layout', '/system', '', 2, 'admin', 'admin', '2022-03-04 20:55:19', '2022-03-04 20:55:19', '1', '1');
INSERT INTO "public"."pisces_auth_menu" VALUES (1, 0, '权限管理', 'auth', NULL, 1, 'Layout', '/auth', '', 1, 'admin', 'admin', '2022-03-04 20:54:23', '2022-03-04 20:54:26', '1', '1');
INSERT INTO "public"."pisces_auth_menu" VALUES (6, 1, '菜单管理', 'menu', '菜单管理', 2, '/auth/menu/index', 'menu', NULL, 4, 'admin', 'admin', '2022-03-20 18:44:08', '2022-03-20 18:44:11', '1', '1');

-- ----------------------------
-- Table structure for pisces_auth_resource
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_resource";
CREATE TABLE "public"."pisces_auth_resource" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_resource_id_seq'::regclass),
  "name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "url" varchar(200) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "description" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "category_id" int8 NOT NULL,
  "sort" int4 DEFAULT 0,
  "creator" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "updater" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "del" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 1
)
;
COMMENT ON COLUMN "public"."pisces_auth_resource"."name" IS '资源名称';
COMMENT ON COLUMN "public"."pisces_auth_resource"."url" IS '资源路径';
COMMENT ON COLUMN "public"."pisces_auth_resource"."description" IS '资源描述';
COMMENT ON COLUMN "public"."pisces_auth_resource"."category_id" IS '资源类别ID';
COMMENT ON COLUMN "public"."pisces_auth_resource"."sort" IS '排序';
COMMENT ON COLUMN "public"."pisces_auth_resource"."creator" IS '创建者';
COMMENT ON COLUMN "public"."pisces_auth_resource"."updater" IS '更新者';
COMMENT ON COLUMN "public"."pisces_auth_resource"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."pisces_auth_resource"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."pisces_auth_resource"."del" IS '逻辑删除：0->删除状态；1->可用状态';
COMMENT ON TABLE "public"."pisces_auth_resource" IS '资源表';

-- ----------------------------
-- Records of pisces_auth_resource
-- ----------------------------
INSERT INTO "public"."pisces_auth_resource" VALUES (2, '用户列表', '/user/list', '用户信息列表（分页）', 1, 2, 'admin', 'admin', '2022-03-13 16:48:42', '2022-03-13 16:48:44', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (3, '用户信息', '/user/info/**', '用户信息接口', 1, 3, 'admin', 'admin', '2022-03-13 19:41:51', '2022-03-13 19:41:52', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (1, '用户权限信息', '/user/info', '用户信息接口，需要认证！获取当前登录用户信息', 1, 1, 'admin', 'admin', '2022-03-04 21:25:12', '2022-03-04 21:25:14', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (4, '用户信息更新', '/user/update', '用户信息更新接口，需要认证！', 1, 4, 'admin', 'admin', '2022-03-13 19:42:56', '2022-03-13 19:42:58', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (5, '用户可用状态更新', '/user/change', '更改用户可用状态接口', 1, 5, 'admin', 'admin', '2022-03-20 11:44:45', '2022-03-20 11:44:47', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (6, '新增用户', '/user/add', '新增用户接口', 1, 6, 'admin', 'admin', '2022-03-20 14:54:51', '2022-03-20 14:54:51', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (7, '更新用户信息', '/user/update', '更新用户信息接口', 1, 7, 'admin', 'admin', '2022-03-20 16:50:25', '2022-03-20 16:50:25', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (9, '删除用户', '/user/delete/**', '根据用户id删除用户接口', 1, 8, 'admin', 'admin', '2022-03-20 16:50:59', '2022-03-20 16:50:59', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (10, '角色列表', '/role/list', '角色列表接口（分页）', 2, 1, 'admin', 'admin', '2022-03-20 19:27:39', '2022-03-20 19:27:42', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (11, '角色可用状态更新', '/role/change', '更改角色可用状态接口', 2, 2, 'admin', 'admin', '2022-03-20 20:06:33', '2022-03-20 20:06:34', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (12, '退出登录', '/user/loginOut', '退出登录接口', 1, 9, 'admin', 'admin', '2022-03-20 20:49:33', '2022-03-20 20:49:35', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (14, '菜单列表', '/menu/list', '菜单列表接口（分页）', 3, 1, 'admin', 'admin', '2022-03-24 14:53:49', '2022-03-24 14:53:51', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (15, '菜单可用状态更新', '/menu/change', '更改菜单可用状态接口', 3, 2, 'admin', 'admin', '2022-03-24 15:20:31', '2022-03-24 15:20:33', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (16, '删除菜单', '/menu/delete/**', '根据菜单id删除菜单接口', 3, 3, 'admin', 'admin', '2022-03-24 15:35:58', '2022-03-24 15:36:01', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (17, '更新菜单', '/menu/update', '更新菜单信息接口', 3, 4, 'admin', 'admin', '2022-03-24 16:08:06', '2022-03-24 16:08:07', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (18, '资源列表', '/resource/list', '资源列表接口（分页）', 5, 1, 'admin', 'admin', '2022-03-24 17:44:40', '2022-03-24 17:44:42', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (19, '资源类别列表', '/resource/category/list', '资源类别列表接口（分页）', 4, 1, 'admin', 'admin', '2022-03-24 17:45:22', '2022-03-24 17:45:24', '1');
INSERT INTO "public"."pisces_auth_resource" VALUES (20, '组织/部门列表', '/depart/list', '组织/部门列表接口（分页）', 6, 1, 'admin', 'admin', '2022-03-24 17:46:04', '2022-03-24 17:46:06', '1');

-- ----------------------------
-- Table structure for pisces_auth_resource_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_resource_category";
CREATE TABLE "public"."pisces_auth_resource_category" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_resource_category_id_seq'::regclass),
  "category_name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "description" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sort" int4 DEFAULT 0,
  "creator" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "updater" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "del" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 1
)
;
COMMENT ON COLUMN "public"."pisces_auth_resource_category"."category_name" IS '资源类别名称';
COMMENT ON COLUMN "public"."pisces_auth_resource_category"."description" IS '资源描述';
COMMENT ON COLUMN "public"."pisces_auth_resource_category"."sort" IS '排序';
COMMENT ON COLUMN "public"."pisces_auth_resource_category"."creator" IS '创建者';
COMMENT ON COLUMN "public"."pisces_auth_resource_category"."updater" IS '更新者';
COMMENT ON COLUMN "public"."pisces_auth_resource_category"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."pisces_auth_resource_category"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."pisces_auth_resource_category"."del" IS '逻辑删除：0->删除状态；1->可用状态';
COMMENT ON TABLE "public"."pisces_auth_resource_category" IS '资源类别表';

-- ----------------------------
-- Records of pisces_auth_resource_category
-- ----------------------------
INSERT INTO "public"."pisces_auth_resource_category" VALUES (1, '用户管理', '用户管理', 1, 'admin', 'admin', '2022-03-04 21:25:53', '2022-03-04 21:25:51', '1');
INSERT INTO "public"."pisces_auth_resource_category" VALUES (2, '角色管理', '角色管理', 2, 'admin', 'admin', '2022-03-20 19:28:04', '2022-03-20 19:28:06', '1');
INSERT INTO "public"."pisces_auth_resource_category" VALUES (3, '菜单管理', '菜单管理', 3, 'admin', 'admin', '2022-03-24 14:54:21', '2022-03-24 14:54:23', '1');
INSERT INTO "public"."pisces_auth_resource_category" VALUES (4, '资源类别管理', '资源类别管理', 4, 'admin', 'admin', '2022-03-24 14:54:44', '2022-03-24 14:54:46', '1');
INSERT INTO "public"."pisces_auth_resource_category" VALUES (5, '资源管理', '资源管理', 5, 'admin', 'admin', '2022-03-24 14:55:02', '2022-03-24 14:55:04', '1');
INSERT INTO "public"."pisces_auth_resource_category" VALUES (6, '部门管理', '部门管理', 6, 'admin', 'admin', '2022-03-24 14:55:19', '2022-03-24 14:55:22', '1');

-- ----------------------------
-- Table structure for pisces_auth_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_role";
CREATE TABLE "public"."pisces_auth_role" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_role_id_seq'::regclass),
  "role_name" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "role_code" varchar(64) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "description" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sort" int4 DEFAULT 0,
  "creator" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "updater" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "del" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 1
)
;
COMMENT ON COLUMN "public"."pisces_auth_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."pisces_auth_role"."role_code" IS '角色编码';
COMMENT ON COLUMN "public"."pisces_auth_role"."description" IS '描述';
COMMENT ON COLUMN "public"."pisces_auth_role"."sort" IS '排序';
COMMENT ON COLUMN "public"."pisces_auth_role"."creator" IS '创建者';
COMMENT ON COLUMN "public"."pisces_auth_role"."updater" IS '更新者';
COMMENT ON COLUMN "public"."pisces_auth_role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."pisces_auth_role"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."pisces_auth_role"."status" IS '角色启用状态：0->禁用；1->启用';
COMMENT ON COLUMN "public"."pisces_auth_role"."del" IS '逻辑删除：0->删除状态；1->可用状态';
COMMENT ON TABLE "public"."pisces_auth_role" IS '角色表';

-- ----------------------------
-- Records of pisces_auth_role
-- ----------------------------
INSERT INTO "public"."pisces_auth_role" VALUES (1, '超级管理员', 'administrator', '超级管理员，拥有所有的权限', 0, 'administrator', 'administrator', '2022-02-04 08:28:07', '2022-02-04 08:28:07', '1', '1');
INSERT INTO "public"."pisces_auth_role" VALUES (2, '测试员', 'test', '测试专用角色', 1, 'admin', 'admin', '2022-03-04 23:32:26', '2022-03-04 23:32:27', '1', '1');

-- ----------------------------
-- Table structure for pisces_auth_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_role_menu";
CREATE TABLE "public"."pisces_auth_role_menu" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_role_menu_id_seq'::regclass),
  "role_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."pisces_auth_role_menu"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."pisces_auth_role_menu"."menu_id" IS '菜单ID';
COMMENT ON TABLE "public"."pisces_auth_role_menu" IS '角色菜单关系表';

-- ----------------------------
-- Records of pisces_auth_role_menu
-- ----------------------------
INSERT INTO "public"."pisces_auth_role_menu" VALUES (1, 1, 1);
INSERT INTO "public"."pisces_auth_role_menu" VALUES (2, 1, 2);
INSERT INTO "public"."pisces_auth_role_menu" VALUES (3, 1, 3);
INSERT INTO "public"."pisces_auth_role_menu" VALUES (4, 1, 4);
INSERT INTO "public"."pisces_auth_role_menu" VALUES (5, 1, 5);
INSERT INTO "public"."pisces_auth_role_menu" VALUES (6, 1, 6);
INSERT INTO "public"."pisces_auth_role_menu" VALUES (7, 1, 7);
INSERT INTO "public"."pisces_auth_role_menu" VALUES (8, 1, 8);
INSERT INTO "public"."pisces_auth_role_menu" VALUES (9, 1, 9);

-- ----------------------------
-- Table structure for pisces_auth_role_resource
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_role_resource";
CREATE TABLE "public"."pisces_auth_role_resource" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_role_resource_id_seq'::regclass),
  "role_id" int8 NOT NULL,
  "resource_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."pisces_auth_role_resource"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."pisces_auth_role_resource"."resource_id" IS '资源ID';
COMMENT ON TABLE "public"."pisces_auth_role_resource" IS '角色资源关系表';

-- ----------------------------
-- Records of pisces_auth_role_resource
-- ----------------------------
INSERT INTO "public"."pisces_auth_role_resource" VALUES (1, 1, 1);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (2, 2, 1);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (3, 1, 2);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (4, 1, 3);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (5, 1, 4);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (6, 1, 5);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (7, 1, 6);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (8, 1, 7);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (9, 1, 9);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (10, 1, 10);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (11, 1, 11);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (12, 1, 12);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (13, 1, 14);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (14, 1, 15);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (15, 1, 16);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (16, 1, 17);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (17, 1, 18);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (18, 1, 19);
INSERT INTO "public"."pisces_auth_role_resource" VALUES (19, 1, 20);

-- ----------------------------
-- Table structure for pisces_auth_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_user";
CREATE TABLE "public"."pisces_auth_user" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_user_id_seq'::regclass),
  "username" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "avatar" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "email" varchar(45) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "name" varchar(20) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "real_name" varchar(10) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "telephone" varchar(45) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "birthday" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "sex" int2,
  "remark" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "creator" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "updater" varchar(32) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "create_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "status" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 0,
  "del" char(1) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 1
)
;
COMMENT ON COLUMN "public"."pisces_auth_user"."username" IS '账号(用户名)';
COMMENT ON COLUMN "public"."pisces_auth_user"."password" IS '密码';
COMMENT ON COLUMN "public"."pisces_auth_user"."avatar" IS '头像(地址)';
COMMENT ON COLUMN "public"."pisces_auth_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."pisces_auth_user"."name" IS '昵称';
COMMENT ON COLUMN "public"."pisces_auth_user"."real_name" IS '真实姓名';
COMMENT ON COLUMN "public"."pisces_auth_user"."telephone" IS '手机';
COMMENT ON COLUMN "public"."pisces_auth_user"."birthday" IS '生日';
COMMENT ON COLUMN "public"."pisces_auth_user"."sex" IS '性别';
COMMENT ON COLUMN "public"."pisces_auth_user"."remark" IS '备注';
COMMENT ON COLUMN "public"."pisces_auth_user"."creator" IS '创建者';
COMMENT ON COLUMN "public"."pisces_auth_user"."updater" IS '更新者';
COMMENT ON COLUMN "public"."pisces_auth_user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."pisces_auth_user"."update_time" IS '更新时间';
COMMENT ON COLUMN "public"."pisces_auth_user"."status" IS '帐号启用状态：0->禁用；1->启用';
COMMENT ON COLUMN "public"."pisces_auth_user"."del" IS '逻辑删除：0->删除状态；1->可用状态';
COMMENT ON TABLE "public"."pisces_auth_user" IS '用户表';

-- ----------------------------
-- Records of pisces_auth_user
-- ----------------------------
INSERT INTO "public"."pisces_auth_user" VALUES (1, 'admin', '{bcrypt}$2a$10$yftPnyoJe7a/psadq55CyO6dcw9VBjntigB.lXoM9hfPg6xLiawRK', 'https://besscroft.com/uploads/avatar.png', 'admin@qq.com', '管理员', '管你员', '12345678901', '2022-02-04 08:30:06', 1, '这个是管理员账号', 'administrator', 'administrator', '2022-02-04 08:30:06', '2022-02-04 08:30:06', '1', '1');
INSERT INTO "public"."pisces_auth_user" VALUES (2, 'test', '{bcrypt}$2a$10$yftPnyoJe7a/psadq55CyO6dcw9VBjntigB.lXoM9hfPg6xLiawRK', 'https://besscroft.com/uploads/avatar.png', 'test@qq.com', '测试员', '测试员', '12335584848', '2022-03-19 19:17:47', 0, '这个是测试员账号', 'administrator', 'administrator', '2022-03-19 19:17:47', '2022-03-19 19:17:47', '1', '1');
INSERT INTO "public"."pisces_auth_user" VALUES (6, 'test3', '{bcrypt}$2a$10$yftPnyoJe7a/psadq55CyO6dcw9VBjntigB.lXoM9hfPg6xLiawRK', 'https://besscroft.com/uploads/avatar.png', 'test3@qq.com', '瞅你咋地', '测试员', '12414', '2022-03-19 19:20:01', 1, '这个是测试员账号', 'administrator', 'administrator', '2022-03-19 19:20:01', '2022-03-19 19:20:01', '1', '0');
INSERT INTO "public"."pisces_auth_user" VALUES (10, 'unitTest', '{bcrypt}$2a$10$4LQZj6AUm9pVoTfXxg9sNeeTD2bljF57gyr9Jr4yISFyWANJDr9ma', '', 'unitTest@qq.com', 'unitTest', '单元测试', '0', '2022-03-22 13:42:44', 1, '这是一条单元测试新增的数据', NULL, NULL, '2022-03-22 13:42:45', '2022-03-22 13:42:45', '1', '1');
INSERT INTO "public"."pisces_auth_user" VALUES (5, 'test2', '{bcrypt}$2a$10$yftPnyoJe7a/psadq55CyO6dcw9VBjntigB.lXoM9hfPg6xLiawRK', 'https://besscroft.com/uploads/avatar.png', 'test2@qq.com', '你瞅啥', '测试员', '1231412', '2022-03-20 10:31:16', 1, '这个是测试员账号', 'administrator', 'admin', '2022-03-19 19:19:24', '2022-03-20 18:31:51', '1', '1');

-- ----------------------------
-- Table structure for pisces_auth_user_depart
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_user_depart";
CREATE TABLE "public"."pisces_auth_user_depart" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_user_depart_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "depart_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."pisces_auth_user_depart"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."pisces_auth_user_depart"."depart_id" IS '角色ID';
COMMENT ON TABLE "public"."pisces_auth_user_depart" IS '用户组织关系表';

-- ----------------------------
-- Records of pisces_auth_user_depart
-- ----------------------------

-- ----------------------------
-- Table structure for pisces_auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_auth_user_role";
CREATE TABLE "public"."pisces_auth_user_role" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_auth_user_role_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."pisces_auth_user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."pisces_auth_user_role"."role_id" IS '角色ID';
COMMENT ON TABLE "public"."pisces_auth_user_role" IS '用户角色关系表';

-- ----------------------------
-- Records of pisces_auth_user_role
-- ----------------------------
INSERT INTO "public"."pisces_auth_user_role" VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for pisces_sys_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."pisces_sys_log";
CREATE TABLE "public"."pisces_sys_log" (
  "id" int8 NOT NULL DEFAULT nextval('pisces_sys_log_id_seq'::regclass)
)
;
COMMENT ON TABLE "public"."pisces_sys_log" IS '系统日志表';

-- ----------------------------
-- Records of pisces_sys_log
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_depart_id_seq"
OWNED BY "public"."pisces_auth_depart"."id";
SELECT setval('"public"."pisces_auth_depart_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_menu_id_seq"
OWNED BY "public"."pisces_auth_menu"."id";
SELECT setval('"public"."pisces_auth_menu_id_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_resource_category_id_seq"
OWNED BY "public"."pisces_auth_resource_category"."id";
SELECT setval('"public"."pisces_auth_resource_category_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_resource_id_seq"
OWNED BY "public"."pisces_auth_resource"."id";
SELECT setval('"public"."pisces_auth_resource_id_seq"', 20, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_role_id_seq"
OWNED BY "public"."pisces_auth_role"."id";
SELECT setval('"public"."pisces_auth_role_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_role_menu_id_seq"
OWNED BY "public"."pisces_auth_role_menu"."id";
SELECT setval('"public"."pisces_auth_role_menu_id_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_role_resource_id_seq"
OWNED BY "public"."pisces_auth_role_resource"."id";
SELECT setval('"public"."pisces_auth_role_resource_id_seq"', 19, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_user_depart_id_seq"
OWNED BY "public"."pisces_auth_user_depart"."id";
SELECT setval('"public"."pisces_auth_user_depart_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_user_id_seq"
OWNED BY "public"."pisces_auth_user"."id";
SELECT setval('"public"."pisces_auth_user_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_auth_user_role_id_seq"
OWNED BY "public"."pisces_auth_user_role"."id";
SELECT setval('"public"."pisces_auth_user_role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."pisces_sys_log_id_seq"
OWNED BY "public"."pisces_sys_log"."id";
SELECT setval('"public"."pisces_sys_log_id_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table pisces_auth_depart
-- ----------------------------
ALTER TABLE "public"."pisces_auth_depart" ADD CONSTRAINT "pisces_auth_depart_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table pisces_auth_menu
-- ----------------------------
ALTER TABLE "public"."pisces_auth_menu" ADD CONSTRAINT "pisces_auth_menu_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table pisces_auth_resource
-- ----------------------------
ALTER TABLE "public"."pisces_auth_resource" ADD CONSTRAINT "pisces_auth_resource_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table pisces_auth_resource_category
-- ----------------------------
ALTER TABLE "public"."pisces_auth_resource_category" ADD CONSTRAINT "pisces_auth_resource_category_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table pisces_auth_role
-- ----------------------------
CREATE UNIQUE INDEX "idx_pisces_auth_role_role_code" ON "public"."pisces_auth_role" USING btree (
  "role_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table pisces_auth_role
-- ----------------------------
ALTER TABLE "public"."pisces_auth_role" ADD CONSTRAINT "pisces_auth_role_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table pisces_auth_role_menu
-- ----------------------------
CREATE INDEX "idx_pisces_role_menu_role_id" ON "public"."pisces_auth_role_menu" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table pisces_auth_role_menu
-- ----------------------------
ALTER TABLE "public"."pisces_auth_role_menu" ADD CONSTRAINT "pisces_auth_role_menu_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table pisces_auth_role_resource
-- ----------------------------
CREATE INDEX "idx_pisces_role_resource_role_id" ON "public"."pisces_auth_role_resource" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table pisces_auth_role_resource
-- ----------------------------
ALTER TABLE "public"."pisces_auth_role_resource" ADD CONSTRAINT "pisces_auth_role_resource_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table pisces_auth_user
-- ----------------------------
ALTER TABLE "public"."pisces_auth_user" ADD CONSTRAINT "pisces_auth_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table pisces_auth_user_depart
-- ----------------------------
CREATE INDEX "idx_pisces_user_depart_user_id" ON "public"."pisces_auth_user_depart" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table pisces_auth_user_depart
-- ----------------------------
ALTER TABLE "public"."pisces_auth_user_depart" ADD CONSTRAINT "pisces_auth_user_depart_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table pisces_auth_user_role
-- ----------------------------
CREATE INDEX "idx_pisces_user_role_user_id" ON "public"."pisces_auth_user_role" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table pisces_auth_user_role
-- ----------------------------
ALTER TABLE "public"."pisces_auth_user_role" ADD CONSTRAINT "uk_5twrats0hiitclgo8c5q1vr36" UNIQUE ("role_id");

-- ----------------------------
-- Primary Key structure for table pisces_auth_user_role
-- ----------------------------
ALTER TABLE "public"."pisces_auth_user_role" ADD CONSTRAINT "pisces_auth_user_role_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table pisces_sys_log
-- ----------------------------
ALTER TABLE "public"."pisces_sys_log" ADD CONSTRAINT "pisces_sys_log_pk" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table pisces_auth_user_role
-- ----------------------------
ALTER TABLE "public"."pisces_auth_user_role" ADD CONSTRAINT "fk6ldiflg8iir7uea03rtb5y6wi" FOREIGN KEY ("role_id") REFERENCES "public"."pisces_auth_role" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."pisces_auth_user_role" ADD CONSTRAINT "fkprhur9m2ojxoktbt7htka6hwp" FOREIGN KEY ("user_id") REFERENCES "public"."pisces_auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
