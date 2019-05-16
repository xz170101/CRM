<%@ page language="java" contentType="textml; charset=UTF-8"
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
	
<script type="text/javascript">
	$(function(){
		init();
	})
	
	function init(){
		$("#dg").datagrid({
			url:'selectFollows',
			method:'post',
			fitColumns:true,
			rownumbers:true,
			toolbar:"#tb",			
			queryParams:{				
			//要发送的参数列表
			text1:$("#sname").textbox("getValue"),	
			text2:$("#zixunname").textbox("getValue"),	
			text3:$("#startTime").datebox("getValue"),
			text4:$("#endTime").datebox("getValue"), 
			text5:$("#followstate").textbox("getValue"),	
			text6:$("#followtype").textbox("getValue")
			}
		})
		$("#sousuofrm").form("reset");
	}
	//显示学生名字
	function formattersname(value,row,index) {		
		return row.student.stu_Name;
	}
	
	//显示追踪者名称
	function formatteruname(value,row,index) {
		return row.student.stu_ZiXunName;
	}
	
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='look("+ index + ")'>查看</a>";
	}
	function look(index){
		var data=$('#dg').datagrid('getData');
		var row=data.rows[index];
		$('#lookFollowForm').form('load',row);
		$('#lookFollows').window('open');		
	} 
	
	//查看的关闭
		function Followclose(){
			$('#lookFollows').dialog('close');
		}
</script>
</head>
<body>
	<table id="dg" class="easyui-datagrid" title="跟踪记录"
		data-options="collapsible:true,pagination:true">
		<thead>
			<tr>
				<th data-options="field:'checkbox',checkbox:true"></th>
				<th data-options="field:'follows_Id'">编号</th>
				<th data-options="field:'stu_Name',formatter:formattersname">客户姓名</th>
				<th data-options="field:'stu_ZiXunName',formatter:formatteruname">咨询师姓名</th>
				<th data-options="field:'followTime'">追踪时间</th>
				<th data-options="field:'nextFollowTime'">下次追踪时间</th>
				<th data-options="field:'followType'">追踪类型</th>
				<th data-options="field:'createTime'">创建时间</th>
				<th data-options="field:'followState'">追踪状态</th>
				<th data-options="field:'conTent'">内容</th>
				<th data-options="field:'caozuo',formatter:formattercaozuo">操作</th>
			</tr>
		</thead>
	</table>
	<!--多条件查询  -->
	 <div id="tb" style="padding: 5px; height: auto">
		<form id="sousuofrm" class="easyui-form">
			客户姓名: <input class="easyui-textbox" id="sname" style="width: 80px">
			跟踪者: <input class="easyui-textbox" id="zixunname" style="width: 80px">
			 跟踪时间:<input class="easyui-datebox"   id="startTime" >~
			 		<input class="easyui-datebox" id="endTime" >	 			
			 回访情况: <input class="easyui-textbox" id="followstate" style="width: 80px">
			跟踪方式: <input class="easyui-textbox" id="followtype" style="width: 80px">
			 <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" onclick="init()">查找</a>			   
		</form>
	</div>
	
	
	<!-- 对学生进行跟踪 -->
	<div id="lookFollows" class="easyui-dialog" title="查看跟踪信息" style="width:400px;height:300px;" 
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'关闭',
				handler:function(){Followclose()}
			}]">
		
	    <form id="lookFollowForm" class="easyui-form">
	    	<table cellpadding="5">	    		
	    		<tr>
	    			<td>内容：</td>
	    			<td><input class="easyui-textbox" id="content" name="conTent"></td>
	    		</tr>	    		
	    	</table>
	    </form>
	</div>
</body>
<html>
