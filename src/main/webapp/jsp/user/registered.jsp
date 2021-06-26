<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/22
  Time: 14:10
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
<c:if test="${not empty mess}">
    <script type="text/javascript">
        alert("${mess}")
    </script>
</c:if>
<div class="container-fruid">
    <div class="navbar navbar-default " role="navigation">
        <div class="navbar-header" style="margin-left: 15px;">
            <a href="jsp/user/main.jsp" class="navbar-brand">注册页面</a>
        </div>
    </div>
</div>
<div class="container-fruid">
    <div class="col-md-12 column">
        <div class="panel panel-info">
            <div class="panel-body">
                <%--@elvariable id="user" type="com.bean.User"--%>
                    <form class="form-horizontal" action="user/getRegistered"  method="post" id="form1">
                        <div class="form-group">
                            <label  class="col-sm-4 control-label">用户名</label>

                            <div class="col-sm-4">
                                <input type="text" name="uname"   class="form-control"  placeholder="请输入用户名">

                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <label  class="col-sm-4 control-label">密码</label>
                            <div class="col-sm-4">
                                <input type="password" name="upass"  class="form-control"  placeholder="密码" >
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-1">
                                <button type="submit" class="btn btn-default">注册</button>
                            </div>
                            <div class="col-sm-offset-0 col-sm-2">
                                <button type="reset" class="btn btn-default">重置</button>
                            </div>
                        </div>
                    </form>
            </div>

            <!-- ***************************************************************** -->
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>

