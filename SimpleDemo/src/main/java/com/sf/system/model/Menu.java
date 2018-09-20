package com.sf.system.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;



/**
 * 菜单管理
 */
@Data
@Table(name = "sys_menu")
public class Menu implements Serializable {
	private static final long serialVersionUID = 1L;
    /**
    * ID
    */
    @Id
    @Column(name = "menu_id")
    @GeneratedValue(generator = "JDBC")
    private Long menuId;
    /**
    * 父菜单ID，一级菜单为0
    */
    @Column(name = "parent_id")
    private Long parentId;
    /**
    * 菜单名称
    */
    @Column(name = "name")
    private String name;
    /**
    * 菜单URL
    */
    @Column(name = "url")
    private String url;
    /**
    * 授权(多个用逗号分隔，如：user:list,user:create)
    */
    @Column(name = "perms")
    private String perms;
    /**
    * 类型   0：目录   1：菜单   2：按钮
    */
    @Column(name = "type")
    private Integer type;
    /**
    * 菜单图标
    */
    @Column(name = "icon")
    private String icon;
    /**
    * 排序
    */
    @Column(name = "order_num")
    private Integer orderNum;
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
