package com.ruoyi.web.controller.people;

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
import com.ruoyi.people.domain.Parent;
import com.ruoyi.people.service.IParentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * ParentController
 * 
 * @author 邓周明
 * @date 2022-12-04
 */
@RestController
@RequestMapping("/people/parent")
public class ParentController extends BaseController
{
    @Autowired
    private IParentService parentService;

    /**
     * 查询Parent列表
     */
    @PreAuthorize("@ss.hasPermi('people:parent:list')")
    @GetMapping("/list")
    public TableDataInfo list(Parent parent)
    {
        startPage();
        List<Parent> list = parentService.selectParentList(parent);
        return getDataTable(list);
    }

    /**
     * 导出Parent列表
     */
    @PreAuthorize("@ss.hasPermi('people:parent:export')")
    @Log(title = "Parent", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Parent parent)
    {
        List<Parent> list = parentService.selectParentList(parent);
        ExcelUtil<Parent> util = new ExcelUtil<Parent>(Parent.class);
        util.exportExcel(response, list, "Parent数据");
    }

    /**
     * 获取Parent详细信息
     */
    @PreAuthorize("@ss.hasPermi('people:parent:query')")
    @GetMapping(value = "/{pId}")
    public AjaxResult getInfo(@PathVariable("pId") Long pId)
    {
        return success(parentService.selectParentByPId(pId));
    }

    /**
     * 新增Parent
     */
    @PreAuthorize("@ss.hasPermi('people:parent:add')")
    @Log(title = "Parent", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Parent parent)
    {
        return toAjax(parentService.insertParent(parent));
    }

    /**
     * 修改Parent
     */
    @PreAuthorize("@ss.hasPermi('people:parent:edit')")
    @Log(title = "Parent", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Parent parent)
    {
        return toAjax(parentService.updateParent(parent));
    }

    /**
     * 删除Parent
     */
    @PreAuthorize("@ss.hasPermi('people:parent:remove')")
    @Log(title = "Parent", businessType = BusinessType.DELETE)
	@DeleteMapping("/{pIds}")
    public AjaxResult remove(@PathVariable Long[] pIds)
    {
        return toAjax(parentService.deleteParentByPIds(pIds));
    }
}
