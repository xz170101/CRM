<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CRML</title>
 <meta name="robots" cotent="all">
<meta name="author" content="djcbpl@163.com">
<meta name="Copyright" content="djcbpl@163.com">
<meta name="description" content="easyUI主题UI">
<meta name="keywords" content="">
<meta name="searchtitle" content="">  
	<link rel="Bookmark" href="js/assets/images/logoIco.ico" />
	<link rel="Shortcut Icon" href="js/assets/images/logoIco.ico" />
	<link type="text/css" rel="stylesheet" href="js/assets/default/login/css/login.css">
<!-- 	<script  type="text/javascript" src="js/assets/js/jquery2.1.1.js"></script>-->
 	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro/easyui.css">
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<link href="js/assets/css/reset.css" rel="stylesheet" type="text/css" />
	<link href="js/assets/css/layout.css" rel="stylesheet" type="text/css" />
<!--<script src='js/assets/js/index2.js' type="text/javascript"></script>  
	<script src='js/assets/js/system.menu2.js' type="text/javascript"></script>  -->
</head>
<script type="text/javascript">
 function changeCheckRembername() {
	alert("ssssss");
}
	//提交登陆表单
	function subLogin() {
		var login_name=($("#username").val()).trim();
		var login_pwd=$("#keyboards").val();
		var code=$("#verification").val().trim();
		 if(login_name !=null && login_name !=""){
			 if(login_pwd !=null && login_pwd !=""){
			 
			 $.post("login", {    
				 loginName:login_name,
				 passWord:login_pwd,
				 yzm:code
	         }, function(res){
	        	 if (res.success) {
	        		//$.messager.alert("提示！",res.message); 
	        		 
				     window.location.href = "crmIndex";
				    // $.post("crmIndex");
					} else {
						$.messager.alert("提示！",res.message);
					}
	     		},"json");
			 }else{
				 $.messager.alert("提示！","请输入密码");
			 }
		 }else{
     		$.messager.alert("提示！","请输入用户名");
     	}
	}
	$(function(){
		openNewUserWindow();
	//	$('#newUser').click(function(){$('#updatePwd').window('open');});
	})
	//注册
	 function openNewUserWindow() {
    	$('#newUser').window({title: '注册', width: 500, modal: true, shadow: true, closed: true, height: 300, resizable:false }); 
    } 
	//打开注册页面
 	 function openNewUser() {
		$('#newUser').window('open');
	 } 
	//关闭注册页面
 	 function closeWindow() {
 	    	$('#newUser').window('close');
 	}
	//提交注册信息
	 function subNewUser() {
	/* 6-16位数字或字母的正则：/^[a-z0-9]{6,12}$/
	Email地址：^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$*/
		 var name=$("#newusername").val().trim();
		 var pwd=$("#userpwd").val().trim();
		 var repwd=$("#reuserpwd").val().trim();
		 
		 var tel=$("#usertel").val().trim();
		 var email=$("#useremail").val().trim();
		$.post("newUser",{
				 loginName:name,
				 passWord :pwd,
				 protectMTel:tel,
				 protectEMail :email 
			 },function(res){
				 if(res>0){
					 $.messager.alert("提示！","注册成功！");
					 // msgShow('系统提示', '恭喜，注册成功！<br/>请登录', 'info');
					  closeWindow();
				 }
			 },'json') 
		}
	
</script>
<%
	Cookie [] c = request.getCookies();
	String name = "";
	String password = "";
	if(c!=null){
		for(int i = 0; i < c.length; i++){
			if(c[i].getName().equals("name")){
				name = c[i].getValue();
			}
			if(c[i].getName().equals("password")){
				password = c[i].getValue();
			}
		}
	}

%>
<body>

<!--头部start-->	
<div class="login-header">
	<div id="login-header-nav" class="nobogder"> 
		<div id="login-header-nav_ctx">
			<div class="l mt10px">
				<!-- <a href="javascript:;" class="logoicon">logo图标</a>
				<a href="javascript:;" class="logo_title">log名称</a> -->
				<a class="line"></a>
				<a href="javascript:;" class="e">logo副标题</a>
			</div>
		</div>
	</div>
