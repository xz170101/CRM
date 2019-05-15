<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>网络咨询师</title>
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
   					text4:$("#qq").textbox("getValue"),	
   					text5:$("#creattime").datebox("getValue"),
   					text10:$("#zixunshi").textbox("getValue")
   				}
   			})			
   		}
   		function formatterStu(value, row, index){
   			return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='chakan(" + index + ")'>查看</a>  <a href='javascript:void(0)' style='cursor: pointer;' onclick='updateStu(" + index + ")'>设置</a>";
   		}
   		//添加客户
   		//打开添加窗口
   		function addStu(){		
   			$("#insertStu").dialog("open");			
   		} 
   		function formatterSex(value, row, index){
   			return value==0? '男':'女';
   		}
   		//添加窗口的保存
   		 function insertsave(){	
   				//获取id参数
   				var stu_Name1= $("#stu_Name1").textbox("getValue");
   				var stu_Sex1 = $("#stu_Sex1").combobox("getValue");
   				var stu_Age1= $("#stu_Age1").textbox("getValue");
   				var stu_Phone1= $("#stu_Phone1").textbox("getValue");					
   				var stu_Status1= $("#stu_Status1").combobox("getValue");
   				var stu_PerState1= $("#stu_PerState1").combobox("getValue");
   				var stu_SourceUrl1= $("#stu_SourceUrl1").combobox("getValue");
   				var stu_MsgSource1 = $("#stu_MsgSource1").textbox("getValue");
   				var stu_Address1= $("#stu_Address1").combobox("getValue");
   				var stu_NetPusherld1= $("#stu_NetPusherld1").combobox("getValue");					
   				var stu_Content1= $("#stu_Content1").textbox("getValue");
   				var stu_SourceKeyWord1= $("#stu_SourceKeyWord1").textbox("getValue");
   				var stu_qq1= $("#stu_qq1").textbox("getValue");
   				var stu_WeiXin1= $("#stu_WeiXin1").textbox("getValue");
   				var stu_inClassContent1= $("#stu_inClassContent1").textbox("getValue");
   				var stu_CreateUser1= $("#stu_CreateUser1").textbox("getValue");
   				var stu_CreateTime1= $("#stu_CreateTime1").datebox("getValue");
   				//提交到添加的controller
   					$.post("../insertstu", {
   						stu_Name:stu_Name1,
   						stu_Sex:stu_Sex1,
   						stu_Age:stu_Age1,
   						stu_Phone:stu_Phone1,
   						stu_Status:stu_Status1,
   						stu_PerState:stu_PerState1,
   						stu_SourceUrl:stu_SourceUrl1,
   						stu_MsgSource:stu_MsgSource1,
   						stu_Address:stu_Address1,
   						stu_NetPusherld:stu_NetPusherld1,
   						stu_Content:stu_Content1,
   						stu_SourceKeyWord:stu_SourceKeyWord1,
   						stu_qq:stu_qq1,
   						stu_WeiXin:stu_WeiXin1,
   						stu_inClassContent:stu_inClassContent1,
   						stu_CreateUser:stu_CreateUser1,
   						stu_CreateTime:stu_CreateTime1
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
   		//查看客户
   		//打开查看详情窗口
   		 function chakan(index){		
   			var data=$("#stuTab").datagrid("getData");
   			var row=data.rows[index];	
   			$("#chakanStuForm").form("load",row);
   			$("#chakanStu").dialog("open");
   		}
   		//查看页面的关闭
		 function chakanclose(){
			$("#chakanStuForm").form("clear");
			$("#chakanStu").dialog("close");
		}
   	</script>
</head>
<body>
	<!-- 查看自己添加的所有学生信息 -->
	<table id="stuTab" data-options="fitColumns:true">   
	    <thead>   
	        <tr> 
	        	<th data-options="field:'checkbox',checkbox:true"></th>  
	            <th data-options="field:'stu_id'">编号</th>   
	            <th data-options="field:'stu_Name'">姓名</th>    
	            <th data-options="field:'stu_Age'">年龄</th>   
	        	<th data-options="field:'stu_Sex',formatter:formatterSex">性别</th>  
	        	<th data-options="field:'stu_Phone'">手机号</th>
	        	<th data-options="field:'stu_Status'">学历</th>   
	            <th data-options="field:'stu_PerState'">状态</th>   
	        	<th data-options="field:'stu_MsgSource'">客户信息</th>  
	        	<th data-options="field:'stu_SourceUrl'">信息来源</th>	        	
	        	<th data-options="field:'stu_SourceKeyWord'">来源关键字</th>   
	            <th data-options="field:'stu_Address'">地址</th>   
	            <th data-options="field:'stu_NetPusherld'">来源网站</th>   
	        	<th data-options="field:'stu_qq'">QQ</th>  
	        	<th data-options="field:'stu_WeiXin'">微信</th>
	        	<th data-options="field:'stu_Content'">内容</th>   
	            <th data-options="field:'stu_CreateTime'">创建日期</th>   	       
	       		<th data-options="field:'stu_ZiXunName'">咨询师</th>   
	            <th data-options="field:'stu_CreateUser'">创建人</th>             	
	        	<th data-options="field:'setLo',align:'center',formatter:formatterStu">操作</th>            
	        </tr>   
	    </thead>   
	</table>
	
	<!--多条件查询  -->
	 <div id="tb" style="padding: 5px; height: auto">
		<form id="sousuofrm" class="easyui-form">
			   客户姓名:<input class="easyui-textbox" id="sname"  style="width: 80px">
			   电话:<input class="easyui-textbox" id="phone"  style="width: 80px">
			   咨询师:<input class="easyui-textbox" id="zixunshi"  style="width: 80px">	 				
			 QQ: <input class="easyui-textbox" id="qq"  style="width: 80px">			 
			   创建时间:<input class="easyui-datebox" id="creattime"  style="width: 80px">
			 <a href="javascript:void(0)" class="easyui-linkbutton"
				iconCls="icon-search" onclick="init()">查找</a>
			 <a href="javascript:void(0)" class="easyui-linkbutton"
			    iconCls="icon-add" onclick="addStu()">添加</a>   
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
	    			<td>姓名:</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" ></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td>
	    			
	    				<select id="stu_Sex1" class="easyui-combobox" style="width:100px;">   
							  <option>--请选择--</option> 
							  <option value="0">男</option> 
							  <option value="1">女</option> 
						</select> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>年龄:</td>
	    			<td><input class="easyui-textbox" id="stu_Age1" ></td>
	    		</tr>
	    		<tr>
	    			<td>电话:</td>
	    			<td><input class="easyui-textbox" id="stu_Phone1" ></td>
	    		</tr>
	    		<tr>
	    			<td>学历:</td>
	    			<td>
	    			<select id="stu_Status1" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">大专</option> 
						 <option value="1">高中</option>
						 <option value="2">中专</option>
						 <option value="3">初中</option>
						 <option value="4">本科</option>
						 <option value="5">其它</option>
						 <option value="6">未知</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>状态:</td>
	    			<td>
	    			<select id="stu_PerState1" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">待业</option> 
						 <option value="1">在职</option>
						 <option value="2">在读</option>
						 <option value="3">未知</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>来源渠道:</td>
	    			<td>
	    			<select id="stu_SourceUrl1" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">百度</option> 
						 <option value="1">百度移动端</option>
						 <option value="2">360</option>
						 <option value="3">360移动端</option>
						 <option value="4">搜狗</option>
						 <option value="5">搜狗移动端</option>
						 <option value="6">UC移动端</option>
						 <option value="7">直接输入</option>
						 <option value="8">自然流量</option>
						 <option value="9">直电</option>
						 <option value="10">微信</option>
						 <option value="11">QQ</option>
						 <option value="12">未知</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>客户信息:</td>
	    			<td><input class="easyui-textbox" id="stu_MsgSource1"></td>
	    		</tr>
	    		<tr>
	    			<td>地址:</td>
	    			<td>
	    			<select id="stu_Address1" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">郑州</option> 
						 <option value="1">开封</option>
						 <option value="2">洛阳</option>
						 <option value="3">南阳</option>
						 <option value="4">漯河</option>
						 <option value="5">三门峡</option>
						 <option value="6">平顶山</option>
						 <option value="7">周口</option>
						 <option value="8">驻马店</option>
						 <option value="9">新乡</option>
						 <option value="10">鹤壁</option>
						 <option value="11">焦作</option>
						 <option value="12">濮阳</option>
						 <option value="13">安阳</option>
						 <option value="14">商丘</option>
						 <option value="15">信阳</option>
						 <option value="16">济源</option>
						 <option value="17">其它</option>
						 <option value="18">未知</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>来源网站:</td>
	    			<td>
	    			<select id="stu_NetPusherld1" class="easyui-combobox">
	    				 <option>--请选择--</option> 
					     <option value="0">职英B站</option> 
						 <option value="1">高考站</option>
						 <option value="2">职英A站</option>
						 <option value="3">其它</option>
	    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>内容:</td>
	    			<td><input class="easyui-textbox" id="stu_Content1"></td>
	    		</tr>
	    		<tr>
	    			<td>来源关键字:</td>
	    			<td><input class="easyui-textbox" id="stu_SourceKeyWord1"></td>
	    		</tr>
	    		<tr>
	    			<td>QQ:</td>
	    			<td><input class="easyui-textbox" id="stu_qq1"></td>
	    		</tr>
	    		<tr>
	    			<td>微信号:</td>
	    			<td><input class="easyui-textbox" id="stu_WeiXin1"></td>
	    		</tr>
	    		<tr>
	    			<td>在线备注:</td>
	    			<td><input class="easyui-textbox" id="stu_inClassContent1"></td>
	    		</tr>
	    		<tr>
	    			<td>创建人:</td>
	    			<td><input class="easyui-textbox" id="stu_CreateUser1"></td>
	    		</tr>
	    		<tr>
	    			<td>创建日期:</td>
	    			<td><input class="easyui-datebox" id="stu_CreateTime1"></td>
	    		</tr>
	    	</table>
	    </form>
	</div>
	<!-- 查看窗体 -->
	<div id="chakanStu" class="easyui-dialog" title="客户详情" style="width:400px;height:500px;" 
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'关闭',
				handler:function(){chakanclose()}
			}]">

	    <form id="chakanStuForm" class="easyui-form">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>姓名：</td>
	    			<td><input class="easyui-textbox" id="stu_Name1" name="stu_Name"></td>
	    		</tr>
	    		<tr>
	    			<td>性别</td>
	    			<td>
	    				<input class="easyui-textbox" id="stu_sex1" name="stu_Sex">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>年龄：</td>
	    			<td><input class="easyui-textbox" id="stu_Age1" name="stu_Age"></td>
	    		</tr>
	    		<tr>
	    			<td>电话：</td>
	    			<td><input class="easyui-textbox" id="stu_Phone1" name="stu_Phone"></td>
	    		</tr>
	    		<tr>
	    			<td>学历：</td>
	    			<td><input class="easyui-textbox" id="stu_Status1" name="stu_Status"></td>
	    		</tr>
	    		<tr>
	    			<td>状态：</td>
	    			<td><input class="easyui-textbox" id="stu_PerState1" name="stu_PerState"></td>
	    		</tr>
	    		<tr>
	    			<td>来源渠道：</td>
	    			<td><input class="easyui-textbox" id="stu_SourceUrl1" name="stu_SourceUrl"></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>来源关键字：</td>
	    			<td><input class="easyui-textbox" id="stu_SourceKeyWord1" name="stu_SourceKeyWord"></td>
	    		</tr>
	    		<tr>
	    			<td>来源网站:</td>
	    			<td><input class="easyui-textbox" id="stu_NetPusherld1" name="stu_NetPusherld"></td>
	    		</tr>
	    		<tr>
	    			<td>客户信息:</td>
	    			<td><input class="easyui-textbox" id="stu_MsgSource1" name="stu_MsgSource"></td>
	    		</tr>
	    		<tr>
	    			<td>地址:</td>
	    			<td><input class="easyui-textbox" id="stu_Address1" name="stu_Address"></td>
	    		</tr>
	    		<tr>
	    			<td>QQ：</td>
	    			<td><input class="easyui-textbox" id="stu_qq1" name="stu_qq"></td>
	    		</tr>
	    		<tr>
	    			<td>微信号：</td>
	    			<td><input class="easyui-textbox" id="stu_WeiXin" name="stu_WeiXin"></td>
	    		</tr>
	    		<tr>
	    			<td>在线备注：</td>
	    			<td><input class="easyui-textbox" id="stu_inClassContent1" name="stu_inClassContent"></td>
	    		</tr>
	    		<tr>
	    			<td>创建人:</td>
	    			<td><input class="easyui-textbox" id="stu_CreateUser1" name="stu_CreateUser"></td>
	    		</tr>
	    		<tr>
	    			<td>创建日期:</td>
	    			<td><input class="easyui-textbox" id="stu_CreateTime1" name="stu_CreateTime"></td>
	    		</tr>
	    	</table>
	    </form>
	</div>
</body>
</html>