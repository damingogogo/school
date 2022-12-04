package com.ruoyi.people.service.impl;

import java.util.List;

import com.ruoyi.people.domain.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.people.mapper.TeacherMapper;
import com.ruoyi.people.service.ITeacherService;

/**
 * TeacherService业务层处理
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
@Service
public class TeacherServiceImpl implements ITeacherService 
{
    @Autowired
    private TeacherMapper teacherMapper;

    /**
     * 查询Teacher
     * 
     * @param tId Teacher主键
     * @return Teacher
     */
    @Override
    public Teacher selectTeacherByTId(Long tId)
    {
        return teacherMapper.selectTeacherByTId(tId);
    }

    /**
     * 查询Teacher列表
     * 
     * @param teacher Teacher
     * @return Teacher
     */
    @Override
    public List<Teacher> selectTeacherList(Teacher teacher)
    {
        return teacherMapper.selectTeacherList(teacher);
    }

    /**
     * 新增Teacher
     * 
     * @param teacher Teacher
     * @return 结果
     */
    @Override
    public int insertTeacher(Teacher teacher)
    {
        return teacherMapper.insertTeacher(teacher);
    }

    /**
     * 修改Teacher
     * 
     * @param teacher Teacher
     * @return 结果
     */
    @Override
    public int updateTeacher(Teacher teacher)
    {
        return teacherMapper.updateTeacher(teacher);
    }

    /**
     * 批量删除Teacher
     * 
     * @param tIds 需要删除的Teacher主键
     * @return 结果
     */
    @Override
    public int deleteTeacherByTIds(Long[] tIds)
    {
        return teacherMapper.deleteTeacherByTIds(tIds);
    }

    /**
     * 删除Teacher信息
     * 
     * @param tId Teacher主键
     * @return 结果
     */
    @Override
    public int deleteTeacherByTId(Long tId)
    {
        return teacherMapper.deleteTeacherByTId(tId);
    }
}
