<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理——订单详情</title>
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
		<li><a href="${pageContext.request.contextPath}/web/order/listorder">订单管理</a> <span class="divider">/</span></li>
		<li class="active">订单详情</li>
	</ul>

	<div class="row-fluid">
		
		<!-- <button class="btn btn-success" type="button" 
		onclick="window.location.href='${pageContext.request.contextPath}/web/order/listorder';">返回</button> -->
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>菜品名称</th>
					<th>菜品种类</th>
					<th>点单数量</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${p.list}" var="item">
				<tr class="info">
					<td>${item.gname}</td>
					<td>${item.gtname}</td>
					<td>${item.odcount}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@include file="/page/pager.jsp" %>
	</div>
</body>
</html>