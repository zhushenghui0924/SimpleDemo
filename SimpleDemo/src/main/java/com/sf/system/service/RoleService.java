package com.sf.system.service;

import com.sf.common.tools.BaseService;
import com.sf.system.model.Role;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoleService extends BaseService<Role> {

	List<Role> list(Long userId);

	int remove(Long id);
}
