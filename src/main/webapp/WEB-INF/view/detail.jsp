
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
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
    <link rel="stylesheet" href="/editor/css/editormd.preview.css">
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
                                <a class="avatar-right" href="/forum/t/${topic.id}">
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
                    <button type="submit" class="btn btn-default">搜索</button>
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
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                <a href=""><img src="${topic.user.avatar}" alt="" class="avatar-small img-responsive img-rounded hidden-lg hidden-md"></a>
                <small class="hidden-lg hidden-md">${topic.user.username}:</small>
                ${topic.title}
            </h3>
        </div>
        <div class="panel-body" style="background-color: #ffedc3">
            <div class="row">
                <div class="col-md-2 hidden-sm hidden-xs" style="border-right: #d6e9c6 2px solid; background-color: #ffedc3">
                    <img src="${topic.user.avatar}" alt="" class="img-responsive img-rounded">
                    <h5 class="text-center">${topic.user.username}</h5>
                </div>
                <div class="col-md-10" style="background-color: #fff0cd">
                    <div id="doc-content" style="background-color: #fff0cd">
                        <textarea style="display:none;">${topic.content}</textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:forEach var="reply" items="${replies}" varStatus="status">
        <div id="r_${reply.id}" class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">
                        ${status.index + 1}楼
                    <a href=""><img src="${reply.user.avatar}" alt="" class="avatar-small img-responsive img-rounded hidden-lg hidden-md"></a>
                    <small class="hidden-lg hidden-md">${reply.user.username}</small>
                </h3>
            </div>
            <div class="panel-body" style="background-color: <c:if test="${status.index%2!=1}">#fff8e7</c:if><c:if test="${status.index%2==1}">#fff0cd</c:if>">
                <div class="row">
                    <div class="col-md-2 hidden-sm hidden-xs" style="border-right: #d6e9c6 2px solid">
                        <img src="${reply.user.avatar}" alt="" class="img-responsive img-thumbnail">
                        <h5 class="text-center">${reply.user.username}</h5>
                    </div>
                    <div class="col-md-10">
                            ${reply.content}
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <div class="panel panel-success">
        <div class="panel-body">
            <textarea id="reply_content" class="form-control" rows="3"></textarea>
            <hr>
            <button id="reply" class="btn btn-primary pull-right">回复</button>
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
<%--<script src="https://cdn.bootcss.com/jquery/3.1.0/jquery.js"></script>--%>
<script src="/js/bootstrap.js"></script>
<script src="/js/jquery-confirm.min.js"></script>
<script src="/js/hasaki.js"></script>
<%--<script src="/editor.md/example/js/jquery.min.js"></script>--%>
<script src="/editor/lib/marked.min.js"></script>
<script src="/editor/lib/prettify.min.js"></script>
<script src="/editor/lib/raphael.min.js"></script>
<script src="/editor/lib/underscore.min.js"></script>
<script src="/editor/lib/sequence-diagram.min.js"></script>
<script src="/editor/lib/flowchart.min.js"></script>
<script src="/editor/lib/jquery.flowchart.min.js"></script>
<script src="/editor/editormd.min.js"></script>

<script type="text/javascript">
    var testEditor;
    $(function () {
        testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
            // htmlDecode: "style,script,iframe",
            emoji: true,
            taskList: true,
            tex: true, // 默认不解析
            flowChart: true, // 默认不解析
            sequenceDiagram: true, // 默认不解析
            codeFold: true,
            editorTheme: "dark",
            theme: "gray",
            previewTheme: "dark"
        });
    });
</script>
<script>
    //reply
    $('#reply').click(function () {
        $.post(
            '/forum/r/${topic.id}', {
                content: $('#reply_content').val()
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