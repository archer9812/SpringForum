package com.springforum.dao;

import com.springforum.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    //用户注册
    int addUser(User user);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);


    User selectByUsername(String username);

    User selectByEmail(String email);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    //多参数注解
    int addCredit(@Param("points") Integer points, @Param("id")Integer id);

    //查询username是否存在
    int existUsername(String username);

    //查询用户数
    int getUserCount();

    List<User> getAllUsers();

    List<User> listHotestUsers();

    List<User> listNewUsers();

    int deleteByPrimaryKey(int id);
}
