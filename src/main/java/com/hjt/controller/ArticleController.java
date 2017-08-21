package com.hjt.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.hjt.pojo.User;
import com.hjt.service.ArticleService;
import com.hjt.service.CommentService;
import com.hjt.service.UserService;
import com.hjt.util.LogUtils;
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
	
	@RequestMapping("/list/{currentPage}")
	public ModelAndView getArticlePageList(HttpSession session, @PathVariable("currentPage") int currentPage){
		ModelAndView modelAndView = new ModelAndView();
		int pageSize = Config.DEFAULT_PAGESIZE;
		modelAndView.addObject("articlePageBean", articleService.getArticlePageList(currentPage, pageSize));
		
		List<Integer> statusList = new ArrayList<>();
		statusList.add(Config.STATUS_TOP);
		statusList.add(Config.STATUS_TOP_HOT);
		modelAndView.addObject("topArticle", articleService.getArticleByStatus(statusList));
		
		if(session.getAttribute("user") != null){
			User user = (User) session.getAttribute("user");
			modelAndView.addObject("user", userService.getUserByID(user.getUid()));
		}
		modelAndView.setViewName("article/articleList");	
		return modelAndView;
	}
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> addArticle(HttpSession session,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content") String content,
			@RequestParam(value = "uid") Integer uid,
			@RequestParam(value = "lable") String lable){
		Map<String, String> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", "请登录后再重新发帖！");
			return map;
		}
		if(StringUtils.isEmpty(title) || StringUtils.isBlank(title)){
			map.put("data", "标题不能为空！");
			return map;
		}
		int result = articleService.addArticle(title, content, new Timestamp(new Date().getTime()), uid, lable);
		if(result > 0){
			LogUtils.info("发帖成功！标题：{}， 内容长度：{}", title, content.length());
			map.put("data", "发帖成功！");
		}else{
			LogUtils.info("发帖失败！");
		}
		return map;
	}
	
	@RequestMapping("/details/{aid}")
	public ModelAndView getArticleByID(@PathVariable("aid")Integer aid, HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		List<Comment> commentList = commentService.findComment(aid, null);
		List<Floor> floorCommentList = commentService.findFloorComment(aid, null);
		modelAndView.addObject("article", articleService.getArticleByID(aid));
		modelAndView.addObject(commentList);
		modelAndView.addObject("Floor", floorCommentList);
		modelAndView.setViewName("article/articleContent");
		return modelAndView;
	}
	
	@RequestMapping(value="/floor/add", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> addFloorComment(HttpSession session,
			@RequestParam("cid")Integer cid, 
			@RequestParam("aid")Integer aid,
			@RequestParam("uid")Integer uid,
			@RequestParam("content")String content){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null || user.getUid() != uid){
			map.put("data", 0);
			return map;
		}
		if(StringUtils.isEmpty(content) || StringUtils.isBlank(content)){
			map.put("data", 1);
			return map;
		}
		int result = commentService.addFloorComment(aid, cid, uid, content);
		if(result > 0){
			LogUtils.info("楼中楼回复成功！内容：{}", content);
			map.put("data", 2);
		}else{
			LogUtils.info("回复失败！");
		}
		return map;
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
			LogUtils.info("删除成功！删除的帖子id为：{}", aid);
		}
		return map;
	}
	
	
}
