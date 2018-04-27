package com.hjt.service;

import com.hjt.pojo.User;

public interface UserService {
	
	public int addUser(User user);
	
	public User findUser(String username, String password);
	
	public User getUserByID(Integer uid);
	
	public int updateHeadImg(String headImgName, Integer uid);
	
	public int updateUserInfo(String password, Integer uid);
	
	public int getPowerByUID(Integer uid);
	
}
