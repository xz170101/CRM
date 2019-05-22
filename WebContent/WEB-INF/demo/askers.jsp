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
	$(function() {
		init()

	});
	function init() {
		$("#db").datagrid({
			url : 'selectAllAskers',
			method : "post",
			fitColumns:true,
		    pagination:true,
		    rownumbers:true,
		    toolbar:"#tb",
			queryParams : {				
				text1:$("#askername1").val()
			} 
		});
		$("#checkfrm").form("reset")
	}
	function formatterqiandao(value, row, index) {
		return row.checkState == 1 ? "已签到" : "未签到"
	}

	function editAskers(index) {
		var data = $("#db").datagrid("getData");
		var row = data.rows[index];
		$("#eidtWeight").form("load", row);
		$("#editWeight").dialog("open");
	}
	function saveAskers() {
		var flg = $("#eidtWeight").form("validate");
		if (flg) {
			$.ajax({
				url : "editweight",
				type : "post",
				dataType : "json",
				data : {
					askers_Id:$("#askerid1").val(),
					weight : $("#weight1").val(),
					bakContent : $("#bakcontent1").val()
				},
				success : function(res) {
					if(res.success){
						var data = $("#db").datagrid("reload");
						$("#editWeight").dialog("close");
						alert(res.message);
					}else{
						alert(res.message);

					}
				}
			})
		}

	}
	//操作用户
	function formatterOPUser(value, row, index) {
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='editAskers("
				+ index
				+ ")'>编辑权重</a>";
	}
	
	</script>
</head>
<body>
<table class="easyui-datagrid" id="db" title="签到列表"
		style="width: 300; height: 400"
		data-options="fitColumns:true">
		<thead>
			<tr>
				
				<th data-options="field:'askers_Name'">咨询师名字</th>
				<th data-options="field:'checkState',formatter:formatterqiandao">签到状态</th>
				<th data-options="field:'checkInTime'">签到时间</th>
				<th data-options="field:'weight'">权重</th>
				<th data-options="field:'roleName'">角色名字</th>
				<th data-options="field:'bakContent'">备注</th>
				<th
					data-options="field:'actionUpdate',formatter:formatterOPUser">操作</th>
		</thead>
	</table>
	 <div id="tb" style="padding: 5px; height: auto">
		<form class="easyui-form" id="checkfrm">
		  <label for="name">咨询师名字:</label>   
        <input class="easyui-textbox" style="width: 80px;" id="askername1" />   
			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" plain="true" onclick="init()">查询</a>
		</form>
	</div>
 

	<!--编辑权重  -->
	 <div id="editWeight" class="easyui-dialog" title="编辑权重"
		style="width: 300px; height: 200px;"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'保存',
				handler:function(){
				saveAskers();
				}
			},{
				text:'关闭',
				handler:function(){
					guanbiAskers();
				}
			}]">
		<form id="eidtWeight" class="easyui-form">
			<div>
			<input type="hidden" name="askers_Id" id="askerid1" />
				<label for="name">权重:</label> <input class="easyui-numberbox"
					type="text" name="weight" id="weight1" data-options="required:true" />
			</div>
			<div>
				<label for="name">备注:</label> <input class="easyui-textbox"
					type="text" name="bakContent" id="bakcontent1"
					data-options="required:true" />
			</div>
		</form>
	</div> 
</body>
</body>
</html>