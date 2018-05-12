<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=0.3">
<title>主页</title>
<%@include file="../common/import.jsp"%>
</head>
<body>
	<div class="container" style="padding-top: 70px;">
		<%@include file="../common/head.jsp"%><br>
		<ol class="breadcrumb">
		    <li><a id="parent" href="#"></a></li>
		    <li id="type0" class="active"></li>
		</ol>
		<nav class="navbar navbar-default  navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" id="all" onclick="choose(this)" href="#">全部</a>
				</div>
		
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-type="校园生活区" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								校园生活区
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" style="min-width:100%;">
								<li>
									<a id="schoolNews" onclick="choose(this)" href="#">校内新闻</a>
								</li>
								<li>
									<a id="freshman" onclick="choose(this)" href="#">新生专区</a>
								</li>
								<li>
									<a id="socialActivity" onclick="choose(this)" href="#">社团活动</a>
								</li>
								<li>
									<a id="lostAndFound" onclick="choose(this)" href="#">失物招领</a>
								</li>
								<li>
									<a id="datingZone" onclick="choose(this)" href="#">交友专区</a>
								</li>
								<li>
									<a id="unspoken" onclick="choose(this)" href="#">不吐不快</a>
								</li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-type="学习专区" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								学习专区
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" style="min-width:100%;">
								<li>
									<a id="learningResource" onclick="choose(this)" href="#">学习资源</a>
								</li>
								<li>
									<a id="learningExchange" onclick="choose(this)" href="#">学习交流</a>
								</li>
								<li>
									<a id="courseEvaluation" onclick="choose(this)" href="#">课程评价</a>
								</li>
								<li>
									<a id="elective" onclick="choose(this)" href="#">选修交流</a>
								</li>
								<li>
									<a id="literaryExchange" onclick="choose(this)" href="#">文学交流</a>
								</li>
								<li>
									<a id="bookEvaluation" onclick="choose(this)" href="#">图书评价</a>
								</li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-type="综合市场区" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								综合市场区
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" style="min-width:100%;">
								<li>
									<a id="fleaMarket" onclick="choose(this)" href="#">跳蚤市场</a>
								</li>
								<li>
									<a id="parttimejob" onclick="choose(this)" href="#">兼职信息</a>
								</li>
								<li>
									<a id="houseRenting" onclick="choose(this)" href="#">房屋租凭</a>
								</li>
								<li>
									<a id="employmentPractice" onclick="choose(this)" href="#">就业实习</a>
								</li>
								<li>
									<a id="jobAdvertisement" onclick="choose(this)" href="#">招聘广告</a>
								</li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-type="娱乐专区" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								娱乐专区
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" style="min-width:100%;">
								<li>
									<a id="physicalFitness" onclick="choose(this)" href="#">体育健身</a>
								</li>
								<li>
									<a id="game" onclick="choose(this)" href="#">游戏天地</a>
								</li>
								<li>
									<a id="animeMovie" onclick="choose(this)" href="#">动漫电影</a>
								</li>
								<li>
									<a id="music" onclick="choose(this)" href="#">音乐天地</a>
								</li>
							</ul>
						</li>
						<li>
							<a id="other" onclick="choose(this)" href="#">其他</a>
						</li>
					</ul>
					<form class="navbar-form navbar-right" action="${pageContext.request.contextPath }/article/search" method="post" role="search" >
						<div class="form-group">
							<input type="text" name="key" class="form-control" placeholder="Search" maxlength="15"/>
						</div>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span>
							搜索
						</button>
					</form>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid --> 
		</nav>
		<div class="row" >
			<div class="col-md-8">
				<c:choose>
					<c:when test="${articlePageBean.totalPage!=0 }">
						<table class="table table-hover">
							<tr>
								<th class="col-md-9">标题/标签</th>
								<th class="col-md-3">用户名/发帖日期</th>
							</tr>
							<%-- 置顶的帖子 --%>
							<c:forEach var="t" items="${topArticle }">
								<tr>
									<td>
										<h4>
										<span class="label label-primary">置顶</span>
										<c:if test="${t.status eq 3 }">
											<span class="label label-danger">精</span>
										</c:if>
										<%@include file="../common/articleData.jsp"%>
									</td>
								</tr>
							</c:forEach>
							<c:choose>
								<c:when test="${type eq 'all' or empty type }">
									<%-- 未置顶的帖子 --%>
									<c:forEach var="t" items="${articlePageBean.list }">
										<c:if test="${t.status ne 1 and t.status ne 3 }">
											<tr>
												<td>
													<h4>
													<c:if test="${t.status eq 2 }">
														<span class="label label-danger">精</span>
													</c:if>
													<%@include file="../common/articleData.jsp"%>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="t" items="${articlePageBean.list }">
										<tr>
											<td>
												<h4>
												<c:if test="${t.status eq 2 or t.status eq 3}">
													<span class="label label-danger">精</span>
												</c:if>
												<%@include file="../common/articleData.jsp"%>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
						<%-- 分页 --%>
						<div id="example" style="text-align: center">  
						    <ul id="pageLimit"></ul>  
						</div>
					</c:when>
					<c:otherwise>
						未查到任何记录！
					</c:otherwise>
				</c:choose>
				<%-- 发帖框 --%>
				<c:choose>
					<c:when test="${!empty user }">
						<div style="padding-top: 100px;">
							<input type="text" class="form-control" maxLength="20" id="title" placeholder="输入帖子标题" />
							<div id="content" style="height: 240px;"></div>
							<h5 style="float: left;">选择发帖的板块：</h5>
							<select id="type" class="form-control" style="width:200px; float: left;">
								<optgroup label="校园生活区">
									<option id="schoolNews">校内新闻</option>
									<option id="freshman">新生专区</option>
									<option id="socialActivity">社团活动</option>
									<option id="lostAndFound">失物招领</option>
									<option id="datingZone">交友专区</option>
									<option id="unspoken">不吐不快</option>
								</optgroup>
								<optgroup label="学习专区">
									<option id="learningResource">学习资源</option>
									<option id="learningExchange">学习交流</option>
									<option id="courseEvaluation">课程评价</option>
									<option id="elective">选修交流</option>
									<option id="literaryExchange">文学交流</option>
									<option id="bookEvaluation">图书评价</option>
								</optgroup>
								<optgroup label="综合市场区">
									<option id="fleaMarket">跳蚤市场</option>
									<option id="parttimejob">兼职信息</option>
									<option id="houseRenting">房屋租凭</option>
									<option id="employmentPractice">就业实习</option>
									<option id="jobAdvertisement">招聘广告</option>
								</optgroup>
								<optgroup label="娱乐专区">
									<option id="physicalFitness">体育健身</option>
									<option id="game">游戏天地</option>
									<option id="animeMovie">动漫电影</option>
									<option id="music">音乐天地</option>
								</optgroup>
								<optgroup label="其他">
									<option id="other">其他</option>
								</optgroup>
							</select>
							<button type="button" class="btn btn-primary pull-right" id="addbtn" onclick="doClick()">发布</button>
							<input type="text" class="form-control pull-right" maxLength="20" id="lable" placeholder="#输入帖子标签#" style="width: 200px;" />
						</div>
					</c:when>
					<c:otherwise>
						<center>
							<br><br>
							<h3>登陆后才能发帖！</h3>
						</center>
					</c:otherwise>
				</c:choose>
				<span id="returnMessage1" class="glyphicon"> </span>
			</div>
			<div class="col-md-4">
				<%--头像用户昵称 --%>
				<div style="padding-top: 40px;">
					<center>
						<c:choose>
							<c:when test="${empty user }">
								<img src="<c:url value="/resources/imgs/head.png"/>" class="img-circle" data-toggle="modal" data-target="#myModal" />
								<br />
								<br />
								<a href="#" data-toggle="modal" data-target="#myModal">登录</a>&nbsp;|
								<a href="#" data-toggle="modal" data-target="#myModal1">注册</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/user/manager/${user.uid }">
									<img alt="${user.username }" src="<c:url value="${user.headimg }"/>" class="img-circle img-responsive" style="width: 224px; height: 224px;" />
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
		<%@include file="../common/foot.jsp"%>
	</div>
	<script type="text/javascript" src="<c:url value="/resources/js/loginRegist.js"/>"></script>
	<script type="text/javascript">
	
	$('#pageLimit').bootstrapPaginator({
	    currentPage: ${articlePageBean.currentPage},
	    totalPages: ${articlePageBean.totalPage},
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
        	location.href = "${pageContext.request.contextPath}/article/list/${type }/" + page;
        }
	});
	
		//发帖
		function doClick() {
			var contentStr = editor.$txt.html();
			var params = {
				title : $('#title').val(),
				content : contentStr,
				uid : '${user.uid}',
				lable : $('#lable').val(),
				type : $('#type option:selected').attr('id')
			}; 
			$.ajax({
				'url' : '${pageContext.request.contextPath}/article/add',
				'data' : params,
				'contentType' : "application/x-www-form-urlencoded; charset=utf-8",
				'type' : 'POST', 
				async: false,//同步，会阻塞操作
                complete: function (msg) {
                    console.log('发帖成功');
                },
				'success' : function(data) {
					if(data.data == 1){
						$("#returnMessage1").hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
					}else if(data.data == 2){
						$("#returnMessage1").hide().html('<label class="label label-danger">发帖标题不能为空！</label>').show(300);
					}else if(data.data == 3){
						$("#returnMessage1").hide().html('<label class="label label-danger">发帖内容不能为空！</label>').show(300);
					}else{
						$("#returnMessage1").hide().html('<label class="label label-success">发帖成功！</label>').show(300);
						setTimeout(function(){
							location.href = "${pageContext.request.contextPath}/article/list/all/1";
						}, 500);
					}
				},
				'error' : function() {
					$("#returnMessage1").hide().html('<label class="label label-danger">发帖失败!</label>').show(300);
				}
			});
		}
		
		
	    
	    $(function (){
	    	var t = $('#${type}').html( )
	    	$('#type0').html(t);
	    	var p = $('#${type}').parent().parent().prev();
	    	if(p.prop("tagName") == 'A'){
	    		$('#parent').html(p.attr('data-type'));
	    	}else{
	    		$('#parent').parent().remove();
	    	}
	    });
	    
	    
	    function choose(data){
	    	location.href = "${pageContext.request.contextPath }/article/list/"+ data.id + "/1";
	    }
	</script>
	<%@include file="../common/editor.jsp"%>
</body>
</html>