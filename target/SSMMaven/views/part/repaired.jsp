<%--
  Created by IntelliJ IDEA.
  User: 22962
  Date: 2019/9/28
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>报修页面</title>
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

<%--头部工具栏--%>
<div class="layui-btn-container" id="repaireToolBar">
    <button class="layui-btn layui-btn-sm3" data-type="delete">删除</button>
    <button class="layui-btn layui-btn-sm3" data-type="statusChange">更改状态</button>
</div>

<%--报修信息表--%>
<div id="repairTable" lay-filter="repairTable"></div>


<script src="../.././layui/js/repaired.js"></script>

</body>
</html>
