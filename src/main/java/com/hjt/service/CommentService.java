package com.hjt.service;

import java.sql.Timestamp;
import java.util.List;

import com.hjt.pojo.Comment;
import com.hjt.pojo.Floor;

public interface CommentService {
	
	public int addComment(String content, Integer aid, Integer uid, Timestamp timestamp);
	
	public List<Comment> findComment(Integer aid, Integer uid);
	
	public int getCommentCount(Integer aid);
	
	public List<Floor> findFloorComment(Integer aid, Integer cid);
	
	public int addFloorComment(Integer aid, Integer cid, Integer uid, String content);
	
}
