<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=0.3">
<title>个人信息管理</title>
<%@ include file="../common/import.jsp"%>
</head>
<body>
	<div class="container" style="box-shadow: 0px 0px 1px #888888">
		<%@include file="../common/head.jsp" %><br>
		<c:choose>
			<c:when test="${user.uid eq u.uid }">
				<div class="row">
					<div class="col-md-2">
						<div class="info">
							<img alt="headimg" src="<c:url value="${u.headimg }"/>" class="img-thumbnail"/>
							<h4><center>用户名：${u.username}</center></h4>
						</div>
					</div>
					<div class="col-md-8">
						<br>
						<form id="changeImg" class="form-horizontal" action="${pageContext.request.contextPath }/user/headimg/${u.uid}" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label class="col-md-2 control-label" for="imgUpload" style="font-size:16px;">更换头像</label>
								<div class="col-md-5">
									<input class="btn btn-link form-control" type="file" id="imgUpload" name="file" accept="image/*"/>
								</div>
								<div class="col-md-2">
									<button class="btn btn-primary" type="submit">确认修改</button>
								</div>
							</div>
						</form>
						<form class="form-horizontal">
							<div class="form-group">
								<span class="col-md-2 control-label" style="font-size:16px;"><strong>修改密码</strong></span>
								<div class="col-md-2">
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
									  	修改密码
									</button>
								</div>
							</div>
						</form>
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
								  <div class="modal-content">
							          <div class="modal-header">
							          	  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								          <h4 class="modal-title" id="myModalLabel">修改密码</h4>
								      </div>
								      <form id="changeMessage" class="form-horizontal" method="post" action="" enctype="multipart/form-data">  
									  	  <div class="modal-body">
										      <div class="form-group">  
											      <label for="oldPassword" class="col-md-3 control-label">用户旧密码：</label>  
											      <div class="col-md-9">  
											          <input class="form-control" type="password" name="oldPassword" id="oldPassword" placeholder="请输入旧密码">  
											      </div> 
											  </div> 
											  <div class="form-group">  
											      <label for="newPassword" class="col-md-3 control-label">用户新密码：</label>  
											      <div class="col-md-9">  
											          <input class="form-control" type="password" name="newPassword" id="newPassword" placeholder="请输入新密码">  
											      </div> 
											  </div> 
											  <div class="form-group">  
											      <label for="comfirmPassword" class="col-md-3 control-label">用户确认密码：</label>  
											      <div class="col-md-9">  
											          <input class="form-control" type="password" name="comfirmPassword" id="comfirmPassword" placeholder="请确认新密码">  
											      </div> 
											  </div> 
								      	 
								      	 </div>
									     <div class="modal-footer">
									     	<span id="returnMessage" class="glyphicon"> </span>
									        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									        <button id="editMessage" class="btn btn-primary" type="button">确认</button> 
								      	 </div>
							      	 </form>
						    	</div>
						  	</div>
						</div>
					</div>
				</div>
				<div class="myArticle">
					<c:choose>
						<c:when test="${empty userArticle }">
							<br><h3>未发表过任何帖子！</h3>
						</c:when>
						<c:otherwise>
							<h3>发表过的帖子</h3> <span id="returnMessage3" class="pull-right"> </span>
							<table class="table table-hover">
								<c:forEach var="ua" items="${userArticle }">
									<tr>
										<td>
											<span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
											<a href="${pageContext.request.contextPath }/article/details/${ua.aid}/1">
												<c:out value="${ua.title }"></c:out>
											</a>
											<div style="float:right;">
												<fmt:formatDate value="${ua.date }" pattern="MM/dd HH:mm:ss"/>
												<button type="button" class="btn btn-primary" onclick="deleteArticle(${ua.aid})">删除</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</table>
						</c:otherwise>
					</c:choose>
					<c:if test="${u.power == 1 }">
						<hr>
						<c:choose>
							<c:when test="${empty noPassArticle }">
								<h3>没有帖子需要审核！</h3>
							</c:when>
							<c:otherwise>
								<h3>要审核的帖子</h3> <span id="returnMessage2" class="pull-right"> </span>
								<table class="table table-hover">
									<c:forEach var="na" items="${noPassArticle }">
										<tr>
											<td>
												<span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
												<a>
													<c:out value="${na.title }"></c:out>
												</a>
												<div style="float:right;">
													<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
													<a href="${pageContext.request.contextPath}/user/info/${na.author.uid}">${na.author.username }</a>&nbsp; &nbsp; 
													<fmt:formatDate value="${na.date }" pattern="MM/dd HH:mm:ss"/>
													<button type="button" class="btn btn-primary" onclick="updateArticle(${na.aid})">通过</button>
													<button type="button" class="btn btn-primary" onclick="deleteArticle(${na.aid})">删除</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</table>
							</c:otherwise>
						</c:choose>
						<hr>
						<div>
						<h3>要管理的帖子</h3>   <span id="returnMessage1" class="pull-right"> </span>
						<table class="table table-hover">
							<c:forEach var="pa" items="${passArticle }">
								<tr>
									<td>
										<span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
										<a href="${pageContext.request.contextPath }/article/details/${pa.aid}/1">
											<c:out value="${pa.title }"></c:out>
										</a>
										<div style="float:right;">
											<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
											<a href="${pageContext.request.contextPath}/user/info/${pa.author.uid}">${pa.author.username }</a>&nbsp; &nbsp; 
											<fmt:formatDate value="${pa.date }" pattern="MM/dd HH:mm:ss"/>
											<button type="button" class="btn btn-primary" onclick="stickArticle(${pa.aid}, ${pa.status })"><c:if test="${pa.status == 1 || pa.status == 3 }">取消</c:if>置顶</button>
											<button type="button" class="btn btn-primary" onclick="digestArticle(${pa.aid}, ${pa.status })"><c:if test="${pa.status == 2 || pa.status == 3}">取消</c:if>加精</button>
											<button type="button" class="btn btn-primary" onclick="deleteArticle(${pa.aid})">删除</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</c:when>
			<c:when test="${empty user }">
				<center>
					<br><br><h3>请登录后再查询！</h3><br><br><br>
				</center>
			</c:when>
			<c:otherwise>
				<center>
					<br><br><h3>仅能修改个人信息！</h3><br><br><br>
				</center>
			</c:otherwise>
		</c:choose>
		<%@include file="../common/foot.jsp" %>
	</div>
