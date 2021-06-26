<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/17
  Time: 9:51
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
                <a href="javascript:history.back(-1)">返回上一页</a>
                <h3 class="panel-title"
                    style="font-family: '华文行楷'; font-size: 25px; text-align: center;">用户修改界面</h3>
            </div>
            <div class="panel-body">
                <!-- ***********************************************************************8 -->
                <%--@elvariable id="user" type="com.bean.User"--%>
                <form:form class="form-horizontal" action="user/updateUser" method="post"
                           modelAttribute="user">
                    <form:hidden path="uid"/>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">姓名</label>
                        <div class="col-sm-4">
                            <form:label path="uname" class="form-control">${user.uname}</form:label>

                            <%--<form:input path="uname" class="form-control"	placeholder="请输入名称" />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">照片</label>
                        <div class="col-sm-4">
                            <img alt="" src="uploadfiles/${user.uphoto}" width="80px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">邮箱</label>
                        <div class="col-sm-4">
                            <form:input path="email" class="form-control" placeholder="请输入邮箱" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">电话</label>
                        <div class="col-sm-4">
                            <form:input path="tel" class="form-control"	placeholder="请输入电话" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">是否违约</label>
                        <div class="col-sm-4">
                            <form:radiobutton  path="credit"   value="y" /> 违约
                            <form:radiobutton  path="credit"   value="n" /> 未违约
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">学号</label>
                        <div class="col-sm-4">
                            <form:input path="sid" class="form-control"	placeholder="请输入学号" />
                        </div>
                    </div>


                    <br />
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-1">
                            <button type="submit" class="btn btn-default">修改</button>
                        </div>
                        <div class="col-sm-offset-0 col-sm-2">
                            <button type="reset" class="btn btn-default">重置</button>
                        </div>
                    </div>
                </form:form>

                <!-- ***********************************************************************8 -->
            </div>
        </div>



    </div>
</div>

</body>
</html>
