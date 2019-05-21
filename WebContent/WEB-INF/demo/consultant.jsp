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
<!-- <script type="text/javascript" 
		src="js/jquery-easyui-1.4.3/datagrid-export.js"></script> -->

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
		
		//查看
		function lookStu(index){
			var data=$('#stuTab').datagrid('getData');
			var row=data.rows[index];
			$('#lookStuForm11').form("load",row);
			$('#lookStuForm22').form("load",row);
			/* $('#stu_Sex2').textbox('setValue',row.stu_Sex==0?'男':'女');//用三元表达式设置值
			$('#stu_isBaoBei2').textbox('setValue',row.stu_isBaoBei==0?"是":"否");
			$('#stu_isDel22').textbox('setValue',row.stu_isDel==0?"是":"否");
			$('#stu_isInClass22').textbox('setValue',row.stu_isInClass==0?"是":"否");
			$('#stu_isReturnMoney22').textbox('setValue',row.stu_isReturnMoney==0?"是":"否");
			$('#stu_isPay22').textbox('setValue',row.stu_isPay==0?"是":"否");
			$('#stu_isHome22').textbox('setValue',row.stu_isHome==0?"是":"否");
			$('#stu_isReturnVist22').textbox('setValue',row.stu_isReturnVist==0?"是":"否");
			$('#stu_isValid22').textbox('setValue',row.stu_isValid==0?"是":"否"); */
			$('#lookStu').dialog('open');
		}
		//查看的关闭
		function setStuclose(){
			$('#lookStu').dialog('close');
		}
		
		/*		
		设置隐藏列
		 */
		//打开设置隐藏列对话框
		function show() {
		var datagridTitle = new Array();
		var shuxing = new Array();
		var fields = $("#stuTab").datagrid('getColumnFields');
		var option;
		for (var i = 0; i < fields.length; i++) {
			option = $("#stuTab").datagrid('getColumnOption', fields[i]);
			datagridTitle.push(option.title);
			shuxing.push(option.field);
			if (option.field != "checked" && option.hidden != true) {//如果不是选中状态的话
				$("#lie_window").append(
						"<input type='checkbox' value="+shuxing[i]+"  name='ch'>"
								+ datagridTitle[i] + "</br>");
				$("input[name='ch']").get(i).checked = true;
			} else {//是选中状态
				$("#lie_window").append(
						"<input type='checkbox' value="+shuxing[i]+" name='ch' >"
								+ datagridTitle[i] + "</br>");
			}
		}
		$("#lie_window").window("open");
		$("input[name='ch']").click(function() {
			if ($(this).is(":checked")) {
				var p = $(this).val();
				$("#stuTab").datagrid('showColumn', p);
			} else {
				var q = $(this).val();
				$("#stuTab").datagrid('hideColumn', q);
			}
		})
	}
	$(document).ready(function() {
		$('#lie_window').window({
			onBeforeClose : function() {
				$("#lie_window").dialog("clear");
			}
		});
	});
	//设置隐藏列结束
		//Excel导出
		function ExportForm(){
			var header = $('#stuTab').datagrid('options').columns[0];//获取数据的第一行表头
			var fields="";
			for (var i = 1; i < header.length-1; i++) {
			var field = header[i].field;
			var hiddenFlag = header[i].hidden;//获取表头的隐藏列
			if (!hiddenFlag) {//如果字段不是隐藏列的话
			var dh = i == (header.length - 1) ? "" : ",";//将表头的字段进行分割
			fields = fields + field + dh;
				}
			}
			var row = $("#stuTab").datagrid("getSelections"); // 获取所有选中的行
			var stulist='';
			if(row==null || row==''){
			var data = $("#stuTab").datagrid('getData');//获取所有的数据
			stulist=JSON.stringify(data.rows);
			}else{
			stulist=JSON.stringify(row);
			}
			//window.location.href="/CRM/exportForm?stulist="+stulist+"&fields="+fields;
			var form=$("<form>");
			form.attr("style",'display:none');
			form.attr('target','');
			form.attr('method','post');
			form.attr('action','/CRM/exportForm');

			var input=$('<input>');
			input.attr('type','hidden');
			input.attr('name','fields');
			input.attr('value',fields);
			var input2=$('<input>');
			input2.attr('type','hidden');
			input2.attr('name','stulist');
			input2.attr('value',stulist);

			$('body').append(form);
			form.append(input);
			form.append(input2);
			form.submit();
		} 
		
		//修改打开
		function updateStu(index){
			var data=$('#stuTab').datagrid('getData');
			$('#sid').next().hide();//让学生编号的文本框进行隐藏
			var row=data.rows[index];
			$('#editStuForm11').form("load",row);
			$('#editStu').dialog('open');
		}
		
		//修改后的数据的提交
		function editsave() {
			 var stu_Id=$("#sid1").textbox("getValue");
			 var stu_Name=$("#stu_Name3").textbox("getValue");
			 var stu_Sex=$("#stu_Sex3").combobox("getValue");
		  	 var stu_Age=$("#stu_Age3").textbox("getValue");
			 var stu_Phone=$("#stu_Phone3").textbox("getValue");
			 var stu_Status=$("#stu_Status3").textbox("getValue");
			 var stu_PerState=$("#stu_PerState3").textbox("getValue");
			 var stu_SourceUrl=$("#stu_SourceUrl3").textbox("getValue");
			 var stu_NetPusherld=$("#stu_NetPusherld3").textbox("getValue");
			 var stu_SourceKeyWord=$("#stu_SourceKeyWord3").textbox("getValue");
			 var stu_Address=$("#stu_Address3").textbox("getValue");
			 var stu_stuConcern=$("#stu_stuConcern3").textbox("getValue");
			 var stu_FromPart=$("#stu_FromPart3").textbox("getValue");
			 var stu_qq=$("#stu_qq3").textbox("getValue");
			 var stu_WeiXin=$("#stu_WeiXin3").textbox("getValue");			
			 var stu_isBaoBei=$("#stu_isBaoBei3").combobox("getValue");
			 var stu_CreateUser=$("#stu_CreateUser3").textbox("getValue");
			 var stu_LearnForward=$("#stu_LearnForward33").textbox("getValue");
			 var sexitInte=$("#sexitInte33").textbox("getValue");
			 var stu_isValid=$("#stu_isValid33").combobox("getValue");					
			 var stu_isReturnVist=$("#stu_isReturnVist33").combobox("getValue");
			 var stu_isHome=$("#stu_isHome33").combobox("getValue");
			 var stu_HomeTime=$("#stu_HomeTime33").textbox("getValue");
			 var stu_LostValid=$("#stu_LostValid33").textbox("getValue");					
			 var stu_isPay=$("#stu_isPay33").combobox("getValue");
			 var stu_PayTime=$("#stu_PayTime33").textbox("getValue");
			 var stu_Money=$("#stu_Money33").textbox("getValue");
			 var stu_isReturnMoney=$("#stu_isReturnMoney33").combobox("getValue");					
			 var stu_isInClass=$("#stu_isInClass33").combobox("getValue");
			 var stu_inClassTime=$("#stu_inClassTime33").textbox("getValue");				
			 var stu_inClassContent=$("#stu_inClassContent33").textbox("getValue");
			 var stu_AskerContent=$("#stu_AskerContent33").textbox("getValue");
			 var stu_isDel=$("#stu_isDel33").combobox("getValue");
			 var stu_ReturnMoneyReason=$("#stu_ReturnMoneyReason33").textbox("getValue");
			 var stu_preMoney=$("#stu_preMoney33").textbox("getValue");
			 var stu_preMoneyTime=$("#stu_preMoneyTime33").textbox("getValue");
			 $.post("updateStu",{
				 stu_id:stu_Id,
				 stu_Name:stu_Name,
				 stu_Sex:stu_Sex,
				 stu_Age:stu_Age,
				 stu_Phone:stu_Phone,
				 stu_Status:stu_Status,
				 stu_PerState:stu_PerState,
				 stu_SourceUrl:stu_SourceUrl,
				 stu_NetPusherld:stu_NetPusherld,
				 stu_SourceKeyWord:stu_SourceKeyWord,
				 stu_Address:stu_Address,
				 stu_stuConcern:stu_stuConcern,
				 stu_FromPart:stu_FromPart,
				 stu_qq:stu_qq,
				 stu_WeiXin:stu_WeiXin,
				 stu_isBaoBei:stu_isBaoBei,
				 stu_CreateUser:stu_CreateUser,
				 stu_LearnForward:stu_LearnForward,
				 sexitInte:sexitInte,
				 stu_isValid:stu_isValid,
				 stu_isReturnVist:stu_isReturnVist,
				 stu_isHome:stu_isHome,
				 stu_HomeTime:stu_HomeTime,
				 stu_LostValid:stu_LostValid,
				 stu_isPay:stu_isPay,
				 stu_PayTime:stu_PayTime,
				 stu_Money:stu_Money,
				 stu_isReturnMoney:stu_isReturnMoney,
				 stu_isInClass:stu_isInClass,
				 stu_inClassTime:stu_inClassTime,
				 stu_inClassContent:stu_inClassContent,
				 stu_AskerContent:stu_AskerContent,
				 stu_isDel:stu_isDel,
				 stu_ReturnMoneyReason:stu_ReturnMoneyReason,
				 stu_preMoney:stu_preMoney,
				 stu_preMoneyTime:stu_preMoneyTime
			 },function(res){
				 if(res>0){
						$.messager.alert("提示","修改成功");
						$("#stuTab").datagrid("reload");
						//$('#editStuclose').dialog('close');
						editStuclose();
					}else{
						$.messager.alert("提示","修改失败");
					}
			 },"json")
		}
		//修改的关闭
		function editStuclose(){
			$('#editStu').dialog('close');
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
				<th
					data-options="field:'stu_isReturnVist',formatter:formatterIsReturnVist">是否要回访</th>
				<th data-options="field:'stu_isHome',formatter:formatterIsHome">是否上门</th>
				<th data-options="field:'stu_firstVisitTime'">回访时间</th>
				<th data-options="field:'stu_HomeTime'">上门时间</th>
				<th data-options="field:'stu_LostValid'">无效原因</th>
				<th data-options="field:'stu_isPay',formatter:formatterIsPay">是否缴费</th>
				<th data-options="field:'stu_PayTime'">缴费时间</th>
				<th data-options="field:'stu_Money'">缴费金额</th>
				<th
					data-options="field:'stu_isReturnMoney',formatter:formatterIsReturnMoney">是否退费</th>
				<th
					data-options="field:'stu_isInClass',formatter:formatterIsInClass">是否进班</th>
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
				<th
					data-options="field:'setLo',align:'center',formatter:formatterStu">操作</th>
			</tr>
		</thead>
	</table>
	<!--多条件查询  -->
	<div id="tb" style="padding: 5px; height: auto">
		<form id="sousuofrm" class="easyui-form">
			客户姓名:<input class="easyui-textbox" id="sname" style="width: 80px">
			电话:<input class="easyui-textbox" id="phone" style="width: 80px">
			是否缴费:<select id="ispay" class="easyui-combobox" style="height: auto;">
				<option value="0">否</option>
				<option value="1">是</option>
			</select> 是否有效:<select id="isvalid" class="easyui-combobox"
				style="height: auto;">
				<option value="0">否</option>
				<option value="1">是</option>
			</select> 是否回访:<select id="isreturnvist" class="easyui-combobox"
				style="height: auto;">
				<option value="0">否</option>
				<option value="1">是</option>
			</select> QQ: <input class="easyui-textbox" id="qq" style="width: 80px">
			创建时间:<input class="easyui-datebox" id="creattime" style="width: 80px">
			上门时间:<input class="easyui-datebox" id="hometime" style="width: 80px">
			首次回访时间:<input class="easyui-datebox" id="firstvisittime"
				style="width: 80px"> 缴费时间:<input class="easyui-datebox"
				id="paytime" style="width: 80px"> 进班时间:<input
				class="easyui-datebox" id="inclasstime" style="width: 80px">

			<a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" onclick="init()">查找</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'" onclick="show()">设置隐藏列</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit'" onclick="ExportForm()">导出表格</a>
		</form>
	</div>

	<!-- 查看窗体 -->
	<div id="lookStu" class="easyui-dialog" title="查看学生信息"
		style="width: 635px; height: 450px;"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
	buttons:[{
			text:'关闭',
			handler:function(){setStuclose()}
		}]">

		<div id="cc" class="easyui-layout"
			style="width: 600px; height: 450px;">
			<div data-options="region:'west',title:'在线录入',split:true"
				style="height: 600px; padding: 5px; background: #eee;">

				<form id="lookStuForm11" class="easyui-form">
					<table cellpadding="5">
						<tr>
							<td>姓名:</td>
							<td><input class="easyui-textbox" name="stu_Name"></td>
						</tr>
						<tr>
							<td>性别:</td>
							<td><input class="easyui-textbox" name="stu_Sex"></td>
						</tr>
						<tr>
							<td>年龄:</td>
							<td><input class="easyui-textbox" name="stu_Age"></td>
						</tr>
						<tr>
							<td>电话:</td>
							<td><input class="easyui-textbox" name="stu_Phone"></td>
						</tr>
						<tr>
							<td>学历:</td>
							<td><input class="easyui-textbox" name="stu_Status"></td>
						</tr>
						<tr>
							<td>状态:</td>
							<td><input class="easyui-textbox" name="stu_PerState"></td>
						</tr>
						<tr>
							<td>来源渠道:</td>
							<td><input class="easyui-textbox" name="stu_SourceUrl"></td>
						</tr>
						<tr>
							<td>来源网站:</td>
							<td><input class="easyui-textbox" name="stu_NetPusherld"></td>
						</tr>
						<tr>
							<td>来源关键字:</td>
							<td><input class="easyui-textbox" name="stu_SourceKeyWord"></td>
						</tr>
						<tr>
							<td>所在区域:</td>
							<td><input class="easyui-textbox" name="stu_Address"></td>
						</tr>
						<tr>
							<td>学员关注:</td>
							<td><input class="easyui-textbox" name="stu_stuConcern"></td>
						</tr>
						<tr>
							<td>来源部门:</td>
							<td><input class="easyui-textbox" name="stu_FromPart"></td>
						</tr>
						<tr>
							<td>qq:</td>
							<td><input class="easyui-textbox" name="stu_qq"></td>
						</tr>
						<tr>
							<td>微信:</td>
							<td><input class="easyui-textbox" name="stu_WeiXin"></td>
						</tr>
						<tr>
							<td>是否报备:</td>
							<td><input class="easyui-textbox" name="stu_isBaoBei"></td>
						</tr>
						<tr>
							<td>录入人:</td>
							<td><input class="easyui-textbox" name="stu_CreateUser"></td>
						</tr>
					</table>
				</form>
			</div>

			<div data-options="region:'center',title:'咨询师录入'"
				style="padding: 5px; background: #eee;">
				<form id="lookStuForm22" class="easyui-form">
					<table cellpadding="5">
						<tr>
							<td>咨询师：</td>
							<td><input class="easyui-textbox" name="stu_ZiXunName"></td>
						</tr>
						<tr>
							<td>课程方向：</td>
							<td><input class="easyui-textbox" name="stu_LearnForward"></td>
						</tr>
						<tr>
							<td>打分：</td>
							<td><input class="easyui-textbox" name="sexitInte"></td>
						</tr>
						<tr>
							<td>是否有效：</td>
							<td><input class="easyui-textbox" name="stu_isValid"></td>
						</tr>
						<tr>
							<td>是否回访：</td>
							<td><input class="easyui-textbox" name="stu_isReturnVist"></td>
						</tr>
						<tr>
							<td>是否上门：</td>
							<td><input class="easyui-textbox" name="stu_isHome"></td>
						</tr>
						<tr>
							<td>上门时间：</td>
							<td><input class="easyui-textbox" name="stu_HomeTime"></td>
						</tr>
						<tr>
							<td>无效原因：</td>
							<td><input class="easyui-textbox" name="stu_LostValid"></td>
						</tr>
						<tr>
							<td>是否缴费：</td>
							<td><input class="easyui-textbox" name="stu_isPay"></td>
						</tr>
						<tr>
							<td>缴费时间：</td>
							<td><input class="easyui-textbox" name="stu_PayTime"></td>
						</tr>
						<tr>
							<td>缴费金额：</td>
							<td><input class="easyui-textbox" name="stu_Money"></td>
						</tr>
						<tr>
							<td>是否退费：</td>
							<td><input class="easyui-textbox" name="stu_isReturnMoney"></td>
						</tr>
						<tr>
							<td>是否进班：</td>
							<td><input class="easyui-textbox" name="stu_isInClass"></td>
						</tr>
						<tr>
							<td>进班时间：</td>
							<td><input class="easyui-textbox" name="stu_inClassTime"></td>
						</tr>
						<tr>
							<td>进班备注：</td>
							<td><input class="easyui-textbox" name="stu_inClassContent"></td>
						</tr>
						<tr>
							<td>咨询内容：</td>
							<td><input class="easyui-textbox" name="stu_AskerContent"></td>
						</tr>
						<tr>
							<td>是否删除：</td>
							<td><input class="easyui-textbox" name="stu_isDel"></td>
						</tr>

						<tr>
							<td>咨询师：</td>
							<td><input class="easyui-textbox" name="stu_ZiXunName"></td>
						</tr>
						<tr>
							<td>退费时间：</td>
							<td><input class="easyui-textbox"
								name="stu_ReturnMoneyReason"></td>
						</tr>
						<tr>
							<td>定金金额：</td>
							<td><input class="easyui-textbox" name="stu_preMoney"></td>
						</tr>
						<tr>
							<td>定金时间：</td>
							<td><input class="easyui-textbox" name="stu_preMoneyTime"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<!-- 修改窗体 -->
	<div id="editStu" class="easyui-dialog" title="修改学生信息"
		style="width: 600; height: 450px;"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
	buttons:[{
				text:'保存',
				handler:function(){
				editsave();<!-- 保存 -->
				init();<!-- 刷新 -->
				closed_hiddenColumn();<!-- 关闭弹窗 -->
				}
			},{
			text:'关闭',
			handler:function(){editStuclose();}
		}]">

		<div id="cc" class="easyui-layout"
			style="width: 600px; height: 450px;">
			<div data-options="region:'center',title:'在线录入',split:true"
				style="height: 500px; padding: 5px; background: #eee;">

				<form id="editStuForm11" class="easyui-from">
					<table cellpadding="5">
						<tr>
							<td>编号：</td>
							<td><input class="easyui-textbox" disabled="disabled"
								id="sid1" name="stu_id" /></td>
						</tr>
						<tr>
							<td>姓名:</td>
							<td><input class="easyui-textbox" id="stu_Name3"
								name="stu_Name"></td>

							<td>性别:</td>
							<td><select id="stu_Sex3" name="stu_Sex"
								class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">女</option>
									<option value="1">男</option>
							</select></td>
						</tr>
						<tr>
							<td>年龄:</td>
							<td><input class="easyui-textbox" id="stu_Age3"
								name="stu_Age"></td>

							<td>电话:</td>
							<td><input class="easyui-textbox" id="stu_Phone3"
								name="stu_Phone"></td>
						</tr>
						<tr>
							<td>学历:</td>
							<td><input class="easyui-textbox" id="stu_Status3"
								name="stu_Status"></td>

							<td>状态:</td>
							<td><input class="easyui-textbox" id="stu_PerState3"
								name="stu_PerState"></td>
						</tr>
						<tr>
							<td>来源渠道:</td>
							<td><input class="easyui-textbox" id="stu_SourceUrl3"
								name="stu_SourceUrl"></td>

							<td>来源网站:</td>
							<td><input class="easyui-textbox" id="stu_NetPusherld3"
								name="stu_NetPusherld"></td>
						</tr>
						<tr>
							<td>来源关键字:</td>
							<td><input class="easyui-textbox" id="stu_SourceKeyWord3"
								name="stu_SourceKeyWord"></td>

							<td>所在区域:</td>
							<td><input class="easyui-textbox" id="stu_Address3"
								name="stu_Address"></td>
						</tr>
						<tr>
							<td>学员关注:</td>
							<td><input class="easyui-textbox" id="stu_stuConcern3"
								name="stu_stuConcern"></td>

							<td>来源部门:</td>
							<td><input class="easyui-textbox" id="stu_FromPart3"
								name="stu_FromPart"></td>
						</tr>
						<tr>
							<td>qq:</td>
							<td><input class="easyui-textbox" id="stu_qq3" name="stu_qq"></td>

							<td>微信:</td>
							<td><input class="easyui-textbox" id="stu_WeiXin3"
								name="stu_WeiXin"></td>
						</tr>
						<tr>
							<td>是否报备:</td>
							<td><select id="stu_isBaoBei3" name="stu_isBaoBei"
								class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">否</option>
									<option value="1">是</option>
							</select></td>
						</tr>
						<tr>
							<td>录入人:</td>
							<td><input class="easyui-textbox" id="stu_CreateUser3"
								name="stu_CreateUser"></td>
						</tr>
						<tr>
							<td>课程方向：</td>
							<td><input class="easyui-textbox" id="stu_LearnForward33"
								name="stu_LearnForward"></td>
						</tr>
						<tr>
							<td>打分：</td>
							<td><input class="easyui-textbox" id="sexitInte33"
								name="sexitInte"></td>
						</tr>
						<tr>
							<td>是否有效：</td>
							<td><select id="stu_isValid33" name="stu_isValid"
								class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">否</option>
									<option value="1">是</option>
							</select></td>
						</tr>
						<tr>
							<td>是否回访：</td>
							<td><select id="stu_isReturnVist33" name="stu_isReturnVist"
								class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">否</option>
									<option value="1">是</option>
							</select></td>
						</tr>
						<tr>
							<td>是否上门：</td>
							<td><select id="stu_isHome33" name="stu_isHome"
								class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">否</option>
									<option value="1">是</option>
							</select></td>
						</tr>
						<tr>
							<td>上门时间：</td>
							<td><input class="easyui-textbox" id="stu_HomeTime33"
								name="stu_HomeTime"></td>
						</tr>
						<tr>
							<td>无效原因：</td>
							<td><input class="easyui-textbox" id="stu_LostValid33"
								name="stu_LostValid"></td>
						</tr>
						<tr>
							<td>是否缴费：</td>
							<td><select id="stu_isPay33" name="stu_isPay"
								class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">否</option>
									<option value="1">是</option>
							</select></td>
						</tr>
						<tr>
							<td>缴费时间：</td>
							<td><input class="easyui-textbox" id="stu_PayTime33"
								name="stu_PayTime"></td>
						</tr>
						<tr>
							<td>缴费金额：</td>
							<td><input class="easyui-textbox" id="stu_Money33"
								name="stu_Money"></td>
						</tr>
						<tr>
							<td>是否退费：</td>
							<td><select id="stu_isReturnMoney33"
								name="stu_isReturnMoney" class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">否</option>
									<option value="1">是</option>
							</select></td>
						</tr>
						<tr>
							<td>是否进班：</td>
							<td><select id="stu_isInClass33" name="stu_isInClass"
								class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">否</option>
									<option value="1">是</option>
							</select></td>
						</tr>
						<tr>
							<td>进班时间：</td>
							<td><input class="easyui-textbox" id="stu_inClassTime33"
								name="stu_inClassTime"></td>
						</tr>
						<tr>
							<td>进班备注：</td>
							<td><input class="easyui-textbox" id="stu_inClassContent33"
								name="stu_inClassContent"></td>
						</tr>
						<tr>
							<td>咨询内容：</td>
							<td><input class="easyui-textbox" id="stu_AskerContent33"
								name="stu_AskerContent"></td>
						</tr>
						<tr>
							<td>是否删除：</td>
							<td><select id="stu_isDel33" name="stu_isDel"
								class="easyui-combobox">
									<option>--请选择--</option>
									<option value="0">否</option>
									<option value="1">是</option>
							</select></td>
						</tr>
						<tr>
							<td>退费时间：</td>
							<td><input class="easyui-textbox"
								id="stu_ReturnMoneyReason33" name="stu_ReturnMoneyReason"></td>
						</tr>
						<tr>
							<td>定金金额：</td>
							<td><input class="easyui-textbox" id="stu_preMoney33"
								name="stu_preMoney"></td>
						</tr>
						<tr>
							<td>定金时间：</td>
							<td><input class="easyui-textbox" id="stu_preMoneyTime33"
								name="stu_preMoneyTime"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- 设置隐藏列 -->
	<div id="lie_window" class="easyui-dialog"
		data-options="title:'设置显示列',modal:true,closed:'true'"
		style="width: 200px"></div>
</body>
</html>