<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
					$('input[name="oids"]').each(function(){
						$(this).prop("checked",true);
					});
				}else{
					$('input[name="oids"]').each(function(){
						$(this).prop("checked",false);
					});
				}
			});
		});
	</script>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="container-fruid">
	<div class="col-md-12 column">
		<div class="panel panel-info">
			<div class="panel-body">
				<!-- ***********************************************************************8 -->

				<br><br>
					<table style="width: 100%;text-align: center;border-radius: 30px;" border="1px">
						<tr>
							<td>区域</td><td>座位名称</td><td>用户id</td>
							<td>起始时间</td><td>终止时间</td><td>操作</td>
						</tr>
							<tr>
								<td>${area.aname}</td>
								<td>${seat.seatname}</td>
								<td>${order.uid}</td>
								<td>${order.start}</td>
								<td>${order.end}</td>
								<td><a href="order/deleteOrderUser?uid=${order.uid}" onclick="return confirm('确定要取消吗！')">取消预约</a></td>
							</tr>
					</table>
				</form>
				<!-- ***********************************************************************8 -->
			</div>

			<!-- ***************************************************************** -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</div>

</body>
</html>
