package com.codingfly.generator.mysql;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.config.querys.MySqlQuery;
import com.codingfly.generator.common.FileGenerate;
import com.codingfly.generator.mysql.common.MysqlGenerator;
import com.codingfly.generator.postgres.common.MyPostgreSqlQuery;
import com.codingfly.generator.postgres.common.PostgresqlGenerator;
import com.codingfly.generator.utils.SqlUtils;
import com.mysql.cj.jdbc.Driver;

import java.util.List;
import java.util.Map;

public class Localhost3306_bootshiro {
    public static String outputDir = "/home/hgp/workspace/idea/ant-design-vue-pro-api/src/main";
    public static String author = "author";
    public static String username = "root";
    public static String password = "root";
    public static String url = "jdbc:mysql://localhost:3306/bootshiro?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    public static Boolean swagger = true;
    public static Boolean enableCache = false;
    public static Boolean baseResultMap = false;
    public static Boolean baseColumnList = false;
    public static Boolean lombok = true;
    public static String packagePath = "com.codingfly";
    public static String driver = Driver.class.getName();

    public static void main(String[] args) {
//        getTableInfo();
        generate20210105113100am();
    }

    /**
     * 生成generate的方法
     */
    public static void getTableInfo() {
        List<String> tableNames = MysqlGenerator.queryAllTableNames(username, password, driver, url);
        System.out.println("\n\n\n\n\n");
        for (String tableName:tableNames) {
            String entityBaseName = SqlUtils.tableNameToHump(tableName);
            String strFormat = "generate(\"%s\", \"%s\", IdType.ASSIGN_UUID, \"module\", packagePath, FileGenerate.ALL, true);";
            System.out.println(String.format(strFormat, tableName, entityBaseName));
        }
        System.out.println("\n\n\n\n\n");
    }

    /**
     * 2020-12-22 00:00:00
     */
    public static void generate20210105113100am() {
        generate("auth_account_log", "AuthAccountLog", IdType.AUTO, "module", packagePath, FileGenerate.ALL, true);
        generate("auth_operation_log", "AuthOperationLog", IdType.AUTO, "module", packagePath, FileGenerate.ALL, true);
        generate("auth_resource", "AuthResource", IdType.AUTO, "module", packagePath, FileGenerate.ALL, true);
        generate("auth_role", "AuthRole", IdType.AUTO, "module", packagePath, FileGenerate.ALL, true);
        generate("auth_role_resource", "AuthRoleResource", IdType.AUTO, "module", packagePath, FileGenerate.ALL, true);
        generate("auth_user", "AuthUser", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("auth_user_role", "AuthUserRole", IdType.AUTO, "module", packagePath, FileGenerate.ALL, true);
    }

    public static void generate(String tableName, String entityBaseName, IdType idType, String module, String packagePath, FileGenerate fileGenerate,
                                Boolean activeRecord) {
        MysqlGenerator.generatorCode(url, username, password, author, outputDir, tableName, entityBaseName, idType, module, packagePath, fileGenerate,
                activeRecord, swagger, enableCache, baseResultMap, baseColumnList, lombok);
    }
}
