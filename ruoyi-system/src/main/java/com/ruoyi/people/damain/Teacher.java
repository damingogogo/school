package com.ruoyi.people.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * Teacher对象 teacher
 * 
 * @author 邓周明
 * @date 2022-12-03
 */
public class Teacher extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 教师ID */
    private Long tId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String tName;

    /** 工号 */
    @Excel(name = "工号")
    private String tGonghao;

    /** 性别 */
    @Excel(name = "性别")
    private String tSex;

    /** 身份证 */
    @Excel(name = "身份证")
    private String tSfz;

    /** 年龄 */
    @Excel(name = "年龄")
    private String tAge;

    /** 政治面貌 */
    @Excel(name = "政治面貌")
    private String tPolitic;

    /** 民族 */
    @Excel(name = "民族")
    private String tNation;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String tEmail;

    /** 手机号 */
    @Excel(name = "手机号")
    private String tPhone;

    /** 家庭住址 */
    @Excel(name = "家庭住址")
    private String tAddress;

    /** 疫苗接种 */
    @Excel(name = "疫苗接种")
    private String yimiao;

    /** 任课学院 */
    @Excel(name = "任课学院")
    private String collegeType;

    /** 任课系 */
    @Excel(name = "任课系")
    private String tDep;

    /** 任课年级 */
    @Excel(name = "任课年级")
    private String gradeType;

    /** 任课班级 */
    @Excel(name = "任课班级")
    private String classType;

    public void settId(Long tId) 
    {
        this.tId = tId;
    }

    public Long gettId() 
    {
        return tId;
    }
    public void settName(String tName) 
    {
        this.tName = tName;
    }

    public String gettName() 
    {
        return tName;
    }
    public void settGonghao(String tGonghao) 
    {
        this.tGonghao = tGonghao;
    }

    public String gettGonghao() 
    {
        return tGonghao;
    }
    public void settSex(String tSex) 
    {
        this.tSex = tSex;
    }

    public String gettSex() 
    {
        return tSex;
    }
    public void settSfz(String tSfz) 
    {
        this.tSfz = tSfz;
    }

    public String gettSfz() 
    {
        return tSfz;
    }
    public void settAge(String tAge) 
    {
        this.tAge = tAge;
    }

    public String gettAge() 
    {
        return tAge;
    }
    public void settPolitic(String tPolitic) 
    {
        this.tPolitic = tPolitic;
    }

    public String gettPolitic() 
    {
        return tPolitic;
    }
    public void settNation(String tNation) 
    {
        this.tNation = tNation;
    }

    public String gettNation() 
    {
        return tNation;
    }
    public void settEmail(String tEmail) 
    {
        this.tEmail = tEmail;
    }

    public String gettEmail() 
    {
        return tEmail;
    }
    public void settPhone(String tPhone) 
    {
        this.tPhone = tPhone;
    }

    public String gettPhone() 
    {
        return tPhone;
    }
    public void settAddress(String tAddress) 
    {
        this.tAddress = tAddress;
    }

    public String gettAddress() 
    {
        return tAddress;
    }
    public void setYimiao(String yimiao) 
    {
        this.yimiao = yimiao;
    }

    public String getYimiao() 
    {
        return yimiao;
    }
    public void setCollegeType(String collegeType) 
    {
        this.collegeType = collegeType;
    }

    public String getCollegeType() 
    {
        return collegeType;
    }
    public void settDep(String tDep) 
    {
        this.tDep = tDep;
    }

    public String gettDep() 
    {
        return tDep;
    }
    public void setGradeType(String gradeType) 
    {
        this.gradeType = gradeType;
    }

    public String getGradeType() 
    {
        return gradeType;
    }
    public void setClassType(String classType) 
    {
        this.classType = classType;
    }

    public String getClassType() 
    {
        return classType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("tId", gettId())
            .append("tName", gettName())
            .append("tGonghao", gettGonghao())
            .append("tSex", gettSex())
            .append("tSfz", gettSfz())
            .append("tAge", gettAge())
            .append("tPolitic", gettPolitic())
            .append("tNation", gettNation())
            .append("tEmail", gettEmail())
            .append("tPhone", gettPhone())
            .append("tAddress", gettAddress())
            .append("yimiao", getYimiao())
            .append("collegeType", getCollegeType())
            .append("tDep", gettDep())
            .append("gradeType", getGradeType())
            .append("classType", getClassType())
            .toString();
    }
}
