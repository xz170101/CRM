<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>找回密码-图书管理系统</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="text-align: center" width="300px" height="200px">
		<form action="RetrievePassword.do" method="post">
 
 
			<input type="email" name="email" id="email" width="100px"
				height="60px" style="margin-top: 100px" placeholder="请输入您的邮箱地址"
				required> <br>
			<br>
 
			<button type="submit" class="btn btn-success" id="button"
				width="100px" height="60px">找回密码</button>
 
		</form>
		<br>
		<br>
 
		<button type="button" class="btn btn-primary" id="button"
			onclick="backLogin()" width="100px" height="60px">返回登录页面</button>
	</div>
	<script type="text/javascript">
		function backLogin() {
			window.location.href = "login.jsp"
		}
	</script>
</body>
</html>