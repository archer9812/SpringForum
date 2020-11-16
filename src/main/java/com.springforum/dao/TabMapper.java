package com.springforum.dao;

import com.springforum.domain.Tab;

import java.util.List;

public interface TabMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tab record);

    int insertOne(Tab tab);

    int insertSelective(Tab record);

    Tab selectByPrimaryKey(Integer id);

    Tab getByTabNameEn(String tabName);

    Tab getByTabId(int id);

    int updateByPrimaryKeySelective(Tab record);

    int updateByPrimaryKey(Tab record);

    List<Tab> getAllTabs();

    List<Tab> getAllTabsWithNum();

    int getTabNum();

}