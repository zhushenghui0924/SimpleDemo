package com.sf.system.dao;

import com.sf.common.tools.BaseDao;
import com.sf.system.model.Dept;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 部门管理
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-10-03 15:35:39
 */
@Mapper
public interface DeptDao extends BaseDao<Dept> {

	List<Dept> list(Map<String,Object> map);
	
	Long[] listParentDept();
	
	int getDeptUserNumber(Long deptId);
}
