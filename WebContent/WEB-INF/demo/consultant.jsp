<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>咨询师页面</title>
	<link rel="stylesheet" type="text/css"
		href="js/jquery-easyui-1.4.3/themes/icon.css">
	<link rel="stylesheet" type="text/css"
		href="js/jquery-easyui-1.4.3/themes/metro/easyui.css">
	<script type="text/javascript"
		src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
	<script type="text/javascript"
		src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			init();
		})
		function init(){
		$("#stuTab").datagrid({
			url:"selectCon",
			method:"post",			
			fitColumns:true,
	        pagination:true,
	        rownumbers:true, 
	        toolbar:"#tb",
	        queryParams:{				
				//要发送的参数列表
				text1:$("#sname").textbox("getValue"),	
				text2:$("#phone").textbox("getValue"),	
				text3:$("#zixunname").textbox("getValue"),
				num1:$("#ispay").combobox("getValue"), 
				num2:$("#isvalid").combobox("getValue"),	
				num3:$("#isreturnvist").combobox("getValue"),
				text4:$("#qq").textbox("getValue"),	
				text5:$("#creattime").datebox("getValue"),	
				text6:$("#hometime").datebox("getValue"),
				text7:$("#firstvisittime").datebox("getValue"), 
				text8:$("#paytime").datebox("getValue"),	
				text9:$("#inclasstime").datebox("getValue")
				}
		})
		$("#sousuofrm").form("reset");
		}
		function formatterStu(value, row, index){ 
			return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='lookStu(" + index + ")'>查看</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='rizhiStu(" + index + ")'>日志</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='updateStu(" + index + ")'>编辑</a>";
		}	
	 
		function formatterSex(value, row, index){
			return value==0? '男':'女';
		}
		
		function formatterIsValid(value, row, index){
			return value==0? '否':'是';
		}
		function formatterIsReturnVist(value, row, index){
			return value==0? '否':'是';
		}
		function formatterIsHome(value, row, index){
			return value==0? '否':'是';
		}
		function formatterIsPay(value, row, index){
			return value==0? '否':'是';
		}
		function formatterIsReturnMoney(value, row, index){
			return value==0? '否':'是';
		}
		function formatterIsInClass(value, row, index){
			return value==0? '否':'是';
		}
		function formatterIsDel(value, row, index){
			return value==0? '否':'是';
		}
		function formatterIsBaoBei(value, row, index){
			return value==0? '否':'是';
		}
	</script>
</head>
<body>
	<table id="stuTab" data-options="fitColumns:true">
		<thead>
			<tr>
				<th data-options="field:'checkbox',checkbox:true"></th>
				<th data-options="field:'stu_id'">编码</th>
				<th data-options="field:'stu_Name'">姓名</th>
				<th data-options="field:'stu_Age'">年龄</th>
				<th data-options="field:'stu_Sex',formatter:formatterSex">性别</th>
				<th data-options="field:'stu_Phone'">手机号</th>
				<th data-options="field:'stu_Status'">客户状态</th>
				<th data-options="field:'stu_PerState'">个人状态</th>
				<th data-options="field:'stu_MsgSource'">客户信息</th>
				<th data-options="field:'stu_SourceUrl'">信息来源</th>
				<th data-options="field:'stu_SourceKeyWord'">来源关键字</th>
				<th data-options="field:'stu_Address'">地址</th>
				<th data-options="field:'stu_NetPusherld'">来源网站</th>
				<th data-options="field:'stu_qq'">QQ</th>
				<th data-options="field:'stu_WeiXin'">微信</th>
				<th data-options="field:'stu_Content'">内容</th>
				<th data-options="field:'stu_CreateTime'">创建日期</th>
				<th data-options="field:'stu_LearnForward'">课程方向</th>
				<th data-options="field:'stu_isValid',formatter:formatterIsValid">是否有效</th>
				<th data-options="field:'stu_Record'">客户记录</th>
				<th data-options="field:'stu_isReturnVist',formatter:formatterIsReturnVist">是否要回访</th>
				<th data-options="field:'stu_isHome',formatter:formatterIsHome">是否上门</th>
				<th data-options="field:'stu_firstVisitTime'">回访时间</th>
				<th data-options="field:'stu_HomeTime'">上门时间</th>
				<th data-options="field:'stu_LostValid'">无效原因</th>
				<th data-options="field:'stu_isPay',formatter:formatterIsPay">是否缴费</th>
				<th data-options="field:'stu_PayTime'">缴费时间</th>
				<th data-options="field:'stu_Money'">缴费金额</th>
				<th data-options="field:'stu_isReturnMoney',formatter:formatterIsReturnMoney">是否退费</th>
				<th data-options="field:'stu_isInClass',formatter:formatterIsInClass">是否进班</th>
				<th data-options="field:'stu_inClassTime'">进班日期</th>
				<th data-options="field:'stu_inClassContent'">进班备注</th>
				<th data-options="field:'stu_AskerContent'">咨询内容</th>
				<th data-options="field:'stu_isDel',formatter:formatterIsDel">是否删除</th>
				<th data-options="field:'stu_FromPart'">来源部门</th>
				<th data-options="field:'stu_stuConcern'">学员关注</th>
				<th data-options="field:'stu_isBaoBei',formatter:formatterIsBaoBei">是否报备</th>
				<th data-options="field:'sexitInte'">打分</th>
				<th data-options="field:'stu_ZiXunName'">咨询师备注</th>
				<th data-options="field:'stu_CreateUser'">录入人</th>
				<th data-options="field:'stu_ReturnMoneyReason'">退费时间</th>
				<th data-options="field:'setLo',align:'center',formatter:formatterStu">操作</th>
			</tr>
		</thead>
	</table>
	<!--多条件查询  -->
	<div id="tb" style="padding: 5px; height: auto">
		<form id="sousuofrm" class="easyui-form">
			客户姓名:<input class="easyui-textbox" id="sname" style="width: 80px">
			电话:<input class="easyui-textbox" id="phone" style="width: 80px">
			咨询师:<input class="easyui-textbox" id="zixunname" style="width: 80px">
			是否缴费:<select id="ispay" class="easyui-combobox" style="height: auto;">
				<option value="0">否</option>
				<option value="1">是</option>
			</select> 
			是否有效:<select id="isvalid" class="easyui-combobox"
				style="height: auto;">
				<option value="0">否</option>
				<option value="1">是</option>
			</select> 
			是否回访:<select id="isreturnvist" class="easyui-combobox"
				style="height: auto;">
				<option value="0">否</option>
				<option value="1">是</option>
			</select> 
			QQ: <input class="easyui-textbox" id="qq" style="width: 80px">
			创建时间:<input class="easyui-datebox" id="creattime" style="width: 80px">
			上门时间:<input class="easyui-datebox" id="hometime" style="width: 80px">
			首次回访时间:<input class="easyui-datebox" id="firstvisittime"
				style="width: 80px"> 缴费时间:<input class="easyui-datebox"
				id="paytime" style="width: 80px"> 进班时间:<input
				class="easyui-datebox" id="inclasstime" style="width: 80px">

			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" onclick="init()">查找</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'" onclick="selectColumn()">设置隐藏列</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'" onclick="ExportForm()">导出表格</a>
		</form>
	</div>
</body>
</html>