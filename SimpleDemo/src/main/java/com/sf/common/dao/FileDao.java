package com.sf.common.dao;

import com.sf.common.model.FileDO;
import com.sf.common.tools.BaseDao;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 文件上传
 */
public interface FileDao extends BaseDao<FileDO> {

	List<FileDO> list(Map<String,Object> map);

	int count(Map<String,Object> map);
}
