package com.ruoyi.tianbiao.mapper;

import java.util.List;
import com.ruoyi.tianbiao.domain.FromDb;

/**
 * 填表管理Mapper接口
 *
 * @author 邓周明
 * @date 2022-11-24
 */
public interface FromDbMapper
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
     * 删除填表管理
     *
     * @param id 填表管理主键
     * @return 结果
     */
    public int deleteFromDbById(Long id);

    /**
     * 批量删除填表管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFromDbByIds(Long[] ids);
}
