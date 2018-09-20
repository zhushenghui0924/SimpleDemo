package com.sf.common.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sf.common.model.Task;
import com.sf.common.service.TaskService;
import com.sf.common.Bean.BootStrapTableQueryBean;
import com.sf.common.utils.PageUtils;
import com.sf.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-26 20:53:48
 */
@Controller
@RequestMapping("/common/task")
public class TaskController extends BaseController{
	@Autowired
	private TaskService taskService;

	@GetMapping()
	String taskScheduleJob() {
		return "common/task/task";
	}

	@ResponseBody
	@PostMapping("/list")
	public PageUtils list(@RequestBody BootStrapTableQueryBean bootStrapTableQueryBean, Task task) {
		//使用分页插件,核心代码就这一行
		PageHelper.offsetPage(bootStrapTableQueryBean.getPage().getOffset(), bootStrapTableQueryBean.getPage().getLimit());
		//字段非模糊查询
//		if(StringUtils.isNotBlank(params.get("searchValue").toString())&&StringUtils.isNotBlank(params.get("searchColumn").toString())){
//			ReflectGetSet.invokeSet(dict,bootStrapTableQueryBean.getSearch().getSearchColumn(),bootStrapTableQueryBean.getSearch().getSearchValue());
//		}
//		List<Dict> dictList = dictService.list(dict);
		// 字段模糊查询
		List<Task> taskList = taskService.like(task, bootStrapTableQueryBean.getSearch().getSearchColumn(), bootStrapTableQueryBean.getSearch().getSearchValue(), bootStrapTableQueryBean.getSearch().getDateType(), bootStrapTableQueryBean.getSearch().getOrderBy());
		PageUtils pageUtils = new PageUtils(new PageInfo<>(taskList));
		return pageUtils;
	}

	@GetMapping("/add")
	String add() {
		return "common/task/add";
	}

	@GetMapping("/edit/{id}")
	String edit(@PathVariable("id") Long id, Model model) {
		Task job = taskService.getById(id);
		model.addAttribute("job", job);
		return "common/task/edit";
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Long id) {
		Task taskScheduleJob = taskService.getById(id);
		return R.ok().put("taskScheduleJob", taskScheduleJob);
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	public R save(Task taskScheduleJob) {
		if (taskService.save(taskScheduleJob) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 修改
	 */
	@ResponseBody
	@PostMapping("/update")
	public R update(Task taskScheduleJob) {
		taskService.update(taskScheduleJob);
		return R.ok();
	}

	/**
	 * 删除
	 */
	@PostMapping("/remove")
	@ResponseBody
	public R remove(Long id) {
		if (taskService.deleteById(id) > 0) {
			return R.ok();
		}
		return R.error();
	}

	@PostMapping(value = "/changeJobStatus")
	@ResponseBody
	public R changeJobStatus(Long id,String cmd ) {
		String label = "停止";
		if ("start".equals(cmd)) {
			label = "启动";
		} else {
			label = "停止";
		}
		try {
			taskService.changeStatus(id, cmd);
			return R.ok("任务" + label + "成功");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return R.ok("任务" + label + "失败");
	}

}
