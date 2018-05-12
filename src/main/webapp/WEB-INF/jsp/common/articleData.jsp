<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<a href="${pageContext.request.contextPath}/article/details/${t.aid }/1"">
	<c:out value="${t.title }"></c:out>
</a>
</h4>
<h5>
<c:if test="${!empty t.lable }">
	<span class="lable lable-success">#${t.lable }#</span>
</c:if>
</h5>
</td>
<td>
	<h4>
	<!-- <span class="glyphicon glyphicon-user" aria-hidden="true"></span> -->
	<img alt="${t.author.username }" src="<c:url value="${t.author.headimg }"/>" class="img-circle" style="width: 19px; height: 19px;"/>
	<c:choose>
		<c:when test="${t.author.uid eq user.uid }">
			<a href="${pageContext.request.contextPath}/user/manager/${t.author.uid}">${t.author.username }</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/user/info/${t.author.uid}">${t.author.username }</a>
		</c:otherwise>
	</c:choose>
	</h4>
<h5>
<fmt:formatDate value="${t.date }" pattern="MM/dd HH:mm:ss" />
</h5>
