package com.hjt.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
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

import com.hjt.pojo.Floor;
import com.hjt.pojo.User;
import com.hjt.service.CommentService;
import com.hjt.util.LogUtils;
import com.hjt.util.SensitiveWordFilter;
import com.hjt.util.StringUtils;

@Controller
@RequestMapping("comment")
public class CommentController {
	
	@Autowired 
	private CommentService commentService;
	
	private SensitiveWordFilter filter;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> addComment(@RequestParam("content")String content,
			@RequestParam("aid")Integer aid, @RequestParam("uid")Integer uid, HttpServletRequest request){
		Map<String, Integer> map = new HashMap<>();
		if(StringUtils.isEmpty(content) || StringUtils.isBlank(content)){
			map.put("data", 0);
			return map;
		}
		filter = new SensitiveWordFilter(request);
		content = filter.replaceSensitiveWord(content, 1, "*");
		int result = commentService.addComment(content, aid, uid, new Timestamp(new Date().getTime()));
		if(result > 0){
			map.put("data", 1);
			LogUtils.info("回帖成功！内容为：{}", content);
		}else{
			LogUtils.info("回帖失败！");
		}
		return map;
	}
	
	@RequestMapping(value="/floor/add", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> addFloorComment(HttpSession session, HttpServletRequest request,
			@RequestParam("cid")Integer cid, 
			@RequestParam("aid")Integer aid,
			@RequestParam("uid")Integer uid,
			@RequestParam("content")String content,
			@RequestParam("date")Date date){
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
		filter = new SensitiveWordFilter(request);
		content = filter.replaceSensitiveWord(content, 1, "*");
		Floor floor = new Floor(aid, cid, uid, content, new Timestamp(date.getTime()), user);
		int result = commentService.addFloorComment(floor);
		if(result > 0){
			LogUtils.info("楼中楼回复成功！内容：{}", content);
			map.put("data", 2);
			map.put("floorId", floor.getFid());
		}else{
			LogUtils.info("回复失败！");
		}
		return map;
	}
	
	@RequestMapping("/floor/delete/{fid}")
	@ResponseBody
	public Map<String, Integer> deleteFloorReply(HttpSession session, 
			@PathVariable("fid")Integer fid){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 0);
			return map;
		}
		int result = commentService.deleteFloorReplyByFid(fid);
		if(result > 0){
			map.put("data", 1);
			LogUtils.info("删除成功！删除的回复id为：{}", fid);
		}else{
			map.put("data", 2);
			LogUtils.info("删除失败！");
		}
		return map;
	}
	
	@RequestMapping("/delete/{cid}")
	@ResponseBody
	public Map<String, Integer> deleteComment(HttpSession session, 
			@PathVariable("cid")Integer cid){
		Map<String, Integer> map = new HashMap<>();
		User user = (User) session.getAttribute("user");
		if(user == null){
			map.put("data", 0);
			return map;
		}
		int result = commentService.deleteCommentByCid(cid);
		if(result > 0){
			map.put("data", 1);
			LogUtils.info("删除成功！删除的评论id为：{}", cid);
		}else{
			map.put("data", 2);
			LogUtils.info("删除失败！");
		}
		return map;
	}
}
