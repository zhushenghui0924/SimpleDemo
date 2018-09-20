package com.sf.common.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 字典表
 */
@Data
@Table(name = "sys_dict")
public class Dict implements Serializable {
	private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @Id
    @Column(name = "id")
	@GeneratedValue(generator = "JDBC")
    private Long id;
    /**
	 * 	标签名
	 */
	@Column(name = "name")
	private String name;
    /**
	 * 	数据值
	 */
	@Column(name = "value")
	private String value;
	/**
	 * 	类型
	 */
	@Column(name = "type")
	private String type;
	/**
	 * 	描述
	 */
	@Column(name = "description")
	private String description;
	/**
	 * 	排序（升序）
	 */
	@Column(name = "sort")
	private BigDecimal sort;
	/**
	 * 	父级编号
	 */
	@Column(name = "parent_id")
	private Long parentId;
	/**
	 * 	备注信息
	 */
	@Column(name = "remarks")
	private String remarks;
	/**
	 * 	删除标记
	 */
	@Column(name = "del_flag")
	private String delFlag;
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
}
