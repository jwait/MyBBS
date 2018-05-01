
package com.hjt.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import com.hjt.pojo.Comment;
import com.hjt.pojo.Floor;

public interface CommentDao {
	
	public int addComment(@Param("content")String content,
			@Param("aid")Integer aid,
			@Param("uid")Integer uid,
			@Param("date")Timestamp timestamp);
	
	public List<Comment> findComment(@Param("aid")Integer aid, @Param("uid")Integer uid, @Param("currentPage")Integer currentPage, @Param("pageSize")Integer pageSize);
	
	public int getCommentCount(@Param("aid")Integer aid);
	
	public List<Floor> findFloorComment(@Param("aid")Integer aid, @Param("cid")Integer cid);
	
	public int addFloorComment(Floor floor);

	public int deleteFloorReplyByFid(@Param("fid")Integer fid);
	
	public int deleteCommentByCid(@Param("cid")Integer cid);
}
