package com.sf.system.service.impl;

import com.sf.common.Bean.BootStrapTableQueryBean;
import com.sf.common.config.BootdoConfig;
import com.sf.common.model.FileDO;
import com.sf.common.model.Tree;
import com.sf.common.service.FileService;
import com.sf.common.tools.BaseServiceImpl;
import com.sf.common.utils.*;
import com.sf.system.dao.DeptDao;
import com.sf.system.dao.UserDao;
import com.sf.system.dao.UserRoleDao;
import com.sf.system.model.Dept;
import com.sf.system.model.User;
import com.sf.system.model.UserRole;
import com.sf.system.service.UserService;
import com.sf.system.vo.UserVO;
import org.apache.commons.lang.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.*;

//@CacheConfig(cacheNames = "user")
@Transactional
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Autowired
    UserDao userDao;
    @Autowired
    UserRoleDao userRoleDao;
    @Autowired
    DeptDao deptDao;
    @Autowired
    private FileService fileService;
    @Autowired
    private BootdoConfig bootdoConfig;
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Override
//    @Cacheable(key = "#id")
    public User get(Long id) {
        List<Long> roleIds = userRoleDao.listRoleId(id);
        User user = userDao.selectByPrimaryKey(id);
        user.setDeptName(deptDao.selectByPrimaryKey(user.getDeptId()).getName());
        user.setRoleIds(roleIds);
        return user;
    }

    @Override
    public List<User> getUsers(BootStrapTableQueryBean bootStrapTableQueryBean) {
        return userDao.getUsers(bootStrapTableQueryBean);
    }

    @Transactional
    @Override
    public int save(User user) {
        int count = userDao.insertSelective(user);
        Long userId = user.getUserId();
        List<Long> roles = user.getRoleIds();
//        Example example = new Example(UserRole.class);
//        example.createCriteria().andEqualTo("userId",userId);
//        userRoleDao.deleteByExample(example);
//        userRoleDao.removeByUserId(userId);
        List<UserRole> list = new ArrayList<>();
        for (Long roleId : roles) {
            UserRole ur = new UserRole();
            ur.setUserId(userId);
            ur.setRoleId(roleId);
            list.add(ur);
        }
        if (list.size() > 0) {
            userRoleDao.batchSave(list);
        }
        return count;
    }

    @Override
    public int update(User user) {
        int r = userDao.updateByPrimaryKeySelective(user);
        Long userId = user.getUserId();
        List<Long> roles = user.getRoleIds();
        Example example = new Example(UserRole.class);
        example.createCriteria().andEqualTo("userId",userId);
        userRoleDao.deleteByExample(example);
//        userRoleDao.removeByUserId(userId);
        List<UserRole> list = new ArrayList<>();
        for (Long roleId : roles) {
            UserRole ur = new UserRole();
            ur.setUserId(userId);
            ur.setRoleId(roleId);
            list.add(ur);
        }
        if (list.size() > 0) {
            userRoleDao.batchSave(list);
        }
        return r;
    }

    @Override
    public int remove(Long userId) {
        Example example = new Example(UserRole.class);
        example.createCriteria().andEqualTo("userId",userId);
        userRoleDao.deleteByExample(example);
        return userDao.deleteByPrimaryKey(userId);
    }

    @Override
    public boolean exit(Map<String, Object> params) {
        boolean exit;
        exit = userDao.list(params).size() > 0;
        return exit;
    }

    @Override
    public Set<String> listRoles(Long userId) {
        return null;
    }

    @Override
    public int resetPwd(UserVO userVO, User user) throws Exception {
        if (Objects.equals(userVO.getUser().getUserId(), user.getUserId())) {
            if (Objects.equals(MD5Utils.encrypt(user.getUsername(), userVO.getPwdOld()), user.getPassword())) {
                user.setPassword(MD5Utils.encrypt(user.getUsername(), userVO.getPwdNew()));
                return userDao.updateByPrimaryKeySelective(user);
            } else {
                throw new Exception("输入的旧密码有误！");
            }
        } else {
            throw new Exception("你修改的不是你登录的账号！");
        }
    }

    @Override
    public int adminResetPwd(UserVO userVO) throws Exception {
        User user = get(userVO.getUser().getUserId());
        if ("admin".equals(user.getUsername())) {
            throw new Exception("超级管理员的账号不允许直接重置！");
        }
        user.setPassword(MD5Utils.encrypt(user.getUsername(), userVO.getPwdNew()));
        return userDao.updateByPrimaryKeySelective(user);


    }

    @Transactional
    @Override
    public int batchremove(String userIds) {
        int count = userDao.deleteByIds(userIds);
        userRoleDao.deleteByIds(userIds);
        return count;
    }

    @Override
    public Tree<Dept> getTree() {
        List<Tree<Dept>> trees = new ArrayList<Tree<Dept>>();
        List<Dept> depts = deptDao.list(new HashMap<String, Object>(16));
        Long[] pDepts = deptDao.listParentDept();
        Long[] uDepts = userDao.listAllDept();
        Long[] allDepts = (Long[]) ArrayUtils.addAll(pDepts, uDepts);
        for (Dept dept : depts) {
            if (!ArrayUtils.contains(allDepts, dept.getDeptId())) {
                continue;
            }
            Tree<Dept> tree = new Tree<Dept>();
            tree.setId(dept.getDeptId().toString());
            tree.setParentId(dept.getParentId().toString());
            tree.setText(dept.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "dept");
            tree.setState(state);
            trees.add(tree);
        }
        List<User> users = userDao.list(new HashMap<String, Object>(16));
        for (User user : users) {
            Tree<Dept> tree = new Tree<Dept>();
            tree.setId(user.getUserId().toString());
            tree.setParentId(user.getDeptId().toString());
            tree.setText(user.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "user");
            tree.setState(state);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<Dept> t = BuildTree.build(trees);
        return t;
    }

    @Override
    public int updatePersonal(User user) {
        return userDao.updateByPrimaryKeySelective(user);
    }

    @Override
    public Map<String, Object> updatePersonalImg(MultipartFile file, String avatar_data, Long userId) throws Exception {
        String fileName = file.getOriginalFilename();
        fileName = FileUtil.renameToUUID(fileName);
        FileDO sysFile = new FileDO(FileType.fileType(fileName), "/files/" + fileName, fileName,new Date());
        //获取图片后缀
        String prefix = fileName.substring((fileName.lastIndexOf(".") + 1));
        String[] str = avatar_data.split(",");
        //获取截取的x坐标
        int x = (int) Math.floor(Double.parseDouble(str[0].split(":")[1]));
        //获取截取的y坐标
        int y = (int) Math.floor(Double.parseDouble(str[1].split(":")[1]));
        //获取截取的高度
        int h = (int) Math.floor(Double.parseDouble(str[2].split(":")[1]));
        //获取截取的宽度
        int w = (int) Math.floor(Double.parseDouble(str[3].split(":")[1]));
        //获取旋转的角度
        int r = Integer.parseInt(str[4].split(":")[1].replaceAll("}", ""));
        try {
            BufferedImage cutImage = ImageUtils.cutImage(file, x, y, w, h, prefix);
            BufferedImage rotateImage = ImageUtils.rotateImage(cutImage, r);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            boolean flag = ImageIO.write(rotateImage, prefix, out);
            //转换后存入数据库
            byte[] b = out.toByteArray();
            FileUtil.uploadFile(b, bootdoConfig.getUploadPath(), fileName);
        } catch (Exception e) {
            throw new Exception("图片裁剪错误！！");
        }
        Map<String, Object> result = new HashMap<>();
        if (fileService.save(sysFile) > 0) {
            User user = new User();
            user.setUserId(userId);
            user.setPicId(sysFile.getId());
            if (userDao.updateByPrimaryKeySelective(user) > 0) {
                result.put("url", sysFile.getUrl());
            }
        }
        return result;
    }

}
