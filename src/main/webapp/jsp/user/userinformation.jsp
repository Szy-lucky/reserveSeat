<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/23
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<jsp:include page="head.jsp"></jsp:include>
<div class="container-fruid">
    <div class="col-md-12 column">
        <div class="panel panel-info">
            <div class="panel-body">
                <!-- ***********************************************************************8 -->
                <%--@elvariable id="user" type="com.bean.User"--%>
                <form:form class="form-horizontal" action="user/updateUser" method="post"
                           modelAttribute="user">
                    <form:hidden path="uid"/>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="username"/></label>
                        <div class="col-sm-4">
                            <form:label path="uname" class="form-control">${user.uname}</form:label>

                                <%--<form:input path="uname" class="form-control"	placeholder="请输入名称" />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="photo"/></label>
                        <div class="col-sm-4">
                            <img alt="" src="uploadfiles/${user.uphoto}" width="80px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="email"/></label>
                        <div class="col-sm-4">
                            <form:label path="email" class="form-control">${user.email}</form:label>
                            <%--<form:input path="email" class="form-control" placeholder="请输入邮箱" />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="phone"/></label>
                        <div class="col-sm-4">
                            <form:label path="tel" class="form-control">${user.tel}</form:label>
                            <%--<form:input path="tel" class="form-control"	placeholder="请输入电话" />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="credit"/></label>
                        <div class="col-sm-4">
                            <form:label path="credit" class="form-control">${user.credit}</form:label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="sid"/></label>
                        <div class="col-sm-4">
                            <form:label path="sid" class="form-control">${user.sid}</form:label>
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-1">
                            <a href="user/selectUserUpdate" class="btn btn-default"><spring:message code="change"/></a>
                        </div>
                    </div>
                </form:form>
            </div>
            <!-- ***********************************************************************8 -->
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>
