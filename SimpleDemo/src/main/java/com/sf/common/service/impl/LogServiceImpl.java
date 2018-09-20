package com.sf.common.service.impl;

import com.sf.common.dao.LogDao;
import com.sf.common.model.Log;
import com.sf.common.service.LogService;
import com.sf.common.tools.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl extends BaseServiceImpl<Log> implements LogService {
	@Autowired
	LogDao logDao;

	@Async
	@Override
	public void logSave(Log log) {
		logDao.insertSelective(log);
	}

}
