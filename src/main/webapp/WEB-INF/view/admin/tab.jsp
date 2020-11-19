
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
    <title>板块管理</title>
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
            <h2 class="sub-header">板块管理</h2>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bell fa-fw"></i> 板块列表
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-chevron-down"></i>
                        </button>
                        <ul class="dropdown-menu slidedown">
                            <li>
                                <a type="button" data-toggle="modal" data-target="#add_tab">
                                    <i class="fa fa-plus fa-fw"></i> 添加板块
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
                            <th>板块名</th>
                            <th>(English)</th>
                            <th>帖子数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tab" items="${tabs}" varStatus="status">
                            <tr>
                                <td>${status.index+1}</td>
                                <td>${tab.tabName}</td>
                                <td>${tab.tabNameEn}</td>
                                <td>${tab.dcount}</td>
                                <td>
                                    <button name="delete" tid="${tab.id}" class="btn btn-danger btn-xs">删除</button>
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
<div class="modal fade" id="add_tab" tabindex="-1" role="dialog" aria-labelledby="addTabLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addTabLabel">添加板块</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="tabName" class="col-sm-2 control-label">板块名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="tabName" placeholder="请输入板块名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tabName_en" class="col-sm-2 control-label">缩写</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="tabName_en" placeholder="板块英文缩写">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="addTabSubmit" type="button" class="btn btn-success">添加</button>
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
            content: '您确定要删除此板块吗？',
            buttons: {
                ok: function (data) {
                    $.post(
                        '/admin/tab/delete', {
                            tid: tid
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