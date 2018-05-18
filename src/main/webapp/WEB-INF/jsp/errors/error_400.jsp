<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE>服务器不见了，请稍后访问！</TITLE>
<%@include file="../common/import.jsp" %>
</head>
<body leftmargin="10" topmargin="10" marginwidth="10" marginheight="10" style="table-layout:fixed; word-break:break-all">
	<section id="error" class="container text-center">
		<h1>400， 请求出错 ！</h1>
		<p>由于语法格式有误，服务器无法理解此请求。不作修改，客户程序就无法重复此请求。 </p>
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/">回到网站首页</a>
	</section>
</body>
</html>