layui.use(['element','table','form','laydate'],function () {
    var element = layui.element
        , table = layui.table
        , form = layui.form
        , laydate = layui.laydate
        , $ = layui.jquery;

    /*数据表格初始化*/
    table.render({
        elem: '#exchangeTable'
        , title: '宿舍信息表'
        , height: 540
        , id: 'exchangeTable'
        , skin: 'line' //行边框风格
        , even: true //开启隔行背景
        , url: '/dormManager/exchangeInfo'
        , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
            layout: ['count', 'prev', 'page', 'next', 'skip', 'limit'] //自定义分页布局
            , limit: 10
            , groups: 3 //只显示 1 个连续页码
            , first: "首页" //显示首页
            , last: "尾页" //显示尾页
            , theme: {theme: 'layui-bg-blue'}
        }
        , request: {
            pageName: 'page' //页码的参数名称，默认：page
            , limitName: 'limit' //每页数据量的参数名，默认：limit
        }
        , loading: true
        , cols: [[ //表头
            {type: 'checkbox', fixed: 'left'}
            , {field: 'excId', title: '编号', fixed: 'left'}
            , {field: 'student', title: '申请人', templet: '<span>{{d.student.stuName}}</span>'}
            , {field: 'student', title: '学号', templet: '<span>{{d.student.stuId}}</span>'}
            , {field: 'reason', title: '原因'}
            , {field: 'targetDrom', title: '目标宿舍楼'}
            , {field: 'targetRoom', title: '房间号'}
            , {
                field: 'state', title: '状态', templet: function (d) {
                    if(d.state){
                        return "<span style='color:#19b2ff'>已审批</span>";
                    }else if(d.state==false){
                        return "<span style='color:red'>拒绝</span>";
                    }else
                        return "<span style='color:#11ff27;'>待处理</span>";
                }
            }
            , {field: 'manager', title: '审批人', templet: function (d) {
                    if(d.manager){
                        return "<span>"+d.manager.managerName+"</span>"
                    }else
                        return '<span style="color: #ff3838">空</span>'
            }}
            ,{fixed: 'right', title:'操作', toolbar: '#barExchange', width:180}
        ]]
    });


    /*同意：拒绝请求*/
    function stateChange(sendData,state,manager,obj){
        console.log(manager);
        $.ajax({
            url:'/dormManager/exchangeOption',
            data:sendData,
            dataType:'JSON',
            success:function (result) {
                if(result.success){
                    layer.msg(result.msg);
                    obj.update({
                        state:state,
                        manager:manager
                    })
                }else {
                    layer.msg(result.msg);
                }
            }
        })
    }
    table.on('tool(exchangeTable)',function (obj) {
       var manager = 'ghjdfew';
       $.ajax({
           url:'/stu_dorm_lib/getManager',
           dataType:"JSON",
           async:false,
           success:function (result) {
               manager = result;
           }
       });
        /*获取行数据*/
        var data = obj.data;
        /*获取事件*/
        var event = obj.event;
        /*请求的参数*/
        var sendData;
        switch (event) {
            case 'agree':
                if(data.state == true){
                    layer.msg("你已经同意过了！！！");
                    return;
                }else {
                    if (data.state == false){
                        layer.msg("不可重复操作！！！");
                        return;
                    }
                    sendData = {
                        excId:data.excId,
                        'student.stuId':data.student.stuId,
                        targetDrom:data.targetDrom,
                        targetRoom:data.targetRoom,
                        state:true,
                        "manager.managerId":manager.managerId
                    };
                    stateChange(sendData,true,manager,obj);
                }
                break;
            case 'refuse':
                if(data.state == false){
                    layer.msg("请勿重复操作！！！");
                    return;
                }else {
                    if(data.state == true){
                        layer.msg("结果不可修改！");
                        return;
                    }
                    sendData = {
                        excId:data.excId,
                        'student.stuId':data.student.stuId,
                        targetDrom:data.targetDrom,
                        targetRoom:data.targetRoom,
                        state:false,
                        "manager.managerId":manager.managerId
                    };
                    stateChange(sendData,false,manager,obj);
                }
                break;
            case 'delete':
                $.ajax({
                    url:'/dormManager/deleteExchange',
                    data:'excId='+data.excId,
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