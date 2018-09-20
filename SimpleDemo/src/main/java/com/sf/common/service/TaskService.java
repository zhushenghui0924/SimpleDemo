package com.sf.common.service;

import com.sf.common.model.Task;

import java.util.List;
import java.util.Map;

import com.sf.common.tools.BaseService;
import org.quartz.SchedulerException;

/**
 * 任务调度
 */
public interface TaskService extends BaseService<Task> {
	void initSchedule() throws SchedulerException;

	void changeStatus(Long jobId, String cmd) throws SchedulerException;

	void updateCron(Long jobId) throws SchedulerException;
}
