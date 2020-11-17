package com.springforum.service;

import com.springforum.domain.User;

import java.util.List;

public interface UserService {
        /**
         * 用户注册
         */
        public boolean addUser(User user);

        /**
         * 登录验证
         */
        public int login(String username, String password);

        /**
         * 添加积分
         */
        public boolean addCredit(Integer points, Integer id);

        /**
         * 检查username是否存在
         * @param username
         * @return
         */
        public boolean existUsername(String username);

        /**
         * 获取用户信息
         * @param username
         * @return
         */
        public User getUserByUsername(String username);
        /**
         * 获取用户信息
         * @param id
         * @return
         */
        public User getUserById(Integer id);

        /**
         * 获取用户数
         */
        public int getUserCount();

        public boolean updateUser(User user);

        public List<User> getAllUsers();

        public List<User> listHotestUsers();

        public List<User> listNewUsers();

        public boolean deleteByPrimaryKey(int id);

        public User getUserByEmail(String email);

        public boolean updateUserByEmail(String email, String password);
}
