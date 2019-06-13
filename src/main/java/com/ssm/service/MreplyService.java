package com.ssm.service;

import com.ssm.model.Mreply;

import java.util.List;

public interface MreplyService {
    List<Mreply> replylist(int id);
    int insert(Mreply mreply);
}