</div>
<!--头部end-->
	
<form id="loginForm" name="loginForm"  action="" class="fm-v clearfix" method="post">
	<input type="hidden" name="lt">
	<input type="hidden" name="execution" value="e1s1">
	<input type="hidden" name="_eventId" value="submit">
    <input type="hidden" name="userType" value="0">
    <input id="rembername" name="rembername" type="hidden" class="fr" data-cacheval="false" value="false">
    
	<!--登录start-->	
	<div class="ordinaryLogin">
	  <div class="login_ad">
	   <div class="bg_ordLogin"><img src="js/assets/default/login/images/icon-banner.png" /></div>
	  <div class="loginCont_dk post05" style="right: -17px;">
	  <div class="loginCont">
	    <div class="login_th"><h4 class="lgCurr bd_r">用户登录</h4>
	    	<!-- <a href="javascript:void(0);" class="login_help" onclick="openNewUser()">注册新用户&gt;&gt;</a> -->
	    </div>
	    <div class="login_text">
			<!-- error start -->	 
			<div class="login-error">
				<label id="EEE" class="login_error_tips" style="display:none;"></label>
			</div>	
			<!-- end -->
			<div class="user_parent">
				<div class="login_input user_bg unm">
		        	<input name="username" id="username" tabindex="1"   type="text" class="usernameSty"   autocomplete="off">
		    	</div>
		  	</div>
		    <div class="user_paswd">
				<div class="login_input user_bg pwd" name="pwdParent" id="pwdParent">
			      	<div id="newPwd" class="keyboards-box">
				 		<input id="keyboards" value="" type="password" name="keyboards" tabindex="3" pa_ui_name="keyboard" pa_ui_keyboard_position="place" pa_ui_key_type="advance" class="styTextinput w162px" maxlength="20" >
				 	</div>
			  	</div> 
			</div>

 			<div class="user_code">
				<div class="login_input user_bg vnc">
		        	<input name="verification" id="verification" tabindex="1"   type="text" class="codeSty"   autocomplete="off">
		        	<!-- 图片验证码 -->
		        	<img class="" id="code" src="checkCode" alt="" width="100" height="25"   style="height:43px; cursor:pointer;" onclick="this.src=this.src+'?'">
		    	</div>
		  	</div> 
		  
			<div style="height:10px"></div>
	      	<div class="remeber_name"> 
				<!-- <input id="checked" type="checkbox" class="normal" onclick="changeCheckRembername();"> -->
				<b id="checked" class="normal" onclick="changeCheckRembername();"></b>
				<label id="login_save" style="float:left;">记住用户名</label>
				<div class="login-wjpw">
					<a class="blue" href="javascript:;">忘记用户名？</a>&nbsp;|&nbsp;&nbsp;
					<a href="javascript:;"><span class="blue">忘记密码？</span></a>
				</div>
			</div>
	    </div>
	    <div class="login_ck">
			<input name="submitBtn" id="submitBtn" type="button" onclick="subLogin()" tabindex="5" class="login_btn" value="登录">
	    </div>
	    <div style="height:24px"></div>
		 
	  </div>
	  </div>
	  <div class="filter box_shadow"></div>
	  <!--用户名密码出错弹出层start-->
	  <div class="login_error_w" style="top:152px; ">
		  <div class="login_error">
		    <div class="login_error_th"><h4>用户名或密码错误</h4></div>
		  </div>
	  </div>
	  <!--用户名密码出错弹出层end-->
	 
	  </div>
	</div>
	<!--登录end-->	
