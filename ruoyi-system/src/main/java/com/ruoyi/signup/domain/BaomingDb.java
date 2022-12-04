package com.ruoyi.signup.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 报名管理对象 baoming_db
 *
 * @author 邓周明
 * @date 2022-11-24
 */
public class BaomingDb extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 报名ID */
    @Excel(name = "报名ID")
    private String applyid;

    /** 学生ID */
    private Long stuId;

    /** 年级 */
    @Excel(name = "年级")
    private String nianji;

    /** 班级 */
    @Excel(name = "班级")
    private String classid;

    /** 报名类别 */
    @Excel(name = "报名类别")
    private String typeApply;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDay;

    /** 状态 */
    @Excel(name = "状态")
    private String state;

    /** 报名描述 */
    @Excel(name = "报名描述")
    private String title;

    /** 备注 */
    @Excel(name = "备注")
    private String bz;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String stuname;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setApplyid(String applyid)
    {
        this.applyid = applyid;
    }

    public String getApplyid()
    {
        return applyid;
    }
    public void setStuId(Long stuId)
    {
        this.stuId = stuId;
    }

    public Long getStuId()
    {
        return stuId;
    }
    public void setNianji(String nianji)
    {
        this.nianji = nianji;
    }

    public String getNianji()
    {
        return nianji;
    }
    public void setClassid(String classid)
    {
        this.classid = classid;
    }

    public String getClassid()
    {
        return classid;
    }
    public void setTypeApply(String typeApply)
    {
        this.typeApply = typeApply;
    }

    public String getTypeApply()
    {
        return typeApply;
    }
    public void setCreateDay(Date createDay)
    {
        this.createDay = createDay;
    }

    public Date getCreateDay()
    {
        return createDay;
    }
    public void setState(String state)
    {
        this.state = state;
    }

    public String getState()
    {
        return state;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setBz(String bz)
    {
        this.bz = bz;
    }

    public String getBz()
    {
        return bz;
    }
    public void setStuname(String stuname)
    {
        this.stuname = stuname;
    }

    public String getStuname()
    {
        return stuname;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("applyid", getApplyid())
                .append("stuId", getStuId())
                .append("nianji", getNianji())
                .append("classid", getClassid())
                .append("typeApply", getTypeApply())
                .append("createDay", getCreateDay())
                .append("state", getState())
                .append("title", getTitle())
                .append("bz", getBz())
                .append("stuname", getStuname())
                .toString();
    }
}
