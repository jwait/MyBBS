<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE>服务器不见了，请稍后访问！</TITLE>
<%@include file="../common/import.jsp" %>
</head>
<body>
	<section id="error" class="container text-center">
		<h1>500， 服务器内部错误！</h1>
		<p>请稍后再进行访问。</p>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/">回到网站首页</a>
	</section>
</body>
</html>