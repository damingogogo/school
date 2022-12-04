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
import com.ruoyi.subject.domain.StudentGrade;
import com.ruoyi.subject.service.IStudentGradeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * syudent_gradeController
 *
 * @author 邓周明
 * @date 2022-11-19
 */
@RestController
@RequestMapping("/system/grade")
public class StudentGradeController extends BaseController
{
    @Autowired
    private IStudentGradeService studentGradeService;

    /**
     * 查询syudent_grade列表
     */
    @PreAuthorize("@ss.hasPermi('system:grade:list')")
    @GetMapping("/list")
    public TableDataInfo list(StudentGrade studentGrade)
    {
        startPage();
        List<StudentGrade> list = studentGradeService.selectStudentGradeList(studentGrade);
        return getDataTable(list);
    }

    /**
     * 导出syudent_grade列表
     */
    @PreAuthorize("@ss.hasPermi('system:grade:export')")
    @Log(title = "syudent_grade", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StudentGrade studentGrade)
    {
        List<StudentGrade> list = studentGradeService.selectStudentGradeList(studentGrade);
        ExcelUtil<StudentGrade> util = new ExcelUtil<StudentGrade>(StudentGrade.class);
        util.exportExcel(response, list, "syudent_grade数据");
    }

    /**
     * 获取syudent_grade详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:grade:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(studentGradeService.selectStudentGradeById(id));
    }

    /**
     * 新增syudent_grade
     */
    @PreAuthorize("@ss.hasPermi('system:grade:add')")
    @Log(title = "syudent_grade", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StudentGrade studentGrade)
    {
        return toAjax(studentGradeService.insertStudentGrade(studentGrade));
    }

    /**
     * 修改syudent_grade
     */
    @PreAuthorize("@ss.hasPermi('system:grade:edit')")
    @Log(title = "syudent_grade", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StudentGrade studentGrade)
    {
        return toAjax(studentGradeService.updateStudentGrade(studentGrade));
    }

    /**
     * 删除syudent_grade
     */
    @PreAuthorize("@ss.hasPermi('system:grade:remove')")
    @Log(title = "syudent_grade", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(studentGradeService.deleteStudentGradeByIds(ids));
    }
}
