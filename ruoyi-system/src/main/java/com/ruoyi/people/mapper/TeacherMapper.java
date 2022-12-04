package com.ruoyi.people.mapper;

import com.ruoyi.people.domain.Teacher;

import java.util.List;

/**
 * TeacherMapper接口
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
public interface TeacherMapper 
{
    /**
     * 查询Teacher
     * 
     * @param tId Teacher主键
     * @return Teacher
     */
    public Teacher selectTeacherByTId(Long tId);

    /**
     * 查询Teacher列表
     * 
     * @param teacher Teacher
     * @return Teacher集合
     */
    public List<Teacher> selectTeacherList(Teacher teacher);

    /**
     * 新增Teacher
     * 
     * @param teacher Teacher
     * @return 结果
     */
    public int insertTeacher(Teacher teacher);

    /**
     * 修改Teacher
     * 
     * @param teacher Teacher
     * @return 结果
     */
    public int updateTeacher(Teacher teacher);

    /**
     * 删除Teacher
     * 
     * @param tId Teacher主键
     * @return 结果
     */
    public int deleteTeacherByTId(Long tId);

    /**
     * 批量删除Teacher
     * 
     * @param tIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTeacherByTIds(Long[] tIds);
}
