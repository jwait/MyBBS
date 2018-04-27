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
	public Map<String, Integer> regist(@RequestParam("username")String username, 
			@RequestParam("password")String password, HttpSession session){
		Map<String, Integer> map = new HashMap<String, Integer>();
		if(userService.findUser(username, null) != null){
			map.put("data", 1);
			return map;
		}
		String headimg = Config.DEFAULT_HEADIMG_ADDRESS;
		User user = new User(username, StringUtils.MD5(password), headimg, 2);
		int result = userService.addUser(user);
		if(result > 0){
			LogUtils.info("注册成功！用户名：{}，密码：{}", username, password);
			session.setAttribute("user", user);
			map.put("data", 2);
		} else{
			LogUtils.info("注册失败！");
			map.put("data", 3);
		}
		return map;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public boolean login(HttpSession session, 
			@RequestParam("username")String username,
			@RequestParam("password")String password){
		User user = userService.findUser(username, StringUtils.MD5(password));
		if(user != null){
			LogUtils.info("登录成功！用户名:{},密码：{}", username, password);
			session.setAttribute("user", user);
			return true;
		}else{
			LogUtils.info("登录失败！");
			return false;
		}
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session){
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/manager/{uid}")
	public ModelAndView getUserManager(@PathVariable("uid")Integer uid){
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getUserByID(uid);
		List<Article> list = articleService.getArticleByUID(uid);
		int power = userService.getPowerByUID(uid);
		if(power == 1) {
			List<Article> noPassList = articleService.getArticleByPass(0);
			List<Article> passList = articleService.getArticleList();
			modelAndView.addObject("noPassArticle", noPassList);
			modelAndView.addObject("passArticle", passList);
		}
		modelAndView.addObject("u", user);
		modelAndView.addObject("userArticle", list);
		modelAndView.setViewName("user/userManager");
		return modelAndView;
	}
	
	@RequestMapping("/info/{uid}")
	public ModelAndView getUserInfo(@PathVariable("uid")Integer uid){
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getUserByID(uid);
		List<Article> list = articleService.getArticleByUID(uid);
		modelAndView.addObject("userArticle", list);
		modelAndView.addObject("uInfo", user);
		modelAndView.setViewName("user/userInfo");
		return modelAndView;
	}
	
	@RequestMapping(value="/updatePassword",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> updateUser(HttpSession session,
			@RequestParam("oldPassword")String oldPassword,
			@RequestParam("newPassword")String newPassword){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 0);
			return map;
		}
		int uid = user.getUid();
		if(!user.getPassword().equals(StringUtils.MD5(oldPassword))){
			map.put("data", 1);
			return map;
		}
		if(user.getPassword().equals(StringUtils.MD5(newPassword))){
			map.put("data", 2);
			return map;
		}
		int result = userService.updateUserInfo(StringUtils.MD5(newPassword), uid);
		if(result > 0){
			map.put("data", 3);
			LogUtils.info("更改密码成功的id为：{}", uid);
		}else{
			map.put("data", 4);
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
		return "redirect:/user/manager/"+uid;
	}
}
