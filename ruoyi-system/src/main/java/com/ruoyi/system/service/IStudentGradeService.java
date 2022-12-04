package com.ruoyi.subject.service;

import java.util.List;
import com.ruoyi.subject.domain.StudentGrade;

/**
 * syudent_gradeService接口
 *
 * @author 邓周明
 * @date 2022-11-19
 */
public interface IStudentGradeService
{
    /**
     * 查询syudent_grade
     *
     * @param id syudent_grade主键
     * @return syudent_grade
     */
    public StudentGrade selectStudentGradeById(Long id);

    /**
     * 查询syudent_grade列表
     *
     * @param studentGrade syudent_grade
     * @return syudent_grade集合
     */
    public List<StudentGrade> selectStudentGradeList(StudentGrade studentGrade);

    /**
     * 新增syudent_grade
     *
     * @param studentGrade syudent_grade
     * @return 结果
     */
    public int insertStudentGrade(StudentGrade studentGrade);

    /**
     * 修改syudent_grade
     *
     * @param studentGrade syudent_grade
     * @return 结果
     */
    public int updateStudentGrade(StudentGrade studentGrade);

    /**
     * 批量删除syudent_grade
     *
     * @param ids 需要删除的syudent_grade主键集合
     * @return 结果
     */
    public int deleteStudentGradeByIds(Long[] ids);

    /**
     * 删除syudent_grade信息
     *
     * @param id syudent_grade主键
     * @return 结果
     */
    public int deleteStudentGradeById(Long id);
}
