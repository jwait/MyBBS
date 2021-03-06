package com.hjt.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.hjt.config.Config;
import com.hjt.pojo.Article;
import com.hjt.pojo.Comment;
import com.hjt.pojo.Floor;
import com.hjt.pojo.PageBean;
import com.hjt.pojo.User;
import com.hjt.service.ArticleService;
import com.hjt.service.CommentService;
import com.hjt.service.UserService;
import com.hjt.util.LogUtils;
import com.hjt.util.SensitiveWordFilter;
import com.hjt.util.StringUtils;

@Controller
@RequestMapping("article")
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommentService commentService;
	
	private SensitiveWordFilter filter;
	
	@RequestMapping("/list/{type}/{currentPage}")
	public ModelAndView getArticlePageList(HttpSession session, @PathVariable("type")String type, @PathVariable("currentPage") int currentPage){
		ModelAndView modelAndView = new ModelAndView();
		int pageSize = Config.DEFAULT_PAGESIZE;
		if(type.equals("all")) {
			modelAndView.addObject("articlePageBean", articleService.getArticlePageList(currentPage, pageSize));
			List<Integer> statusList = new ArrayList<>();
			statusList.add(Config.STATUS_TOP);
			statusList.add(Config.STATUS_TOP_HOT);
			modelAndView.addObject("topArticle", articleService.getArticleByStatus(statusList));
		}else {
			modelAndView.addObject("articlePageBean", articleService.getArticlePageListByType(type, currentPage, pageSize));
		}
		modelAndView.addObject("type", type);
		
		if(session.getAttribute("user") != null){
			User user = (User) session.getAttribute("user");
			modelAndView.addObject("user", userService.getUserByID(user.getUid()));
		}
		modelAndView.setViewName("article/articleList");	
		return modelAndView;
	}
	
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> addArticle(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content,
			@RequestParam(value = "uid") Integer uid,
			@RequestParam(value = "lable") String lable,
			@RequestParam(value = "type")String type){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 1);
			return map;
		}
		if(StringUtils.isEmpty(title) || StringUtils.isBlank(title)){
			map.put("data", 2);
			return map;
		}
		if(StringUtils.isEmpty(content) || StringUtils.isBlank(content)){
			map.put("data", 3);
			return map;
		}
		filter = new SensitiveWordFilter(request);
		content = filter.replaceSensitiveWord(content, 1, "*");
		int result = articleService.addArticle(title, content, new Timestamp(new Date().getTime()), uid, lable, type);
		if(result > 0){
			LogUtils.info("发帖成功！标题：{}， 内容长度：{}", title, content.length());
			map.put("data", 4);
		}else{
			LogUtils.info("发帖失败！");
		}
		return map;
	}
	
	@RequestMapping("/details/{aid}/{currentPage}")
	public ModelAndView getArticleByID(@PathVariable("aid")Integer aid, @PathVariable("currentPage")Integer currentPage, HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		int pageSize = Config.DEFAULT_PAGESIZE;
		PageBean commentPageBean = commentService.findComment(aid, null, currentPage, pageSize);
		List<Floor> floorCommentList = commentService.findFloorComment(aid, null);
		modelAndView.addObject("article", articleService.getArticleByID(aid));
		modelAndView.addObject("commentPageBean", commentPageBean);
		modelAndView.addObject("Floor", floorCommentList);
		modelAndView.setViewName("article/articleContent");
		return modelAndView;
	}
	
	@RequestMapping("/search")
	public ModelAndView searchArticle(@RequestParam("key")String key){
		ModelAndView modelAndView = new ModelAndView();
		List<Article> resultList = articleService.searchArticleByKey(key);
		modelAndView.addObject("key", key);
		modelAndView.addObject("resultList", resultList);
		LogUtils.info("查询关键字：{},共查询到{}条信息", key, resultList.size());
		modelAndView.setViewName("search");
		return modelAndView;
	}
	
	@RequestMapping("/delete/{aid}")
	@ResponseBody
	public Map<String, Integer> deleteArticle(HttpSession session, 
			@PathVariable("aid")Integer aid){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 0);
			return map;
		}
		int result = articleService.deleteArticle(aid);
		if(result > 0){
			map.put("data", 1);
			LogUtils.info("删除成功！删除的帖子id为：{}", aid);
		}else{
			map.put("data", 2);
			LogUtils.info("删除失败！");
		}
		return map;
	}
	
	@RequestMapping("/update/{aid}")
	@ResponseBody
	public Map<String, Integer> updateArticle(HttpSession session, 
			@PathVariable("aid")Integer aid){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 0);
			return map;
		}
		int result = articleService.updateArticleByID(aid);
		if(result > 0){
			map.put("data", 1);
			LogUtils.info("通过成功！通过的帖子id为：{}", aid);
		}else{
			map.put("data", 2);
			LogUtils.info("通过失败！");
		}
		return map;
	}
	
	@RequestMapping(value="/stick/{aid}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> stickArticle(HttpSession session,
			@PathVariable("aid")Integer aid, @RequestParam("status")Integer status){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 0);
			return map;
		}
		int result;
		if(status == 1){
			result = articleService.updateArticleStatusByID(aid, 0);
			LogUtils.info("取消置顶成功！置顶的帖子id为：{}", aid);
		}else if(status == 3) {
			result = articleService.updateArticleStatusByID(aid, 2);
			LogUtils.info("取消置顶成功！置顶的帖子id为：{}", aid);
		}else if(status == 2){
			result = articleService.updateArticleStatusByID(aid, 3);
			LogUtils.info("置顶成功！置顶的帖子id为：{}", aid);
		}else{
			result = articleService.updateArticleStatusByID(aid, 1);
			LogUtils.info("置顶成功！置顶的帖子id为：{}", aid);
		}
		if(result > 0){
			map.put("data", 1);
		}else{
			map.put("data", 2);
			LogUtils.info("置顶失败！");
		}
		return map;
	}
	
	@RequestMapping(value="/digest/{aid}", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> digestArticle(HttpSession session,
			@PathVariable("aid")Integer aid, @RequestParam("status")Integer status){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 0);
			return map;
		}
		int result;
		if(status == 2){
			result = articleService.updateArticleStatusByID(aid, 0);
			LogUtils.info("取消加精成功！加精的帖子id为：{}", aid);
		}else if(status == 3) {
			result = articleService.updateArticleStatusByID(aid, 1);
			LogUtils.info("取消加精成功！加精的帖子id为：{}", aid);
		}else if(status == 1){
			result = articleService.updateArticleStatusByID(aid, 3);
			LogUtils.info("加精成功！加精的帖子id为：{}", aid);
		}else {
			result = articleService.updateArticleStatusByID(aid, 2);
			LogUtils.info("加精成功！加精的帖子id为：{}", aid);
		}
		if(result > 0){
			map.put("data", 1);
		}else{
			map.put("data", 2);
			LogUtils.info("加精失败！");
		}
		return map;
	}
	
}
