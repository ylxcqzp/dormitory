layui.use(['element','table','form','laydate'],function () {
    var element = layui.element
        , table = layui.table
        , form = layui.form
        , laydate = layui.laydate
        , $ = layui.jquery;
    /*日期渲染*/

    /*数据表格初始化*/
    table.render({
        elem: '#dormTable'
        , title: '宿舍信息表'
        , height: 540
        , id: 'dormTable'
        , skin: 'line' //行边框风格
        , even: true //开启隔行背景
        , url: '/dormExchange/changeInfo'
        , toolbar: '#toolbarDom' //开启头部工具栏，并为其绑定左侧模板
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
            , {field: 'excId', title: '宿舍请求编号', fixed: 'left'}
            , {field: 'student', title: '学生编号', templet: '<span>{{d.student.stuId}}</span>'}
            , {field: 'reason', title: '原因'}
            , {field: 'targetDrom', title: '目标宿舍楼'}
            , {field: 'targetRoom', title: '目标宿舍号'}
            , {
                field: 'state', title: '状态', templet: function (d) {
                    if (d.state) {
                        return "<span style='color: #32a1ff;'>已处理</span>";
                    } else
                        return "<span style='color:red;'>未处理</span>";
                }
            }
            , {field: 'manager', title: '审批人编号', templet: '<span>{{d.manager.managerId}}</span>'}
        ]]

    });


    var active = {
        delete: function(){ //获取选中数据
            var checkStatus = table.checkStatus('dormTable')
                ,data = checkStatus.data;
            /*判断是否有选中数据*/
            if(data.length===0){
                layer.alert("请至少选择一条信息");
                return;
            }
            /*请求删除数据*/
            $.ajax({
                url:'/dormExchange/deleteChange',
                data:"excId="+data[0].excId,
                dataType:'JSON',
                type:'get',
                success:function (data) {
                    if (data.success){
                        layer.msg(data.msg);
                        table.reload('dormTable');
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }
        ,statusChange: function(){ //获取选中数目
            var checkStatus = table.checkStatus('dormTable')
                ,data = checkStatus.data;
            if(data.length===0){
                layer.alert("请至少选择一条信息");
                return;
            }
            if(data[0].state){
                layer.alert("不能修改已处理信息！");
                return;
            }
            $.ajax({
                url:'/dormExchange/updateChangeStatus',
                data: "excId="+data[0].excId,
                dataType:'JSON',
                type:'get',
                success:function (data) {
                    if (data.success){
                        layer.msg(data.msg);
                        table.reload('dormTable');
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });


        }

    };

    $('#changeToolBar .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
})