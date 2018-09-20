package com.sf.system.dao;

import com.sf.common.tools.BaseDao;
import com.sf.system.model.Menu;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 菜单管理
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-10-03 09:45:09
 */
@Mapper
public interface MenuDao extends BaseDao<Menu> {

	List<Menu> list(Map<String,Object> map);

	int batchRemove(Long[] menuIds);
	
	List<Menu> listMenuByUserId(Long id);
	
	List<String> listUserPerms(Long id);
}
