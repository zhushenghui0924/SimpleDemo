package com.sf.common.aspect;

import com.sf.common.utils.ShiroUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 对数据添加修改操作添加时间 人员信息
 */
@Aspect
@Component
public class DaoAspect {
    private static final String CREATEBY     = "createBy";
    private static final String UPDATEBY    = "updateBy";
    private static final String CREATETIME   = "createTime";
    private static final String UPDATETIME = "updateTime";

    //定义切点
    @Pointcut("execution(* com.sf.*.dao..*.insert*(..))\")")
    private void insert(){}

    @Pointcut("execution(* com.sf.*.dao..*.update*(..))\")")
    private void update(){}

    @Before("insert()")
    public void beforeInsert(JoinPoint jp) {
        Object[] args = jp.getArgs();
        if (args != null && args.length > 0) {
            Object argument = args[0];
            BeanWrapper beanWrapper = new BeanWrapperImpl(argument);
            // 设置创建时间
            if (beanWrapper.isWritableProperty(CREATETIME)) {
                beanWrapper.setPropertyValue(CREATETIME, new Date());
            }
            // 设置创建人
            if (beanWrapper.isWritableProperty(CREATEBY) && ShiroUtils.getUserId() != null) {
                beanWrapper.setPropertyValue(CREATEBY, ShiroUtils.getUserId());
            }
        }
    }

    @Before("update()")
    public void beforeUpdate(JoinPoint jp) {
        Object[] args = jp.getArgs();
        if (args != null && args.length > 0) {
            Object argument = args[0];
            BeanWrapper beanWrapper = new BeanWrapperImpl(argument);
            // 设置修改时间
            if (beanWrapper.isWritableProperty(UPDATETIME)) {
                beanWrapper.setPropertyValue(UPDATETIME, new Date());
            }
            // 设置修改人
            if (beanWrapper.isWritableProperty(UPDATEBY) && ShiroUtils.getUserId() != null) {
                beanWrapper.setPropertyValue(UPDATEBY, ShiroUtils.getUserId());
            }
        }
    }
}
