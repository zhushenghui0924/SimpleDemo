package com.sf.common.tools;

import java.util.List;

/**
 * 通用Service
 */
public interface BaseService<T> {
    /**
     * 查询全部
     * @return
     */
    List<T> listAll();
    /**
     * 根据实体类中的不为空属性查询 条件是=
     * @param entity
     * @return
     */
    List<T> list(T entity);

    /**
     * 根据指定字段模糊查询
     * @param entity 实体
     * @param searchColumn 查询字段名
     * @param searchValue  字段值
     * @param isDateType 是否是时间类型字段
     * @return
     */
    List<T> like(T entity,String searchColumn,String searchValue,Boolean isDateType,String orderBy);

    /**
     * 获取对象
     * @param entity
     * @return
     */
    T get(T entity);

    /**
     * 通过id获取对象
     * @param id
     * @return
     */
    T getById(Long id);

    /**
     * 更新对象不为空的字段
     * @param entity
     * @return
     */
    int update(T entity);

    /**
     * 保存对象
     * @param entity
     * @return
     */
    int save(T entity);

    /**
     * 删除对象
     * @param entity
     * @return
     */
    int delete(T entity);

    /**
     * 通过主键删除
     * @param id
     * @return
     */
    int deleteById(Long id);

    /**
     * 根据实体获取总数
     * @param entity
     * @return
     */
    int count(T entity);
    /**
     * 批量删除
     */
    int batchRemove(String ids);
}
