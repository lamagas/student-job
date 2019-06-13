package com.ssm.mapper;

import com.ssm.model.Mreply;

import java.util.List;

public interface MreplyMapper {
    int insert(Mreply mreply);
    List<Mreply> replylist(int id);
}
