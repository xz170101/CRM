<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>角色</title>
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.3/themes/metro/easyui.css">
   	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.min.js"></script>
   	<script type="text/javascript" src="js/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
   	<script type="text/javascript" src="js/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
 <script type="text/javascript">
		 
		//加载角色信息
		$(function(){
		    $("#dg").datagrid({ 
		    	url:"selectRole",  //数据接口的地址
		    	method:'post',
		        fitColumns:true,
		        pagination:true,
		        rownumbers:true,
		        singleSelect:true,
		        toolbar:"#usertb"
		   });
		});
		//角色操作
		function formatterRoles(value,row,index){
			return "<a href='javascript:void(0);'  onclick='updateInfo(" + index + ")'>编辑</a>  <a href='javascript:void(0);' onclick='delInfo(" + index + ")'>删除</a> "
		}
		//设置权限操作
		function formatterPower(value,row,index){
			return "<a href='javascript:void(0);'  onclick='SetPower(" + index + ")'>设置</a> "
		}
		function SetPower(index){
 			var data=$("#dg").datagrid("getRows");
			$("#SetRight").dialog({
				close:false,
				title:"你正在设置"+data[index].roles_Name+"权限"
			});
			//alert(data[index].roles_Id);
			$('#treemenu').tree({
	  			url:"selectModuleByRoleId",
	  			queryParams:{
	  				roles_Id:data[index].roles_Id
	  			} ,onContextMenu:function(e,node){
	  				
	  				$('#treemenu').tree('select',node.target);
	  			}
	  		});
	  		//保存修改角色权限  **模块信息
		  $("#saveSetRose").click(function(){
 			var data=$("#dg").datagrid("getRows");
 			//获取所有勾选项的树节点构成的数组
			var nodes=$('#treemenu').tree('getChecked',['checked','indeterminate']);
			var s="";
			for (var i=0;i<nodes.length;i++) {
				if(s==""){
					s+=nodes[i].id;
				}else{
					s+=",";
					s+=nodes[i].id;
				}
			}
			$.ajax({
				url:"saveRoleMod",
				type:"post",
				async: false,
				dataType:'json',
				data:{"modules_Ids":s,"roles_Id":data[index].roles_Id},
				success:function(r){
					if(r>0){
						$("#SetRight").dialog("close"); 
						$("#dg").datagrid("reload");
						$.messager.alert("提示","保存权限成功");
						s="";
						 //window.top.loadTree();
	 				}else{
	 					$("#SetRight").dialog("close"); 
						$("#dg").datagrid("reload");
						$.messager.alert("提示","已清空！");
					}
				}
			});
			/* $.post("saveRoleMod",{
				modules_Ids: s,
				roles_Id:data[index].roles_Id 
			},function(r){
				if(r>0){
					$("#SetRight").dialog("close"); 
					$("#dg").datagrid("reload");
					$.messager.alert("提示","保存权限成功");
					s="";
					 //window.top.loadTree();
 				}else{
 					$("#SetRight").dialog("close"); 
					$("#dg").datagrid("reload");
					$.messager.alert("提示","已清空！");
				}
			},"json"); */
			});
		}
		//打开添加面板
		function addRoles(){
			$('#addRolse_window').dialog('open');
		}
		//点击添加按钮提交
		function submitRolseForm(){
			var flag=$("#addRolseForm").form("validate");//验证文本框内容是否有效
            var rname=$("#rname").val();
			if(flag){
                $.post("insertRole", {    
                        roles_Name:rname
                    }, function(res){
                        if(res>0){
                            $("#addRolse_window").dialog("close");//关闭添加窗口
                            $("#dg").datagrid("reload"); //通过调用reload方法，让datagrid刷新显示数据
                        	$.messager.alert("提示！","新增成功！");//提示
                        }
                },"json");
            }    
		}
		//修改角色
		function updateInfo(index){
			var data = $("#dg").datagrid("getData"); //获取datagrid对应的json对象集合  
            var row = data.rows[index]; //获取第index行对应的json对象
          	$("#updateRolseForm").form("load",row); //使用form的load方法，快速将json对象的数据显示到 弹出窗口的表单元素之中。
            $("#updateRolse_window").window("open");//打开窗口  
		}
		//提交修改
		 function submitUpdateRolseForm(){
            var rname=$("#rName_exit").val();
            var rid=$("#rId_exit").val();
            alert(rname);
            alert(rid);
             $.post("updateRole",{
            	 roles_Name:rname,
					roles_Id:rid,
                },function(res){
                     if(res>0){
                        $("#updateRolse_window").dialog("close");
                        $("#dg").datagrid("reload");
                        $.messager.alert("提示！","修改成功！");
                    }                       
                },"json");
        }
		//取消修改角色
		  function closeRolseForm(){
            $("#updateRolse_window").dialog("close");
		  	$("#addRolse_window").dialog("close");
		  }
		//删除角色
		function delInfo(index){
			$.messager.confirm('确认','您确认想要删除角色吗？',function(r){   
    		if (r){ // 用户点击了确认按钮 执行删除    
 				var data = $("#dg").datagrid("getData"); //获取datagrid对应的json对象集合  
	            var row = data.rows[index]; //获取第index行对应的json对象
	            $.post("delRole",
                    {
                        roles_Id:row.roles_Id,
                    },function(res){
                        if(res>0){
                        	$("#dg").datagrid("load");
	                        $.messager.alert("提示！","删除成功");
                        }
                    });   
 				 }   
			});
		}
	</script>
	<body>
		<table name="center" class="easyui-datagrid" id="dg" title="角色列表" style="width:300;height:400"  >
		    <thead>
		        <tr>
		             <th data-options="field:'roles_Id',width:280,hidden:true">角色ID</th>
		             <th data-options="field:'roles_Name',width:100">角色名称</th>
  		             <th data-options="field:'QXCaoZuo',width:180, formatter:formatterPower">权限</th>
  		             <th data-options="field:'CaoZuo',width:180, formatter:formatterRoles">操作</th>
 		        </tr>
		    </thead>
		</table>
		<!--新增按钮-->
		<div id="usertb" style="padding:5px; height:auto">
		    <div style="margin-bottom:5px">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addRoles()">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
 		    </div>
		</div>
		<!--添加面板-->
		<div id="addRolse_window" class="easyui-dialog" title="新增角色信息" data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
								text:'保存',
								handler:function(){ submitRolseForm();}
							},{
								text:'关闭',
								handler:function(){ closeRolseForm();}
							}]" style="width:300px;height:200px;padding:10px;">
	         <form id="addRolseForm">
	            <table cellpadding="5">
	                <tr>
	                    <td>角色名:</td>
	                    <td><input class="easyui-textbox" type="text" name="name" id="rname" data-options="required:true"></input></td>
	                </tr>
	            </table>
	         </form>
             
  		</div>
		<!--修改面板-->
		<div id="updateRolse_window" class="easyui-dialog" title="修改角色信息" data-options="modal:true,closed:true,iconCls:'icon-save',buttons:[{
								text:'保存',
								handler:function(){ submitUpdateRolseForm();}
							},{
								text:'关闭',
								handler:function(){ closeRolseForm();}
							}]" style="width:350px;height:200px;padding:10px;">
         	<form id="updateRolseForm">
                <table cellpadding="5">
              		<tr>
                        <td> </td>
                        <td><input   type="hidden" name="roles_Id"   id="rId_exit" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>角色名:</td>
                        <td><input class="easyui-textbox" type="text" name="roles_Name"   id="rName_exit" data-options="required:true"></input></td>
                    </tr>
                </table>
         	</form>
             
    	</div>
		<!--设置角色权限-->
	 	 <div id="setRolse_window" class="easyui-dialog" title="设置角色" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:500px;height:300px;padding:10px;">
         	 <div id="SetRight" data-options="buttons:'#bb'"  title="请选择模块" style="width: 400px;height: 450px;background: #eee;">
				<ul id="treemenu" data-options="checkbox:true"></ul>
			</div>
    	</div>
	 	 <div id="bb" hidden="hidden">
	 	  <a id="saveSetRose" href="javascript:void(0)"class="easyui-linkbutton"  onclick="submitSetRolseForm()">保存</a> 
		 </div>
	</body>
</html>