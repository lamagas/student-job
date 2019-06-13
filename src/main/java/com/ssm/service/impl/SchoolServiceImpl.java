package com.ssm.service.impl;

import com.ssm.mapper.SchoolMapper;
import com.ssm.model.School;
import com.ssm.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    private SchoolMapper schoolMapper;
    @Override
    public List<School> schoollist(){
        return schoolMapper.list();
    }
}
