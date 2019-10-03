layui.use(['element','table','form','laydate'],function () {
    var element = layui.element
        ,table = layui.table
        ,form = layui.form
        ,laydate = layui.laydate
        ,$ = layui.jquery;
    /*日期渲染*/

    /*数据表格初始化*/
    table.render({
        elem:'#dormTable'
        ,title:'宿舍信息表'
        ,height:540
        ,id:'dormTable'
        ,skin: 'line' //行边框风格
        ,even: true //开启隔行背景
        ,url:'/dormExchange/changeInfo'
        ,toolbar: '#toolbarDom' //开启头部工具栏，并为其绑定左侧模板
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
            ,{field: 'exc_id', title: '宿舍请求编号', fixed: 'left'}
            ,{field: 'stu_id', title: '学生编号'}
            ,{field: 'reason', title: '原因'}
            ,{field: 'target_drom', title: '目标宿舍楼'}
            ,{field: 'target_room', title: '目标宿舍号'}
            ,{field: 'state', title: '状态'}
            ,{field: 'handle_id', title: '审批人编号'}
            ,{fixed: 'right', title:'操作', toolbar: '#dormOption', width:150}
        ]]

    });})