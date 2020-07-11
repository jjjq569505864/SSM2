<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加菜品类型功能</title>
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
		var flag = false;
		var gtname = $("#gtname").val();
		if (gtname.length > 0 && gtname.length <= 20) {
			$("#msg").html("*修改成功");
			flag = true;
		} else if (gtname = null || gtname == "") {
			flag = false;
			$("#msg").html("*名称不能为空");
		} else {
			flag = false;
			$("#msg").html("*名称太长");
		}
		return flag;
	}
	var verifyGtname = function() {
        $.ajax({
            type: "POST",
            url:"${pageContext.request.contextPath}/web/goodstype/verifyGtname",
            data:{
                gtname:$("#gtname").val()
            },
            success: function(data){
                if (data=="SUCCESS"){
                    $("#msg").html("菜品名称已经存在")
                    $("#gtname").focus();
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
</head>
<body>
	<ul class="breadcrumb">
		<li><a href="#">菜品类型管理</a> <span class="divider">/</span></li>
		<li class="active">增加菜品类型</li>
	</ul>
	<div class="alert">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>提示!</h4>
		<strong id="msg">${msg}</strong>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/web/goodstype/add"
				method="post">
				<div class="control-group">
					<label class="control-label" for="gtname">菜品类型名称</label>
					<div class="controls">
						<input id="gtname" type="text" name="gtname" maxlength="20"  onblur="verifyGtname();"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="gtstate">菜品状态</label>
					<div class="controls">
						<select name="gtstate">
							<option value="1">可用</option>
							<option value="0">不可用</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" class="btn" value="提交" id="sumb" onclick="return checkform();" />
						<button class="btn btn-primary" type="button"
							onclick="window.location.href='${pageContext.request.contextPath}/web/goodstype/list';">返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>