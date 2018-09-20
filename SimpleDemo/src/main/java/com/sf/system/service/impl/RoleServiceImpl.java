package com.sf.system.service.impl;

import com.sf.common.tools.BaseServiceImpl;
import com.sf.system.dao.RoleDao;
import com.sf.system.dao.RoleMenuDao;
import com.sf.system.dao.UserDao;
import com.sf.system.dao.UserRoleDao;
import com.sf.system.model.Role;
import com.sf.system.model.RoleMenu;
import com.sf.system.model.UserRole;
import com.sf.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {

    public static final String ROLE_ALL_KEY = "\"role_all\"";

    public static final String DEMO_CACHE_NAME = "role";

    @Autowired
    RoleDao roleDao;
    @Autowired
    RoleMenuDao roleMenuDao;
    @Autowired
    UserDao userMapper;
    @Autowired
    UserRoleDao userRoleDao;

    @Override
    public List<Role> list(Long userId) {
        List<Long> rolesIds = userRoleDao.listRoleId(userId);
        List<Role> roles = roleDao.selectAll();
        for (Role role : roles) {
            role.setRoleSign("false");
            for (Long roleId : rolesIds) {
                if (Objects.equals(role.getRoleId(), roleId)) {
                    role.setRoleSign("true");
                    break;
                }
            }
        }
        return roles;
    }
    @Transactional
    @Override
    public int save(Role role) {
        int count = roleDao.insertSelective(role);
        List<Long> menuIds = role.getMenuIds();
        Long roleId = role.getRoleId();
        List<RoleMenu> rms = new ArrayList<>();
        for (Long menuId : menuIds) {
            RoleMenu rmDo = new RoleMenu();
            rmDo.setRoleId(roleId);
            rmDo.setMenuId(menuId);
            rms.add(rmDo);
        }
        Example example = new Example(RoleMenu.class);
        example.createCriteria().andEqualTo("roleId",roleId);
        roleMenuDao.deleteByExample(example);
//        roleMenuDao.removeByRoleId(roleId);
        if (rms.size() > 0) {
            roleMenuDao.batchSave(rms);
        }
        return count;
    }

    @Transactional
    @Override
    public int remove(Long id) {
        int count = roleDao.deleteByPrimaryKey(id);
        Example example = new Example(UserRole.class);
        example.createCriteria().andEqualTo("roleId",id);
        userRoleDao.deleteByExample(example);
//        userRoleDao.removeByRoleId(id);
        Example example2 = new Example(RoleMenu.class);
        example2.createCriteria().andEqualTo("roleId",id);
        roleMenuDao.deleteByExample(example2);
//        roleMenuDao.removeByRoleId(id);
        return count;
    }

    @Override
    public int update(Role role) {
        int r = roleDao.updateByPrimaryKeySelective(role);
        List<Long> menuIds = role.getMenuIds();
        Long roleId = role.getRoleId();
        Example example = new Example(RoleMenu.class);
        example.createCriteria().andEqualTo("roleId",roleId);
        roleMenuDao.deleteByExample(example);
//        roleMenuDao.removeByRoleId(roleId);
        List<RoleMenu> rms = new ArrayList<>();
        for (Long menuId : menuIds) {
            RoleMenu rmDo = new RoleMenu();
            rmDo.setRoleId(roleId);
            rmDo.setMenuId(menuId);
            rms.add(rmDo);
        }
        if (rms.size() > 0) {
            roleMenuDao.batchSave(rms);
        }
        return r;
    }

}
