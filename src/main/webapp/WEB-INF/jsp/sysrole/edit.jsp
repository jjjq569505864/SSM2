<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改文章类型</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	//表单检查
	function checkform(){
		var flag = false;
		var arttype = $("#rolename").val();
		if(arttype.length>0){
			flag = true;
		}else{
			$("#msg").html("角色名称不能为空！");
			$("#rolename").focus();
		}
		return flag;
	}
	var checkname = function(){
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/web/sysrole/verifyrolename",
			data : {
				rolename:$("#rolename").val()
			},
			success: function(data){
				if(data=="111" && $("#rolename").val()!='${role.rolename}'){					
					$("#sub").attr("disabled","disabled"),
					$("#msg").html("角色名重复，请重新输入"),
					$("#rolename").focus();
				}else{
					$("#msg").html(""),
					$("#sub").removeAttr("disabled");
				}
			},						
		});	
	}	

</script>
</head>
<body>
	<ul class="breadcrumb">
		<li><a href="#">角色管理</a> <span class="divider">/</span></li>
		<li class="active">修改角色</li>
	</ul>
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>提示!</h4>
		<strong id="msg">${msg}</strong>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/web/sysrole/edit"
				method="post">
				<div class="control-group">
					<label class="control-label" for="rolename">角色名称</label>
					<div class="controls">
						<input id="rolename" type="text" name="rolename" maxlength="30" value="${role.rolename}" onblur="checkname();"/>
						<input type="hidden" name="roleid" value="${role.roleid}"/>
						<input type="hidden" name="rolename1" value="${role.rolename}"/>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="rolestate">角色状态</label>
					<div class="controls">
						<select name="rolestate">
							<c:choose>
								<c:when test="${role.rolestate==1}">
									<option value="1" selected="selected">可用</option>
									<option value="0">不可用</option>
								</c:when>
								<c:otherwise>
									<option value="1">可用</option>
									<option value="0" selected="selected">不可用</option>
								</c:otherwise>
							</c:choose>
							
						</select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" id="sub" class="btn" value="提交" onclick="return checkform();" />
						<button class="btn btn-primary" type="button"
							onclick="window.location.href='${pageContext.request.contextPath}/web/sysrole/list';">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>