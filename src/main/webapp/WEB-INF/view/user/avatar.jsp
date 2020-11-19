
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/bootstrap" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
    <script src="/js/jquery-3.4.1.min.js"></script>
    <script src="/js/bootstrap.js"></script>

    <title>Hasaki ›更换头像</title>
</head>
<body>

<%@ include file="../components/nav-top.jsp"%>

<div style="width: 75%;margin:4% 2% 4.5% 12%;float: left;">
    <div class="panel panel-default" id="main">
        <div class="panel-heading" style="background-color: white">
            <a href="/forum">Hasaki</a> › 设置 › 头像上传
        </div>

        <div class="panel-body">

            <form action="/user/avatar" enctype="multipart/form-data" method="post" class="form-horizontal" role="form">
                <div style="margin-left: 17%; margin-top: 4%">
                    <img width="60px" height="60px" src="${user.avatar}" class="img-rounded">
                    <input type="file"  name="avatar" accept="image/png,image/jpeg,image/jpg" style="margin-top: 3.5%" >
                    <br/>
                    <input class="btn btn-default" type="submit" value="上传头像">
                    <a href="/user/update" class="btn btn-default">返回</a>
                </div>
            </form>
        </div>
    </div>

</div>

<%@ include file="../components/footer.jsp"%>

</body>
</html>