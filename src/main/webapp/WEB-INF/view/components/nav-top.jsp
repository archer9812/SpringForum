
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">导航栏</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Hasaki-Pro</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li <c:if test="${now == 'home'}">class="active"</c:if>><a href="/forum">门户</a></li>
                <li <c:if test="${now == 'forum'}">class="active"</c:if>><a href="/forum/tags">论坛</a></li>
                <c:if test="${user != null && user.role_id == 2}">
                    <li <c:if test="${now == 'admin'}">class="active"</c:if>><a href="/admin">后台管理</a></li>
                </c:if>
            </ul>
            <c:if test="${user.id == null}">
                <form class="navbar-form navbar-right">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#login">登录</button>
                    <button onclick="document.location.href='/register'" type="button" class="btn btn-success">注册</button>
                </form>
            </c:if>
            <c:if test="${user.id != null}">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-xs"><img src="${user.avatar}" style="border-radius: 50%; height: 35px; margin-top: 19%"> | </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.username} <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/user">个人中心</a></li>
                            <li><a href="/user/update">修改信息</a></li>
                            <li><a href="/user/chat">消息中心</a></li>
                            <c:if test="${user.role_id == 2}">
                                <li role="separator" class="divider"></li>
                                <li><a href="/admin/role">角色管理</a></li>
                                <li><a href="/admin/permission">权限管理</a></li>
                                <li><a href="/admin/resource">拦截管理</a></li>
                            </c:if>
                            <c:if test="${resources != null && user.role != 1 && user.role != 2}">
                                <li role="separator" class="divider"></li>
                                <c:forEach items="${resources}" var="resource">
                                    <li><a href="${resource.resource}">${resource.description}</a></li>
                                </c:forEach>
                            </c:if>
                            <li role="separator" class="divider"></li>
                            <li><a href="/forget">修改密码</a></li>
                            <li><a href="/logout">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </c:if>
        </div><!--/.navbar-collapse -->
    </div>
</nav>
<!-- Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="loginLabel">账号登录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" placeholder="请输入你的用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input id="remember" type="checkbox"> 15天内免登录
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <a href="/forget" class="btn btn-warning" >忘记密码</a>
                <button id="submit" type="button" class="btn btn-success">登录</button>
            </div>
        </div>
    </div>
</div>

