package com.admin.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Admin;

@Repository
@Mapper
public interface AdminDao {
   public Admin login(Admin admin);

   public int changePassword(@Param("oldPass")String oldPass, @Param("newPass")String newPass, @Param("aname")String aname);
}
