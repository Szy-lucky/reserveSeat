package com.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bean.Admin;

public class AdminFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1,
                         FilterChain arg2)
            throws IOException, ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest req=(HttpServletRequest)arg0;
        HttpSession session=req.getSession();
        Admin admin=(Admin)session.getAttribute("admin");
        if(admin!=null) {
            arg2.doFilter(req, arg1);
        }else {
            String path=req.getServletPath();
            if(path.endsWith("index.jsp") || path.endsWith("login.jsp") ) {
                arg2.doFilter(req, arg1);
            }else {
                req.setAttribute("mess", "请你先登录！");
                req.getRequestDispatcher("/jsp/admin/login.jsp").forward(req, arg1);
            }

        }

    }

    @Override
    public void destroy() {

    }

}
