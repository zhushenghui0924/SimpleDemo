package com.sf.system.dao;

import com.sf.common.tools.BaseDao;
import com.sf.system.model.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 角色
 */
@Mapper
public interface RoleDao extends BaseDao<Role> {
    @Select({"SELECT * FROM sys_role AS SR " ,
            "WHERE SR.role_id IN " ,
            "(SELECT sur.role_id FROM sys_user_role AS sur WHERE sur.user_id=#{user_id});"})
    List<Role> findRoles(Long id);
}
