package com.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ssm.model.Information;
import com.ssm.model.dto.PageDto;

import java.util.List;

public interface InformationService {
    PageDto titlelist(int id, int pageNum, int pageSize);
    PageDto titlelist1(int id, int pageNum, int pageSize);
    Information message(int id);
    void update(Information information);
    int insert(Information information);
    List<Information> SingUpTitle(int id);
    List<Information> CollectTitle(int id);
    List<Information> draft(int id);
    Information peoplenum(int id);
    List<Information> recycle(int id);
    int updatepeoplenum(Information information);
    int fabu(int id);
    int delete(int id);
    int huifu(int id);
}
