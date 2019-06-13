package com.ssm.service.impl;

import com.ssm.mapper.MessageMapper;
import com.ssm.model.Message;
import com.ssm.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageMapper messageMapper;
    @Override
    public int insert(Message message){
        return messageMapper.insert(message);
    }

    @Override
    public List<Message> messagelist(int id) {
        return messageMapper.messagelist(id);
    }
}