<script type="text/javascript">

	$(function() {
	    $('#changeImg').bootstrapValidator({
	        message: 'This value is not valid',
	        //excluded:[":hidden",":disabled",":not(visible)"] ,//bootstrapValidator的默认配置
	        excluded: ':disabled',//关键配置，表示只对于禁用域不进行验证，其他的表单元素都要验证
	
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',//显示验证成功或者失败时的一个小图标
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	file: {
	                message: '未选择文件！',//默认提示信息
	                validators: {
	                    notEmpty: {
	                        message: '文件不能为空'
	                    }
	                }
	            }
	        }
	    }).on('error.form.bv', function(e) {
	        console.log('error');
	
	        // Active the panel element containing the first invalid element
	        var $form         = $(e.target),
	            validator     = $form.data('bootstrapValidator'),
	            $invalidField = validator.getInvalidFields().eq(0),
	            $collapse     = $invalidField.parents('.collapse');
	        $collapse.collapse('show');
	    });
	});
	var form = $('#changeMessage');
	$(function() {
		form.bootstrapValidator({
		      message: '该值无效',
		      trigger: 'blur keyup',
		      feedbackIcons: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		      },
		      fields: {
		        /*验证：规则*/
		        oldPassword: {
		          validators: {
		            notEmpty: {
		              message: '用户旧密码不能为空'
		            },
		            stringLength: {
		              min: 6,
		              max: 19,
		              message: '用户旧密码长度大于5小于20'
		            },
		            regexp: {
		              regexp: /^[^ ]+$/,
		              message: '用户旧密码不能有空格'
		            }
		          }
		        },
		        newPassword: {
		          validators: {
		            notEmpty: {
		              message: '用户新密码不能为空'
		            },
		            identical: {
		              field: 'comfirmPassword',
		              message: '用户新密码与确认密码不一致！'
		            },
		            stringLength: {
		              min: 6,
		              max: 19,
		              message: '用户新密码长度大于5小于20'
		            },
		            regexp: {
		              regexp: /^[^ ]+$/,
		              message: '用户新密码不能有空格'
		            }

		          }
		        },
		        comfirmPassword: {
		          validators: {
		            identical: {
		              field: 'newPassword',
		              message: '用户新密码与确认密码不一致！'
		            },
		            notEmpty: {
		              message: '用户确认密码不能为空'
		            },
		            stringLength: {
		              min: 6,
		              max: 19,
		              message: '用户确认密码长度大于5小于20'
		            },

		            regexp: {
		              regexp: /^[^ ]+$/,
		              message: '用户确认密码不能有空格'
		            }
		          }
		        }
		      }
		    }).on('error.validator.bv', function (e, data) {//这个方法是让错误信息只显示最新的一个（有时会出现多个错误信息同时显示用这个方法解决）
	          data.element
	              .data('bv.messages')
	              // Hide all the messages
	              .find('.help-block[data-bv-for="' + data.field + '"]').hide()
	          // Show only message associated with current validator
	              .filter('[data-bv-validator="' + data.validator + '"]').show();
	        })
	        .on('error.field.bv', function (e, data) {//‘用户确认密码’ 没输入的时候，‘用户新密码’不提示‘用户新密码与确认密码不一致’
	          // $(e.target)  --> The field element
	          // data.bv      --> The BootstrapValidator instance
	          // data.field   --> The field name
	          // data.element --> The field element
	          if (data.field == 'newPassword') {
	            var len1 = data.element.val().length;
	            var len2 = $('#comfirmPassword').val().length;
	            var k = data.element.val().indexOf(" ");
	            if (len1 > 5 && len2 < 6 && k < 0) {
	              var $parent = data.element.parents('.form-group');
	              $parent.removeClass('has-error');
	              $parent.find('.form-control-feedback[data-bv-icon-for="' + data.field + '"]').hide();
	              data.element.siblings('[data-bv-validator="identical"]').hide();
	            }
	          }
	        });
	});
	$("#editMessage").click(function () {//非submit按钮点击后进行验证，如果是submit则无需此句直接验证  
		var bootstrapValidator = form.data('bootstrapValidator');
        //手动触发验证
        bootstrapValidator.validate();
        if (bootstrapValidator.isValid()) {//获取验证结果，如果成功，执行下面代码  
        	console.log(form.serialize());
            //发送ajax请求
            $.ajax({
                url: '${pageContext.request.contextPath}/user/updatePassword',
                async: false,//同步，会阻塞操作
                type: 'POST',//PUT DELETE POST
                data: form.serialize(),
                complete: function (msg) {
                    console.log('修改成功');
                },
                success: function (data) {
                    console.log(data);
                    if (data.data == 0) {
                    	$("#returnMessage").hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
                    }else if(data.data == 1) {
                    	$("#returnMessage").hide().html('<label class="label label-danger">原密码不正确！</label>').show(300);
                    }else if(data.data == 2) {
                    	$("#returnMessage").hide().html('<label class="label label-danger">新密码与原密码相同！</label>').show(300);
                    }else if(data.data == 3){
                    	$("#returnMessage").hide().html('<label class="label label-success">修改成功！</label>').show(300);
                    	location.href = "${pageContext.request.contextPath}/user/manager/${u.uid}";
                    }else {
                        $("#returnMessage").hide().html('<label class="label label-danger">修改失败!</label>').show(300);
                    }
                }, error: function () {
                    $("#returnMessage").hide().html('<label class="label label-danger">修改失败!</label>').show(300);
                }
            });
        }
	});
	
	//通过帖子
	function updateArticle(aid){
		var url = "${pageContext.request.contextPath}/article/update/"+aid;
		$.get(url, function(data){
			if(data.data == 0){
				$("#returnMessage2").hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
				setTimeout(function(){
					location.href = "${pageContext.request.contextPath}/article/list/1";
				},500);
			}else{
				if(data.data == 1)
					$("#returnMessage2").hide().html('<label class="label label-success">通过成功！</label>').show(300);
				else
					$("#returnMessage2").hide().html('<label class="label label-danger">通过失败！</label>').show(300);
				setTimeout(function(){
					location.href = "${pageContext.request.contextPath}/user/manager/${u.uid}";
				},500);
			}
		},"json");
	}

	//删除帖子
	function deleteArticle(aid){
		$.get("${pageContext.request.contextPath}/article/delete/"+aid, function(data){
			if(data.data == 0){
				$("#returnMessage3").hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
				location.href = "${pageContext.request.contextPath}/article/list/all/1";
			}else{
				if(data.data == 1)
					$("#returnMessage3").hide().html('<label class="label label-success">删除成功！</label>').show(300);
				else
					$("#returnMessage3").hide().html('<label class="label label-danger">删除失败！</label>').show(300);
				setTimeout(function(){
					location.href = "${pageContext.request.contextPath}/user/manager/${u.uid}";
				},500);
			}
		},"json");
	}
	
	//置顶帖子
	function stickArticle(aid, status){
		$.post("${pageContext.request.contextPath}/article/stick/"+aid, {status : status}, function(data){
			if(data.data == 0){
				$("#returnMessage1").hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
				location.href = "${pageContext.request.contextPath}/article/list/1";
			}else{
				if(data.data == 1)
					if(status != 1 && status != 3)
						$("#returnMessage1").hide().html('<label class="label label-success">置顶成功！</label>').show(300);
					else
						$("#returnMessage1").hide().html('<label class="label label-success">取消置顶成功！</label>').show(300);
				else
					$("#returnMessage1").hide().html('<label class="label label-danger">操作失败！</label>').show(300);
				setTimeout(function(){
					location.href = "${pageContext.request.contextPath}/user/manager/${u.uid}";
				},500);
			}
		},"json");
	}
	
	//加精帖子
	function digestArticle(aid, status){
		$.post("${pageContext.request.contextPath}/article/digest/"+aid, {status : status}, function(data){
			if(data.data == 0){
				$("#returnMessage1").hide().html('<label class="label label-danger">请重新登陆！</label>').show(300);
				location.href = "${pageContext.request.contextPath}/article/list/1";
			}else{
				if(data.data == 1)
					if(status != 2 && status != 3)
						$("#returnMessage1").hide().html('<label class="label label-success">加精成功！</label>').show(300);
					else
						$("#returnMessage1").hide().html('<label class="label label-success">取消加精成功！</label>').show(300);
				else
					$("#returnMessage1").hide().html('<label class="label label-success">操作失败！</label>').show(300);
				setTimeout(function(){
					location.href = "${pageContext.request.contextPath}/user/manager/${u.uid}";
				},500);
			}
			
		},"json");
	}
	
</script>
</body>
</html>