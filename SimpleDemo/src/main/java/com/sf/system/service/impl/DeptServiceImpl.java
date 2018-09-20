package com.sf.system.service.impl;

import com.sf.common.tools.BaseServiceImpl;
import com.sf.system.model.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sf.common.model.Tree;
import com.sf.common.utils.BuildTree;
import com.sf.system.dao.DeptDao;
import com.sf.system.service.DeptService;



@Service
public class DeptServiceImpl extends BaseServiceImpl<Dept> implements DeptService {
	@Autowired
	private DeptDao deptDao;

	@Override
	public List<Dept> list(Map<String, Object> map){
		return deptDao.list(map);
	}

	@Override
	public Tree<Dept> getTree() {
		List<Tree<Dept>> trees = new ArrayList<Tree<Dept>>();
		List<Dept> sysDepts = deptDao.list(new HashMap<String,Object>(16));
		for (Dept sysDept : sysDepts) {
			Tree<Dept> tree = new Tree<Dept>();
			tree.setId(sysDept.getDeptId().toString());
			tree.setParentId(sysDept.getParentId().toString());
			tree.setText(sysDept.getName());
			Map<String, Object> state = new HashMap<>(16);
			state.put("opened", true);
			tree.setState(state);
			trees.add(tree);
		}
		// 默认顶级菜单为０，根据数据库实际情况调整
		Tree<Dept> t = BuildTree.build(trees);
		return t;
	}

	@Override
	public boolean checkDeptHasUser(Long deptId) {
		// TODO Auto-generated method stub
		//查询部门以及此部门的下级部门
		int result = deptDao.getDeptUserNumber(deptId);
		return result==0?true:false;
	}

}
