package com.hjt.dao;

import org.apache.ibatis.annotations.Param;

import com.hjt.pojo.User;

public interface UserDao {
	
	public int getPowerByUID(@Param("uid")Integer uid);
	
	public int addUser(User user);
	
	public User findUser(@Param("username") String username,
			@Param("password")String password);
	
	public User getUserByID(@Param("uid")Integer uid);
	
	public int updateHeadImg(@Param("headimg")String headImgName, 
			@Param("uid") Integer uid);
	
	public int updateUserInfo(@Param("password") String password, @Param("uid") Integer uid);
}
