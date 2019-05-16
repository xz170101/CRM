﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta content="" name="description" />
    <meta content="webthemez" name="author" />
    <title>视图看板【统计】</title>
 
    <link href="js/assets/css/grid.css" rel="stylesheet" />
    <link rel="stylesheet" href="js/assets/css/kanban.css">
 
</head>

<body>
<div id="51vui-View">
	<div id="page-51vui-View">
        <div id="page-inner">
            <!-- 头部 -->
            <div class="row ">
                <div class="headerBar">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <h3 class="h3">2018年财务预算视图</h3>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="years">
                            <input type="text" class="spinnerExample"/>
                        </div>
                        <div class="profile">
                            <div class="filter-box">
                                <div class="filter-text">
                                    <input class="filter-title" type="text" readonly placeholder="pleace select" />
                                    <i class="icon icon-filter-arrow"></i>
                                </div>
                                <select name="filter">
                                    <option value="new" disabled>禁用效果</option>
                                    <option value="unaudited">未审核</option>
                                    <option value="nothrough" selected>未通过</option>
                                    <option value="audit">正在审核</option>
                                    <option value="audited">已审核</option>
                                     <option value="passed">已通过</option>
                                    <option value="1">酷设网</option>
                                    <option value="2">酷设网A</option>
                                    <option value="3">酷设网B</option>
                                    <option value="4">酷设网C</option>
                                    <option value="5">酷设网S</option>
                                    <option value="6">酷设网D</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //头部 -->

            <!-- 总预算 -->
            <div class="row">
                <div class="col-md-3 col-sm-12 col-xs-12">
				    <div class="board">
                        <div class="panel panel-primary">
                            <h3 class="panel-title">总预算</h3> 
                            <div class="number">
                                <h3>987,220</h3>
                            </div>
                            <div id="budget"></div>
                            <div class="indicateNum">
                                <div class="rows">
                                    CAPEA<br/>
                                    100个
                                </div>
                                <div class="rows line">
                                    OPEX<br/>
                                    30个
                                </div>
                            </div>
                        </div>
					</div>
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="board">
                        <div class="panel panel-primary">
                            <h3 class="panel-title">固定</h3> 
                            <div class="number">
                                <h3>902,645</h3>
                            </div>
                            <div id="fixation"></div>
                            <div class="indicateNum">
                                <div class="rows">
                                    CAPEA<br/>
                                    ￥:4000000400
                                </div>
                                <div class="rows line">
                                    CAPEA<br/>
                                    ￥:300000400
                                </div>
                            </div>
                        </div>
					</div>
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12">
					<div class="board">
                        <div class="panel panel-primary">
                            <h3 class="panel-title">无形</h3> 
                            <div class="number">
                                <h3>122,220</h3>
                            </div>
                            <div id="invisible"></div>
                            <div class="indicateNum pad20p">
                                <div>计划值：￥9922,220</div>
                                <div>实际值：￥9422,220 </div>
                            </div>
                        </div>
					</div>
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="board">
                        <div class="panel panel-primary">
                            <h3 class="panel-title">IT金额</h3> 
                            <div class="number">
                                <h3>122,220</h3>
                            </div>
                            <div id="itsum"></div>
                            <div class="indicateNum pad20p">
                                <div>计划值：￥9922,220</div>
                                <div>实际值：￥9422,220 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //总预算 -->

            <!-- 类别 -->
            <div class="row">
                <div class="col-sm-6 col-xs-12">  
                    <div class="panel panel-default chartJs">
                        <div class="panel-heading">
                            <div class="card-title">
                                <div class="title">各部门收入(单位万元)</div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <span id="chartWork" class="chart" style="width:100%;height:350px;"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <div class="panel panel-default chartJs">
                        <div class="panel-heading">
                            <div class="card-title">
                                <div class="title">各产品收入(单位万元)</div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <spn id="analysisChart" class="chart" style="width:100%;height:350px;"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="tableRow">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th style="width:50px;">#</th>
                                    <th>项目名称</th>
                                    <th>类别</th>
                                    <th>PM</th>
                                    <th style="width:300px">进度百分比</th>
                                    <th>当前阶段</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>一条SQL搞定echarts 写写SQL</td>
                                    <td>无数据</td>
                                    <td>IT类</td>
                                    <td>
                                        <div id="tbProgress1" class="tbPbar"></div>
                                    </td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>科技外包管理系统</td>
                                    <td>预算类</td>
                                    <td></td>
                                    <td><div id="tbProgress2" class="tbPbar"></div></td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>科技外包管理系统</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td><div id="tbProgress3" class="tbPbar"></div></td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>科技外包管理系统</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td><div id="tbProgress4" class="tbPbar"></div></td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>科技外包管理系统</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td><div id="tbProgress5" class="tbPbar"></div></td>
                                    <td>无数据</td>
                                </tr>
                            </tbody>
                        </table>
                        <a href="javasript:;">更多 </a>
                    </div>
                </div>
            </div>
            <!-- //类别 -->
			
            <!-- 采购 -->
			<div class="row">
			    <div class="col-md-6 col-xs-12">
					<div class="panel panel-default">
						<div class="panel-heading">阶段分类</div>
						<div class="panel-body">
							<div id="wc-line-chart" style="width:100%;height:350px;"></div>
						</div>
                    </div>   
				</div>

                <div class="col-md-6 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">采购分类</div>
                        <div class="panel-body">
                            <div id="defect-chart" style="width:100%;height:350px;"></div>
                        </div>
                    </div>  
				</div>

                <div class="col-sm-12">
                    <div class="tableRow">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>项目名称</th>
                                    <th>类别</th>
                                    <th>PM</th>
                                    <th>进度百分比</th>
                                    <th>当前阶段</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>一条SQL搞定echarts 写写SQL</td>
                                    <td>IT类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>科技外包管理系统</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>风险分析管理系统</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>抓图利器HypeSnap</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>多格式音频播放软件</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>网络媒体流下载工具</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>图像浏览软件</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>网络媒体流下载工具</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>代理服务器软件</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>DOS操作管理系统</td>
                                    <td>预算类</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                    <td>无数据</td>
                                </tr>
                            </tbody>
                        </table>
                        <a href="javasript:;">更多 </a>
                    </div>
                </div>
			</div> 
            <!-- //采购 -->
		 
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE 51vui-View  -->
</div>
<!-- /. 51vui-View  -->

 
<script src="js/assets/js/jquery2.1.1.js" type="text/javascript"></script>
<script src="js/assets/js/echarts.min.js" type="text/javascript"></script>
<script src="js/assets/js/custom.js" type="text/javascript"></script>
<script src="js/assets/js/jquery.spinner.js" type="text/javascript"></script>
 

<script type="text/javascript">
    $('.spinnerExample').spinner({});
    //这里是初始化下拉
    $('.filter-box').selectFilter({
        callBack : function (val){
            //返回选择的值
            console.log(val+'-是返回的值')
        }
    });

</script>

</body>

</html>