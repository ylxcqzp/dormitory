layui.use('element', function(){
    var element = layui.element;
    var $ = layui.jquery;
    var active={
        tabAdd:function(url,id,name){
            element.tabAdd('contentnav',{
                title:name,
                content:'<iframe data-frameid="'+id+'" scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;"></iframe>',
                id:id
            });
            rightMenu();
            iframeWH();
        },
        tabChange:function(id){
            element.tabChange('contentnav',id);
        },
        tabDelete:function(id){
            element.tabDelete('contentnav',id);
        },
        tabDeleteAll:function(ids){
            $.each(ids,function(index,item){
                element.tabDelete('contentnav',item);
            });
        }
    };
    $(".site-url").on('click',function(){
        var nav=$(this);
        var length = $("ul.layui-tab-title li").length;
        if(length<=0){
            active.tabAdd(nav.attr("data-url"),nav.attr("data-id"),nav.attr("data-title"));
        }else{
            var isData=false;
            $.each($("ul.layui-tab-title li"),function(){
                if($(this).attr("lay-id")==nav.attr("data-id")){
                    isData=true;
                }
            });
            if(isData==false){
                active.tabAdd(nav.attr("data-url"),nav.attr("data-id"),nav.attr("data-title"));
            }
            active.tabChange(nav.attr("data-id"));
        }
    });
    function rightMenu(){
        //右击弹出
        $(".layui-tab-title li").on('contextmenu',function(e){
            var menu=$(".rightmenu");
            menu.find("li").attr('data-id',$(this).attr("lay-id"));
            l = e.clientX;
            t = e.clientY;
            menu.css({ left:l, top:t}).show();
            return false;
        });
        //左键点击隐藏
        $("body,.layui-tab-title li").click(function(){
            $(".rightmenu").hide();
        });
    }
    $(".rightmenu li").click(function(){
        if($(this).attr("data-type")=="closethis"){
            active.tabDelete($(this).attr("data-id"));
        }else if($(this).attr("data-type")=="closeall"){
            var tabtitle = $(".layui-tab-title li");
            var ids = new Array();
            tabtitle.each(function(i){
                ids.push($(this).attr("lay-id"));
            });
            //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
            active.tabDeleteAll(ids);
        }
        $('.rightmenu').hide(); //最后再隐藏右键菜单
    });
    function iframeWH(){
        var H = $(window).height()-80;
        $("iframe").css("height",H+"px");
    }
    $(window).resize(function(){
        iframeWH();
    });
});