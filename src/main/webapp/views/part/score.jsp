<%--
  Created by IntelliJ IDEA.
  User: 22962
  Date: 2019/9/24
  Time: 20:31
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
<script type="text/html" id="toolbarSco">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm3" lay-event="AddSco">增加</button>
    </div>
    <%-- <select name="dorm.dromId" id="dorm" lay-verify="scoreDorm" lay-reqText="请选择一个楼号" lay-filter="dormNum">
         <option value="">请选择楼号</option>
     </select>--%>
</script>
<script type="text/html" id="scoreOption">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<%--宿舍评分表--%>
<div id="scoreTable" lay-filter="scoreTable"></div>
<script src="../.././layui/js/score.js"></script>
<%--增加表单--%>
<div class="layui-row" id="scoForm" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" id="form_reset" lay-filter="scoForm" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">得分</label>
                <div class="layui-input-block">
                    <input type="text"  name="scorePoint" id="scorePoint" lay-verify="required|number" autocomplete="off" placeholder="请输入得分" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">记录时间</label>
                <div class="layui-input-block">
                    <input type="text" name="recordTime" id="recordTime" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">宿舍楼号</label>
                <div class="layui-input-block">
                    <select name="Drom.dromId" id="Drom" lay-verify="required" lay-reqText="请选择一个楼号">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">宿舍号</label>
                <div class="layui-input-block">
                    <select name="Room.roomId" id="Room" lay-verify="required" lay-reqText="请选择宿舍号">
                        <option value="">请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit lay-filter="addForm" id="scoAdd">添加</button>
                    <button class="layui-btn  layui-btn-submit " lay-submit lay-filter="editForm" id="scoEdit">编辑</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
