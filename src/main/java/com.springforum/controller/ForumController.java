package com.springforum.controller;

import com.springforum.domain.*;
import com.springforum.service.impl.*;
import com.springforum.util.ProduceMd5;
import eu.bitwalker.useragentutils.UserAgent;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.List;

@Controller
@RequestMapping(value = {"/forum"})
public class ForumController {
    public final IUserService userService;
    public final ITopicService topicService;
    public final ITabService tabService;
    public final IReplyService replyService;

    public ForumController(IUserService userService, ITopicService topicService, ITabService tabService, IReplyService replyService) {
        this.userService = userService;
        this.topicService = topicService;
        this.tabService = tabService;
        this.replyService = replyService;
    }


    @RequestMapping(value = {""})
    public ModelAndView index() {
        ModelAndView indexPage = new ModelAndView("index");
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();
        //最活跃用户
        List<User> hotestUsers = userService.listHotestUsers();
        //最新用户
        List<User> newUsers = userService.listNewUsers();
        //最新回复
        List<Reply> newestReplies = replyService.newestReply();
        indexPage.addObject("newUsers", newUsers);
        indexPage.addObject("now", "home");
        indexPage.addObject("topics", hotestTopics);
        indexPage.addObject("replies", newestReplies);
        indexPage.addObject("hotUsers",hotestUsers);
        indexPage.addObject("newUsers",newUsers);
        return indexPage;
    }

    @RequestMapping(value = {"write"}, method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public ModelAndView write(@SessionAttribute("user") User user, HttpSession session) {
        //判断session
        if (user == null) {
            ModelAndView error = new ModelAndView("error/error");
            error.addObject("title", "403 Refused Request");
            error.addObject("msg", "未经授权的访问");
            error.addObject("solve", "请先登录");
            return error;
        }
        ModelAndView writePage = new ModelAndView("write");
        List<Tab> tabs = tabService.getAllTabs();

        writePage.addObject("tabs", tabs);
        writePage.addObject("user", user);
        return writePage;
    }

    @RequestMapping(value = {"uploadImg"}, method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editormdPic (@RequestParam(value = "editormd-image-file", required = true) MultipartFile file, HttpServletRequest request, HttpSession session) throws Exception{
        String trueFileName = file.getOriginalFilename();

        String suffix = trueFileName.substring(trueFileName.lastIndexOf("."));

        String fileName = System.currentTimeMillis() + suffix;

        String path = session.getServletContext().getRealPath("/static/img/uploads");
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        String relativePath = "/img/uploads" + "/" + fileName;
        //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONObject res = new JSONObject();
        res.put("url", relativePath);
        res.put("success", 1);
        res.put("message", "upload success!");
        System.out.println(res.toString());
        return res;
    }


    @RequestMapping(value = {"write"}, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public void writeTopic(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //判断session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.getWriter().write("提交错误，用户状态为未登录");
        } else {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            System.out.println(content);
            int tag_id = Integer.parseInt(request.getParameter("tag_id"));
            int user_id = user.getId();
            //new a Topic class
            Topic topic = new Topic();
            topic.setTitle(title);
            topic.setContent(content);
            topic.setTabId(tag_id);
            topic.setUserId(user_id);
            topic.setCreateTime(new Date());
            topic.setUpdateTime(new Date());
            if (topicService.addTopic(topic)) {
                response.getWriter().write("发布帖子成功～");
            } else {
                response.getWriter().write("发布失败～");
            }
        }
        response.getWriter().close();
    }

    @RequestMapping(value = {"edit/{tid}"}, method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable int tid) {
        ModelAndView editPage = new ModelAndView("write");
        editPage.addObject("topic", topicService.selectById(tid));
        editPage.addObject("tabs", tabService.getAllTabs());
        return editPage;
    }

    @RequestMapping(value = {"edit/{tid}"}, method = RequestMethod.POST)
    public void editTopic(@PathVariable int tid, HttpServletRequest request, @RequestParam("title") String title, @RequestParam("content")String content, HttpServletResponse response) throws IOException{
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Topic topic = topicService.selectById(tid);
        topic.setContent(content);
        topic.setTitle(title);
        topic.setUpdateTime(new Date());
        if (topicService.updateTopic(topic)) {
            response.getWriter().write("编辑成功");
        } else {
            response.getWriter().write("编辑失败");
        }
        response.getWriter().close();
    }

    @RequestMapping(value = {"tags"})
    public ModelAndView tags(HttpSession session) {
        ModelAndView tagsPage = new ModelAndView("tags");

        //最活跃用户
        List<User> hotestUsers = userService.listHotestUsers();
        //最新用户
        List<User> newUsers = userService.listNewUsers();

        List<Tab> tabs = tabService.getAllTabsWithNum();
        tagsPage.addObject("tabs", tabs);
        tagsPage.addObject("now", "forum");
        tagsPage.addObject("hotUsers",hotestUsers);
        tagsPage.addObject("newUsers",newUsers);
        return tagsPage;
    }

    @RequestMapping("/tab/{en_name}")
    public ModelAndView toTabPage(@PathVariable("en_name")String en_name, HttpSession session){
        Tab tab = tabService.getByTabNameEn(en_name);
        if (tab == null) {
            ModelAndView error = new ModelAndView("error/error");
            error.addObject("title", "404 Not Found");
            error.addObject("msg", "没有找到此分类");
            error.addObject("solve", "请联系管理员");
            return error;
        }
        Integer tabId = tab.getId();

        ModelAndView catePage = new ModelAndView("cate");
        //全部主题
        List<Topic> topics = topicService.listTopicsAndUsersOfTab(tabId);

        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        catePage.addObject("topics", topics);
        catePage.addObject("tab", tab);
        catePage.addObject("hotestTopics", hotestTopics);
        return  catePage;
    }

    @RequestMapping("/t/{id}")
    public ModelAndView toTopic(@PathVariable("id")Integer id, HttpSession session){
        ModelAndView topicPage = new ModelAndView("detail");
        //获取统计信息
        Topic topic = topicService.selectById(id);
        topicService.clickAddOne(topic.getId());
        Tab tab = tabService.getByTabId(topic.getTabId());
        //获取回复
        List<Reply> replies = replyService.getRepliesOfTopic(topic.getId());
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();
        topicPage.addObject("hotestTopics", hotestTopics);
        topicPage.addObject("replies", replies);
        topicPage.addObject("topic", topic);
        topicPage.addObject("tab", tab);
        return  topicPage;
    }

    @RequestMapping(value = "/r/{id}", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String toReply(@PathVariable("id")Integer id,
                        @RequestParam("content") String content,
                        @SessionAttribute("user") User user) {
        //判断session
        Topic topic = topicService.selectById(id);
        if (topic == null) {
            return "提交错误，当前帖子不存在";
        }
        if (user == null) {
            return "提交错误，用户状态为未登录";
        }
        Reply reply = new Reply();
        reply.setTopicId(topic.getId());
        reply.setReplyUserId(user.getId());
        reply.setContent(content);
        reply.setCreateTime(new Date());
        reply.setUpdateTime(new Date());
        if (replyService.addReply(reply)) {
            userService.addCredit(1, user.getId());
            return "回复成功，获得1点积分";
        }
        return "异常错误";
    }
}
