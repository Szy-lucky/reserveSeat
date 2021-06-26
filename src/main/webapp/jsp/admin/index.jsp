<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
  <body>
   <div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title" style="font-family: '华文行楷'; font-size: 25px;display: inline;">欢迎使用图书馆座位后台管理系统</h3>
			<a href="user/i18n" class="nav navbar-nav navbar-right">前台</a>
		</div>
		<div class="panel-body">
			<br />
			<br />
			<br />

			<div class="form-group">
				<div align="center">
					<span style="font-family: '华文行楷'; font-size: 30px;">请使用管理员账号进行登录</span>
				</div>
			</div>
			<br />



			<div class="form-group">
				
				<div class="col-sm-12" align="center">
			      	<a href="jsp/admin/login.jsp" class="btn btn-default">进入系统</a>
				</div>
			</div>
		</div>
		</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
  </body>
</html>
