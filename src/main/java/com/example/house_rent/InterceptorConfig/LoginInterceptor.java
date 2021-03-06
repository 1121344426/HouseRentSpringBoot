package com.example.house_rent.InterceptorConfig;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object loginExists = session.getAttribute("id");
        if(loginExists == null){
            request.getRequestDispatcher("/homePage").forward(request,response);
            return false;
        }else {
            return true;
        }
    }

}
