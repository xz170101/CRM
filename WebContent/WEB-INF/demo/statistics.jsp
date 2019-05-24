<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统【统计】</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="js/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="js/assets/css/dashboard.css">
    
</head>
<body>
    <div id="areascontent">
        <div class="rows" style="margin-bottom: 0.8%; overflow: hidden;">
            <div style="float: left; width: 69.2%;">
                <div class="panel-box" style="height: 100%; overflow: hidden;">
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#00A2E9;">
                            <div class="stat-icon">
                                <i class="fa fa-clock-o"></i>
                            </div>
                            <h2 class="m-top-none">17<span>个</span></h2>
                            <h5>待办未处理</h5>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#DD4810;">
                            <h2 class="m-top-none">12<span>条</span></h2>
                            <h5>预警信息未读</h5>
                            <div class="stat-icon">
                                <i class="fa fa-bell"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#D972E3;">
                            <h2 class="m-top-none">20<span>封</span></h2>
                            <h5>邮件未读</h5>
                            <div class="stat-icon">
                                <i class="fa fa-envelope-o"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#3AB9F1; margin-right: 0px;">
                            <h2 class="m-top-none">6</h2>
                            <h5>对公待签收任务</h5>
                            <div class="stat-icon">
                                <i class="fa fa-gavel"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#FFA300; margin-bottom: 0px;">
                            <h2 class="m-top-none">124<span>件</span></h2>
                            <h5>今日订单数</h5>
                            <div class="stat-icon">
                                <i class="fa fa-shopping-cart"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#2F4554; margin-bottom: 0px;">
                            <h2 class="m-top-none">225<span>件</span></h2>
                            <h5>昨日订单数</h5>
                            <div class="stat-icon">
                                <i class="fa fa-file-text-o"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#6656DD; margin-bottom: 0px;">
                            <h2 class="m-top-none">305<span>件</span></h2>
                            <h5>回退订单数</h5>
                            <div class="stat-icon">
                                <i class="fa fa-coffee"></i>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-stats">
                        <div class="dashboard-stats-item" style="background-color:#56BD4E; margin-right: 0px; margin-bottom: 0px;">
                            <h2 class="m-top-none">61235<span>元</span></h2>
                            <h5>昨日成交金额</h5>
                            <div class="stat-icon">
                                <i class="fa fa-rmb" style="padding-left: 10px;"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="float: right; width: 30%;">
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
                        <div class="panel-heading"><i class="fa fa-pie-chart fa-lg" style="padding-right: 5px;"></i>访问统计</div>
                        <div class="panel-body">
                            <div id="chart-panel" style="height:320px;width: 100%;"></div>
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
