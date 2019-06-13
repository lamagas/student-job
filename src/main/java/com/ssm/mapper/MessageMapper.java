package com.ssm.mapper;

import com.ssm.model.Message;

import java.util.List;

public interface MessageMapper {
    int insert(Message message);
    List<Message> messagelist(int id);
}
