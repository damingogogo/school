package com.ruoyi.tianbiao.service;

import java.util.List;
import com.ruoyi.tianbiao.domain.FromDb;

/**
 * 填表管理Service接口
 *
 * @author 邓周明
 * @date 2022-11-24
 */
public interface IFromDbService
{
    /**
     * 查询填表管理
     *
     * @param id 填表管理主键
     * @return 填表管理
     */
    public FromDb selectFromDbById(Long id);

    /**
     * 查询填表管理列表
     *
     * @param fromDb 填表管理
     * @return 填表管理集合
     */
    public List<FromDb> selectFromDbList(FromDb fromDb);

    /**
     * 新增填表管理
     *
     * @param fromDb 填表管理
     * @return 结果
     */
    public int insertFromDb(FromDb fromDb);

    /**
     * 修改填表管理
     *
     * @param fromDb 填表管理
     * @return 结果
     */
    public int updateFromDb(FromDb fromDb);

    /**
     * 批量删除填表管理
     *
     * @param ids 需要删除的填表管理主键集合
     * @return 结果
     */
    public int deleteFromDbByIds(Long[] ids);

    /**
     * 删除填表管理信息
     *
     * @param id 填表管理主键
     * @return 结果
     */
    public int deleteFromDbById(Long id);
}
