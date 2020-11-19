$("#submit").click(function () {
    $.post(
        "/login", {
            username: $("#username").val(),
            password: $("#password").val()
        }, function (data) {
            if (!data.search("登录成功")) {
                $.confirm({
                    theme: "black",
                    title: "返回信息",
                    content: data,
                    buttons: {
                        ok: function () {
                            window.location.reload();
                        }
                    }
                });
            } else {
                $.confirm({
                    theme: "black",
                    title: "返回信息",
                    content: data
                });
            }
        }, "text"
    );
});
$("#securityLogin").click(function () {
    $.post(
        "/login", {
            username: $("#user").val(),
            password: $("#pass").val()
        }, function (data) {
            if (!data.search("登录成功")) {
                $.confirm({
                    theme: "black",
                    title: "返回信息",
                    content: data,
                    buttons: {
                        ok: function () {
                            document.location.href = "/forum"
                        }
                    }
                });
            } else {
                $.confirm({
                    theme: "black",
                    title: "返回信息",
                    content: data
                });
            }
        }, "text"
    );
});
function checkTitle() {
    if (document.getElementById("title").value === "") {
        $.confirm({
            theme: "black",
            title: "提示",
            content: "请写标题鸭～"
        });
        return false;
    }
    return true;
};

function checkEmail() {
    if (document.getElementById("email").value === "") {
        $.confirm({
            theme: "black",
            title: "提示",
            content: "请先填写电子邮箱地址鸭～",
        });
        return false;
    }
    return true;
}

//submit the topic
$("#upload").click(function () {
    if (checkTitle()) {
        $.post(
            "/forum/write", {
                title: $("#title").val(),
                content: $("#markdown").val(),
                tag_id: $("#tag").val()
            }, function (data) {
                $.confirm({
                    theme: "black",
                    title: "返回信息",
                    content: data
                })
            }
        )
    }
});
//edit the topic
$("#edit").click(function () {
    var tid = this.getAttribute("tid");
    if (checkTitle()) {
        $.post(
            "/forum/edit/" + tid, {
                tid: tid,
                title: $("#title").val(),
                content: $("#markdown").val()
            }, function (data) {
                $.confirm({
                    theme: "black",
                    title: "返回信息",
                    content: data
                })
            }
        )
    }
});
//addTab
$("#addTabSubmit").click(function () {
    $.post(
        "/admin/tab/add", {
            tabName: $("#tabName").val(),
            tabName_en: $("#tabName_en").val(),
        }, function (data) {
            $.confirm({
                theme: "black",
                title: "返回信息",
                content: data,
                buttons: {
                    ok: function () {
                        window.location.reload();
                    }
                }
            });
        }
    )
});

//addRole
$("#addRoleSubmit").click(function () {
    $.post(
        "/admin/role/add", {
            role: $("#role").val(),
            description: $("#description").val(),
        }, function (data) {
            $.confirm({
                theme: "black",
                title: "返回信息",
                content: data,
                buttons: {
                    ok: function () {
                        window.location.reload();
                    }
                }
            })
        }
    )
});
//addPermission
$("#addPermissionSubmit").click(function () {
    $.post(
        "/admin/permission/add", {
            permission: $("#permission").val(),
            description: $("#description").val(),
        }, function (data) {
            $.confirm({
                theme: "black",
                title: "返回信息",
                content: data,
                buttons: {
                    ok: function () {
                        window.location.reload();
                    }
                }
            })
        }
    )
});
//addRolePermission
$("#addRolePermission").click(function () {
    var rid = this.getAttribute("rid");
    $.post(
        "/admin/permissions/add", {
            rid: rid,
            pid: $("#RolePermission").val(),
        }, function (data) {
            $.confirm({
                theme: "black",
                title: "返回信息",
                content: data,
                buttons: {
                    ok: function () {
                        window.location.reload();
                    }
                }
            })
        }
    )
});
//addPermissionResource
$("#addPermissionResource").click(function () {
    var pid = this.getAttribute("pid");
    $.post(
        "/admin/resources/add", {
            pid: pid,
            rid: $("#PermissionResource").val(),
        }, function (data) {
            $.confirm({
                theme: "black",
                title: "返回信息",
                content: data,
                buttons: {
                    ok: function () {
                        window.location.reload();
                    }
                }
            })
        }
    )
});
//addResource
$("#addResourceSubmit").click(function () {
    $.post(
        "/admin/resource/add", {
            resource: $("#resource").val(),
            description: $("#description").val(),
        }, function (data) {
            $.confirm({
                theme: "black",
                title: "返回信息",
                content: data,
                buttons: {
                    ok: function () {
                        window.location.reload();
                    }
                }
            })
        }
    )
});
$("#getChapter").click(function () {
    if (checkEmail()) {
        $.post(
            "/api/sendMail", {
                to: $("#email").val()
            }
        );
        $(this).addClass("disabled");
        $(this).text("已发送");
    }

});
$("#resetPass").on("click", function () {
    $.post(
        "/resetPass", {
            email: $("#email").val(),
            chapter: $("#chapter").val(),
            pass: $("#pass").val()
        }, function (data) {
            $.confirm({
                theme: "black",
                title: "返回信息",
                content: data,
                buttons: {
                    ok: function () {
                        if (data.search("成功")) {
                            document.location.href = "/login"
                        } else {
                            window.location.reload();
                        }
                    }
                }
            })
        }
    )
})