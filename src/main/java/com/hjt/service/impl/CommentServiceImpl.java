package com.hjt.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hjt.dao.CommentDao;
import com.hjt.pojo.Article;
import com.hjt.pojo.Comment;
import com.hjt.pojo.Floor;
import com.hjt.pojo.PageBean;
import com.hjt.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public int addComment(String content, Integer aid, Integer uid, Timestamp timestamp) {
		return commentDao.addComment(content, aid, uid, timestamp);
	}

	@Override
	public PageBean findComment(Integer aid, Integer uid, Integer currentPage, Integer pageSize) {
		int count = commentDao.getCommentCount(aid);
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);
		List<Comment> list = commentDao.findComment(aid, uid, (currentPage - 1) * pageSize, pageSize);
		PageBean pageBean = new PageBean(currentPage, pageSize, count, totalPage, list);
		return pageBean;
	}

	@Override
	public int getCommentCount(Integer aid) {
		return commentDao.getCommentCount(aid);
	}

	@Override
	public List<Floor> findFloorComment(Integer aid, Integer cid) {
		return commentDao.findFloorComment(aid, cid);
	}

	@Override
	public int addFloorComment(Floor floor) {
		return commentDao.addFloorComment(floor);
	}

	@Override
	public int deleteFloorReplyByFid(Integer fid) {
		return commentDao.deleteFloorReplyByFid(fid);
	}

	@Override
	public int deleteCommentByCid(Integer cid) {
		return commentDao.deleteCommentByCid(cid);
	}

}
