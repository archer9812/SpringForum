package com.springforum.service.impl;

import com.springforum.dao.MessageMapper;
import com.springforum.domain.Message;
import com.springforum.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IMessageService implements MessageService {
    public final MessageMapper messageDao;

    public IMessageService(MessageMapper messageDao) {
        this.messageDao = messageDao;
    }

    @Override
    public boolean addMessage(Message message) {
        return messageDao.insert(message)>0;
    }

    @Override
    public List<Message> getAllMessagesById(int id) {
        return messageDao.select(id);
    }

    @Override
    public List<Message> getReplyMessages(int id) {
        return messageDao.selectReplyById(id);
    }
}
