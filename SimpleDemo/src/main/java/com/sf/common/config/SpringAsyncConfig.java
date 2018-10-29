package com.sf.common.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;

@Configuration
@EnableAsync
public class SpringAsyncConfig {
    @Value("${async.executor.thread.core_pool_size}")
    //线程池的基本大小
    private int corePoolSize;
    //线程池的大小。支持范围”min-max”和固定值（此时线程池core和max sizes相同）
    @Value("${async.executor.thread.max_pool_size}")
    private int maxPoolSize;
    //排队队列长度
    @Value("${async.executor.thread.queue_capacity}")
    private int queueCapacity;

    private String threadNamePrefix = "AsyncExecutorThread-";

    @Bean(name = "asyncExecutor")
    public Executor asyncExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(corePoolSize);
        executor.setMaxPoolSize(maxPoolSize);
        executor.setQueueCapacity(queueCapacity);
        executor.setThreadNamePrefix(threadNamePrefix);
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        executor.initialize();
        return executor;
    }
}