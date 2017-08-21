package com.hjt.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hjt.service.CommentService;
import com.hjt.util.LogUtils;
import com.hjt.util.StringUtils;

@Controller
@RequestMapping("comment")
public class CommentController {
	
	@Autowired 
	private CommentService commentService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> addComment(@RequestParam("content")String content,
			@RequestParam("aid")Integer aid, @RequestParam("uid")Integer uid){
		Map<String, Integer> map = new HashMap<>();
		if(StringUtils.isEmpty(content) || StringUtils.isBlank(content)){
			map.put("data", 0);
			return map;
		}
		int result = commentService.addComment(content, aid, uid, new Timestamp(new Date().getTime()));
		if(result > 0){
			map.put("data", 1);
			LogUtils.info("回帖成功！内容为：{}", content);
		}else{
			LogUtils.info("回帖失败！");
		}
		return map;
	}
	
}
