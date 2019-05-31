 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>模块</title>
		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro/easyui.css">
   		<link rel="stylesheet" type="text/css" href="js/assets/css/jquery.mobile-1.4.5.css">
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
 		<link rel="stylesheet" type="text/css" href="js/assets/css/jquery.range.css">
 		<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.range.js"></script> 
<!--  		<script type="text/javascript" src="js/assets/js/jquery.mobile-1.4.5.js"></script>
 --> 	<script type="text/javascript">
	$(function() {
		$("#treemenu").tree({
			url:"selectModule",
			lines: true,
			onContextMenu:function(e,node){
				e.preventDefault();
				// 查找节点
				$('#treemenu').tree('select', node.target);
				var nodes = $('#treemenu').tree('getSelected'); // get checked nodes
				// 显示快捷菜单
				//alert(JSON.stringify(nodes));
				if(nodes.parent_id==0){
					$('#mn').menu('show', {
						left: e.pageX,
						top: e.pageY
					});
				}else{$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY
				});}
				
			}
		})
		//滑动选择权重
		$('.slider-input').jRange({
		    from: 0.0,
		    to: 100.0,
		    step: 1.0,
		    scale: [0.0,20.0,40.0,60.0,80.0,100.0],
		    format: '%s',
		    width: 180,
		    showLabels: true,
		    snap: true
		});
	});
	function myTree(){
		$("#treemenu").tree({
			url:"selectModule",
			lines: true 
		})
	}
	function addModuleInfo() {
		var nodes = $('#treemenu').tree('getSelected'); // get checked nodes
		if(nodes != null) {
			$("#parentModulename").text(nodes.text);
			$("#addModule_window").dialog("open");
		  } else {
			//$.messager.alert("提示信息","请选择父节点！","info");
			$("#addModule_window").dialog("open");
		} 
	}
	function submitModuleForms(){
		if($("#addModuleForm").form("validate")){
			var nodes = $('#treemenu').tree('getSelected');
			var parentId;
			if(nodes==null){
				parentId=0;
			}else{
				parentId=nodes.id;
			}
			var weight=$("#weight").val();
			var path=$("#path").val().trim();
			var name=$("#name").val().trim();
			$.ajax({
				url:"insertModule",
				method:'post',
				data:{"modules_Name":name,"parentId":parentId,"modules_path":path,"modules_weight":weight},
				dataType:'json',
				success:function(data){
					if(data>0){
						$.messager.alert("提示信息","添加成功！","info");
						$("#addModule_window").dialog("close");
						myTree();
					}else
					    $.messager.alert("提示信息","该模块已存在该节点！","info");
				}
			})
		}else
		$.messager.alert("错误信息","请填写完整！","info");
	}
 
	$('#updataModule_window').dialog({
        onBeforeClose: function () { 
        	clearModuleForm();
        }
	})
	function clearModuleForm(){
		$("#addModuleForm").form("clear");
		$("#addModule_window").dialog("close");
		$("#updateModuleForm").form("clear");
		$("#updataModule_window").dialog("close");
	}
	var parentId;
	function updataModuledg(){
		var nodes = $('#treemenu').tree('getSelected');
			$.ajax({
				type:"post",
				dataType:'json',
				url:"selectModuleById",
				data:{"modules_Id":nodes.id },
				success:function(res){
						 parentId=res.parentId;
 						$("#updateModuleForm").form("load",res);
						$("#updataModule_window").dialog("open");
				}
			});
		 
	}
	function updatesubmitModuleForms(){
		var nodes = $('#treemenu').tree('getSelected');
		var upweight=$("#upweight").val(); 
		var upurl=$("#upurl").val().trim();
		var upname=$("#upname").val().trim();
 		$.ajax({
			type:"post",
			url:"updateModule",
			dataType:'json',
			data:{"modules_Id":nodes.id,"modules_Name":upname,"parentId":parentId,"modules_path":upurl,"modules_weight":upweight},
			success:function(res){
				if(res>0){
					myTree();
					clearModuleForm();
 					$.messager.alert("提示","修改成功");
				}else
				$.messager.alert("提示","该模块已存在该节点！");
			}
		});
	}
	//删除
	function deleteModuledg(){
		var nodes = $('#treemenu').tree('getSelected'); // get checked nodes
		if(nodes != null) {
			$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		    if (r){ // 用户点击了确认按钮
		    	$.ajax({
		    		type:"post",
		    		url:"delModule",
		    		data:{"modules_Id":nodes.id },
		    		dataType:'json',
		    		success:function(res){
		    			if(res>0){
		    				$.messager.alert("提示","ok");
		    				myTree();
		    			}else
		    			$.messager.alert("提示","该模块有角色引用,不可删除");
		    		}
		    	});
		    }
		 });
		} else {
			$.messager.alert("提示信息","请选择父节点！","info");
		}
	}
