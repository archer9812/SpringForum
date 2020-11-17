package com.springforum.service.impl;

import com.springforum.dao.TabMapper;
import com.springforum.domain.Tab;
import com.springforum.service.TabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ITabService implements TabService {

    public final TabMapper tabDao;

    public ITabService(TabMapper tabDao) {
        this.tabDao = tabDao;
    }

    @Override
    public List<Tab> getAllTabs() {
        return tabDao.getAllTabs();
    }

    @Override
    public Tab getByTabNameEn(String tabName) {
        return tabDao.getByTabNameEn(tabName);
    }

    @Override
    public Tab getByTabId(int id) {
        return tabDao.getByTabId(id);
    }

    @Override
    public List<Tab> getAllTabsWithNum() { return tabDao.getAllTabsWithNum(); }

    @Override
    public int getTabNum() {
        return tabDao.getTabNum();
    }

    @Override
    public boolean addTab(Tab tab) {
        return tabDao.insertOne(tab) > 0;
    }

    @Override
    public boolean delete(int id) {
        return tabDao.deleteByPrimaryKey(id) > 0;
    }

}
