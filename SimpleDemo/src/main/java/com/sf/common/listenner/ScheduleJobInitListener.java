package com.sf.common.listenner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.sf.common.quartz.utils.QuartzManager;
import com.sf.common.service.TaskService;

@Component
@Order(value = 1)
public class ScheduleJobInitListener implements CommandLineRunner {

	@Autowired
    TaskService scheduleTaskService;

	@Autowired
	QuartzManager quartzManager;

	@Override
	public void run(String... arg0) throws Exception {
		try {
			scheduleTaskService.initSchedule();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}