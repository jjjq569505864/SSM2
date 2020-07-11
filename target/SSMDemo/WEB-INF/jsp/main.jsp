<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>速客点餐后台管理系统</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<%
	//验证权限
	if(session.getAttribute("CurrentUser") == null){
		response.sendRedirect("../login/tologin");
	}
%>
</head>
<body>
	<!-- 顶部开始 -->
	<div class="container">
		<div class="logo">
			<a href="./main">速客点餐后台管理系统</a>
		</div>
		<div class="left_open">
			<a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
		</div>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">${currentUser.username}</a>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<a onclick="x_admin_show('个人信息','..')">个人信息</a>
					</dd>
					<dd>
						<a href="${pageContext.request.contextPath}/web/login/tologin">切换帐号</a>
					</dd>
					<dd>
						<a href="${pageContext.request.contextPath}/web/login/tologin">退出</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index" ><a href="${pageContext.request.contextPath}/role?cmd=index">前台首页</a></li>
		</ul>
	</div>
	<!-- 顶部结束 -->
	<!-- 中部开始 -->
	<!-- 左侧菜单开始 -->
	<div class="left-nav">
		<div id="side-nav">
		 <ul id="nav"> 
				<!-- 遍历父功能 -->
				<c:forEach items="${list}" var="fun">
					<li><c:if test="${fun.funpid==\"-1\"}">
						<li><a href="javascript:;">
						<i class="iconfont"	lay-tips="${fun.funname}">&#xe6b8;</i>
						<cite>${fun.funname}</cite> 
						<i class="iconfont nav_right">&#xe697;</i></a>
					</c:if>
					
					<ul class="sub-menu">
					<!-- 遍历子功能 -->							
						<c:forEach items="${list}" var="child" varStatus="status">
							<c:if test="${child.funpid==fun.funid}">
								<li> <a target="x-iframe1"
								href="${pageContext.request.contextPath}${child.funurl}
								">
								<i class="iconfont">&#xe6a7;</i>
									<cite>${child.funname}</cite>
								</a> 		
								</li>
							</c:if>
						</c:forEach>
					</ul>
					</li>					
				</c:forEach>				
		</ul> 
		</div>
	</div>								

	<!-- <div class="x-slide_left"></div> -->
	<!-- 左侧菜单结束 -->
	<!-- 右侧主体开始 -->
    <div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<ul class="layui-tab-title">
				<li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
			</ul>
			<div style="margin-left:-80px;margin-top:200px; text-align: center; font-size: 30pt; color: #333">
			<b>欢迎来到速客点餐后台管理系统</b>
			</div>
	
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">			
					<iframe name="x-iframe1"  frameborder="0" scrolling="yes"
						class="x-iframe"></iframe>
				</div>
			</div>
		</div>
	</div> 
	<div class="page-content-bg"></div>
	<!-- 右侧主体结束 -->
	<!-- 中部结束 -->
	<!-- 底部开始 -->
	<div class="footer">
		<div class="copyright" style="text-align: center">Copyright
			©2017 lc 2.3 All Rights Reserved</div>
	</div>
	<!-- 底部结束 -->
</body>
<script src="${pageContext.request.contextPath}/admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/xadmin.js"></script>
</html>