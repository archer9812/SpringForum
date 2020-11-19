
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
    <title>帖子管理</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/bootstrap-theme.css">
    <link rel="stylesheet" href="/css/jquery-confirm.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">
    <link rel="stylesheet" href="/css/datatables.css">
    <link rel="stylesheet" href="/fonts/awesome/css/font-awesome.css">
</head>
<body>
<%@include file="../components/nav-top.jsp"%>
<div class="container">
    <div class="row">
        <div class="main">
            <h2 class="sub-header">帖子管理</h2>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bell fa-fw"></i> 帖子列表
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
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
                    <table id="table" class="table table-bordered">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>标题</th>
                            <th>发布时间</th>
                            <th>更新时间</th>
                            <th>创作者</th>
                            <th>点击量</th>
                            <th>回复数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="topic" items="${topics}" varStatus="status">
                            <tr>
                                <td>${status.index}</td>
                                <td>${topic.title}</td>
                                <td> <fmt:formatDate value="${topic.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                                <td> <fmt:formatDate value="${topic.updateTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td>${topic.user.username}</td>
                                <td>${topic.click}</td>
                                <td>${topic.countReplies}</td>
                                <td>
                                    <button name="delete" tid="${topic.id}" class="btn btn-danger btn-xs">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/jquery-confirm.min.js"></script>
<script src="/js/datatables.min.js"></script>
<script src="/js/hasaki.js"></script>
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
<script>
    $('[name="delete"]').click(function () {
        var tid = this.getAttribute("tid");
        $.confirm({
            theme: 'black',
            title: '返回信息',
            content: '您确定要删除此帖子吗？',
            buttons: {
                ok: function (data) {
                    $.post(
                        '/admin/topic/delete', {
                            tid: tid
                        }, function (data) {
                            if(data === "") {
                                $.confirm({
                                    theme: 'black',
                                    title: '错误信息',
                                    content: "非法访问",
                                    buttons: {
                                        ok: function () {
                                            window.location.reload();
                                        }
                                    }
                                })
                            } else {
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
                        }
                    )
                },
                cancel: {

                }
            }
        })
    })
</script>
</body>
</html>
