
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单管理——编辑</title>
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
var checkform = function() {
    var flag = true;
	var gname = $("#gname").val();
	var gimg = $("#gimg").val();
	var gtime = $("#gtime").val();
	var gprice = $("#gprice").val();
    if (gname = null || gname == "") {
		flag = false;
		$("#msg").html("*名称不能为空");
		$("#gname").focus();
	} else if(gname.length>=20){
		flag = false;
		$("#msg").html("输入名称太长");
		$("#gname").focus();
	}else if(gtime = null || gtime ==""){
		flag = false;
		$("#msg").html("菜品时间不能为空");
		$("#gtime").focus();
	}else if(gprice = null || gprice ==""){
		flag = false;
		$("#msg").html("菜品价格不能为空");
		$("#gprice").focus();
	}
	return flag;  	 	    
} 
	var verifyGname = function() {
        $.ajax({
            type: "POST",
            url:"${pageContext.request.contextPath}/web/goods/verifyGname",
            data:{
                gname:$("#gname").val()
            },
            success: function(data){
                if (data=="SUCCESS" && $("#gname").val()!='${goods.gname}'){
                    $("#msg").html("菜品名称已经存在"),
                    $("#gname").focus(),
                    $("#sumb").attr("disabled","disabled");
                } else {
                    // 这里应该不做反应，或是与if进行反向操作
                    $("#msg").html("可以增加")
                    $("#sumb").removeAttr("disabled");
                }
            },           
        });
    }
</script>
<style>
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

input[type="number"] {
	-moz-appearance: textfield;
}

.upload {
	position: relative;
	display: inline-block;
	height: 33px;
	line-height: 33px;
	overflow: hidden;
	vertical-align: middle;
	cursor: pointer;
	margin-left: 20px;
	height: 36px;
}

.upload .upload-input-file {
	position: absolute;
	right: 0;
	top: 0;
	font-size: 100px;
	opacity: 0;
	filter: alpha(opacity = 0);
	cursor: pointer;
}

.upload .upload-btn {
	outline: none;
	border: 0;
	padding: 5px 10px;
	color: #fff;
	background: #1c84c6;
	cursor: pointer;
	margin: 3px;
	border-radius: 3px;
}

.upload .upload-url {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	border-radius: 2px;
	border: solid 1px #ddd;
	width: 200px;
	height: 30px;
	-webkit-line-height: 1;
	line-height: 30px\9;
	-ms-line-height: 30px;
	text-indent: 3px;
}

.upload .upload-tip {
	display: none;
	background-color: #1c84c6;
	padding: 2px 10px;
	color: #FFA011;
	font-size: 12px !important;
	border-radius: 3px;
}
</style>
</head>
<body>
	<ul class="breadcrumb">
		<li><a href="#">菜品管理</a> <span class="divider">/</span></li>
		<li class="active">编辑菜品信息</li>
	</ul>
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>提示!</h4>
		<strong id="msg">${msg}</strong>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<form class="form-horizontal form-inline"
				action="${pageContext.request.contextPath}/web/goods/edit" method="post"
				enctype="multipart/form-data">
				<div class="control-group">
					<label class="control-label" for="gtname">菜品类型：</label>
					<div class="controls">
						<select id="gtid" name="gtid">
							<c:forEach items="${type}" var="item">
							    <c:choose>
							       <c:when test="${item.gtid==goods.gtid}">
							       	<option value="${item.gtid}" selected="selected">${item.gtname}</option>
							       </c:when>
							       <c:otherwise>
							         <option value="${item.gtid}">${item.gtname}</option>
							       </c:otherwise>
							    </c:choose>
								
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gname">菜品名称： </label>
					<div class="controls">
						<input id="gname" type="text" name="gname" value="${goods.gname}" placeholder="请输入中文或英文" onblur="verifyGname();"/>
						<input type="hidden" name="gid" value="${goods.gid}"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="file">图片：</label>
					<div class="upload">
						<input type="text" name="gimg" value="${goods.gimg}" class="upload-url" /> 
						<input type="button" class="upload-btn" value="浏览文件" /> 
						<input type="file" name="file" class="upload-input-file" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gprice">菜品价格： </label>
					<div class="controls">
						<div class="input-group">
							<input type="number" step="0.01" class="form-control"
								name="gprice" value="${goods.gprice}" id="gprice" placeholder="￥0.00">
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gcontent">菜品详情： </label>
					<div class="controls">
						<textarea class="form-control" name="gcontent"  rows="5"
							style="width: 283px; resize: none">${goods.gcontent}</textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gtime">菜品所需时间： </label>
					<div class="controls">
						<div class="input-group">
							<input type="number" value="${goods.gtime}" step="0.01" class="form-control"
								name="gtime" id="gtime" placeholder="小时数（可精确到
			小数点后两位）">分钟
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gstate">菜品状态： </label>
					<div class="controls">
						<select id="gstate" name="gstate">
						   <c:choose>
					          <c:when test="${goods.gstate==0 }">
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
						<input type="submit" class="btn" id="sumb" value="提交" onclick="return checkform();"/>
						<button class="btn btn-primary" type="button" 
						onclick="window.location.href='${pageContext.request.contextPath}/web/goods/list'">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(".upload .upload-input-file")
				.change(
						function() {
							if ($(this).parent().html().indexOf(
									"class=\"upload-url\"") != -1) {
								var fileUrl = $(this).val();
								$(this).parent().children(".upload-url").val(
										fileUrl);
							} else {
								var fileUrl = $(this).val();
								var urlArr = fileUrl.split("\\");
								var getName = urlArr[urlArr.length - 1];//截取路径并获取文件的
								名字
								$(this).parent().children(".upload-tip").text(
										getName).fadeIn("slow");
								//$(this).parent().children(".upload-btn").val(getName);//按钮上变成文件名称
								timeout = setTimeout(function() {
									$(".upload-tip").fadeOut("slow");
								}, 5000);
							}
						});
	</script>
</body>
</html>