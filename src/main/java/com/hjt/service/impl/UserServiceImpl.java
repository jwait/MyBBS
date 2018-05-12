package com.hjt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hjt.dao.UserDao;
import com.hjt.pojo.User;
import com.hjt.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public int addUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	public User findUser(String username, String password) {
		return userDao.findUser(username, password);
	}

	@Override
	public User getUserByID(Integer uid) {
		return userDao.getUserByID(uid);
	}

	@Override
	public int updateHeadImg(String headImgName, Integer uid) {
		return userDao.updateHeadImg(headImgName, uid);
	}

	@Override
	public int updateUserInfo(String username, String phone, String email, Integer uid) {
		return userDao.updateUserInfo(username, phone, email, uid);
	}
	
	@Override
	public int updatePassword(String password, Integer uid) {
		return userDao.updatePassword(password, uid);
	}

	@Override
	public int getPowerByUID(Integer uid) {
		return userDao.getPowerByUID(uid);
	}

}
