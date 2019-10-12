<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/1/001
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../.././layui/css/layui.css" media="all">
    <script src="../.././layui/layui.js"></script>;
</head>
<body>



<%--宿舍调换表--%>
<div id="exchangeTable" lay-filter="exchangeTable"></div>


<%--行工具栏--%>
<script type="text/html" id="barExchange">
    <a class="layui-btn layui-btn-xs" lay-event="agree">同意</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="refuse">拒绝</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script src="../.././layui/js/exchange.js"></script>



</body>
</html>
