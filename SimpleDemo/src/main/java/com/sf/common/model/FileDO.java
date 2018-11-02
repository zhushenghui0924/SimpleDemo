package com.sf.common.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * 文件上传
 */
@Data
@Table(name = "sys_file")
public class FileDO implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "JDBC")
    private Long id;
    /**
     * 文件类型
     * 0 图片 1文档 2视频 3音乐
     */
    @Column(name = "type")
    private Integer type;
    /**
     *URL地址
     */
    @Column(name = "url")
    private String url;
    /**
     *文件原始名称
     */
    @Column(name = "file_name")
    private String fileName;
    /**
     *文件大小KB
     */
    @Column(name = "size")
    private Long size;
    /**
     * 	创建者
     */
    @Column(name = "create_by")
    private Long createBy;
    /**
     * 	创建时间
     */
    @Column(name = "create_time")
    private Date createTime;
    /**
     * 	更新者
     */
    @Column(name = "update_by")
    private Long updateBy;
    /**
     * 	更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    public FileDO(Integer type, String url,String fileName, Date createTime) {
        this.type = type;
        this.url = url;
        this.createTime = createTime;
        this.fileName=fileName;
    }

    public FileDO(Integer type, String url, String fileName, Long size, Date createTime) {
        this.type = type;
        this.url = url;
        this.fileName = fileName;
        this.size = size;
        this.createTime = createTime;
    }

    public FileDO() {
        super();
    }
}
