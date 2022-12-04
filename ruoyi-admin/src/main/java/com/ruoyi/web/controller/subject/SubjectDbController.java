package com.ruoyi.web.controller.subject;

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
import com.ruoyi.subject.domain.SubjectDb;
import com.ruoyi.subject.service.ISubjectDbService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学科Controller
 *
 * @author 邓周明
 * @date 2022-11-16
 */
@RestController
@RequestMapping("/subject/subject")
public class SubjectDbController extends BaseController
{
    @Autowired
    private ISubjectDbService subjectDbService;

    /**
     * 查询学科列表
     */
    @PreAuthorize("@ss.hasPermi('subject:subject:list')")
    @GetMapping("/list")
    public TableDataInfo list(SubjectDb subjectDb)
    {
        startPage();
        List<SubjectDb> list = subjectDbService.selectSubjectDbList(subjectDb);
        return getDataTable(list);
    }

    /**
     * 导出学科列表
     */
    @PreAuthorize("@ss.hasPermi('subject:subject:export')")
    @Log(title = "学科", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SubjectDb subjectDb)
    {
        List<SubjectDb> list = subjectDbService.selectSubjectDbList(subjectDb);
        ExcelUtil<SubjectDb> util = new ExcelUtil<SubjectDb>(SubjectDb.class);
        util.exportExcel(response, list, "学科数据");
    }

    /**
     * 获取学科详细信息
     */
    @PreAuthorize("@ss.hasPermi('subject:subject:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(subjectDbService.selectSubjectDbById(id));
    }

    /**
     * 新增学科
     */
    @PreAuthorize("@ss.hasPermi('subject:subject:add')")
    @Log(title = "学科", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SubjectDb subjectDb)
    {
        return toAjax(subjectDbService.insertSubjectDb(subjectDb));
    }

    /**
     * 修改学科
     */
    @PreAuthorize("@ss.hasPermi('subject:subject:edit')")
    @Log(title = "学科", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SubjectDb subjectDb)
    {
        return toAjax(subjectDbService.updateSubjectDb(subjectDb));
    }

    /**
     * 删除学科
     */
    @PreAuthorize("@ss.hasPermi('subject:subject:remove')")
    @Log(title = "学科", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(subjectDbService.deleteSubjectDbByIds(ids));
    }
}
