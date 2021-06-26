<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/15
  Time: 19:44
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
    <style type = "text/css">
        body, table{font-size:12px;}
        table{
            table-layout:fixed;
            empty-cells:show;
            border-collapse: collapse;
            margin:0 auto;
        }
        td{height:30px;}
        h1, h2, h3{
            font-size:12px;
            margin:0;
            padding:0;
        }
        .table{
            border:1px solid #cad9ea;
            color:#666;
        }
        .table th{
            background-repeat:repeat-x;
            height:30px;
        }
        .table td, .table th{
            border:1px solid #cad9ea;
            padding:0 1em 0;
        }
        .table tr.alter{
            background-color:#f5fafe;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $('input[name="selectAll"]').on("click",function(){
                if($(this).is(':checked')){
                    $('input[name="seatids"]').each(function(){
                        $(this).prop("checked",true);
                    });
                }else{
                    $('input[name="seatids"]').each(function(){
                        $(this).prop("checked",false);
                    });
                }
            });
        });
    </script>
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
                    style="font-family: '华文行楷'; font-size: 25px;text-align: center;">${area}管理界面</h3>
            </div>
            <div class="panel-body">
                <!-- ***********************************************************************8 -->
                <%--<div class="panel-body">

                    <c:forEach items="${seats}" var="seat" begin="0" end="10">
                        <div class="col-xs-1">
                            <a href="user/selectBookDetail?bid=${seat.seatid }" class="thumbnail"> <img
                                    src="uploadfiles/${seat.spic }" alt="">
                            </a>
                            <div class="caption text-center">
                                <h4>${seat.seatname }</h4>
                            </div>
                        </div>

                    </c:forEach>
                </div>--%>

                <form action="admin/selectSeatByName" method="post">
                    <input type="hidden" name="area" value="${area}">
                    座位名称：<input type="text" name="seatname">
                    <input type="submit" value="查询">
                </form>

                <br><br>
                <form action="admin/deleteSeats" method="post">
                    全选： <input type="checkbox" name="selectAll"> <br>
                <table style="width: 100%;text-align: center;border-radius: 30px;" border="1px">
                    <tr>
                        <td>批量删除</td><td>序号</td><td>座位名称</td><td>图片</td><td>区域</td>
                        <td>是否有电源</td><td>是否可以预约</td><td>简介</td><td>操作</td>
                    </tr>
                    <c:forEach items="${seats}" var="seat" varStatus="st">
                        <tr>
                            <td> <input type="checkbox" name="seatids" value="${seat.seatid}"></td>
                            <td>${st.count+starIndex}</td>
                            <td>${seat.seatname}</td>
                            <td><img alt="" src="uploadfiles/${seat.spic}" width="50px"> </td>
                            <td>${area}</td>
                            <td>${seat.haselectricity}</td>
                            <td>${seat.reservation}</td>
                            <td>${seat.intr}</td>
                            <td><a href="admin/selectSeat?seatid=${seat.seatid}">修改</a>||<a href="admin/deleteSeat?seatid=${seat.seatid}" onclick="return confirm('确定要删除吗！')">删除</a></td>
                        </tr>
                    </c:forEach>
                </table>
                <input type="submit" value="批量删除" onclick="return confirm('确定要删除吗！')"><br>
                </form>

                <div style="text-align: center;">
                    <c:if test="${currPage>1}">
                        <a href="admin/getSeatsAdmin?currPage=${currPage-1}&area=${area}">上一页</a>
                    </c:if>
                    <c:if test="${currPage<countPage}">
                        <a href="admin/getSeatsAdmin?currPage=${currPage+1}&area=${area}">下一页</a>
                    </c:if>
                </div>
                <!-- ***********************************************************************8 -->
            </div>
        </div>



    </div>
</div>

</body>
</html>
