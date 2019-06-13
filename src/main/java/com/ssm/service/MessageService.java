package com.ssm.service;

import com.ssm.model.Message;

import java.util.List;

public interface MessageService {
    int insert(Message message);
    List<Message> messagelist(int id);
}
