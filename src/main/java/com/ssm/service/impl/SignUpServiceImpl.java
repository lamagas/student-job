package com.ssm.service.impl;

import com.ssm.mapper.CollectMapper;
import com.ssm.mapper.InformationMapper;
import com.ssm.mapper.SignUpMapper;
import com.ssm.model.Collect;
import com.ssm.model.Information;
import com.ssm.model.SignUp;
import com.ssm.service.SignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class SignUpServiceImpl implements SignUpService {
    @Autowired
    private SignUpMapper signUpMapper;
    @Autowired
    private CollectMapper collectMapper;
    @Autowired
    private InformationMapper informationMapper;
    @Override
    public int insert(SignUp signUp){
        if(signUpMapper.issignselect(signUp)==null){
            signUp.setStatus(0);
            return signUpMapper.insert(signUp);
        }
        return 0;
    }
    @Override
    public int insert(Collect collect){
        if(collectMapper.iscollselect(collect)==null){
            return collectMapper.insertCollSelective(collect);
        }
        return 0;
    }

    /**
     * 审核
     * @param inforId
     * @param stuid
     * @param sc signupId数组
     * @return
     */
    @Override
    public boolean audit(int inforId,int stuid, String sc) {
        String[] signup=sc.split(",");
        if(signup!=null&&signup.length>0){
            signUpMapper.upadteById(signup);
            int delnum=signUpMapper.upadteByInforid(inforId);
            if (delnum>0) {
                Information information=new Information();
                information.setNowpeople(-delnum);
                information.setInforid(inforId);
                information.setDraft(0);
                informationMapper.updatepeoplenum(information);
            }
            return true;
        }
        return false;
    }

}
