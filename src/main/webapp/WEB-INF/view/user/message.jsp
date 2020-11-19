
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
    <link rel="stylesheet" href="/css/sb-admin-2.css">
    <link rel="stylesheet" href="/css/metisMenu.min.css">
    <link rel="stylesheet" href="/fonts/awesome/css/font-awesome.css">
</head>
<body>
<%@include file="../components/nav-top.jsp"%>
<div class="container">
    <div class="row">
        <div class="main">
            <h1 class="page-header">消息中心</h1>
            <div class="chat-panel panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-comments fa-fw"></i> Chat
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-chevron-down"></i>
                        </button>
                        <ul class="dropdown-menu slidedown">
                            <li>
                                <a href="#">
                                    <i class="fa fa-refresh fa-fw"></i> Refresh
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-check-circle fa-fw"></i> Available
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-times fa-fw"></i> Busy
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-clock-o fa-fw"></i> Away
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-sign-out fa-fw"></i> Sign Out
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <ul class="chat">
                        <c:forEach var="message" items="${messages}">
                            <c:if test="${message.user_id != user.id}">
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img style="width: 50px;" src="<c:if test="${message.user!=null}">${message.user.avatar}</c:if><c:if test="${message.user_id == user.id}">${user.avatar}</c:if><c:if test="${message.user_id != user.id}">${r_user.avatar}</c:if>" alt="User Avatar" class="img-circle">
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font"><c:if test="${message.user!=null}">${message.user.username}</c:if><c:if test="${message.user_id == user.id}">${user.username}</c:if><c:if test="${message.user_id != user.id}">${r_user.username}</c:if></strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> ${message.createTime}
                                            </small>
                                        </div>
                                        <p>
                                                ${message.content}
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${message.user_id == user.id}">
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img style="width: 50px;" src="<c:if test="${message.user_id == user.id}">${user.avatar}</c:if><c:if test="${message.user_id != user.id}">${r_user.avatar}</c:if>" alt="User Avatar" class="img-circle">
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> ${message.createTime}</small>
                                            <strong class="pull-right primary-font"><c:if test="${message.user_id == user.id}">${user.username}</c:if><c:if test="${message.user_id != user.id}">${r_user.username}</c:if></strong>
                                        </div>
                                        <p>
                                                ${message.content}
                                        </p>
                                    </div>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <!-- /.panel-body -->
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="msg" type="text" class="form-control input-sm" placeholder="在此处输入您要发送的消息">
                        <span class="input-group-btn">
                            <c:if test="${r_user != null}">
                                <button class="btn btn-warning btn-sm" id="sendMsg">
                                    发送
                                </button>
                            </c:if>
                           <c:if test="${r_user == null}">
                               <button class="btn btn-warning btn-sm disabled">
                                    只读模式
                                </button>
                           </c:if>
                        </span>
                    </div>
                </div>
                <!-- /.panel-footer -->
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/jquery-confirm.min.js"></script>
<script src="/js/hasaki.js"></script>
<script>
    $('#sendMsg').click(function () {
        $.post(
            '/user/chat/${r_user.id}', {
                content: $('#msg').val()
            }, function (data) {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data,
                    buttons: {
                        ok: function () {
                            window.location.reload();
                        }
                    }
                })
            }
        )
    })
</script>
</body>
</html>
