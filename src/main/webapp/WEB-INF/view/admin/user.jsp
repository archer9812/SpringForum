
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
    <title>用户管理</title>
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
            <h2 class="sub-header">用户管理</h2>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bell fa-fw"></i> 用户列表

                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table id="table" class="table table-bordered">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>邮箱</th>
                            <th>积分</th>
                            <th width="200">权限</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${users}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>${user.username}</td>
                                <td>${user.email}</td>
                                <td>${user.credit}</td>
                                <td>
                                    <c:if test="${user.role_id != 2}">
                                        <div class="input-group">
                                            <select class="form-control disabled" id="role_${user.id}">
                                                <c:forEach var="role" items="${roles}">
                                                    <c:if test="${role.id == user.role_id}">
                                                        <option selected value="${role.id}">${role.role} | ${role.description}</option>
                                                    </c:if>
                                                    <c:if test="${role.id != user.role_id}">
                                                        <option value="${role.id}">${role.role} | ${role.description}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <span class="input-group-btn">
                                                   <button uid="${user.id}" name="setRole" class="btn btn-warning btn-sm">
                                                        设置身份
                                                   </button>
                                            </span>
                                        </div>
                                    </c:if>
                                    <c:if test="${user.role_id == 2}">
                                        <button class="btn btn-warning btn-sm disabled">
                                            无法设置
                                        </button>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${user.role_id != 2}">
                                        <button  name="delete" uid="${user.id}" class="btn btn-danger btn-xs">删除</button>
                                        <a href="/user/chat/${user.id}" class="btn btn-success btn-xs">发信</a>
                                    </c:if>
                                    <c:if test="${user.role_id == 2}">
                                        <button class="btn btn-danger btn-xs disabled">无法删除</button>
                                        <button class="btn btn-success btn-xs disabled">无法发信</button>
                                    </c:if>
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
        var uid = this.getAttribute("uid");
        $.confirm({
            theme: 'black',
            title: '返回信息',
            content: '您确定要删除此用户吗？',
            buttons: {
                ok: function (data) {
                    $.post(
                        '/admin/user/delete', {
                            uid: uid
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
    });
    $('[name="setRole"]').click(function () {
        var uid = this.getAttribute("uid");
        var rid = $('#role_' + uid).val();
        $.confirm({
            theme: 'black',
            title: '返回信息',
            content: '您确定要更改此用户身份吗？',
            buttons: {
                ok: function (data) {
                    $.post(
                        '/admin/user/setRole', {
                            uid: uid,
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
