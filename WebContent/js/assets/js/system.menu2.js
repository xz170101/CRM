var _menus_oneLeve=[{"menuid":"0","menuname":"首页","icon":"fa-home"}];
var _menus=[
    {"menuid":"00","icon":"fa-trophy","menuname":"模块管理",parentMenu:'0',
        "menus":[{"menuid":"002","menuname":"管理模块","icon":"fa-delicious","url":"indexGL"},
        		{"menuid":"000","menuname":"统计模块1","icon":"fa-dashboard","url":"statistics"},
                {"menuid":"001","menuname":"统计模块","icon":"fa-delicious","url":"statistics01"}
            ]} 
];

    //设置登录窗口
    function openPwd() {
    	$('#updatePwd').window({title: '修改密码', width: 300, modal: true, shadow: true, closed: true, height: 160, resizable:false }); 
    }
    //关闭登录窗口
    function closePwd() {
    	$('#updatePwd').window('close');}

    //修改密码
    function serverLogin() {
        var $newpass = $('#txtNewPass');
        var $rePass = $('#txtRePass');

        if ($newpass.val() == '') {
            msgShow('系统提示', '请输入密码！', 'admin');
            return false;
        }
        if ($rePass.val() == '') {
            msgShow('系统提示', '请再一次输入密码！', 'admin');
            return false;
        }

        if ($newpass.val() != $rePass.val()) {
            msgShow('系统提示', '两次密码不一致！请重新输入', 'admin');
            return false;
        }
        var name=$("#name").html();
        alert(name);
        $.post('../setPwd' ,{
        		passWord:$newpass.val(),
	        	loginName:name
        	}, function(msg) {
	            msgShow('系统提示', '恭喜，密码修改成功！', 'info');
	             
	            closePwd();
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
                	sessionStorage.clear();//seesionStorage的数据不会跟随HTTP请求一起发送到服务器，只会在本地生效，并在关闭标签页后清除数据。
                    location.href = 'crm';
                }
            });
        })
    });

$(function(){
	var mydate = new Date(); 
	var tm=mydate.getFullYear(); 
	$("#timeYear").text(tm); 
	});