<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有学生</title>
 		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script>
	$(function(){		
		init();
		kaiqi();
		$("#zixunname").combobox({
			url:'selectzixunname',
			method:'post',
			valueField:'askers_Name',
			textField:'askers_Name'
		});			
	})
	//开启分量
	function kaiqi() {
		var kaiguan = $("#fen").val();	
		if (kaiguan ==true || kaiguan != ""||kaiguan ==false) {
			if (kaiguan==true) {
				kaiguan=true;
			} else {
				kaiguan = false;
			}
		} else {
			kaiguan = false;
		} 
		$('#fenliang').switchbutton({
			checked : kaiguan,
			onChange : function(checked) {
				$.messager.confirm("提示", "你确定开启自动分量吗？", function(r) {
					if (r) {
						$.ajax({
							url : "fenliang",
							type : "post",
							dataType : "json",
							data : {
								checked : checked
							},
							success : function(res) {
								alert("开启成功");
							}
						})
					}
				})				//
			}
		})
	}
	//查看日志的打开
	function looklogf(index){
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
	
	
	
	function init(){
		$("#stuTab").datagrid({
			url:"selectStudent",
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
	
	function formatterfollowTime(value, row, index){
		alert(row.netFollows);
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
	
	function formatterStu(value, row, index){ 
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='lookStu(" + index + ")'>查看</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='genzongStu(" + index + ")'>跟踪</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='updateStu(" + index + ")'>编辑</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='deleteStu(" + index + ")'>删除</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='looklogf(" + index + ")'>跟踪日志</a>";
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
		
	//删除方法
	function deleteStu(index){
		$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
			if(r) {
				//获取datagrid对应的json对象集合（再来一遍）。
				var data = $("#stuTab").datagrid("getData");
				//获取第index行对应的json对象（再来一遍）。
				var row = data.rows[index];
				$.post("deletestu", {
					stu_id: row.stu_id,					
				}, function(res) {
					var res = eval("(" + res + ")");
					if(res>0) {
						alert("删除成功");
						$("#stuTab").datagrid("load");
					}
				});
			}
		});
	}
	
	//添加客户
	//打开添加窗口
	 function addStu(){		
		$("#insertStu").dialog("open");			
	} 
	//添加窗口的保存
	 function insertsave(){	
			//获取id参数
			var stu_Name1= $("#stu_Name1").textbox("getValue");
			var stu_Sex1 = $("#stu_Sex1").combobox("getValue");
			var stu_Age1= $("#stu_Age1").textbox("getValue");
			var stu_Phone1= $("#stu_Phone1").textbox("getValue");					
			var stu_Status1= $("#stu_Status1").combobox("getValue");//学历
			var stu_PerState1= $("#stu_PerState1").combobox("getValue");
			var stu_SourceUrl1= $("#stu_SourceUrl1").combobox("getValue");
			var stu_SourceKeyWord1 = $("#stu_SourceKeyWord1").textbox("getValue");
			var stu_qq1= $("#stu_qq1").textbox("getValue");
			var stu_WeiXin= $("#stu_WeiXin").textbox("getValue");					
			var stu_isBaoBei1= $("#stu_isBaoBei1").combobox("getValue");
			var stu_inClassContent1= $("#stu_inClassContent1").textbox("getValue");	
			//提交到添加的controller
				$.post("insertstu", {
					stu_Name:stu_Name1,
					stu_Sex:stu_Sex1,
					stu_Age:stu_Age1,
					stu_Phone:stu_Phone1,
					stu_Status:stu_Status1,
					stu_PerState:stu_PerState1,
					stu_SourceUrl:stu_SourceUrl1,
					stu_SourceKeyWord:stu_SourceKeyWord1,
					stu_qq:stu_qq1,
					stu_WeiXin:stu_WeiXin,
					stu_isBaoBei:stu_isBaoBei1,
					stu_inClassContent:stu_inClassContent1
						},
						function(res) {
							var res=eval("("+res+")");
							if(res>0) {
								$("#stuTab").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
								$("#insertStu").dialog("close");
								$.messager.alert("消息提示","添加成功"); 					
							} else {
								$.messager.alert("消息提示","添加失败");
							}
						}, "json");
			} 
	//添加页面的关闭
	 function insertclose(){
		$("#insertStuForm").form("clear");
		$("#insertStu").dialog("close");
	}
	
	 
	//批量操作，对咨询师名字的修改
		function piliang(){	
			$("#zixunname").combobox({
				url:'selectzixunname',
				method:'post',
				valueField:'askers_Name',
				textField:'askers_Name'
			});
			var row=$("#stuTab").datagrid("getSelections");
			if(row==false){//判断如果没有选中的行则提示
			alert("请选中要修改的行的复选框");
		}else{//如果有选中的行就弹出弹框
			if($("#stuTab").datagrid("getSelected").stu_ZiXunName!=null){
				alert('该客户已经有咨询师进行跟踪！');
			}else{
				$('#updateziXunName').dialog('open');
			}
		} 
			
		}
		//修改咨询师名字弹框的关闭
		function updateziXunNameclose() {
			$('#updateziXunName').dialog('close');
		}
		
		
		//咨询师名字修改后的数据的提交
		function updatezixunnamesave() {						
			var stu_id=[];
			var rows = $("#stuTab").datagrid("getSelections"); // 获取所有选中的行
			 $(rows).each(function(){
				 stu_id.push(this.stu_id);    
		     });
			$.ajax({
				url:'updatezixunname',
				method:'post',
				dataType:'json',
				data:{
					stu_id:stu_id.toString(),
					stu_ZiXunName:$('#zixunanme').combobox('getValue')
				},
				success:function(res){
					if(res>0){
						$.messager.alert('提示','修改成功');
						$('#stuTab').datagrid('reload');
						$('#updateziXunName').dialog('close');
					}else{
						$.messager.alert('提示','修改失败');
					}
				}
			})

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
		
		//修改打开
		function updateStu(index){
			var data=$('#stuTab').datagrid('getData');
			var row=data.rows[index];
			$('#editStuForm11').form("load",row);
			$('#editStuForm22').form("load",row);
			$('#stu_Sex3').textbox('setValue',row.stu_Sex==1?'男':'女');//用三元表达式设置值
			$('#stu_isBaoBei3').textbox('setValue',row.stu_isBaoBei==1?"是":"否");
			$('#stu_isDel33').textbox('setValue',row.stu_isDel==1?"是":"否");
			$('#stu_isInClass33').textbox('setValue',row.stu_isInClass==1?"是":"否");
			$('#stu_isReturnMoney33').textbox('setValue',row.stu_isReturnMoney==1?"是":"否");
			$('#stu_isPay33').textbox('setValue',row.stu_isPay==1?"已缴费":"未缴费");
			$('#stu_isHome33').textbox('setValue',row.stu_isHome==1?"是":"否");
			$('#stu_isReturnVist33').textbox('setValue',row.stu_isReturnVist==1?"已回访":"未回访");
			$('#stu_isValid33').textbox('setValue',row.stu_isValid==0?row.stu_isValid==1?"是":"否":'待定');
			/* $('#s_idu').next().hide();//隐藏编号的字段
	$('#s_stustatusu').combobox('select',row.s_stustatus);//显示选中的学历
	$('#s_perstatusu').combobox('select',row.s_perstatus);//显示选中的状态
	$('#s_sourceurlu').combobox('select',row.s_sourceurl);//显示选中的来源渠道
	$('#s_netpusheridu').combobox('select',row.s_netpusherid);//显示选中的来源网站
	$('#s_frompartu').combobox('select',row.s_frompart);//显示选中的来源部门
	$('#s_addressu').combobox('select',row.s_address);//显示选中的地址
	$('#s_learnforwardu').combobox('select',row.s_learnforward);//显示选中的课程方向
	$('#s_gradeu').combobox('select',row.s_grade);//显示选中的打分
	$('#s_stuconcernu').combobox('select',row.s_stuconcern);//显示选中的学员关注
	$('#s_zixunnameu').combobox({//动态获取咨询师下拉框的 值
		url:'/CRM/selectAskers',  
		method:'post',
	    valueField:'askername',    
	    textField:'askername'   
	})
	$('#s_zixunnameu').combobox('select',row.s_zixunname);//显示选中的咨询师 */
			
			$('#editStu').dialog('open');
		}
		
		//修改后的数据的提交
		function editsave() {			
		/* 	var rows = $("#stuTab").datagrid("getSelections");  */// 获取所有选中的行
			var valid=$("#stu_isValid33").combobox("getValue");
			if(valid=='否'){
				valid=0;
			}else if(valid=='是'){
				valid=1;
			}else if(valid=='待定'){
				valid=2;
			}
			alert($("#stusid").textbox("getValue"));
			alert($("#stu_isInClass33").combobox("getValue")); 
			$.ajax({
				url:'updateStudent',
				method:'post',
				dataType:'json',
				data:{
					stu_id:$("#stusid").textbox("getValue"),
					/* stu_Name:$("#stu_Name3").textbox("getValue"),
					stu_Sex:($("#stu_Sex3").combobox("getValue")=='男'?1:0),
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
					stu_isBaoBei:$("#stu_isBaoBei3").combobox("getValue"),
					//stu_ZiXunName:$("#stu_ZiXunName3").textbox("getValue"),
					stu_CreateUser:$("#stu_CreateUser3").textbox("getValue"),										
					stu_LearnForward:$("#stu_LearnForward33").combobox("getValue"),
					sexitInte:$("#sexitInte33").combobox("getValue"),
					stu_isValid:valid,
					stu_LostValid:$("#stu_LostValid33").textbox("getValue"),					
					stu_isReturnVist:$("#stu_isReturnVist33").combobox("getValue"),
					stu_isHome:$("#stu_isHome33").combobox("getValue"),
					stu_HomeTime:$("#stu_HomeTime33").datebox("getValue"),
					stu_firstVisitTime:$("#stu_firstVisitTime33").datebox("getValue"),
					stu_preMoney:$("#stu_preMoney33").numberbox("getValue"),
					stu_preMoneyTime:$("#stu_preMoneyTime33").datebox("getValue"),
					stu_ReturnMoneyReason:$("#stu_ReturnMoneyReason33").textbox("getValue"),					
					stu_isPay:$("#stu_isPay33").combobox("getValue"),*/
					stu_PayTime:$("#stu_PayTime33").datebox("getValue"),
					stu_Money:$("#stu_Money33").numberbox("getValue"),		
					stu_isReturnMoney:$("#stu_isReturnMoney33").combobox("getValue"),			
					stu_isInClass:$("#stu_isInClass33").combobox("getValue"),	
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
		function genzongStu(index){
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
 
		
		/*		
		设置隐藏列
		 */
		//打开设置隐藏列对话框
		 function selectColumn() {
			$("#hiddenColumn_dialog").dialog("open");
		}
		function saveColumn() {
			var cbx = $("#hiddenColumn_form input[type='checkbox']"); //获取Form里面是checkbox的Object
		    var checkedValue = "";
		    var unCheckValue = "";
		    for (var i = 0; i < cbx.length; i++) {
		        if (cbx[i].checked) {//获取已经checked的Object
		            if (checkedValue.length > 0) {
		                checkedValue += "," + cbx[i].value; //获取已经checked的value
		            }
		            else {
		                checkedValue = cbx[i].value;
		            }
		        }
		        if (!cbx[i].checked) {//获取没有checked的Object
		            if (unCheckValue.length > 0) {
		                unCheckValue += "," + cbx[i].value; //获取没有checked的value
		            }
		            else {
		                unCheckValue = cbx[i].value;
		            }
		        }
		    }
		    var checkeds = new Array();
		    if (checkedValue != null && checkedValue != "") {
		        checkeds = checkedValue.split(',');
		        for (var i = 0; i < checkeds.length; i++) {
		            $('#stuTab').datagrid('showColumn', checkeds[i]); //显示相应的列
		        }
		    }
		    var unChecks = new Array();
		    if (unCheckValue != null && unCheckValue != "") {
		        unChecks = unCheckValue.split(',');
		        for (var i = 0; i < unChecks.length; i++) {
		            $('#stuTab').datagrid('hideColumn', unChecks[i]); //隐藏相应的列
		        }
		    } 
		    $('#hiddenColumn_dialog').dialog('close');
		}
		//关闭设置隐藏列弹框
		function closed_hiddenColumn() {
			$('#hiddenColumn_dialog').dialog('close');
		}
		//全选按钮
		function ChooseAll() {
		   
		    var a=$("#isQuanXuan").text();//获取按钮的值
		    if("全选"==a.trim()){
		    	 $("#hiddenColumn_form input[type='checkbox']").prop("checked", true);//全选
		    	$('#isQuanXuan').linkbutton({ text:'全不选' });
		    }else{    	
		    	 $("#hiddenColumn_form input[type='checkbox']").removeAttr("checked", "checked");//取消全选
		    	 $('#isQuanXuan').linkbutton({ text:'全选' });
		    }		    
		}
		//设置隐藏列结束
		
		
		
		
		//导出excel表格
		function ExportForm() {
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
		//导出excel表格结束
		
	</script>
</head>
<body>
		<input type="hidden" value="${fenliang}" id="fen">
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
	 自动分量: <input class="easyui-switchbutton" id="fenliang" data-options="onText:'Yes',offText:'No'"><br/>
		<form id="sousuofrm" class="easyui-form">
			 客户姓名:<input class="easyui-textbox" id="sname"  style="width: 80px">
			 电话:<input class="easyui-textbox" id="phone"  style="width: 80px">
			 咨询师:<input class="easyui-textbox" id="zixunname"  style="width: 80px">			 				
			是否缴费:<select id="ispay" class="easyui-combobox" style="height: auto;">
						<option value="0">未缴费</option>
						<option value="1">已缴费</option>				
					</select> 
			是否有效:<select id="isvalid" class="easyui-combobox" style="height: auto;">
						<option value="0">否</option>
						<option value="1">是</option>
						<option value="2">待定</option>					
					</select> 
			是否回访:<select id="isreturnvist" class="easyui-combobox" style="height: auto;">
						<option value="0">未回访</option>
						<option value="1">已回访</option>					
					</select> 
			 QQ: <input class="easyui-textbox" id="qq"  style="width: 80px">			 
			  创建时间:<input class="easyui-datebox" id="creattime"  style="width: 80px">
			 上门时间:<input class="easyui-datebox" id="hometime"  style="width: 80px">
			 首次回访时间:<input class="easyui-datebox" id="firstvisittime"  style="width: 80px">			 
			  缴费时间:<input class="easyui-datebox" id="paytime"  style="width: 80px">
			 进班时间:<input class="easyui-datebox" id="inclasstime"  style="width: 80px">				
			 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="init()">查找</a>
			 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addStu()">添加</a>
			 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="piliang()">批量操作</a> 
			 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="selectColumn()">设置隐藏列</a>
			 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="ExportForm()">导出表格</a>	 
 			 <!-- <a href="javascript:void(0)" class="easyui-switchbutton" >分量开关</a> -->
 			<!--  <div>自动分量:<input class="easyui-switchbutton" onText="开" offText="关" id="sb"></div>	 
 			 -->
		</form>
	</div>
	<!-- 日志log -->
	 <div id="looklog" class="easyui-dialog" title="查看跟踪日志"  
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'关闭',
				handler:function(){logclose()}
			}]">
			<table id="dg" class="easyui-datagrid" style="width:400px;height:250px" data-options="fitColumns:true">   
			    <thead>   
			        <tr>   
			            <th data-options="field:'stu_id'">编码</th>   
			            <th data-options="field:'stu_Name'">姓名</th>   
			            <th data-options="field:'followTime',formatter:formatterfollowTime">追踪时间</th>
				        <th data-options="field:'nextFollowTime',formatter:formatternextTime">下次追踪时间</th>  
				        <th data-options="field:'conTent',formatter:formatterContent">内容</th>
						<th data-options="field:'caozuo',formatter:formattercaozuo">操作</th> 
			        </tr>   
			    </thead>   
			</table>			
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
	 
	<!-- 添加窗体 -->
	<div id="insertStu" class="easyui-dialog" title="添加客户" style="width:400px;height:500px;" 
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'保存',
				handler:function(){insertsave()}
			},{
				text:'关闭',
				handler:function(){insertclose()}
			}]">

	    <form id="insertStuForm" class="easyui-form">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>姓名：</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" ></td>
	    		</tr>
	    		<tr>
	    			<td>性别</td>
	    			<td>	    			
	    				<select id="stu_Sex1" class="easyui-combobox" style="width:100px;">   
							  <option>--请选择--</option> 
							   <option value="0">男</option> 
							    <option value="1">女</option> 
						</select> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>年龄：</td>
	    			<td><input class="easyui-textbox" id="stu_Age1" ></td>
	    		</tr>
	    		<tr>
	    			<td>电话：</td>
	    			<td><input class="easyui-textbox" id="stu_Phone1" ></td>
	    		</tr>
	    		<tr>
	    			<td>学历：</td>
	    			<td>
	    			<select id="stu_Status1" class="easyui-combobox" style="width:100px;">   
							  <option value="未知">未知</option> 
							  <option value="大专">大专</option> 
							  <option value="高中">高中</option> 
							  <option value="中专">中专</option> 
							  <option value="初中">初中</option> 
							  <option value="本科">本科</option> 
							  <option value="其他">其他</option> 
						</select> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>状态：</td>
	    			<td>
	    			<select id="stu_PerState1" class="easyui-combobox" style="width:100px;">   
							  <option value="未知">未知</option> 
							  <option value="待业">待业</option> 
							  <option value="在职">在职</option> 
							  <option value="在读">在读</option> 							  
						</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>来源渠道：</td>
	    			<td>
	    			<select id="stu_SourceUrl1" class="easyui-combobox" style="width:100px;">   
							  <option value="未知">未知</option> 
							  <option value="百度">百度</option> 
							  <option value="百度移动端">百度移动端</option> 
							  <option value="360">360</option> 
							  <option value="360移动端">360移动端</option> 
							  <option value="搜狗移动端">搜狗移动端</option> 
							  <option value="uc移动端">uc移动端</option> 
							  <option value="自然流量">自然流量</option> 
							  <option value="直电">直电</option> 
							  <option value="微信">微信</option> 
							  <option value="qq">qq</option> 
						</select> 
	    			<!-- <input class="easyui-textbox" id="stu_SourceUrl1"> --></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>来源关键字：</td>
	    			<td><input class="easyui-textbox" id="stu_SourceKeyWord1"></td>
	    		</tr>
	    		<tr>
	    			<td>QQ：</td>
	    			<td><input class="easyui-textbox" id="stu_qq1"></td>
	    		</tr>
	    		<tr>
	    			<td>微信号：</td>
	    			<td><input class="easyui-textbox" id="stu_WeiXin"></td>
	    		</tr>
	    		<tr>
	    			<td>是否报备：</td>
	    			<td>
	    			<select id="stu_isBaoBei1" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">是</option> 
						<option value="1">否</option>
	    			</select>
	    			</td>
	    			
	    		</tr>
	    		<tr>
	    			<td>在线备注：</td>
	    			<td><input class="easyui-textbox" id="stu_inClassContent1"></td>
	    		</tr>
	    	</table>
	    </form>
	</div> 	
	<!-- 批量修改咨询师 -->
	<div id="updateziXunName" class="easyui-dialog" title="手动分量" style="width:400px;height:300px;" 
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'保存',
				handler:function(){updatezixunnamesave()}
			},{
				text:'关闭',
				handler:function(){updateziXunNameclose()}
			}]">

	    <form id="updateziXunNameForm" class="easyui-form">
	    	<table cellpadding="5">
	    		<!-- <tr>
	    			<td>编号：</td>
	    			<td><input class="easyui-textbox" disabled="disabled" id="sid" name="stu_id"/></td>
	    		</tr> -->
	    		<tr>
	    			<td>咨询师姓名：</td>
	    			<td>	    				
	    			<select id="zixunname" class="easyui-combobox">
	    				 <option value="">--请选择--</option>  				     
	    			</select>	    				
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>
	
 
	<!-- 对学生进行跟踪 -->
	<div id="insertFollow" class="easyui-dialog" title="添加跟踪信息" style="width:400px;height:300px;" 
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
	    		<input class="easyui-textbox" id="studentId" name="stu_id"/>
	    		<tr>
	    			<td>回访时间：</td>
	    			<td><input class="easyui-datebox" id="followtime" ></td>
	    		</tr>
	    		<tr>
	    			<td>回访情况：</td>
	    			<td><input class="easyui-textbox" id="followstate" ></td>
	    		</tr>
	    		<tr>
	    			<td>跟踪方式：</td>
	    			<td><input class="easyui-textbox" id="followtype" ></td>
	    		</tr>
	    		<tr>
	    			<td>下次跟踪时间：</td>
	    			<td><input class="easyui-datebox" id="nextfollowtime" ></td>
	    		</tr>
	    		<tr>
	    			<td>备注：</td>
	    			<td><input class="easyui-textbox" id="content" ></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	</div>
	
	<!-- 查看窗体 -->
	<div id="lookStu" class="easyui-dialog" title="查看学生信息" style="width:480px;height:650px;" 
	data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
	buttons:[{
			text:'关闭',
			handler:function(){setStuclose()}
		}]">
		
		<div id="cc" class="easyui-layout" style="width:450px;height:600px;">   
	    <div data-options="region:'north',title:'在线录入',split:true"  style="height:300px;padding:5px;background:#eee;">
		
	    <form id="lookStuForm11" class="easyui-form">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" id="stu_Name2" name="stu_Name" ></td>
	    			
	    			<td>性别:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Sex2" name="stu_Sex" ></td>
	    		</tr>
	    		<tr>
	    			<td>年龄:</td>
	    			<td><input class="easyui-textbox" id="stu_Age2" name="stu_Age" ></td>
	    			
	    			<td>电话:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Phone2" name="stu_Phone" ></td>
	    		</tr>
	    		<tr>
	    			<td>学历:</td>
	    			<td><input class="easyui-textbox" id="stu_Status2" name="stu_Status" ></td>
	    			
	    			<td>状态:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_PerState2" name="stu_PerState" ></td>
	    		</tr>
	    		<tr>
	    			<td>来源渠道:</td>
	    			<td><input class="easyui-textbox" id="stu_SourceUrl2" name="stu_SourceUrl" ></td>
	    			
	    			<td>来源网站:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_NetPusherld2" name="stu_NetPusherld" ></td>
	    		</tr>
	    		<tr>
	    			<td>来源关键字:</td>
	    			<td><input class="easyui-textbox" id="stu_SourceKeyWord2" name="stu_SourceKeyWord" ></td>
	    			
	    			<td>所在区域:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Address2" name="stu_Address" ></td>
	    		</tr>
	    		<tr>
	    			<td>学员关注:</td>
	    			<td><input class="easyui-textbox" id="stu_stuConcern2" name="stu_stuConcern" ></td>
	    			
	    			<td>来源部门:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_FromPart2" name="stu_FromPart" ></td>
	    		</tr>
	    		<tr>
	    			<td>qq:</td>
	    			<td><input class="easyui-textbox" id="stu_qq2" name="stu_qq" ></td>
	    			
	    			<td>微信:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_WeiXin2" name="stu_WeiXin" ></td>
	    		</tr>
	    		<tr>
	    			<td>是否报备:</td>
	    			<td><input class="easyui-textbox" id="stu_isBaoBei2" name="stu_isBaoBei" ></td>
	    			
	    			<td>咨询师:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_ZiXunName2" name="stu_ZiXunName" ></td>
	    		</tr>
	    		<tr>
	    			<td>录入人:</td>
	    			<td><input class="easyui-textbox" id="stu_CreateUser2" name="stu_CreateUser" ></td>	    			
	    		</tr>	    		
	    	</table>
	    </form>
	    </div>	    
	    
	   <div data-options="region:'center',title:'咨询师录入'" style="padding:5px;background:#eee;">
	    	<form id="lookStuForm22" class="easyui-form">
		    	<table cellpadding="5">
		    		<tr>
	    				<td>咨询师：</td>
		    			<td><input class="easyui-textbox" id="stu_ZiXunName22" name="stu_ZiXunName"></td>
		    		</tr>
		    		<tr>
		    			<td>课程方向：</td>
		    			<td><input class="easyui-textbox" id="stu_LearnForward22" name="stu_LearnForward"></td>
		    		</tr>
		    		<tr>
		    			<td>打分：</td>
		    			<td><input class="easyui-textbox" id="sexitInte22" name="sexitInte"></td>
		    		</tr>
		    		<tr>
		    			<td>是否有效：</td>
		    			<td><input class="easyui-textbox" id="stu_isValid22" name="stu_isValid"></td>
		    		</tr>
		    		<tr>
		    			<td>是否回访：</td>
		    			<td><input class="easyui-textbox" id="stu_isReturnVist22" name="stu_isReturnVist"></td>
		    		</tr>
		    		<tr>
		    			<td>是否上门：</td>
		    			<td><input class="easyui-textbox" id="stu_isHome22" name="stu_isHome"></td>
		    		</tr>
		    		<tr>
		    			<td>上门时间：</td>
		    			<td><input class="easyui-textbox" id="stu_HomeTime22" name="stu_HomeTime"></td>
		    		</tr>
		    		<tr>
		    			<td>无效原因：</td>
		    			<td><input class="easyui-textbox" id="stu_LostValid22" name="stu_LostValid"></td>
		    		</tr>
		    		<tr>
		    			<td>是否缴费：</td>
		    			<td><input class="easyui-textbox" id="stu_isPay22" name="stu_isPay"></td>
		    		</tr>
		    		<tr>
		    			<td>缴费时间：</td>
		    			<td><input class="easyui-textbox" id="stu_PayTime22" name="stu_PayTime"></td>
		    		</tr>
		    		<tr>
		    			<td>缴费金额：</td>
		    			<td><input class="easyui-textbox" id="stu_Money22" name="stu_Money"></td>
		    		</tr>
		    		<tr>
		    			<td>是否退费：</td>
		    			<td><input class="easyui-textbox" id="stu_isReturnMoney22" name="stu_isReturnMoney"></td>
		    		</tr>
		    		<tr>
		    			<td>是否进班：</td>
		    			<td><input class="easyui-textbox" id="stu_isInClass22" name="stu_isInClass"></td>
		    		</tr>
		    		<tr>
		    			<td>进班时间：</td>
		    			<td><input class="easyui-textbox" id="stu_inClassTime22" name="stu_inClassTime"></td>
		    		</tr>
		    		<tr>
		    			<td>进班备注：</td>
		    			<td><input class="easyui-textbox" id="stu_inClassContent22" name="stu_inClassContent"></td>
		    		</tr>
		    		<tr>
		    			<td>咨询内容：</td>
		    			<td><input class="easyui-textbox" id="stu_AskerContent22" name="stu_AskerContent"></td>
		    		</tr>
		    		<tr>
		    			<td>是否删除：</td>
		    			<td><input class="easyui-textbox" id="stu_isDel22" name="stu_isDel"></td>
		    		</tr>
		    		
		    		<tr>
		    			<td>咨询师：</td>
		    			<td><input class="easyui-textbox" id="stu_ZiXunName22" name="stu_ZiXunName"></td>
		    		</tr>
		    		<tr>
		    			<td>退费时间：</td>
		    			<td><input class="easyui-textbox" id="stu_ReturnMoneyReason22" name="stu_ReturnMoneyReason"></td>
		    		</tr>
		    		<tr>
		    			<td>定金金额：</td>
		    			<td><input class="easyui-textbox" id="stu_preMoney22" name="stu_preMoney"></td>
		    		</tr>
		    		<tr>
		    			<td>定金时间：</td>
		    			<td><input class="easyui-textbox" id="stu_preMoneyTime22" name="stu_preMoneyTime"></td>
		    		</tr>
		    	</table>
		    </form>
	    </div>	      
	</div>	    
	</div> 	
 
 
 
 <!-- 修改窗体 -->
	<div id="editStu" class="easyui-dialog" title="修改学生信息" style="width:635px;height:650px;" 
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
		
		<div id="cc" class="easyui-layout" style="width:600px;height:600px;">   
	    <div data-options="region:'west',title:'在线录入',split:true"  style="width:300px;padding:5px;background:#eee;">
	    <form id="editStuForm11" class="easyui-form">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>编号：</td>
	    			<td><input class="easyui-textbox" disabled="disabled" id="stusid" name="stu_id"/></td>
	    		</tr>
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" id="stu_Name3" name="stu_Name" ></td>
	    		</tr>
	    		<tr>	
	    			<td>性别:</td>	    			
	    			<td>	    			
	    			<select id="stu_Sex3" class="easyui-combobox">
	    			<option>--请选择--</option> 
					     <option value="0">男</option> 
						<option value="1">女</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>年龄:</td>
	    			<td><input class="easyui-numberbox" id="stu_Age3" name="stu_Age" ></td>
	    		</tr>
	    		
	    		<tr>	
	    			<td>电话:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Phone3" name="stu_Phone"></td>
	    		</tr>
	    		<tr>
	    			<td>学历:</td>
	    			<td>
	    			<select id="stu_Status3" name="stu_Status" class="easyui-combobox" style="width:100px;">   
							  <option value="未知">未知</option> 
							  <option value="大专">大专</option> 
							  <option value="高中">高中</option> 
							  <option value="中专">中专</option> 
							  <option value="初中">初中</option> 
							  <option value="本科">本科</option> 
							  <option value="其他">其他</option> 
						</select> 
	    			</td>
	    		</tr>
	    		<tr>	
	    			<td>状态:</td>	    			
	    			<td>
	    			<select id="stu_PerState3" name="stu_PerState" class="easyui-combobox" style="width:100px;">   
							  <option value="未知">未知</option> 
							  <option value="待业">待业</option> 
							  <option value="在职">在职</option> 
							  <option value="在读">在读</option> 							  
						</select>
	    		</td>
	    		</tr>
	    		<tr>
	    			<td>来源渠道:</td>
	    			<td>
	    				<select id="stu_SourceUrl3" name="stu_SourceUrl" class="easyui-combobox" style="width:100px;">   
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
						</select> 
	    			</td>
	    		</tr>
	    		<tr>	
	    			<td>来源网站:</td>	    			
	    			<td>
	    			<select id="stu_NetPusherld3" name="stu_NetPusherld" class="easyui-combobox" style="width:100px;">   
							  <option value="其他">其他</option> 
							  <option value="职英b站">职英b站</option> 
							  <option value="高考站">高考站</option> 
							  <option value="职英a站">职英a站</option> 							 
						</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>来源关键字:</td>
	    			<td><input class="easyui-textbox" id="stu_SourceKeyWord3" name="stu_SourceKeyWord" ></td>
	    		</tr>
	    		<tr>	
	    			<td>所在区域:</td>	    			
	    			<td>
	    			<select id="stu_Address3" name="stu_Address" class="easyui-combobox" style="width:100px;">   
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
						</select> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>学员关注:</td>
	    			<td>
	    				<select id="stu_stuConcern3" name="stu_stuConcern" class="easyui-combobox" style="width:100px;">   
							  <option value="课程">课程</option> 
							  <option value="学费">学费</option> 
							  <option value="学时">学时</option> 
							  <option value="学历">学历</option> 	
							  <option value="师资">师资</option> 
							  <option value="就业">就业</option> 
							  <option value="环境">环境</option> 
							  <option value="其他">其他</option> 							 
						</select>
	    	    </td>
	    		</tr>
	    		<tr>	
	    			<td>来源部门:</td>	    			
	    			<td>
	    			<select id="stu_FromPart3" name="stu_FromPart" class="easyui-combobox" style="width:100px;">   
							  <option value="网络">网络</option> 
							  <option value="市场">市场</option> 
							  <option value="教质">教质</option> 
							  <option value="学术">学术</option> 							
							  <option value="就业">就业</option> 
							 							 
						</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>qq:</td>
	    			<td><input class="easyui-textbox" id="stu_qq3" name="stu_qq" ></td>
	    		</tr>
	    		<tr>	
	    			<td>微信:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_WeiXin3" name="stu_WeiXin" ></td>
	    		</tr>
	    		<tr>
	    			<td>是否报备:</td>
	    			<td>
	    			<select id="stu_isBaoBei3" name="stu_isBaoBei" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">否</option> 
						<option value="1">是</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>	
	    			<td>咨询师:</td>	    			
	    			<td><input class="easyui-textbox" disabled="disabled" name="stu_ZiXunName" ></td>
	    		</tr>
	    		<tr>
	    			<td>录入人:</td>
	    			<td><input class="easyui-textbox" id="stu_CreateUser3" name="stu_CreateUser" ></td>	    			
	    		</tr>	    		
	    	</table>
	    </form>
	    </div>	    
	    
	   <div data-options="region:'center',title:'咨询师录入'" style="padding:5px;background:#eee;">
	    	<form id="editStuForm22" class="easyui-form">
		    	<table cellpadding="5">
		    		<tr>
	    				<td>咨询师：</td>
		    			<td><input class="easyui-textbox" disabled="disabled" name="stu_ZiXunName"></td>
		    		</tr>
		    		<tr>
		    			<td>课程方向：</td>
		    			<td>
		    			<select id="stu_LearnForward33" name="stu_LearnForward" class="easyui-combobox" style="width:100px;">   
							  <option value="软件开发">软件开发</option> 
							  <option value="软件设计">软件设计</option> 
							  <option value="网络营销">网络营销</option> 
													 							 
						</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>打分：</td>
		    			<td>
		    			<select id="sexitInte33" name="sexitInte" class="easyui-combobox" style="width:100px;">   
							  <option value="近期可报名">近期可报名</option> 
							  <option value="一个月内可报名">一个月内可报名</option> 
							  <option value="长期跟踪">长期跟踪</option> 
							  <option value="无效">无效</option>					 							 
						</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>是否有效：</td>
		    			<td>
		    			<select id="stu_isValid33" name="stu_isValid" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">否</option> 
						<option value="1">是</option>
	    			</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>无效原因：</td>
		    			<td><input class="easyui-textbox" id="stu_LostValid33" name="stu_LostValid"></td>
		    		</tr>
		    		<tr>
		    			<td>是否回访：</td>
		    			<td>
		    			<select id="stu_isReturnVist33" name="stu_isReturnVist33" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">否</option> 
						<option value="1">是</option>
	    			</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>首访时间：</td>
		    			<td><input class="easyui-datebox" id="stu_firstVisitTime33" name="stu_firstVisitTime"></td>
		    		</tr>
		    		
		    		<tr>
		    			<td>是否上门：</td>
		    			<td>		    			
		    			<select id="stu_isHome33" name="stu_isHome" class="easyui-combobox">
	    				 
					     <option value="0">否</option> 
						<option value="1">是</option>
	    			</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>上门时间：</td>
		    			<td><input class="easyui-datebox" id="stu_HomeTime33" name="stu_HomeTime"></td>
		    		</tr>
		    		<tr>
		    			<td>定金金额：</td>
		    			<td><input class="easyui-numberbox" id="stu_preMoney33" name="stu_preMoney"></td>
		    		</tr>
		    		<tr>
		    			<td>定金时间：</td>
		    			<td><input class="easyui-datebox" id="stu_preMoneyTime33" name="stu_preMoneyTime"></td>
		    		</tr>
		    		<tr>
		    			<td>是否缴费：</td>
		    			<td>		    			
		    			<select id="stu_isPay33" name="stu_isPay" class="easyui-combobox">
	    				
					     <option value="0">否</option> 
						<option value="1">是</option>
						</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>缴费时间：</td>
		    			<td><input class="easyui-datebox" id="stu_PayTime33" name="stu_PayTime"></td>
		    		</tr>
		    		<tr>
		    			<td>缴费金额：</td>
		    			<td><input class="easyui-numberbox" id="stu_Money33" name="stu_Money"></td>
		    		</tr>
		    		<tr>
		    			<td>是否退费：</td>
		    			<td>		    			
		    			<select id="stu_isReturnMoney33" name="stu_isReturnMoney" class="easyui-combobox">
	    				
					     <option value="0">否</option> 
						<option value="1">是</option>
						</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>退费原因：</td>
		    			<td><input class="easyui-textbox" id="stu_ReturnMoneyReason33" name="stu_ReturnMoneyReason"></td>
		    		</tr>
		    		<tr>
		    			<td>是否进班：</td>
		    			<td>		    			
		    			<select id="stu_isInClass33" name="stu_isInClass" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">否</option> 
						<option value="1">是</option>
						</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>进班时间：</td>
		    			<td><input class="easyui-datebox" id="stu_inClassTime33" name="stu_inClassTime"></td>
		    		</tr>
		    		<tr>
		    			<td>进班备注：</td>
		    			<td><input class="easyui-textbox" id="stu_inClassContent33" name="stu_inClassContent"></td>
		    		</tr>
		    		<tr>
		    			<td>咨询备注：</td>
		    			<td><input class="easyui-textbox" id="stu_AskerContent33" name="stu_AskerContent"></td>
		    		</tr>	    		    		
		    		
		    	</table>
		    </form>
	    </div>	      
	</div>	    
	</div> 	
 
 
 
 
 
 	<!-- 设置隐藏列 -->
<div id="hiddenColumn_dialog" class="easyui-dialog" data-options="title:'设置隐藏列',modal:true,closed:'true',
			buttons:[{
				text:'保存',
				handler:function(){
				saveColumn();<!-- 保存 -->
				init();<!-- 刷新 -->
				closed_hiddenColumn();<!-- 关闭弹窗 -->
				}
			},{
				text:'关闭',
				handler:function(){
				closed_hiddenColumn();
				}
			}]">
	<form id="hiddenColumn_form" class="easyui-form">
	<a href="javascript:void()"  class="easyui-linkbutton" id="isQuanXuan" onclick="ChooseAll()" data-options="iconCls:'icon-edit'">全选</a> 
		<table>
			<tr>
				<td><input type="checkbox" value="stu_id"/>编号</td>
			
				<td><input type="checkbox" value="stu_Name"/>姓名</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_Age"/>年龄</td>
					
				<td><input type="checkbox" value="stu_Sex"/>性别</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_Status"/>学历</td>
		
				<td><input type="checkbox" value="stu_Phone"/>电话</td>
			</tr>
			
			
			
			<tr>
				<td><input type="checkbox" value="stu_PerState"/>客户状态</td>
			
				<td><input type="checkbox" value="stu_MsgSource"/>客户信息</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_SourceUrl"/>信息来源</td>
			
				<td><input type="checkbox" value="stu_SourceKeyWord"/>来源关键字</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_Address"/>地址</td>
			
				<td><input type="checkbox" value="stu_NetPusherld"/>来源网站</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_qq"/>QQ</td>
			
				<td><input type="checkbox" value="stu_WeiXin"/>微信</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_Content"/>内容</td>
			
				<td><input type="checkbox" value="stu_CreateTime"/>创建日期</td>
			</tr>
			
			<tr>
				<td><input type="checkbox" value="stu_LearnForward"/>课程方向</td>
			
				<td><input type="checkbox" value="stu_isValid"/>是否有效</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_Record"/>客户记录</td>
			
				<td><input type="checkbox" value="stu_isReturnVist"/>是否要回访</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_isHome"/>是否上门</td>
			
				<td><input type="checkbox" value="stu_firstVisitTime"/>回访时间</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_HomeTime"/>上门时间</td>
			
				<td><input type="checkbox" value="stu_LostValid"/>无效原因</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_isPay"/>是否缴费</td>
			
				<td><input type="checkbox" value="stu_PayTime"/>缴费时间</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_Money"/>缴费金额</td>
			
				<td><input type="checkbox" value="stu_isReturnMoney"/>是否退费</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_isInClass"/>是否进班</td>
			
				<td><input type="checkbox" value="stu_inClassTime"/>进班日期</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_inClassContent"/>进班备注</td>
			
				<td><input type="checkbox" value="stu_AskerContent"/>咨询内容</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_isDel"/>是否删除</td>
			
				<td><input type="checkbox" value="stu_FromPart"/>来源部门</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_stuConcern"/>学员关注</td>
			
				<td><input type="checkbox" value="stu_isBaoBei"/>是否报备</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_ZiXunName"/>咨询师备注</td>
			
				<td><input type="checkbox" value="stu_CreateUser"/>录入人</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_ReturnMoneyReason"/>退费时间</td>
			
				<td><input type="checkbox" value="stu_preMoney"/>定金金额</td>
			</tr>
			<tr>
				<td><input type="checkbox" value="stu_preMoneyTime"/>交定金时间</td>
			</tr> 
		</table>
	</form>
</div>


</body>
 
</html>