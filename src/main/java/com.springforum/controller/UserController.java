package com.springforum.controller;


import com.springforum.domain.Message;
import com.springforum.domain.User;
import com.springforum.service.impl.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping(value = {"/user"})
public class UserController {
    public final IUserService userService;
    public final ITopicService topicService;
    public final ITabService tabService;
    public final IReplyService replyService;
    public final ILoginLogService loginLogService;
    public final IMessageService messageService;

    public UserController(IUserService userService, ITopicService topicService, ITabService tabService, IReplyService replyService, IMessageService messageService, ILoginLogService loginLogService) {
        this.userService = userService;
        this.topicService = topicService;
        this.tabService = tabService;
        this.replyService = replyService;
        this.messageService = messageService;
        this.loginLogService = loginLogService;
    }

    @RequestMapping(value = {""}, method = RequestMethod.GET)
    public ModelAndView info(HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView infoPage = new ModelAndView("user/info");
        infoPage.addObject("recentLog", loginLogService.getRecentLog(user.getId()));
        infoPage.addObject("topics", topicService.getTopicsByUserId(user.getId()));
        return infoPage;
    }

    @RequestMapping(value = {"update"}, method = RequestMethod.GET)
    public ModelAndView update(HttpSession session) {
        ModelAndView updatePage = new ModelAndView("user/update");
        return updatePage;
    }

    @RequestMapping(value = {"avatar"}, method = RequestMethod.GET)
    public ModelAndView updateAvatar(HttpServletRequest request, HttpSession session){
        ModelAndView updateAvatarPAge = new ModelAndView("user/avatar");
        return updateAvatarPAge;
    }

    @RequestMapping(value = {"avatar"}, method = RequestMethod.POST)
    public String updateAvatarDo(@RequestPart("avatar") MultipartFile avatarFile, HttpServletRequest request, HttpSession session){
        User user = (User) session.getAttribute("user");

        String fileName=avatarFile.getOriginalFilename();
        String suffix=fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
        Long date=new Date().getTime();
        String newFileName = date+"-"+user.getId()+"."+suffix;
        String absolutePath=session.getServletContext().getRealPath("/static/img/avatar")+"/"+newFileName;
        String relativePath="/img/avatar"+"/"+newFileName;
        user.setAvatar(relativePath);
        user.setId(user.getId());
        File file = new File(absolutePath);

        if (!file.exists()){
            try {
                avatarFile.transferTo(file);
                userService.updateUser(user);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        session.setAttribute("user", user);
        return "redirect:/user/update";
    }

    @RequestMapping(value = {"setPhone"}, method = RequestMethod.POST)
    public void setUserPhone(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User user = (User) session.getAttribute("user");
        String phone_num = request.getParameter("phone_num");

        user.setPhoneNum(phone_num);
        user.setUpdateTime(new Date());

        if (userService.updateUser(user)) {
            response.getWriter().write("修改成功");
            session.setAttribute("user", user);
        } else {
            response.getWriter().write("修改失败");
        }
        response.getWriter().close();
    }

    @RequestMapping(value = {"setEmail"}, method = RequestMethod.POST)
    public void setUserEmail(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User user = (User) session.getAttribute("user");
        String email = request.getParameter("email");

        user.setEmail(email);
        user.setUpdateTime(new Date());

        if (userService.updateUser(user)) {
            response.getWriter().write("修改成功");
            session.setAttribute("user", user);
        } else {
            response.getWriter().write("修改失败");
        }
        response.getWriter().close();
    }

    @RequestMapping(value = {"setCredit"}, method = RequestMethod.POST)
    public void setUserCredit(@RequestParam("credit") Integer credit, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User user = (User) session.getAttribute("user");
        user.setUpdateTime(new Date());

        if (userService.addCredit(credit, user.getId())) {
            user = userService.getUserById(user.getId());
            response.getWriter().write("充值成功");
            session.setAttribute("user", user);
        } else {
            response.getWriter().write("充值失败");
        }
        response.getWriter().close();
    }

    @RequestMapping(value = {"chat"}, method = RequestMethod.GET)
    public ModelAndView myMessage(HttpSession session) {
        User user = (User) session.getAttribute("user");
        ModelAndView myMessagePage = new ModelAndView("user/message");
        myMessagePage.addObject("messages", messageService.getReplyMessages(user.getId()));
        myMessagePage.addObject("readonly", "readonly");
        return myMessagePage;
    }

    @RequestMapping(value = {"chat/{uid}"}, method = RequestMethod.GET)
    public ModelAndView message(@PathVariable("uid")Integer uid) {
        ModelAndView messagePage = new ModelAndView("user/message");
        messagePage.addObject("r_user", userService.getUserById(uid));
        messagePage.addObject("messages", messageService.getAllMessagesById(uid));
        return messagePage;
    }

    @RequestMapping(value = {"chat/{uid}"}, method = RequestMethod.POST)
    public void sendMessage(@PathVariable("uid")Integer uid, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        User user = (User) session.getAttribute("user");
        String content = request.getParameter("content");
        Message msg = new Message();
        msg.setReply_user_id(uid);
        msg.setUser_id(user.getId());
        msg.setContent(content);
        msg.setCreateTime(new Date());
        if (messageService.addMessage(msg)) {
            response.getWriter().write("发送成功");
        } else {
            response.getWriter().write("发送失败");
        }
        response.getWriter().close();
    }

}
