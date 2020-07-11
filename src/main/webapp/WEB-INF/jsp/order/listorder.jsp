<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
	<script >
		function selectnofinish(){
			$("body").load("${pageContext.request.contextPath}/web/order/listorder",{tag:'-1'});
			
		}
		function selectfinish(){
			
			$("body").load("${pageContext.request.contextPath}/web/order/listorder",{tag:'3'},function(){
				$(".mm").css("display","none");
				$("#dmm").css("display","none");
			});
			
		}
		function detail(orderid){
			$("body").load("${pageContext.request.contextPath}/web/order/listdetail",{orderid:orderid});
			
		}
		
	</script>

</head>
<body>
	<ul class="breadcrumb">
		<li><a href="">订单管理</a> <span class="divider">/</span></li>
		<li class="active">订单列表</li>
	</ul>
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>提示!</h4>
		<strong id="msg">${msg}</strong>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<center><table style="text-align: center;">
				<tr>
					<th>
						<input type="button"
						class="btn" value="已完成" onclick="selectfinish()" />
					</th>
					
					<th id="finish"><input type="button"
						class="btn" value="未完成" onclick="selectnofinish()" /></th>
				</tr>
				<tr></tr>
			</table></center>
<table class="table table-bordered">
				<thead>
					<tr>
						<th>订单编号</th>
						<th>用户昵称</th>
						<th>下单时间</th>
						<th>状态</th>
						<th id="dmm">编辑</th>
						<th>详情</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${p.list}" var="itme">
						<tr class="info">
							<td>${itme.orderid}</td>
							<td>${itme.nickname}</td>
							<td>${itme.ordertime}</td>
							<td><c:choose>
									<c:when test="${itme.orderstate==1}">
										下单
									</c:when>
									<c:when test="${itme.orderstate==2}">
										处理中
									</c:when>
									<c:when test="${itme.orderstate==0}">
										临时
									</c:when>
									<c:otherwise>完成</c:otherwise>
								</c:choose></td>
							<td class="mm"><a
								href="${pageContext.request.contextPath}/web/order/edit/${itme.orderid}/2">处理</a>
								<a
								href="${pageContext.request.contextPath}/web/order/edit/${itme.orderid}/3">完成</a>
								</td>
								
								<td><input type="button" value="详情" onclick="detail('${itme.orderid}')"\></td>
								
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<%@ include file="/page/pager.jsp"%>
		</div>
	</div>
</body>
</html>