</form>
<!--底部start-->	
<div style="clear:both"></div>
<!--底部end-->
<script type="text/javascript">
	function vnewusername() {
		var name=$("#newusername").val().trim();
		if(name!=''){
			$.ajax({
				url:"selectUserByName",
				method:'post',
				data:{"loginName":name},
				dataType:'json',
				success:function(data){
					if(data>0){
						document.getElementById('yznewusername').innerHTML = '用户名已存在！';
						document.getElementById('yznewusername').style.color = 'yellow';
					}else
						document.getElementById('yznewusername').innerHTML = 'ok！';
						document.getElementById('yznewusername').style.color = 'green';
					}
				});
			}else{
				return vNull('newusername');
			}
		
	}
	function vuserpwd() {
		return vRegexp('userpwd',/^[a-z0-9]{6,12}$/);
	}
	function vreuserpwd() {
		return vRegexp('reuserpwd',/^[a-z0-9]{6,12}$/);
	}
	function vusertel() {
		return vRegexp('usertel',/^1[34578]\d{9}$/);
	}
	function vuseremail() {
		return vRegexp('useremail',/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/);
	}
	//验证不为空
	function  vNull(name) {
		 var elem = document.getElementById(name);
		 var msg = document.getElementById('yz'+name);
		 if (elem.value == '' || elem.value == ' ') {
		    msg.innerHTML = '* 您的输入不能为空';
		    msg.style.color = 'red';
		    return false;
		  } else {
		    msg.innerHTML = 'ok';
		    msg.style.color = 'green';
		    return true;
		  }
	}
	//验证Regexp
	function vRegexp(name,regexp) {
		var elem = document.getElementById(name);
		var msg = document.getElementById('yz'+name)
		if (regexp.test(elem.value)) {
		    msg.innerHTML = 'ok';
		    msg.style.color = 'green';
		    return true;
		  } else {
		    msg.innerHTML = '您的输入不合法';
		    msg.style.color = 'red';
		    return false;
		  }
	}
</script>
<!--用户注册窗口-->
<div data-options="collapsible:false,minimizable:false,maximizable:false" id="newUser" class="easyui-window updatePwd" title="用户注册">
    <div class="row"> 
      <label for="txtNewPass">用户名：</label>   
      <input onblur="vnewusername()" class="easyui-validatebox txt01" id="newusername" type="text" name="username" />
      <span id="yznewusername"></span>   
    </div>   
    <div class="row">   
      <label for="txtRePass">密码:</label>   
      <input onblur="vuserpwd()" class="easyui-validatebox txt01" id="userpwd" type="Password" name="userpwd" />
      <span id="yzuserpwd">由6-12位数字或字母组成</span>
    </div>
     <div class="row">   
      <label for="txtRePass">确认密码:</label>   
      <input onblur="vreuserpwd()" class="easyui-validatebox txt01" id="reuserpwd" type="Password" name="reuserpwd" />
      <span id="yzreuserpwd"></span>
    </div>
     <div class="row">   
      <label for="txtRePass">手机号:</label>   
      <input onblur="vusertel()" class="easyui-validatebox txt01" id="usertel" type="text" name="usertel" />
      <span id="yzusertel"></span>
    </div>
     <div class="row">   
      <label for="txtRePass">邮箱:</label>   
      <input onblur="vuseremail()" class="easyui-validatebox txt01" id="useremail" type="text" name="useremail" />
      <span id="yzuseremail"></span>
    </div>
    
    <div data-options="region:'south',border:false" class="pwdbtn">
        <a id="btnEp" class="easyui-linkbutton " onclick="subNewUser()" href="javascript:void(0);" >注册</a> 
        <a id="btnCancel" class="easyui-linkbutton btnDefault" onclick="closeWindow()" href="javascript:void(0);">取消</a>
    </div>
</div>

<script type="text/javascript">
	 
	//处理记住用户名
	function changeCheckRembername() {
		var rembername = document.getElementById("rembername").value;
		if(rembername == 'true') {//选中，置为不选中
			document.getElementById("rembername").value = 'false';
			$('#checked').attr("class","normal");
		}else {
			document.getElementById("rembername").value = 'true';
			$('#checked').attr("class","checked");
		}
	}

	
	
  
    
</script>
</body>
</html>