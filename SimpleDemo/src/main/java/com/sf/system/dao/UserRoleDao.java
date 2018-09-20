package com.sf.system.dao;

import com.sf.common.tools.BaseDao;
import com.sf.system.model.UserRole;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 用户与角色对应关系
 */
@Mapper
public interface UserRoleDao extends BaseDao<UserRole> {

	List<Long> listRoleId(Long userId);

	int batchSave(List<UserRole> list);

	int batchRemoveByUserId(Long[] ids);
}
