package com.sf.common.tools;

import com.alibaba.fastjson.JSONObject;
import com.sf.common.Bean.BootStrapTableQueryBean;
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
    public List<T> like(T entity, BootStrapTableQueryBean bootStrapTableQueryBean) {
        Example example = new Example(entity.getClass());
        Example.Criteria criteria = example.createCriteria();
        //如果排序字段不为空则添加排序规则
        String orderBy = bootStrapTableQueryBean.getSearch().getOrderBy();
        JSONObject jsonObject = bootStrapTableQueryBean.getSearch().getSearchConditionJson();
        if(StringUtils.isNotBlank(orderBy)){
            example.orderBy(orderBy);
        }
        if(jsonObject==null){
            return baseDao.selectByExample(example);
        }
        jsonObject.forEach((searchColumn,searchValue)->{
            if(searchValue!=null&&StringUtils.isNotBlank(searchValue.toString())) {
                if (searchColumn.toLowerCase().contains("time".toLowerCase())) {
                    String[] dateTime = searchValue.toString().split("~");
                    criteria.andBetween(searchColumn, dateTime[0] + " 00:00:00", dateTime[1] + " 23:59:59");
                } else {
                    criteria.andLike(searchColumn, "%" + searchValue + "%");
                }
            }
        });
        return baseDao.selectByExample(example);
    }

    @Override
    public T select(T entity) {
        return  baseDao.selectOne(entity);
    }

    @Override
    public T selectById(Long id) {
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

    @Override
    public List<T> selectExample(Example example) {
        return baseDao.selectByExample(example);
    }

    @Override
    public T selectOneExample(Example example) {
        return baseDao.selectOneByExample(example);
    }

    @Override
    public List<T> selectByIds(String ids) {
        return baseDao.selectByIds(ids);
    }

    @Override
    public int updateByExample(T t,Example example) {
        return baseDao.updateByExample(t, example);
    }
}
