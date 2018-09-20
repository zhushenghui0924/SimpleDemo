package com.sf.system.service;

import java.util.Collection;
import java.util.List;

import com.sf.system.model.User;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import com.sf.system.model.UserOnline;

@Service
public interface SessionService {
	List<UserOnline> list();

	List<User> listOnlineUser();

	Collection<Session> sessionList();
	
	boolean forceLogout(String sessionId);
}
