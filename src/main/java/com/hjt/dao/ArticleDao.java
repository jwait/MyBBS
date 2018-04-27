package com.hjt.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hjt.pojo.Article;

public interface ArticleDao {
	
	public List<Article> getArticleList();
	
	public List<Article> getArticleListByType(@Param("type")String type);
	
	public Article getArticleByID(@Param("aid")Integer aid);
	
	public int addArticle(@Param("title") String title,
			@Param("content") String content,
			@Param("date") Timestamp timestamp,
			@Param("uid") Integer uid,
			@Param("lable") String lable,
			@Param("type") String type);
	
	public List<Article> getArticleByUID(@Param("uid")Integer uid);
	
	public List<Article> getArticleByPass(@Param("pass")Integer pass);
	
	public int deleteArticleByID(@Param("aid")Integer aid);
	
	public int updateArticleByID(@Param("aid")Integer aid);
	
	public List<Article> getArticlePageListByType(@Param("type")String type, @Param("currentPage")int currentPage, @Param("pageSize") int pageSize);
	
	public List<Article> searchArticleByKey(@Param("key")String key);
	
	public List<Article> getArticleListByStatus(List<Integer> statusList);
	
	public int updateArticleStatusByID(@Param("aid")Integer aid, @Param("status")Integer status);
	
	public List<Article> getArticlePageList(@Param("currentPage")int currentPage, @Param("pageSize") int pageSize);
}
