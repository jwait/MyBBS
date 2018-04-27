package com.hjt.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hjt.dao.ArticleDao;
import com.hjt.pojo.Article;
import com.hjt.pojo.PageBean;
import com.hjt.service.ArticleService;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;
	
	@Override
	public List<Article> getArticleList() {
		return articleDao.getArticleList();
	}

	@Override
	public Article getArticleByID(Integer aid) {
		return articleDao.getArticleByID(aid);
	}

	@Override
	public int addArticle(String title, String content, Timestamp timestamp, Integer aid, String label, String type) {
		return articleDao.addArticle(title, content, timestamp, aid, label, type);
	}

	@Override
	public List<Article> getArticleByUID(Integer uid) {
		return articleDao.getArticleByUID(uid);
	}

	@Override
	public List<Article> getArticleByPass(Integer pass) {
		return articleDao.getArticleByPass(pass);
	}
	
	@Override
	public int deleteArticle(Integer aid) {
		return articleDao.deleteArticleByID(aid);
	}

	@Override
	public PageBean getArticlePageListByType(String type, int currentPage, int pageSize) {
		int count = articleDao.getArticleListByType(type).size();
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);
		List<Article> list = articleDao.getArticlePageListByType(type, (currentPage - 1) * pageSize, pageSize);
		PageBean pageBean = new PageBean(currentPage, pageSize, count, totalPage, list);
		return pageBean;
	}

	@Override
	public List<Article> searchArticleByKey(String key) {
		return articleDao.searchArticleByKey(key);
	}

	@Override
	public List<Article> getArticleByStatus(List<Integer> statusList) {
		return articleDao.getArticleListByStatus(statusList);
	}

	@Override
	public int updateArticleByID(Integer aid) {
		return articleDao.updateArticleByID(aid);
	}

	@Override
	public int updateArticleStatusByID(Integer aid, Integer status) {
		return articleDao.updateArticleStatusByID(aid, status);
	}

	@Override
	public PageBean getArticlePageList(int currentPage, int pageSize) {
		int count = articleDao.getArticleList().size();
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);
		List<Article> list = articleDao.getArticlePageList((currentPage - 1) * pageSize, pageSize);
		PageBean pageBean = new PageBean(currentPage, pageSize, count, totalPage, list);
		return pageBean;
	}
}
