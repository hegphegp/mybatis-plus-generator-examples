/*
 * Copyright (c) 2011-2020, baomidou (jobob@qq.com).
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * <p>
 * https://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package com.codingfly.generator.postgres.common.origin;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.codingfly.generator.postgres.common.MyPostgreSqlQuery;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * OriginPostgreSQLGenerator
 *
 * @author nieqiurong
 * @since 2016/12/25
 */
public class OriginPostgreSQLGenerator {

    public static void main(String[] args) {
        AutoGenerator mpg = new AutoGenerator();

        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir("/home/hgp/aa/bb/postgres");
        gc.setFileOverride(true);
        gc.setActiveRecord(true);// 开启 activeRecord 模式
        gc.setEnableCache(false);// XML 二级缓存
        gc.setBaseResultMap(true);// XML ResultMap
        gc.setBaseColumnList(false);// XML columList
        //gc.setKotlin(true); // 是否生成 kotlin 代码
        gc.setSwagger2(true); // 是否生成 Swagger2 注解
        gc.setAuthor("hubin");
        gc.setDateType(DateType.ONLY_DATE);
//        gc.setIdType(IdType.AUTO); // 要自定义ID的生成策略，否则代码生成器不会生成

        // 自定义文件命名，注意 %s 会自动填充表实体属性！
        // gc.setEntityName("%sEntity");
        // gc.setMapperName("%sDao");
        // gc.setXmlName("%sDao");
        // gc.setServiceName("MP%sService");
        // gc.setServiceImplName("%sServiceDiy");
        // gc.setControllerName("%sAction");
        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setSchemaName("public");// 指定 SCHEMA
        dsc.setDbType(DbType.POSTGRE_SQL);
        // 自定义数据库信息查询
        dsc.setDbQuery(new MyPostgreSqlQuery());
        dsc.setDriverName("org.postgresql.Driver");
        dsc.setUsername("sde");
        dsc.setPassword("postgres");
        dsc.setUrl("jdbc:postgresql://localhost:5432/postgres");
        mpg.setDataSource(dsc);



        // 策略配置
        StrategyConfig strategy = new StrategyConfig();

        // strategy.setCapitalMode(true);// 全局大写命名
        // strategy.setDbColumnUnderline(true);// 全局下划线命名
        strategy.setTablePrefix("bmd_", "mp_");// 表前缀
        strategy.setFieldPrefix("A_");
        strategy.setEntityTableFieldAnnotationEnable(true); // 字段是否生成映射注解，实体类是否生成 @TableName("") 注解
        strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);// 允许字段策略独立设置，默认为 naming 策略
//        strategy.setInclude("*"); // 需要生成的表，支持正则表达式
        // strategy.setExclude("test"); // 排除生成的表，支持正则表达式
        // 自定义实体父类
        // strategy.setSuperEntityClass("com.baomidou.demo.TestEntity");
        // 自定义实体，公共字段
        // strategy.setSuperEntityColumns(new String[] { "test_id", "age" });
        // 自定义 mapper 父类
        // strategy.setSuperMapperClass("com.baomidou.demo.TestMapper");
        // 自定义 service 父类
        // strategy.setSuperServiceClass("com.baomidou.demo.TestService");
        // 自定义 service 实现类父类
        // strategy.setSuperServiceImplClass("com.baomidou.demo.TestServiceImpl");
        // 自定义 controller 父类
        // strategy.setSuperControllerClass("com.baomidou.demo.TestController");
        // 【实体】是否生成字段常量（默认 false）
        // public static final String ID = "test_id";
        // strategy.setEntityColumnConstant(true);
        // 【实体】是否为构建者模型（默认 false）
        // public User setName(String name) {this.name = name; return this;}
        // strategy.setEntityBuliderModel(true);
        mpg.setStrategy(strategy);

        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setModuleName("test");
        pc.setParent("com.baomidou");// 自定义包路径
        pc.setController("controller");// 这里是控制器包名，默认 web
//        Map pathInfo = new HashMap();
//        pathInfo.put(ConstVal.XML_PATH, "/home/hgp/aa/hgphgphgp/");
//        pc.setPathInfo(pathInfo);
//        mpg.setPackageInfo(pc);

        // 注入自定义配置，可以在 VM 中使用 cfg.abc 设置的值
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap();
//                map.put("dbType", DbType.POSTGRE_SQL.getDb());
                map.put("schema", "public");
                map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                this.setMap(map);
            }
        };
        List<FileOutConfig> focList = new ArrayList();
        focList.add(new FileOutConfig("/templates/mapper.xml.ftl") {
            @Override
            public String outputFile(TableInfo tableInfo) {
                // 自定义输入文件名称
                return "/home/hgp/aa/hgphgphgp/" + tableInfo.getEntityName() + StringPool.DOT_XML;
            }
        });
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);

        // 自定义模板配置，模板可以参考源码 /mybatis-plus/src/main/resources/template 使用 copy
        // 至您项目 src/main/resources/template 目录下，模板名称也可自定义如下配置：
        TemplateConfig tc = new TemplateConfig();
        tc.setXml(null); // 这个标注了表示不使用xml模板，这样子就不会在 mapper.java 接口的文件夹下生成xml文件夹，也不会生成xml配置文件，但是如果配置了List<FileOutConfig> focList，会在指定的路径生成xml文件
        mpg.setTemplate(tc);
        // tc.setController("...");
        // tc.setEntity("...");
        // tc.setMapper("...");
        // tc.setXml("...");
        // tc.setService("...");
        // tc.setServiceImpl("...");
        // mpg.setTemplate(tc);

        // 执行生成
        mpg.setTemplateEngine(new FreemarkerTemplateEngine());
        mpg.execute();
        // 打印注入设置
        System.err.println(mpg.getCfg().getMap().get("abc"));
    }

}
