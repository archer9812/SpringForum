package com.springforum.intercepter;

import com.springforum.domain.Permission;
import com.springforum.domain.Resource;
import com.springforum.domain.User;
import com.springforum.service.AdminService;
import com.springforum.service.impl.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class RoleControllerFilter extends HandlerInterceptorAdapter {

    @Autowired
    public IAdminService adminService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws IOException {
        //获取请求的RUi:去除http:localhost:8080这部分剩下的
        Boolean status = false; // 默认无法访问
        String uri = request.getRequestURI();
        System.out.println(uri);
        //UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
//        if (uri.contains("/login")) {
//            return true;
//        }
        //获取session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            int httpCode = 403;
            response.sendError(httpCode,"没有权限访问");
            return false;
        }
        else {
            //超级管理员放行
            if (user.getRole_id() == 2) {
                status = true;
            } else if (user.getRole_id() > 2){
                List<Resource> resources = adminService.getUserResources(user.getId());
                for (Resource resource: resources
                ) {
                    System.out.println(resource.getResource());
                    if (uri.equals(resource.getResource())) status = true;
                }
            }
        }
        //重置response
//        response.reset();
//        //设置编码格式
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json;charset=UTF-8");
//        PrintWriter pw = response.getWriter();
//        pw.write("无权限访问");
//        pw.flush();
//        pw.close();
        return status;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
