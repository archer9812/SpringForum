package com.springforum.service;

import com.springforum.domain.Tab;

import java.util.List;

public interface TabService {
    List<Tab> getAllTabs();

    Tab getByTabNameEn(String tabName);

    Tab getByTabId(int id);

    List<Tab> getAllTabsWithNum();

    int getTabNum();

    boolean addTab(Tab tab);

    boolean delete(int id);

}
