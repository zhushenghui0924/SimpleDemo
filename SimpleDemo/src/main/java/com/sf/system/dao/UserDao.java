package com.sf.system.dao;

import com.sf.common.Bean.BootStrapTableQueryBean;
import com.sf.common.tools.BaseDao;
import com.sf.system.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;


/**
 */
public interface UserDao extends BaseDao<User> {

	List<User> list(Map<String,Object> map);

	Long[] listAllDept();

	@Select({"<script>"+
			"SELECT * FROM sys_user",
				"<where>",
					"<if test='bean.search.searchConditionJson!=null'>",
						"<foreach item=\"ent\"  index=\"key\" collection=\"bean.search.searchConditionJson\">",
						"AND ${key} LIKE CONCAT('%',#{ent},'%')",
						"</foreach> ",
					"</if>",
				"</where>",
			"</script>"})
	@Results({@Result(property = "userId", column = "user_id"),
			@Result(property = "username", column = "username"),
			@Result(property = "name", column = "name"),
			@Result(property = "password", column = "password"),
			@Result(property = "salt", column = "salt"),
			@Result(property = "organizationCode", column = "organization_code"),
			@Result(property = "department", column = "department"),
			@Result(property = "position", column = "position"),
			@Result(property = "email", column = "email"),
			@Result(property = "expenseType", column = "expense_type"),
			@Result(property = "mobile", column = "mobile"),
			@Result(property = "status", column = "status"),
			@Result(property = "userIdCreate", column = "user_id_create"),
			@Result(property = "sex", column = "sex"),
			@Result(property = "birth", column = "birth"),
			@Result(property = "picId", column = "pic_id"),
			@Result(property = "hobby", column = "hobby"),
			@Result(property = "province", column = "province"),
			@Result(property = "city", column = "city"),
			@Result(property = "district", column = "district"),
			@Result(property = "remark", column = "remark"),
			@Result(property = "createBy", column = "create_by"),
			@Result(property = "createTime", column = "create_time"),
			@Result(property = "updateBy", column = "update_by"),
			@Result(property = "updateTime", column = "update_time"),
			@Result(property = "remark", column = "remark"),
			@Result(property = "roles", javaType = List.class, column = "user_id",
					many = @Many(select = "com.sf.system.dao.RoleDao.findRoles"))})
	List<User> getUsers(@Param("bean") BootStrapTableQueryBean bootStrapTableQueryBean);

}
