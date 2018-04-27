package com.hjt.service;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hjt.pojo.Article;
import com.hjt.pojo.PageBean;

public interface ArticleService {
	
	public List<Article> getArticleList();
	
	public Article getArticleByID(Integer aid);
	
	public int addArticle(String title, String content, Timestamp timestamp, Integer aid, String label, String type);
	
	public List<Article> getArticleByUID(Integer uid);
	
	public List<Article> getArticleByPass(Integer pass);
	
	public int deleteArticle(Integer aid);
	
	public PageBean getArticlePageListByType(String type, int currentPage, int pageSize);
	
	public List<Article> searchArticleByKey(String key);
	
	public List<Article> getArticleByStatus(List<Integer> statusList);
	
	public int updateArticleByID(Integer aid);
	
	public int updateArticleStatusByID(Integer aid, Integer status);
	
	public PageBean getArticlePageList(int currentPage, int pageSize);
}
