package com.sf.common.Bean;

import com.alibaba.fastjson.JSONObject;
import lombok.Getter;
import lombok.Setter;


/**
 * 前台列搜索条件及值Bean
 */
@Getter
@Setter
public class SearchConditionBean {

   private JSONObject searchConditionJson;
    /**
     * 排序字段
     */
    private String orderBy;
}
