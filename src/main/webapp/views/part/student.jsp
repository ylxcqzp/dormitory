<%--
  Created by IntelliJ IDEA.
  User: 22962
  Date: 2019/9/21
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息</title>
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
        .layui-hide {
             display: block !important;
        }
        .demoTable {
            position: absolute;
            top: 22px;
            left: 212px;
            z-index: 999;
        }
    </style>
</head>
<body>

<div class="demoTable">
    <div class="layui-inline">
        <input class="layui-input" name="id" placeholder="学号/姓名/专业/班级" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" id="searchBtn" data-type="reload">搜索</button>
</div>

<div id="studentTable" lay-filter="studentTable"></div>


<script src="../.././layui/js/student.js"></script>
<script type="text/html" id="toolbarStu">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm3" lay-event="addStu">添加学生</button>
        <button class="layui-btn layui-btn-sm3" lay-event="reload">刷新</button>
    </div>
</script>
<script type="text/html" id="barStu">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<%--学生表单--%>
<div class="layui-row" id="stuForm" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" id="form_reset" lay-filter="stuForm" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">学号</label>
                <div class="layui-input-block">
                    <input type="text" readonly name="stuId" id="stuId" lay-verify="required|number" autocomplete="off" placeholder="请输入学号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="stuName" id="stuName" lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <select name="stuSex" lay-filter="stuSex" id="stuSex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">生源地</label>
                <div class="layui-input-block">
                    <input type="text" name="stuFrom" id="stuFrom" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input id="phone" type="text" name="phone" required lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-block">
                    <input type="text" name="stuDate" id="stuDate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" id="college" style="display: none">
                <label class="layui-form-label">所在学院</label>
                <div class="layui-input-block">
                    <input id="stuCollege" type="text" name="stuCollege" required autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" id="major" style="display: none">
                <label class="layui-form-label layui-hide">专业</label>
                <div class="layui-input-block">
                    <input id="stuMajor" type="text" name="stuMajor" required autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">班级</label>
                <div class="layui-input-block">
                    <select name="aClass.classId" id="aClass" lay-verify="required" lay-reqText="请选择一个班级">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit lay-filter="stuForm">确认修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>


</html>
