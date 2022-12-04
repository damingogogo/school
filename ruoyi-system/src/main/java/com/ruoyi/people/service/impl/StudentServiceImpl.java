package com.ruoyi.people.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.people.mapper.StudentMapper;
import com.ruoyi.people.domain.Student;
import com.ruoyi.people.service.IStudentService;

/**
 * studentService业务层处理
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
@Service
public class StudentServiceImpl implements IStudentService 
{
    @Autowired
    private StudentMapper studentMapper;

    /**
     * 查询student
     * 
     * @param sId student主键
     * @return student
     */
    @Override
    public Student selectStudentBySId(Long sId)
    {
        return studentMapper.selectStudentBySId(sId);
    }

    /**
     * 查询student列表
     * 
     * @param student student
     * @return student
     */
    @Override
    public List<Student> selectStudentList(Student student)
    {
        return studentMapper.selectStudentList(student);
    }

    /**
     * 新增student
     * 
     * @param student student
     * @return 结果
     */
    @Override
    public int insertStudent(Student student)
    {
        return studentMapper.insertStudent(student);
    }

    /**
     * 修改student
     * 
     * @param student student
     * @return 结果
     */
    @Override
    public int updateStudent(Student student)
    {
        return studentMapper.updateStudent(student);
    }

    /**
     * 批量删除student
     * 
     * @param sIds 需要删除的student主键
     * @return 结果
     */
    @Override
    public int deleteStudentBySIds(Long[] sIds)
    {
        return studentMapper.deleteStudentBySIds(sIds);
    }

    /**
     * 删除student信息
     * 
     * @param sId student主键
     * @return 结果
     */
    @Override
    public int deleteStudentBySId(Long sId)
    {
        return studentMapper.deleteStudentBySId(sId);
    }
}
