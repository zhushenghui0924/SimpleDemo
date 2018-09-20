package com.sf.system.service;

import com.sf.common.model.Tree;
import com.sf.common.tools.BaseService;
import com.sf.system.model.Dept;

import java.util.List;
import java.util.Map;

/**
 * 部门管理
 */
public interface DeptService extends BaseService<Dept> {
	

	List<Dept> list(Map<String, Object> map);
	

	Tree<Dept> getTree();
	
	boolean checkDeptHasUser(Long deptId);
}
