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


</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>


	<div class="container-fruid">

		<!-- ********************************页面的主体内容**************************************************** -->
		<div class="panel panel-default">
			<div class="panel-heading">推荐商品</div>
			<!-- **********************************************8 -->
			<div class="panel-body">
			
			
			
			
			
			
			
			
			
			
			</div>
			<!-- **********************************************8 -->

			<jsp:include page="footer.jsp"></jsp:include>

		</div>


	</div>

</body>
</html>

