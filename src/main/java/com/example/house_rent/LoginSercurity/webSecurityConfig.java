package com.example.house_rent.LoginSercurity;

import com.example.house_rent.ServiceImpl.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Configuration
public class webSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private ClientService clientService;

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/homePage","/FindHouse","/register","/checking").permitAll()
                .anyRequest().authenticated()
                .and().formLogin().loginPage("/homePage").successHandler(
            new AuthenticationSuccessHandler() {
                @Override
                public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
                    HttpSession session = httpServletRequest.getSession();
                    //Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                    User user = (User) authentication.getPrincipal();
                    session.setAttribute("id",clientService.findId(user.getUsername()));
                    session.setAttribute("loginUser",user.getUsername());
                    httpServletResponse.setContentType("text/plain;charset=utf-8");
                    PrintWriter out = httpServletResponse.getWriter();
                    out.write("OK");
                    out.flush();
                    out.close();
                }

            }).failureHandler(new AuthenticationFailureHandler(){

            @Override
            public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
                //application/json
                httpServletResponse.setContentType("text/plain;charset=utf-8");
                PrintWriter out = httpServletResponse.getWriter();
                out.write("NO");
                out.flush();
                out.close();
            }
        }).
                loginProcessingUrl("/logonSecurity").
                and().csrf().disable();
    }
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**","/img/**","/layui/**");
    }
}
