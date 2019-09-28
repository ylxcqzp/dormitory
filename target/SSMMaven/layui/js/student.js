layui.use(['element','table','form','laydate'], function(){
    var element = layui.element
        ,table = layui.table
        ,form = layui.form
        ,laydate = layui.laydate
        ,$ = layui.jquery;
    var index;

    /*日期渲染*/
    laydate.render({
        elem: '#stuDate'
        ,format: 'yyyy-MM-dd' //可任意组合
        ,theme: 'grid'
        ,trigger: 'click'
    });

    /*数据表格初始化*/
    table.render({
        elem:'#studentTable'
        ,title:'学生信息表'
        ,height:540
        ,id:'stuTable'
        ,skin: 'line' //行边框风格
        ,even: true //开启隔行背景
        ,url:'/stu_dorm_lib/studentInfo'
        ,toolbar: '#toolbarStu' //开启头部工具栏，并为其绑定左侧模板
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
            ,{field: 'stuId', title: '学号', fixed: 'left'}
            ,{field: 'stuName', title: '姓名'}
            ,{field: 'stuSex', title: '性别'}
            ,{field: 'stuFrom', title: '生源地'}
            ,{field: 'phone', title: '手机号'}
            ,{field: 'stuDate', title: '出生日期'}
            ,{field: 'stuCollege', title: '所在学院'}
            ,{field: 'stuMajor', title: '专业'}
            ,{field: 'aClass', title: '班级',templet:'<span>{{d.aClass.className}}</span>'}
            ,{fixed: 'right', title:'操作', toolbar: '#barStu', width:150}
        ]]

    });


    /*获取所有班级信息，渲染班级下拉框*/
    function getClassList(obj) {
        $.ajax({
            url: '/getClassList',
            type: 'POST',
            dataype: 'json',
            success: function (result) {
                $('#aClass').html("<option value=''>请选择</option>");
                $.each(result,function(index,item){
                    if(obj.hasOwnProperty('data')){
                        if(item.classId!=obj.data.aClass.classId){
                            $('#aClass').append("<option value='"+item.classId+"'>"+item.className+"</option>");//往下拉菜单里添加元素
                        }else{
                            $('#aClass').append("<option value='"+item.classId+"' selected>"+item.className+"</option>");//往下拉菜单里添加元素
                        }
                    }else {
                        $('#aClass').append("<option value='"+item.classId+"'>"+item.className+"</option>");//往下拉菜单里添加元素
                    }


                });
                form.render();//菜单渲染 把内容加载进去
            }
        });
    }

    //头工具栏事件
    table.on('toolbar(studentTable)', function(obj){
        console.log(obj);
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'addStu':
                $('#form_reset')[0].reset();
                $("#aClass").val("请选择");
                getClassList(obj);
                $('#stuId').attr("readonly",false);
                $('#college').css('display','block');
                $('#major').css('display','block');
                form.render();
                /*打开表单*/
                index = layer.open({
                    type:1
                    ,area:['400px', '520px']
                    ,content:$("#stuForm")
                });
                break;
            case 'reload'://刷新数据表格
                table.reload('stuTable', {
                    where: {
                        keyword: ""
                    }
                });
                break;
            //自定义头工具栏右侧图标 - 提示
            case 'LAYTABLE_TIPS':
                layer.alert('这是工具栏右侧自定义的一个图标按钮');
                break;
        }
    });


    //监听行工具事件
    table.on('tool(studentTable)', function(obj){//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data;//获得当前行数据
        if(obj.event === 'del'){//获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            layer.confirm('真的要删除该条信息吗？', function(index){
                layer.close(index);
                //向服务端发送删除指令；这里可以是发送ajax请求
                $.ajax({
                    url:'/stu_dorm_lib/stuDel',
                    data:"stuId="+data.stuId,
                    dataType:'JSON',
                    type:'post',
                    success:function (data) {
                        if (data.success){
                            obj.del();
                            layer.msg(data.msg);
                            /*table.reload('stuTable');*/
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
            });
        } else if(obj.event === 'edit'){
            /*调用函数： 数据回显*/
            getClassList(obj);
            $('#stuId').attr("readonly","readonly");
            $('#college').css('display','none');
            $('#major').css('display','none');
            EidtUv(data);
            index = layer.open({
                type:1
                ,area:['400px', '520px']
                ,content:$("#stuForm")
            });

        }
        function  EidtUv(data) {
            $("#stuId").val(data.stuId);
            $("#stuName").val(data.stuName);
            $("#stuSex").val(data.stuSex);
            $("#stuFrom").val(data.stuFrom);
            $("#phone").val(data.phone);
            $("#stuDate").val(data.stuDate);
            form.render('select');
        }




    });

    /*监听表单提交按钮*/
    form.on('submit(stuForm)',function (data) {
        var url = '';
        var tag = $("#stuId").attr("readonly");
        if(tag == 'readonly'){
            url = '/stu_dorm_lib/stuEdit';
        }else {
            url = '/stu_dorm_lib/stuAdd';
        }

        $.ajax({
            url:url,
            data:data.field,
            dataType:'JSON',
            type:'post',
            success:function (data) {
                if (data.success){
                    layer.close(index);
                    layer.msg(data.msg);
                    table.reload('stuTable');
                }else{
                    layer.msg(data.msg);
                }
            }
        });
        return false;
    });

    var active = {
        reload: function () {
            var demoReload = $('#demoReload');
            table.reload('stuTable', {
                page: {
                curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    keyword: demoReload.val()
                }
            });
        }
    };

    $('#searchBtn').on('click', function(){
        if($('#demoReload').val()==''){
            layer.msg("请输入学号");
            return;
        }
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

});