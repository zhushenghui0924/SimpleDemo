package com.sf.system.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 角色
 */
@Data
@Table(name = "sys_role")
public class Role implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	*
	*/
	@Id
	@Column(name = "role_id")
	@GeneratedValue(generator = "JDBC")
	private Long roleId;
	/**
	* 角色名称
	*/
	@Column(name = "role_name")
	private String roleName;
	/**
	* 角色标识
	*/
	@Column(name = "role_sign")
	private String roleSign;
	/**
	* 备注
	*/
	@Column(name = "remark")
	private String remark;
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
	/**
	 * 菜单
	 */
	private List<Long> menuIds;
}
