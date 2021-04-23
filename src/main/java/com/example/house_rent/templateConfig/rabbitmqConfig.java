package com.example.house_rent.templateConfig;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.FanoutExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class rabbitmqConfig {
    //注册用户的交换机和队列绑定，用于异步保存用户信息到数据库和发送邮件到对应的邮箱
    @Bean
    public FanoutExchange emailRegisterFanoutExchange(){
        return  new FanoutExchange("emailRegister_fanout_exchange",true,false);
    }

    @Bean
    public Queue emailRegisterQueue(){
        return new Queue("email_register_queue",true,false,false);
    }
    @Bean
    public Binding emailRegisterBounding(){
        return BindingBuilder.bind(emailRegisterQueue()).to(emailRegisterFanoutExchange());
    }
    //上传房子的交换机和队列绑定，用于异步保存房子信息到数据库和发送邮件到对应的邮箱
    @Bean
    public FanoutExchange emailPublishHouseExchange(){
        return new FanoutExchange("emailPublish_fanout_exchange",true,false);
    }
    @Bean
    public Queue emailPublishQueue(){
        return new Queue("email_publish_queue",true,false,false);
    }
    @Bean
    public Binding emailPublishBinding(){
        return BindingBuilder.bind(emailPublishQueue()).to(emailPublishHouseExchange());
    }
    //验证码
    @Bean
    public FanoutExchange emailSendCheckingExchange(){
        return new FanoutExchange("emailSendChecking_fanout_exchange",true,false);
    }
    @Bean
    public Queue emailSendCheckingQueue(){
        return new Queue("email_sendChecking_queue",true,false,false);
    }
    @Bean
    public Binding emailSendCheckingBinding(){
        return BindingBuilder.bind(emailSendCheckingQueue()).to(emailSendCheckingExchange());
    }
}
