package com.ssm.service.impl;

import com.ssm.mapper.CollectMapper;
import com.ssm.mapper.SignUpMapper;
import com.ssm.model.Collect;
import com.ssm.model.SignUp;
import com.ssm.service.SignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SignUpServiceImpl implements SignUpService {
    @Autowired
    private SignUpMapper signUpMapper;
    @Autowired
    private CollectMapper collectMapper;
    @Override
    public int insert(SignUp signUp){
        return signUpMapper.insert(signUp);
    }
    @Override
    public int insert(Collect collect){
        return  collectMapper.insert(collect);
    }
}
