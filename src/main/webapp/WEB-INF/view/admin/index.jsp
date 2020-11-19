
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台首页</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">
    <link rel="stylesheet" href="/fonts/awesome/css/font-awesome.css">
</head>
<body>
<%@include file="../components/nav-top.jsp"%>
<div class="container">
    <div class="row">
        <div class="main">
            <h1 class="page-header">控制台</h1>

            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-users fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${userNum}</div>
                                    <div>用户数量</div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/user">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${topicNum}</div>
                                    <div>帖子总数</div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/topic">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                        <i class="fa fa-comment fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${replyNum}</div>
                                    <div>回复总数</div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/reply">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${tabNum}</div>
                                    <div>板块总数</div>
                                </div>
                            </div>
                        </div>
                        <a href="/admin/tab ">
                            <div class="panel-footer">
                                <span class="pull-left">详细信息</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <h2 class="sub-header">最近登录记录</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>IP</th>
                        <th>登录时间</th>
                        <th>硬件信息</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="log" items="${recentLog}" varStatus="status">
                        <tr>
                            <td>${status.index+1}</td>
                            <td>${log.ip}</td>
                            <td>${log.loginTime}</td>
                            <td>${log.device}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/jquery-confirm.min.js"></script>
    <script src="/js/hasaki.js"></script>
</body>
</html>
