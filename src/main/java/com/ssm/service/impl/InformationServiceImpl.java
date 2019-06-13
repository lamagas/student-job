package com.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.model.Information;
import com.ssm.model.dto.PageDto;
import com.ssm.model.dto.TitleDto;
import com.ssm.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssm.mapper.InformationMapper;

import java.util.List;

@Service
public class InformationServiceImpl implements InformationService {
    @Autowired
    private InformationMapper informationMapper;
    @Override
    public PageDto titlelist(int id, int pageNum, int pageSize){
        PageHelper.startPage(pageNum,pageSize);//第一个参数的意思为：当前页数，第二个参数的意思为多少条记录
        List<TitleDto> list=informationMapper.titlelist(id);
        int count=informationMapper.countStuTitle(id);
        PageDto page =new PageDto(list,count);//将查询到的数据储存到pageinfo中
        page.setCode(0);
        page.setMsg("success");
        page.setCount(count);
        return page;
    }
    @Override
    public PageDto titlelist1(int id,int pageNum,int pageSize){
        PageHelper.startPage(pageNum,pageSize);//第一个参数的意思为：当前页数，第二个参数的意思为多少条记录
        List<TitleDto> list=informationMapper.titlelist1(id);
        int count=informationMapper.countAdmTitle(id);
        PageDto page = new PageDto(list,count);//将查询到的数据储存到pageinfo中
        page.setCode(0);
        page.setMsg("success");
        page.setCount(count);
        return page;
    }
    @Override
    public Information message(int id){
        return informationMapper.selectByPrimaryKey(id);
    }
    @Override
    public void update(Information information){
         informationMapper.updateByPrimaryKey(information);
    }
    @Override
    public int insert(Information information){return informationMapper.insert(information);}
    @Override
    public List<Information> SingUpTitle(int id){
        return informationMapper.SingUpTitle(id);
    }
    @Override
    public List<Information> CollectTitle(int id){
        return informationMapper.CollectTitle(id);
    }

    @Override
    public List<Information> draft(int id) {
        return informationMapper.draft(id);
    }

    @Override
    public Information peoplenum(int id) {
        return informationMapper.peoplenum(id);
    }

    @Override
    public int updatepeoplenum(Information information) {
        return informationMapper.updatepeoplenum(information);
    }

    @Override
    public int fabu(int id) {
        return informationMapper.fabu(id);
    }

    @Override
    public int delete(int id) {
        return informationMapper.delete(id);
    }

    @Override
    public int huifu(int id) {
        return informationMapper.huifu(id);
    }

    @Override
    public List<Information> recycle(int id) {
        return informationMapper.recycle(id);
    }
}
