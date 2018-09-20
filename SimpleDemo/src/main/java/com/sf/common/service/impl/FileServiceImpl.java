package com.sf.common.service.impl;

import com.sf.common.config.BootdoConfig;
import com.sf.common.dao.FileDao;
import com.sf.common.model.FileDO;
import com.sf.common.service.FileService;
import com.sf.common.tools.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.File;
import java.util.List;
import java.util.Map;


@Service
public class FileServiceImpl extends BaseServiceImpl<FileDO> implements FileService {
	@Autowired
	private FileDao fileDao;

	@Autowired
	private BootdoConfig bootdoConfig;

	@Override
	public List<FileDO> list(Map<String, Object> map){
		return fileDao.list(map);
	}

	@Override
	public int count(Map<String, Object> map){
		return fileDao.count(map);
	}

    @Override
    public Boolean isExist(String url) {
		Boolean isExist = false;
		if (!StringUtils.isEmpty(url)) {
			String filePath = url.replace("/files/", "");
			filePath = bootdoConfig.getUploadPath() + filePath;
			File file = new File(filePath);
			if (file.exists()) {
				isExist = true;
			}
		}
		return isExist;
	}
	}
