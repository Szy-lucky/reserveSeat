package com.admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bean.Admin;

public interface AdminService {
	public String login(Admin admin,Model model,HttpSession session);
	public String changePassword(String oldPassword, String newPassword, Model model,HttpSession session);
}
