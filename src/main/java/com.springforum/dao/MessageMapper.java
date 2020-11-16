package com.springforum.dao;

import com.springforum.domain.Message;

import java.util.List;

public interface MessageMapper {
    int insert(Message message);

    List<Message> selectReplyById(int replyUserId);

    List<Message> select(int userId);
}
