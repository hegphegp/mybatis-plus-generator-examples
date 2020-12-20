package com.codingfly.generator.postgres;

import com.baomidou.mybatisplus.annotation.IdType;
import com.codingfly.generator.postgres.common.PostgresqlGenerator;

public class Localhost5432_dataway {
    public static String outputDir = "/home/hgp/workspace/springboot-layui/src/main";
    public static String author = "author";
//    public static String schema = "public";
    public static String username = "sde";
    public static String password = "postgres";
    public static String url = "jdbc:postgresql://localhost:5432/postgres";
    public static Boolean swagger = false;

    public static void main(String[] args) {

    }

    public static void generate(String schema, String tableName, IdType idType, String module, String packagePath, Boolean generateXml,
                                Boolean fileOrverride, Boolean activeRecord) {
        Boolean enableCache = true;
        Boolean baseResultMap = true;
        Boolean baseColumnList = true;
        PostgresqlGenerator.generatorCode(url, username, password, author, outputDir, schema, tableName, idType, module, packagePath, generateXml,
                fileOrverride, activeRecord, swagger, enableCache, baseResultMap, baseColumnList);
    }
}
