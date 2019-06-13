package com.ssm.service;

import com.ssm.model.Collect;
import com.ssm.model.SignUp;

public interface SignUpService {
    int insert(SignUp signUp);
    int insert(Collect collect);
}
