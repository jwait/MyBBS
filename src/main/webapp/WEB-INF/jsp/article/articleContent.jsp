<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=0.3">
<title>帖子内容</title>
<%@include file="../common/import.jsp" %>
</head>
<body>
	<div class="container" style="box-shadow: 0px 0px 1px #888888">
		<%@include file="../common/head.jsp" %>
		<div class="row">
			<div class="col-md-9">
				<div class="page-header">
					<h4><c:out value="${article.title }"></c:out></h4>
				</div>
				<div class="row">
					<div class="panel panel-default" style="border-radius: 0;">
						<div class="panel-body">
							<div class="col-md-2" style="background-color:#f1f1f1;">
								<center>
									<c:choose>
										<c:when test="${article.author.uid eq user.uid }">
											<a href="${pageContext.request.contextPath }/user/manager/${article.author.uid}">
												<img alt="headimg" style="width: 111px;" src="<c:url value="${article.author.headimg }"/>" class="img-thumbnail">
											</a>
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath }/user/info/${article.author.uid}">
												<img alt="headimg" style="width: 111px;" src="<c:url value="${article.author.headimg }"/>" class="img-thumbnail">
											</a>
										</c:otherwise>
									</c:choose>
									<br><br>楼主：&nbsp;
									<c:choose>
										<c:when test="${article.author.uid eq user.uid }">
											<a href="${pageContext.request.contextPath}/user/manager/${article.author.uid}">${article.author.username }</a>
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/user/info/${article.author.uid}">${article.author.username }</a>
										</c:otherwise>
									</c:choose>
								</center>
							</div>
							<div class="col-md-8" >
								<c:out value="${article.content }" escapeXml="false"></c:out>
							</div>
						</div>
						<h5 class="pull-right">
							发布时间：<fmt:formatDate value="${article.date }" pattern="MM/dd HH:mm:ss"/>&nbsp;
						</h5>
					</div>
					<h5>共${commentPageBean.count }条评论</h5>
				</div>
				
				<%-- 评论列表 --%>
				<c:forEach var="c" items="${commentPageBean.list }" varStatus="vs">
					<div class="row"  style="box-shadow: 0px 0px 1px #888888;">
						<div class="panel panel-default" style="border-radius: 0;">
							<div class="panel-body">
								<div class="col-md-2" style="background-color:#f4f7f6;">
									<center>
										<c:choose>
											<c:when test="${c.uid eq user.uid }">
												<a href="${pageContext.request.contextPath }/user/manager/${c.uid}">
													<img alt="headimg" style="width: 111px;" src="<c:url value="${c.replyer.headimg }"/>" class="img-thumbnail">
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath }/user/info/${c.uid}">
													<img alt="headimg" style="width: 111px;" src="<c:url value="${c.replyer.headimg }"/>" class="img-thumbnail">
												</a>
											</c:otherwise>
										</c:choose>
										
										<br><br>
										<c:if test="${c.uid eq article.author.uid }">楼主:</c:if>
										<c:choose>
											<c:when test="${c.uid eq user.uid }">
												<a href="${pageContext.request.contextPath}/user/manager/${c.uid}">${c.replyer.username }</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/user/info/${c.uid}">${c.replyer.username }</a>
											</c:otherwise>
										</c:choose>
										<%-- <a href="${pageContext.request.contextPath }/user/info/${c.uid}">
											${c.replyer.username }
										</a> --%>
									</center>
								</div>
								<div class="col-md-10">
									<c:out value="${c.content }" escapeXml="false"></c:out>
									<br><br>
									<%--楼中楼评论 --%>
									<div class="media" id="media${c.cid}" style="background-color:#f7f8fa;border-radius: 0;">
										<c:forEach var="f" items="${Floor }">
											<c:if test="${f.cid eq c.cid }">
												<!-- 头像 -->
												<div class="media-left">
													<c:choose>
														<c:when test="${f.floorReplyer.uid eq user.uid }">
															<a href="${pageContext.request.contextPath }/user/manager/${f.uid}">
																<img class="media-object" style="width: 34px;height:30px;" src="<c:url value="${f.floorReplyer.headimg }"/>"/>
															</a>
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath }/user/info/${f.uid}">
																<img class="media-object" style="width: 34px;height:30px;" src="<c:url value="${f.floorReplyer.headimg }"/>"/>
															</a>
														</c:otherwise>
													</c:choose>
												</div>
												<!-- 评论内容 -->
												<div class="media-body" style="width:1000px;">
													<c:choose>
														<c:when test="${f.floorReplyer.uid eq user.uid }">
															<a href="${pageContext.request.contextPath }/user/manager/${f.uid }">${f.floorReplyer.username }</a>：&nbsp;
														</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath }/user/info/${f.uid }">${f.floorReplyer.username }</a>：&nbsp;
														</c:otherwise>
													</c:choose>
													<c:out value="${f.content }"></c:out>
													<h5 class="pull-right">
														<span id="replyMessage${f.fid }" class="glyphicon"> </span>
														<c:if test="${f.floorReplyer.uid eq user.uid }">
															<button type="button" class="label label-default" onclick="deleteFloorReplyer(${f.fid})">删除</button>
														</c:if>
														&nbsp;
														<fmt:formatDate value="${f.date }" pattern="MM/dd HH:mm:ss"/>&nbsp;
														<a onclick="floorInput('${c.cid}', '${f.floorReplyer.username }')" style="cursor:pointer;">&nbsp;回复&nbsp;</a>
													</h5>
												</div>
												<br>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="replyMsg">
								<h5 style="float: right;">
									<span id="commentMessage${c.cid }" class="glyphicon"> </span>
									<c:if test="${c.uid eq user.uid }">
										<button type="button" class="delete" onclick="deleteComment(${c.cid})">删除</button>
									</c:if>
									<span id="returnMessage1" class="glyphicon"> </span>
									${vs.count + (commentPageBean.currentPage-1)*commentPageBean.pageSize }楼
									<fmt:formatDate value="${c.date }" pattern="MM/dd HH:mm:ss"/>&nbsp;
									<a onclick="openFloorInput(${c.cid})" style="cursor:pointer;">&nbsp;回复&nbsp;</a>
								</h5>
							</div>
						</div>
						<br>
						<!-- 楼中楼评论框 -->
						<div class="floor" id="floor${c.cid }" style="display: none; width: 50%; float: right;">
							<textarea class="form-control" rows="3" id="text${c.cid }"></textarea>
							<input class="btn btn-primary" type="submit" onClick="floorReply(${c.cid })" value="回复" style="float: right;">
						</div>
					</div>
				</c:forEach>
			    <div id="example" style="text-align: center">  
				    <ul id="pageLimit"></ul>  
				</div>  
				<!-- 评论框 -->
				<c:choose>
					<c:when test="${!empty user }">
						<div style="padding-top: 50px;">
							<div id="content" style="height: 240px;"></div>
							<button type="button" class="btn btn-primary" id="addbtn" onclick="reply()" 
							style="float:right;">回复</button>
						</div>
					</c:when>
					<c:otherwise>
						<center>
							<h3>登录后才能回帖！</h3>
						</center>
					</c:otherwise>
				</c:choose>
				<span id="returnMessage" class="glyphicon"> </span>
			</div>
			<div class="col-md-3">
				<%--头像用户昵称 --%>
				<div style="padding-top: 40px;">
					<center>
						<c:choose>
							<c:when test="${empty user }">
								<img src="<c:url value="/resources/imgs/head.png"/>" class="img-circle" data-toggle="modal" data-target="#myModal" />
								<br />
								<br />用户名：
								<a href="javaScript.void(0);" data-toggle="modal" data-target="#myModal">未登录</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/user/manager/${user.uid }">
									<img alt="${user.username }" src="<c:url value="${user.headimg }"/>" class="img-circle img-responsive" style="width: 120px; height: 120px;" />
								</a>
								<br />用户名：${user.username }
								<a href="<c:url value="/user/exit"/>">安全退出</a>
							</c:otherwise>
						</c:choose>
					</center>
				</div>
				<%--弹出对话框 --%>
				<%@include file="../common/login.jsp"%>
			</div>
		</div>
		<input id="context" type="hidden" value="${pageContext.request.contextPath}" />
		<%@include file="../common/foot.jsp" %>
		<%@include file="../common/editor.jsp" %>
	</div>
