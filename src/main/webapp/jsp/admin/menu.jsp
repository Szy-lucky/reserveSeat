<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    
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
  <div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a href="jsp/admin/main.jsp">主页</a>
			</h4>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapse1">用户管理</a>
			</h4>
		</div>
		<div id="collapse1" class="panel-collapse collapse">
			<div class="list-group">
				<a href="user/userShow?currPage=1"	class="list-group-item">查看用户</a>

			</div>
		</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapse2">座位管理</a>
			</h4>
		</div>
		<div id="collapse2" class="panel-collapse collapse">
			<div class="list-group">
				<a href="admin/getSeatAdd"	class="list-group-item">添加座位</a>
<%--				<a href="admin/selectBooks?currPage=1"	class="list-group-item">查看座位</a>--%>
				<a href="jsp/admin/areaShow.jsp"	class="list-group-item">查看座位</a>
			</div>
		</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapse3">区域管理</a>
			</h4>
		</div>
		<div id="collapse3" class="panel-collapse collapse">
			<div class="list-group">
				<a href="jsp/admin/areaTypeAdd.jsp"	class="list-group-item">添加区域</a>
				<a href="admin/selectAreas"	class="list-group-item">查看区域</a>

			</div>
		</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapse4">预定管理</a>
			</h4>
		</div>
		<div id="collapse4" class="panel-collapse collapse">
			<div class="list-group">
				<a href="order/selectOrders?currPage=1"	class="list-group-item">管理预定信息</a>

			</div>
		</div>
	</div>

	</div>

  </body>
</html>
