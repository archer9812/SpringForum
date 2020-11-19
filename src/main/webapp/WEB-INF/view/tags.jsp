
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
    <title>Hasaki</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
</head>
<body>
<%@include file="components/nav-top.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="page-header text-center">
                板块列表
            </div>
            <div class="row">
                <c:forEach items="${tabs}" var="tab">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div style="font-size: 30px">${tab.dcount}</div>
                                        <div>${tab.tabName}</div>
                                    </div>
                                </div>
                            </div>
                            <a href="tab/${tab.tabNameEn}">
                                <div class="panel-footer">
                                    <span class="pull-left">进入板块</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-4">
            <div style="margin-bottom: 0" class="page-header text-center">
                活跃用户
            </div>
            <div class="panel-body panel-avatar">
                <c:forEach items="${hotUsers}" var="users">
                    <a class="avatar user-avatar" href="" style="background-image: url(${users.avatar})"></a>
                </c:forEach>
            </div>
            <div style="margin-top: 10px; margin-bottom: 0" class="page-header text-center">
                最新用户
            </div>
            <div class="panel-body panel-avatar">
                <c:forEach items="${newUsers}" var="newuser">
                    <a class="avatar user-avatar" href="" style="background-image: url(${newuser.avatar})"></a>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="jumbotron">
        <h3>Hasaki</h3>
        <p>我们正在构建一个小众社区，大家在这里相互信任，以平等 • 自由 • 奔放的价值观进行分享交流。最终，希望大家能够找到与自己志同道合的伙伴，共同成长。</p>
        <button class="btn btn-success">注册</button>
        <button class="btn btn-default">关于</button>
    </div>
</div>
<%@include file="components/footer.jsp"%>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/jquery-confirm.min.js"></script>
<script src="/js/hasaki.js"></script>
</body>
</html>
