package com.admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.admin.dao.AdminDao;
import com.bean.Admin;

import java.util.Enumeration;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDao adminDao;

    @Override
    public String login(Admin admin, Model model, HttpSession session) {
        // TODO Auto-generated method stub
        try {
            Admin a=adminDao.login(admin);
            if(a != null) {
                session.setAttribute("admin", a);
                return "admin/main";
            }else {
                model.addAttribute("mess", "用户名或密码错误！");
                //return "admin/login";
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");
            //return "admin/login";
        }
        return "admin/login";
    }

    @Override
    public String changePassword(String oldPassword,String newPassword, Model model, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        String aname = admin.getAname();
        // TODO Auto-generated method stub
        try {
            int i = adminDao.changePassword(oldPassword, newPassword, aname);
            if(i>0) {
                model.addAttribute("mess", "修改成功！");
                Enumeration<String> attributeNames = session.getAttributeNames();
                while (attributeNames.hasMoreElements()){
                    session.removeAttribute(attributeNames.nextElement().toString());
                }
                return "admin/login";
            }else {
                model.addAttribute("mess", "修改失败！");

            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");
            //return "admin/login";
        }
        return "admin/changePassword";
    }

}
