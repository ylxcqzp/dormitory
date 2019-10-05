layui.use(['element', 'table', 'form', 'laydate'], function () {
    var element = layui.element
        , table = layui.table
        , form = layui.form
        , laydate = layui.laydate
        , $ = layui.jquery;
    var FormIndex;
    /*数据表格初始化*/
    table.render({
        elem: '#managerTable'
        , title: '管理人员表'
        , height: 540
        , id: 'managerTable'
        , skin: 'line' //行边框风格
        , even: true //开启隔行背景
        , url: '/stu_dorm_lib/managerList'
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
            , {field: 'managerId', title: '管理员编号', fixed: 'left'}
            , {field: 'managerName', title: '姓名'}
            , {field: 'password', title: '密码'}
            , {field: 'phone', title: '手机号'}
            , {field: 'role', title: '所属角色', templet: '<span>{{d.role.roleName}}</span>'}
            , {fixed: 'right', title: '操作', toolbar: '#barManager', width: 150}
        ]]

    });

    /*监听行工具栏*/
    table.on('tool(managerTable)', function (obj) {

        /*获取当前行数据*/
        var data = obj.data;
        switch (obj.event) {
            case 'reset':
                layer.confirm("确定重置密码为12456", function (index) {
                    layer.close(index);
                    $.ajax({
                        url: '/stu_dorm_lib/managerPasReset',
                        data: "managerId=" + data.managerId,
                        dataType: 'JSON',
                        type: 'get',
                        success: function (data) {
                            console.log(data);
                            if (data.success) {
                                layer.msg(data.msg);
                                obj.update({
                                    password: '123456'
                                })
                            } else {
                                layer.msg(data.msg);
                            }
                        }
                    });
                });
                break;
            case 'delete':
                layer.confirm("确认删除该用户？", function (index) {
                    layer.close(index);
                    $.ajax({
                        url: '/stu_dorm_lib/managerDel',
                        data: {
                            managerId: data.managerId,
                            'role.roleId': data.role.roleId
                        },
                        dataType: 'JSON',
                        type: 'get',
                        success: function (data) {
                            if (data.success) {
                                layer.msg(data.msg);
                                obj.del();
                            } else {
                                layer.alert(data.msg);
                            }
                        }
                    });

                });
                break;
        }
    })



    /*获取所有角色信息，渲染角色下拉框*/
    function getRoleList() {
        $.ajax({
            url: '/getRoleList',
            type: 'POST',
            dataype: 'json',
            success: function (result) {
                $('#role').html("<option value=''>请选择</option>");
                $.each(result,function(index,item){
                    $('#role').append("<option value='"+item.roleId+"'>"+item.roleName+"</option>");//往下拉菜单里添加元素
                });
                form.render();//菜单渲染 把内容加载进去
            }
        });
    }
    /*头工具栏事件*/
    var active = {
        addManager: function () { //获取选中数据
            var checkStatus = table.checkStatus('repairTable')
                , data = checkStatus.data;
            /*刷新表单*/
            $('#form_reset')[0].reset();
            $("#role").val("请选择");
            $('#managerId').attr("readonly",false);
            $('#managerName').attr("readonly",false);
            $('#Mphone').css('display','block');
            getRoleList();
            form.render();

            /*打开表单*/
            FormIndex = layer.open({
                type:1
                ,area:['400px', '360px']
                ,content:$("#managerForm")
            });
        }
        , editRole: function () { //获取选中数目
            var checkStatus = table.checkStatus('managerTable')
                , data = checkStatus.data;
            if (data.length === 0) {
                layer.alert("请至少选择一条信息");
                return;
            }
            /*更新form*/
            $('#managerId').attr("readonly","readonly");
            $('#managerName').attr("readonly","readonly");
            $('#Mphone').css('display','none');
            /*获取下拉列表*/
            getRoleList();
            flushData(data);
            /*打开对话框*/
            FormIndex = layer.open({
                type:1
                ,area:['400px', '360px']
                ,content:$("#managerForm")
            });
        }

    };
    var mark;
    /*回显表单*/
    function flushData(data){
        mark = data[0].role.roleId;
        $("#managerId").val(data[0].managerId);
        $("#managerName").val(data[0].managerName);
        form.render('select');
    }

    $('#managerToolBar .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });



    /*监听表单提交按钮*/
    form.on('submit(managerForm)',function (data) {
        var url = '';
        var tag = $("#managerId").attr("readonly");
        if(tag == 'readonly'){
            if($('#role').val() == mark){
                alert("你未做出任何修改");
                return;
            }
            url = '/stu_dorm_lib/updateManagerRole';
        }else {
            url = '/stu_dorm_lib/managerAdd';
        }
        $.ajax({
            url:url,
            data:data.field,
            dataType:'JSON',
            type:'post',
            success:function (data) {
                if (data.success){
                    layer.close(FormIndex);
                    layer.msg(data.msg);
                    table.reload('managerTable');
                }else{
                    layer.msg(data.msg);
                }
            }
        });
        return false;
    });

});