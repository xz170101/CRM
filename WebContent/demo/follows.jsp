<%@ page language="java" contentType="textml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	
<script type="text/javascript">
	$(function(){
		init();
	})
	function init(){
		$("#dg").datagrid({
			url:'../selectFollows',
			method:'post',
			fitColumns:true,
			rownumbers:true
		})
	}
	//显示学生名字
	function formattersname(value,row,index) {
		
		return row.student.stu_Name;
	}
	
	//显示追踪者名称
	function formatteruname(value,row,index) {
		return row.user.loginName;
	}
	
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='look("+ index + ")'>查看</a>";
	}
	/* function look(index){
		var data=$('#dg').datagrid('getData');
		var row=data.rows[index];
		$('#lookFollowForm').form('load',row);
		$('#lookFollow_window').window('open');
		
	} */
</script>
</head>
<body>
	<table id="dg" class="easyui-datagrid" title="跟踪"
		data-options="singleSelect:true,collapsible:true,pagination:true">
		<thead>
			<tr>
				<th data-options="field:'checkbox',checkbox:true"></th>
				<th data-options="field:'follows_Id'">编号</th>
				<th data-options="field:'student',formatter:formattersname">学生名称</th>
				<th data-options="field:'user',formatter:formatteruname">追踪者</th>
				<th data-options="field:'followTime'">追踪时间</th>
				<th data-options="field:'nextFollowTime'">下次追踪时间</th>
				<th data-options="field:'followType'">追踪类型</th>
				<th data-options="field:'createTime'">创建时间</th>
				<th data-options="field:'followState'">追踪状态</th>
				<th data-options="field:'caozuo',formatter:formattercaozuo">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- <div id="dgtool">
		<input class="easyui-textbox" id="s_name">
		<input class="easyui-textbox" id="u_name">
		<input class="easyui-textbox" id="">
		<input class="easyui-textbox" id="">
		<input class="easyui-textbox" id="">
		<input class="easyui-textbox" id="">
	</div>
	 -->
	<!-- <div id="lookFollow_window" class="easyui-window" title="新增员工信息"
		data-options="modal:true,closed:true,iconCls:'icon-save',colsed:true"
		style="width: 300px; height: 200px; padding: 10px;">
		<form id="lookFollowForm">
			<table cellpadding="5">
				<tr>
					<td>用户名:</td>
					<td><input class="easyui-textbox"  data-options="multiline:true"
					 type="text" name="content"id="content" style="height:100px"></input></td>
				</tr>
			</table>
		</form>
		
	</div> -->
</body>
<ml>
