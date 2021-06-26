<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

<script type="text/javascript">


</script>
    
</head> 
  <body>
  <c:if test="${not empty mess}">
     <script type="text/javascript">
          alert("${mess}")
     </script>
  </c:if>

 	<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title" style="font-family: '华文行楷'; font-size: 25px;display: inline;">管理员登录界面</h3>
					<a href="user/i18n" class="nav navbar-nav navbar-right">前台</a>
				</div>
				<div class="panel-body">
					<br /><br /><br />
	<form class="form-horizontal" action="admin/login"  method="post" id="form1">
		<div class="form-group">
			<label  class="col-sm-4 control-label">登录账号</label>
					
			<div class="col-sm-4">
 <input type="text" name="aname"   class="form-control"  placeholder="请输入账号">
				
			</div> 
		</div>
		<br />
		<div class="form-group">
			<label  class="col-sm-4 control-label">密码</label>
			<div class="col-sm-4">
			<input type="password" name="apass"  class="form-control"  placeholder="密码" >
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-1">
				<button type="submit" class="btn btn-default">登录</button>
			</div>
			<div class="col-sm-offset-0 col-sm-2">
				<button type="reset" class="btn btn-default">重置</button>
			</div>
		</div>
	</form>
	</div>
	</div>

  </body>
</html>
