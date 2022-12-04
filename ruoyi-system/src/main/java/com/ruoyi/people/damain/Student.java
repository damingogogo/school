package com.ruoyi.people.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * student对象 student
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
public class Student extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long sId;

    /** 学号 */
    @Excel(name = "学号")
    private String sXh;

    @Excel(name = "姓名")
    private String sName;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String sSfz;

    /** 性别 */
    @Excel(name = "性别")
    private String sSex;

    /** 年龄 */
    @Excel(name = "年龄")
    private String sAge;

    /** 民族 */
    @Excel(name = "民族")
    private String sNation;

    /** 政治面貌 */
    @Excel(name = "政治面貌")
    private String sPolitic;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String sEmail;

    /** 电话 */
    @Excel(name = "电话")
    private String sPhone;

    /** 家庭住址 */
    @Excel(name = "家庭住址")
    private String sAddress;

    /** 学校名称 */
    @Excel(name = "学校名称")
    private String sSchool;

    /** 学院名称 */
    @Excel(name = "学院名称")
    private String sCollege;

    /** 所在系名称 */
    @Excel(name = "所在系名称")
    private String sDept;

    /** 年级 */
    @Excel(name = "年级")
    private String sGrade;

    /** 班级 */
    @Excel(name = "班级")
    private String sClass;

    /** 班主任姓名 */
    @Excel(name = "班主任姓名")
    private String sMaster;

    /** 监护人姓名 */
    @Excel(name = "监护人姓名")
    private String sParent;

    public void setsId(Long sId) 
    {
        this.sId = sId;
    }

    public Long getsId() 
    {
        return sId;
    }

    public void setsName(String sName)
    {
        this.sName = sName;
    }

    public String getsName()
    {
        return sName;
    }
    public void setsXh(String sXh) 
    {
        this.sXh = sXh;
    }

    public String getsXh() 
    {
        return sXh;
    }
    public void setsSfz(String sSfz) 
    {
        this.sSfz = sSfz;
    }

    public String getsSfz() 
    {
        return sSfz;
    }
    public void setsSex(String sSex) 
    {
        this.sSex = sSex;
    }

    public String getsSex() 
    {
        return sSex;
    }
    public void setsAge(String sAge) 
    {
        this.sAge = sAge;
    }

    public String getsAge() 
    {
        return sAge;
    }
    public void setsNation(String sNation) 
    {
        this.sNation = sNation;
    }

    public String getsNation() 
    {
        return sNation;
    }
    public void setsPolitic(String sPolitic) 
    {
        this.sPolitic = sPolitic;
    }

    public String getsPolitic() 
    {
        return sPolitic;
    }
    public void setsEmail(String sEmail) 
    {
        this.sEmail = sEmail;
    }

    public String getsEmail() 
    {
        return sEmail;
    }
    public void setsPhone(String sPhone) 
    {
        this.sPhone = sPhone;
    }

    public String getsPhone() 
    {
        return sPhone;
    }
    public void setsAddress(String sAddress) 
    {
        this.sAddress = sAddress;
    }

    public String getsAddress() 
    {
        return sAddress;
    }
    public void setsSchool(String sSchool) 
    {
        this.sSchool = sSchool;
    }

    public String getsSchool() 
    {
        return sSchool;
    }
    public void setsCollege(String sCollege) 
    {
        this.sCollege = sCollege;
    }

    public String getsCollege() 
    {
        return sCollege;
    }
    public void setsDept(String sDept) 
    {
        this.sDept = sDept;
    }

    public String getsDept() 
    {
        return sDept;
    }
    public void setsGrade(String sGrade) 
    {
        this.sGrade = sGrade;
    }

    public String getsGrade() 
    {
        return sGrade;
    }
    public void setsClass(String sClass) 
    {
        this.sClass = sClass;
    }

    public String getsClass() 
    {
        return sClass;
    }
    public void setsMaster(String sMaster) 
    {
        this.sMaster = sMaster;
    }

    public String getsMaster() 
    {
        return sMaster;
    }
    public void setsParent(String sParent) 
    {
        this.sParent = sParent;
    }

    public String getsParent() 
    {
        return sParent;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("sId", getsId())
            .append("sName", getsName())
            .append("sXh", getsXh())
            .append("sSfz", getsSfz())
            .append("sSex", getsSex())
            .append("sAge", getsAge())
            .append("sNation", getsNation())
            .append("sPolitic", getsPolitic())
            .append("sEmail", getsEmail())
            .append("sPhone", getsPhone())
            .append("sAddress", getsAddress())
            .append("sSchool", getsSchool())
            .append("sCollege", getsCollege())
            .append("sDept", getsDept())
            .append("sGrade", getsGrade())
            .append("sClass", getsClass())
            .append("sMaster", getsMaster())
            .append("sParent", getsParent())
            .toString();
    }
}
