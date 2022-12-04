package com.ruoyi.subject.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学科对象 subject_db
 *
 * @author 邓周明
 * @date 2022-11-16
 */
public class SubjectDb extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 学科ID */
    @Excel(name = "学科ID")
    private String xid;

    /** 学科名称 */
    @Excel(name = "学科名称")
    private String name;

    /** 学科主任 */
    @Excel(name = "学科主任")
    private String nameZr;

    /** 学科人数 */
    @Excel(name = "学科人数")
    private Long countPeople;

    /** 学科类型 */
    @Excel(name = "学科类型")
    private String type;

    /** 学科描述 */
    @Excel(name = "学科描述")
    private String desction;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setXid(String xid)
    {
        this.xid = xid;
    }

    public String getXid()
    {
        return xid;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setNameZr(String nameZr)
    {
        this.nameZr = nameZr;
    }

    public String getNameZr()
    {
        return nameZr;
    }
    public void setCountPeople(Long countPeople)
    {
        this.countPeople = countPeople;
    }

    public Long getCountPeople()
    {
        return countPeople;
    }
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }
    public void setDesction(String desction)
    {
        this.desction = desction;
    }

    public String getDesction()
    {
        return desction;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("xid", getXid())
                .append("name", getName())
                .append("nameZr", getNameZr())
                .append("countPeople", getCountPeople())
                .append("type", getType())
                .append("desction", getDesction())
                .toString();
    }
}
