<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
</head>
<body>
<ul class="breadcrumb">
		<li><a href="#">用户管理</a> <span class="divider">/</span></li>
		<li class="active">用户列表</li>
	</ul>

	<div class="row-fluid">
		<form class="form-search" style="padding: 5px" action="${pageContext.request.contextPath}/web/user/list" method="post">
			<label>用户昵称：</label> <input class="input-medium search-query"
				type="text" name="username" value="${param.username}" />
			<label>用户角色：</label> 
			<select name="roleid">
				<option value="">全部</option>
				<c:forEach items="${rolelist}" var="role">
					<option value="${role.roleid}" 
						<c:if test="${param.roleid==role.roleid}">selected="selected"</c:if>
					>${role.rolename}</option>
				</c:forEach>					
			</select>
			<button type="submit" class="btn">查找</button>
			<button class="btn btn-success" type="button" 
			onclick="window.location.href='${pageContext.request.contextPath}/web/user/toadd';">增加</button>
		</form>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>用户昵称</th>
					<th>用户姓名</th>
					<th>用户性别</th>
					<th>用户状态</th>
					<th>用户角色</th>
					<th>编辑</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${p.list}" var="item">
				<tr class="info">
					<td>${item.username}</td>
					<td>${item.usertruename}</td>
					<td>
						<c:choose>
							<c:when test="${item.usersex==1}">
									男
							</c:when>
							<c:otherwise>
									女
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${item.userstate==1}">
									可用
							</c:when>
							<c:otherwise>
									不可用
							</c:otherwise>
						</c:choose>
					</td>
					<td>${item.rolename}</td>
					<td><a href="${pageContext.request.contextPath}/web/user/toedit?id=${item.userid}">编辑</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@include file="/page/pager.jsp" %>
	</div>
</body>
</html>