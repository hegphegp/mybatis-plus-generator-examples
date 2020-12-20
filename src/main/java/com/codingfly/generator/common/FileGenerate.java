package com.codingfly.generator.common;

/**
 * 实体类Entity和Mapper.java肯定会生成
 * Controller, Service, mapper.xml不一定生成
 */
public enum FileGenerate {
    NONE("NONE"), // 不生成Controller, Service, mapper.xml
    C0S0X0("000"), // 不生成Controller, Service, mapper.xml
    C0S0X1("001"), // 不生成Controller, Service，              生成mapper.xml
    C0S1X0("010"), // 不生成Controller, mapper.xml，           生成Service
    C0S1X1("011"), // 不生成Controller,                        生成Service, mapper.xml
    C1S0X0("100"), // 不生成Service, mapper.xml，              生成Controller
    C1S0X1("101"), // 不生成Service，                          生成Controller, mapper.xml
    C1S1X0("110"), // 不生成mapper.xml，                       生成Controller, Service
    C1S1X1("111"), //                                         生成Controller, Service, mapper.xml
    ALL("ALL");    //                                         生成Controller, Service, mapper.xml
    private String key;

    FileGenerate(String key) {
        this.key = key;
    }

    public String getKey() {
        return this.key;
    }

    public boolean generateController() {
        return this==FileGenerate.C1S0X0 || this==FileGenerate.C1S0X1 || this==FileGenerate.C1S1X0 || this==FileGenerate.C1S1X1 || this==FileGenerate.ALL;
    }

    public boolean generateService() {
        return this==FileGenerate.C0S1X0 || this==FileGenerate.C0S1X1 || this==FileGenerate.C1S1X0 || this==FileGenerate.C1S1X1 || this==FileGenerate.ALL;
    }

    public boolean generateXml() {
        return this==FileGenerate.C0S0X1 || this==FileGenerate.C0S1X1 || this==FileGenerate.C1S0X1 || this==FileGenerate.C1S1X1 || this==FileGenerate.ALL;
    }
}
