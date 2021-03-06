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
package com.codingfly.generator.postgres.common;

import com.baomidou.mybatisplus.generator.config.querys.PostgreSqlQuery;

public class MyPostgreSqlQuery extends PostgreSqlQuery {

    @Override
    public String tableFieldsSql() {
        return "SELECT A.attname AS name,format_type (A.atttypid,A.atttypmod) AS type,col_description (A.attrelid,A.attnum) AS comment,\n" +
            "(CASE WHEN (SELECT COUNT (*) FROM pg_constraint AS PC WHERE A.attnum = PC.conkey[1] AND PC.contype = 'p') > 0 THEN 'PRI' ELSE '' END) AS key \n" +
            "FROM pg_class AS C,pg_attribute AS A WHERE A.attrelid='%s'::regclass AND A.attrelid= C.oid AND A.attnum> 0 AND NOT A.attisdropped ORDER  BY A.attnum";
    }

    public static String querySchemaTableSql() {
        return "SELECT table_schema, table_name, table_type FROM information_schema.tables WHERE table_schema!='pg_catalog' AND table_schema!='information_schema' ORDER BY table_schema ASC, table_name ASC";
    }

}
