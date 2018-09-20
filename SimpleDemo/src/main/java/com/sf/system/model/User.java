package com.sf.system.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 用户
 */
@Data
@Table(name = "sys_user")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;
    /**
    * ID
    */
    @Id
    @Column(name = "user_id")
    @GeneratedValue(generator = "JDBC")
    private Long userId;
    /**
    * 用户名
    */
    @Column(name = "username")
    private String username;
    /**
    *
    */
    @Column(name = "name")
    private String name;
    /**
    * 密码
    */
    @Column(name = "password")
    private String password;
    /**
     * 盐
     */
    @Column(name = "salt")
    private String salt;
    /**
    *
    */
    @Column(name = "dept_id")
    private Long deptId;
    /**
    * 邮箱
    */
    @Column(name = "email")
    private String email;
    /**
    * 手机号
    */
    @Column(name = "mobile")
    private String mobile;
    /**
    * 状态 0:禁用，1:正常
    */
    @Column(name = "status")
    private Integer status;
    /**
    * 创建用户id
    */
    @Column(name = "user_id_create")
    private Long userIdCreate;
    /**
    * 性别
    */
    @Column(name = "sex")
    private Long sex;
    /**
    * 出身日期
    */
    @Column(name = "birth")
    private Date birth;
    /**
    *
    */
    @Column(name = "pic_id")
    private Long picId;
    /**
    * 现居住地
    */
    @Column(name = "live_address")
    private String liveAddress;
    /**
    * 爱好
    */
    @Column(name = "hobby")
    private String hobby;
    /**
    * 省份
    */
    @Column(name = "province")
    private String province;
    /**
    * 所在城市
    */
    @Column(name = "city")
    private String city;
    /**
    * 所在地区
    */
    @Column(name = "district")
    private String district;
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
     * 部门名称
     */
    @Transient
    private String deptName;
    /**
     * 所属角色
     */
    @Transient
    private List<Long> roleIds;


}
