<%--
  Created by IntelliJ IDEA.
  User: 22962
  Date: 2019/10/4
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理人员</title>
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
<div class="layui-btn-container" id="managerToolBar">
    <button class="layui-btn layui-btn-sm3" data-type="addManager">添加</button>
    <button class="layui-btn layui-btn-sm3" data-type="editRole">修改权限</button>
</div>

<%--管理员列表--%>
<div id="managerTable" lay-filter="managerTable"></div>


<%--行工具栏--%>
<script type="text/html" id="barManager">
    <a class="layui-btn layui-btn-xs" lay-event="reset">重置</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<script src="../.././layui/js/manager.js"></script>

<%--管理员信息表单--%>
<div class="layui-row" id="managerForm" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" id="form_reset" lay-filter="managerForm" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">用户编号</label>
                <div class="layui-input-block">
                    <input type="text" readonly name="managerId" id="managerId" required  lay-verify="number" autocomplete="off" placeholder="请输入编号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" readonly  name="managerName" id="managerName"  lay-verify="required" autocomplete="off" placeholder="请输入用户名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" id="Mphone" style="display: none">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" id="phone"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">所属角色</label>
                <div class="layui-input-block">
                    <select name="role.roleId" id="role" lay-verify="required" lay-reqText="请选中一个角色" >
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit lay-filter="managerForm">提交</button>
                    <button type="cancel" class="layui-btn layui-btn-primary">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
