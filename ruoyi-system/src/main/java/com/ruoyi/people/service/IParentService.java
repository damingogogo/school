package com.ruoyi.people.service;

import java.util.List;
import com.ruoyi.people.domain.Parent;

/**
 * ParentService接口
 * 
 * @author 邓周明
 * @date 2022-12-04
 */
public interface IParentService 
{
    /**
     * 查询Parent
     * 
     * @param pId Parent主键
     * @return Parent
     */
    public Parent selectParentByPId(Long pId);

    /**
     * 查询Parent列表
     * 
     * @param parent Parent
     * @return Parent集合
     */
    public List<Parent> selectParentList(Parent parent);

    /**
     * 新增Parent
     * 
     * @param parent Parent
     * @return 结果
     */
    public int insertParent(Parent parent);

    /**
     * 修改Parent
     * 
     * @param parent Parent
     * @return 结果
     */
    public int updateParent(Parent parent);

    /**
     * 批量删除Parent
     * 
     * @param pIds 需要删除的Parent主键集合
     * @return 结果
     */
    public int deleteParentByPIds(Long[] pIds);

    /**
     * 删除Parent信息
     * 
     * @param pId Parent主键
     * @return 结果
     */
    public int deleteParentByPId(Long pId);
}
