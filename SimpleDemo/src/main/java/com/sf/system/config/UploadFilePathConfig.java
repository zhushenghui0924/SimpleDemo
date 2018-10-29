package com.sf.system.config;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 配置虚拟路径
 */
@Configuration
public class UploadFilePathConfig extends WebMvcConfigurerAdapter {
    @Value("${file.staticAccessPath}")
    private String staticAccessPath;
    @Value("${sf.uploadPath}")
    private String uploadFolder;
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(staticAccessPath).addResourceLocations("file:///"+uploadFolder);
    }
}
