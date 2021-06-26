<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
   <c:if test="${not empty mess}">
     <script type="text/javascript">
          alert("${mess}")
     </script>
  </c:if>
  <nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header" style="height: 100px;">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				         <span class="sr-only">Toggle navigation</span> 
				         <span	class="icon-bar"></span> 
				         <span class="icon-bar"></span> 
				         <span class="icon-bar"></span>
			       </button>
					<a class="navbar-brand" href="#"  style="padding-top: 30px;padding-left: 50px;">座位预订后台管理系统</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎 , ${admin.aname}<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li>
									<a href="jsp/admin/changePassword.jsp">信息修改</a>
								</li>
								<li>
									<a href="#">我的消息</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="admin/logout">注销</a>
								</li>
								
							</ul>
						</li>
						<li><a href="user/i18n">前台</a>	</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>

  </body>
</html>
