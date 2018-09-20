package com.sf.common.service.impl;

import com.sf.common.dao.GeneratorDao;
import com.sf.common.service.GeneratorService;
import com.sf.common.utils.GenUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;


@Service
public class GeneratorServiceImpl implements GeneratorService {
	@Autowired
	GeneratorDao generatorDao;

	@Override
	public List<Map<String, Object>> list() {
		List<Map<String, Object>> list = generatorDao.list();
		return list;
	}

	@Override
	public byte[] generatorCode(String[] tableNames) {
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ZipOutputStream zip = new ZipOutputStream(outputStream);
		for(String tableName : tableNames){
			//查询表信息
			Map<String, String> table = generatorDao.get(tableName);
			//查询列信息
			List<Map<String, String>> columns = generatorDao.listColumns(tableName);
			//生成代码
			GenUtils.generatorCode(table, columns, zip);
		}
		IOUtils.closeQuietly(zip);
		return outputStream.toByteArray();
	}

}
