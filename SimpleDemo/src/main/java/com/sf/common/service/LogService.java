package com.sf.common.service;

import com.sf.common.model.Log;
import com.sf.common.tools.BaseService;
/**
 * 系统日志
 * 
 * @author zhuShengHui
 * @email zhushenghui0924@hotmail.com
 * @date 2018-09-03 11:40:25
 */
public interface LogService extends BaseService<Log>{

    public void logSave(Log log);
}
