package com.ruoyi.subject.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * syudent_grade对象 成绩管理
 *
 * @author 邓周明
 * @date 2022-11-19
 */
public class StudentGrade extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 学生ID */
    @Excel(name = "学生ID")
    private String stuId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String stuName;

    /** 语文 */
    @Excel(name = "语文")
    private Long yuwen;

    /** 英语 */
    @Excel(name = "英语")
    private Long yingyu;

    /** 数学 */
    @Excel(name = "数学")
    private Long shuxue;

    /** 物理 */
    @Excel(name = "物理")
    private Long wuli;

    /** 化学 */
    @Excel(name = "化学")
    private Long huaxue;

    /** 生物 */
    @Excel(name = "生物")
    private Long shengwu;

    /** 政治 */
    @Excel(name = "政治")
    private Long zhenzi;

    /** 历史 */
    @Excel(name = "历史")
    private Long lishi;

    /** 地理 */
    @Excel(name = "地理")
    private Long dili;

    /** 音乐 */
    @Excel(name = "音乐")
    private Long yingyue;

    /** 体育 */
    @Excel(name = "体育")
    private Long tiyu;

    /** 总分 */
    @Excel(name = "总分")
    private Long countNum;

    /** 班级 */
    @Excel(name = "班级")
    private String stuClass;

    /** 年级 */
    @Excel(name = "年级")
    private String nianji;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setStuId(String stuId)
    {
        this.stuId = stuId;
    }

    public String getStuId()
    {
        return stuId;
    }
    public void setStuName(String stuName)
    {
        this.stuName = stuName;
    }

    public String getStuName()
    {
        return stuName;
    }
    public void setYuwen(Long yuwen)
    {
        this.yuwen = yuwen;
    }

    public Long getYuwen()
    {
        return yuwen;
    }
    public void setYingyu(Long yingyu)
    {
        this.yingyu = yingyu;
    }

    public Long getYingyu()
    {
        return yingyu;
    }
    public void setShuxue(Long shuxue)
    {
        this.shuxue = shuxue;
    }

    public Long getShuxue()
    {
        return shuxue;
    }
    public void setWuli(Long wuli)
    {
        this.wuli = wuli;
    }

    public Long getWuli()
    {
        return wuli;
    }
    public void setHuaxue(Long huaxue)
    {
        this.huaxue = huaxue;
    }

    public Long getHuaxue()
    {
        return huaxue;
    }
    public void setShengwu(Long shengwu)
    {
        this.shengwu = shengwu;
    }

    public Long getShengwu()
    {
        return shengwu;
    }
    public void setZhenzi(Long zhenzi)
    {
        this.zhenzi = zhenzi;
    }

    public Long getZhenzi()
    {
        return zhenzi;
    }
    public void setLishi(Long lishi)
    {
        this.lishi = lishi;
    }

    public Long getLishi()
    {
        return lishi;
    }
    public void setDili(Long dili)
    {
        this.dili = dili;
    }

    public Long getDili()
    {
        return dili;
    }
    public void setYingyue(Long yingyue)
    {
        this.yingyue = yingyue;
    }

    public Long getYingyue()
    {
        return yingyue;
    }
    public void setTiyu(Long tiyu)
    {
        this.tiyu = tiyu;
    }

    public Long getTiyu()
    {
        return tiyu;
    }
    public void setCountNum(Long countNum)
    {
        this.countNum = countNum;
    }

    public Long getCountNum()
    {
        return countNum;
    }
    public void setStuClass(String stuClass)
    {
        this.stuClass = stuClass;
    }

    public String getStuClass()
    {
        return stuClass;
    }
    public void setNianji(String nianji)
    {
        this.nianji = nianji;
    }

    public String getNianji()
    {
        return nianji;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("stuId", getStuId())
                .append("stuName", getStuName())
                .append("yuwen", getYuwen())
                .append("yingyu", getYingyu())
                .append("shuxue", getShuxue())
                .append("wuli", getWuli())
                .append("huaxue", getHuaxue())
                .append("shengwu", getShengwu())
                .append("zhenzi", getZhenzi())
                .append("lishi", getLishi())
                .append("dili", getDili())
                .append("yingyue", getYingyue())
                .append("tiyu", getTiyu())
                .append("countNum", getCountNum())
                .append("stuClass", getStuClass())
                .append("nianji", getNianji())
                .toString();
    }
}
