package com.codingfly.generator.postgres;

import com.baomidou.mybatisplus.annotation.IdType;
import com.codingfly.generator.common.FileGenerate;
import com.codingfly.generator.postgres.common.MyPostgreSqlQuery;
import com.codingfly.generator.postgres.common.PostgresqlGenerator;
import com.codingfly.generator.utils.SqlUtils;

import java.util.List;
import java.util.Map;

public class Localhost5432_bootshiro {
    public static String outputDir = "/home/hgp/aa/bb";
    public static String author = "author";
    public static String username = "sde";
    public static String password = "postgres";
    public static String url = "jdbc:postgresql://localhost:5432/bootshiro";
    public static Boolean swagger = false;
    public static Boolean enableCache = true;
    public static Boolean baseResultMap = true;
    public static Boolean baseColumnList = true;
    public static String packagePath = "com.codingfly";

    public static void main(String[] args) {
//        getTableInfo();
        generate20201222am();
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
            String strFormat = "generate(\"%s\", \"%s\", \"%s\", IdType.ASSIGN_UUID, \"module\", packagePath, FileGenerate.ALL, true);";
            System.out.println(String.format(strFormat, schema, tableName, entityBaseName));
        }
        System.out.println("\n\n\n\n\n");
    }

    /**
     * 2020-12-22 00:00:00
     */
    public static void generate20201222am() {
        generate("public", "api_example", "ApiExample", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "api_info", "ApiInfo", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "api_info_history", "ApiInfoHistory", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "schedule_job", "ScheduleJob", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "schedule_job_log", "ScheduleJobLog", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.C0S0X0, true);
        generate("public", "sys_config", "SysConfig", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_dept", "SysDept", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_dict", "SysDict", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_log", "SysLog", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_menu", "SysMenu", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_oss", "SysOss", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_role", "SysRole", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_role_dept", "SysRoleDept", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_role_menu", "SysRoleMenu", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_user", "SysUser", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_user_role", "SysUserRole", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);

    }

    public static void generate(String schema, String tableName, String entityBaseName, IdType idType, String module, String packagePath, FileGenerate fileGenerate,
                                Boolean activeRecord) {
        PostgresqlGenerator.generatorCode(url, username, password, author, outputDir, schema, tableName, entityBaseName, idType, module, packagePath, fileGenerate,
                activeRecord, swagger, enableCache, baseResultMap, baseColumnList);
    }
}
