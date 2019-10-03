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

<%--头部工具栏
<div class="layui-btn-container" id="scoreToolBar">
    <button class="layui-btn layui-btn-sm3" data-type="deleteScore">删除</button>
    <button class="layui-btn layui-btn-sm3" data-type="statusChange">更改状态</button>

</div>--%>
<script type="text/html" id="toolbarDom">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm3" lay-event="addStu">删除</button>
        <button class="layui-btn layui-btn-sm3" lay-event="reload">增加</button>
    </div>
    <%-- <select name="dorm.dromId" id="dorm" lay-verify="scoreDorm" lay-reqText="请选择一个楼号" lay-filter="dormNum">
         <option value="">请选择楼号</option>
     </select>--%>
</script>
<script type="text/html" id="dormOption">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
大苏打
<%--宿舍表--%>
<div id="dormTable" lay-filter="dormTable"></div>
<script src="../.././layui/js/dormExch.js"></script>



</body>
</html>
