<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
                <form class="form-horizontal" action="user/change"  method="post" id="form1">
                    <div class="form-group">
                        <label  class="col-sm-4 control-label"><spring:message code="oldpassword"/></label>

                        <div class="col-sm-4">
                            <spring:message code="inputOldPassword" var="inputOldPassword"/>
                            <input type="text" name="oldapass"   class="form-control"  placeholder="${inputOldPassword}">

                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <label  class="col-sm-4 control-label"><spring:message code="newpassword"/></label>
                        <div class="col-sm-4">
                            <spring:message code="inputNewPassword" var="inputNewPassword"/>
                            <input type="password" name="newapass"  class="form-control"  placeholder="${inputNewPassword}" >
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-1">
                            <button type="submit" class="btn btn-default"><spring:message code="change"/></button>
                        </div>
                        <div class="col-sm-offset-0 col-sm-2">
                            <button type="reset" class="btn btn-default"><spring:message code="reset"/></button>
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
