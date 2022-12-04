package com.ruoyi.signup.controller;

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
import com.ruoyi.signup.domain.BaomingDb;
import com.ruoyi.signup.service.IBaomingDbService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 报名管理Controller
 *
 * @author 邓周明
 * @date 2022-11-24
 */
@RestController
@RequestMapping("/signup/signup")
public class BaomingDbController extends BaseController
{
    @Autowired
    private IBaomingDbService baomingDbService;

    /**
     * 查询报名管理列表
     */
    @PreAuthorize("@ss.hasPermi('signup:signup:list')")
    @GetMapping("/list")
    public TableDataInfo list(BaomingDb baomingDb)
    {
        startPage();
        List<BaomingDb> list = baomingDbService.selectBaomingDbList(baomingDb);
        return getDataTable(list);
    }

    /**
     * 导出报名管理列表
     */
    @PreAuthorize("@ss.hasPermi('signup:signup:export')")
    @Log(title = "报名管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BaomingDb baomingDb)
    {
        List<BaomingDb> list = baomingDbService.selectBaomingDbList(baomingDb);
        ExcelUtil<BaomingDb> util = new ExcelUtil<BaomingDb>(BaomingDb.class);
        util.exportExcel(response, list, "报名管理数据");
    }

    /**
     * 获取报名管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('signup:signup:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(baomingDbService.selectBaomingDbById(id));
    }

    /**
     * 新增报名管理
     */
    @PreAuthorize("@ss.hasPermi('signup:signup:add')")
    @Log(title = "报名管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BaomingDb baomingDb)
    {
        return toAjax(baomingDbService.insertBaomingDb(baomingDb));
    }

    /**
     * 修改报名管理
     */
    @PreAuthorize("@ss.hasPermi('signup:signup:edit')")
    @Log(title = "报名管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BaomingDb baomingDb)
    {
        return toAjax(baomingDbService.updateBaomingDb(baomingDb));
    }

    /**
     * 删除报名管理
     */
    @PreAuthorize("@ss.hasPermi('signup:signup:remove')")
    @Log(title = "报名管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(baomingDbService.deleteBaomingDbByIds(ids));
    }
}
