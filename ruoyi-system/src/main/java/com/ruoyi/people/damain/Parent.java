package com.ruoyi.people.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * Parent对象 parent
 * 
 * @author 邓周明
 * @date 2022-12-04
 */
public class Parent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 家长编号 */
    private Long pId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String pName;

    /** 性别 */
    @Excel(name = "性别")
    private String pSex;

    /** 身份证 */
    @Excel(name = "身份证")
    private String pSfz;

    /** 年龄 */
    @Excel(name = "年龄")
    private String pAge;

    /** 政治面貌 */
    @Excel(name = "政治面貌")
    private String pZzmm;

    /** 住址 */
    @Excel(name = "住址")
    private String pAddress;

    /** 手机号 */
    @Excel(name = "手机号")
    private String pPhone;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date pCreateTime;

    /** 孩子id */
    @Excel(name = "孩子id")
    private Long pChildId;

    public void setpId(Long pId) 
    {
        this.pId = pId;
    }

    public Long getpId() 
    {
        return pId;
    }
    public void setpName(String pName) 
    {
        this.pName = pName;
    }

    public String getpName() 
    {
        return pName;
    }
    public void setpSex(String pSex) 
    {
        this.pSex = pSex;
    }

    public String getpSex() 
    {
        return pSex;
    }
    public void setpSfz(String pSfz) 
    {
        this.pSfz = pSfz;
    }

    public String getpSfz() 
    {
        return pSfz;
    }
    public void setpAge(String pAge) 
    {
        this.pAge = pAge;
    }

    public String getpAge() 
    {
        return pAge;
    }
    public void setpZzmm(String pZzmm) 
    {
        this.pZzmm = pZzmm;
    }

    public String getpZzmm() 
    {
        return pZzmm;
    }
    public void setpAddress(String pAddress) 
    {
        this.pAddress = pAddress;
    }

    public String getpAddress() 
    {
        return pAddress;
    }
    public void setpPhone(String pPhone) 
    {
        this.pPhone = pPhone;
    }

    public String getpPhone() 
    {
        return pPhone;
    }
    public void setpCreateTime(Date pCreateTime) 
    {
        this.pCreateTime = pCreateTime;
    }

    public Date getpCreateTime() 
    {
        return pCreateTime;
    }
    public void setpChildId(Long pChildId) 
    {
        this.pChildId = pChildId;
    }

    public Long getpChildId() 
    {
        return pChildId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("pId", getpId())
            .append("pName", getpName())
            .append("pSex", getpSex())
            .append("pSfz", getpSfz())
            .append("pAge", getpAge())
            .append("pZzmm", getpZzmm())
            .append("pAddress", getpAddress())
            .append("pPhone", getpPhone())
            .append("pCreateTime", getpCreateTime())
            .append("pChildId", getpChildId())
            .toString();
    }
}
