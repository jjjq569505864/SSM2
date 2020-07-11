<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色权限分配</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function check(obj) {
		//获取子节点
		var id = obj.id;
		var objs = $("[pid='" + id + "']");
		if ($(obj).attr("checked") == "checked") {
			for (var i = 0; i < objs.length; i++) {
				//设置全部选中
				$(objs[i]).attr("checked", "checked");
			}
		} else {
			//取消选中
			for (var i = 0; i < objs.length; i++) {
				$(objs[i]).removeAttr("checked");
			}
		}
	}

	function childcheck(obj) {
		var pid = $(obj).attr("pid");
		if ($(obj).attr("checked") == "checked") {
			$("#" + pid).attr("checked", "checked");
		}
	}
</script>
</head>
<body>
	<ul class="breadcrumb">
		<li><a href="#">角色管理</a> <span class="divider">/</span></li>
		<li class="active">角色权限分配</li>
	</ul>

	<div class="row-fluid">
		<form class="form-horizontal" style="padding: 5px"
			action="${pageContext.request.contextPath}/web/sysrole/rolefun"
			method="post">
			<div>
				<input type="hidden" name="roleid" value="${roleid}"> <input
					type="submit" value="提交"> ${msg}
			</div>
			<div>
				<dl>
					<!-- 传入功能列表 -->
					<c:forEach items="${rflist}" var="rf">
						<!-- 父功能 -->
						<c:if test="${rf.funpid=='-1'}">
							<dt>
								<input name="funids" type="checkbox" onclick="check(this)"
									id="${rf.funid}" pid="${rf.funpid}" value="${rf.funid}"
									<c:if test="${!empty(rf.roleid)}">checked="checked"</c:if> />
								<!-- 显示父功能名称 -->
								${rf.funname}
							</dt>
						</c:if>
						<!-- 子功能 -->
						<c:forEach items="${rflist}" var="ch">
							<c:if test="${ch.funpid==rf.funid}">
								<dd>
									<input name="funids" onclick="childcheck(this)" type="checkbox"
										<c:if test="${!empty(ch.roleid)}">checked="checked"</c:if>
										id="${ch.funid}" pid="${ch.funpid}" value="${ch.funid}" />
									<!-- 显示子功能名称 -->
									${ch.funname}
								</dd>
							</c:if>
						</c:forEach>
					</c:forEach>
				</dl>
			</div>
		</form>
	</div>
</body>
</html>