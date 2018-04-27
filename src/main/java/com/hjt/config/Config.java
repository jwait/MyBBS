package com.hjt.config;

public class Config {
	
	//默认头像地址
	public static final String DEFAULT_HEADIMG_ADDRESS = "/resources/imgs/head.png";
	
	//默认头像上传地址
	public static final String DEFAULT_UPLOAD_ADDRESS = "/resources/upload/";
	
	//默认分页大小
	public static final int DEFAULT_PAGESIZE = 10;
	
	//置顶贴状态
	public static final int STATUS_TOP = 1;
	
	//加精贴状态
	public static final int STATUS_HOT = 2;
	
	//置顶且加精贴状态
	public static final int STATUS_TOP_HOT = 3;
	
	//七牛云AccessKey
	public static final String QINIU_ACCESS_KEY = "EOEDJh1QEYm8ixvTvf7fgbwKzZSfdKntJOH2-TAM";
	
	//七牛云SecretKey
	public static final String QINIU_SECRET_KEY = "tj0Gjj_h3fiV-UDa0zs8wKS-yPuvH7AmXKZpmZVb";
	
	//七牛云头像存储bucket
	public static final String QINIU_BUCKET = "mybbs";
	
	//七牛云图片存储测试地址
	public static final String QINIU_IMG_URL = "http://ousfjjmwl.bkt.clouddn.com/";
	
	
}
