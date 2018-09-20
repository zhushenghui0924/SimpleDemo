package com.sf.system.service.impl;

import com.sf.common.model.Tree;
import com.sf.common.tools.BaseServiceImpl;
import com.sf.common.utils.BuildTree;
import com.sf.system.dao.MenuDao;
import com.sf.system.dao.RoleMenuDao;
import com.sf.system.model.Menu;
import com.sf.system.service.MenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional(readOnly = true,rollbackFor = Exception.class)
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements MenuService {
	@Autowired
	MenuDao menuDao;
	@Autowired
	RoleMenuDao roleMenuDao;

	@Override
	public List<Menu> list(Map<String, Object> params) {
		List<Menu> menus = menuDao.list(params);
		return menus;
	}

	/**
	 * @param
	 * @return 树形菜单
	 */
	@Cacheable
	@Override
	public Tree<Menu> getSysMenuTree(Long id) {
		List<Tree<Menu>> trees = new ArrayList<Tree<Menu>>();
		List<Menu> menus = menuDao.listMenuByUserId(id);
		for (Menu sysMenu : menus) {
			Tree<Menu> tree = new Tree<Menu>();
			tree.setId(sysMenu.getMenuId().toString());
			tree.setParentId(sysMenu.getParentId().toString());
			tree.setText(sysMenu.getName());
			Map<String, Object> attributes = new HashMap<>(16);
			attributes.put("url", sysMenu.getUrl());
			attributes.put("icon", sysMenu.getIcon());
			tree.setAttributes(attributes);
			trees.add(tree);
		}
		// 默认顶级菜单为０，根据数据库实际情况调整
		Tree<Menu> t = BuildTree.build(trees);
		return t;
	}



	@Override
	public Tree<Menu> getTree() {
		List<Tree<Menu>> trees = new ArrayList<Tree<Menu>>();
		List<Menu> menus = menuDao.list(new HashMap<>(16));
		for (Menu sysMenu : menus) {
			Tree<Menu> tree = new Tree<Menu>();
			tree.setId(sysMenu.getMenuId().toString());
			tree.setParentId(sysMenu.getParentId().toString());
			tree.setText(sysMenu.getName());
			trees.add(tree);
		}
		// 默认顶级菜单为０，根据数据库实际情况调整
		Tree<Menu> t = BuildTree.build(trees);
		return t;
	}

	@Override
	public Tree<Menu> getTree(Long id) {
		// 根据roleId查询权限
		List<Menu> menus = menuDao.list(new HashMap<String, Object>(16));
		List<Long> menuIds = roleMenuDao.listMenuIdByRoleId(id);
		List<Long> temp = menuIds;
		for (Menu menu : menus) {
			if (temp.contains(menu.getParentId())) {
				menuIds.remove(menu.getParentId());
			}
		}
		List<Tree<Menu>> trees = new ArrayList<Tree<Menu>>();
		List<Menu> menuDOs = menuDao.list(new HashMap<String, Object>(16));
		for (Menu sysMenu : menuDOs) {
			Tree<Menu> tree = new Tree<Menu>();
			tree.setId(sysMenu.getMenuId().toString());
			tree.setParentId(sysMenu.getParentId().toString());
			tree.setText(sysMenu.getName());
			Map<String, Object> state = new HashMap<>(16);
			Long menuId = sysMenu.getMenuId();
			if (menuIds.contains(menuId)) {
				state.put("selected", true);
			} else {
				state.put("selected", false);
			}
			tree.setState(state);
			trees.add(tree);
		}
		// 默认顶级菜单为０，根据数据库实际情况调整
		Tree<Menu> t = BuildTree.build(trees);
		return t;
	}

	@Override
	public Set<String> listPerms(Long userId) {
		List<String> perms = menuDao.listUserPerms(userId);
		Set<String> permsSet = new HashSet<>();
		for (String perm : perms) {
			if (StringUtils.isNotBlank(perm)) {
				permsSet.addAll(Arrays.asList(perm.trim().split(",")));
			}
		}
		return permsSet;
	}

	@Override
	public List<Tree<Menu>> listMenuTree(Long id) {
		List<Tree<Menu>> trees = new ArrayList<Tree<Menu>>();
		List<Menu> menus = menuDao.listMenuByUserId(id);
		for (Menu sysMenu : menus) {
			Tree<Menu> tree = new Tree<Menu>();
			tree.setId(sysMenu.getMenuId().toString());
			tree.setParentId(sysMenu.getParentId().toString());
			tree.setText(sysMenu.getName());
			Map<String, Object> attributes = new HashMap<>(16);
			attributes.put("url", sysMenu.getUrl());
			attributes.put("icon", sysMenu.getIcon());
			tree.setAttributes(attributes);
			trees.add(tree);
		}
		// 默认顶级菜单为０，根据数据库实际情况调整
		List<Tree<Menu>> list = BuildTree.buildList(trees, "0");
		return list;
	}

}
