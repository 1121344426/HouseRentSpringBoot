package com.example.house_rent.SpringConfig;



import com.example.house_rent.InterceptorConfig.LoginInterceptor;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.*;


@ComponentScan(value = {"com.example.house_rent"},
        includeFilters = @Filter(type = FilterType.ANNOTATION,classes = {Controller.class}),
        useDefaultFilters = false
)
@EnableWebMvc
public class WebApplicationContext implements WebMvcConfigurer {
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/WEB-INF/views/",".jsp");
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        //开启静态资源的访问
        configurer.enable();
    }



}
