<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=0.3">
<title>搜索结果</title>
<%@include file="./common/import.jsp"%>
</head>
<body>
	<div class="container" style="box-shadow: 0px 0px 1px #888888">
		<%@include file="./common/head.jsp" %>
		<br><br>
		<div class="row">
			<div class="col-md-8"><h4>查询关键字:"${key }",共查询到${fn:length(resultList) }篇帖子！</h4></div>
			<div class="col-md-4">
			<form class="navbar-form navbar-right" action="${pageContext.request.contextPath }/article/search" method="post" role="search" >
				<div class="form-group">
					<input type="text" name="key" class="form-control" placeholder="Search" value="${key }" maxlength="15"/>
				</div>
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
					搜索
				</button>
			</form>
			</div>
		</div>
		<table class="table table-hover">
			<tr class="something">
				<th class="col-md-8">标题</th>
				<th class="col-md-2">用户名</th>
				<th class="col-md-2">发帖日期</th>
			<tr>
			<c:forEach var="rl" items="${resultList }">
				<tr>
					<td>
						<span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
						<a href="${pageContext.request.contextPath }/article/details/${rl.aid}/1" target="_blank">
							<c:out value="${rl.title }"></c:out>
						</a>
					</td>
					<td>
						<!-- <span class="glyphicon glyphicon-user" aria-hidden="true"></span> -->
						<img alt="${rl.author.username }" src="<c:url value="${rl.author.headimg }"/>" class="img-circle" style="width: 19px; height: 19px;"/>
						<c:choose>
							<c:when test="${rl.author.uid eq user.uid }">
								<a href="${pageContext.request.contextPath}/user/manager/${rl.author.uid}">${rl.author.username }</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/user/info/${rl.author.uid}">${rl.author.username }</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<fmt:formatDate value="${rl.date }" pattern="MM/dd HH:mm:ss"/>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@include file="./common/foot.jsp" %>
	</div>
</body>