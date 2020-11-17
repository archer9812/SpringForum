package com.springforum.service.impl;

import com.springforum.dao.ReplyMapper;
import com.springforum.domain.Reply;
import com.springforum.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IReplyService implements ReplyService {

    @Autowired
    public ReplyMapper replyDao;

    @Override
    public List<Reply> getRepliesOfTopic(Integer topicId) {
        return replyDao.getRepliesOfTopic(topicId);
    }

    @Override
    public boolean addReply(Reply reply) {
        return replyDao.insert(reply) > 0;
    }

    @Override
    public int repliesNum(Integer topicId) {
        return replyDao.getRepliesNum(topicId);
    }

    @Override
    public List<Reply> newestReply() {
        return replyDao.getNewestReply();
    }

    @Override
    public boolean deleteByReplyUserId(int id) {
        return replyDao.deleteByReplyUserId(id) >= 0;
    }

    @Override
    public boolean deleteByTopicId(int id) {
        return replyDao.deleteByTopicId(id) >= 0;
    }


    @Override
    public List<Reply> getAllReply() {
        return replyDao.getAllReply();
    }

    @Override
    public boolean deleteByPrimaryKey(Long id) {
        return replyDao.deleteByPrimaryKey(id) > 0;
    }

    @Override
    public int getReplyNum() {
        return replyDao.getReplyNum();
    }

}