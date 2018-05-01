package com.hjt.service;

import java.sql.Timestamp;
import java.util.List;

import com.hjt.pojo.Comment;
import com.hjt.pojo.Floor;
import com.hjt.pojo.PageBean;

public interface CommentService {
	
	public int addComment(String content, Integer aid, Integer uid, Timestamp timestamp);
	
	public PageBean findComment(Integer aid, Integer uid, Integer currentPage, Integer pageSize);
	
	public int getCommentCount(Integer aid);
	
	public List<Floor> findFloorComment(Integer aid, Integer cid);
	
	public int addFloorComment(Floor floor);
	
	public int deleteFloorReplyByFid(Integer fid);
	
	public int deleteCommentByCid(Integer cid);
}
