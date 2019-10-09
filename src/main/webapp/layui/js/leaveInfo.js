layui.use(['element','table','form','laydate'],function () {
    var element = layui.element
        , table = layui.table
        , form = layui.form
        , $ = layui.jquery;
    /*数据表格初始化*/
    table.render({
        elem:'#leaveInfoTable'
        ,title:'报修信息表'
        ,height:540
        ,id:'leaveInfoTable'
        ,skin: 'line' //行边框风格
        ,even: true //开启隔行背景
        ,url:'/dormManager/getLeaveInfo'
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
            ,{field: 'leaveId', title: '编号', fixed: 'left'}
            ,{field: 'student', title: '申请人',templet:'<span>{{d.student.stuName}}</span>'}
            ,{field: 'student', title: '学号',templet:'<span>{{d.student.stuId}}</span>'}
            ,{field: 'reasons', title: '说明'}
            ,{field: 'leaveDate', title: '离校时间'}
            ,{field: 'backDate', title: '返校时间'}
            ,{field: 'state', title: '状态',templet:function (d) {
                    if(d.state){
                        return "<span style='color:#19b2ff'>已审批</span>";
                    }else if(d.state==false){
                        return "<span style='color:red'>拒绝</span>";
                    }else
                        return "<span style='color:#11ff27;'>待审批</span>";

            }}
            ,{fixed: 'right', title:'操作', toolbar: '#barLeave', width:180}
        ]]

    });


    function stateChange(sendData,state,obj){
        $.ajax({
            url:'/dormManager/agreePermission',
            data:sendData,
            dataType:'JSON',
            success:function (result) {
                if(result.success){
                    layer.msg(result.msg);
                    obj.update({
                        state:state
                    })
                }else {
                    layer.msg(result.msg);
                }
            }
        })
    }
    table.on('tool(leaveInfoTable)',function (obj) {
        /*获取行数据*/
        var data = obj.data;
        var event = obj.event;
        var sendData='';
        switch (event) {
            case 'agree':
                if(data.state == true){
                    layer.msg("你已经同意过了！！！");
                    return;
                }else {
                    sendData = "state=true&leaveId="+data.leaveId;
                    stateChange(sendData,true,obj);
                }
                break;
            case 'refuse':
                if(data.state == false){
                    layer.msg("请勿重复操作！！！");
                    return;
                }else {
                    sendData = "state=false&leaveId="+data.leaveId;
                    stateChange(sendData,false,obj);
                }
                break;
            case 'delete':
                $.ajax({
                    url:'/dormManager/deleteLeave',
                    data:'leaveId='+data.leaveId,
                    dateType:"JSON",
                    success:function (result) {
                        if(result.success){
                            layer.msg(result.msg);
                            obj.del();
                        }else
                            layer.msg(result.msg);
                    }
                })
        }
    })
});