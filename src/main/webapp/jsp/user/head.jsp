<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<style type="text/css">
.carousel img {
	width: 100%;
}
</style>
</head>
<body>
   <c:if test="${not empty mess}">
     <script type="text/javascript">
          alert("${mess}")
     </script>
  </c:if>
	<div class="container-fruid">
		<div class="navbar navbar-default " role="navigation">
			<div class="navbar-header" style="margin-left: 15px;">
				<a href="jsp/user/main.jsp" class="navbar-brand">大外图书馆座位预订</a>
			</div>
			<ul class="nav navbar-nav">
		      <c:if test="${not empty user }">
			  	<li><a href="user/selectUserU">欢迎  ${user.uname }</a></li>
			  </c:if>
			<c:if test="${empty user }">
				<li><a href="jsp/user/login.jsp">登录</a></li>
			</c:if>

			</ul>
			<ul class="nav navbar-nav navbar-right" style="margin-right: 15px;">
				<c:if test="${not empty user }">
				<li><a href="order/selectOrder">我的预约</a></li>
				<li class="dropdown"><a href="##" data-toggle="dropdown"
					class="dropdown-toggle">我的资料<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="user/selectUserU">基本资料</a></li>
						<li><a href="jsp/user/changePassword.jsp">修改密码</a></li>
					</ul></li>
				</c:if>
				<li><a href="jsp/admin/">后台</a></li>
				<c:if test="${not empty user }">
				<li><a href="user/logout">退出</a></li>
				</c:if>
			</ul>
		</div>
		<!-- 轮播 -->
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel" style="margin-top: -20px;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="images/yd_210330_ku_Apr_pctop_1500x200.jpg" alt="1">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="images/yd_210326_content_Spring_pctop_1500x200.jpg"
						alt="2">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="images/yd_210319_content_FL_pctop_1500x200.jpg" alt="3">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="images/content_-cotton_pctop_1500x200 (1).jpg" alt="4">
					<div class="carousel-caption">...</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- ********************************页面的主体内容**************************************************** -->


	</div>

</body>
</html>

