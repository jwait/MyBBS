<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 弹出对话框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">登录/注册</h4>
      </div>
      <form id="userMessage" class="form-horizontal">
      	<div class="modal-body">
	      	<div class="form-group">  
		      <label for="username" class="col-md-2 control-label">账号：</label>  
		      <div class="col-md-10">  
		        <input type="text" id="username" name="username" maxlength="20"  class="form-control" placeholder="用户名">
		      </div> 
		  	</div> 
	        <div class="form-group">  
		      <label for="password" class="col-md-2 control-label">密码：</label>  
		      <div class="col-md-10">  
		        <input type="password" id="password" name="password" maxlength="20"  class="form-control" placeholder="密码">
		      </div> 
		  	</div>
	     </div>
	     <div class="modal-footer">
	       <span id="returnMessage" class="glyphicon"> </span>
	       <button type="button" id="regist" class="btn btn-default">注册</button>
	       <button type="button" id="login" class="btn btn-primary">登录</button>
	     </div>
      </form>
    </div>
  </div>
</div>