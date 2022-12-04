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
import com.ruoyi.people.domain.Student;
import com.ruoyi.people.service.IStudentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * studentController
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
@RestController
@RequestMapping("/people/student")
public class StudentController extends BaseController
{
    @Autowired
    private IStudentService studentService;

    /**
     * 查询student列表
     */
    @PreAuthorize("@ss.hasPermi('people:student:list')")
    @GetMapping("/list")
    public TableDataInfo list(Student student)
    {
        startPage();
        List<Student> list = studentService.selectStudentList(student);
        return getDataTable(list);
    }

    /**
     * 导出student列表
     */
    @PreAuthorize("@ss.hasPermi('people:student:export')")
    @Log(title = "student", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Student student)
    {
        List<Student> list = studentService.selectStudentList(student);
        ExcelUtil<Student> util = new ExcelUtil<Student>(Student.class);
        util.exportExcel(response, list, "student数据");
    }

    /**
     * 获取student详细信息
     */
    @PreAuthorize("@ss.hasPermi('people:student:query')")
    @GetMapping(value = "/{sId}")
    public AjaxResult getInfo(@PathVariable("sId") Long sId)
    {
        return success(studentService.selectStudentBySId(sId));
    }

    /**
     * 新增student
     */
    @PreAuthorize("@ss.hasPermi('people:student:add')")
    @Log(title = "student", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Student student)
    {
        return toAjax(studentService.insertStudent(student));
    }

    /**
     * 修改student
     */
    @PreAuthorize("@ss.hasPermi('people:student:edit')")
    @Log(title = "student", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Student student)
    {
        return toAjax(studentService.updateStudent(student));
    }

    /**
     * 删除student
     */
    @PreAuthorize("@ss.hasPermi('people:student:remove')")
    @Log(title = "student", businessType = BusinessType.DELETE)
	@DeleteMapping("/{sIds}")
    public AjaxResult remove(@PathVariable Long[] sIds)
    {
        return toAjax(studentService.deleteStudentBySIds(sIds));
    }
}
