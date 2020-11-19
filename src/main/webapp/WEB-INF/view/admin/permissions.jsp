
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
    <title>${role.role}下属权限管理</title>
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
            <h2 class="sub-header">${role.role}下属权限管理</h2>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bell fa-fw"></i> ${role.role}下属权限列表
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-chevron-down"></i>
                        </button>
                        <ul class="dropdown-menu slidedown">
                            <li>
                                <a type="button" data-toggle="modal" data-target="#add_permission">
                                    <i class="fa fa-plus fa-fw"></i> 添加${role.role}下属权限
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-trash-o fa-fw"></i> 数据库清理
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
                            <th>身份</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="permission" items="${permissions}" varStatus="status">
                            <tr>
                                <td>${status.index+1}</td>
                                <td>${permission.permission}</td>
                                <td>${permission.description}</td>
                                <td>
                                    <button name="delete" rid="${role.id}" pid="${permission.id}" class="btn btn-danger btn-xs">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.panel-body -->
                <div class="panel-footer">
                    <div class="input-group">
                        <select class="form-control" name="permission" id="RolePermission">
                            <c:forEach var="permission" items="${allPermissions}" varStatus="status">
                                <option value="${permission.id}">${permission.permission} | ${permission.description}</option>
                            </c:forEach>
                        </select>
                        <div class="input-group-btn">
                            <button rid="${role.id}" id="addRolePermission" class="btn btn-info">添加</button>
                        </div>
                    </div>
                </div>
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
        var pid = this.getAttribute("pid");
        var rid = this.getAttribute("rid");
        $.confirm({
            theme: 'black',
            title: '返回信息',
            content: '您确定要删除此身份下的该权限吗？',
            buttons: {
                ok: function (data) {
                    $.post(
                        '/admin/permissions/delete', {
                            pid: pid,
                            rid: rid
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
                },
                cancel: {

                }
            }
        })
    })
</script>
</body>
</html>
