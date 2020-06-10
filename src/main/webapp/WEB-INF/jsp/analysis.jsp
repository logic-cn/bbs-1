<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <script src="<%=path%>/static/js/echarts.min.js"></script>
    <script src="<%=path%>/static/js/jquery-3.2.1.js"></script>
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
</head>

<body>
<div class="row">
    <div class="col-xs-6 col-sm-4" style="height: 300px">
        <%@include file="analysis1.jsp"%>
    </div>
    <div class="col-xs-6 col-sm-4" style="height: 300px">
        <%@include file="analysis2.jsp"%>
    </div>
    <!-- Optional: clear the XS cols if their content doesn't match in height -->
<%--    <div class="clearfix visible-xs-block"></div>--%>
    <div class="col-xs-6 col-sm-4"style="height: 300px; display: flex">
        <%@include file="DataPicker.jsp"%>
    </div>
</div>
</body>
</html>