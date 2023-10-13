package com.learneasy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;


@MapperScan(basePackages = "com.learneasy.orders.mapper")
@SpringBootApplication(scanBasePackages = "com.learneasy")
//@EnableFeignClients(basePackages={"com.learneasy.orders.feignclient"})
public class OrdersApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrdersApiApplication.class, args);
    }

}
