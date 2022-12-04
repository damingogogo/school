package com.ruoyi.subject.mapper;

import java.util.List;
import com.ruoyi.subject.domain.SubjectDb;

/**
 * 学科Mapper接口
 *
 * @author 邓周明
 * @date 2022-11-16
 */
public interface SubjectDbMapper
{
    /**
     * 查询学科
     *
     * @param id 学科主键
     * @return 学科
     */
    public SubjectDb selectSubjectDbById(Long id);

    /**
     * 查询学科列表
     *
     * @param subjectDb 学科
     * @return 学科集合
     */
    public List<SubjectDb> selectSubjectDbList(SubjectDb subjectDb);

    /**
     * 新增学科
     *
     * @param subjectDb 学科
     * @return 结果
     */
    public int insertSubjectDb(SubjectDb subjectDb);

    /**
     * 修改学科
     *
     * @param subjectDb 学科
     * @return 结果
     */
    public int updateSubjectDb(SubjectDb subjectDb);

    /**
     * 删除学科
     *
     * @param id 学科主键
     * @return 结果
     */
    public int deleteSubjectDbById(Long id);

    /**
     * 批量删除学科
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSubjectDbByIds(Long[] ids);
}
