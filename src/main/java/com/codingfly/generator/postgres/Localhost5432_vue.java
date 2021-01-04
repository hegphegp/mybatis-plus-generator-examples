package com.codingfly.generator.postgres;

import com.baomidou.mybatisplus.annotation.IdType;
import com.codingfly.generator.common.FileGenerate;
import com.codingfly.generator.postgres.common.MyPostgreSqlQuery;
import com.codingfly.generator.postgres.common.PostgresqlGenerator;
import com.codingfly.generator.utils.SqlUtils;

import java.util.List;
import java.util.Map;

// /home/hgp/workspace/idea/ant-design-vue-pro-api/src/main/java/com/codingfly
public class Localhost5432_vue {
    public static String outputDir = "/home/hgp/workspace/idea/ant-design-vue-pro-api/src/main";
    public static String author = "admin";
    public static String username = "sde";
    public static String password = "postgres";
    public static String url = "jdbc:postgresql://localhost:5432/vue";
    public static Boolean swagger = true;
    public static Boolean enableCache = false;
    public static Boolean baseResultMap = false;
    public static Boolean baseColumnList = false;
    public static Boolean lombok = true;
    public static String packagePath = "com";
    public static String driver = "org.postgresql.Driver";

    public static void main(String[] args) {
//        getTableInfo();
        generate20210104154200pm();
    }

    /**
     * 生成generate的方法
     */
    public static void getTableInfo() {
        List<Map<String, Object>> list = SqlUtils.query(username, password, driver, url, MyPostgreSqlQuery.querySchemaTableSql());
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
    public static void generate20210104154200pm() {
        generate("public", "sys_dict_item", "SysDictItem", IdType.ASSIGN_ID, "codingfly", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_dict_type", "SysDictType", IdType.ASSIGN_ID, "codingfly", packagePath, FileGenerate.ALL, true);
        generate("public", "sys_user", "SysUser", IdType.ASSIGN_ID, "codingfly", packagePath, FileGenerate.ALL, true);
    }

    public static void generate(String schema, String tableName, String entityBaseName, IdType idType, String module, String packagePath, FileGenerate fileGenerate,
                                Boolean activeRecord) {
        PostgresqlGenerator.generatorCode(url, username, password, author, outputDir, schema, tableName, entityBaseName, idType, module, packagePath, fileGenerate,
                activeRecord, swagger, enableCache, baseResultMap, baseColumnList, lombok);
    }
}
