package com.ruoyi.signup.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.signup.mapper.BaomingDbMapper;
import com.ruoyi.signup.domain.BaomingDb;
import com.ruoyi.signup.service.IBaomingDbService;

/**
 * 报名管理Service业务层处理
 *
 * @author 邓周明
 * @date 2022-11-24
 */
@Service
public class BaomingDbServiceImpl implements IBaomingDbService
{
    @Autowired
    private BaomingDbMapper baomingDbMapper;

    /**
     * 查询报名管理
     *
     * @param id 报名管理主键
     * @return 报名管理
     */
    @Override
    public BaomingDb selectBaomingDbById(Long id)
    {
        return baomingDbMapper.selectBaomingDbById(id);
    }

    /**
     * 查询报名管理列表
     *
     * @param baomingDb 报名管理
     * @return 报名管理
     */
    @Override
    public List<BaomingDb> selectBaomingDbList(BaomingDb baomingDb)
    {
        return baomingDbMapper.selectBaomingDbList(baomingDb);
    }

    /**
     * 新增报名管理
     *
     * @param baomingDb 报名管理
     * @return 结果
     */
    @Override
    public int insertBaomingDb(BaomingDb baomingDb)
    {
        return baomingDbMapper.insertBaomingDb(baomingDb);
    }

    /**
     * 修改报名管理
     *
     * @param baomingDb 报名管理
     * @return 结果
     */
    @Override
    public int updateBaomingDb(BaomingDb baomingDb)
    {
        return baomingDbMapper.updateBaomingDb(baomingDb);
    }

    /**
     * 批量删除报名管理
     *
     * @param ids 需要删除的报名管理主键
     * @return 结果
     */
    @Override
    public int deleteBaomingDbByIds(Long[] ids)
    {
        return baomingDbMapper.deleteBaomingDbByIds(ids);
    }

    /**
     * 删除报名管理信息
     *
     * @param id 报名管理主键
     * @return 结果
     */
    @Override
    public int deleteBaomingDbById(Long id)
    {
        return baomingDbMapper.deleteBaomingDbById(id);
    }
}
