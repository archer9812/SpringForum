package com.hasaki.service;

import com.hasaki.domain.Message;

import java.util.List;

public interface MessageService {
    boolean addMessage(Message message);

    List<Message> getAllMessagesById(int id);

    List<Message> getReplyMessages(int id);
}
