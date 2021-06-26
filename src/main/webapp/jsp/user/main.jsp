<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	<jsp:include page="head.jsp"></jsp:include>


	<div class="container-fruid">

		<!-- ********************************页面的主体内容**************************************************** -->
		<div class="panel panel-default">

			<div class="panel-heading"><spring:message code="area"/></div>
			<!-- **********************************************8 -->
			<div class="panel-body">

				<div style="display: inline-block;text-align: center;width: 33%;margin-top: 80px;margin-bottom: 80px;">
					<a href="admin/getSeatsUser?area=东区" > <img
							src="images/area/east.jpg"
							style="width: 432px; height: 241px;" alt="">
					</a>
					<br><h2><spring:message code="east"/></h2>
				</div>
				<div style="display: inline-block;text-align: center;width: 33%;margin-top: 80px;margin-bottom: 80px;">
					<a href="admin/getSeatsUser?area=中区"> <img
							src="images/area/middle.jpg"
							style="width: 432px; height: 241px;" alt="">
					</a>
					<br><h2><spring:message code="middle"/></h2>
				</div>
				<div style="display: inline-block;text-align: center;width: 33%;margin-top: 80px;margin-bottom: 80px;">
					<a href="admin/getSeatsUser?area=西区" > <img
							src="images/area/weat.jpg"
							style="width: 432px; height: 241px;" alt="">
					</a><br><h2><spring:message code="west"/></h2>
				</div>

			</div>
			<jsp:include page="footer.jsp"></jsp:include>

		</div>


	</div>

</body>
</html>

