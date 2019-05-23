var _menus_oneLeve=[{"menuid":"0","menuname":" ","icon":" "}];
var _menus=[
    {"menuid":"00","icon":"fa-trophy","menuname":"模块管理",parentMenu:'0',
        "menus":[{"menuid":"002","menuname":"管理模块","icon":"fa-delicious","url":"indexGL"},
        		{"menuid":"000","menuname":"统计模块1","icon":"fa-dashboard","url":"statistics"},
                {"menuid":"001","menuname":"统计模块","icon":"fa-delicious","url":"statistics01"}
            ]} 
];

    //设置修改密码窗口
    function openPwd() {
    	$('#updatePwd').window({title: '修改密码', width: 300, modal: true, shadow: true, closed: true, height: 200, resizable:false }); 
    }
    //关闭登录窗口
    function closePwd() {
    	$('#updatePwd').window('close');}

    //修改密码
    function serverLogin() {
        var $newpass = $('#txtNewPass');
        var $rePass = $('#txtRePass');
        var pwd= $("#txtPass").val();
        var RegPwd=/^[a-z0-9]{6,12}$/;
        if (pwd == '') {
            msgShow('系统提示', '请输入原密码！', 'admin');
            return false;
        }
        if ($newpass.val() == '') {
            msgShow('系统提示', '请输入新密码！', 'admin');
            return false;
        }
        if ($rePass.val() == '') {
            msgShow('系统提示', '请再一次输入新密码！', 'admin');
            return false;
        }

        if ($newpass.val() != $rePass.val()) {
            msgShow('系统提示', '两次密码不一致！请重新输入', 'admin');
            return false;
        }
        if(!(RegPwd.test(pwd)) && !(RegPwd.test($newpass.val())) ){
        	msgShow('系统提示', '密码必须为6~12位的数字或字母！', 'admin');
   		 		return false;
   	 	}
        var name=$("#name").html();
        $.post('setPwd' ,{
        		passWord:pwd,//原密码
        		pwd:$newpass.val(),//新密码
	        	loginName:name
        	}, function(msg) {
        		if(msg>0){
        			 msgShow('系统提示', '恭喜，密码修改成功！', 'info');
        			   closePwd();
        		}else{
        			 msgShow('系统提示', '原密码不正确！', 'info');
        		}
	        })
	    }

    $(function() {
        openPwd();
        $('#editpass').click(function(){$('#updatePwd').window('open');});
        $('#btnEp').click(function(){serverLogin();});
		$('#btnCancel').click(function(){closePwd();});
        $('#loginOut').click(function() {
            $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {
                if (r) {
                	$.ajax({
        				url:"outLogin",
        				method:'post',
        				dataType:'json',
        				success:function(data){
        					location.href = 'crm';
        				}
        			})
                	//sessionStorage.clear();//seesionStorage的数据不会跟随HTTP请求一起发送到服务器，只会在本地生效，并在关闭标签页后清除数据。
                	//session.invalidate();
                }
            });
        })
    });
$(function(){
	var mydate = new Date(); 
	var tm=mydate.getFullYear(); 
	$("#timeYear").text(tm); 
	});