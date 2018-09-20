package com.sf.system.dao;

import com.sf.common.tools.BaseDao;
import com.sf.system.model.RoleMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 角色与菜单对应关系
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-10-03 11:08:59
 */
@Mapper
public interface RoleMenuDao extends BaseDao<RoleMenu> {

	List<Long> listMenuIdByRoleId(Long roleId);
	
	int batchSave(List<RoleMenu> list);
}
