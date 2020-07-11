<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
var checkform = function() {
	var flag = true;
	var username = $("#username").val();
	var usertruename = $("#usertruename").val();
	var userpwd = $("#userpwd").val();
	var userpwdtest= /^(?=.*[a-zA-Z])(?=.*[0-9])[A-Za-z0-9]{8,18}$/;
	//不为空判断
	if(username.length<=0){
		var flag = false;
		$("#username").focus();
		$("#msg").html("用户昵称不能为空")
	}else if(usertruename.length<=0){
		var flag = false;
		$("#usertruename").focus();
		$("#msg").html("用户真实姓名不能为空")
	}else if(userpwd.length<=0){
		var flag = false;
		$("#userpwd").focus();
		$("#msg").html("用户密码不能为空")
	}
	//密码合法性
	else if(!userpwdtest.test(userpwd)){
		var flag = false;
		$("#userpwd").focus();
		$("#msg").html("密码必须由字母、数字组成，区分大小写，密码长度为8-18位")
	}
	return flag;
}
var rename = function() {
	 $.ajax({
           type: "POST",
           url:"${pageContext.request.contextPath}/web/user/rename",
           data:{
               username:$("#username").val(),
           },
           success:function(data){
               if(data=="success" && $("#username").val()!= '${user.username}'){
               	$("#msg").html("用户昵称已被注册！！！"),
               	$("#username").focus(),
               	$("#sub").attr("disabled","disabled");
               }else{
               	$("#msg").html("昵称可用"),
               	$("#sub").removeAttr("disabled");
               }
           },
       });
}
</script>
</head>

<body>
<ul class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/web/user/list">用户管理</a> <span class="divider">/</span></li>
		<li class="active">修改用户信息</li>
	</ul>
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>提示!</h4>
		<strong id ="msg">${msg}</strong> 
	</div>
	<div class="row-fluid">
		<div class="span12">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/web/user/edit"
				method="post">
				<div class="control-group">
					<label class="control-label" for="username">用户昵称:</label>
					<div class="controls">
						<input id="username" value="${user.username}" type="text" name="username" onblur="return rename()" />
						<input type="hidden" value="${user.userid}" name="userid" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="usertruename">真实姓名:</label>
					<div class="controls">
						<input id="usertruename" value="${user.usertruename}" type="text" name="usertruename" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="rolename">用户角色:</label>
					<div class="controls">
						<select id="roleid" name="roleid">
							<c:forEach items="${list}" var="item">
								<option value="${item.roleid}"
								<c:if test="${item.roleid==user.roleid}">selected="selected"</c:if>
								>${item.rolename}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="userpwd">用户密码:</label>
					<div class="controls">
						<input id="userpwd" value="${user.userpwd}" type="password" name="userpwd" /><span style="color:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(密码必须由字母、数字组成，区分大小写，密码长度为8-18位)</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="usersex">用户性别:</label>
					<div class="controls">
						<select id="usersex" name="usersex">
							<c:choose>
								<c:when test="${user.usersex==0}">
									<option value="1">男</option>
									<option value="0" selected="selected">女</option>
								</c:when>
								<c:otherwise>
									<option value="1" selected="selected">男</option>
									<option value="0">女</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="userstate">用户状态：</label>
					<div class="controls">
						<select id="userstate" name="userstate">
							<c:choose>
								<c:when test="${user.userstate==0}">
									<option value="1">可用</option>
									<option value="0" selected="selected">不可用</option>
								</c:when>
								<c:otherwise>
									<option value="1" selected="selected">可用</option>
									<option value="0">不可用</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input id="sub" type="submit" class="btn" value="提交" onclick="return checkform()" />
						<button class="btn btn-primary" type="button" onclick="javascript:window.location.href='${pageContext.request.contextPath}/web/user/list';">返回</button>
					</div>
				</div>

			</form>

		</div>
	</div>
</body>
</html>