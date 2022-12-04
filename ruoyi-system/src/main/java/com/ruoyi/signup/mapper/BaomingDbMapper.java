package com.ruoyi.signup.mapper;

import java.util.List;
import com.ruoyi.signup.domain.BaomingDb;

/**
 * 报名管理Mapper接口
 *
 * @author 邓周明
 * @date 2022-11-24
 */
public interface BaomingDbMapper
{
    /**
     * 查询报名管理
     *
     * @param id 报名管理主键
     * @return 报名管理
     */
    public BaomingDb selectBaomingDbById(Long id);

    /**
     * 查询报名管理列表
     *
     * @param baomingDb 报名管理
     * @return 报名管理集合
     */
    public List<BaomingDb> selectBaomingDbList(BaomingDb baomingDb);

    /**
     * 新增报名管理
     *
     * @param baomingDb 报名管理
     * @return 结果
     */
    public int insertBaomingDb(BaomingDb baomingDb);

    /**
     * 修改报名管理
     *
     * @param baomingDb 报名管理
     * @return 结果
     */
    public int updateBaomingDb(BaomingDb baomingDb);

    /**
     * 删除报名管理
     *
     * @param id 报名管理主键
     * @return 结果
     */
    public int deleteBaomingDbById(Long id);

    /**
     * 批量删除报名管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBaomingDbByIds(Long[] ids);
}
