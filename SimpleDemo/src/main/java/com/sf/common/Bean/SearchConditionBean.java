package com.sf.common.Bean;

/**
 * 前台列搜索条件及值Bean
 */
public class SearchConditionBean {
    /**
     * 列名对应类属性名
     */
    private  String searchColumn;
    /**
     * 搜索值
     */
    private String searchValue;
    /**
     * 是否是时间类型字段
     */
    private Boolean isDateType;

    /**
     * 排序字段
     */
    private String orderBy;

    public String getSearchColumn() {
        return searchColumn;
    }

    public void setSearchColumn(String searchColumn) {
        String time="time";
        if(searchColumn.toLowerCase().contains(time.toLowerCase())){
            setDateType(true);
        }else{
            setDateType(false);
        }
        this.searchColumn = searchColumn;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public Boolean getDateType() {
        return isDateType;
    }

    public void setDateType(Boolean dateType) {
        isDateType = dateType;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }
}
