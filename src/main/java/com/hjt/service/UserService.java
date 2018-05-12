package com.hjt.service;

import com.hjt.pojo.User;

public interface UserService {
	
	public int addUser(User user);
	
	public User findUser(String username, String password);
	
	public User getUserByID(Integer uid);
	
	public int updateHeadImg(String headImgName, Integer uid);
	
	public int updateUserInfo(String username, String phone, String email, Integer uid);
	
	public int updatePassword(String password, Integer uid);
	
	public int getPowerByUID(Integer uid);
	
}
