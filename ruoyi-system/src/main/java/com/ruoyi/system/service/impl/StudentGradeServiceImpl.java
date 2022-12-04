package com.ruoyi.subject.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.subject.mapper.StudentGradeMapper;
import com.ruoyi.subject.domain.StudentGrade;
import com.ruoyi.subject.service.IStudentGradeService;

/**
 * syudent_gradeService业务层处理
 *
 * @author 邓周明
 * @date 2022-11-19
 */
@Service
public class StudentGradeServiceImpl implements IStudentGradeService
{
    @Autowired
    private StudentGradeMapper studentGradeMapper;

    /**
     * 查询syudent_grade
     *
     * @param id syudent_grade主键
     * @return syudent_grade
     */
    @Override
    public StudentGrade selectStudentGradeById(Long id)
    {
        return studentGradeMapper.selectStudentGradeById(id);
    }

    /**
     * 查询syudent_grade列表
     *
     * @param studentGrade syudent_grade
     * @return syudent_grade
     */
    @Override
    public List<StudentGrade> selectStudentGradeList(StudentGrade studentGrade)
    {
        return studentGradeMapper.selectStudentGradeList(studentGrade);
    }

    /**
     * 新增syudent_grade
     *
     * @param studentGrade syudent_grade
     * @return 结果
     */
    @Override
    public int insertStudentGrade(StudentGrade studentGrade)
    {
        return studentGradeMapper.insertStudentGrade(studentGrade);
    }

    /**
     * 修改syudent_grade
     *
     * @param studentGrade syudent_grade
     * @return 结果
     */
    @Override
    public int updateStudentGrade(StudentGrade studentGrade)
    {
        return studentGradeMapper.updateStudentGrade(studentGrade);
    }

    /**
     * 批量删除syudent_grade
     *
     * @param ids 需要删除的syudent_grade主键
     * @return 结果
     */
    @Override
    public int deleteStudentGradeByIds(Long[] ids)
    {
        return studentGradeMapper.deleteStudentGradeByIds(ids);
    }

    /**
     * 删除syudent_grade信息
     *
     * @param id syudent_grade主键
     * @return 结果
     */
    @Override
    public int deleteStudentGradeById(Long id)
    {
        return studentGradeMapper.deleteStudentGradeById(id);
    }
}
