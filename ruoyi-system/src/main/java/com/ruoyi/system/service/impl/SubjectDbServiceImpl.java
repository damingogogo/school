package com.ruoyi.subject.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.subject.mapper.SubjectDbMapper;
import com.ruoyi.subject.domain.SubjectDb;
import com.ruoyi.subject.service.ISubjectDbService;

/**
 * 学科Service业务层处理
 *
 * @author 邓周明
 * @date 2022-11-16
 */
@Service
public class SubjectDbServiceImpl implements ISubjectDbService
{
    @Autowired
    private SubjectDbMapper subjectDbMapper;

    /**
     * 查询学科
     *
     * @param id 学科主键
     * @return 学科
     */
    @Override
    public SubjectDb selectSubjectDbById(Long id)
    {
        return subjectDbMapper.selectSubjectDbById(id);
    }

    /**
     * 查询学科列表
     *
     * @param subjectDb 学科
     * @return 学科
     */
    @Override
    public List<SubjectDb> selectSubjectDbList(SubjectDb subjectDb)
    {
        return subjectDbMapper.selectSubjectDbList(subjectDb);
    }

    /**
     * 新增学科
     *
     * @param subjectDb 学科
     * @return 结果
     */
    @Override
    public int insertSubjectDb(SubjectDb subjectDb)
    {
        return subjectDbMapper.insertSubjectDb(subjectDb);
    }

    /**
     * 修改学科
     *
     * @param subjectDb 学科
     * @return 结果
     */
    @Override
    public int updateSubjectDb(SubjectDb subjectDb)
    {
        return subjectDbMapper.updateSubjectDb(subjectDb);
    }

    /**
     * 批量删除学科
     *
     * @param ids 需要删除的学科主键
     * @return 结果
     */
    @Override
    public int deleteSubjectDbByIds(Long[] ids)
    {
        return subjectDbMapper.deleteSubjectDbByIds(ids);
    }

    /**
     * 删除学科信息
     *
     * @param id 学科主键
     * @return 结果
     */
    @Override
    public int deleteSubjectDbById(Long id)
    {
        return subjectDbMapper.deleteSubjectDbById(id);
    }
}
