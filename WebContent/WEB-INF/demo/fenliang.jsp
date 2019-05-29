<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客户分量管理</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">
   		<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro/easyui.css">
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script>
	$(function(){		
		init();
		kaiqi();			
	})
	function init(){
		$("#stuTab").datagrid({
			url:"selectstunull",
			method:"post",			
			fitColumns:true,
	        //pagination:true,
	        rownumbers:true
		})		
	}
	//开启分量
	 function kaiqi() {		
		var kaiguan = $("#fen").val();
		if (kaiguan !=null) {
			if(kaiguan=="true"){
				kaiguan =true;
			}
			if(kaiguan=="false"){
				kaiguan= false;
			}
		} else {
			kaiguan = false;
		}

		$('#fenliang').switchbutton({
			checked : kaiguan,			
			onChange : function(checked) {	
				/* var list = $("#cha").val();										
				if(list.length<1){
					alert("只有一个人签到，不能自动分量！");
				}else{ */
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
										$.messager.alert("开启成功");
										$("#stuTab").datagrid("load");
									}
								})
							}
						})
					//}			
			}
		})
	}	 
	
	//批量操作，对咨询师名字的修改		
	 function piliang(){	
		$('#allasker').datalist({ 
		    url: 'selectqiandao', 
		    checkbox: true, 
		    textFormatter:function(value,row,index){
		    	return row.askers_Name;
		    }
		}); 		
		var row=$("#stuTab").datagrid("getSelections");
		if(row==false){//判断如果没有选中的行则提示
		alert("请选中被分量的客户");
		}else{
				$('#updateziXunName').dialog('open');
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
		var all=$("#allasker").datalist("getSelections");
		if(all != null && all != ""){
			var aid=all[0].askers_Id;
			var namezixun=all[0].askers_Name;			
		}
		$.ajax({
			url:'updatezixunname',
			method:'post',
			dataType:'json',
			data:{
				stu_id:stu_id.toString(),
				askers_Id:aid,
				stu_ZiXunName:namezixun
			},
			success:function(res){
				if(res>0){
					$.messager.alert('提示','分量成功');
					$('#stuTab').datagrid('reload');
					$('#allasker').datalist('reload');
					$('#updateziXunName').dialog('close');
				}else{
					$.messager.alert('提示','修改失败');
				}
			}
		})
	} 
	
	function formatterSex(value, row, index){
		return value==0? '男':'女';
	}
	
	</script>
</head>
<body>
 		<input type="hidden" value="${list}" id="cha">
		<input type="hidden" value="${fenliang}" id="fen">
		自动分量: <input class="easyui-switchbutton" id="fenliang" data-options="onText:'Yes',offText:'No'">
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="piliang()">手动分量</a> 
		<table id="stuTab" data-options="fitColumns:true">   
	     <thead>   
	        <tr>  
	       		<th data-options="field:'checkbox',checkbox:true"></th>
	        	<th data-options="field:'stu_id'">编码</th>   
	            <th data-options="field:'stu_Name'">姓名</th> 
	            <th data-options="field:'stu_Age'">年龄</th>   
	        	<th data-options="field:'stu_Sex',formatter:formatterSex">性别</th>  
	        	<th data-options="field:'stu_Phone'">手机号</th>
	        	<th data-options="field:'stu_Status'">学历</th>   
	            <th data-options="field:'stu_PerState'">个人状态</th>   
	        	<th data-options="field:'stu_MsgSource'">客户信息</th>  
	        	<th data-options="field:'stu_SourceUrl'">信息来源</th>	        	 
	            <th data-options="field:'stu_Address'">地址</th>	           
	        	<th data-options="field:'stu_qq'">QQ</th>  
	        	<th data-options="field:'stu_WeiXin'">微信</th>
	        	<th data-options="field:'stu_Content'">内容</th>   	            
	       		<th data-options="field:'sexitInte'">打分</th>
	       		<th data-options="field:'stu_ZiXunName'">咨询师备注</th>   
	            <th data-options="field:'stu_CreateUser'">录入人</th> 	           
        		
	        </tr>   
	    </thead>   
	</table>
	 	

	
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
	    			<tr>
	    				<td>咨询师姓名：</td>
	    			</tr>    	  
	    		<tr>	    			
	    			<td><div id="allasker" style="width:200px;height:200px;"></div></td>
	    		</tr>
	    	</table>
	    </form>
	</div>
	
	
		
</body>
</html>