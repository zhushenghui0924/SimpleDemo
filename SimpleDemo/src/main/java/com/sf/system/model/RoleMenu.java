package com.sf.system.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;


/**
 * 角色与菜单对应关系
 */
@Data
@Table(name = "sys_role_menu")
public class RoleMenu implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	* ID
	*/
	@Id
	@Column(name = "id")
	@GeneratedValue(generator = "JDBC")
	private Long id;
	/**
	* 角色ID
	*/
	@Column(name = "role_id")
	private Long roleId;
	/**
	* 菜单ID
	*/
	@Column(name = "menu_id")
	private Long menuId;
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
