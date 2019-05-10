<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Login</title>
<meta name="robots" cotent="all">
<meta name="author" content="djcbpl@163.com">
<meta name="Copyright" content="djcbpl@163.com">
<meta name="description" content="easyUI主题UI">
<meta name="keywords" content="">
<meta name="searchtitle" content="">
<link rel="Bookmark" href="js/assets/images/logoIco.ico" />
<link rel="Shortcut Icon" href="js/assets/images/logoIco.ico" />
<link type="text/css" rel="stylesheet" href="js/assets/default/login/css/login.css">
</head>
<body>

<!--头部start-->	
<div class="login-header">
	<div id="login-header-nav" class="nobogder"> 
		<div id="login-header-nav_ctx">
			<div class="l mt10px">
				<a href="javascript:;" class="logoicon">logo图标</a>
				<a href="javascript:;" class="logo_title">log名称</a>
				<a class="line"></a>
				<a href="javascript:;" class="e">logo副标题</a>
			</div>
			<div class="reg_topLink">
				<div class="about-us">
					<span class="home"></span>
					<a href="javascript:;" onclick="SetHome(window.location)">设为首页</a>
					<span class="collection"></span>
					<a href="javascript:;"  onclick="AddFavorite(window.location,document.title)">加入收藏</a>
					<span class="about"></span>
					<a href="javascript:;">联系我们</a>
				</div>
				<div class="iphone">
					客户热线<span> 13838639591</span>
				</div>
				<div class="iphone">
					QQ/微信<span> 931989338</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!--头部end-->
	
<form id="loginForm" name="loginForm"  action="demo/index.jsp" class="fm-v clearfix" method="post">
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
	    	<a href="javascript:;" class="login_help">登录帮助&gt;</a>
	    </div>
	    <div class="login_text">
			<!-- error start -->	 
			<div class="login-error">
				<label id="EEE" class="login_error_tips" style="display:none;"></label>
			</div>	
			<!-- end -->
			<div class="user_parent">
				<div class="login_input user_bg unm">
		        	<input name="username" id="username" tabindex="1" value="邮箱／手机号" type="text" class="usernameSty" onblur="if(this.value==&#39;&#39;) {this.value=&#39;邮箱／手机号&#39;;this.style.color=&#39;#999&#39;}" onfocus="if(this.value==&#39;邮箱／手机号&#39;) this.value=&#39;&#39;;this.style.color=&#39;#222&#39;" autocomplete="off">
		    	</div>
		  	</div>

		    <div class="user_paswd">
				<div class="login_input user_bg pwd" name="pwdParent" id="pwdParent">
			      	<div id="newPwd" class="keyboards-box">
				 		<input id="keyboards" value="" type="password" name="keyboards" tabindex="3" pa_ui_name="keyboard" pa_ui_keyboard_position="place" pa_ui_key_type="advance" class="styTextinput w162px" maxlength="20">
				 	</div>
			  	</div> 
			</div>

			<div class="user_code">
				<div class="login_input user_bg vnc">
		        	<input name="verification" id="verification" tabindex="1" value="验证码" type="text" class="usernameSty" onblur="if(this.value==&#39;&#39;) {this.value=&#39;验证码&#39;;this.style.color=&#39;#999&#39;}" onfocus="if(this.value==&#39;验证码&#39;) this.value=&#39;&#39;;this.style.color=&#39;#222&#39;" autocomplete="off">
		        	<div id="v_container" class="codeimg"></div>
		    	</div>
		  	</div>
		
			<div style="height:10px"></div>
	      	<div class="remeber_name"> 
				<b id="checked" class="normal" onclick="changeCheckRembername();"></b>
				<label id="login_save" style="float: left;">记住用户名</label>
				<div class="login-wjpw">
					<a class="blue" href="javascript:;">忘记用户名？</a>&nbsp;|&nbsp;&nbsp;
					<a href="javascript:;"><span class="blue">忘记密码？</span></a>
				</div>
			</div>
	    </div>
	    <div class="login_ck">
			<input name="submitBtn" id="submitBtn" type="submit" tabindex="5" class="login_btn" value="登录">
	    </div>
	    <div style="height:24px"></div>
		
		
		<div class="login_ceLink">
			<p>
				<span>选择联合登录:</span>
				<a href="javascript:;">QQ,微信</a>
				<a href="javascript:;" id="other-login">其他联合登录</a>
				<i class="i-ar2"></i>
			</p>
			<div class="login_list" id="login_list" >
		   		<em>
	       			<i class="i-xline" style="border-right:1px solid #ddd;">
	       				<a href="javascript:;">百度</a>
						<a href="javascript:;">腾讯</a>
	       			</i>
	       			<i class="i-xline">
	       				<a href="javascript:;">支付宝</a>
						<a href="javascript:;">CSDN</a>
	       			</i>
				</em>
			</div>
	    </div>
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
	  <!--验证码出错弹出层start-->
	  <div class="login_error_w" style="top:232px;">
		  <div class="login_error">
		    <div class="login_error_th"><h4>验证码错误</h4></div>
		  </div>
	  </div>
	  <!--验证码出错弹出层end-->
	  </div>
	</div>
	<!--登录end-->	
</form>
<!--底部start-->	
<div style="clear:both"></div>
<div class="footBorder_t01">
	<div class="ce_about_foot">
		<p class="ce_about_copyright">
			<a href="javascript:;">酷设设计提供技术支持</a>
			<span class="">|</span>
			<a href="https://shop155629335.taobao.com/?spm=a230r.7195193.1997079397.2.diL9ud">商城购买</a>
			<span class="">|</span>
			<a href="javascript:;">联系邮箱：13838639591@163.com</a>
		</p>
		<!-- <span class="esc"><img src="assets/login/images/logo-1sc.png" /></span> -->
		<span class="" style="">酷设网版权所有 Cool.&nbsp;</span>
		<span class="">备案/许可证编号：黔ICP备17003161号-1</span>
	</div>
</div>
<!--底部end-->


<script src="js/assets/js/jquery2.1.1.js" type="text/javascript"></script>
<!-- <script src="js/assets/login/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/assets/login/js/pa_ui.js" type="text/javascript"></script>
<script src="js/assets/login/js/pa_ui_misc.js" type="text/javascript"></script> -->
<script type="text/javascript">
	$("#other-login").click(function(){
		$("#login_list").toggle();
	});
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

    //加入收藏
        function AddFavorite(sURL, sTitle) {
            sURL = encodeURI(sURL); 
        try{   
            window.external.addFavorite(sURL, sTitle);   
        }catch(e) {   
            try{   
                window.sidebar.addPanel(sTitle, sURL, "");   
            }catch (e) {   
                alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
            }   
        }
    }
    //设为首页
    function SetHome(url){
        if (document.all) {
            document.body.style.behavior='url(#default#homepage)';
               document.body.setHomePage(url);
        }else{
            alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
        }
    }
</script>
</body>
</html>