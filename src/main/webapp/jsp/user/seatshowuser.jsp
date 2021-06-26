<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/22
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
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
    <div class="panel panel-default">
        <div class="panel-heading"><a href="javascript:history.back(-1)">返回</a>
            <h5 class="panel-title"
                style="font-family: '华文行楷'; font-size: 25px;text-align: center;">${area}座位</h5>
            </div>
        <!-- **********************************************8 -->
        <div class="panel-body">
            <c:forEach items="${seats}" var="seat" >
                <div class="col-xs-1">
                    <a href="order/selectSeatOrder?sid=${seat.seatid }" class="thumbnail"> <img
                            src="uploadfiles/${seat.spic }" alt="">
                    </a>
                    <div class="caption text-center">
                        <h4>${seat.seatname }</h4>
                    </div>
                </div>

            </c:forEach>
        </div>
        <!-- **********************************************8 -->

        <jsp:include page="footer.jsp"></jsp:include>

    </div>


</div>

</body>
</html>
