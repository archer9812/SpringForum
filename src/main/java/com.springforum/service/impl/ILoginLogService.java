package com.springforum.service.impl;

import com.springforum.dao.LoginLogMapper;
import com.springforum.domain.LoginLog;
import com.springforum.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ILoginLogService implements LoginLogService{
    public final LoginLogMapper loginLogDao;

    public ILoginLogService(LoginLogMapper loginLogDao) {
        this.loginLogDao = loginLogDao;
    }

    @Override
    public boolean addLog(LoginLog log) {
        if (loginLogDao.insert(log) > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<LoginLog> getRecentLog(int userId) {
        return loginLogDao.selectRecent(userId);
    }
}
