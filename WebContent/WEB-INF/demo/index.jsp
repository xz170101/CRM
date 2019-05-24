<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head id="Head1">
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="x-ua-compatible" content="ie=edge">

 
<title>CRM</title>

 
<meta name="KEYWords" contect="VIEWUI,VIEW_UI_EASYUI,EasyUI,后台管理系统,酷设网">
<meta name="description" contect="viewUI基于EasyUI定制的主题皮肤">
<meta name="author" contect="djcbpl@163.com">
<meta property="og:title" content="EasyUI">
<meta property="og:description" content="HTML, CSS, JS">
 
<!-- Meta -->
<link rel="Bookmark" href="js/assets/default/images/logoIco.ico" />
<link rel="Shortcut Icon" href="js/assets/default/images/logoIco.ico" />
<link href="js/assets/css/reset.css" rel="stylesheet" type="text/css" />
<link href="js/assets/js/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="js/assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="js/assets/css/layout.css" rel="stylesheet" type="text/css" />
<script src="js/assets/js/jquery2.1.1.js" type="text/javascript"></script>
<script src="js/assets/js/jquery.easyui.min.js" type="text/javascript"></script>
<script src='js/assets/js/index2.js' type="text/javascript"></script>
<script src='js/assets/js/system.menu2.js' type="text/javascript"></script>
<script src='js/assets/js/jquery.form.js' type="text/javascript"></script>
<script type="text/javascript">
//yufangsession失效
<%-- 	  $(function(){
		var user="<%=session.getAttribute("user")%>";
		if(user==null){
			window.location.href="crm";	
		}
	});   --%>
	
	function qiandao() {
		$.ajax({
			url : "qiandao",
			type : "post",
			dataType : "json",
			data : {
				checkState : 1,
				checkInTime : 1
			},
			success : function(res) {
				if (res.success) {
					alert(res.message);
					//设置按钮为禁用
					location.reload();
					//$("#btn1").attr("disabled",true).css("pointer-events","none");  
				} else {
					alert(res.message);
				}
			}
		})
	}

	function qiantui() {
		$.ajax({
			url : "yuaneditCheck",
			type : "post",
			dataType : "json",
			data : {
				checkState : 0,
				checkOutTime : 1
			},
			success : function(res) {
				if (res.success) {
					alert(res.message);
					//设置按钮为禁用
					location.reload();
					//$("#btn3").attr("disabled", true).css("pointer-events","none");
				} else {
					alert(res.message);
				}
			}
		})
	}
</script>
 
<script type="text/javascript">
	$(function() {
		$('#uploadPicWin').window({title: '修改头像', width: 400, modal: true, shadow: true, closed: true, height: 250, resizable:false }); 
	})
	function editPic() {
	 	 $('#uploadPicWin').window("open"); 
	 }
	function closeEditPic() {
	 	 $('#p').form("clear"); 
	 	 $('#uploadPicWin').window("close"); 
	 }
	function change_photo(){
        PreviewImage($("input[name='myfiles']")[0], 'Img', 'Imgdiv');
    }
	 //焦点图片预览
	function PreviewImage(fileObj,imgPreviewId,divPreviewId) {
	        var allowExtention = ".jpg,.bmp,.gif,.jpeg,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;
	        var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
	        if (allowExtention.indexOf(extention) > -1) {
	            if (fileObj.files) {//HTML5实现预览，兼容chrome、火狐7+等
	                if (window.FileReader) {
	                    var reader = new FileReader();
	                    reader.onload = function (e) {
	                        var tempDivPreview=document.getElementById(divPreviewId);
	                        tempDivPreview.style.display="block";
	                        document.getElementById(imgPreviewId).setAttribute("src", e.target.result);
	                    }
	                    if(fileObj.files[0]) {
	                        reader.readAsDataURL(fileObj.files[0]);
	                    }
	                }
	            } else {
	                document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
	            }
	        } else {
	        	$.messager.alert("仅支持" + allowExtention + "为后缀名的文件!");
	            fileObj.value = "";//清空选中文件
	            fileObj.outerHTML = fileObj.outerHTML;
	        }
	}
	//上传图片
	 function uploadPic(){
		//alert($("#file").textbox('getValue'));
 		if($("#file").textbox('getValue')==""){
 			$.messager.alert("提示","请选择一张图片");
 			return false;
 		}
 		//提交form表单
		$("#p").ajaxSubmit({  
            type:"post",  //提交方式  
            url:"${pageContext.request.contextPath}/filesUpload", //请求url  
            success:function(data){ //提交成功的回调函数  
 					if(data>0){
 						closeEditPic();
 						window.location.href = "crmIndex";
 						$.messager.alert("提示","修改成功！");
 						
 					}
            }  
        });  
	}  
