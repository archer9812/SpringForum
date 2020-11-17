package com.springforum.service;

import com.springforum.domain.Message;

import java.util.List;

public interface MessageService {
    boolean addMessage(Message message);

    List<Message> getAllMessagesById(int id);

    List<Message> getReplyMessages(int id);
}
