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
				method:"post" ,			
				fitColumns:true,
		        pagination:true,
		        rownumbers:true,
		        toolbar:"#tb",
		     
		        queryParams:{
		        	text1:$("#username").val(),	
					text2:$("#btime").datetimebox("getValue"),	
					text3:$("#etime").datetimebox("getValue"),
					num1:$("#qiandao").combobox("getValue")
		        }
			})
			 $("#checkfrm").form("reset"); 
		}
		//datetime的确定
		$('#btime').datetimebox({		       
		    required: true    		      
		});  
		$('#etime').datetimebox({ 		       
		    required: true   		      
		});  
		//签退
		function qiantui(index) {
			var data = $("#db").datagrid("getSelections");
			if (data == "" || data == null) {
				alert("请选择要签退的员工");
				
				return;
			}
			//var ids = "";
			var userids = ""
			for (var i = 0; i < data.length; i++) {
				if (data[i].isCancel == true) {
					alert(data[i].userName + "员工已签退");
					return;
				}
				if (userids == "") {
					
					userids += data[i].user_Id;
				} else {
				
					userids += ",";
					userids += data[i].user_Id;
				}
			}
			$.messager.confirm("提示", "你确定签退选中的员工吗?", function(r) {
				if (r) {
					$.ajax({
						url : "qiantui",
						type : "post",
						dataType : "json",
						data : {
							//ids : ids,
							checkState : 0,
							isCancel : 1,
							userids:userids
						},
						success : function(res) {
							if (res.success) {
								$("#db").datagrid("reload");
								alert(res.message);
							} else {
								alert(res.message);

							}
						}
					})
				}
			})
		}
		
		function edit(index) {
			var data = $("#db").datagrid("getData");
			var row = data.rows[index];
			if (row.isCancel == true) {
				alert(row.userName + "员工已签退");
				$("#db").datagrid("reload");
				return;
			}
			$.messager.confirm("提示", "你确定签退选中的员工吗?", function(r) {
				if (r) {
					$.ajax({
						url : "editCheck",
						type : "post",
						dataType : "json",
						data : {
							checkState : 0,
							isCancel : 1,
							user_Id : row.user_Id
						},
						success : function(res) {
							if (res.success) {
								$("#db").datagrid("reload");
								alert(res.message);
							} else {
								alert(res.message);

							}
						}
					})
				}
			})
		} 
		
		/* function quantui(){
			$.messager.confirm("提示", "你确定签退所有的的员工吗?", function(r) {
				if (r) {
					$.ajax({
						url : "quanCheck",
						type : "post",
						dataType : "json",
						data : {
						},
						success : function(res) {
							if (res.success) {
								$("#db").datagrid("reload");
								alert(res.message);
							} else {
								alert(res.message);

							}
						}
					})
				}
			})
		} */
		
		//操作列
		function formatterCaozuo(value, row, index){ 
			 /*<a href='javascript:void(0)' style='cursor: pointer;' onclick='edit("
			+ index
			+ ")'>签退</a>  */
			 return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='edit("
				+ index
				+ ")'>签退</a> <a href='javascript:void(0)' style='cursor: pointer;' onclick='updateInfo("
			+ index
			+ ")'>修改</a> <a href='javascript:void(0)' style='cursor: pointer;' onclick='deleteInfo("
			+ index + ")'>删除</a>";	
			}
		//格式化字段
		function formatterqiandao(value, row, index) {
			return row.checkState == 1 ? "已签到" : "未签到";
		}
		function formatterqiantui(value, row, index) {
			return row.isCancel == 1 ? "已签退" : "未签退";
		}
	</script>
</head>
<body>
	<table id="db" data-options="fitColumns:true">   
		<thead>
			<tr>
				<th data-options="field:'checkbox',checkbox:true"></th>
	        	<th data-options="field:'checks_Id'">编码</th>	           
	            <th data-options="field:'userName'">用户名</th>   
	        	<th data-options="field:'checkInTime'">签到时间</th>  
	        	<th data-options="field:'checkState',formatter:formatterqiandao">是否签到</th>
	        	<th data-options="field:'isCancel',formatter:formatterqiantui">是否签退</th>   
	          	<th data-options="field:'checkOutTime'">签退时间</th>   
	          	<th data-options="field:'setLo',align:'center',formatter:formatterCaozuo">操作</th>            
	            
			</tr>		
		</thead>
	</table>
	
	<div id="tb" style="padding: 5px; height: auto">
		<form class="easyui-form" id="checkfrm">
			<label for="name">用户名:</label> 
			<input class="easyui-validatebox" type="text" id="username" style="width: 80px;" data-options="" />
			签到状态:
			<select id="qiandao" class="easyui-combobox" style="width: 100px;">
				<option value="">--请选择--</option>
				<option value="1">是</option>
				<option value="0">否</option>
			</select>
			 <label for="name">签到时间:</label>
			  <input class="easyui-datetimebox" type="text" id="btime" style="width: 80px;" data-options="" /> 
			  ~ <input class="easyui-datetimebox" type="text" id="etime" style="width: 80px;" data-options="" /> 
			  <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" plain="true" onclick="init()">查询</a> 
			  <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true" onclick="qiantui()">批量签退</a>
			  <!-- <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true" onclick="quantui()">全部签退</a> -->
		</form>
	</div>
</body>
</html>