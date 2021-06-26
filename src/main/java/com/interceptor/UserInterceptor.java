package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bean.User;

public class UserInterceptor implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // TODO Auto-generated method stub
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if(user!=null && !user.equals("")) {
            return true;
        }else {
            request.setAttribute("mess", "请你先登录!");
            //User user1=new User();
            //request.setAttribute("user", user1);
            request.getRequestDispatcher("/jsp/user/login.jsp").
                    forward(request, response);

            return false;
        }



    }


}
