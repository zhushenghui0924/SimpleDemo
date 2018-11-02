package com.sf.common.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sf.common.model.Dict;
import com.sf.common.service.DictService;
import com.sf.common.Bean.BootStrapTableQueryBean;
import com.sf.common.utils.PageUtils;
import com.sf.common.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 字典表
 */

@Controller
@RequestMapping("/common/dict")
public class DictController extends BaseController {
	@Autowired
	private DictService dictService;

	/**
	 * 去数据页
	 * @return
	 */
	@GetMapping()
	@RequiresPermissions("common:dict:dict")
	String dict() {
		return "common/dict/dict";
	}

	/**
	 * 获取表格数据
	 * @param bootStrapTableQueryBean 前端查询对象
	 * @param dict 对应实体
	 * @return
	 */
	@ResponseBody
	@PostMapping("/list")
	@RequiresPermissions("common:dict:dict")
	public PageUtils list(@RequestBody BootStrapTableQueryBean bootStrapTableQueryBean, Dict dict){
		//使用分页插件,核心代码就这一行
		PageHelper.offsetPage(bootStrapTableQueryBean.getPage().getOffset(), bootStrapTableQueryBean.getPage().getLimit());
		// 字段模糊查询
		List<Dict> dictList = dictService.like(dict, bootStrapTableQueryBean);
		PageUtils pageUtils = new PageUtils(new PageInfo<>(dictList));
		return pageUtils;
	}

	/**
	 * 去新增页
	 * @return
	 */
	@GetMapping("/add")
	@RequiresPermissions("common:dict:add")
	String add() {
		return "common/dict/add";
	}

	/**
	 * 去编辑页
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("/edit/{id}")
	@RequiresPermissions("common:dict:edit")
	String edit(@PathVariable("id") Long id, Model model) {
		Dict dict = dictService.selectById(id);
		model.addAttribute("dict", dict);
		return "common/dict/edit";
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("common:dict:add")
	public R save(Dict dict) {
		if (dictService.save(dict) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("common:dict:edit")
	public R update(Dict dict) {
		dictService.update(dict);
		return R.ok();
	}

	/**
	 * 删除
	 */
	@PostMapping("/remove")
	@ResponseBody
	@RequiresPermissions("common:dict:remove")
	public R remove(Long id) {
		if (dictService.deleteById(id) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 批量删除
	 */
	@PostMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("common:dict:batchRemove")
	public R remove(@RequestParam("ids[]") String ids) {
		dictService.batchRemove(ids);
		return R.ok();
	}

	/**
	 * 添加已有类型 描述的字典
	 * @param model
	 * @param type 类型
	 * @param description 描述
	 * @return
	 */
	@GetMapping("/add/{type}/{description}")
	@RequiresPermissions("common:dict:add")
	String addD(Model model, @PathVariable("type") String type, @PathVariable("description") String description) {
		model.addAttribute("type", type);
		model.addAttribute("description", description);
		return "common/dict/add";
	}
}
