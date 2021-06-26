package com.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.bean.User;
import org.springframework.web.multipart.MultipartFile;


public interface UserService {
	
	/*public String getMain(Model model,HttpSession session);
	
	public String getTypeBook(int tid,Model model);
	
	public String selectBookDetail(int bid,Model model);*/

	public String selectUsers(int currPage,Model model);

	public String login(User user,Model model,HttpSession session);

	public String getRegistered(User user, Model model);

	public String registered(User user, Model model);

	public String selectUser(int uid, Model model);

	public String selectUserU(int uid, Model model);

	public String selectUserUpdate(int uid, Model model);

	public String selectUserByName(String uname, Model model);

	public String selectUserBySid(String sid, Model model);

	public String selectUserBy(String uname, String sid,  Model model);

	public String updateUser(User user, Model model);

	public String updateUserU(User user, Model model, MultipartFile myFile, HttpServletRequest req);

	public String deleteUser(int uid, Model model);

	public String deleteUsers(int[] uids, Model model);

	public String changePassword(String oldPassword, String newPassword, Model model,HttpSession session);
}
