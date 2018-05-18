<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE>您访问的页面错误或者已经不存在</TITLE>
<%@include file="../common/import.jsp" %>
</head>
<body>
	<section id="error" class="container text-center">
		<h1>404， 页面没有找到！</h1>
		<p>您正在寻找的页面不存在或发生其他错误。</p>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/">回到网站首页</a>
	</section>
</body>
</html>