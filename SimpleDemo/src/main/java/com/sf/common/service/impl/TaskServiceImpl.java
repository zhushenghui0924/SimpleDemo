package com.sf.common.service.impl;

import com.sf.common.config.Constant;
import com.sf.common.dao.TaskDao;
import com.sf.common.model.ScheduleJob;
import com.sf.common.model.Task;
import com.sf.common.quartz.utils.QuartzManager;
import com.sf.common.service.TaskService;
import com.sf.common.tools.BaseServiceImpl;
import com.sf.common.utils.ScheduleJobUtils;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl extends BaseServiceImpl<Task> implements TaskService {

	@Autowired
	private TaskDao taskDao;

	@Autowired
	QuartzManager quartzManager;


	@Override
	public void initSchedule() throws SchedulerException {
		// 这里获取任务信息数据
		List<Task> jobList = taskDao.selectAll();
		for (Task scheduleJob : jobList) {
			if ("1".equals(scheduleJob.getJobStatus())) {
				ScheduleJob job = ScheduleJobUtils.entityToData(scheduleJob);
				quartzManager.addJob(job);
			}

		}
	}

	@Override
	public void changeStatus(Long jobId, String cmd) throws SchedulerException {
		Task scheduleJob = taskDao.selectByPrimaryKey(jobId);
		if (scheduleJob == null) {
			return;
		}
		if (Constant.STATUS_RUNNING_STOP.equals(cmd)) {
			quartzManager.deleteJob(ScheduleJobUtils.entityToData(scheduleJob));
			scheduleJob.setJobStatus(ScheduleJob.STATUS_NOT_RUNNING);
		} else {
			if (!Constant.STATUS_RUNNING_START.equals(cmd)) {
			} else {
                scheduleJob.setJobStatus(ScheduleJob.STATUS_RUNNING);
                quartzManager.addJob(ScheduleJobUtils.entityToData(scheduleJob));
            }
		}
		update(scheduleJob);
	}

	@Override
	public void updateCron(Long jobId) throws SchedulerException {
		Task scheduleJob = taskDao.selectByPrimaryKey(jobId);
		if (scheduleJob == null) {
			return;
		}
		if (ScheduleJob.STATUS_RUNNING.equals(scheduleJob.getJobStatus())) {
			quartzManager.updateJobCron(ScheduleJobUtils.entityToData(scheduleJob));
		}
		update(scheduleJob);
	}

}
