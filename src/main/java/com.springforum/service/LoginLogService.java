package com.springforum.service;

import com.springforum.domain.LoginLog;

import java.util.List;

public interface LoginLogService {
    /**
     * 插入一条登录日志
     */
    boolean addLog(LoginLog log);

    List<LoginLog> getRecentLog(int userId);
}
