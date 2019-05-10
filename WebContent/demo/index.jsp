<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head id="Head1">
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>VIEW_UI_EASYUI</title>
<meta name="KEYWords" contect="VIEWUI,VIEW_UI_EASYUI,EasyUI,后台管理系统,酷设网">
<meta name="description" contect="viewUI基于EasyUI定制的主题皮肤">
<meta name="author" contect="djcbpl@163.com">
<meta property="og:title" content="EasyUI">
<meta property="og:description" content="HTML, CSS, JS">

<!-- Meta -->

<link rel="Bookmark" href="../js/assets/default/images/logoIco.ico" />
<link rel="Shortcut Icon" href="../js/assets/default/images/logoIco.ico" />
<link href="../js/assets/css/reset.css" rel="stylesheet" type="text/css" />
<link href="../js/assets/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="../js/assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="../js/assets/css/layout.css" rel="stylesheet" type="text/css" />


</head>
<body class="easyui-layout vui-easyui" scroll="no">
<noscript>
    <div class="bowerPrompt" class="bowerPrompt">
        <img src="assets/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
    </div>
</noscript>
<!-- 头部 -->
<div data-options="region:'north',split:false,border:false,border:false" class="viewui-navheader">
	<!-- header start -->
	<!--头部logo-->
	<div class="sys-logo">
		<a href="javascript:;" class="logoicon">logo图标</a>
		<a href="javascript:;" class="logo_title">logo名称</a>
		<a class="line"></a>
		<a href="javascript:;" class="e">logo副标题</a>
	</div>
	<!-- 菜单横栏 -->
	<ul class="viewui-navmenu"></ul>
	<div class="viewui-user">
        <div class="user-photo">
            <i class="fa fa-user-circle-o"></i>
        </div>
        <h4 class="user-name ellipsis">Admin</h4>
        <i class="fa fa-angle-down xiala"></i>

        <div class="viewui-userdrop-down">
            <ul class="user-opt">
              <li>
                <a href="javascript:;">
                    <i class="fa fa-user"></i>
                    <span class="opt-name">用户信息</span>
                </a>
              </li>
              <li class="modify-pwd">
                    <a href="javascript:;" id="editpass">
                        <i class="fa fa-edit"></i>
                        <span class="opt-name">修改密码</span>
                    </a>
              </li>
              <li class="logout">
                    <a href="javascript:;" id="loginOut">
                        <i class="fa fa-power-off"></i>
                        <span class="opt-name">退出</span>
                    </a>
              </li>
            </ul>
        </div>
    </div>
    <div class="viewui-notice">
		<i class="fa fa-volume-up"></i>
		<div class="notice-box ellipsis" onmouseout="marqueeInterval[0]=setInterval('startMarquee()',marqueeDelay)" onmouseover="clearInterval(marqueeInterval[0])">
		</div>
		<div class="notice-opt">
			<a href="javascript:;" class="fa fa-caret-up"></a>
			<a href="javascript:;" class="fa fa-caret-down"></a>
		</div>
    </div>
</div>
<!-- // 头部 -->

<!-- 版权 -->
<div data-options="region:'south',split:false,border:false" class="copyright">
    <div class="footer">
        <span class="pull-left"> 新职170101版权所有 </a>  &copy; Copyright ©2019 ~ <font id="timeYear">2019</font>. View UI. All Rights Reserved.</span>
        <span class="pull-right">
            <a href="javascript:;"><i class="fa fa-download"></i> 下载管理</a>
            <a href="javascript:;"><i class="fa fa-volume-up"></i> 消息</a>
        </span>
    </div>
</div>
<!-- // 版权 -->
<!-- 左侧菜单 -->
<div data-options="region:'west',hide:true,split:false,border:false" title="导航菜单" class="LeftMenu" id="west">
    <div id="nav" class="easyui-accordion" data-options="fit:true,border:false"></div>
</div>
<!-- // 左侧菜单 -->

<!-- home -->
<div data-options="region:'center'" id="mainPanle" class="home-panel">
	<div id="layout_center_plan" class="easyui-panel"  data-options="fit:true,style:'{overflow:hidden}',closed:false,closable:true,
	tools:[{
				iconCls:'refresh-panel fa fa-refresh ',
				handler:function(){firstrefresh()}
			}]"
	 style="overflow:hidden">
	</div>

</div>
<!-- // home -->

<!--修改密码窗口-->
<div data-options="collapsible:false,minimizable:false,maximizable:false" id="updatePwd" class="easyui-window updatePwd" title="修改密码">
    <div class="row"> 
      <label for="txtNewPass">新密码：</label>   
      <input class="easyui-validatebox txt01" id="txtNewPass" type="Password" name="name" />   
    </div>   
    <div class="row">   
      <label for="txtRePass">确认密码:</label>   
      <input class="easyui-validatebox txt01" id="txtRePass" type="Password" name="Password" />
    </div>
    <div data-options="region:'south',border:false" class="pwdbtn">
        <a id="btnEp" class="easyui-linkbutton " href="javascript:;" >确定</a> 
        <a id="btnCancel" class="easyui-linkbutton btnDefault" href="javascript:;">取消</a>
    </div>
</div>


<script src="../js/assets/js/jquery2.1.1.js" type="text/javascript"></script>
<script src="../js/assets/js/jquery.easyui.min.js" type="text/javascript"></script>
<script src='../js/assets/js/index2.js' type="text/javascript"></script>
<script src='../js/assets/js/system.menu2.js' type="text/javascript"></script>
<script type="text/javascript">


//绑定 div 的鼠标事件
$('.navmenu-item a').click(function(){
  $('.navmenu-item a').removeClass("active");//清空已经选择的元素
  $(this).addClass("active");
});
	//头部消息
    var marqueeContent= [];   //滚动主题
    marqueeContent[0]='<a href="javascript:;" class="notice-item ellipsis" target="_blank">crm管理平台</a>';
    marqueeContent[1]='<a href="javascript:;" class="notice-item ellipsis" target="_blank">由第一组全体成员分工完成</a>';
    marqueeContent[2]='<a href="javascript:;" class="notice-item ellipsis" target="_blank">欢迎使用</a>';
  
 
    var marqueeInterval=[];  //定义一些常用而且要经常用到的变量
    var marqueeId=0;
    var marqueeDelay=4000;
    var marqueeHeight=20;
    function initMarquee() {
     var str=marqueeContent[0];
     $('.notice-box').html('<div>'+str+'</div>');
     marqueeBox = $('.notice-box')[0];
     marqueeId++;
     marqueeInterval[0]=setInterval(startMarquee,marqueeDelay);
     }
    function startMarquee() {
     var str=marqueeContent[marqueeId];
      marqueeId++;
     if(marqueeId>=marqueeContent.length) marqueeId=0;
     if(marqueeBox.childNodes.length==1) {
      var nextLine=document.createElement('DIV');
      nextLine.innerHTML=str;
      marqueeBox.appendChild(nextLine);
      }
     else {
      marqueeBox.childNodes[0].innerHTML=str;
      marqueeBox.appendChild(marqueeBox.childNodes[0]);
      marqueeBox.scrollTop=0;
      }
     clearInterval(marqueeInterval[1]);
     marqueeInterval[1]=setInterval(scrollMarquee,10);
     }
    function scrollMarquee() {
     marqueeBox.scrollTop++;
     if(marqueeBox.scrollTop%marqueeHeight==marqueeHeight){
      clearInterval(marqueeInterval[1]);
      }
     }
    initMarquee();

</script>
</body>
</html>