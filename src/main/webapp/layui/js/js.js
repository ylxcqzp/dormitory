// JavaScript Document
$(function(){
	//鼠标经过/离开，播放/停止音乐
	$(".nav li").hover(function(){
		$(this).find(".musics").stop(true,true).show();
		},function(){
			$(this).find(".musics").stop(true,true).hide();
			})	
	/*--导航效果--*/
	//鼠标经过图片变彩色、变大  离开时回归原样
	$(".nav li img").hover(function(){
		$(this).removeClass("grayscale");
		$(this).stop(true,true).animate({
			left:"-10%",
			top:"-15%",
			width:"120%"
			})
		},function(){
			$(this).addClass("grayscale");
			$(this).stop(true,true).animate({
			left:"0",	
			top:"0",
			width:"100%"
			})
			})
	//鼠标经过 li 问题位置变化
	$(".nav li").hover(function(){
		$(this).find("strong").stop(true,true).animate({
			top:"80%"
			})
		},function(){
			$(this).find("strong").stop(true,true).animate({
			top:"10%"
			})
			})					
	})
$(function(){
	var headerHeight=$("header").height();
	$(".headerHeight").height(headerHeight);
	//客服代码
	$(".cc1").click(function(){
		$(this).fadeOut();
		$(".contactClick").fadeIn();
		$(".kefu").animate({
			left:"0",
			})
		})
	$(".contactClick").click(function(){
		$(this).fadeOut();
		$(".cc1").fadeIn();
		$(".kefu").animate({
			left:"-200%",
			})
		});
	//navLast
	$(".navLast a,.nav-News a").click(function(){

		})
	})
$(function(){
	//下拉导航
	$("nav li").hover(function(){
		$(this).children(".chilNav").stop(true,true).fadeIn();
		$(".navChilNavBg").stop(true,true).show();
		},function(){
			$(this).children(".chilNav").stop(true,true).hide();
			$(".navChilNavBg").stop(true,true).fadeOut();
			})
	//.closeNew关闭新闻
	/*$(".closeNew").click(function(){
		$(this).parents("li").fadeOut();
		})*/	
	var bodyWidth=$("body").width();
	if(bodyWidth<800){
		$("nav li:eq(0) a:first").attr("href","javascript:void(0)");
		$("nav li:eq(1) a:first").attr("href","javascript:void(0)");
		$("nav li:eq(2) a:first").attr("href","javascript:void(0)");
		$("nav li:eq(3) a:first").attr("href","javascript:void(0)");
		$("nav li:eq(4) a:first").attr("href","javascript:void(0)");
		
		}		
	})	
	
//图片左右滚动
$(document).ready(function() {
	  var blw=$("#myscrollbox li").width();
	  //获取单个子元素所需宽度
	  var liArr = $("#myscrollbox ul").children("li");
	  //获取子元素数量
	  var mysw = $("#myscroll").width();
	  //获取子元素所在区域宽度
	  var mus = parseInt(mysw/blw);
	  //计算出需要显示的子元素的数量
	  var length = liArr.length-mus;
	  //计算子元素可移动次数（被隐藏的子元素数量）
	  var i=0
	  $("#right").click(function(){
		  i++
		  //点击i加1
		  if(i<length){
		      $("#myscrollbox").css("left",-(blw*i));
			  //子元素集合向左移动，距离为子元素的宽度乘以i。
		  }else{
			  i=length;
			  $("#myscrollbox").css("left",-(blw*length));
			  //超出可移动范围后点击不再移动。最后几个隐藏的元素显示时i数值固定位已经移走的子元素数量。
	      }
      });
	  $("#left").click(function(){
		  i--
		  //点击i减1
		  if(i>=0){
		     $("#myscrollbox").css("left",-(blw*i));
			 //子元素集合向右移动，距离为子元素的宽度乘以i。
		  }else{
			 i=0;
			 $("#myscrollbox").css("left",0);
			 //超出可移动范围后点击不再移动。最前几个子元素被显示时i为0。
	      }
      });
	  $("#right").click();
		    setInterval(function()
			  {
		        $("#right").click();
		      } ,3000) 
});
	