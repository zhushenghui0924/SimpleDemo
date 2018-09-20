package com.sf.common.Bean;

import lombok.Data;

/**
 * 前台查询对象
 */
@Data
public class BootStrapTableQueryBean<T> {
    private PageBean page;

    private SearchConditionBean search;

    private T t;
}