</script>

</head>
<body class="easyui-layout vui-easyui" scroll="no">
	<!-- 上传图片窗口 -->
	<div class="easyui-window updatePwd" data-options="collapsible:false,minimizable:false,maximizable:false" id="uploadPicWin"  title="修改头像">
	   旧头像： <img  src="img/${user.uexit2String }" />
	    <!-- accept:接收文件的范围 -->
	    <form  id="p" method="POST" enctype="multipart/form-data" accept="image/gif, image/jpeg,image/jpg, image/png"> 
	        <div style="width: 100%;height: 100%">
	        	<div style="text-align: center;margin-top: 20px">
	        	   选择头像: <input class="easyui-filebox"  name="myfiles" id="file" data-options='onChange:change_photo'/><br/> 
 	           	 </div>
 	           	  <div id="Imgdiv">
 	           	  	新头像：<img id="Img" width="200px" height="200px"/>
 	           	  </div>
	        </div>
	   </form> 
	   <div data-options="region:'south',border:false"  class="pwdbtn">
	   	 	 <a id="uploadPic" onclick="uploadPic()" class="easyui-linkbutton " href="javascript:;" >确定</a> 
	         <a id="closeEditPic" onclick="closeEditPic()" class="easyui-linkbutton btnDefault" href="javascript:;">关闭</a>
	    </div>
	</div>
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
	
	   <%--  <%
		     Integer state = (Integer) session.getAttribute("state");
					if (state == 1) {
					%>

					<a id="btn3" href="javascript:void" onclick="qiantui()"
						style="cursor: pointer">签退</a>

					<%
						} else if (state == 0) {
					%>
					<a id="btn1" href="javascript:void" onclick="qiandao()"
						style="cursor: pointer">签到</a>
					<%
						} else {
					%>
					<%
						}
					%>  --%>
	<style>
            img{
                border: #000 solid 2px;
                display: block;
                width:40px; 
                height:40px;
                border-radius: 50%;
                transition: all 2.0s;
            }
            img:hover{
                transform: rotate(720deg);
            }
     </style>
	<!-- 菜单横栏 -->
	<ul class="viewui-navmenu"></ul>
	<div class="viewui-user">
	
	     <%--  <%
		     Integer state = (Integer) session.getAttribute("state");
					if (state == 1) {
					%>

					<a id="btn3" href="javascript:void" onclick="qiantui()"
						style="cursor: pointer">签退</a>

					<%
						} else if (state == 0) {
					%>
					<a id="btn1" href="javascript:void" onclick="qiandao()"
						style="cursor: pointer">签到</a>
					<%
						} else {
					%>
					<%
						}
					%> --%>
        <div class="user-photo"> 
            <i class="fa"><img src="img/${userImg }" /></i>
        </div>
        
        <h4 class="user-name ellipsis" id="name">${user.loginName }</h4>
        <i class="fa fa-angle-down xiala"></i>
        <div class="viewui-userdrop-down">
            <ul class="user-opt">
             <li>
                 <a href="javascript:;" onclick="editPic()">
                    <i class="fa fa-user"></i>
                    <span class="opt-name" >修改头像</span>
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
			<!-- <a href="javascript:;" class="fa fa-caret-up"></a>
			<a href="javascript:;" class="fa fa-caret-down"></a> -->
		</div>
    </div>
</div>
<!-- // 头部 -->

<!-- 版权 -->
<div data-options="region:'south',split:false,border:false" class="copyright">
    <div class="footer">
        <span class="pull-left"> 新职170101版权所有 </a>  &copy; Copyright ©2019 ~ <font id="timeYear">2019</font> All Rights Reserved.</span>
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
      <label for="txtPass">原密码：</label>   
      <input class="easyui-validatebox txt01" id="txtPass" type="Password" name="Password" />   
    </div>  
    <div class="row"> 
      <label for="txtNewPass">新密码：</label>   
      <input class="easyui-validatebox txt01" id="txtNewPass" type="Password" name="Password" />   
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
<script type="text/javascript">
 
//绑定 div 的鼠标事件
$('.navmenu-item a').click(function(){
  $('.navmenu-item a').removeClass("active");//清空已经选择的元素
  $(this).addClass("active");
});
	//头部消息
    var marqueeContent= [];   //滚动主题
    marqueeContent[0]='<a href="javascript:;" class="notice-item ellipsis" target="_blank">欢迎使用crm管理平台</a>';
    marqueeContent[1]='<a href="javascript:;" class="notice-item ellipsis" target="_blank">本次项目</a>';
    marqueeContent[2]='<a href="javascript:;" class="notice-item ellipsis" target="_blank">由一个团队全体成员分工完成</a>';
  
 
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