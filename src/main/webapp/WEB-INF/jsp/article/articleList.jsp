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
		<nav class="navbar navbar-default  navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" id="all" onclick="choose(this)" href="#">全部</a>
				</div>
		
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							<a id="studyLife" onclick="choose(this)" href="#">学习生活</a>
						</li>
						<li>
							<a id="socialActivity" onclick="choose(this)" href="#">社团活动</a>
						</li>
						<li>
							<a id="schoolNews" onclick="choose(this)" href="#">校内新闻</a>
						</li>
						<li>
							<a id="fleaMarket" onclick="choose(this)" href="#">跳蚤市场</a>
						</li>
						<li>
							<a id="music" onclick="choose(this)" href="#">音乐天地</a>
						</li>
						<li>
							<a id="employment" onclick="choose(this)" href="#">就业咨询</a>
						</li>
						<li>
							<a id="datingZone" onclick="choose(this)" href="#">交友专区</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								更多
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a id="physicalFitness" onclick="choose(this)" href="#">体育健身</a>
								</li>
								<li>
									<a id="game" onclick="choose(this)" href="#">游戏天地</a>
								</li>
								<li role="separator" class="divider"></li>
								<li>
									<a id="jobAdvertisement" onclick="choose(this)" href="#">招聘广告</a>
								</li>
								<li role="separator" class="divider"></li>
								<li>
									<a id="animeMovie" onclick="choose(this)" href="#">动漫电影</a>
								</li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-right" action="${pageContext.request.contextPath }/article/search" method="post" role="search" >
						<div class="form-group">
							<input type="text" name="key" class="form-control" placeholder="Search">
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
		<div class="row">
			<div class="col-md-8">
				<c:if test="${type eq 'all' or empty type }">
					<%-- 置顶的帖子 --%>
					<c:forEach var="t" items="${topArticle }">
						<div class="page-header">
							<h4>
								<span class="label label-primary">置顶</span>
								<c:if test="${t.status eq 3 }">
									<span class="label label-danger">精</span>
								</c:if>
								<%@include file="../common/articleData.jsp"%>
							</h4>
						</div>
					</c:forEach>
				</c:if>
				<%-- 未置顶的帖子 --%>
				<c:forEach var="t" items="${articlePageBean.list }">
					<c:if test="${t.status ne 1 and t.status ne 3 }">
						<div class="page-header">
							<h4>
								<c:if test="${t.status eq 2 }">
									<span class="label label-danger">精</span>
								</c:if>
								<%@include file="../common/articleData.jsp"%>
							</h4>
						</div>
					</c:if>
				</c:forEach>
				<%-- 分页 --%>
				<div style="float:right;">
					<a href="${pageContext.request.contextPath }/article/list/${type}/${articlePageBean.currentPage==1?1:articlePageBean.currentPage-1}"> 上一页&nbsp; </a>
					第${articlePageBean.currentPage }页/共${articlePageBean.totalPage}页&nbsp;
					<a href="${pageContext.request.contextPath }/article/list/${type}/${articlePageBean.currentPage==articlePageBean.totalPage?articlePageBean.totalPage:articlePageBean.currentPage+1}"> 下一页 </a>
				</div>
				<%-- 发帖框 --%>
				<c:choose>
					<c:when test="${!empty user }">
						<div style="padding-top: 100px;">
							<input type="text" class="form-control" maxLength="50" id="title" placeholder="输入帖子标题" />
							<div id="content" style="height: 240px;"></div>
							<h5 style="float: left;">选择发帖的板块：</h5>
							<select id="type" class="form-control" style="width:200px; float: left;">
								<optgroup label="常用">
									<option id="studyLife">学习生活</option>
									<option id="socialActivity">社团活动</option>
									<option id="schoolNews">校内新闻</option>
									<option id="fleaMarket">跳蚤市场</option>
									<option id="music">音乐天地</option>
									<option id="employment">就业咨询</option>
									<option id="datingZone">交友专区</option>
								</optgroup>
								<optgroup label="更多">
									<option id="physicalFitness">体育健身</option>
									<option id="game">游戏天地</option>
									<option id="jobAdvertisement">招聘广告</option>
									<option id="animeMovie">动漫电影</option>
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
								<br />用户名：
								<a href="javaScript.void(0);" data-toggle="modal" data-target="#myModal">未登录</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/user/manager/${user.uid }">
									<img alt="${user.username }" src="<c:url value="${user.headimg }"/>" class="img-circle" style="width: 224px; height: 224px;" />
								</a>
								<br />
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
		<%@include file="../common/foot.jsp"%>
	</div>
	<script type="text/javascript">
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
                    console.log('登陆成功');
                },
				'success' : function(data) {
					if(data.data == 1){
						$("#returnMessage1").hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
					}else if(data.data == 2){
						$("#returnMessage1").hide().html('<label class="label label-danger">发帖主题不能为空！</label>').show(300);
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
		
		 var form = $('#userMessage');
	    $(document).ready(function () {

	        form.bootstrapValidator({
	            message: '输入值不合法',
	            feedbackIcons: {
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {
	                username: {
	                    message: '用户名不合法',
	                    validators: {
	                        notEmpty: {
	                            message: '用户名不能为空'
	                        },
	                        stringLength: {
	                            min: 3,
	                            max: 30,
	                            message: '请输入3到30个字符'
	                        },
	                        regexp: {
	                            regexp: /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,
	                            message: '用户名只能由字母、数字、点、下划线和汉字组成 '
	                        }
	                    }
	                }
	                , password: {
	                    validators: {
	                        notEmpty: {
	                            message: '密码不能为空'
	                        },
	                        stringLength: {
	                            min: 6,
	                            max: 30,
	                            message: '密码长度不能小于6位或超过30位'
	                        }
	                    }
	                }
	            }
	        });
	    });
	    $("#login").click(function () {
	        //进行表单验证
	        var bv = form.data('bootstrapValidator');
	        bv.validate();
	        if (bv.isValid()) {
	            console.log(form.serialize());
	            //发送ajax请求
	            $.ajax({
	                url: '${pageContext.request.contextPath}/user/login',
	                async: false,//同步，会阻塞操作
	                type: 'POST',//PUT DELETE POST
	                data: form.serialize(),
	                complete: function (msg) {
	                    console.log('登陆成功');
	                },
	                success: function (result) {
	                    console.log(result);
	                    if (result) {
	                        window.location.reload();
	                    } else {
	                        $("#returnMessage").hide().html('<label class="label label-danger">用户和密码不匹配!</label>').show(300);
	                    }
	                }, error: function () {
	                    $("#returnMessage").hide().html('<label class="label label-danger">用户和密码不匹配!</label>').show(300);
	                }
	            })
	        }
	    });
	    $("#regist").click(function () {
	        //进行表单验证
	        var bv = form.data('bootstrapValidator');
	        bv.validate();
	        if (bv.isValid()) {
	            console.log(form.serialize());
	            //发送ajax请求
	            $.ajax({
	                url: '${pageContext.request.contextPath}/user/regist',
	                async: false,//同步，会阻塞操作
	                type: 'POST',//PUT DELETE POST
	                data: form.serialize(),
	                complete: function (msg) {
	                    console.log('登陆成功');
	                },
	                success: function (data) {
	                    console.log(data);
	                    if (data.data == 1) {
	                    	$("#returnMessage").hide().html('<label class="label label-danger">用户名已存在！</label>').show(300);
	                    }else if(data.data == 2) {
	                    	$("#returnMessage").hide().html('<label class="label label-success">注册成功，请重新登录！</label>').show(300);
	                    	location.href = "${pageContext.request.contextPath}/index.jsp";
	                    }
	                    else {
	                        $("#returnMessage").hide().html('<label class="label label-danger">注册失败!</label>').show(300);
	                    }
	                }, error: function () {
	                    $("#returnMessage").hide().html('<label class="label label-danger">注册失败!</label>').show(300);
	                }
	            })
	        }
	    });
	    function choose(data){
	    	location.href = "${pageContext.request.contextPath }/article/list/"+ data.id + "/${articlePageBean.currentPage}";
	    }
	</script>
	<input id="context" type="hidden" value="${pageContext.request.contextPath}" />
	<%@include file="../common/editor.jsp"%>
</body>
</html>