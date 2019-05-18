<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script>
		$(function(){
				
				init();
			})
		function init(){
			$("#db").datagrid({
				url:"selectuserchecks",
				method:"post",			
				fitColumns:true,
		        pagination:true,
		        rownumbers:true
			})
			/* $("#sousuofrm").form("reset"); */
		}
	
	</script>
</head>
<body>
	<table id="db" data-options="fitColumns:true">   
		<thead>
			<tr>
				<th data-options="field:'checkbox',checkbox:true"></th>
	        	<th data-options="field:'checks_Id'">编码</th>   
	            <th data-options="field:'user_Id'">姓名</th> 
	            <th data-options="field:'userName'">年龄</th>   
	        	<th data-options="field:'checkInTime'">性别</th>  
	        	<th data-options="field:'checkState'">手机号</th>
	        	<th data-options="field:'isCancel'">客户状态</th>   
	          	<th data-options="field:'checkOutTime'">客户状态</th>   
	          	<th data-options="field:'setLo',align:'center',formatter:formatterCaozuo">操作</th>            
	            
			</tr>		
		</thead>
	</table>
</body>
</html>