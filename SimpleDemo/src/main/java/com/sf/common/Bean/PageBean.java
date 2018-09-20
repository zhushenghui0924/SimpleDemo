package com.sf.common.Bean;

import lombok.Getter;
import lombok.Setter;

/**
 * 分页参数Bean
 */
@Getter
@Setter
public class PageBean {
    private Integer offset;

    private Integer limit;
}
