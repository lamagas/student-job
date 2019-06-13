package com.ssm.service.impl;

import com.ssm.mapper.MreplyMapper;
import com.ssm.model.Mreply;
import com.ssm.service.MreplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MreplyServiceImpl implements MreplyService {
    @Autowired
    MreplyMapper mreplyMapper;

    @Override
    public List<Mreply> replylist(int id) {
        return mreplyMapper.replylist(id);
    }

    @Override
    public int insert(Mreply mreply) {
        return mreplyMapper.insert(mreply);
    }
}
