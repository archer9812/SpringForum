package com.springforum.service;

import com.springforum.domain.Reply;

import java.util.List;

public interface ReplyService {
    List<Reply> getRepliesOfTopic(Integer topicId);

    List<Reply> newestReply();

    boolean addReply(Reply reply);

    int repliesNum(Integer topicId);

    boolean deleteByReplyUserId(int id);

    boolean deleteByTopicId(int id);

    List<Reply> getAllReply();

    boolean deleteByPrimaryKey(Long id);

    int getReplyNum();
}
