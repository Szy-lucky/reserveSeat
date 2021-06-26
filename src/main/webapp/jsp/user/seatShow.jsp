<%--
  Created by IntelliJ IDEA.
  User: 10239
  Date: 2021/6/23
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>


    <style type="text/css">
        .carousel img {
            width: 100%;
        }
        p{display: inline;
            width: 8.3%}
    </style>
</head>
<body>
<c:if test="${not empty mess}">
    <script type="text/javascript">
        alert("${mess}")
    </script>
</c:if>
<jsp:include page="head.jsp"></jsp:include>
<div class="container-fruid">
    <div class="col-md-12 column">
        <div class="panel panel-info">
            <div class="panel-body">
                <div class="media" style="margin-left: 200px;">
                    <!-- 商品信息显示 -->
                    <img class="media-object" src="uploadfiles/${seat.spic}">
                    <div class="media-body" style="padding-left: 30px;">
                        <div class="form-group">
                            <label  class="col-sm-4 control-label"><spring:message code="seatname"/></label>
                            <div class="col-sm-4">
                                <label class="form-control">${seat.seatname}</label>
                            </div>
                        </div><br><br>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label"><spring:message code="seatarea"/></label>

                            <div class="col-sm-4">
                                <label class="form-control">${area.aname}</label>
                            </div>
                        </div><br><br>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label"><spring:message code="haselectricity"/></label>
                            <div class="col-sm-4">
                                <label  class="form-control">${seat.haselectricity}</label>
                            </div>
                        </div><br><br>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label"><spring:message code="isReservation"/></label>

                            <div class="col-sm-4">
                                <label  class="form-control">${seat.reservation}</label>
                            </div>
                        </div><br><br>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label"><spring:message code="intr"/></label>
                            <div class="col-sm-4">
                                <label  class="form-control">${seat.intr}</label>
                            </div>
                        </div><br><br>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label"><spring:message code="time"/></label>
                            <div class="col-sm-4">
                                <table>
                                    <tr>
                                        <c:forEach items="${times}" var="time" varStatus="st">
                                            <c:if test="${time==0}">
                                                <td style="background-color: cornflowerblue;width:9px;color: cornflowerblue">&nbsp;&nbsp;</td>
                                            </c:if>
                                            <c:if test="${time==1}">
                                                <td style="background-color: red; width: 9px;color: red">&nbsp;&nbsp;</td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                    <tr>
                                        <td>|0</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|2</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|4</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|6</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|8</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|10</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|12</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|14</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|16</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|18</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|20</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|22</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                        <td>|24</td>
                                    </tr>
                                </table>
                            </div>
                        </div><br><br>
                        <form action="order/order" >
                            <div class="form-group">
                                <label  class="col-sm-4 control-label"><spring:message code="Booked"/></label>
                                <div class="col-sm-4">
                                    <label  class="col-sm-4 control-label"><spring:message code="startTime"/></label>
                                    <select name="start">
                                        <c:forEach items="${orderStarts}" var="orderStarts">
                                            <option value="${orderStarts}">${orderStarts}</option>
                                        </c:forEach>

                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <label  class="col-sm-4 control-label"><spring:message code="endTime"/></label>
                                    <select name="end" >
                                        <c:forEach items="${orderEnds}" var="orderEnds" >
                                            <option value="${orderEnds}">${orderEnds}</option>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group ">
                                <div class="col-sm-offset-4 col-sm-1">
                                    <button type="submit" class="btn btn-default "><spring:message code="reservation"/></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- ***************************************************************** -->
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>
</div>

</body>
</html>


