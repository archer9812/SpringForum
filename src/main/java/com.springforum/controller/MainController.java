package com.springforum.controller;

import com.springforum.domain.LoginLog;
import com.springforum.domain.Permission;
import com.springforum.domain.User;
import com.springforum.service.impl.IAdminService;
import com.springforum.service.impl.ILoginLogService;
import com.springforum.service.impl.IUserService;
import com.springforum.util.ProduceMd5;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping(value = {""})
public class MainController {
    public final IUserService userService;

    public final ILoginLogService loginLogService;

    public final IAdminService adminService;

    public MainController(IUserService userService, ILoginLogService loginLogService, IAdminService adminService) {
        this.userService = userService;
        this.loginLogService = loginLogService;
        this.adminService = adminService;
    }

    public String getRemoteIP(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }

    @RequestMapping(value = {"register"}, method = RequestMethod.GET)
    public ModelAndView register() {
        return new ModelAndView("register");
    }

    @RequestMapping(value = {"register"}, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String registerCheck(@RequestParam("chapter") Integer chapter,
                              @RequestParam("email") String email,
                              @RequestParam("username") String username,
                              @RequestParam("password") String password,
                              @RequestParam("confirm") String confirm,
                              @RequestParam("phone_num") String phone_num,
                              @SessionAttribute("chapter") Integer _chapter,
                              @SessionAttribute("chapter_email") String chapter_email) {
        //检查验证码
        if (!email.equals(chapter_email)) {
            return "邮箱地址与验证不匹配";
        }
        if (!_chapter.equals(chapter)) {
            return "邮箱验证码不正确";
        }
        //验证密码是否相同
        if (!password.equals(confirm)) {
            return "密码输入不一致";
        }
        //查询用户是否已经存在
        if (userService.getUserByUsername(username) != null) {
            return "用户已经存在";
        }
        //查询邮箱是否被占用
        if (userService.getUserByEmail(email) != null) {
            return "此邮箱已被占用";
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(ProduceMd5.getMD5(password));
        user.setPhoneNum(phone_num);
        user.setEmail(email);
        user.setRole_id(1);
        user.setCredit(0);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setAvatar("/img/avatar.png");
        if (userService.addUser(user)) {
            return "注册成功";
        } else {
            return "注册失败";
        }
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "forget", method =RequestMethod.GET)
    public ModelAndView forget() {
        return new ModelAndView("forget");
    }

    @RequestMapping(value = "resetPass", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String resetPass(@RequestParam("email") String to,
                          @RequestParam("pass") String pass,
                          @RequestParam("chapter") String chapter,
                          @SessionAttribute(value = "user", required = false) User user,
                          @SessionAttribute("chapter") String _chapter,
                          @SessionAttribute("chapter_email") String _to) {
        if (!chapter.equals(_chapter)) return "错误的验证码";
        if (user != null && !to.equals(_to)) {
            return "非法操作";
        }
        if (userService.updateUserByEmail(to, pass)) {
            return "修改成功";
        } else {
            return "修改失败";
        }
    }

    @RequestMapping(value = "login", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String loginCheck(@RequestParam("username")String username,
                             @RequestParam("password")String password,
                             HttpServletRequest request,
                             HttpSession session) {
        int loginVerify = userService.login(username, ProduceMd5.getMD5(password));
        if (loginVerify == 2) {
            User user = userService.getUserByUsername(username);
            session.setAttribute("user", user);
//            List<Permission> permissions = adminService.getPermissionsByRoleId(user.getRole_id());
            session.setAttribute("resources", adminService.getUserResources(user.getId()));
            //获取登录信息
            String ip = getRemoteIP(request);
            UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
            //获取用户的浏览器名
            String userBrowser = userAgent.getBrowser().toString();
            //写入登录日志
            LoginLog log = new LoginLog();
            log.setDevice(userBrowser);
            log.setIp(ip);
            log.setUserId(user.getId());
            log.setLoginTime(new Date());
            boolean addLogStatus = loginLogService.addLog(log);
            if (addLogStatus) {
                return "登录成功";
            } else {
                return "登录失败";
            }
        } else if (loginVerify == 1) {
            return "密码错误";
        } else {
            return "用户不存在";
        }
    }
//    @RequestMapping(value = "login", method = RequestMethod.POST)
//    public void loginCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        int loginVerify = userService.login(username, ProduceMd5.getMD5(password));
//        if (loginVerify == 2) {
//            User user = userService.getUserByUsername(username);
//            session.setAttribute("user", user);
////            List<Permission> permissions = adminService.getPermissionsByRoleId(user.getRole_id());
//            session.setAttribute("resources", adminService.getUserResources(user.getId()));
//            //获取登录信息
//            String ip = getRemoteIP(request);
//            UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
//            //获取用户的浏览器名
//            String userBrowser = userAgent.getBrowser().toString();
//            //写入登录日志
//            LoginLog log = new LoginLog();
//            log.setDevice(userBrowser);
//            log.setIp(ip);
//            log.setUserId(user.getId());
//            log.setLoginTime(new Date());
//            boolean addLogStatus = loginLogService.addLog(log);
//            if (addLogStatus) {
//                response.getWriter().write("登录成功");
//            } else {
//                response.getWriter().write("登录失败");
//            }
//        } else if (loginVerify == 1) {
//            response.getWriter().write("密码错误");
//        } else {
//            response.getWriter().write("用户不存在");
//        }
//        response.getWriter().close();
//    }

    @RequestMapping(value = {"logout"}, method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request) {
        session.removeAttribute("user");
        session.removeAttribute("resources");
        return "redirect:/forum";
    }
}
