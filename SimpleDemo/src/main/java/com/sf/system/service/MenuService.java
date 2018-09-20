package com.sf.system.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.sf.common.tools.BaseService;
import com.sf.system.model.Menu;
import org.springframework.stereotype.Service;

import com.sf.common.model.Tree;

@Service
public interface MenuService extends BaseService<Menu> {
	Tree<Menu> getSysMenuTree(Long id);

	List<Tree<Menu>> listMenuTree(Long id);

	Tree<Menu> getTree();

	Tree<Menu> getTree(Long id);

	List<Menu> list(Map<String, Object> params);

	Set<String> listPerms(Long userId);
}
