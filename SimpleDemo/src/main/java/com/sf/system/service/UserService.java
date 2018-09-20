package com.sf.system.service;

import com.sf.common.model.Tree;
import com.sf.common.tools.BaseService;
import com.sf.system.model.Dept;
import com.sf.system.model.User;
import com.sf.system.vo.UserVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;
import java.util.Set;

@Service
public interface UserService extends BaseService<User> {
	User get(Long id);

	int save(User user);

	int update(User user);

	int remove(Long userId);

	int batchremove(String userIds);

	boolean exit(Map<String, Object> params);

	Set<String> listRoles(Long userId);

	int resetPwd(UserVO userVO, User user) throws Exception;
	int adminResetPwd(UserVO userVO) throws Exception;
	Tree<Dept> getTree();

	/**
	 * 更新个人信息
	 * @param user
	 * @return
	 */
	int updatePersonal(User user);

	/**
	 * 更新个人图片
	 * @param file 图片
	 * @param avatar_data 裁剪信息
	 * @param userId 用户ID
	 * @throws Exception
	 */
    Map<String, Object> updatePersonalImg(MultipartFile file, String avatar_data, Long userId) throws Exception;
}
