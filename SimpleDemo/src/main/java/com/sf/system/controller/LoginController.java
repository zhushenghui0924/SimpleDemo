package com.sf.system.controller;

import com.sf.common.annotation.Log;
import com.sf.common.controller.BaseController;
import com.sf.common.model.FileDO;
import com.sf.common.model.Tree;
import com.sf.common.service.FileService;
import com.sf.common.utils.R;
import com.sf.common.utils.ShiroUtils;
import com.sf.system.model.Menu;
import com.sf.system.service.MenuService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class LoginController extends BaseController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MenuService menuService;
	@Autowired
	FileService fileService;
	@GetMapping({ "/", "" })
	String welcome(Model model) {
        if(ShiroUtils.getUser()!=null){
            return "redirect:/index";
        }
		return "redirect:/login";
	}

	@Log("请求访问主页")
	@GetMapping({ "/index" })
	String index(Model model) {
		List<Tree<Menu>> menus = menuService.listMenuTree(getUserId());
		model.addAttribute("menus", menus);
		model.addAttribute("name", getUser().getName());
		FileDO fileDO = fileService.selectById(getUser().getPicId());
		if(fileDO!=null&&fileDO.getUrl()!=null){
			if(fileService.isExist(fileDO.getUrl())){
				model.addAttribute("picUrl",fileDO.getUrl());
			}else {
				model.addAttribute("picUrl","/img/head_img.png");
			}
		}else {
			model.addAttribute("picUrl","/img/head_img.png");
		}
		model.addAttribute("username", getUser().getUsername());
		return "index_v1";
	}

	@GetMapping("/login")
	String login() {
		return "login";
	}

	@Log("登录")
	@PostMapping("/userLogin")
	@ResponseBody
	R ajaxLogin(String username, String password,String verifyCode, HttpServletRequest request) {
		Session session = SecurityUtils.getSubject().getSession();
		//转化成小写字母
		String v = verifyCode.toLowerCase();
		String v2 = (String) session.getAttribute("verifyCode");
		if(StringUtils.isBlank(v)){
			return R.error("验证码不能为空");
		}else if(!v.equals(v2)){
			return R.error("验证码错误");
		}
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.login(token);
			return R.ok();
		} catch (AuthenticationException e) {
			return R.error("用户或密码错误");
		}
	}

	@GetMapping("/logout")
	String logout() {
		ShiroUtils.logout();
		return "redirect:/login";
	}

	@GetMapping("/main")
	String main() {
		return "main";
	}

}
