package com.springforum.controller;

import com.springforum.domain.*;
import com.springforum.service.impl.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = {"admin"})
public class AdminController {
    public final IUserService userService;
    public final ITopicService topicService;
    public final ITabService tabService;
    public final IReplyService replyService;
    public final ILoginLogService loginLogService;
    public final IAdminService adminService;

    public AdminController(IUserService userService, ITopicService topicService, ITabService tabService, IReplyService replyService, ILoginLogService loginLogService, IAdminService adminService) {
        this.userService = userService;
        this.topicService = topicService;
        this.tabService = tabService;
        this.replyService = replyService;
        this.loginLogService = loginLogService;
        this.adminService = adminService;
    }

    @RequestMapping(value = {""}, method = RequestMethod.GET)
    public ModelAndView index(@SessionAttribute("user")User user) {
        ModelAndView indexPage = new ModelAndView("admin/index");
        indexPage.addObject("userNum", userService.getUserCount());
        indexPage.addObject("now", "admin");
        indexPage.addObject("recentLog", loginLogService.getRecentLog(user.getId()));
        indexPage.addObject("topicNum", topicService.getTopicsNum());
        indexPage.addObject("replyNum", replyService.getReplyNum());
        indexPage.addObject("tabNum", tabService.getTabNum());
        return indexPage;
    }

    @RequestMapping(value = {"user"}, method = RequestMethod.GET)
    public ModelAndView user(HttpSession session) {
        ModelAndView userPage = new ModelAndView("admin/user");
        userPage.addObject("users", userService.getAllUsers());
        userPage.addObject("roles", adminService.getAllRoles());
        return userPage;
    }

