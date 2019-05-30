<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统【统计】</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="js/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="js/assets/css/dashboard.css">
    <script type="text/javascript" src="js/assets/js/jquery2.1.1.js"></script>
    <script type="text/javascript" src="js/assets/js/echarts.min.js"></script>
    
    <script type="text/javascript">
    	$(function() {
    		UserCount();
    		StudentCount();
    		TransactionCount();
    		UserCheckCount();
    		RoseCount();
    		SourceUrl();
		});
    	//用户数量
    	function UserCount() {
    		 $.ajax({
    		        url:"selectUserCount",
    		        type:"post",
    		        dataType:"json",
    		        success:function(data){
    		        	$("#users").html(data+'人');
    		        }
    		 });
		}
    	//客户数量
    	function StudentCount() {
    		 $.ajax({
    		        url:"selectStudentCount",
    		        type:"post",
    		        dataType:"json",
    		        success:function(data){
    		        	$("#students").html(data+'人');
    		        }
    		 });
		}
    	//成交数量
    	function TransactionCount() {
    		 $.ajax({
    		        url:"selectTransactionCount",
    		        type:"post",
    		        dataType:"json",
    		        success:function(data){
    		        	$("#transaction").html(data+'人');
    		        }
    		 });
		}
    	//签到人数
    	function UserCheckCount() {
    		 $.ajax({
    		        url:"selectUserCheckCount",
    		        type:"post",
    		        dataType:"json",
    		        success:function(data){
    		        	$("#checkUser").html(data+'人');
    		        }
    		 });
		}
    	//各角色人数
    	function RoseCount() {
    		 $.ajax({
    		        url:"selectRoseCount",
    		        type:"post",
    		        dataType:"json",
    		        success:function(data){
    		        	 console.log(data);
    		        	 var length=Object.keys(data).length;//获取返回的map集合的长度
    		        	 for(var i=0;i<=length;i++){
    		        		 if(data[i].name=="管理员"){
    	    		        		$("#gly").html(data[i].value+'人');
    	    		        	}else if(data[i].name=="项目经理"){
    	    		        		$("#xmjl").html(data[i].value+'人');
    	    		        	}else if(data[i].name=="咨询师"){
    	    		        		$("#zxs").html(data[i].value+'人');
    	    		        	}else if(data[i].name=="网络咨询师"){
    	    		        		$("#wlzxs").html(data[i].value+'人');
    	    		        	}  
    		        		 }
    		       	 }
    			 });
			}
    	//查询客户的来源
    	function  SourceUrl() {
    		 $.ajax({
 		        url:"selectStuSourceUrl",
 		        type:"post",
 		        dataType:"json",
 		        success:function(data){
 		        	var myChart1 = echarts.init(document.getElementById('chart-panel'));
 		        	option1 = {
 		        	    tooltip : {
 		        	        trigger: 'item',
 		        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
 		        	    },
 		        	    legend: {
 		        	        orient: 'vertical',
 		        	        left: 'left',
 		        	        data: data.name
 		        	    },
 		        	    series : [
 		        	        {
 		        	            name: '客户来源',
 		        	            type: 'pie',
 		        	            radius : '55%',
 		        	            center: ['50%', '60%'],
 		        	            data:data ,
 		        	            itemStyle: {
 		        	                emphasis: {
 		        	                    shadowBlur: 10,
 		        	                    shadowOffsetX: 0,
 		        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
 		        	               		 }
 		        	            		}
 		        	       		 }
 		        	  		 ]
 		        			};
 		        	myChart1.setOption(option1);
 		       		 }
 		 			});
				}
    
    
    </script>
</head>
<body>
    <div id="areascontent">
        <div class="rows" style="margin-bottom: 0.8%; overflow: hidden;">
            <div style="float: left; width: 60%;">
                <div class="panel-box" style="height: 100%; overflow: hidden;">
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#00A2E9;">
                            <div class="stat-icon">
                               <i class="fa fa-user-circle-o" ></i>
                            </div>
                            <h2 id="users" class="m-top-none"><span>人</span></h2>
                            <h5>用户数量</h5>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#DD4810;">
                            <h2 id="students" class="m-top-none"><span>人</span></h2>
                            <h5>客户数量</h5>
                            <div class="stat-icon">
                                <i class="fa fa-file-text-o"></i>
                             </div>
                        </div>
                    </div>
                  
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#D972E3;">
                            <h2 id="transaction" class="m-top-none"><span>人</span></h2>
                            <h5>成交数量</h5>
                            <div class="stat-icon">
                               <i class="fa fa-handshake-o"></i>
                          </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#3AB9F1; margin-right: 0px;">
                            <h2 id="checkUser" class="m-top-none"><span>人</span></h2>
                            <h5>今日上班人数</h5>
                            <div class="stat-icon">
                             	<i class="fa fa-clock-o"></i>
                            </div>
                        </div>
                    </div> 
                     <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#FFA300; margin-bottom: 0px;">
                            <h2 id="gly" class="m-top-none"> <span>人</span></h2>
                            <h5>管理员</h5>
                            <div class="stat-icon">
                                <i class="fa fa-user-o"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#2F4554; margin-bottom: 0px;">
                            <h2 id="xmjl" class="m-top-none"> <span>人</span></h2>
                            <h5>咨询经理</h5>
                            <div class="stat-icon">
                                <i class="fa fa-street-view"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#6656DD; margin-bottom: 0px;">
                            <h2 id="zxs" class="m-top-none"> <span>人</span></h2>
                            <h5>咨询师</h5>
                            <div class="stat-icon">
                                <i class="fa fa-user"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#56BD4E; margin-right: 0px; margin-bottom: 0px;">
                            <h2 id="wlzxs" class="m-top-none"> <span>人</span></h2>
                            <h5>网络咨询师</h5>
                            <div class="stat-icon">
                                <i class="fa fa-grav" style="padding-left: 10px;"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="float: right; width: 39%;">
                <div class="panel-box" style="height:260px;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-area-chart fa-lg" style="padding-right: 5px;"></i>成交订单</div>
                        <div class="panel-body">
                            <div id="Canvas2" style="height: 200px; width: 100%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="rows" style="margin-bottom: 0.8%; overflow: hidden;">
            <div style="float: left; width: 69.2%;">
                <div class="panel-box" style="height:360px;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-bar-chart fa-lg" style="padding-right: 5px;"></i>柱状图</div>
                        <div class="panel-body">
                            <div id="Canvas3" style="height:320px; width: 100%;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="float: right; width: 30%;">
                <div class="panel-box" style="height:360px;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-pie-chart fa-lg" style="padding-right: 5px;"></i>客户来源统计</div>
                        <div class="panel-body">
                            <div id="chart-panel" style="height:320px;width: 100%;"></div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
 </div>
<script src="js/assets/js/jquery2.1.1.js" type="text/javascript"></script>
<script src="js/assets/js/echarts.min.js"></script>
<script src="js/assets/js/charts/Chart.js"></script>
<script src="js/assets/js/dashboard.js"></script>
 
 

</body>
</html>
