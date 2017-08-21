package com.hjt.pojo;

import java.io.Serializable;
import java.util.List;

public class PageBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer currentPage;
	private Integer pageSize;
	private Integer count;
	private Integer totalPage;
	private List<?> list;
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public List<?> getList() {
		return list;
	}
	public void setList(List<?> list) {
		this.list = list;
	}
	public PageBean(Integer currentPage, Integer pageSize, Integer count, Integer totalPage, List<?> list) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.count = count;
		this.totalPage = totalPage;
		this.list = list;
	}
	
	public PageBean() {
		// TODO Auto-generated constructor stub
	}
}
