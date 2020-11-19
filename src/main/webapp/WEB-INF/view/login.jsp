
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
    <title>Hasaki-Pro - 登录</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
</head>
<body>
<%@include file="components/nav-top.jsp"%>
<div class="container">
    <div class="page-header">
        <h4>登录</h4>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title text-center">账户登录</h3>
                </div>
                <div class="panel-body">
                    <div>
                        <c:if test="${empty user}">
                            <div class="form-group">
                                <label for="user">用户名</label>
                                <input type="text" class="form-control" id="user" placeholder="用户名">
                            </div>
                            <div class="form-group">
                                <label for="pass">密码</label>
                                <input type="password" class="form-control" id="pass" placeholder="密码">
                            </div>
                            <button id="securityLogin" class="btn btn-success btn-block">立即登录</button>
                            <a href="/forget" class="btn btn-default btn-block">忘记密码</a>
                        </c:if>
                        <c:if test="${!empty user}">
                            您已登录，请勿重新登录
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="components/footer.jsp"%>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/jquery-confirm.min.js"></script>
<script src="/js/hasaki.js"></script>
<script>
    $('#register').click(function () {
        $.post(
            "register", {
                username: $('#user').val(),
                password: $('#pass').val(),
                confirm: $('#confirm').val(),
                email: $('#email').val(),
                chapter: $('#chapter').val(),
                phone_num: $('#phone_num').val(),
            }, function (data) {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data
                })
            }, 'text'
        )
    })
</script>
</body>
</html>