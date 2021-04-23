package com.example.house_rent;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@MapperScan(value = "com.example.house_rent.SQLMapping.HouseMapping")
@SpringBootApplication
public class HouseRentApplication extends SpringBootServletInitializer{

    public static void main(String[] args) {
        SpringApplication.run(HouseRentApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(HouseRentApplication.class);
    }
}
