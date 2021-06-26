package com.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.User;
import org.springframework.ui.Model;

@Repository
@Mapper
public interface UserDao {
	
	/*public List<Book> selectRemBook();
	
	public List<Book> selectTypeBook(int tid);*/

	public List<User> selectUsers(int start, int end);

	public User selectUser(int uid);

	public List<User> selectUserByName(String uname);

	public List<User> selectUserBySid(String sid);

	public List<User> selectUserBy(String uname,String sid);

	public int updateUser(User user);

	public int updateUserU(User user);

	public int countUsers();

	public User selectByName(String uname);

	public int registered(User user);

	public int registeredInfo(int uid);

	public User login(User user);

	public int deleteUser(int uid);

	public int deleteUsers(int[] uids);

	public int changePassword(@Param("oldPass")String oldPass, @Param("newPass")String newPass, @Param("uname")String uname);

}
