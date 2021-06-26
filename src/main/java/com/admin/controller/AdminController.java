package com.admin.controller;

import javax.servlet.http.HttpSession;

import com.admin.service.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.admin.service.AdminService;
import com.bean.Admin;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Enumeration;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    
    @RequestMapping("login")
    public String  login(Admin admin,Model model,HttpSession session) {
    	return adminService.login(admin, model, session);
    }

    @RequestMapping("change")
    public String changePassword(@RequestParam("oldapass")String oldapass, @RequestParam("newapass")String newapass, Model model, HttpSession session){
        return adminService.changePassword(oldapass, newapass, model, session);
    }

    @RequestMapping("logout")
    public String logout( Model model, HttpSession session){
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()){
            session.removeAttribute(attributeNames.nextElement().toString());
        }
        return "admin/login";
    }
}
