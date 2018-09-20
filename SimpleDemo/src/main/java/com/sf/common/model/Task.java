package com.sf.common.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;


/**
 * 定时任务
 */
@Data
@Table(name = "sys_task")
public class Task implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 主键
	 */
	@Id
	@Column(name = "id")
	@GeneratedValue(generator = "JDBC")
	private Long id;
	/**
	 * 	cron表达式
	 */
	@Column(name = "cron_expression")
	private String cronExpression;
	/**
	 * 	任务调用的方法名
	 */
	@Column(name = "method_name")
	private String methodName;
	/**
	 * 	任务是否有状态
	 */
	@Column(name = "is_concurrent")
	private String isConcurrent;
	/**
	 * 	任务描述
	 */
	@Column(name = "description")
	private String description;
	/**
	 * 	任务执行时调用哪个类的方法 包名+类名
	 */
	@Column(name = "bean_class")
	private String beanClass;
	/**
	 * 	任务状态
	 */
	@Column(name = "job_status")
	private String jobStatus;
	/**
	 * 	任务分组
	 */
	@Column(name = "job_group")
	private String jobGroup;
	/**
	 * 	Spring bean
	 */
	@Column(name = "spring_bean")
	private String springBean;
	/**
	 * 	任务名
	 */
	@Column(name = "job_name")
	private String jobName;
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
