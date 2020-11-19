
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <link rel="stylesheet" href="/css/datatables.css">
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
</head>
<body>
<%@include file="components/nav-top.jsp"%>
<div class="container">
    <div class="page-header">
        热帖
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">排行榜</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <ul class="list-group">
                    <c:set var="limitLength" value="50"></c:set>
                    <c:forEach items="${hotestTopics}" var="topic">
                        <li style="border: none; padding: 1px 12px;" class="list-group-item col-xs-12 col-md-6">
                            <div>
                                <a class="avatar-right" href="#">
                                    <c:if test="${fn:length(topic.title) > limitLength }">
                                        ${fn:substring(topic.title, 0, limitLength)}...
                                    </c:if>
                                    <c:if test="${fn:length(topic.title) <= limitLength }">
                                        ${topic.title}
                                    </c:if>
                                </a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>

            </div>
        </div>
    </div>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">${tab.tabName}</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="搜索帖子">
                    </div>
                    <button type="submit" class="btn btn-default">全局搜索</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">发布新帖 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/forum/write">发布新帖子</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="disabled"><a href="#">暂不开放</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <table id="table" class="table table-bordered">
        <thead>
        <tr>
            <th width="10">#</th>
            <th>标题</th>
            <th width="110">创作者</th>
            <th width="110">点击/回复</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${topics}" var="topic" varStatus="status">
            <tr>
                <td>${status.index}</td>
                <td><a href="/forum/t/${topic.id}">${topic.title}</a></td>
                <td>
                    <cite style="font-style: normal; display: block"><a>${topic.user.username}</a></cite>
                    <em style="font-size: 11px;font-style: normal;"><span><fmt:formatDate value="${topic.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></em>
                </td>
                <td>
                    <cite style="font-style: normal; display: block"><a>${topic.click}/${topic.countReplies}</a></cite>
                    <em style="font-size: 11px;font-style: normal;"><span><fmt:formatDate value="${topic.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></em>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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
<script src="/js/datatables.min.js"></script>
<script>
    $(document).ready( function () {
        $('#table').DataTable({
            "searching": true,
            "info": true,
            "ordering":false,
            // 水平滚动条
            "scrollX": false,
            // 垂直滚动条
            "scrollY": false,
            // 自动列宽
            "autoWidth": true,
            "buttons": [
                {
                    text: '发帖',
                    action: function () {
                        window.location.href = "/forum/write";
                    }
                }
            ],
            "language": {
                "paginate": {
                    "first": "首页",
                    "last": "末页",
                    "next": "下一页",
                    "previous": "上一页"
                },
                "lengthMenu": "展示 _MENU_ 条数据",
                "info": "展示 _PAGE_ 页 共 _PAGES_ 页",
                "search": "搜索"
            },
        });
    } );
</script>
</body>
</html>
