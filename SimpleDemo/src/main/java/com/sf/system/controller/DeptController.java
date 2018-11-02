package com.sf.system.controller;

import com.sf.common.config.Constant;
import com.sf.common.controller.BaseController;
import com.sf.common.model.Tree;
import com.sf.common.utils.R;
import com.sf.system.model.Dept;
import com.sf.system.service.DeptService;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门管理
 */

@Controller
@RequestMapping("/sys/dept")
public class DeptController extends BaseController {
	private String prefix = "system/dept";
	@Autowired
	private DeptService deptService;

	@GetMapping()
	@RequiresPermissions("sys:dept:dept")
	String dept() {
		return prefix + "/dept";
	}

	@ApiOperation(value="获取部门列表", notes="")
	@ResponseBody
	@PostMapping("/list")
	@RequiresPermissions("sys:dept:dept")
	public List<Dept> list() {
		Map<String, Object> query = new HashMap<>(16);
		List<Dept> sysDeptList = deptService.list(query);
		return sysDeptList;
	}

	@GetMapping("/add/{pId}")
	@RequiresPermissions("sys:dept:add")
	String add(@PathVariable("pId") Long pId, Model model) {
		model.addAttribute("pId", pId);
		if (pId == 0) {
			model.addAttribute("pName", "总部门");
		} else {
			model.addAttribute("pName", deptService.selectById(pId).getName());
		}
		return  prefix + "/add";
	}

	@GetMapping("/edit/{deptId}")
	@RequiresPermissions("sys:dept:edit")
	String edit(@PathVariable("deptId") Long deptId, Model model) {
		Dept sysDept = deptService.selectById(deptId);
		model.addAttribute("sysDept", sysDept);
		if(Constant.DEPT_ROOT_ID.equals(sysDept.getParentId())) {
			model.addAttribute("parentDeptName", "无");
		}else {
			Dept parDept = deptService.selectById(sysDept.getParentId());
			model.addAttribute("parentDeptName", parDept.getName());
		}
		return  prefix + "/edit";
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:dept:add")
	public R save(Dept sysDept) {
		if (deptService.save(sysDept) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("sys:dept:edit")
	public R update(Dept sysDept) {
		if (deptService.update(sysDept) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 删除
	 */
	@PostMapping("/remove")
	@ResponseBody
	@RequiresPermissions("sys:dept:remove")
	public R remove(Long deptId,Dept dept) {
		dept.setParentId(deptId);
		if(deptService.count(dept)>0) {
			return R.error(1, "包含下级部门,不允许修改");
		}
		if(deptService.checkDeptHasUser(deptId)) {
			if (deptService.deleteById(deptId) > 0) {
				return R.ok();
			}
		}else {
			return R.error(1, "部门包含用户,不允许修改");
		}
		return R.error();
	}

	/**
	 * 删除
	 */
	@PostMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:dept:batchRemove")
	public R remove(@RequestParam("ids[]")String deptIds) {
		deptService.batchRemove(deptIds);
		return R.ok();
	}

	@GetMapping("/tree")
	@ResponseBody
	public Tree<Dept> tree() {
		Tree<Dept> tree = new Tree<Dept>();
		tree = deptService.getTree();
		return tree;
	}

	@GetMapping("/treeView")
	String treeView() {
		return  prefix + "/deptTree";
	}

}
