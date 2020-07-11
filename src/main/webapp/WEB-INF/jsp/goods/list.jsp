
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜品管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap
				.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-a
				wesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function deleterole(id){
		if(confirm("是否确定删除记录？")){
			window.location.href="${pageContext.request.contextPath}/web/goods/delete/"+id;
		}
	}

</script>
</head>

<ul class="breadcrumb">
	<li><a href="#">菜品管理</a> <span class="divider">/</span></li>
	<li class="active">菜品信息列表</li>
</ul>
<div class="row-fluid">
	<form class="form-search" style="padding: 5px"
		action="${pageContext.request.contextPath}/web/goods/list" method="post">
		<label>菜品名称：</label> <input class="input-medium
				search-query"
			type="text" name="gname" value="${param.gname}" /> <label>菜品类型：</label>
		<select name="gtid">
			<option value="">全部</option>
			<c:forEach items="${goodstypelist}" var="goodstype">
				<option value="${goodstype.gtid}"
					<c:if test="${goodstype.gtid==param.gtid}">
				selected="selected"
				</c:if>>${goodstype.gtname}</option>
			</c:forEach>
		</select>
		<button type="submit" class="btn">查找</button>
		<button class="btn btn-success" type="button"
			onclick="window.location.href='${pageContext.request.contextPath}/web/goods/toadd';">增加</button>
	</form>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>菜品类型</th>
				<th>菜品名称</th>
				<th>菜品图片</th>
				<th>菜品价格</th>
				<th>菜品详情</th>
				<th>菜品制作所需时间</th>
				<th>菜品状态</th>
				<th>编辑</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${p.list}" var="item">
				<tr class="info">
					<td>${item.gtname}</td>
					<td>${item.gname}</td>
					<td>
						<div style="width: 120px; height: 100px;">
							<img alt=" 菜品图品"
								src="${pageContext.request.contextPath}/file/${item.gimg}">
						</div>
					</td>
					<td>${item.gprice}</td>
					<td>${item.gcontent}</td>
					<td>${item.gtime}分钟</td>
					<td><c:choose>
							<c:when test="${item.gstate==1}">
				可用
				</c:when>
							<c:otherwise>
				不可用
				</c:otherwise>
						</c:choose></td>
					<td>
					<a
						href="${pageContext.request.contextPath}/web/goods/toedit/${item.gid}"><span class="icon-edit">编辑</span>
					</a>
					<a href="javascript:deleterole('${item.gid}');"><span class="icon-trash-o"></span>删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/page/pager.jsp" %>
</div>
</body>
</html>