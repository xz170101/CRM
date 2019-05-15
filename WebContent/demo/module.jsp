<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>模块</title>
		<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
 	<script type="text/javascript">
	$(function() {
		$("#treemenu").tree({
			url:"../selectModule",
			lines: true,
			onContextMenu:function(e,node){
				e.preventDefault();
				// 查找节点
				$('#treemenu').tree('select', node.target);
				// 显示快捷菜单
				$('#mm').menu('show', {
						left: e.pageX,
						top: e.pageY
					});
			}
		})
	});
	function myTree(){
		$("#treemenu").tree({
			url:"../selectModule",
			lines: true 
		})
	}
	function addModuleInfo() {
		var nodes = $('#treemenu').tree('getSelected'); // get checked nodes
		if(nodes != null) {
			$("#parentModulename").text(nodes.text);
			$("#addModule_window").window("open");
		} else {
			$.messager.alert("提示信息","请选择父节点！","info");
		}
	}
	function submitModuleForms(){
		if($("#addModuleForm").form("validate")){
			var nodes = $('#treemenu').tree('getSelected');
			alert(nodes.modules_Id);
			var weight=$("#weight").val();
			var path=$("#path").val();
			var name=$("#name").val();
			$.ajax({
				url:"../insertModule",
				method:'post',
				data:{"modules_Name":name,"parentId":nodes.modules_Id,"modules_path":path,"modules_weight":weight},
				dataType:'json',
				success:function(data){
					if(data>0){
						$.messager.alert("提示信息","添加成功！","info");
						$("#addModule_window").window("close");
						myTree();
					}else
					    $.messager.alert("提示信息","添加失败！","info");
				}
			})
		}else
		$.messager.alert("错误信息","请填写完整！","info");
	}
	function clearModuleForm(){
		$("#addModule_window").window("close");
		$("#updataModule_window").window("close");
	}
	var parentId;
	function updataModuledg(){
		var nodes = $('#treemenu').tree('getSelected');
		if(nodes != null) {
			$.ajax({
				type:"post",
				dataType:'json',
				url:"../updateModule",
				data:{"modules_Id":nodes.modules_Id },
				success:function(res){
					if(res.success){
						var str=eval("("+res.message+")");
						parentId=str.parentId;
						$("#updateModuleForm").form("load",str);
						$("#updataModule_window").window("open");
					}
				}
			});
			
		} else {
			$.messager.alert("提示信息","请选择父节点！","info");
		}
	}
	function updatesubmitModuleForms(){
		var nodes = $('#treemenu').tree('getSelected');
		var upweight=$("#upweight").val(); 
		var upurl=$("#upurl").val();
		var upname=$("#upname").val();
		$.ajax({
			type:"post",
			url:"../updateModule",
			dataType:'json',
			data:{"modules_Id":nodes.modules_Id,"modules_Name":upname,"parentId":parentId,"modules_path":upurl,"modules_weight":upweight},
			success:function(res){
				if(res>0){
					myTree();
					$("#updataModule_window").window("close");
					$.messager.alert("错误提示","修改成功");
				}else
				$.messager.alert("错误提示","修改失败");
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
		    		url:"../delModule",
		    		data:{"modules_Id":nodes.modules_Id },
		    		dataType:'json',
		    		success:function(res){
		    			if(res>0){
		    				$.messager.alert("提示信息","删除成功");
		    				myTree();
		    			}else
		    			$.messager.alert("错误信息","删除失败");
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
		
	<table name="center1" class="easyui-datagrid" id="Moduledg" title="模块信息" style="width: 100%; height:auto;" data-options="method:'post'">
	</table>
	<div style="margin-bottom: 5px;">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addModuleInfo()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updataModuledg()">编辑</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cut" onclick="deleteModuledg()">删除</a>
	</div>
	
	<div id="moduleDiv" title="请选择模块" style="width: 650px; height: 500px; background: #eee;">
		<ul id="treemenu"></ul>
	</div>
	
	<!--新增模块-->
	<div id="addModule_window" class="easyui-window" title="新增模块信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px; top: 200px;">
		<form id="addModuleForm">
			<table cellpadding="5">
				<tr> 
					<td>父节点名称:</td>
					<td> <div id="parentModulename"></div></td>
				</tr>
				<tr>
					<td>权重</td>
					<td><input class="easyui-numberbox" type="text" id="weight"  name="weight" data-options="required:true"></input>
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
		<div style="text-align:center;padding:5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="submitModuleForms()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearModuleForm()">取消</a>
		</div>
	</div>
	
	<!--修改模块-->
	<div id="updataModule_window" class="easyui-window" title="新增模块信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px; top: 200px;">
		<form id="updateModuleForm">
			<table cellpadding="5">
				<tr>
					<td>权重</td>
					<td><input class="easyui-textbox" type="text" name="modules_weight"  id="upweight" data-options="required:true"></input>
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
		<div style="text-align:center;padding:5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="updatesubmitModuleForms()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearModuleForm()">取消</a>
		</div>
	</div>
	
	<div id="mm" class="easyui-menu" style="width:120px;">
		<div onclick="addModuleInfo()" data-options="iconCls:'icon-add'">追加</div>
		<div onclick="updataModuledg()" data-options="iconCls:'icon-edit'">编辑</div>
		<div onclick="deleteModuledg()" data-options="iconCls:'icon-remove'">移除</div>
	</div>
	</body>
</html>