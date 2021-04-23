package com.example.house_rent.utils;

import javax.servlet.http.Cookie;

public class CookieUtils {
    public static Cookie getCookie(String cookieName, Cookie[] cookies){
        if(cookies==null&&cookies.length==0){
            return null;
        }
        for(Cookie cookie:cookies){
            if(cookieName.equals(cookie.getName())){
                return cookie;
            }
        }
        return null;
    }
}
