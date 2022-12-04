package com.ruoyi.web.controller.people;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.people.domain.Teacher;
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
import com.ruoyi.people.service.ITeacherService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * TeacherController
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
@RestController
@RequestMapping("/people/teacher")
public class TeacherController extends BaseController
{
    @Autowired
    private ITeacherService teacherService;

    /**
     * 查询Teacher列表
     */
    @PreAuthorize("@ss.hasPermi('people:teacher:list')")
    @GetMapping("/list")
    public TableDataInfo list(Teacher teacher)
    {
        startPage();
        List<Teacher> list = teacherService.selectTeacherList(teacher);
        return getDataTable(list);
    }

    /**
     * 导出Teacher列表
     */
    @PreAuthorize("@ss.hasPermi('people:teacher:export')")
    @Log(title = "Teacher", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Teacher teacher)
    {
        List<Teacher> list = teacherService.selectTeacherList(teacher);
        ExcelUtil<Teacher> util = new ExcelUtil<Teacher>(Teacher.class);
        util.exportExcel(response, list, "Teacher数据");
    }

    /**
     * 获取Teacher详细信息
     */
    @PreAuthorize("@ss.hasPermi('people:teacher:query')")
    @GetMapping(value = "/{tId}")
    public AjaxResult getInfo(@PathVariable("tId") Long tId)
    {
        return success(teacherService.selectTeacherByTId(tId));
    }

    /**
     * 新增Teacher
     */
    @PreAuthorize("@ss.hasPermi('people:teacher:add')")
    @Log(title = "Teacher", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Teacher teacher)
    {
        return toAjax(teacherService.insertTeacher(teacher));
    }

    /**
     * 修改Teacher
     */
    @PreAuthorize("@ss.hasPermi('people:teacher:edit')")
    @Log(title = "Teacher", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Teacher teacher)
    {
        return toAjax(teacherService.updateTeacher(teacher));
    }

    /**
     * 删除Teacher
     */
    @PreAuthorize("@ss.hasPermi('people:teacher:remove')")
    @Log(title = "Teacher", businessType = BusinessType.DELETE)
	@DeleteMapping("/{tIds}")
    public AjaxResult remove(@PathVariable Long[] tIds)
    {
        return toAjax(teacherService.deleteTeacherByTIds(tIds));
    }
}
