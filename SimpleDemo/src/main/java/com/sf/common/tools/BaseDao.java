package com.sf.common.tools;

import org.springframework.data.repository.NoRepositoryBean;
import tk.mybatis.mapper.common.*;

/**
 * 通用dao
 * @param <T>
 */
@NoRepositoryBean
public interface BaseDao<T> extends Mapper<T>, ConditionMapper<T>, IdsMapper<T> ,MySqlMapper<T>{
}
