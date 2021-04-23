package com.example.house_rent.SpringConfig;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.sql.DataSource;
import java.util.Properties;

@EnableAsync
@PropertySource("classpath:SpringJdbc.properties")
@EnableTransactionManagement
@MapperScan(value = "com.HouseRent.SQLMapping.HouseMapping")
@ComponentScan(value = {"com"},
        excludeFilters = @Filter(type = FilterType.ANNOTATION,classes = {Controller.class})
)
public class RootApplicationContext {
    @Bean
    public JavaMailSenderImpl javaMailSender(){
        return getJavaMailSender();
    }

    public static JavaMailSenderImpl getJavaMailSender() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
        javaMailSender.setHost("smtp.qq.com");
        javaMailSender.setUsername("1121344426@qq.com");
        javaMailSender.setPassword("bfyovgznnymohfac");
        javaMailSender.setDefaultEncoding("utf-8");
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.auth","true");
        properties.setProperty("mail.smtp.timeout","20000");
        javaMailSender.setJavaMailProperties(properties);
        return javaMailSender;
    }

   /* @Bean
    public Jedis getReadJedis(){
        Jedis jedis = new Jedis("120.79.189.128", 6380);
        jedis.auth("yxw1121344436QQ%");
        return jedis;
    }
    @Bean
    public Jedis getWriteJedis(){
        Jedis jedis = new Jedis("120.79.189.128", 6379);
        jedis.auth("yxw1121344436QQ%");
        return jedis;
    }*/


    @Value("${classDriverName}")
    private String driverClassName;
    @Value("${redisPassword}")
    private String redisPassword;
    /*@Bean
    public DataSource dataSource(){
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUsername("root");
        dataSource.setPassword("yxw123456QQ%");
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl("jdbc:mysql://120.79.189.128:3306/houserent?characterEncoding=utf8");
        return dataSource;
    }*/
    //配置事务管理器
   /* @Bean
    public PlatformTransactionManager platformTransactionManager(){
        return new DataSourceTransactionManager(dataSource());
    }*/
    /*@Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlFactory = new SqlSessionFactoryBean();
        sqlFactory.setDataSource(dataSource());
        PathMatchingResourcePatternResolver resource = new PathMatchingResourcePatternResolver();
        sqlFactory.setConfigLocation(resource.getResource("classpath:MybatisConfig.xml"));
        sqlFactory.setMapperLocations(resource.getResources("classpath:MappingResources/*.xml"));
        return sqlFactory.getObject();
    }*/
    @Bean
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        commonsMultipartResolver.setMaxUploadSize(1024000);
        commonsMultipartResolver.setDefaultEncoding("UTF-8");
        return commonsMultipartResolver;
    }
}
