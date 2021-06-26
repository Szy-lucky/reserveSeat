<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/16
  Time: 14:58
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
                $('input[name="aids"]').each(function(){
                    $(this).prop("checked",true);
                });
            }else{
                $('input[name="aids"]').each(function(){
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
                <h3 class="panel-title"
                    style="font-family: '华文行楷'; font-size: 25px;text-align: center;">区域管理界面</h3>
            </div>
            <div class="panel-body">
                <!-- ***********************************************************************8 -->
                <form action="admin/deleteAreas" method="post">
                    全选： <input type="checkbox" name="selectAll"> <br>
                <table style="width: 100%;text-align: center;border-radius: 30px;" border="1px">
                    <tr>
                        <td>批量删除</td><td>序号</td><td>区域编号</td><td>区域</td><td>操作</td>
                    </tr>
                    <c:forEach items="${areas}" var="area" varStatus="st">
                        <tr>
                            <td> <input type="checkbox" name="aids" value="${area.aid}"></td>
                            <td>${st.count}</td>
                            <td><a href="admin/selectAreaByName?aname=${area.aname}" style="color:red;font-size:16px;text-decoration: underline">${area.aid}</a></td>
                            <td>${area.aname}</td>
                            <td><a href="admin/selectAreaById?aid=${area.aid}">修改</a>||<a href="admin/deleteAreaById?aid=${area.aid}" onclick="return confirm('确定要删除吗！')">删除</a></td>
                        </tr>

                    </c:forEach>
                </table>
                <input type="submit" value="批量删除" onclick="return confirm('确定要删除吗！')"><br>
                </form>
                <!-- ***********************************************************************8 -->
            </div>
        </div>



    </div>
</div>

</body>
</html>
