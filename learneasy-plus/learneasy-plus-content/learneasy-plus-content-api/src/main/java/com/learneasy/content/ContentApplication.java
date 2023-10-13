package com.learneasy.content;

import com.spring4all.swagger.EnableSwagger2Doc;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;


@MapperScan(basePackages = "com.learneasy.content.mapper")
@SpringBootApplication(scanBasePackages = "com.learneasy")
@EnableFeignClients(basePackages={"com.learneasy.content.feignclient"})
public class ContentApplication {

    public static void main(String[] args) {
        SpringApplication.run(ContentApplication.class, args);
    }

}
