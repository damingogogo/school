package com.ruoyi.people.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.people.mapper.ParentMapper;
import com.ruoyi.people.domain.Parent;
import com.ruoyi.people.service.IParentService;

/**
 * ParentService业务层处理
 * 
 * @author 邓周明
 * @date 2022-12-04
 */
@Service
public class ParentServiceImpl implements IParentService 
{
    @Autowired
    private ParentMapper parentMapper;

    /**
     * 查询Parent
     * 
     * @param pId Parent主键
     * @return Parent
     */
    @Override
    public Parent selectParentByPId(Long pId)
    {
        return parentMapper.selectParentByPId(pId);
    }

    /**
     * 查询Parent列表
     * 
     * @param parent Parent
     * @return Parent
     */
    @Override
    public List<Parent> selectParentList(Parent parent)
    {
        return parentMapper.selectParentList(parent);
    }

    /**
     * 新增Parent
     * 
     * @param parent Parent
     * @return 结果
     */
    @Override
    public int insertParent(Parent parent)
    {
        return parentMapper.insertParent(parent);
    }

    /**
     * 修改Parent
     * 
     * @param parent Parent
     * @return 结果
     */
    @Override
    public int updateParent(Parent parent)
    {
        return parentMapper.updateParent(parent);
    }

    /**
     * 批量删除Parent
     * 
     * @param pIds 需要删除的Parent主键
     * @return 结果
     */
    @Override
    public int deleteParentByPIds(Long[] pIds)
    {
        return parentMapper.deleteParentByPIds(pIds);
    }

    /**
     * 删除Parent信息
     * 
     * @param pId Parent主键
     * @return 结果
     */
    @Override
    public int deleteParentByPId(Long pId)
    {
        return parentMapper.deleteParentByPId(pId);
    }
}
