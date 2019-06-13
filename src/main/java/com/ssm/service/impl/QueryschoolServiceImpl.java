package com.ssm.service.impl;

import com.ssm.mapper.QueryschoolMapper;
import com.ssm.model.Queryschool;
import com.ssm.service.QueryschoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QueryschoolServiceImpl implements QueryschoolService {
    @Autowired
    private QueryschoolMapper queryschoolMapper;
    @Override
    public void insert(List<Queryschool> queryschools){
        queryschoolMapper.insert(queryschools);
    }
}
