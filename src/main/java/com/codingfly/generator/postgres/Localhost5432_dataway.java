package com.codingfly.generator.postgres;

import com.baomidou.mybatisplus.annotation.IdType;
import com.codingfly.generator.common.FileGenerate;
import com.codingfly.generator.postgres.common.MyPostgreSqlQuery;
import com.codingfly.generator.postgres.common.PostgresqlGenerator;
import com.codingfly.generator.utils.SqlUtils;

import java.util.List;
import java.util.Map;

public class Localhost5432_dataway {
    public static String outputDir = "/home/hgp/aa/bb";
    public static String author = "author";
    public static String username = "sde";
    public static String password = "postgres";
    public static String url = "jdbc:postgresql://localhost:5432/postgres";
    public static Boolean swagger = false;
    public static Boolean enableCache = true;
    public static Boolean baseResultMap = true;
    public static Boolean baseColumnList = true;
    public static String packagePath = "com.codingfly";

    public static void main(String[] args) {
//        getTableInfo();
        generate2020090am();
    }

    /**
     * 生成generate的方法
     */
    public static void getTableInfo() {
        List<Map<String, Object>> list = SqlUtils.query(username, password, "org.postgresql.Driver", url, MyPostgreSqlQuery.querySchemaTableSql());
        System.out.println("\n\n\n\n\n");
        for (Map<String, Object> map:list) {
            String schema = map.get("table_schema").toString();
            String tableName = map.get("table_name").toString();
            String entityBaseName = SqlUtils.tableNameToHump(tableName);
            String strFormat = "generate(\"%s\", \"%s\", packagePath, IdType.ASSIGN_UUID, \"module\", \"%s\", FileGenerate.ALL, true);";
            System.out.println(String.format(strFormat, schema, tableName, entityBaseName, packagePath));
        }
        System.out.println("\n\n\n\n\n");
    }

    /**
     * 2020-09-01 11:11:11
     */
    public static void generate2020090am() {
        generate("public", "sys_app", "SysApp", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_area_code", "SysAreaCode", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_classification", "SysClassification", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_config_param", "SysConfigParam", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_duty", "SysDuty", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_duty_type", "SysDutyType", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.C0S1X1, true);
        generate("public", "sys_group", "SysGroup", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_navigation", "SysNavigation", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_notice", "SysNotice", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_notice_category", "SysNoticeCategory", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_notice_read", "SysNoticeRead", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_portal_configure", "SysPortalConfigure", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_resource", "SysResource", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_role", "SysRole", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_third_app", "SysThirdApp", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_user", "SysUser", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_user_third_bind", "SysUserThirdBind", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.C0S1X1, true);
        generate("public", "sys_work_day", "SysWorkDay", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);

        // 多对多关系实体类，不生成Controller，Service，mapper.xml
        generate("public", "sys_group_role_rel", "SysGroupRoleRel", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.NONE, true);
        generate("public", "sys_role_app_rel", "SysRoleAppRel", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.NONE, true);
        generate("public", "sys_role_resource_rel", "SysRoleResourceRel", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.NONE, true);
        generate("public", "sys_user_app_rel", "SysUserAppRel", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.NONE, true);
        generate("public", "sys_user_group_rel", "SysUserGroupRel", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.NONE, true);
        generate("public", "sys_user_role_rel", "SysUserRoleRel", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.NONE, true);

    }

    public static void generate(String schema, String tableName, String entityBaseName, IdType idType, String module, String packagePath, FileGenerate fileGenerate,
                                Boolean activeRecord) {
        PostgresqlGenerator.generatorCode(url, username, password, author, outputDir, schema, tableName, entityBaseName, idType, module, packagePath, fileGenerate,
                activeRecord, swagger, enableCache, baseResultMap, baseColumnList);
    }
}