<script type="text/javascript" src="<c:url value="/resources/js/loginRegist.js"/>"></script>
<script type="text/javascript">

	$('#pageLimit').bootstrapPaginator({
	    currentPage: ${commentPageBean.currentPage},
	    totalPages: ${commentPageBean.totalPage},
	    size:"normal",
	    bootstrapMajorVersion: 3,
	    alignment:"right",
	    numberOfPages:5,
	    itemTexts: function (type, page, current) {
	        switch (type) {
	        case "first": return "首页";
	        case "prev": return "上一页";
	        case "next": return "下一页";
	        case "last": return "末页";
	        case "page": return page;
	        }//默认显示的是第一页。
	    },
        onPageClicked: function (event, originalEvent, type, page){//给每个页眉绑定一个事件，其实就是ajax请求，其中page变量为当前点击的页上的数字。
        	location.href = "${pageContext.request.contextPath}/article/details/${article.aid }/" + page;
        }
	});
	
	//删除评论
	function deleteComment(cid){
		$.get("${pageContext.request.contextPath}/comment/delete/"+cid, function(data){
			if(data.data == 0){
				$("#commentMessage" + cid).hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
				location.href = "${pageContext.request.contextPath}/article/list/all/1";
			}else{
				if(data.data == 1)
					$("#commentMessage" + cid).hide().html('<label class="label label-success">删除成功！</label>').show(300);
				else
					$("#commentMessage" + cid).hide().html('<label class="label label-danger">删除失败！</label>').show(300);
				setTimeout(function(){
					location.href = "${pageContext.request.contextPath}/article/details/${article.aid }/1";
				},500);
			}
		},"json");
	}
	
	//删除楼中楼回复
	function deleteFloorReplyer(fid){
		$.get("${pageContext.request.contextPath}/comment/floor/delete/"+fid, function(data){
			if(data.data == 0){
				$("#replyMessage" + fid).hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
				location.href = "${pageContext.request.contextPath}/article/list/all/1";
			}else{
				if(data.data == 1)
					$("#replyMessage" + fid).hide().html('<label class="label label-success">删除成功！</label>').show(300);
				else
					$("#replyMessage" + fid).hide().html('<label class="label label-danger">删除失败！</label>').show(300);
				setTimeout(function(){
					location.href = "${pageContext.request.contextPath}/article/details/${article.aid }/1";
				},500);
			}
		},"json");
	}
	//回帖
	function reply(){
		var url = "${pageContext.request.contextPath}/comment/add";
		var params = {
			content : editor.$txt.html(),
			aid : '${article.aid}',
			uid : '${user.uid }'
		};
		$.ajax({
			'url' : url,
			'data' : params,
			'contentType' : "application/x-www-form-urlencoded; charset=utf-8",
			'type' : 'POST',
			'success' : function(data){
				if(data.data == 1){
					$("#returnMessage").hide().html('<label class="label label-success">评论成功！</label>').show(300);
					setTimeout(function(){
						location.href = "${pageContext.request.contextPath}/article/details/${article.aid }/1";
					},500);
				}else{
					$("#returnMessage").hide().html('<label class="label label-danger">评论不能为空！</label>').show(300);
				}
			},
			'error' : function(){
				$("#returnMessage").hide().html('<label class="label label-danger">评论失败！</label>').show(300);
			}
		});
	}
	//楼中楼回复框
	function floorInput(num, name){
		$('#floor' + num).slideToggle();
		$('#text' + num).focus();
		$('#text' + num).attr("placeholder", "回复  "+ name +" :" );
		$('#text' + num).attr("name", name);
	}
	
	function openFloorInput(num){
		$('#floor' + num).slideToggle();
		$('#text' + num).focus();
		$('#text' + num).val("");
	}
	
	function floorReply(num){
		//文本框内容
		var t = $('#text' + num).val();
		if($('#text' + num).attr("placeholder") != null){
			t = "回复 " + $('#text' + num).attr("name") + " :" + t;
		}
		//请求服务器，插入评论
		var url = "${pageContext.request.contextPath}/comment/floor/add";
		var params = {
			cid : num,
			aid : '${article.aid}',
			uid : '${user.uid}',
			content : t,
			date :new Date()
		};
		$.ajax({
			'url' : url,
			'data' : params,
			'contentType' : "application/x-www-form-urlencoded; charset=utf-8",
			'type' : 'POST',
			'success' : function(data){
				if(data.data == 2){
					var t1 = '<div class="media-left">'+
					'<a href="${pageContext.request.contextPath }/user/manager/${user.uid}">'+
						'<img class="media-object" style="width: 34px;height:30px;" src="${user.headimg == "/resources/imgs/head.png" ? pageContext.request.contextPath : ""}${user.headimg}"/>'+
					'</a>'+
					'</div>'+
					'<div class="media-body" style="width:1000px;">'+
						'<a href="${pageContext.request.contextPath }/user/manager/${user.uid }">${user.username }</a>：&nbsp;'+
							t+
						'<h5 id="test" class="pull-right">'+
							'<button type="button" class="label label-default" onclick="deleteFloorReplyer('+data.floorId+')">删除</button>&nbsp;&nbsp;'+
							'<fmt:formatDate value="<%=new Date()%>" pattern="MM/dd HH:mm:ss"/>&nbsp;'+
							'<a onclick="floorInput(\''+num+'\', \'${user.username }\')" style="cursor:pointer;">&nbsp;&nbsp;回复&nbsp;</a>'+
						'</h5>'+
					'</div><br>';
					$("#media" + num).append(t1);
					$("#text" + num).val("");
					$("#floor" + num).slideUp();
				}else if(data.data == 1){
					$("#returnMessage1").hide().html('<label class="label label-danger">回复不能为空！</label>').show(300);
				}else{
					$("#returnMessage1").hide().html('<label class="label label-danger">请先登陆！</label>').show(300);
				}
			},
			'error' : function() {
				$("#returnMessage1").hide().html('<label class="label label-danger">回复失败！</label>').show(300);
			}
		});
	}
</script>
</body>
</html>