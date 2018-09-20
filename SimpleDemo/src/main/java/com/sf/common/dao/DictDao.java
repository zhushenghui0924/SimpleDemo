package com.sf.common.dao;

import com.sf.common.model.Dict;
import com.sf.common.tools.BaseDao;

/**
 * 字典表
 */
public interface DictDao extends BaseDao<Dict> {
	/**
	 * 批量删除
	 * @param ids id数组
	 * @return
	 */
	int batchRemove(Long[] ids);
}
