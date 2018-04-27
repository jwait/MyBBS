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
		<h4>查询关键字:"${key }",共查询到${fn:length(resultList) }篇帖子！</h4>
		<table class="table table-hover">
			<c:forEach var="rl" items="${resultList }">
				<tr>
					<td>
						<span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
						<a href="${pageContext.request.contextPath }/article/details/${rl.aid}" target="_blank">
							<c:out value="${rl.title }"></c:out>
						</a>
						<div style="float: right;">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<c:choose>
								<c:when test="${rl.author.uid eq user.uid }">
									<a href="${pageContext.request.contextPath}/user/manager/${rl.author.uid}">${rl.author.username }</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/user/info/${rl.author.uid}">${rl.author.username }</a>
								</c:otherwise>
							</c:choose>&nbsp; &nbsp; 
							<fmt:formatDate value="${rl.date }" pattern="MM/dd HH:mm:ss"/>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@include file="./common/foot.jsp" %>
	</div>
</body>