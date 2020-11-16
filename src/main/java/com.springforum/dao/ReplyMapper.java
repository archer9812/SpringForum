package com.springforum.dao;

import com.springforum.domain.Reply;

import java.util.List;

public interface ReplyMapper {
    int deleteByPrimaryKey(Long id);

    int deleteByTopicId(int id);

    int insert(Reply record);

    int insertSelective(Reply record);

    int getReplyNum();

    Reply selectByPrimaryKey(Long id);

    List<Reply> getRepliesOfTopic(Integer topicId);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKeyWithBLOBs(Reply record);

    int updateByPrimaryKey(Reply record);

    int getRepliesNum(Integer topicId);

    List<Reply> getNewestReply();

    int deleteByReplyUserId(int id);

    List<Reply> getAllReply();

}