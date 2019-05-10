var _menus_oneLeve=[{"menuid":"0","menuname":"首页","icon":"fa-home"}];
var _menus=[
    {"menuid":"00","icon":"fa-trophy","menuname":"模块管理",parentMenu:'0',
        "menus":[{"menuid":"002","menuname":"管理模块","icon":"fa-delicious","url":"../demo/indexGL.jsp"},
        		{"menuid":"000","menuname":"统计模块1","icon":"fa-dashboard","url":"../demo/statistics.jsp"},
                {"menuid":"001","menuname":"统计模块","icon":"fa-delicious","url":"../demo/statistics01.jsp"}
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
            msgShow('系统提示', '请在一次输入密码！', 'admin');
            return false;
        }

        if ($newpass.val() != $rePass.val()) {
            msgShow('系统提示', '两次密码不一至！请重新输入', 'admin');
            return false;
        }

        $.post('/ajax=' + $newpass.val(), function(msg) {
            msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
            $newpass.val('');
            $rePass.val('');
            close();
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
                    location.href = '../login.jsp';
                }
            });
        })
    });

$(function(){
	var mydate = new Date(); 
	var tm=mydate.getFullYear(); 
	$("#timeYear").text(tm); 
	});