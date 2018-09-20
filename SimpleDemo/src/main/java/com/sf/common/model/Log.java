package com.sf.common.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;



/**
 * 系统日志
 */
@Data
@Table(name = "sys_log")
public class Log implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * ID
	 */
	@Id
	@Column(name = "id")
	@GeneratedValue(generator = "JDBC")
	private Long id;
	/**
	 * 	用户id
	 */
	@Column(name = "user_id")
	private Long userId;
	/**
	 * 	用户名
	 */
	@Column(name = "username")
	private String username;
	/**
	 * 	用户操作
	 */
	@Column(name = "operation")
	private String operation;
	/**
	 * 	响应时间
	 */
	@Column(name = "response_time")
	private Integer responseTime;
	/**
	 * 	请求方法
	 */
	@Column(name = "method")
	private String method;
	/**
	 * 	请求参数
	 */
	@Column(name = "params")
	private String params;
	/**
	 * 	IP地址
	 */
	@Column(name = "ip")
	private String ip;
	/**
	 * 	创建时间
	 */
	@Column(name = "create_time")
	private Date createTime;
}
