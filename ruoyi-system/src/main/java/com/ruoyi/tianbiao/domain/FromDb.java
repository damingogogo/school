package com.ruoyi.tianbiao.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 填表管理对象 from_db
 *
 * @author 邓周明
 * @date 2022-11-24
 */
public class FromDb extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 表单ID */
    @Excel(name = "表单ID")
    private String fromid;

    /** 内容 */
    @Excel(name = "内容")
    private String title;

    /** 文件地址 */
    @Excel(name = "文件地址")
    private String fileurl;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String picurl;

    /** 家长ID */
    @Excel(name = "家长ID")
    private Long homeid;

    /** 学生ID */
    @Excel(name = "学生ID")
    private Long stuid;

    /** 家长姓名 */
    @Excel(name = "家长姓名")
    private String homename;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String stuname;

    /** 当前状态 */
    @Excel(name = "当前状态")
    private String state;

    /** 类型 */
    @Excel(name = "类型")
    private String fromType;

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createtime;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }



    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setFromid(String fromid)
    {
        this.fromid = fromid;
    }

    public String getFromid()
    {
        return fromid;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setFileurl(String fileurl)
    {
        this.fileurl = fileurl;
    }

    public String getFileurl()
    {
        return fileurl;
    }
    public void setPicurl(String picurl)
    {
        this.picurl = picurl;
    }

    public String getPicurl()
    {
        return picurl;
    }
    public void setHomeid(Long homeid)
    {
        this.homeid = homeid;
    }

    public Long getHomeid()
    {
        return homeid;
    }
    public void setStuid(Long stuid)
    {
        this.stuid = stuid;
    }

    public Long getStuid()
    {
        return stuid;
    }
    public void setHomename(String homename)
    {
        this.homename = homename;
    }

    public String getHomename()
    {
        return homename;
    }
    public void setStuname(String stuname)
    {
        this.stuname = stuname;
    }

    public String getStuname()
    {
        return stuname;
    }
    public void setState(String state)
    {
        this.state = state;
    }

    public String getState()
    {
        return state;
    }
    public void setFromType(String fromType)
    {
        this.fromType = fromType;
    }

    public String getFromType()
    {
        return fromType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("fromid", getFromid())
                .append("title", getTitle())
                .append("fileurl", getFileurl())
                .append("picurl", getPicurl())
                .append("homeid", getHomeid())
                .append("stuid", getStuid())
                .append("homename", getHomename())
                .append("stuname", getStuname())
                .append("state", getState())
                .append("fromType", getFromType())
                .append("createtime", getCreatetime())
                .toString();
    }


}
