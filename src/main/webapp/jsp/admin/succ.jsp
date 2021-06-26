<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>Bootstrap 101 Template</title>
<!-- Bootstrap -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<!-- 导航栏开始 -->
	<%@include file="header.jsp"%>
	<!-- 导航栏结束 -->

	<!-- 正文开始 -->
	<div class="row">
		<div class="col-md-2">
			<!-- 左侧导航栏开始 -->
			<%@include file="menu.jsp"%>
			<!-- 左侧导航栏结束 -->
		</div>


		<div class="col-md-10">

			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title"
						style="font-family: '华文行楷'; font-size: 25px;">操作成功！</h3>
				</div>
				
			</div>



		</div>
	</div>

</body>
</html>
