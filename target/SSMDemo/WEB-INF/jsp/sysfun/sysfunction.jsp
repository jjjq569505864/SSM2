<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统功能管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/stylesheets/theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome/css/font-awesome.css">
<script src="${pageContext.request.contextPath}/css/jquery-1.8.1.min.js"
	type="text/javascript"></script>
<script>
	//增加跟节点按钮
	function addroot() {
		$("#funpid").val("-1");
		$("#funpname").val("根节点");
		$("#funname").val("");
		$("#funurl").val("");
		$("#funid").val("");
		$("#addchild").attr("disabled", "disabled");
	}
	//点击节点
	function check(obj){
		var o= $(obj);
		var pid = o.attr("datapid");
		var id = o.attr("dataid");
		var name = o.attr("dataname");
		var url = o.attr("dataurl");
		var state=o.attr("datastate");
		var pname=o.attr("datapname");
		
		$("#funpid").val(pid);
		$("#funname").val(name);
		$("#funurl").val(url);		
		$("#funid").val(id);
		$("#funstate").val(state);	
		$("#funpname").val(pname);
		
		if(pid=="-1"){
			//可以增加子节点
			$("#addchild").removeAttr("disabled");
		}else{
			$("#addchild").attr("disabled","disabled");
		}	
	}
	//增加子节点按钮
	function addchild(){
		$("#funpid").val($("#funid").val());
		$("#funpname").val($("#funname").val());
		$("#funname").val("");
		$("#funurl").val("");
		$("#funid").val("");
		$("#addchild").attr("disabled","disabled");
	}
	//保存
	function save(){
		var funpid=$("#funpid").val();
		var funid=$("#funid").val();
		var funname=$("#funname").val();
		var funurl=$("#funurl").val();
		var funstate=$("#funstate").val();
		var cmd="add";
		if(funid!=""){
			cmd="update";
		}
		$.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/web/sysfun/"+cmd,
			   data: "funpid="+funpid+"&funid="+funid+"&funname="+funname+"&funurl="+funurl+"&funstate="+funstate,
			   success: function(msg){
				   if(msg=="0"){
					   alert("保存失败");
				   }else{  
					   alert("保存成功")
					   $("body").load("${pageContext.request.contextPath}/web/sysfun/list");
				   }
			   }
			});
	}
	
</script>
<style type="text/css">
dt{
	cursor:pointer;
	line-height: 30px;
	font-size: 16px;
}
dd{
	cursor:pointer;
	line-height: 25px;
}
</style>
</head>
<body>
<ul class="breadcrumb">
		<li><a href="#">系统功能管理</a> <span class="divider">/</span></li>
	</ul>
	
	<div class="row-fluid">
		<!-- 系统功能树 begin -->
		<div class="span3" id="menu" style="margin-left: 5px;">
			<dl>
				<!-- 遍历跟节点 -->
				<c:forEach items="${list}" var="fun">
					<c:if test="${fun.funpid==\"-1\"}">
						<dt datapname="无" dataid="${fun.funid}" dataname="${fun.funname}"
							datapid="-1" dataurl="" datastate="${fun.funstate}"
							onclick="check(this)">${fun.funname}</dt>
					</c:if>
					<!-- 遍历子节点 -->
					<c:forEach items="${list}" var="child">
						<c:if test="${child.funpid==fun.funid}">
							<dd datapname="${child.funpname}" dataid="${child.funid}"
								dataname="${child.funname}" dataurl="${child.funurl}"
								datastate="${child.funstate}" datapid="${child.funpid}"
								onclick="check(this)">${child.funname}</dd>
						</c:if>
					</c:forEach>
				</c:forEach>
			</dl>
			<input class="btn btn-primary" type="button" value="增加根节点"
				onclick="addroot()" />
		</div>
		<!-- 系统功能树 end -->
		
		<!-- 系统功能编辑 begin -->
		<div class="span8" id="main">
			<div class="control-group">
				<label class="control-label" for="funpname">父功能</label>
				<div class="controls">
					<input type="text" name="funpname" id="funpname" readonly /> 
					<input type="hidden" name="funpid" id="funpid" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="funname">功能名称</label>
				<div class="controls">
					<input type="text" name="funname" id="funname" /> 
					<input type="hidden" name="funid" id="funid" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="funurl">功能地址</label>
				<div class="controls">
					<input type="text" name="funurl" id="funurl" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="funstate">功能状态</label>
				<div class="controls">
					<select id="funstate" name="funstate">
						<option value="1">可用</option>
						<option value="0">不可用</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input type="button" class="btn" id="addchild" value="增加子节点"
						disabled="disabled" onclick="addchild()" /> 
					<input type="button"
						class="btn btn-primary" value="保存" onclick="save()" />
				</div>
			</div>
		</div>
		<!-- end -->
	</div>
</body>
</html>