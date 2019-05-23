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
		
	  $(function() {
		//复选框对勾
		if(getCookie('loginName')!=null && getCookie('loginName')!="" ){
			document.getElementById("rembername").value = 'true';
			$('#checked').attr("class","checked");
			}
		});  
		 
	  //遍历获取cookie中的值
	  function getCookie(name){
		  var strcookie = document.cookie;//获取cookie字符串
		  var arrcookie = strcookie.split(";");//分割
		  //遍历匹配
		  for ( var i = 0; i < arrcookie.length; i++) {
			  var arr = arrcookie[i].split("=");
			  if (arr[0] == name){
			  	return arr[1];
				  }
		  }
		 return "";
	 }
	   
	//提交登陆表单
	function subLogin() {
		var yes='';
 		var rembername = $("#rembername").val();
		if(rembername=='true'){
			yes='yes';
		};
		var login_name=($("#username").val()).trim();
		var login_pwd=$("#keyboards").val();
		var code=$("#verification").val().trim();
		 if(login_name !=null && login_name !=""){
			 if(/^[a-z0-9]{6,12}$/.test(login_pwd) ){
				 if(code !=null && code !=""){
					 $.post("login", {    
						 loginName:login_name,
						 passWord:login_pwd,
						 yzm:code,
						 yes:yes
			         }, function(res){
			        	 if (res.success) {
						     window.location.href = "crmIndex";
							} else {
								$.messager.alert("提示！",res.message);
							}
			     		},"json");
					 }else{
						 $.messager.alert("提示","请输入四位验证码！");
					 }
				 }else{
		     		$.messager.alert("提示","密码必须为6~12位之间的数字或字母！");
		     	}
			 }else{
				 $.messager.alert("提示","请输入用户名！");
     	}
	}
	//处理记住用户名
	function changeCheckRembername() {
		var rembername = document.getElementById("rembername").value;
		if(rembername == 'true') {//选中，置为不选中
			document.getElementById("rembername").value = 'false';
			$('#checked').attr("class","normal");
			return "yes";
		}else {
			document.getElementById("rembername").value = 'true';
			$('#checked').attr("class","checked");
			return "no";
		}
	}
	//被挤掉的提示
	function checkForm(){
	     var flag=true;
	     var message=$("#messageXX").val();
	     if(message!=null && message!=""){
	      alert(message);
	      flag=false;
	     }
	     return flag;
	    }
</script>
<body>
<!--头部start-->	
<div class="login-header">
	<div id="login-header-nav" class="nobogder"> 
		<div id="login-header-nav_ctx">
			<div class="l mt10px">
				<!-- <a href="javascript:;" class="logoicon">logo图标</a>
				<a href="javascript:;" class="logo_title">log名称</a> -->
				<a class="line"> 
				<input type="hidden" id="messageXX" onload="checkForm()" name="messageXX" value="<%=request.getAttribute("messageXX") %>">
				</a>
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
		        	<input name="username" id="username" value="${cookie.loginName.value }" tabindex="1"   type="text" class="usernameSty"   autocomplete="off">
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
				<b id="checked" class="normal" onclick="changeCheckRembername();" ></b>
				<label id="login_save" style="float:left;">记住用户名</label>
				<div class="login-wjpw">
					<a class="blue" href="javascript:;">忘记用户名？</a>&nbsp;|&nbsp;&nbsp;
					<a href="javascript:void(0);" onclick="fintPwd()"><span class="blue">忘记密码？</span></a>
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
<!--zhaohui密码窗口-->
<div data-options="collapsible:false,minimizable:false,maximizable:false" id="findPwd" class="easyui-window updatePwd" title="找回密码">
    <div class="row"> 
      <label for="txtPass">用户名：</label>   
      <input onblur="vusername()" class="easyui-validatebox txt01" id="fUserName" type="text" name="fUserName" />
      <span id="yzfUserName"> </span>
    </div>  
    <div class="row"> 
      <label for="txtNewPass">手机号：</label>   
      <input onblur="vphone()" class="easyui-validatebox txt01" id="fphone" type="text" name="fphone" /> 
      <span id="yzfphone"> </span>  
    </div>   
    <div class="row"> 
      <label for="txtNewPass">验证码：</label>   
      <input class="easyui-validatebox txt01" id="fphoneCode" type="text" name="fphoneCode" /> 
      <a id="sendPhoneCode" class="easyui-linkbutton " href="javascript:void(0);" >点击发送验证码</a>  
    </div>   
    <div data-options="region:'south',border:false" class="pwdbtn">
        <a id="btnEp" class="easyui-linkbutton " href="javascript:;" >确定</a> 
        <a id="btnCancel" class="easyui-linkbutton btnDefault" href="javascript:;">取消</a>
    </div>