    @RequestMapping(value = {"{task}/{operation}"}, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String getUserOperation(@PathVariable("task")String task,
                                 @PathVariable("operation") String operation) {
        return "redirect:/admin/" + task;
    }


    @RequestMapping(value = {"{task}/{operation}"}, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String userOperation(@PathVariable("operation") String operation,
                              @PathVariable("task")String task,
                              @RequestParam(value = "uid", required = false) Integer uid,
                              @RequestParam(value = "tid", required = false) Integer tid,
                              @RequestParam(value = "rid", required = false) Integer rid,
                              @RequestParam(value = "pid", required = false) Integer pid,
                              @RequestParam(value = "role", required = false) String _role,
                              @RequestParam(value = "description", required = false) String _description,
                              @RequestParam(value = "permission", required = false) String _permission,
                              @RequestParam(value = "resource", required = false) String _resource,
                              @RequestParam(value = "tabName", required = false) String tabName,
                              @RequestParam(value = "tabName_en", required = false) String tabName_en,
                              HttpServletRequest request, HttpServletResponse response) {
        if (task.equals("user")) {
            if (operation.equals("delete")) {
                if (userService.deleteByPrimaryKey(uid)) {
                    return "删除成功";
                } else {
                    return "删除失败";
                }
            } else if(operation.equals("setRole")) {
                User user = userService.getUserById(uid);
                user.setRole_id(rid);
                if (userService.updateUser(user)) {
                    return "设置身份成功";
                } else {
                    return "设置身份失败";
                }
            }
        } else if (task.equals("topic")) {
            if (operation.equals("delete")) {
                if (topicService.deleteByPrimaryKey(tid)) {
                    return "删除成功";
                } else {
                    return "删除失败";
                }
            }
        } else if (task.equals("reply")) {
            if (operation.equals("delete")) {
                if (replyService.deleteByPrimaryKey((long) rid)) {
                    return "删除成功";
                } else {
                    return "删除失败";
                }
            }
        } else if (task.equals("tab")) {
            if (operation.equals("delete")) {
                if (tabService.delete(tid)) {
                    return "删除成功";
                } else {
                    return "删除失败";
                }
            } else if (operation.equals("add")) {
                if (tabService.getByTabNameEn(tabName_en) != null) {
                    return "已经存在相同板块";
                } else {
                    Tab tab = new Tab();
                    tab.setTabName(tabName);
                    tab.setTabNameEn(tabName_en);
                    if (tabService.addTab(tab)) {
                        return "添加成功";
                    }
                }
            }
        } else if (task.equals("role")) {
            if (operation.equals("add")) {
                Role role = new Role();
                role.setRole(_role);
                role.setDescription(_description);
                if (adminService.insertRole(role)) {
                    return "添加成功";
                } else {
                    return "添加失败";
                }
            } else if (operation.equals("delete")) {
                if (adminService.deleteRole(rid)) {
                    return "删除成功";
                } else {
                    return  "删除失败";
                }
            }
        } else if (task.equals("permission")) {
            if (operation.equals("add")) {
                Permission permission = new Permission();
                permission.setPermission(_permission);
                permission.setDescription(_description);
                if (adminService.insertPermission(permission)) {
                    return "添加成功";
                } else {
                    return "删除失败";
                }
            } else if (operation.equals("delete")) {
                if (adminService.deletePermission(pid)) {
                    return "删除成功";
                } else {
                    return "删除失败";
                }
            }
        } else if (task.equals("resource")) {
            if (operation.equals("add")) {
                Resource resource = new Resource();
                resource.setResource(_resource);
                resource.setDescription(_description);
                if (adminService.insertResource(resource)) {
                    return "添加成功";
                } else {
                    return  "添加失败";
                }
            } else if (operation.equals("delete")) {
                if (adminService.deleteResource(rid)) {
                    return "删除成功";
                } else {
                    return "删除失败";
                }
            }
        } else if (task.equals("permissions")) {
            if (operation.equals("add")) {
                if (adminService.addRolePermission(rid, pid)) {
                    return "添加成功";
                }else {
                    return "添加失败";
                }
            } else if (operation.equals("delete")) {
                if (adminService.deleteRolePermission(rid, pid)) {
                    return "删除成功";
                }else {
                    return "删除失败";
                }
            }
        } else if (task.equals("resources")) {
            if (operation.equals("add")) {
                if (adminService.addPermissionResource(pid, rid)) {
                    return "添加成功";
                } else {
                    return "添加失败";
                }
            } else if (operation.equals("delete")) {
                if (adminService.deletePermissionResource(pid, rid)) {
                    return "删除成功";
                } else {
                    return "删除失败";
                }
            }
        }
        return "非法请求";
    }

    @RequestMapping(value = {"topic"}, method = RequestMethod.GET)
    public ModelAndView topic(HttpSession session) {
        ModelAndView topicPage = new ModelAndView("admin/topic");
        topicPage.addObject("topics", topicService.listTopicsAndUsers());
        return topicPage;
    }

    @RequestMapping(value = {"tab"}, method = RequestMethod.GET)
    public ModelAndView tab(HttpSession session) {
        ModelAndView tabPage = new ModelAndView("admin/tab");
        tabPage.addObject("tabs", tabService.getAllTabsWithNum());
        return tabPage;
    }

    @RequestMapping(value = {"reply"}, method = RequestMethod.GET)
    public ModelAndView reply(HttpSession session) {
        ModelAndView replyPage = new ModelAndView("admin/reply");
        replyPage.addObject("replies", replyService.getAllReply());
        return replyPage;
    }

    @RequestMapping(value = {"role"}, method = RequestMethod.GET)
    public ModelAndView role(HttpSession session) {
        ModelAndView rolePage = new ModelAndView("admin/role");
        rolePage.addObject("roles", adminService.getAllRoles());
        return rolePage;
    }

    @RequestMapping(value = {"rolePermissions/{rid}"})
    public ModelAndView roles(@PathVariable("rid") Integer rid) {
        ModelAndView rolesPage = new ModelAndView("admin/permissions");
        rolesPage.addObject("permissions", adminService.getPermissionsByRoleId(rid));
        rolesPage.addObject("allPermissions", adminService.getAllPermissions());
        rolesPage.addObject("role", adminService.getRole(rid));
        return rolesPage;
    }

    @RequestMapping(value = {"permission"}, method = RequestMethod.GET)
    public ModelAndView permission(HttpSession session) {
        ModelAndView permissionPage = new ModelAndView("admin/permission");
        permissionPage.addObject("permissions", adminService.getAllPermissions());
        return permissionPage;
    }

    @RequestMapping(value = {"permissionResources/{pid}"})
    public ModelAndView permissions(@PathVariable("pid") Integer pid) {
        ModelAndView permissionsPage = new ModelAndView("admin/resources");
        permissionsPage.addObject("resources", adminService.getResourcesByPermissionId(pid));
        permissionsPage.addObject("allResources", adminService.getAllResources());
        permissionsPage.addObject("permission", adminService.getPermission(pid));
        return permissionsPage;
    }

    @RequestMapping(value = {"resource"}, method = RequestMethod.GET)
    public ModelAndView resource() {
        ModelAndView resourcePage = new ModelAndView("admin/resource");
        resourcePage.addObject("resources", adminService.getAllResources());
        return resourcePage;
    }

}
