layui.use(['element','table','form','laydate'],function () {
    var element = layui.element
        ,table = layui.table
        ,form = layui.form
        ,laydate = layui.laydate
        ,$ = layui.jquery;
    var index;
    /*日期渲染*/
    laydate.render({
        elem: '#recordTime'
        ,format: 'yyyy-MM-dd' //可任意组合
        ,theme: 'grid'
        ,trigger: 'click'
    });
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

    })

    /*获取所有宿舍信息，渲染班级下拉框*/
    function getDormList(obj) {
        $.ajax({
            url: '/dormManager/getDormList',
            type: 'POST',
            dataype: 'json',
            success: function (result) {
                $('#Drom').html("<option value=''>请选择</option>");
                $.each(result,function(index,item){
                    if(obj.hasOwnProperty('data')){
                        if(item.dromId!=obj.data.Drom.dromId){
                            $('#Drom').append("<option value='"+item.dromId+"'>"+item.dromId+"</option>");//往下拉菜单里添加元素
                        }else{
                            $('#Drom').append("<option value='"+item.dromId+"' selected>"+item.dromId+"</option>");//往下拉菜单里添加元素
                        }
                    }else {
                        $('#Drom').append("<option value='"+item.dromId+"'>"+item.dromId+"</option>");//往下拉菜单里添加元素
                    }

                });
                form.render();//菜单渲染 把内容加载进去
            }
        });
    }
    function getRoomList(obj) {
        $.ajax({
            url: '/dormManager/getRoomList',
            type: 'POST',
            dataype: 'json',
            success: function (result) {
                $('#Room').html("<option value=''>请选择</option>");
                var each = $.each(result,function(index, item){
                    if(obj.hasOwnProperty('data')) {
                        if(item.roomId!=obj.data.Room.roomId){
                            $('#Room').append("<option value='"+item.roomId+"'>"+item.roomId+"</option>");//往下拉菜单里添加元素
                        }else{
                            $('#Room').append("<option value='"+item.roomId+"' selected>"+item.roomId+"</option>");//往下拉菜单里添加元素
                        }
                    }else {
                        $('#Room').append("<option value='"+item.roomId+"'>"+item.roomId+"</option>");//往下拉菜单里添加元素
                    }

                });
                form.render();//菜单渲染 把内容加载进去
            }
        });
    }
    //头工具栏事件
    table.on('toolbar(scoreTable)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'AddSco':
                $('#form_reset')[0].reset();
                $('#scoreId').attr("readonly",false);
                $('#scorePoint');
                $('#recordTime');
                $("#Drom").val("请选择");
                getDormList(obj);
                $("#Room").val("请选择");
                getRoomList(obj);
                form.render();
                /*打开表单*/
                index = layer.open({
                    type: 1
                    , area: ['400px', '520px']
                    , content: $("#scoForm")
                });
                break;

            //自定义头工具栏右侧图标 - 提示
            case 'LAYTABLE_TIPS':
                layer.alert('这是工具栏右侧自定义的一个图标按钮');
                break;
        }
    });
    //监听行工具事件
    table.on('tool(scoreTable)', function(obj){//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data;//获得当前行数据
        if(obj.event === 'del'){//获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            layer.confirm('真的要删除该条信息吗？', function(index){
                layer.close(index);
                //向服务端发送删除指令；这里可以是发送ajax请求
                $.ajax({
                    url:'/dormManager/scoreDel',
                    data:"scoreId="+data.scoreId,
                    dataType:'JSON',
                    type:'post',
                    success:function (data) {
                        if (data.success){
                            obj.del();
                            layer.msg(data.msg);
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
            });
        }
        else if (obj.event === 'edit') {
            /*调用函数： 数据回显*/
            getDormList(obj);
            getRoomList(obj);
            $('#scoreId').attr("readonly",true);
            EidtUv(data);
            index = layer.open({
                type: 1
                , area: ['400px', '520px']
                , content: $("#scoForm")
            });
        }
        function  EidtUv(data) {
            $("#scorePoint").val(data.scorePoint);
            $("#recordTime").val(data.recordTime);
            $("#scoForm").val(data.scoForm);
            form.render('select');

        }
    });
    form.on('submit(addForm)', function(data){

        $.ajax({
            url:'/dormManager/scoAdd',
            data:data.field,
            dataType:'JSON',
            type:'post',
            success:function (data) {
                if (data.success){

                    layer.msg(data.msg);
                    table.reload('scoreTable');
                }else{
                    layer.msg(data.msg);
                }
            }
        });
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });
    form.on('submit(editForm)', function(data){
        $.ajax({
            url:'/dormManager/scoEdit',
            data:data.field,
            dataType:'JSON',
            type:'post',
            success:function (data) {
                if (data.success){
                    layer.msg(data.msg);
                    table.reload('scoreTable');
                }else{
                    layer.msg(data.msg);
                }
            }
        });
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });

});


