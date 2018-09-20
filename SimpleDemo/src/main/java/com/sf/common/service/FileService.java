package com.sf.common.service;

import com.sf.common.model.FileDO;
import com.sf.common.tools.BaseService;

import java.util.List;
import java.util.Map;

/**
 * 文件上传
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-19 16:02:20
 */
public interface FileService extends BaseService<FileDO> {

	List<FileDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	/**
	 * 判断一个文件是否存在
	 * @param url FileDO中存的路径
	 * @return
	 */
    Boolean isExist(String url);
}
