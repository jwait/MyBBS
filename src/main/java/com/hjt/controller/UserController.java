package com.hjt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hjt.config.Config;
import com.hjt.pojo.Article;
import com.hjt.pojo.User;
import com.hjt.service.ArticleService;
import com.hjt.service.UserService;
import com.hjt.util.LogUtils;
import com.hjt.util.QiNiuUtils;
import com.hjt.util.StringUtils;
import com.qiniu.storage.model.DefaultPutRet;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> regist(@RequestParam("username")String username, 
			@RequestParam("password")String password){
		Map<String, String> map = new HashMap<String, String>();
		if(userService.findUser(username, null) != null){
			map.put("data", "用户名已存在！");
			return map;
		}
		String headimg = Config.DEFAULT_HEADIMG_ADDRESS;
		int result = userService.addUser(username, StringUtils.MD5(password), headimg);
		if(result > 0){
			LogUtils.info("注册成功！用户名：{}，密码：{}", username, password);
			map.put("data", "注册成功，请重新登录！");
		} else{
			LogUtils.info("注册失败！");
			map.put("data", "注册失败！");
		}
		return map;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> login(HttpSession session, 
			@RequestParam("username")String username,
			@RequestParam("password")String password){
		User user = userService.findUser(username, StringUtils.MD5(password));
		Map<String, String> map = new HashMap<>();
		if(user != null){
			LogUtils.info("登录成功！用户名:{},密码：{}", username, password);
			map.put("data", "登录成功！");
			session.setAttribute("user", user);
		}else{
			LogUtils.info("登录失败！");
			map.put("data", "登录失败！");
		}
		return map;
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session){
		session.invalidate();
		return "redirect: /index.jsp";
	}
	
	@RequestMapping("/manager/{uid}")
	public ModelAndView getUserManager(@PathVariable("uid")Integer uid){
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getUserByID(uid);
		List<Article> list = articleService.getArticleByUID(uid);
		modelAndView.addObject("u", user);
		modelAndView.addObject("userArticle", list);
		modelAndView.setViewName("user/userManager");
		return modelAndView;
	}
	
	@RequestMapping("/info/{uid}")
	public ModelAndView getUserInfo(@PathVariable("uid")Integer uid){
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getUserByID(uid);
		modelAndView.addObject("uInfo", user);
		modelAndView.setViewName("user/userInfo");
		return modelAndView;
	}
	
	@RequestMapping(value="/update/{uid}",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> updateUser(HttpSession session,
			@PathVariable("uid")Integer uid, 
			@RequestParam("password")String password){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 0);
			return map;
		}
		int result = userService.updateUserInfo(StringUtils.MD5(password), uid);
		if(result > 0){
			map.put("data", 1);
			LogUtils.info("更改密码成功的id为：{}", uid);
		}else{
			map.put("data", 2);
			LogUtils.info("更改密码失败的id为：{}", uid);
		}
		return map;
	}
	
	@RequestMapping(value="/headimg/{uid}",method=RequestMethod.POST)
	public String updateHeadImg(@PathVariable("uid")Integer uid, @RequestParam("file") MultipartFile file, HttpServletRequest request){
		if(file.isEmpty()){
			return "redirect:/index.jsp";
		}
		DefaultPutRet putRet = QiNiuUtils.upLoad(file, Config.QINIU_BUCKET);
		int result = userService.updateHeadImg(Config.QINIU_IMG_URL + putRet.key, uid);
		if(result > 0){
			LogUtils.info("成功更新uid为{}的用户头像,文件名{}",uid,putRet.key);
		}else{
			LogUtils.info("更新头像失败！");
		}
		return "redirect:/user/manager/uid";
	}
}
