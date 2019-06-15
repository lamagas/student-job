package com.ssm.service;

import com.ssm.model.Collect;
import com.ssm.model.SignUp;

public interface SignUpService {
    int insert(SignUp signUp);
    int insert(Collect collect);

    //审核
    boolean audit(int id,int stuid,String sc);
}
