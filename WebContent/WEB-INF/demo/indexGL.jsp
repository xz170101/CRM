 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理首页</title>
		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>

	
		<script type="text/javascript">
		//树形结构显示
		$(function() {
			 $('#menuTree').tree({
				url :"getSysRightsHtmlTree",
				method : "post",
				onClick : function (node) { // attributes 属性返回指定节点属性的集合。
			        //if (node.attributes) {  
						var flag = $("#tt").tabs('exists', node.text);
						var isLeaf = $('#menuTree').tree('isLeaf', node.target); //是否是叶子节点
						if(isLeaf) { //只有叶子节点才会在选项卡中创建选项页（每个选项页对应1个功能）
							if(!flag) {
								$('#tt').tabs('add', { //在选项卡中，创建1个选项页
									title: node.text, //选项卡中，选项页的标题（在同一个选项卡中，选项页需要保持一致）。
									closable: true,
									content: "<iframe width='100%' height='580px' src='" + node.modules_path + "'/>"  
								});
							} else {
								$("#tt").tabs('select', node.text); //直接选中title对应的选项卡
							}
						 }
				       //}   
					 }, onLoadError:function(none){
				     	window.parent.location.href="login";
					   } 
				}); 
			});
		
		</script>
	</head>
	<body>
		<div style="margin:20px 0;"></div>			
	    <div class="easyui-layout" style="width:100%;height:700px;">
	       <!--  <div data-options="region:'north'" style="height:50px">
	        	CRM系统&nbsp;&nbsp;欢迎您：<span id="spName"></span>&nbsp;&nbsp;
	        	<a id="btn" href="javascript:void" onclick="tuichu()" style="cursor:pointer">安全退出</a>
	        </div> -->
	        <div data-options="region:'south',split:true" style="height:50px;"></div>
	        <div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:150px;padding:10px;">东部区域</div>
		        <div data-options="region:'west',split:true" title="导航应用" style="width:150px;">
		           <div id="menuTree" ><!--这个地方显示树状结构-->
		           		
		           </div>
		        </div>
	        
	        <div id="center_1" data-options="region:'center',iconCls:'icon-ok' ">
	            <div id="tt" class="easyui-tabs" data-options="fit:true"> <!--这个地方采用tabs控件进行布局-->
	             	
	            </div>
	        </div>
	    </div>
	</body>
</html>
 
