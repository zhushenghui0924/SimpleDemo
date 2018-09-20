package com.sf.system.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;


/**
 * 部门管理
 */
@Data
@Table(name = "sys_dept")
public class Dept implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	* ID
	*/
	@Id
	@Column(name = "dept_id")
	@GeneratedValue(generator = "JDBC")
	private Long deptId;
	/**
	* 上级部门ID，一级部门为0
	*/
	@Column(name = "parent_id")
	private Long parentId;
	/**
	* 部门名称
	*/
	@Column(name = "name")
	private String name;
	/**
	* 排序
	*/
	@Column(name = "order_num")
	private Integer orderNum;
	/**
	* 是否删除  -1：已删除  0：正常
	*/
	@Column(name = "del_flag")
	private Integer delFlag;
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
