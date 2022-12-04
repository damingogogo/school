package com.ruoyi.people.mapper;

import com.ruoyi.people.domain.Student;

import java.util.List;

/**
 * studentMapper接口
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
public interface StudentMapper 
{
    /**
     * 查询student
     * 
     * @param sId student主键
     * @return student
     */
    public Student selectStudentBySId(Long sId);

    /**
     * 查询student列表
     * 
     * @param student student
     * @return student集合
     */
    public List<Student> selectStudentList(Student student);

    /**
     * 新增student
     * 
     * @param student student
     * @return 结果
     */
    public int insertStudent(Student student);

    /**
     * 修改student
     * 
     * @param student student
     * @return 结果
     */
    public int updateStudent(Student student);

    /**
     * 删除student
     * 
     * @param sId student主键
     * @return 结果
     */
    public int deleteStudentBySId(Long sId);

    /**
     * 批量删除student
     * 
     * @param sIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStudentBySIds(Long[] sIds);
}
