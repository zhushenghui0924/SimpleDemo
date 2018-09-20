package com.sf.common.controller;

import com.sf.system.model.User;
import org.springframework.stereotype.Controller;
import com.sf.common.utils.ShiroUtils;

@Controller
public class BaseController {
	public User getUser() {
		return ShiroUtils.getUser();
	}

	public Long getUserId() {
		return getUser().getUserId();
	}

	public String getUsername() {
		return getUser().getUsername();
	}
}