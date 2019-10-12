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


<div class="layui-btn-container" id="changeToolBar">
    <button class="layui-btn layui-btn-sm3" data-type="delete">删除</button>
    <button class="layui-btn layui-btn-sm3" data-type="statusChange">处理</button>

</div>
<script type="text/html" id="toolbarDom">

</script>


<%--宿舍表--%>
<div id="dormTable" lay-filter="dormTable"></div>
<script src="../.././layui/js/dormExch.js"></script>



</body>
</html>
