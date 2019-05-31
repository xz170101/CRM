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
		var userName  ='<%=session.getAttribute("userName")%>';
		$("#stuTab").datagrid({
			url:"selectCon",
			method:"post",			
			fitColumns:true,
	        pagination:true,
	        rownumbers:true, 
	        toolbar:"#tb",
	        queryParams:{				
				//要发送的参数列表
				UserName:userName,
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
			return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='lookStu(" + index + ")'>查看</a>   <a href='javascript:void(0)' style='cursor: pointer;' onclick='genzong(" + index + ")'>跟踪</a>    <a href='javascript:void(0)' style='cursor: pointer;' onclick='updateStu(" + index + ")'>编辑</a>       <a href='javascript:void(0)' style='cursor: pointer;' onclick='sturizhi(" + index + ")'>跟踪日志</a>";
		}	
	 
		function formatterSex(value, row, index){
			return value==0? '男':'女';
		}
		
		//是否有效
		function formatterIsValid(value, row, index){
			var valid='';
			if(row.stu_isValid==0){
				valid='否';
			}else if(row.stu_isValid==1){
				valid='是';
			}else if(row.stu_isValid==2){
				valid='待定';
			}	
			return valid;
		}
		//回访情况
		function formatterIsReturnVist(value, row, index){
			return value==0? '未回访':'已回访';
		}
		function formatterIsHome(value, row, index){
			return value==0? '否':'是';
		}
		//是否缴费
		function formatterIsPay(value, row, index){
			return value==0? '未缴费':'已缴费';
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
			$('#stu_Sex2').textbox('setValue',row.stu_Sex==1?'男':'女');//用三元表达式设置值
			$('#stu_isBaoBei2').textbox('setValue',row.stu_isBaoBei==1?"是":"否");
			$('#stu_isDel22').textbox('setValue',row.stu_isDel==1?"是":"否");
			$('#stu_isInClass22').textbox('setValue',row.stu_isInClass==1?"是":"否");
			$('#stu_isReturnMoney22').textbox('setValue',row.stu_isReturnMoney==1?"是":"否");
			$('#stu_isPay22').textbox('setValue',row.stu_isPay==1?"是":"否");
			$('#stu_isHome22').textbox('setValue',row.stu_isHome==1?"是":"否");
			$('#stu_isReturnVist22').textbox('setValue',row.stu_isReturnVist==1?"是":"否");
			$('#stu_isValid22').textbox('setValue',row.stu_isValid==0?row.stu_isValid==1?"是":"否":'待定');
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
			$('#stu_Sex3').textbox('setValue',row.stu_Sex==1?'男':'女');//用三元表达式设置值
			$('#stu_isBaoBei3').textbox('setValue',row.stu_isBaoBei==1?"是":"否");
			$('#stu_isDel33').textbox('setValue',row.stu_isDel==1?"是":"否");
			$('#stu_isInClass33').textbox('setValue',row.stu_isInClass==1?"是":"否");
			$('#stu_isReturnMoney33').textbox('setValue',row.stu_isReturnMoney==1?"是":"否");
			$('#stu_isPay33').textbox('setValue',row.stu_isPay==1?"已缴费":"未缴费");
			$('#stu_isHome33').textbox('setValue',row.stu_isHome==1?"是":"否");
			$('#stu_isReturnVist33').textbox('setValue',row.stu_isReturnVist==1?"已回访":"未回访");
			$('#stu_isValid33').textbox('setValue',row.stu_isValid==0?row.stu_isValid==1?"是":"否":'待定');
			$('#stusid').next().hide();//隐藏编号的字段
			$('#stu_Status3').combobox('setValue',row.stu_Status);//显示选中的学历
			$('#stu_PerState3').combobox('setValue',row.stu_PerState);//显示选中的状态
			$('#stu_SourceUrl3').combobox('setValue',row.stu_SourceUrl);//显示选中的来源渠道
			$('#stu_NetPusherld3').combobox('setValue',row.stu_NetPusherld);//显示选中的来源网站
			$('#stu_FromPart3').combobox('setValue',row.stu_FromPart);//显示选中的来源部门
			$('#stu_Address3').combobox('setValue',row.stu_Address);//显示选中的地址
			$('#stu_LearnForward33').combobox('setValue',row.stu_LearnForward);//显示选中的课程方向
			$('#sexitInte33').combobox('setValue',row.sexitInte);//显示选中的打分
			$('#stu_stuConcern3').combobox('setValue',row.stu_stuConcern);//显示选中的学员关注
			$('#editStu').dialog('open');
		}
		
		//修改后的数据的提交
		function editsave() {
			var valid=$("#stu_isValid33").combobox("getValue");
			if(valid=='否'){
				valid=0;
			}if(valid=='是'){
				valid=1;
			}if(valid=='待定'){
				valid=2;
			}
			/* if(!(/^(13|14|15|17|18)\d{9}$/.test(stu_Phone3))){
				 $.messager.alert("提示","手机号码格式有误，请重新输入！");
	                return false;
	            } */
			
			$.ajax({
				url:'updateStu',
				method:'post',
				dataType:'json',
				data:{
					 stu_id:$("#stusid").textbox("getValue"),
					 stu_Name:$("#stu_Name3").textbox("getValue"),
					 stu_Sex:($("#stu_Sex3").combobox("getValue")=='男'?0:1),
					 stu_Age:$("#stu_Age3").numberbox("getValue"),
					 stu_Phone:$("#stu_Phone3").textbox("getValue"),					
					 stu_Status:$("#stu_Status3").combobox("getValue"), 
					 stu_PerState:$("#stu_PerState3").combobox("getValue"),
					 stu_SourceUrl:$("#stu_SourceUrl3").combobox("getValue"),
					 stu_NetPusherld:$("#stu_NetPusherld3").combobox("getValue"),
					 stu_SourceKeyWord:$("#stu_SourceKeyWord3").textbox("getValue"),
					 stu_Address:$("#stu_Address3").combobox("getValue"),					 
					 stu_stuConcern:$("#stu_stuConcern3").combobox("getValue"),
					 stu_FromPart:$("#stu_FromPart3").combobox("getValue"),
					stu_qq:$("#stu_qq3").textbox("getValue"),
					stu_WeiXin:$("#stu_WeiXin3").textbox("getValue"),			
					stu_isBaoBei:($("#stu_isBaoBei3").combobox("getValue")=='是'?1:0),								
					stu_LearnForward:$("#stu_LearnForward33").combobox("getValue"),
					sexitInte:$("#sexitInte33").combobox("getValue"),
					stu_isValid:valid,
					stu_LostValid:$("#stu_LostValid33").textbox("getValue"),					
					stu_isReturnVist:($("#stu_isReturnVist33").combobox("getValue")=='已回访'?1:0),
					stu_isHome:($("#stu_isHome33").combobox("getValue")=='是'?1:0),
					stu_HomeTime:$("#stu_HomeTime33").datebox("getValue"),
					stu_firstVisitTime:$("#stu_firstVisitTime33").datebox("getValue"),
					stu_preMoney:$("#stu_preMoney33").numberbox("getValue"),
					stu_preMoneyTime:$("#stu_preMoneyTime33").datebox("getValue"),
					stu_ReturnMoneyReason:$("#stu_ReturnMoneyReason33").textbox("getValue"),					
					stu_isPay:($("#stu_isPay33").combobox("getValue")=='已缴费'?1:0),
					stu_PayTime:$("#stu_PayTime33").datebox("getValue"),
					stu_Money:$("#stu_Money33").numberbox("getValue"),		
					stu_isReturnMoney:($("#stu_isReturnMoney33").combobox("getValue")=='是'?1:0),			
					stu_isInClass:($("#stu_isInClass33").combobox("getValue")=='是'?1:0),	
					stu_inClassTime:$("#stu_inClassTime33").datebox("getValue"),			
					stu_inClassContent:$("#stu_inClassContent33").textbox("getValue"), 
					stu_AskerContent:$("#stu_AskerContent33").textbox("getValue")									
				},
				success:function(res){
					if(res>0){
						$.messager.alert('提示','修改成功');
						$('#stuTab').datagrid('reload');
						$('#editStu').dialog('close');
					}else{
						$.messager.alert('提示','修改失败');
					}
				}
			})
		}
		//修改的关闭
		function editStuclose(){
			$('#editStu').dialog('close');
		}
		
		//对学生进行后续跟踪
		function genzong(index){
			var data=$('#stuTab').datagrid('getData');
			var row=data.rows[index];
			$('#insertFollowForm').form("load",row);
			$('#studentId').next().hide();//让学生编号的文本框进行隐藏
			$('#insertFollow').dialog('open');
		}
		//对具体某一个学生进行跟踪数据的提交
		function insertFollowsave(){
			$.ajax({
				url:'insertFollows',
				method:'post',
				dataType:'json',
				data:{
					stu_Id:$('#studentId').textbox('getValue'),
					followTime:$('#followtime').datebox('getValue'),
					followState:$('#followstate').textbox('getValue'),
					followType:$('#followtype').textbox('getValue'),
					nextFollowTime:$('#nextfollowtime').datebox('getValue'),
					conTent:$('#content').textbox('getValue')
				},
				success:function(res){
					if(res>0){
						$.messager.alert('提示','添加成功');
						$('#stuTab').datagrid('reload');
						$('#insertFollow').dialog('close');
					}else{
						$.messager.alert('提示','添加失败');
					}
				}
			})
		}
		//跟踪的关闭
		function insertFollowclose(){
			$("#insertFollow").dialog("close");
		}
		
		function formatterfollowTime(value, row, index){
			return row.netFollows.followTime;
		}
		function formatterContent(value, row, index){
			return row.netFollows.conTent;
		}
		function formatternextTime(value, row, index){
			return row.netFollows.nextFollowTime;
		}
		function formattercaozuo(value, row, index){ 
			return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='lookcontent(" + index + ")'>查看</a>";
		}
		//查看日志的打开
		function sturizhi(index){
			var data = $("#stuTab").datagrid("getData");
			var row = data.rows[index];
				$("#dg").datagrid({
					url:"selectlog",
					method:"post",
					pagination:true,
					queryParams:{
						stu_id:row.stu_id
					}
				})			
			$("#looklog").dialog("open");
		}
		//查看日志的关闭
		function logclose(){
			$("#looklog").dialog("close");
		}  
		//跟踪日志的查看
		function lookcontent(index){
			var data=$('#dg').datagrid('getData');
			var row=data.rows[index];
			$('#lookFollowForm').form('load',row);
			$('#lookFollows').window('open');		
		} 
		
		//跟踪日志的查看的关闭
		function Followclose(){
			$('#lookFollows').dialog('close');
		}
		
		//即时通讯
		var userName  ='<%=session.getAttribute("userName")%>';
		var webscoket=new WebSocket("ws://47.102.125.51:8080/CRM/NetworkConsultant/"+userName);
		webscoket.onopen=function(){
			console.log("连接建立");
		}
		webscoket.onclose=function(){
			console.log("连接关闭了");
		}
		webscoket.onmessage=function(event){
			alert(event.data);
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
				<th data-options="field:'stu_ZiXunName'">咨询师</th>
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
			 	<option></option>
				<option value="0">未缴费</option>
				<option value="1">已缴费</option>
			</select> 是否有效:<select id="isvalid" class="easyui-combobox"
				style="height: auto;">
				<option></option>
				<option value="0">无效</option>
				<option value="1">有效</option>
			</select> 是否回访:<select id="isreturnvist" class="easyui-combobox"
				style="height: auto;">
				<option></option>
				<option value="0">未回访</option>
				<option value="1">已回访</option>
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
		<form id="lookStuForm11" class="easyui-form">
			<table cellpadding="5">
				<tr>
					<td>姓名:</td>
					<td><input readonly class="easyui-textbox" name="stu_Name"></td>
					<td>性别:</td>
					<td><input readonly class="easyui-textbox" name="stu_Sex"
						id="stu_Sex2"></td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td><input readonly class="easyui-textbox" name="stu_Age"></td>
					<td>电话:</td>
					<td><input readonly class="easyui-textbox" name="stu_Phone"></td>
				</tr>
				<tr>
					<td>学历:</td>
					<td><input readonly class="easyui-textbox" name="stu_Status"></td>
					<td>状态:</td>
					<td><input readonly class="easyui-textbox" name="stu_PerState"></td>
				</tr>
				<tr>
					<td>来源渠道:</td>
					<td><input readonly class="easyui-textbox"
						name="stu_SourceUrl"></td>
					<td>来源网站:</td>
					<td><input readonly class="easyui-textbox"
						name="stu_NetPusherld"></td>
				</tr>
				<tr>
					<td>来源关键字:</td>
					<td><input readonly class="easyui-textbox"
						name="stu_SourceKeyWord"></td>
					<td>所在区域:</td>
					<td><input readonly class="easyui-textbox" name="stu_Address"></td>
				</tr>
				<tr>
					<td>学员关注:</td>
					<td><input readonly class="easyui-textbox"
						name="stu_stuConcern"></td>
					<td>来源部门:</td>
					<td><input readonly class="easyui-textbox" name="stu_FromPart"></td>
				</tr>
				<tr>
					<td>qq:</td>
					<td><input readonly class="easyui-textbox" name="stu_qq"></td>
					<td>微信:</td>
					<td><input readonly class="easyui-textbox" name="stu_WeiXin"></td>
				</tr>
				<tr>
					<td>是否报备:</td>
					<td><input readonly class="easyui-textbox" name="stu_isBaoBei"
						id="stu_isBaoBei2"></td>
					<td>录入人:</td>
					<td><input readonly class="easyui-textbox"
						name="stu_CreateUser"></td>
				</tr>
			</table>
		</form>

		<form id="lookStuForm22" class="easyui-form">
			<table cellpadding="5">
				<tr>
					<td>咨询师：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_ZiXunName"></td>
					<td>课程方向：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_LearnForward"></td>
				</tr>
				<tr>
					<td>打分：</td>
					<td><input readonly class="easyui-textbox" name="sexitInte"></td>
					<td>是否有效：</td>
					<td><input readonly class="easyui-textbox" name="stu_isValid"
						id="stu_isValid22"></td>
				</tr>
				<tr>
					<td>是否回访：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_isReturnVist" id="stu_isReturnVist22"></td>
					<td>是否上门：</td>
					<td><input readonly class="easyui-textbox" name="stu_isHome"
						id="stu_isHome22"></td>
				</tr>
				<tr>
					<td>上门时间：</td>
					<td><input readonly class="easyui-textbox" name="stu_HomeTime"></td>
					<td>无效原因：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_LostValid"></td>
				</tr>
				<tr>
					<td>是否缴费：</td>
					<td><input readonly class="easyui-textbox" name="stu_isPay"
						id="stu_isPay22"></td>
					<td>缴费时间：</td>
					<td><input readonly class="easyui-textbox" name="stu_PayTime"></td>
				</tr>
				<tr>
					<td>缴费金额：</td>
					<td><input readonly class="easyui-textbox" name="stu_Money"></td>
					<td>是否退费：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_isReturnMoney" id="stu_isReturnMoney22"></td>
				</tr>
				<tr>
					<td>是否进班：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_isInClass" id="stu_isInClass22"></td>
					<td>进班时间：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_inClassTime"></td>
				</tr>
				<tr>
					<td>进班备注：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_inClassContent"></td>
					<td>咨询内容：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_AskerContent"></td>
				</tr>
				<tr>
					<td>是否删除：</td>
					<td><input readonly class="easyui-textbox" name="stu_isDel"
						id="stu_isDel22"></td>
					<td>咨询师：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_ZiXunName"></td>
				</tr>
				<tr>
					<td>退费时间：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_ReturnMoneyReason"></td>
					<td>定金金额：</td>
					<td><input readonly class="easyui-textbox" name="stu_preMoney"></td>
				</tr>
				<tr>
					<td>定金时间：</td>
					<td><input readonly class="easyui-textbox"
						name="stu_preMoneyTime"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 修改窗体 -->
	<div id="editStu" class="easyui-dialog" title="修改学生信息"
		style="width: 635px; height: 650px;"
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
			handler:function(){editStuclose()}
		}]">
		<form id="editStuForm11" class="easyui-form">
			<table cellpadding="5">
				<tr>
					<td><input class="easyui-textbox" id="stusid" name="stu_id" /></td>
				</tr>
				<tr>
					<td>姓名:</td>
					<td><input class="easyui-textbox" id="stu_Name3"
						name="stu_Name"></td>
					<td>性别:</td>
					<td><select id="stu_Sex3" class="easyui-combobox">
							<option>--请选择--</option>
							<option value="0">男</option>
							<option value="1">女</option>
					</select></td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td><input class="easyui-numberbox" id="stu_Age3"
						name="stu_Age"></td>
					<td>电话:</td>
					<td><input class="easyui-textbox" id="stu_Phone3"
						name="stu_Phone"></td>
				</tr>

				<tr>
					<td>学历:</td>
					<td><select id="stu_Status3" name="stu_Status"
						class="easyui-combobox" style="width: 100px;">
							<option value="未知">未知</option>
							<option value="大专">大专</option>
							<option value="高中">高中</option>
							<option value="中专">中专</option>
							<option value="初中">初中</option>
							<option value="本科">本科</option>
							<option value="其他">其他</option>
					</select></td>
					<td>状态:</td>
					<td><select id="stu_PerState3" name="stu_PerState"
						class="easyui-combobox" style="width: 100px;">
							<option value="未知">未知</option>
							<option value="待业">待业</option>
							<option value="在职">在职</option>
							<option value="在读">在读</option>
					</select></td>
				</tr>

				<tr>
					<td>来源渠道:</td>
					<td><select id="stu_SourceUrl3" name="stu_SourceUrl"
						class="easyui-combobox" style="width: 100px;">
							<option value="未知">未知</option>
							<option value="百度">百度</option>
							<option value="百度移动端">百度移动端</option>
							<option value="360">360</option>
							<option value="360移动端">360移动端</option>
							<option value="搜狗移动端">搜狗移动端</option>
							<option value="uc移动端">uc移动端</option>
							<option value="直接输入">直接输入</option>
							<option value="自然流量">自然流量</option>
							<option value="直电">直电</option>
							<option value="微信">微信</option>
							<option value="qq">qq</option>
					</select></td>
					<td>来源网站:</td>
					<td><select id="stu_NetPusherld3" name="stu_NetPusherld"
						class="easyui-combobox" style="width: 100px;">
							<option value="其他">其他</option>
							<option value="职英b站">职英b站</option>
							<option value="高考站">高考站</option>
							<option value="职英a站">职英a站</option>
					</select></td>
				</tr>
				<tr>
					<td>来源关键字:</td>
					<td><input class="easyui-textbox" id="stu_SourceKeyWord3"
						name="stu_SourceKeyWord"></td>
					<td>所在区域:</td>
					<td><select id="stu_Address3" name="stu_Address"
						class="easyui-combobox" style="width: 100px;">
							<option value="未知">未知</option>
							<option value="其他">其他</option>
							<option value="郑州">郑州</option>
							<option value="开封">开封</option>
							<option value="洛阳">洛阳</option>
							<option value="南阳">南阳</option>
							<option value="漯河">漯河</option>
							<option value="三门峡">三门峡</option>
							<option value="平顶山">平顶山</option>
							<option value="周口">周口</option>
							<option value="驻马店">驻马店</option>
							<option value="新乡">新乡</option>
							<option value="鹤壁">鹤壁</option>
							<option value="焦作">焦作</option>
							<option value="濮阳">濮阳</option>
							<option value="安阳">安阳</option>
							<option value="商丘">商丘</option>
							<option value="信阳">信阳</option>
							<option value="济源">济源</option>
					</select></td>
				</tr>

				<tr>
					<td>学员关注:</td>
					<td><select id="stu_stuConcern3" name="stu_stuConcern"
						class="easyui-combobox" style="width: 100px;">
							<option value="课程">课程</option>
							<option value="学费">学费</option>
							<option value="学时">学时</option>
							<option value="学历">学历</option>
							<option value="师资">师资</option>
							<option value="就业">就业</option>
							<option value="环境">环境</option>
							<option value="其他">其他</option>
					</select></td>
					<td>来源部门:</td>
					<td><select id="stu_FromPart3" name="stu_FromPart"
						class="easyui-combobox" style="width: 100px;">
							<option value="网络">网络</option>
							<option value="市场">市场</option>
							<option value="教质">教质</option>
							<option value="学术">学术</option>
							<option value="就业">就业</option>

					</select></td>
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
					<td>课程方向：</td>
					<td><select id="stu_LearnForward33" name="stu_LearnForward"
						class="easyui-combobox" style="width: 100px;">
							<option value="软件开发">软件开发</option>
							<option value="软件设计">软件设计</option>
							<option value="网络营销">网络营销</option>

					</select></td>
				</tr>
			</table>
		</form>

		<form id="editStuForm22" class="easyui-form">
			<table cellpadding="5">

				<tr>
					<td>打分：</td>
					<td><select id="sexitInte33" name="sexitInte"
						class="easyui-combobox" style="width: 100px;">
							<option value="近期可报名">近期可报名</option>
							<option value="一个月内可报名">一个月内可报名</option>
							<option value="长期跟踪">长期跟踪</option>
							<option value="无效">无效</option>
					</select></td>
					<td>是否有效：</td>
					<td><select id="stu_isValid33" name="stu_isValid"
						class="easyui-combobox">
							<option>--请选择--</option>
							<option value="0">无效</option>
							<option value="1">有效</option>
							<option value="2">待定</option>
					</select></td>
				</tr>

				<tr>
					<td>无效原因：</td>
					<td><input class="easyui-textbox" id="stu_LostValid33"
						name="stu_LostValid"></td>
					<td>是否回访：</td>
					<td><select id="stu_isReturnVist33" name="stu_isReturnVist33"
						class="easyui-combobox">
							<option>--请选择--</option>
							<option value="0">未回访</option>
							<option value="1">已回访</option>
					</select></td>
				</tr>

				<tr>
					<td>首访时间：</td>
					<td><input class="easyui-datebox" id="stu_firstVisitTime33"
						name="stu_firstVisitTime"></td>
					<td>是否上门：</td>
					<td><select id="stu_isHome33" name="stu_isHome"
						class="easyui-combobox">

							<option value="0">否</option>
							<option value="1">是</option>
					</select></td>
				</tr>

				<tr>
					<td>上门时间：</td>
					<td><input class="easyui-datebox" id="stu_HomeTime33"
						name="stu_HomeTime"></td>
					<td>定金金额：</td>
					<td><input class="easyui-numberbox" id="stu_preMoney33"
						name="stu_preMoney"></td>
				</tr>

				<tr>
					<td>定金时间：</td>
					<td><input class="easyui-datebox" id="stu_preMoneyTime33"
						name="stu_preMoneyTime"></td>
					<td>是否缴费：</td>
					<td><select id="stu_isPay33" name="stu_isPay"
						class="easyui-combobox">
							<option value="0">未缴费</option>
							<option value="1">已缴费</option>
					</select></td>
				</tr>

				<tr>
					<td>缴费时间：</td>
					<td><input class="easyui-datebox" id="stu_PayTime33"
						name="stu_PayTime"></td>
					<td>缴费金额：</td>
					<td><input class="easyui-numberbox" id="stu_Money33"
						name="stu_Money"></td>
				</tr>

				<tr>
					<td>是否退费：</td>
					<td><select id="stu_isReturnMoney33" name="stu_isReturnMoney"
						class="easyui-combobox">

							<option value="0">否</option>
							<option value="1">是</option>
					</select></td>
					<td>退费原因：</td>
					<td><input class="easyui-textbox" id="stu_ReturnMoneyReason33"
						name="stu_ReturnMoneyReason"></td>
				</tr>

				<tr>
					<td>是否进班：</td>
					<td><select id="stu_isInClass33" name="stu_isInClass"
						class="easyui-combobox">
							<option>--请选择--</option>
							<option value="0">否</option>
							<option value="1">是</option>
					</select></td>
					<td>进班时间：</td>
					<td><input class="easyui-datebox" id="stu_inClassTime33"
						name="stu_inClassTime"></td>
				</tr>

				<tr>
					<td>进班备注：</td>
					<td><input class="easyui-textbox" id="stu_inClassContent33"
						name="stu_inClassContent"></td>

					<td>咨询备注：</td>
					<td><input class="easyui-textbox" id="stu_AskerContent33"
						name="stu_AskerContent"></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 设置隐藏列 -->
	<div id="lie_window" class="easyui-dialog"
		data-options="title:'设置显示列',modal:true,closed:'true'"
		style="width: 200px"></div>

	<!-- 对学生进行跟踪 -->
	<div id="insertFollow" class="easyui-dialog" title="添加跟踪信息"
		style="width: 400px; height: 300px;"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'保存',
				handler:function(){insertFollowsave()}
			},{
				text:'关闭',
				handler:function(){insertFollowclose()}
			}]">

		<form id="insertFollowForm" class="easyui-form">
			<table cellpadding="5">
				<input class="easyui-textbox" id="studentId" name="stu_id" />
				<tr>
					<td>回访时间：</td>
					<td><input class="easyui-datebox" id="followtime"></td>
				</tr>
				<tr>
					<td>回访情况：</td>
					<td><input class="easyui-textbox" id="content"></td>
				</tr>
				<tr>
					<td>跟踪方式：</td>
					<td><input class="easyui-textbox" id="followtype"></td>
				</tr>
				<tr>
					<td>下次跟踪时间：</td>
					<td><input class="easyui-datebox" id="nextfollowtime"></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td><input class="easyui-textbox" id="followstate"></td>
				</tr>

			</table>
		</form>
	</div>
	<!-- 日志log -->
	<div id="looklog" class="easyui-dialog" title="查看跟踪日志"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'关闭',
				handler:function(){logclose()}
			}]">
		<table id="dg" class="easyui-datagrid"
			style="width: 400px; height: 250px" data-options="fitColumns:true">
			<thead>
				<tr>
					<th data-options="field:'stu_id'">编码</th>
					<th data-options="field:'stu_Name'">姓名</th>
					<th data-options="field:'followTime',formatter:formatterfollowTime">追踪时间</th>
					<th
						data-options="field:'nextFollowTime',formatter:formatternextTime">下次追踪时间</th>
					<th data-options="field:'conTent',formatter:formatterContent">内容</th>
					<th data-options="field:'caozuo',formatter:formattercaozuo">操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 对学生进行跟踪 -->
	<div id="lookFollows" class="easyui-dialog" title="查看跟踪信息"
		style="width: 400px; height: 300px;"
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'关闭',
				handler:function(){Followclose()}
			}]">

		<form id="lookFollowForm" class="easyui-form">
			<table cellpadding="5">
				<tr>
					<td>内容：</td>
					<td><input class="easyui-textbox" name="conTent"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>