</script>
 <body>
 	<table name="center1" class="easyui-datagrid" id="Moduledg" title="模块信息【右击管理模块】" style="width: 100%; height:auto;" data-options="method:'post'">
	</table>
	 <div style="margin-bottom: 5px;">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addModuleInfo()">添加</a>
	</div>   
	
	<div id="moduleDiv" title="请选择模块" style="width: 650px; height: 500px; background: #eee;">
		<ul id="treemenu"></ul>
	</div>
	
	<!--新增模块-->
	<div id="addModule_window" class="easyui-dialog" title="新增模块信息" data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
								text:'保存',
								handler:function(){ submitModuleForms();}
							},{
								text:'关闭',
								handler:function(){ clearModuleForm();}
							}]" style="width:500px;height:300px;padding:10px; top: 200px;">
		<form id="addModuleForm">
			<table cellpadding="5">
				<tr> 
					<td>父节点名称:</td>
					<td> <div id="parentModulename"></div></td>
				</tr>
				<tr>
					<td>权重</td>
					<td>
					 <input id="weight" type="range"  min="0" max="100" data-show-value="true" data-highlight="true">
					<!-- <input id="weight"  type="hidden" class="slider-input"  /> -->
				  	</td>
				</tr>
				<tr>
					<td>URL:</td>
					<td><input class="easyui-textbox" type="text" name="path" id="path" data-options="required:true"></input>
					</td>
				</tr>
	
				<tr>
					<td>模块名称:</td>
					<td><input type="text" class="easyui-textbox" id="name" name="name" data-options="required:true"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!--修改模块-->
	<div id="updataModule_window" class="easyui-dialog" title="修改模块信息" data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
								text:'保存',
								handler:function(){ updatesubmitModuleForms();}
							},{
								text:'关闭',
								handler:function(){ clearModuleForm();}
							}]" style="width:500px;height:300px;padding:10px; top: 200px;">
		<form id="updateModuleForm">
			<table cellpadding="5">
				<tr>
					<td>权重</td>
					<td>
					<input id="upweight"  name="modules_weight" type="range"  min="0" max="100" data-show-value="true" data-highlight="true">
					<!-- <input id="upweight" name="modules_weight" type="hidden" class="slider-input"  /> -->
					<!-- <input class="easyui-textbox" type="text" name="modules_weight"  id="upweight" data-options="required:true"></input> -->
					</td>
				</tr>
				<tr>
					<td>URL:</td>
					<td><input class="easyui-textbox" type="text" name="modules_path" id="upurl" data-options="required:true"></input>
					</td>
				</tr>
	
				<tr>
					<td>模块名称:</td>
					<td><input type="text" class="easyui-textbox" name="modules_Name" id="upname"data-options="required:true"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="mn" class="easyui-menu" style="width:120px;">
		<div onclick="addModuleInfo()" data-options="iconCls:'icon-add'">追加</div>
		<div onclick="updataModuledg()" data-options="iconCls:'icon-edit'">编辑</div>
		<div onclick="deleteModuledg()" data-options="iconCls:'icon-remove'">移除</div>
	</div>
	<div id="mm" class="easyui-menu" style="width:120px;">
<!-- 		<div onclick="addModuleInfo()" data-options="iconCls:'icon-add'">追加</div> -->
		<div onclick="updataModuledg()" data-options="iconCls:'icon-edit'">编辑</div>
		<div onclick="deleteModuledg()" data-options="iconCls:'icon-remove'">移除</div>
	</div>
	</body>
	 
 
 
</html>