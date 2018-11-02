package com.sf.common.tools;

import com.sf.common.Bean.BootStrapTableQueryBean;
import tk.mybatis.mapper.entity.Example;

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
     * @return
     */
    List<T> like(T entity, BootStrapTableQueryBean bootStrapTableQueryBean);

    /**
     * 获取对象
     * @param entity
     * @return
     */
    T select(T entity);

    /**
     * 通过id获取对象
     * @param id
     * @return
     */
    T selectById(Long id);

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
    /**
     * 条件查询
     */
    List<T> selectExample(Example example);

    /**
     * 条件查询
     */
    T selectOneExample(Example example);

    /**
     * 条件查询
     */
    List<T> selectByIds(String ids);

    /**
     * 条件更新
     */
    int updateByExample(T t ,Example example);
}
