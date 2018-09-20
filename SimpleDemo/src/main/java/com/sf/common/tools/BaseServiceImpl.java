package com.sf.common.tools;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 主要用途：通用Service 常用的CRUD方法
 */
public class BaseServiceImpl<T> implements BaseService<T> {

    @Autowired
    private BaseDao<T> baseDao;

    @Override
    public List<T> listAll() {
        return baseDao.selectAll();
    }

    @Override
    public List<T> list(T entity) {
        return baseDao.select(entity);
    }

    @Override
    public List<T> like(T entity, String searchColumn, String searchValue,Boolean isDateType,String orderBy) {
        Example example = new Example(entity.getClass());
        //如果排序字段不为空则添加排序规则
        if(StringUtils.isNotBlank(orderBy)){
            example.orderBy(orderBy);
        }
        if(StringUtils.isBlank(searchColumn)&&StringUtils.isBlank(searchValue)){
            return baseDao.selectByExample(example);
        }
        if(isDateType){
            String [] dateTime = searchValue.split("~");
            example.createCriteria().andBetween(searchColumn,dateTime[0]+" 00:00:00",dateTime[1]+" 23:59:59");
        }else{
            example.createCriteria().andLike(searchColumn,"%"+searchValue+"%");
        }
        return baseDao.selectByExample(example);
    }

    @Override
    public T get(T entity) {
        return  baseDao.selectOne(entity);
    }

    @Override
    public T getById(Long id) {
        return baseDao.selectByPrimaryKey(id);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Exception.class)
    public int update(T entity) {
        return baseDao.updateByPrimaryKeySelective(entity);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Exception.class)
    public int save(T entity) {
        return baseDao.insertSelective(entity);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Exception.class)
    public int delete(T entity) {
        return baseDao.deleteByPrimaryKey(entity);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Exception.class)
    public int deleteById(Long id) {
        return baseDao.deleteByPrimaryKey(id);
    }

    @Override
    public int count(T entity) {
        return baseDao.selectCount(entity);
    }

    @Override
    public int batchRemove(String ids) {
        return baseDao.deleteByIds(ids);
    }
}
