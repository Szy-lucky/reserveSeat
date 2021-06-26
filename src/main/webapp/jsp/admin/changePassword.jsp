<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
                    style="font-family: '华文行楷'; font-size: 25px;text-align: center;">密码修改界面</h3>
            </div>
            <div class="panel-body">
                <!-- ***********************************************************************8 -->
                <form class="form-horizontal" action="admin/change"  method="post" id="form1">
                    <div class="form-group">
                        <label  class="col-sm-4 control-label">旧密码</label>

                        <div class="col-sm-4">
                            <input type="text" name="oldapass"   class="form-control"  placeholder="请输入旧密码">

                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <label  class="col-sm-4 control-label">新密码</label>
                        <div class="col-sm-4">
                            <input type="password" name="newapass"  class="form-control"  placeholder="新密码" >
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-1">
                            <button type="submit" class="btn btn-default">修改</button>
                        </div>
                        <div class="col-sm-offset-0 col-sm-2">
                            <button type="reset" class="btn btn-default">重置</button>
                        </div>
                    </div>
                </form>
                <!-- ***********************************************************************8 -->
            </div>
        </div>



    </div>
</div>

</body>
</html>
