layui.use(['element','table','form','laydate'],function () {
    var element = layui.element
        ,table = layui.table
        ,form = layui.form
        ,laydate = layui.laydate
        ,$ = layui.jquery;
    /*数据表格初始化*/
    table.render({
        elem:'#repairTable'
        ,title:'报修信息表'
        ,height:540
        ,id:'repairTable'
        ,skin: 'line' //行边框风格
        ,even: true //开启隔行背景
        ,url:'repairedInfo'
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
            ,{field: 'repairsId', title: '维修编号', fixed: 'left'}
            ,{field: 'drom', title: '宿舍楼',templet:'<span>{{d.drom.dromId}}</span>'}
            ,{field: 'room', title: '宿舍号',templet:'<span>{{d.room.roomId}}</span>'}
            ,{field: 'detail', title: '问题描述'}
            ,{field: 'gettime', title: '提交时间'}
            ,{field: 'fixtime', title: '解决时间',templet:function (d) {
                    if(d.fixtime){
                        return "<span style='color: #32a1ff;'>"+d.fixtime+"</span>";
                    }else
                        return "<span style='color:red;'>暂无</span>";
                }}
            ,{field: 'isfixed', title: '状态',templet:function (d) {
                    if(d.isfixed){
                        return "<span style='color: #79b0ff'>已修</span>";
                    }else
                        return "<span style='color:red;'>待修</span>";
                }}
        ]]

    });


    var active = {
        delete: function(){ //获取选中数据
            var checkStatus = table.checkStatus('repairTable')
                ,data = checkStatus.data;
            /*判断是否有选中数据*/
            if(data.length===0){
                layer.alert("请至少选择一条信息");
                return;
            }
            /*请求删除数据*/
            $.ajax({
                url:'/deleteRepaired',
                data:"repairsId="+data[0].repairsId,
                dataType:'JSON',
                type:'get',
                success:function (data) {
                    if (data.success){
                        layer.msg(data.msg);
                        table.reload('repairTable');
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }
        ,statusChange: function(){ //获取选中数目
            var checkStatus = table.checkStatus('repairTable')
                ,data = checkStatus.data;
            if(data.length===0){
                layer.alert("请至少选择一条信息");
                return;
            }
            if(data[0].isfixed){
                layer.alert("不能将状态修改为未修");
                return;
            }
            $.ajax({
                url:'/updateRepairStatus',
                data:{
                    repairsId:data[0].repairsId,
                    isfixed:data[0].isfixed
                    },
                dataType:'JSON',
                type:'get',
                success:function (data) {
                    if (data.success){
                        layer.msg(data.msg);
                        table.reload('repairTable');
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });


        }

    };

    $('#repaireToolBar .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

});