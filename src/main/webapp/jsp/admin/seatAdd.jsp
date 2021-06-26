<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/16
  Time: 18:24
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
                    style="font-family: '华文行楷'; font-size: 25px; text-align: center;">座位添加界面</h3>
            </div>
            <div class="panel-body">
                <!-- *********************************************************************** -->
                <%--@elvariable id="seat" type="com.bean.Seat"--%>
                <form:form class="form-horizontal" action="admin/addSeat" method="post"
                           modelAttribute="seat"  enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">座位名称</label>
                        <div class="col-sm-4">
                            <form:input path="seatname" class="form-control"	placeholder="请输入座位名称" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">座位图片</label>
                        <div class="col-sm-4">
                            <input type="file" name="myFile" class="form-control"  accept="image/*"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">区域</label>
                        <div class="col-sm-4">
                            <form:select path="areaid">
                                <form:option value="${areas[0].aid}">请选择……</form:option>
                                <c:forEach items="${areas}" var="area">
                                    <form:option value="${area.aid }"> ${area.aname}</form:option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">是否推荐</label>
                        <div class="col-sm-4">
                            <form:radiobutton  path="haselectricity"   value="y" /> 有电源
                            <form:radiobutton  path="haselectricity"   value="n" /> 没有电源
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">是否可以预约</label>
                        <div class="col-sm-4">
                            <form:radiobutton  path="reservation"   value="y" /> 可以预约
                            <form:radiobutton  path="reservation"   value="n" /> 不可预约
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">座位简介</label>
                        <div class="col-sm-4">
                            <form:textarea path="intr"  class="form-control"  rows="10"/>
                        </div>
                    </div>

                    <br />
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-1">
                            <button type="submit" class="btn btn-default">添加</button>
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