</div>
<!--底部start-->	
<div style="clear:both"></div>
<div class="footBorder_t01">
	<div class="ce_about_foot">
		<p class="ce_about_copyright">
			<a href="javascript:void(0);">一个团队提供技术支持</a>
			<span class="">|</span>
			<span class="" style="">一个团队®版权所有&nbsp;</span>
 			<span class="">|</span>
			<a href="javascript:void(0);">联系邮箱：dyz@163.com</a>
		</p>
		<!-- <span class="esc"><img src="assets/login/images/logo-1sc.png" /></span> -->
		
		<span class="">备案/许可证编号：豫ICP备19014690号-1</span>
	</div>
</div>
<!--底部end-->
 <script type="text/javascript">
 //忘记密码【 a:先判断用户名是否存在 b：点击发送验证码判断手机号格式以及是否为该用户的手机号c:若为true就可以发送验证码】
	$(function(){
		 $('#findPwd').window({title: '找回密码', width: 400, modal: true, shadow: true, closed: true, height: 250, resizable:false }); 
		// $('#btnEp').click(function(){findPassWord();});
	});
	 function fintPwd() {
	 	 $('#findPwd').window("open"); 
	 }
	$("#btnCancel").click(function() {
		$('#findPwd').window("close"); 
	});
	var uId=0;
	function vusername() {
		var name=$("#fUserName").val().trim();
		if(name!=null && name != ''){
			$.ajax({
				url:"selectUserByName",
				method:'post',
				data:{"loginName":name},
				dataType:'json',
				success:function(data){
						if(data>0){
							uId=data;
 							return true;
						}else{
							$("#yzfUserName").html('用户名不存在！');
 							document.getElementById('yzfUserName').style.color = 'red';
							return false;
						}
					}
				});
		}else{
			$("#yzfUserName").html('用户名不能为空！');
 			document.getElementById('yzfUserName').style.color = 'red';
			return false;
		} 
	}
	function vphone() {
		var phone=$("#fphone").val().trim();
		if(phone ==null || phone ==''){
			$("#yzfphone").html('手机号码不能为空');
			 document.getElementById('yzfphone').style.color = 'red';
			return false;
		}else if(!(/^1[34578]\d{9}$/.test(phone))){
			$("#yzfphone").html('手机号格式错误');
			 document.getElementById('yzfphone').style.color = 'red';
			return false;
		}else{
			$("#yzfphone").html(' ');
			$.ajax({
				url:"selectUserByTel",
				method:'post',
				data:{"protectMTel":phone},
				dataType:'json',
				success:function(data){
					 	if(data==uId){
					 		//alert("手机号查到的id:"+data)
							return true;
						}else{
							$("#yzfphone").html('手机号不匹配');
							document.getElementById('yzfphone').style.color = 'red';
							return false;
						}   
					}
				});
		}
	}
	var phoneCode=0;
	//发送验证码
	$("#sendPhoneCode").click(function(){
		var phone=$("#fphone").val().trim();
		$.ajax({
			url:"sendToPhoneCode",
			method:'post',
			data:{"protectMTel":phone},
			dataType:'json',
			success:function(data){
				//alert(data);
				  phoneCode=data;
				}
			});
	});	
	//进行重置密码
	$("#btnEp").click(function(){
		var name=$("#fUserName").val();
		var phone=$("#fphone").val();
		var phoneCode=$("#fphoneCode").val();
		//alert(phoneCode==phoneCode);
		/* 
		if(vusername()){
			if(vphone()){*/
				if(phoneCode==phoneCode){
				$.post("resetPassword", {    
						 loginName:name
 		       		 }, function(res){
		       			 if(res>0){
		       				$('#findPwd').window("close"); 
		       				$.messager.alert("提示","密码已重置,请登录！");
		       			 }
		    	 },"json");
				}else{
				$.messager.alert("提示","验证码不正确！");
			}
			/*}else{
				$.messager.alert("提示","手机号格式不正确！");
			}
		}else{
			 $.messager.alert("提示","请输入用户名！");
		} */
	})  
 </script>
</body>
</html>