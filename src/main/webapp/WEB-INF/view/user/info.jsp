
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
    <link rel="stylesheet" href="/css/datatables.css">
    <link rel="stylesheet" href="/fonts/awesome/css/font-awesome.css">
    <title>Hasaki › <c:if test="${!empty user}">${user.username}</c:if><c:if test="${empty user}">会员未找到</c:if></title>
</head>
<body>

<%@ include file="../components/nav-top.jsp"%>

<div class="container">
    <h2 class="sub-header">用户后台</h2>
    <div class="panel panel-default" id="main" >
        <div class="panel-heading" style="background-color: white">
            <a href="/forum">Hasaki</a> › ${user.username}
        </div>

        <div class="panel-body">
            <c:if test="${!empty user}">
                <form class="form-horizontal" role="form"><br>
                    <div style="margin-left: 15%">
                        <img width="60px" height="60px" src="${user.avatar}" class="img-rounded">
                            <%--<a class="btn btn-default" href="/settings/avatar" role="button" style="margin-left: 28%">更换头像</a>--%>
                    </div><br/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">uid</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.id}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.username}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">手机号</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" style="display: inline-block">${user.phoneNum}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" style="display: inline-block">${user.email}</p>
                                <%--<a class="btn btn-default" href="/settings/avatar" role="button" style="margin-left: 17%; display: inline-block">更换邮箱</a>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">注册时间</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.localCreateTime}</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">积分</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${user.credit}</p>
                        </div>
                    </div>
                </form>
            </c:if>
            <c:if test="${empty user}">
                会员未找到!
            </c:if>

        </div>
    </div>
    <div class="row">
        <div class="col-sm-5">
            <div class="chat-panel panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-comments fa-fw"></i> 登录记录
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
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
                                    <td><fmt:formatDate value="${log.loginTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${log.device}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.panel-body -->
                <div class="panel-footer">
                    <button class="btn btn-warning btn-sm btn-block">
                        有登录异常，修改密码
                    </button>
                </div>
            </div>
            <!-- /.panel-footer -->
        </div>
        <div class="col-sm-7">
            <div class="chat-panel panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-comments fa-fw"></i> 我发的帖
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="table" class="table table-striped">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>标题</th>
                                <th>更新时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="topic" items="${topics}" varStatus="status">
                                <tr>
                                    <td>${status.index+1}</td>
                                    <td>${topic.title}</td>
                                    <td><fmt:formatDate value="${topic.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>
                                        <a href="/forum/edit/${topic.id}" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i> 编辑</a>
                                        <button class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.panel-body -->
                <div class="panel-footer">
                    <button class="btn btn-info btn-sm btn-block disabled">
                        提供智能搜索
                    </button>
                </div>
            </div>
            <!-- /.panel-footer -->
        </div>
    </div>
</div>

<%@ include file="../components/footer.jsp"%>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/datatables.min.js"></script>
<script>
    $(document).ready( function () {
        $('#table').DataTable({
            "searching": true,
            "ordering": true,
            "info": true,
            // 水平滚动条
            "scrollX": false,
            // 垂直滚动条
            "scrollY": false,
            // 自动列宽
            "autoWidth": true,
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