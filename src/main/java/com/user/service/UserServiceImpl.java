package com.user.service;

import java.io.File;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.admin.dao.OrderDao;
import com.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.user.dao.UserDao;
import org.springframework.web.multipart.MultipartFile;

@Service("userService")
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;

    @Autowired
    OrderDao orderDao;
	/*@Override
	public String getMain(Model model,HttpSession session) {
		// TODO Auto-generated method stub
		
		List<Type> types=typeDao.selectTypes();
		session.setAttribute("types", types);
		//model.addAttribute("types", types);
		
		List<Book> remBook=userDao.selectRemBook();
		model.addAttribute("remBook", remBook);
		
		
		List<List<Book>> typesBook=new ArrayList<List<Book>>();
		for (int i = 0; i < types.size(); i++) {
			int tid=types.get(i).getTid();
			List<Book> books=userDao.selectTypeBook(tid);
			typesBook.add(books);
		}
		model.addAttribute("typesBook", typesBook);
		
		return "user/main";
	}

	@Override
	public String getTypeBook(int tid, Model model) {
		// TODO Auto-generated method stub
	
		List<Type> types=typeDao.selectTypes();
		model.addAttribute("types", types);
		
		if(tid==0) {
			List<Book> books=userDao.selectRemBook();
			model.addAttribute("books", books);
			model.addAttribute("tname", "推荐商品");
		}else{
			List<Book> books=userDao.selectTypeBook(tid);;
			model.addAttribute("books", books);
	        for (int i = 0; i <types.size(); i++) {
				if(tid==types.get(i).getTid()) {
					model.addAttribute("tname", types.get(i).getTname());
					break;
				}
			}
		 }
		return "user/typeBookShow";
	}

	@Override
	public String selectBookDetail(int bid, Model model) {
		// TODO Auto-generated method stub
		Book book=bookDao.selectBookByID(bid);
		model.addAttribute("book", book);
		return "user/bookDetail";
	}*/

    @Override
    public String selectUsers(int currPage, Model model) {
        int pageSize=9;
        int countPage;
        int starIndex=(currPage-1)*pageSize;
        int endIndex=starIndex+pageSize;
        int len=userDao.countUsers();
        countPage=len/pageSize+1;
        if(len%pageSize==0) {
            countPage=countPage-1;
        }
        if(currPage==countPage) {
            endIndex=len;
        }
        List<User> users = userDao.selectUsers(starIndex, pageSize);
        model.addAttribute("users", users);
        model.addAttribute("currPage", currPage);
        model.addAttribute("countPage", countPage);
        model.addAttribute("starIndex", starIndex);

        return "admin/userShow";
    }

    @Override
    public String login(User user, Model model, HttpSession session) {
        // TODO Auto-generated method stub
        User user1=userDao.login(user);
        if(user1!=null) {
            session.setAttribute("user", user1);
            return "forward:i18n";
        }else {
            model.addAttribute("mess", "用户名或密码错误");
            return "user/login";
        }
    }

    @Override
    public String getRegistered(User user, Model model) {
        User user1 = userDao.selectByName(user.getUname());
        if(user1==null || user1.getUname().equals("")){
            return "forward:registered?user=" + user;
        }else{
            model.addAttribute("mess","该用户名已存在");
            return "user/registered";
        }
    }

    @Override
    public String registered(User user, Model model) {
        try {
            int i = userDao.registered(user);
            if(i > 0){
                model.addAttribute("mess", "注册成功");
                User user1 = userDao.selectByName(user.getUname());
                userDao.registeredInfo(user1.getUid());
                return "user/login";
            }
            else {
                model.addAttribute("mess", "注册失败!");
                return "user/registered";
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "注册失败!");
            return "user/registered";
        }
    }

    @Override
    public String selectUser(int uid, Model model) {
        User user = userDao.selectUser(uid);
        model.addAttribute("user", user);
        return "admin/userUpdate";
    }

    @Override
    public String selectUserU(int uid, Model model) {
        User user = userDao.selectUser(uid);
        model.addAttribute("user", user);
        return "user/userinformation";
    }

    @Override
    public String selectUserUpdate(int uid, Model model) {
        User user = userDao.selectUser(uid);
        model.addAttribute("user", user);
        return "user/userinformationupdate";
    }

    @Override
    public String selectUserByName(String uname, Model model) {
        List<User> user = userDao.selectUserByName(uname);
        model.addAttribute("users", user);
        return "admin/userShow";
    }

    @Override
    public String selectUserBySid(String sid, Model model) {
        List<User> user = userDao.selectUserBySid(sid);
        model.addAttribute("users", user);
        return "admin/userShow";
    }

    @Override
    public String selectUserBy(String uname, String sid, Model model) {
        List<User> user = userDao.selectUserBy(uname, sid);
        model.addAttribute("users", user);
        return "admin/userShow";
    }

    @Override
    public String updateUser(User user, Model model) {
        try {
            int i = userDao.updateUser(user);
            if(i>0) {
                model.addAttribute("mess", "修改成功！");
            }else {
                model.addAttribute("mess", "修改失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");
        }
        return "forward:userShow?currPage=1";
    }

    @Override
    public String updateUserU(User user, Model model, MultipartFile myFile, HttpServletRequest req) {
        try {
            //***实现图片上传*********************//
            if(!myFile.isEmpty()) {
                String spic=fileUpload(myFile, req);
                user.setUphoto(spic);
            }
            int n = userDao.updateUserU(user);
            if(n>0) {
                model.addAttribute("mess", "修改成功！");
            }else {
                model.addAttribute("mess", "输入的信息有误！");
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");
        }
        return "forward:selectUserU";
    }

    @Override
    public String deleteUser(int uid, Model model) {
        try {
            int i = userDao.deleteUser(uid);
            if(i>0) {
                orderDao.deleteOrderUser(uid);
                return "admin/succ";
            }else {
                model.addAttribute("mess", "删除失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");

        }
        return "forward:userShow";
    }

    @Override
    public String deleteUsers(int[] uids, Model model) {
        try {
            int i = userDao.deleteUsers(uids);
            if(i>0) {
                orderDao.deleteOrderUsers(uids);
                return "admin/succ";
            }else {
                model.addAttribute("mess", "删除失败！");
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");

        }
        return "forward:userShow";
    }

    @Override
    public String changePassword(String oldPassword,String newPassword, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String uname = user.getUname();
        // TODO Auto-generated method stub
        try {
            int i = userDao.changePassword(oldPassword, newPassword, uname);
            if(i>0) {
                model.addAttribute("mess", "修改成功！");
                Enumeration<String> attributeNames = session.getAttributeNames();
                while (attributeNames.hasMoreElements()){
                    session.removeAttribute(attributeNames.nextElement().toString());
                }
                return "forward:i18n";
            }else {
                model.addAttribute("mess", "修改失败！");

            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            model.addAttribute("mess", "数据库访问异常！");
            //return "admin/login";
        }
        return "user/changePassword";
    }

    public String fileUpload(MultipartFile myFile, HttpServletRequest req) {
        //***指定上传文件的上传路劲
        //http://localhost:8080/myproject2021_demo/a/b/uploadfiles
        String realPath=req.getServletContext().getRealPath("uploadfiles");
        String fileName=myFile.getOriginalFilename();
        File filePath=new File(realPath);
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        File saveFile=new File(filePath,fileName);
        try {
            myFile.transferTo(saveFile);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return fileName;
    }
}
