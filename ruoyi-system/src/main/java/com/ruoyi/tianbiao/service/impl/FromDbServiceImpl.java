package com.ruoyi.tianbiao.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.tianbiao.mapper.FromDbMapper;
import com.ruoyi.tianbiao.domain.FromDb;
import com.ruoyi.tianbiao.service.IFromDbService;

/**
 * 填表管理Service业务层处理
 *
 * @author 邓周明
 * @date 2022-11-24
 */
@Service
public class FromDbServiceImpl implements IFromDbService
{
    @Autowired
    private FromDbMapper fromDbMapper;

    /**
     * 查询填表管理
     *
     * @param id 填表管理主键
     * @return 填表管理
     */
    @Override
    public FromDb selectFromDbById(Long id)
    {
        return fromDbMapper.selectFromDbById(id);
    }

    /**
     * 查询填表管理列表
     *
     * @param fromDb 填表管理
     * @return 填表管理
     */
    @Override
    public List<FromDb> selectFromDbList(FromDb fromDb)
    {
        return fromDbMapper.selectFromDbList(fromDb);
    }

    /**
     * 新增填表管理
     *
     * @param fromDb 填表管理
     * @return 结果
     */
    @Override
    public int insertFromDb(FromDb fromDb)
    {
        return fromDbMapper.insertFromDb(fromDb);
    }

    /**
     * 修改填表管理
     *
     * @param fromDb 填表管理
     * @return 结果
     */
    @Override
    public int updateFromDb(FromDb fromDb)
    {
        return fromDbMapper.updateFromDb(fromDb);
    }

    /**
     * 批量删除填表管理
     *
     * @param ids 需要删除的填表管理主键
     * @return 结果
     */
    @Override
    public int deleteFromDbByIds(Long[] ids)
    {
        return fromDbMapper.deleteFromDbByIds(ids);
    }

    /**
     * 删除填表管理信息
     *
     * @param id 填表管理主键
     * @return 结果
     */
    @Override
    public int deleteFromDbById(Long id)
    {
        return fromDbMapper.deleteFromDbById(id);
    }
}
