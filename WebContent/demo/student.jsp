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
		init();
	})
	
	function init(){
		$("#stuTab").datagrid({
			url:"../selectStudent",
			method:"post",			
			fitColumns:true,
	        pagination:true,
	        rownumbers:true,
	        singleSelect:true
		})			
	}
	function formatterStu(value, row, index){
		return "<a href='javascript:void(0)' style='cursor: pointer;' onclick='updateStu(" + index + ")'>编辑</a><a href='javascript:void(0)' style='cursor: pointer;' onclick='deleteStu(" + index + ")'>删除</a>";
	}
	/* function formatterRole(value, row, index){
		return row.role.roles_Name;
	} */
	function formatterUser(value, row, index){
		return row.netfollows.user.loginName;
	}
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
	</script>
</head>
<body>
		<table id="stuTab" class="easyui-datagrid"  
        data-options="fitColumns:true,singleSelect:true">   
	    <thead>   
	        <tr> 
	        	<th data-options="field:'checkbox',checkbox:true"></th>  
	            <th data-options="field:'stu_id'">编码</th>   
	            <th data-options="field:'stu_Name'">姓名</th>
	            
	           <!--  <th data-options="field:'netfollows',width:100,formatter:formatternetfollows">管理名称</th> -->
	            <th data-options="field:'netfollows',formatter:formatterUser">用户姓名</th>
	               
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
	        	<th data-options="field:'stu_isValid',formatter:formatterIs">是否有效</th>
	        		        	
	        	<th data-options="field:'stu_Record'">客户记录</th>   
	            <th data-options="field:'stu_isReturnVist',formatter:formatterIs">是否要回访</th>   
	            <th data-options="field:'stu_isHome',formatter:formatterIs">是否上门</th>   
	        	<th data-options="field:'stu_firstVisitTime'">回访时间</th>  
	        	<th data-options="field:'stu_HomeTime'">上门时间</th>
	        	<th data-options="field:'stu_LostValid'">无效原因</th>   
	            <th data-options="field:'stu_isPay',formatter:formatterIs">是否缴费</th>   
	        	<th data-options="field:'stu_PayTime'">缴费时间</th>  
	        	<th data-options="field:'stu_Money'">缴费金额</th>       
	        	
	        	
	        	<th data-options="field:'stu_isReturnMoney',formatter:formatterIs">是否退费</th>   
	            <th data-options="field:'stu_isInClass',formatter:formatterIs">是否进班</th>   
	            <th data-options="field:'stu_inClassTime'">进班日期</th>   
	        	<th data-options="field:'stu_inClassContent'">进班备注</th>  
	        	<th data-options="field:'stu_AskerContent'">咨询内容</th>
	        	<th data-options="field:'stu_isDel',formatter:formatterIs">是否删除</th>   
	            <th data-options="field:'stu_FromPart'">来源部门</th>   
	        	<th data-options="field:'stu_stuConcern'">学员关注</th>  
	        	<th data-options="field:'stu_isBaoBei',formatter:formatterIs">是否报备</th>	       
	       
	       		<th data-options="field:'stu_ZiXunName'">咨询师备注</th>   
	            <th data-options="field:'stu_CreateUser'">创建用户</th>   
	            <th data-options="field:'stu_ReturnMoneyReason'">退费时间</th>   
	        	<th data-options="field:'stu_preMoney'">定金金额</th>  
	        	<th data-options="field:'stu_preMoneyTime'">交定金时间</th>	        	
	        	<th data-options="field:'setLo',width:140,align:'center',formatter:formatterStu">操作</th>            
	        
	        </tr>   
	    </thead>   
	</table>
</body>
</html>