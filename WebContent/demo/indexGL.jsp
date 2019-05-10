<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理首页</title>
		<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	
	</head>
	<body>
		<div class="easyui-layout" style="width:100%;height:700px;">
		         <div data-options="region:'west',split:true" title="导航应用" style="width:150px;">
		           <div id="menuTree" > 
		           </div>
		        </div>
		        <div id="centerTabs" data-options="region:'center',iconCls:'icon-ok'"   >
		            <div id="tt" class="easyui-tabs"> 
	           		</div>
		        </div>
	    	</div>
		
	</body>
</html>
