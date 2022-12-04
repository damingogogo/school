package com.ruoyi.people.service;

import java.util.List;
import com.ruoyi.people.domain.Student;

/**
 * studentService接口
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
public interface IStudentService 
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
     * 批量删除student
     * 
     * @param sIds 需要删除的student主键集合
     * @return 结果
     */
    public int deleteStudentBySIds(Long[] sIds);

    /**
     * 删除student信息
     * 
     * @param sId student主键
     * @return 结果
     */
    public int deleteStudentBySId(Long sId);
}
