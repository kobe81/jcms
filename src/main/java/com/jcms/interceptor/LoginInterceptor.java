package com.jcms.interceptor;

import java.net.URLDecoder;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;

import com.jcms.pojo.entity.sys.SysUserEntity;
import com.jcms.service.ISysUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

@Autowired
private ISysUserService iSysUserService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        System.out.println("拦截器========");
        // 获取用户cookies
        Cookie[] cookies = request.getCookies();
        String username = null;
        String password = null;
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("username")) {
                    username = c.getValue();
                }
                if (c.getName().equals("password")) {
                    password = c.getValue();
                }
            }
        }
        if (username != null && password != null) {
            SysUserEntity userEntity=iSysUserService.getForUserName(username);
            if (userEntity != null) {
                request.getSession().setAttribute("user", userEntity);
                System.out.println("设置了值啊啊啊啊啊啊");
            }
            /*request.getRequestDispatcher("/index.jsp").forward(request, response);*/
            response.sendRedirect("/index.jsp");
            return false;
        }

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        System.out.println("MyInterceptor2 afterCompletion");
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        System.out.println("MyInterceptor2 postHandle");
    }


}
