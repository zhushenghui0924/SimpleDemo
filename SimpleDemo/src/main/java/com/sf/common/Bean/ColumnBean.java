package com.sf.common.Bean;

import lombok.Data;

/**
 * 列的属性
 */
@Data
public class ColumnBean {
	/**
	 * /列名
	 */
	private String columnName;
	/**
	 * 	/列名类型
	 */
	private String dataType;
	/**
	 * 	 列名备注
	 */
	private String comments;
	/**
	 * 	属性名称(第一个字母大写)，如：user_name => UserName
	 */
	private String capitalAttrName;
	/**
	 * 	属性名称(第一个字母小写)，如：user_name => userName
	 */
	private String lowercaseAttName;
	/**
	 * 	属性类型
	 */
	private String attrType;
	/**
	 * 扩展
	 */
	private String extra;
}
