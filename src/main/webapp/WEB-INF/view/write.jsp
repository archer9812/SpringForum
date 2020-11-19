
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>hasaki - 帖子发布页面</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
    <link rel="stylesheet" href="/editor/css/editormd.min.css">
</head>
<body>
<%@include file="components/nav-top.jsp"%>
<div class="container">
    <div class="row">
        <div class="page-header">
            <h4>发布新帖子～</h4>
        </div>
        <div class="col-md-8">
            <div class="form-group">
                <%--                    <label for="exampleInputEmail1">Email address</label>--%>
                <input type="text" class="form-control" id="title" placeholder="请输入帖子标题" value="${topic.title}">
            </div>
            <div id="editor">
                <!-- Tips: Editor.md can auto append a `<textarea>` tag -->
                <textarea id="markdown" style="display:none;"><c:if test="${!empty topic.content}">${topic.content}</c:if><c:if test="${empty topic.content}">### 发帖请遵守规范 !</c:if></textarea>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">&_&</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="tag">帖子分类</label>
                        <select id="tag" class="form-control">
                            <c:forEach items="${tabs}" var="tab">
                                <option <c:if test="${topic.tabId == tab.id}">selected</c:if> value="${tab.id}">${tab.tabName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="public">公开度</label>
                        <select id="public" name="public" class="form-control">
                            <option>公开</option>
                            <option>私密</option>
                        </select>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input checked type="checkbox"> 同意并遵守发帖规则
                        </label>
                    </div>
                    <hr>
                    <button <c:if test="${!empty topic}">id="edit" tid="${topic.id}"</c:if><c:if test="${empty topic}">id="upload"</c:if> class="btn btn-success btn-block">立即发布</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="components/footer.jsp"%>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/jquery-confirm.min.js"></script>
<script src="/editor/editormd.js"></script>
<script src="/js/hasaki.js"></script>
<script>
    $(function() {
        var editor = editormd("editor", {
            // width: "100%",
            height: "680",
            htmlDecode : "style,script,iframe|on*",
            // markdown: "xxxx",     // dynamic set Markdown text
            path : "/editor/lib/",  // Autoload modules mode, codemirror, marked... dependents libs path
            saveHTMLToTextarea : true,
            emoji: true,//emoji表情，默认关闭
            taskList: true,
            tocm: true, // Using [TOCM]
            tex: true,// 开启科学公式TeX语言支持，默认关闭

            flowChart: true,//开启流程图支持，默认关闭
            sequenceDiagram: true,//开启时序/序列图支持，默认关闭,
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/forum/uploadImg/",//注意你后端的上传图片服务地址
        });
    });
</script>
</body>
</html>