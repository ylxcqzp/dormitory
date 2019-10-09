<%--
  Created by IntelliJ IDEA.
  User: 22962
  Date: 2019/10/8
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>离校处理</title>
    <link rel="stylesheet" href="../.././layui/css/layui.css" media="all">
    <script src="../.././layui/layui.js"></script>
    <style>
        .layui-form .layui-border-box .layui-table-view {
            width: 100% !important;
            height: 355px;
        }
        .layui-table-box {
            position: relative;
            overflow: hidden;
            width: 100% !important;
        }
        .layui-table-cell .layui-form-checkbox[lay-skin=primary] {
            top: 5px;
            padding: 0;
        }
        .layui-btn-container .layui-btn{
            margin-top: 15px;
            margin-left: 10px;
        }
    </style>
</head>
<body>

<%--离校信息表--%>
<div id="leaveInfoTable" lay-filter="leaveInfoTable"></div>

<%--行工具栏--%>
<script type="text/html" id="barLeave">
    <a class="layui-btn layui-btn-xs" lay-event="agree">同意</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="refuse">拒绝</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script src="../.././layui/js/leaveInfo.js"></script>
</body>
</html>
