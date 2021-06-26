package com.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bean.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.User;
import com.user.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.Enumeration;
import java.util.Locale;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("userShow")
	public String userShow(String currPage, Model model,HttpSession session) {
		if(currPage!="" && currPage!=null) {
			session.setAttribute("currPage", currPage);
		}
		String s=(String)session.getAttribute("currPage");
		int cpage=Integer.parseInt(s);
		return userService.selectUsers(cpage, model);
	}

	@RequestMapping("login")
	public String login(User user, Model model, HttpSession session) {
		return userService.login(user, model, session);
	}

	@RequestMapping("getRegistered")
	public String getRegistered(User user, Model model){
		return userService.getRegistered(user, model);
	}

	@RequestMapping("registered")
	public String registered(User user, Model model){
		return userService.registered(user, model);
	}

	@RequestMapping("selectUser")
	public String selectUser(int uid, Model model) {
		return userService.selectUser(uid, model);
	}

	@RequestMapping("selectUserU")
	public String selectUserU(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		return userService.selectUserU(user.getUid(), model);
	}

	@RequestMapping("i18n")
	public String i18n(Locale locale,HttpSession session) {
		String lg=locale.getLanguage();
		String cc=locale.getCountry();
		session.setAttribute("locale", lg+"_"+cc);
		return "user/main";
	}

	@RequestMapping("selectUserUpdate")
	public String selectUserUpdate(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		return userService.selectUserUpdate(user.getUid(), model);
	}

	@RequestMapping("logout")
	public String logout(Model model, HttpSession session){
		Enumeration<String> attributeNames = session.getAttributeNames();
		while (attributeNames.hasMoreElements()){
			session.removeAttribute(attributeNames.nextElement().toString());
		}
		return "user/i18n";
	}

	@RequestMapping("selectUserBy")
	public String selectUserBy(String uname, String sid, Model model) {
		if(uname == "" && sid == ""){
			return userService.selectUsers(1, model);
		}else if(uname == "" && sid != ""){
			return userService.selectUserBySid(sid, model);
		}else if(uname != "" && sid == ""){
			return userService.selectUserByName(uname, model);
		}else {
			return userService.selectUserBy(uname, sid, model);
		}
	}

	@RequestMapping("updateUser")
	public String updateUser(User user, Model model){
		return userService.updateUser(user, model);
	}

	@RequestMapping("updateUserU")
	public String updateUserU(User user, Model model, MultipartFile myFile, HttpServletRequest req){
		return userService.updateUserU(user, model, myFile, req);
	}

	@RequestMapping("deleteUser")
	public String deleteUser(int uid, Model model) {
		return userService.deleteUser(uid, model);
	}

	@RequestMapping("deleteUsers")
	public String deleteUsers(int[] uids, Model model) {
		return userService.deleteUsers(uids, model);
	}

	@RequestMapping("getChange")
	public String getChange(){
		return "user/changePassword";
	}

	@RequestMapping("change")
	public String changePassword(@RequestParam("oldapass")String oldapass, @RequestParam("newapass")String newapass, Model model, HttpSession session){
		return userService.changePassword(oldapass, newapass, model, session);
	}
}
