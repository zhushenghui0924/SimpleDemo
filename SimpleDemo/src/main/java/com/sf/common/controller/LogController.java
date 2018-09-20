package com.sf.common.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sf.common.model.Log;
import com.sf.common.service.LogService;
import com.sf.common.Bean.BootStrapTableQueryBean;
import com.sf.common.utils.PageUtils;
import com.sf.common.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;


@RequestMapping("/common/log")
@Controller
public class LogController {
	@Autowired
	LogService logService;
	String prefix = "common/log";

	/**
	 * 去日志页
	 * @return
	 */
	@GetMapping()
	String log() {
		return prefix + "/log";
	}

	@ResponseBody
	@PostMapping("/list")
	PageUtils list(@RequestBody BootStrapTableQueryBean bootStrapTableQueryBean, Log log) {
		//使用分页插件,核心代码就这一行
		PageHelper.offsetPage(bootStrapTableQueryBean.getPage().getOffset(), bootStrapTableQueryBean.getPage().getLimit());
		//字段非模糊查询
//		if(StringUtils.isNotBlank(params.get("searchValue").toString())&&StringUtils.isNotBlank(params.get("searchColumn").toString())){
//			ReflectGetSet.invokeSet(dict,bootStrapTableQueryBean.getSearch().getSearchColumn(),bootStrapTableQueryBean.getSearch().getSearchValue());
//		}
//		List<Dict> dictList = dictService.list(dict);
		// 字段模糊查询
		List<Log> logList = logService.like(log, bootStrapTableQueryBean.getSearch().getSearchColumn(), bootStrapTableQueryBean.getSearch().getSearchValue(), bootStrapTableQueryBean.getSearch().getDateType(), bootStrapTableQueryBean.getSearch().getOrderBy());
		PageUtils pageUtils = new PageUtils(new PageInfo<>(logList));
		return pageUtils;
	}
	
	@ResponseBody
	@PostMapping("/remove")
	R remove(Long id) {
		if (logService.deleteById(id)>0) {
			return R.ok();
		}
		return R.error();
	}
}
