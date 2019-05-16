<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有学生</title>
 		<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="../js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script>
	$(function(){	
		dongtai();
		init();
	})
	function dongtai(){
		var createGridHeaderContextMenu = function(e, field) {
					e.preventDefault();
					var grid = $(this);/* grid本身 */
					var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
					var okCls = 'tree-checkbox1';// 选中
					var emptyCls = 'tree-checkbox0';// 取消
					if (!headerContextMenu) {
						var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
						var fields = grid.datagrid('getColumnFields');
						for (var i = 0; i < fields.length; i++) {
							var fildOption = grid.datagrid('getColumnOption', fields[i]);
							if (!fildOption.hidden) {
								$('<div iconCls="' + okCls + '" field="' + fields[i] + '"/>')
										.html(fildOption.title).appendTo(tmenu);
							} else {
								$('<div iconCls="' + emptyCls + '" field="' + fields[i] + '"/>')
										.html(fildOption.title).appendTo(tmenu);
							}
						}
						headerContextMenu = this.headerContextMenu = tmenu.menu({
							onClick : function(item) {
								var field = $(item.target).attr('field');
								if (item.iconCls == okCls) {
									grid.datagrid('hideColumn', field);
									$(this).menu('setIcon', {
										target : item.target,
										iconCls : emptyCls
									});
								} else {
									grid.datagrid('showColumn', field);
									$(this).menu('setIcon', {
										target : item.target,
										iconCls : okCls
									});
								}
							}
						});
					}
					headerContextMenu.menu('show', {
						left : e.pageX,
						top : e.pageY
					});
				};
				$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
				$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;

	}

	function init(){
		$("#stuTab").datagrid({
			url:"../selectStudent",
			method:"post",			
			fitColumns:true,
	        pagination:true,
	        rownumbers:true,
 
	        singleSelect:true,
 
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
				text5:$("#creattime").textbox("getValue"),	
				text6:$("#hometime").textbox("getValue"),
				text7:$("#firstvisittime").textbox("getValue"), 
				text8:$("#paytime").textbox("getValue"),	
				text9:$("#inclasstime").textbox("getValue")
				}
		})			
	}
	function formatterStu(value, row, index){
 
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='chakanStu(" + index + ")'>查看</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='shezhiStu(" + index + ")'>设置</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='genzongStu(" + index + ")'>跟踪</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='updateStu(" + index + ")'>编辑</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='deleteStu(" + index + ")'>删除</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='piliang(" + index + ")'>批量操作</a>";
	}
	/* function formatterRole(value, row, index){
		return row.role.roles_Name;
	} */
	/* function formatterUser(value, row, index){
		return row.netfollows.user.loginName;
	} */
 
	function formatterSex(value, row, index){
		return value==0? '男':'女';
	}
	function formatterIs(value, row, index){
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
			var stu_Status1= $("#stu_Status1").textbox("getValue");
			var stu_PerState1= $("#stu_PerState1").textbox("getValue");
			var stu_SourceUrl1= $("#stu_SourceUrl1").textbox("getValue");
			var stu_SourceKeyWord1 = $("#stu_SourceKeyWord1").textbox("getValue");
			var stu_qq1= $("#stu_qq1").textbox("getValue");
			var stu_WeiXin= $("#stu_WeiXin").textbox("getValue");					
			var stu_isBaoBei1= $("#stu_isBaoBei1").combobox("getValue");
			var stu_inClassContent1= $("#stu_inClassContent1").textbox("getValue");	
			//提交到添加的controller
				$.post("../insertstu", {
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
		function piliang(index){
			var data=$('#stuTab').datagrid('getData');
			var row=data.rows[index];
			$('#updateziXunNameForm').form('load',row);
			$('#updateziXunName').dialog('open');
		}
		//修改咨询师名字弹框的关闭
		function updateziXunNameclose() {
			$('#updateziXunName').dialog('close');
		}
		//咨询师名字修改后的数据的提交
		function updatezixunnamesave() {
			$.ajax({
				url:'../updatezixunname',
				method:'post',
				dataType:'json',
				data:{
					stu_id:$('#sid').textbox('getValue'),
					stu_ZiXunName:$('#snamezixun').textbox('getValue')
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
 
		
		
		//对学生进行后续跟踪
		function followStu(index){
			var data=$('#stuTab').datagrid('getData');
			var row=data.rows[index];
			$('#insertFollowForm').form("load",row);
			$('#studentId').next().hide();//让学生编号的文本框进行隐藏
			$('#insertFollow').dialog('open');
		}
		//对具体某一个学生进行跟踪数据的提交
		function insertFollowsave(){
			$.ajax({
				url:'../insertFollows',
				method:'post',
				dataType:'json',
				data:{
					stu_Id:$('#studentId').textbox('getValue'),
					followTime:$('#followtime').textbox('getValue'),
					followState:$('#followstate').textbox('getValue'),
					followType:$('#followtype').textbox('getValue'),
					nextFollowTime:$('#nextfollowtime').textbox('getValue'),
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
 

	</script>
</head>
<body>
		<table id="stuTab" data-options="fitColumns:true">   
	    <thead>   
	        <tr> 
 
	       		<th data-options="field:'checkbox',checkbox:true"></th>
	        	<th data-options="field:'stu_id',width:100">编码</th>   
	            <th data-options="field:'stu_Name',width:100">姓名</th> 
	            <th data-options="field:'stu_Age',width:100">年龄</th>   
	        	<th data-options="field:'stu_Sex',width:100,formatter:formatterSex">性别</th>  
	        	<th data-options="field:'stu_Phone',width:100">手机号</th>
	        	<th data-options="field:'stu_Status',width:100">客户状态</th>   
	            <th data-options="field:'stu_PerState',width:100">个人状态</th>   
	        	<th data-options="field:'stu_MsgSource',width:100">客户信息</th>  
	        	<th data-options="field:'stu_SourceUrl',width:100">信息来源</th>    	
	        	
	        	<th data-options="field:'stu_SourceKeyWord',width:100">来源关键字</th>   
	            <th data-options="field:'stu_Address',width:100">地址</th>   
	            <th data-options="field:'stu_NetPusherld',width:100">来源网站</th>   
	        	<th data-options="field:'stu_qq',width:100">QQ</th>  
	        	<th data-options="field:'stu_WeiXin',width:100">微信</th>
	        	<th data-options="field:'stu_Content',width:100">内容</th>   
	            <th data-options="field:'stu_CreateTime',width:100">创建日期</th>   
	        	<th data-options="field:'stu_LearnForward',width:100">课程方向</th>  
	        	<th data-options="field:'stu_isValid',width:100,formatter:formatterIs">是否有效</th>
	        		        	
	        	<th data-options="field:'stu_Record',width:100">客户记录</th>   
	            <th data-options="field:'stu_isReturnVist',width:100,formatter:formatterIs">是否要回访</th>   
	            <th data-options="field:'stu_isHome',width:100,formatter:formatterIs">是否上门</th>   
	        	<th data-options="field:'stu_firstVisitTime',width:100">回访时间</th>  
	        	<th data-options="field:'stu_HomeTime',width:100">上门时间</th>
	        	<th data-options="field:'stu_LostValid',width:100">无效原因</th>   
	            <th data-options="field:'stu_isPay',width:100,formatter:formatterIs">是否缴费</th>   
	        	<th data-options="field:'stu_PayTime',width:100">缴费时间</th>  
	        	<th data-options="field:'stu_Money',width:100">缴费金额</th>       
	        	
	        	
	        	<th data-options="field:'stu_isReturnMoney',width:100,formatter:formatterIs">是否退费</th>   
	            <th data-options="field:'stu_isInClass',width:100,formatter:formatterIs">是否进班</th>   
	            <th data-options="field:'stu_inClassTime',width:100">进班日期</th>   
	        	<th data-options="field:'stu_inClassContent',width:100">进班备注</th>  
	        	<th data-options="field:'stu_AskerContent',width:100">咨询内容</th>
	        	<th data-options="field:'stu_isDel',width:100,formatter:formatterIs">是否删除</th>   
	            <th data-options="field:'stu_FromPart',width:100">来源部门</th>   
	        	<th data-options="field:'stu_stuConcern',width:100">学员关注</th>  
	        	<th data-options="field:'stu_isBaoBei',width:100,formatter:formatterIs">是否报备</th>	       
	       
	       		<th data-options="field:'stu_ZiXunName',width:100">咨询师备注</th>   
	            <th data-options="field:'stu_CreateUser',width:100">创建用户</th>   
	            <th data-options="field:'stu_ReturnMoneyReason',width:100">退费时间</th>
        		<th data-options="field:'setLo',width:200,align:'center',formatter:formatterStu">操作</th>            
	             	
	        	
 
	        </tr>   
	    </thead>   
	</table>
	
	<!--多条件查询  -->
	 <div id="tb" style="padding: 5px; height: auto">
		<form id="sousuofrm" class="easyui-form">
			 客户姓名:<input class="easyui-textbox" id="sname"  style="width: 80px">
			 电话:<input class="easyui-textbox" id="phone"  style="width: 80px">
			 咨询师:<input class="easyui-textbox" id="zixunname"  style="width: 80px">			 				
			是否缴费:<select id="ispay" class="easyui-combobox" style="height: auto;">
						<option value="0">否</option>
						<option value="1">是</option>				
					</select> 
			是否有效:<select id="isvalid" class="easyui-combobox" style="height: auto;">
						<option value="0">否</option>
						<option value="1">是</option>					
					</select> 
			是否回访:<select id="isreturnvist" class="easyui-combobox" style="height: auto;">
						<option value="0">否</option>
						<option value="1">是</option>					
					</select> 
			 QQ: <input class="easyui-textbox" id="qq"  style="width: 80px">			 
			  创建时间:<input class="easyui-textbox" id="creattime"  style="width: 80px">
			 上门时间:<input class="easyui-textbox" id="hometime"  style="width: 80px">
			 首次回访时间:<input class="easyui-textbox" id="firstvisittime"  style="width: 80px">			 
			  缴费时间:<input class="easyui-textbox" id="paytime"  style="width: 80px">
			 进班时间:<input class="easyui-textbox" id="inclasstime"  style="width: 80px">
				
			 <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" onclick="init()">查找</a>
			  <a href="javascript:void(0)" class="easyui-linkbutton"
 
			   iconCls="icon-add" onclick="addStu()">添加</a>
			    <a href="javascript:void(0)" class="easyui-linkbutton"
			   iconCls="icon-edit" onclick="piliang()">批量操作</a>   
 
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
	    			<td><input class="easyui-textbox" id="stu_Status1" ></td>
	    		</tr>
	    		<tr>
	    			<td>状态：</td>
	    			<td><input class="easyui-textbox" id="stu_PerState1" ></td>
	    		</tr>
	    		<tr>
	    			<td>来源渠道：</td>
	    			<td><input class="easyui-textbox" id="stu_SourceUrl1"></td>
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
	<div id="updateziXunName" class="easyui-dialog" title="修改咨询师" style="width:400px;height:300px;" 
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
	    		<tr>
	    			<td>编号：</td>
	    			<td><input class="easyui-textbox" disabled="disabled" id="sid" name="stu_id"/></td>
	    		</tr>
	    		<tr>
	    			<td>咨询师姓名：</td>
	    			<td><input class="easyui-textbox" id="snamezixun" name="stu_ZiXunName"></td>
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
	    			<td><input class="easyui-textbox" id="followtime" ></td>
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
	    			<td><input class="easyui-textbox" id="nextfollowtime" ></td>
	    		</tr>
	    		<tr>
	    			<td>备注：</td>
	    			<td><input class="easyui-textbox" id="content" ></td>
	    		</tr>
	    		
	    	</table>
	    </form>
	</div>
	
	<!-- 查看窗体 -->
	<div id="chakanStu" class="easyui-dialog" title="查看客户" style="width:400px;height:500px;" 
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
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_Name" ></td>
	    			
	    			<td>性别:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_Sex" ></td>
	    		</tr>
	    		<tr>
	    			<td>年龄:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_Age" ></td>
	    			
	    			<td>电话:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_Phone" ></td>
	    		</tr>
	    		<tr>
	    			<td>学历:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_Status" ></td>
	    			
	    			<td>状态:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_PerState" ></td>
	    		</tr>
	    		<tr>
	    			<td>来源渠道:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_SourceUrl" ></td>
	    			
	    			<td>来源网站:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_NetPusherld" ></td>
	    		</tr>
	    		<tr>
	    			<td>来源关键字:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_SourceKeyWord" ></td>
	    			
	    			<td>所在区域:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_Address" ></td>
	    		</tr>
	    		<tr>
	    			<td>学员关注:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_stuConcern" ></td>
	    			
	    			<td>来源部门:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_FromPart" ></td>
	    		</tr>
	    		<tr>
	    			<td>qq:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_qq" ></td>
	    			
	    			<td>微信:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_WeiXin" ></td>
	    		</tr>
	    		<tr>
	    			<td>是否报备:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_isBaoBei" ></td>
	    			
	    			<td>咨询师:</td>	    			
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_ZiXunName" ></td>
	    		</tr>
	    		<tr>
	    			<td>录入人:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="" ></td>	    			
	    		</tr>	    		
	    	</table>
	    </form>
	</div> 	
 
</body>
</html>