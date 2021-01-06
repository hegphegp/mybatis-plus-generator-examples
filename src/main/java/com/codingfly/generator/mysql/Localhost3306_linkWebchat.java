package com.codingfly.generator.mysql;

import com.baomidou.mybatisplus.annotation.IdType;
import com.codingfly.generator.common.FileGenerate;
import com.codingfly.generator.mysql.common.MysqlGenerator;
import com.codingfly.generator.utils.SqlUtils;
import com.mysql.cj.jdbc.Driver;

import java.util.List;

public class Localhost3306_linkWebchat {
    public static String outputDir = "/home/hgp/workspace/idea/ant-design-vue-pro-api/src/main";
    public static String author = "author";
    public static String username = "root";
    public static String password = "root";
    public static String url = "jdbc:mysql://localhost:3306/link_wechat?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
    public static Boolean swagger = true;
    public static Boolean enableCache = false;
    public static Boolean baseResultMap = false;
    public static Boolean baseColumnList = false;
    public static Boolean lombok = true;
    public static String packagePath = "com.codingfly";
    public static String driver = Driver.class.getName();

    public static void main(String[] args) {
//        getTableInfo();
        generate20210122913100am();
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
    public static void generate20210122913100am() {
        generate("QRTZ_BLOB_TRIGGERS", "QrtzBlobTriggers", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_CALENDARS", "QrtzCalendars", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_CRON_TRIGGERS", "QrtzCronTriggers", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_FIRED_TRIGGERS", "QrtzFiredTriggers", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_JOB_DETAILS", "QrtzJobDetails", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_LOCKS", "QrtzLocks", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_PAUSED_TRIGGER_GRPS", "QrtzPausedTriggerGrps", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_SCHEDULER_STATE", "QrtzSchedulerState", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_SIMPLE_TRIGGERS", "QrtzSimpleTriggers", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_SIMPROP_TRIGGERS", "QrtzSimpropTriggers", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("QRTZ_TRIGGERS", "QrtzTriggers", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("gen_table", "GenTable", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("gen_table_column", "GenTableColumn", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_config", "SysConfig", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_dept", "SysDept", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_dict_data", "SysDictData", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_dict_type", "SysDictType", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_job", "SysJob", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_job_log", "SysJobLog", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_logininfor", "SysLogininfor", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_menu", "SysMenu", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_notice", "SysNotice", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_oper_log", "SysOperLog", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_post", "SysPost", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_role", "SysRole", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_role_dept", "SysRoleDept", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_role_menu", "SysRoleMenu", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_user", "SysUser", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_user_post", "SysUserPost", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("sys_user_role", "SysUserRole", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_allocate_customer", "WeAllocateCustomer", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_allocate_group", "WeAllocateGroup", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_category", "WeCategory", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_corp_account", "WeCorpAccount", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_customer", "WeCustomer", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_department", "WeDepartment", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_emple_code", "WeEmpleCode", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_emple_code_tag", "WeEmpleCodeTag", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_emple_code_use_scop", "WeEmpleCodeUseScop", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_flower_customer_rel", "WeFlowerCustomerRel", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_flower_customer_tag_rel", "WeFlowerCustomerTagRel", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_group", "WeGroup", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_group_code", "WeGroupCode", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_group_code_actual", "WeGroupCodeActual", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_group_member", "WeGroupMember", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_material", "WeMaterial", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_message_push", "WeMessagePush", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_msg_tlp", "WeMsgTlp", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_msg_tlp_scope", "WeMsgTlpScope", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_tag", "WeTag", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_tag_group", "WeTagGroup", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
        generate("we_user", "WeUser", IdType.ASSIGN_UUID, "module", packagePath, FileGenerate.ALL, true);
    }

    public static void generate(String tableName, String entityBaseName, IdType idType, String module, String packagePath, FileGenerate fileGenerate,
                                Boolean activeRecord) {
        MysqlGenerator.generatorCode(url, username, password, author, outputDir, tableName, entityBaseName, idType, module, packagePath, fileGenerate,
                activeRecord, swagger, enableCache, baseResultMap, baseColumnList, lombok);
    }
}
