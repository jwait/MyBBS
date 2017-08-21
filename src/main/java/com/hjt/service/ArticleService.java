package com.hjt.service;

import java.sql.Timestamp;
import java.util.List;

import com.hjt.pojo.Article;
import com.hjt.pojo.PageBean;

public interface ArticleService {
	
	public List<Article> getArticleList();
	
	public Article getArticleByID(Integer aid);
	
	public int addArticle(String title, String content, Timestamp timestamp, Integer aid, String label);
	
	public List<Article> getArticleByUID(Integer uid);
	
	public int deleteArticle(Integer aid);
	
	public PageBean getArticlePageList(int currentPage, int pageSize);
	
	public List<Article> searchArticleByKey(String key);
	
	public List<Article> getArticleByStatus(List<Integer> statusList);
	
}
