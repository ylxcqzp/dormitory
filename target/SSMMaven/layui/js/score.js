layui.use(['element','table','form','laydate'],function () {
    var element = layui.element
        ,table = layui.table
        ,form = layui.form
        ,laydate = layui.laydate
        ,$ = layui.jquery;

    /*数据表格初始化*/
    table.render({
        elem:'#scoreTable'
        ,title:'学生信息表'
        ,height:540
        ,id:'scoreTable'
        ,skin: 'line' //行边框风格
        ,even: true //开启隔行背景
        ,url:'/dormManager/scoreInfo'
        ,toolbar: '#toolbarSco' //开启头部工具栏，并为其绑定左侧模板
        ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: [ 'count', 'prev', 'page', 'next', 'skip','limit'] //自定义分页布局
            ,limit:10
            ,groups: 3 //只显示 1 个连续页码
            ,first: "首页" //显示首页
            ,last: "尾页" //显示尾页
            ,theme:{theme: 'layui-bg-blue'}
        }
        ,request: {
            pageName: 'page' //页码的参数名称，默认：page
            ,limitName: 'limit' //每页数据量的参数名，默认：limit
        }
        ,loading:true
        ,cols: [[ //表头
            {type: 'checkbox', fixed: 'left'}
            ,{field: 'scoreId', title: '分数记录编号', fixed: 'left'}
            ,{field: 'scorePoint', title: '得分'}
            ,{field: 'recordTime', title: '记录时间'}
            ,{field: 'drom', title: '宿舍楼编号',templet:'<span>{{d.drom.dromId}}</span>'}
            ,{field: 'room', title: '宿舍号',templet:'<span>{{d.room.roomId}}</span>'}
            ,{fixed: 'right', title:'操作', toolbar: '#scoreOption', width:150}
        ]]

    });})