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
    <script type="text/javascript" src="js/assets/echars/config.js"></script>
    <script type="text/javascript" src="js/assets/echars/esl.js"></script>
    <script type="text/javascript" src="js/assets/echars/facePrint.js"></script>
    <script type="text/javascript">
    	$(function() {
    		UserCount();
    		StudentCount();
    		TransactionCount();
    		UserCheckCount();
    		RoseCount();
    		SourceUrl();
    		selectWeekCount();
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
    		        	 var length=Object.keys(data).length;//获取返回的map集合的长度
    		        	 for(var i=0;i<=length-1;i++){
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
 		            var chart = echarts.init(document.getElementById('chart-panel'));
 		            chart.setOption({
 		                legend: {
 		                    type: 'scroll',
 		                    right: 0,
 		                    orient: 'vertical',
 		                    data:  data.name
 		                },
 		                toolbox: {
 		                    left: 'left',
 		                    feature: {
 		                        dataView: {},
 		                        saveAsImage: {}
 		                    }
 		                },
 		                tooltip: {
 		                    confine: true
 		                },
 		                series: [{
 		                    name: '客户来源',
 		                    type: 'pie',
 		                    data: data,
 		                }]
 		            });
 		        	 
 		       		 }
 		 			});
				}
    
    function selectWeekCount() {
   	 $.ajax({
	        url:"selectIsPay",
	        type:"post",
	        dataType:"json",
	        success:function(data){
				console.log(data);
				var aa=[0,0,0,0,0,0,0];
				var ab=[0,0,0,0,0,0,0];
 					//'monday','tuesday','wednesday','thursday','friday','saturday','sunday'
				if(data[0].length!=0 && data[0].length!=""){
						for(var j=0;j<=(data[0].length)-1;j++){
						  if(data[0][j].name=='Monday'){
							  aa.splice(0,1,data[0][j].value)//从第0个位置，删1个，插入data[0][j].value
							}else if(data[0][j].name=='Tuesday'){
								aa.splice(1, 1,data[0][j].value)
							}else if(data[0][j].name=='Wednesday'){
								aa.splice(2, 1,data[0][j].value)
							}else if(data[0][j].name=='Thursday'){
								aa.splice(3,1,data[0][j].value)
							}else if(data[0][j].name=='Friday'){
								aa.splice(4,1,data[0][j].value)
							}else if(data[0][j].name=='Saturday'){
								aa.splice(5, 1,data[0][j].value)
							}else if(data[0][j].name=='Sunday'){
								aa.splice(6,1,data[0][j].value)
							}  
			 			}
					} 
				if(data[1].length!=0 && data[1].length!=""){
					for(var j=0;j<=(data[1].length)-1;j++){
					  if(data[1][j].name=='Monday'){
						  	ab.splice(0,1,data[1][j].value)//从第0个位置，删1个，插入data[1][j].value
						}else if(data[1][j].name=='Tuesday'){
							ab.splice(1, 1,data[1][j].value)
						}else if(data[1][j].name=='Wednesday'){
							ab.splice(2, 1,data[1][j].value)
						}else if(data[1][j].name=='Thursday'){
							ab.splice(3,1,data[1][j].value)
						}else if(data[1][j].name=='Friday'){
							ab.splice(4,1,data[1][j].value)
						}else if(data[1][j].name=='Saturday'){
							ab.splice(5, 1,data[1][j].value)
						}else if(data[1][j].name=='Sunday'){
							ab.splice(6,1,data[1][j].value)
						}  
		 			}
				} 
					 
 		    	var myChart2 = echarts.init(document.getElementById('selectWeekCount'));
		    	option2 = {
		    	    tooltip: {
		    	        trigger: 'axis'
		    	    },
		    	    legend: {
		    	         data:['本周', '上周']
		    	    },
		    	    grid: {
		    	        left: '3%',
		    	        right: '4%',
		    	        bottom: '3%',
		    	        containLabel: true
		    	    },
		    	    xAxis: {
		    	        type: 'category',
		    	        data: ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六","星期日"]
		    	    },
		    	    yAxis: {
		    	        type: 'value'
		    	    },
		    	    series: [
		    	        {
		    	            name:'本周',
		    	            type:'line',
		    	            step: 'start',
		    	            data:aa/* [data[0][0].value,data[0][1].value,data[0][2].value, 4, 9, 3, 1] */
		    	        },
		    	        {
		    	            name:'上周',
		    	            type:'line',
		    	            step: 'middle',
		    	            data:ab
		    	        } 
		    	    ]
		    	};
		    	myChart2.setOption(option2);
	        }
   	 	})
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
                        <div class="panel-heading"><i class="fa fa-soundcloud" style="padding-right: 5px;"></i>天气</div>
                        <div class="panel-body">
                            <!-- <div id="Canvas3" style="height:320px; width: 100%;"></div> -->
                             <div id="weather-view-he"></div>
                        </div>
                    </div>
                   <!--  <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-area-chart fa-lg" style="padding-right: 5px;"></i>成交对比</div>
                        <div class="panel-body">
                            <div id="selectWeekCount" style="height: 200px; width: 100%;"></div>
                        </div>
                    </div> -->
                </div>
            </div>  
        </div>
         <div class="rows" style="margin-bottom: 0.8%; overflow: hidden;">  
           <div style="float: left; width: 60%;">
                <div class="panel-box" style="height:360px;">
                 <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-area-chart fa-lg" style="padding-right: 5px;"></i>成交对比</div>
                        <div class="panel-body">
                            <div id="selectWeekCount" style="height: 200px; width: 100%;"></div>
                        </div>
                    </div>
                    <!-- <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-bar-chart fa-lg" style="padding-right: 5px;"></i>柱状图</div>
                        <div class="panel-body">
                            <div id="Canvas3" style="height:320px; width: 100%;"></div>
                            
                        </div>
                    </div> -->
                </div>
            </div>  
            <div style="float: right; width: 40%;">
                <div class="panel-box" style="height:360px;margin-top:0 ;">
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
 
 <!-- 天气 -->
 

<script>
WIDGET = {ID: 'PglOTKFu04'};
</script>
<script type="text/javascript" src="https://apip.weatherdt.com/view/static/js/r.js?v=1111"></script>
 
  </body>
</html>
