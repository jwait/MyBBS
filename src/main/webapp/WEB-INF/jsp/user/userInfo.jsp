<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=0.3">
<title>${uInfo.username }的信息</title>
<%@include file="../common/import.jsp"%>
</head>
<body>
	<div class="container" style="box-shadow: 0px 0px 1px #888888">
		<%@include file="../common/head.jsp" %><br>
		<div class="row">
			<div class="col-md-2">
				<div class="info">
					<img alt="headimg" src="<c:url value="${uInfo.headimg }"/>" class="img-thumbnail"/>
				</div>
				<h4><center>用户名：${uInfo.username}</center></h4>
			</div>
		</div>
		<div class="myArticle">
			<c:choose>
				<c:when test="${empty userArticle }">
					<br><h3>未发表过任何帖子！</h3>
				</c:when>
				<c:otherwise>
					<h3>发表过的帖子</h3>
					<table class="table table-hover">
						<tr class="something">
							<th class="col-md-10">标题</th>
							<th class="col-md-2">发帖日期</th>
						<tr>
						<c:forEach var="ua" items="${userArticle }">
							<tr>
								<td>
									<span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
									<a href="${pageContext.request.contextPath }/article/details/${ua.aid}/1">
										<c:out value="${ua.title }"></c:out>
									</a>
								</td>
								<td>
									<fmt:formatDate value="${ua.date }" pattern="MM/dd HH:mm:ss"/>
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<%@include file="../common/foot.jsp" %>
	</div>
</body>
</html>