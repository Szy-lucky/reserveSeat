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
                <form:form class="form-horizontal" action="user/updateUserU" method="post"
                           modelAttribute="user" enctype="multipart/form-data">
                    <form:hidden path="uid"/>
                    <form:hidden path="uphoto"/>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="username"/></label>
                        <div class="col-sm-4">
                            <form:label path="uname" class="form-control">${user.uname}</form:label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="photo"/></label>
                        <div class="col-sm-4">
                            <input type="file" name="myFile" class="form-control"  accept="image/*"/>
                            <img alt="" src="uploadfiles/${user.uphoto}" width="80px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="email"/></label>
                        <div class="col-sm-4">
                            <spring:message code="inputEmail" var="inputEmail"/>
                            <form:input path="email" class="form-control" placeholder="${inputEmail}"/>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="phone"/></label>
                        <div class="col-sm-4">
                            <spring:message code="inputPhone" var="inputPhone"/>
                            <form:input path="tel" class="form-control"	placeholder="${inputPhone}" />
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
                            <button type="submit" class="btn btn-default"><spring:message code="change"/></button>
                        </div>
                        <div class="col-sm-offset-0 col-sm-2">
                            <button type="reset" class="btn btn-default"><spring:message code="reset"/></button>
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
