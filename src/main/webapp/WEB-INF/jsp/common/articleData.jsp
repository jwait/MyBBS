<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<a href="${pageContext.request.contextPath}/article/details/${t.aid }">
	<c:out value="${t.title }"></c:out>
</a>
<div style="float: right;">
	<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
	<c:choose>
		<c:when test="${t.author.uid eq user.uid }">
			<a href="${pageContext.request.contextPath}/user/manager/${t.author.uid}">${t.author.username }</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/user/info/${t.author.uid}">${t.author.username }</a>
		</c:otherwise>
	</c:choose>
</div>
<br />
</h4>
<c:if test="${!empty t.lable }">
	<span class="lable lable-success">#${t.lable }#</span>
</c:if>
<p style="float: right;">
<fmt:formatDate value="${t.date }" pattern="MM/dd HH:mm:ss" />
</p>
<br>