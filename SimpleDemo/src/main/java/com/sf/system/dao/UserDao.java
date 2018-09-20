package com.sf.system.dao;

import com.sf.common.tools.BaseDao;
import com.sf.system.model.User;

import java.util.List;
import java.util.Map;


/**
 */
public interface UserDao extends BaseDao<User> {

	List<User> list(Map<String,Object> map);
	
	Long[] listAllDept();

}
