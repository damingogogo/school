package com.ruoyi.tianbiao.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.tianbiao.domain.FromDb;
import com.ruoyi.tianbiao.service.IFromDbService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 填表管理Controller
 *
 * @author 邓周明
 * @date 2022-11-24
 */
@RestController
@RequestMapping("/tianbiao/tianbiao")
public class FromDbController extends BaseController
{
    @Autowired
    private IFromDbService fromDbService;

    /**
     * 查询填表管理列表
     */
    @PreAuthorize("@ss.hasPermi('tianbiao:tianbiao:list')")
    @GetMapping("/list")
    public TableDataInfo list(FromDb fromDb)
    {
        startPage();
        List<FromDb> list = fromDbService.selectFromDbList(fromDb);
        return getDataTable(list);
    }

    /**
     * 导出填表管理列表
     */
    @PreAuthorize("@ss.hasPermi('tianbiao:tianbiao:export')")
    @Log(title = "填表管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FromDb fromDb)
    {
        List<FromDb> list = fromDbService.selectFromDbList(fromDb);
        ExcelUtil<FromDb> util = new ExcelUtil<FromDb>(FromDb.class);
        util.exportExcel(response, list, "填表管理数据");
    }

    /**
     * 获取填表管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('tianbiao:tianbiao:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(fromDbService.selectFromDbById(id));
    }

    /**
     * 新增填表管理
     */
    @PreAuthorize("@ss.hasPermi('tianbiao:tianbiao:add')")
    @Log(title = "填表管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FromDb fromDb)
    {
        return toAjax(fromDbService.insertFromDb(fromDb));
    }

    /**
     * 修改填表管理
     */
    @PreAuthorize("@ss.hasPermi('tianbiao:tianbiao:edit')")
    @Log(title = "填表管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FromDb fromDb)
    {
        return toAjax(fromDbService.updateFromDb(fromDb));
    }

    /**
     * 删除填表管理
     */
    @PreAuthorize("@ss.hasPermi('tianbiao:tianbiao:remove')")
    @Log(title = "填表管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(fromDbService.deleteFromDbByIds(ids));
    }
}
