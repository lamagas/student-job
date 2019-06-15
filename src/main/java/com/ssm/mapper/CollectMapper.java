package com.ssm.mapper;

import com.ssm.model.Collect;

public interface CollectMapper {
    int insertCollSelective(Collect record);
    Collect iscollselect(Collect collect);
}
