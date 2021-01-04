package ${package.Controller};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
<#if swagger2>
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
</#if>
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.util.Assert;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};

import java.util.Set;

/**
 * <p>
 * ${table.comment!}
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if swagger2>
@Api(tags = "${entity}对象", description = "${table.comment!}")
</#if>
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

    @Autowired
    private ${table.serviceName} ${table.serviceName?uncap_first};

    /** 新增 */
    <#if swagger2>
    @ApiOperation(value = "新增数据")
    </#if>
    @PostMapping(value = "/add")
    public void add(@RequestBody ${entity} entity) {
        ${table.serviceName?uncap_first}.save(entity);
    }

    /** 编辑 */
    <#if swagger2>
    @ApiOperation(value = "编辑数据")
    @ApiImplicitParam(paramType="path", name = "id", value = "id", required = true)
    </#if>
    @PutMapping(value = "/{id}")
    public void editById(@RequestBody ${entity} entity) {
        ${table.serviceName?uncap_first}.updateById(entity);
    }

    /** 查询 */
    <#if swagger2>
    @ApiOperation(value = "根据ID查询")
    @ApiImplicitParam(paramType="path", name = "id", value = "id", required = true)
    </#if>
    @GetMapping(value = "/{id}")
    public ${entity} getById(@PathVariable("id") String id) {
       ${entity} result = ${table.serviceName?uncap_first}.getById(id);
       return result;
    }

    /** 单个删除，批量删除 */
    <#if swagger2>
    @ApiOperation(value = "单个删除，批量删除，请求体是id数组")
    </#if>
    @DeleteMapping(value = "/batch-delete")
    public void delete(@RequestBody Set<String> ids) {
        Assert.isTrue(ObjectUtils.isNotEmpty(ids), "请勾选数据");
        boolean result = ${table.serviceName?uncap_first}.removeByIds(ids);
    }

    /** 分页查询 */
    <#if swagger2>
    @ApiOperation(value = "分页查询")
    @ApiImplicitParams({
        @ApiImplicitParam(paramType="query", name = "current", value = "页码（默认为1）", required = false),
        @ApiImplicitParam(paramType="query", name = "size", value = "每页记录数（默认为10）", required = false)
    })
    </#if>
    @GetMapping("/page")
    public IPage<${entity}> queryPage(@RequestParam(name = "current", defaultValue = "1") Long current,
                                      @RequestParam(name = "size", defaultValue = "10") Long size) {
        Page page = new Page<>(current, size);
        QueryWrapper queryWrapper = new QueryWrapper<>();
        /**
        queryWrapper.eq(true, "column1", "value1");
        queryWrapper.orderByAsc("createTime", "age");
        queryWrapper.orderByDesc("score");
         */
        return ${table.serviceName?uncap_first}.page(page, queryWrapper);
    }
}
