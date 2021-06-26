<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/16
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                    style="font-family: '华文行楷'; font-size: 25px;text-align: center;">座位管理界面</h3>
            </div>
            <div class="panel-body">
                <!-- ***********************************************************************8 -->
                <div style="display: inline-block;text-align: center;width: 33%;margin-top: 80px;margin-bottom: 80px;">
                <a href="admin/getSeatsAdmin?area=东区&currPage=1" > <img
                        src="images/area/east.jpg"
                        style="width: 432px; height: 241px;" alt="">
                </a>
                <br><h2>东区</h2>
                </div>
                <div style="display: inline-block;text-align: center;width: 33%;margin-top: 80px;margin-bottom: 80px;">
                <a href="admin/getSeatsAdmin?area=中区&currPage=1"> <img
                        src="images/area/middle.jpg"
                        style="width: 432px; height: 241px;" alt="">
                </a>
                <br><h2>中区</h2>
                </div>
                <div style="display: inline-block;text-align: center;width: 33%;margin-top: 80px;margin-bottom: 80px;">
                <a href="admin/getSeatsAdmin?currPage=1&area=西区" > <img
                        src="images/area/weat.jpg"
                        style="width: 432px; height: 241px;" alt="">
                </a><br><h2>西区</h2>
                </div>
                <!-- ***********************************************************************8 -->
            </div>
        </div>



    </div>
</div>

</body>
</html>
